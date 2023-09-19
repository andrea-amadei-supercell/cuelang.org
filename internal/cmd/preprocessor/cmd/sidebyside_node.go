// Copyright 2023 The CUE Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package cmd

import (
	"bytes"
	"fmt"
	"html/template"
	"os"
	"path/filepath"
	"strings"

	"golang.org/x/tools/txtar"
)

const (
	fnSidebyside = "sidebyside"

	goldenExt = ".golden"
)

type sidebysideNode struct {
	txtarNode
}

func (s *sidebysideNode) nodeType() string {
	return fnSidebyside
}

var _ runnableNode = (*sidebysideNode)(nil)

type sidebysideNodeRunContext struct {
	*txtarRunContext
}

func (s *sidebysideNode) run() runnable {
	return &sidebysideNodeRunContext{
		txtarRunContext: &txtarRunContext{
			txtarNode:        s.txtarNode,
			executionContext: s.executionContext,
			bufferedErrorContext: &errorContextBuffer{
				executionContext: s.executionContext,
			},
		},
	}
}

func (s *sidebysideNodeRunContext) run() (err error) {
	defer recoverFatalError(&err)

	// Skip entirely if the #norun tag is present
	if _, ok, _ := s.tag(tagNorun, ""); ok {
		return nil
	}

	if err := s.formatFiles(); err != nil {
		return errorIfInError(s)
	}

	// Is there a script to run? If there is no effective script, i.e. non blank
	// non comment lines, we might need to fill one in when running. There are
	// shorthand versions of sidebyside nodes which don't have a script and yet
	// we want to run a predefined set of commands and write the files back.
	effectiveArchive := *s.sourceArchive
	s.effectiveArchive = &effectiveArchive

	var ok bool
	if !s.analysis.hasEffectiveComment {
		effectiveArchive.Comment, ok = s.buildEffectiveScript(&effectiveArchive)
		if !ok {
			s.logf("%v: failed to build effective comment", s)
			return
		}
	}

	// Now that the archive is updated with valid formatted files, run the
	// script
	td, err := s.tempDir("")
	if err != nil {
		s.fatalf("%v: failed to create temp dir: %v", s, err)
	}
	targetFile := filepath.Join(td, "script.txtar")
	containerFile := "/tmp/script.txtar"
	if err := os.WriteFile(targetFile, txtar.Format(s.effectiveArchive), 0666); err != nil {
		s.fatalf("%v: failed to write script: %v", s, err)
	}
	ts := s.dockerCmd(
		// We need to mount the script
		[]string{fmt.Sprintf("-v=%s:%s", targetFile, containerFile)},
		"testscript",
		fmt.Sprintf("-u=%v", s.updateGoldenFiles),
		containerFile,
	)
	s.debugf(s.debugGeneral, "%v: running %v\n%s", s, ts, tabIndent(txtar.Format(&effectiveArchive)))

	if byts, err := ts.CombinedOutput(); err != nil {
		s.fatalf("%v: failed to run %v: %v\n%s", s, ts, err, tabIndent(byts))
	}

	// Read the archive back and assign to indices of the effective archive
	resArchive, err := txtar.ParseFile(targetFile)
	if err != nil {
		s.fatalf("%v: failed to read resulting archvie %s: %v", s, targetFile, err)
	}
	for i := range effectiveArchive.Files {
		effectiveArchive.Files[i] = resArchive.Files[i]
	}

	return nil
}

func (s *sidebysideNodeRunContext) buildEffectiveScript(ar *txtar.Archive) ([]byte, bool) {
	// Try to build up a real script. Logic as follows
	files := s.analysis.fileNames

	// Pattern one. 2 files, basenames in and out. The in extension
	// tells us what to expect as input to cmd/cue, the out extension
	// tells us what to generate
	if len(files) == 2 && files[0].Basename == "in" && files[1].Basename == "out" {
		in, out := files[0], files[1]
		switch in.Ext {
		case "cue", "json", "yaml":
		default:
			s.fatalf("%v: unknown input extension %q on %s", s, in.Ext, in.Filepath)
		}
		switch out.Ext {
		case "cue", "json", "yaml":
		case "err":
			// Special case where we just want the output
		default:
			s.fatalf("%v: unknown output extension %q on %s", s, out.Ext, out.Filepath)
		}
		type args struct {
			In  filenameAnalysis
			Out filenameAnalysis
		}
		cmd := s.templateScript(`
		{{if eq .Out.Ext "err"}}! {{end}}exec cue {{if and (eq .In.Ext "cue") (eq .Out.Ext "cue")}}eval{{else}}export{{end}} {{if ne .Out.Ext "err"}}--out {{.Out.Ext}}{{end}} {{.In.Ext}}: {{.In.Filepath}}
		cmp {{if eq .Out.Ext "err"}}stderr{{else}}stdout{{end}} {{.Out.Filepath}}
		`, args{In: in, Out: out})
		return []byte(cmd), true
	}

	return nil, false
}

func (s sidebysideNodeRunContext) templateScript(tmpl string, arg any) []byte {
	// Normalise multiline string for ease of writing in caller
	lines := strings.Split(tmpl, "\n")
	for i := range lines {
		lines[i] = strings.TrimSpace(lines[i])
	}
	tmpl = strings.Join(lines, "\n")
	if tmpl[len(tmpl)-1] != '\n' {
		tmpl += "\n"
	}
	t, err := template.New("test").Parse(tmpl)
	if err != nil {
		s.fatalf("%v: failed to parse template: %v\n%s", s, err, tabIndent([]byte(tmpl)))
	}
	var res bytes.Buffer
	if err := t.Execute(&res, arg); err != nil {
		s.fatalf("%v: failed to execute template: %v\n%s", s, err, tabIndent([]byte(tmpl)))
	}
	return res.Bytes()
}

func tabIndent(b []byte) []byte {
	if len(b) == 0 {
		return b
	}
	return append([]byte("\t"), bytes.ReplaceAll(b, []byte("\n"), []byte("\n\t"))...)
}

func (s *sidebysideNode) writeTransformTo(b *bytes.Buffer) error {
	p := bufPrintf(b)
	var locations []codeTabLocation
	switch l := len(s.effectiveArchive.Files); l {
	case 2:
		// real side-by-side.
		locations = []codeTabLocation{codeTabTopLeft, codeTabTopRight}
	case 3:
		locations = []codeTabLocation{codeTabTopLeft, codeTabBottomLeft, codeTabTopRight}
	default:
		var b bytes.Buffer
		s.writeSourceTo(&b)
		return s.errorf("do not know how to handle %d txtar files: \n%s", l, b.Bytes())
	}
	analyses := s.analysis.fileNames
	// TODO probably extract this code into some sort of strategy at some point
	tabs := make([]tabProps, len(analyses))
	if len(analyses) == 2 && analyses[0].Basename == "in" && analyses[1].Basename == "out" {
		in, out := analyses[0], analyses[1]
		tabs[0] = tabProps{
			Name:     strings.ToUpper(in.Ext),
			Language: in.Language,
		}
		tabs[1] = tabProps{
			Name:     strings.ToUpper(out.Ext),
			Language: out.Language,
			Type:     "terminal",
		}
	} else {
		for i, a := range analyses {
			tp := &tabs[i]
			tp.Name = a.Filepath
			tp.Language = a.Language
			if a.IsOut {
				tp.Name = "TERMINAL"
				tp.Type = "terminal"
			}

		}
	}
	// TODO tidy up templating etc
	p("{{< code-tabs >}}\n")
	for i, f := range s.effectiveArchive.Files {
		t := tabs[i]
		var typ string
		if t.Type != "" {
			typ = fmt.Sprintf("type=%q", t.Type)
		}
		p("{{< code-tab name=%q language=%q %v area=%q >}}\n", t.Name, t.Language, typ, locations[i])
		p("%s", f.Data)
		p("{{< /code-tab >}}\n")
	}
	p("{{< /code-tabs >}}")
	return nil
}