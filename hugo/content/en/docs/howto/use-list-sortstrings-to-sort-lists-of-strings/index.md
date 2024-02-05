---
title: Using "list.SortStrings" to sort lists of strings
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in function
[`list.SortStrings`](https://pkg.go.dev/cuelang.org/go/pkg/list#SortStrings)
to sort lists of strings alphabetically.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue"  area="left" >}}
package example

import "list"

unsorted: ["B", "C", "A"]
sorted: list.SortStrings(unsorted)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="right" >}}
$ cue eval
unsorted: ["B", "C", "A"]
sorted: ["A", "B", "C"]
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- `list.SortStrings` only sorts lists of strings alphabetically - use
  `list.Sort`
  [to apply any other sort order]({{< relref
    "../use-list-sort-to-sort-lists"
  >}})
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package