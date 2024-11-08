package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "ee1GOMAe/G2is3SARjclIexfKE4kb4ZRwz0AYB0WjP4="
								"data: bryn (broken)":           "tByVx34wytU+0MPGjoCRx3l86wYlL8Hy+YcXFNazaak="
								"data: charlie":                 "9gsTfrCOTGex5usVWJyQr9ipMTx+YLHb9qKCr6mTDDk="
								"schema: CUE":                   "kouj7Iarlx3scXXvv/KG4kbKkglhJZOfUAowcXZku8w="
								"data: bryn (fixed)":            "Mrjm6VGsmh/v+ltFTlAYzH//nPTbu3RZsceLN4V5Qy8="
								"data: alex (reminder)":         "BzRbkfSZhaVWXIqqEgGbXJP6NeVJxpCzgVCc0v91taY="
								"data: bryn (reminder)":         "NMHstsG6dWAC0H8+3kzhSOU1NXJn7Y2PS90oOCo9pWQ="
								"data: charlie (reminder)":      "ZTmA1QDkOFJMm956za72RLTrMaKrv510PGJP2sgBLoE="
								"schema: CUE (reminder)":        "p9kot6ZleCBRih7wFYKdjiwg1eA+gl0XlfXl/pNa2v0="
								"policy: CUE (too restrictive)": "JnBFLIUQPpAdvwEzQTQ5XgDu2DRMdwOqF/bWMq9jz1g="
								"policy: CUE (correct)":         "tbnhiQ1ii5Nm22xMl213hZwn4cC8p8rWDMr+Yw2GZ3o="
								"schema.proto":                  "bVltuMgZWpm63uw0ZC7oIZXO31hDup8WCUs9WRfR98E="
								"schema.json":                   "Z/7EyAlgWfLao0Ed5+Slhg0jAw5aQe81VrZflBOipEQ="
								"policy.cue":                    "gmkch053Rv/Er87+u1fbbbmZNuPOS+mkp8v0IoRSuqM="
								"data.yml (broken)":             "CR2VymIhVguDsAtzXq5dHSC69pO+21qMBJrj0HyqxCk="
								"data.yml (fixed)":              "sVsq5J8yKO0fkRq6XFK4iaZNMy+eHNS4rq9VGlJax2U="
							}
							code: {
								constraints: "xXmbb5c/gqSN9N7CB1e8lWD2Z5Z9zt6JtsQgufti6Vc="
								definition:  "iG3uxYvSjCG1bWuJ/gDPBSOwRmu6gb5URJH4v/AkSrs="
							}
							multi_step: {
								hash:       "68V9FUPBRJ4A98RORFJRD3S9I8FTH31195BQQ24PMR3351TK2JJG===="
								scriptHash: "5IRU0HUMAKN4O1TE41F2439MMECK8AS890TU89R3REV16HVJRUN0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											height: conflicting values "2" and int (mismatched types string and int):
											    ./bryn.json:4:15
											    ./schema.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											type: 2 errors in empty disjunction:
											type: conflicting values "cat" and "goldfish":
											    ./bryn.json:3:13
											    ./policy.cue:3:18
											type: conflicting values "dog" and "goldfish":
											    ./bryn.json:3:13
											    ./policy.cue:3:10
											height: invalid value 2 (out of bound >10):
											    ./policy.cue:4:10
											    ./bryn.json:4:15

											"""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm -f *.cue *.yml *.yaml *.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
									exitCode: 1
									output: """
											aBool: conflicting values "this is not a boolean value" and bool (mismatched types string and bool):
											    ./data.yml:4:8
											    ./schema.proto:5:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (does not satisfy strings.Contains("25")):
											    ./policy.cue:6:12
											    ./data.yml:1:10
											    ./policy.cue:6:29
											    ./schema.json:9:21
											    ./schema.proto:2:3
											anInt: invalid value 5 (out of bound >99.0):
											    ./policy.cue:9:10
											    ./data.yml:2:8
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:21
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3

											"""
								}, {
									doc:      ""
									cmd:      "cue vet policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
