package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "cKOAakywnCqs02WET2mU7+Im/jWDlxbCKniBaT9YvVg="
								"initial x.cue":  "aI62bmFug6bdanr8tEcNIr37Q0Qlh9QT0tr8/75saSU="
								"another person": "1rbQUJRuyXYPcPI0+gGY6IllneZlRmQcC60p/r/RiLw="
								"fixed yaml":     "OxiAOPqAxVhvePu64kUA4jJkM75va7hZke+0rWHFEVw="
							}
							multi_step: {
								hash:       "L0J33FU4S5F95IQTGF4Q26G2G4MQ5Q3U53QB687993GDOJ8L7CT0===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}]
							}
						}
					}
				}
			}
		}
	}
}
