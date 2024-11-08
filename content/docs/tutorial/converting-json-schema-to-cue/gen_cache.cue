package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "NYh/0lM9p4AFiO8Ob7yWVGBP+0EE1+Rhgvq2FtKlG1g="
								"schema.cue":         "EByYavSwld/PKe6CCtzRy+VllT29qWP+7W+n5kJUwUI="
								"split_pea.yml":      "29yCEoCvncTFLvnLfWeJn6hOMBl+IEdexmMjt2FEHqo="
								"pomodoro.yml":       "agsHFWDD+KWVb0xJBwKdYX/3wMrjWnhI6ftXs/HDJOk="
								"pomodoro.yml fixed": "gT4ihM3ux0mZ6z6QizFDqc01CKSDYuM3yBORXL6cNaM="
							}
							multi_step: {
								hash:       "M1NK0FODVA43UHBIDK1DLP512NIHBOK5P21644M3IV1FT8DMKL3G===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.0-alpha.5
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cp schema.cue .schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -u .schema.cue schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:10:17
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
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
