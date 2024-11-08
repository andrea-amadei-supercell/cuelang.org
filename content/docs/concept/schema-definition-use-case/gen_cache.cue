package site
{
	content: {
		docs: {
			concept: {
				"schema-definition-use-case": {
					page: {
						cache: {
							upload: {
								"api-cue": "SdofFgKRAsNAThBZqRPbcuM7E0W7tIlBAUtwRJccXDQ="
								"api-go":  "M/3ocyxfDEMQVaaJDVGBA4RqFlPNpz1ObzL5UWyT/R0="
							}
							code: {
								"openapi-comparison": "Erw6CF8GpelUBQ5XixBkQkcaAzsgMnDInGhPKl2he74="
							}
							multi_step: {
								hash:       "2ALDGO5ELL61MOPT2JQRPSHBR193LJ3D7OOB3G6HSS36JEIG62DG===="
								scriptHash: "J2F15TN9B1JA1LIP76U38JP57U0IVIVH49KDB11QBFI2KE4VKCF0===="
								steps: [{
									doc:      ""
									cmd:      "export GOMODCACHE=/caches/gomodcache"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export GOCACHE=/caches/gobuild"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "go mod init cue.example"
									exitCode: 0
									output: """
											go: creating new go.mod: module cue.example
											go: to add module requirements and sums:
											\tgo mod tidy

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go get cuelang.org/go@v0.11.0-alpha.5"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go mod tidy"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "go run ."
									exitCode: 0
									output: """
											V2 is backwards compatible with V1: true
											V3 is backwards compatible with V2: false

											"""
								}, {
									doc:      ""
									cmd:      "go vet ./..."
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.5.1 ./..."
									exitCode: 0
									output: """
											...

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
