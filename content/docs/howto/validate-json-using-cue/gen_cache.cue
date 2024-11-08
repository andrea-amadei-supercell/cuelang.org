package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "7FY05y3ay0Vq9LSCRP+IsbTm9NdbkPSab6Zz2a+EYlA="
								"x.cue":        "EDhhihZdMDJZbMx7M5BmHW3Lbcjfky7IfJ6TutfoPMQ="
								"x.json v2":    "8RHNDnqPqk4f9dAgf7+qvooWKfQfIuZze3F9s+Ve1/U="
								"fixed x.json": "m4uKdphaaBh9o/S3Gp001U971h/gKZwsdc0Q9CpvCH8="
							}
							multi_step: {
								hash:       "NFQ2CI2BEH8N9MONH3MTEE935AM1S2AVVADG5RK7RHRKFTRFGQ1G===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
