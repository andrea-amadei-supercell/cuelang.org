package site
{
	content: {
		docs: {
			concept: {
				"using-the-cue-export-command": {
					output: {
						page: {
							cache: {
								code: {
									"default output":             "TQ08rutp6yWTZLyabgQwApkkcPLBzraeF947SUR/ClI="
									"stdout yaml":                "2PJBIF0ba4EZh+HLiiR7W9TXXl35/Vv4Nb1VAnu676Q="
									"yaml:-":                     "kRLxNYUmJy4i/y9C6h9QeomfdXOQMEospKTq7Lajxs0="
									"--out cue":                  "kTkz9jaDyqVqSJ2+NaxueNj4LhKDEG3n+cwJJItw6Eg="
									"--out cue no hidden fields": "pJFVwrl7d10vgcq0NEvnxooIbuXasu6TnxfGu7sehAw="
									"--out cue --package foo":    "ceihy5UVl+rm/Js+vGMse+hLzb2YNg2cQPFM36pNWek="
									"--escape":                   "q7jcptptulGBHcsXAF8i5zjYgnUCWhhOEjgvt0v+OG4="
								}
								upload: {
									"--outfile data.yml":            "RntdqPILk2c4P2fdNdmWxfyx6+0TSQ4k//t7wehGx1s="
									"--outfile data.txt":            "V6yJQXUZE5QjUeAJKlmred0jhk8o4sU84WUkejlj9gA="
									"--outfile datafile --out json": "L+K1TtdftXh6doeX2sI06UHK7S9mjUYTKRd3VQtNqH4="
									"--outfile json:datafile":       "gT23IErFuW3nyihXmj9wgM9tXcsVr/jcyln4uu0QelM="
								}
								multi_step: {
									hash:       "B0F0OBFP4A356BAC0074KQKI7L4MTAOI7HJPDV3RO7KB6762KF2G===="
									scriptHash: "TVTCOHK1K6IF54PI4CB62FSIBJMCMB1BAOO6SNBVQ897AIDDN7UG===="
									steps: [{
										doc:      ""
										cmd:      "cue export --outfile data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.yml"
										exitCode: 0
										output: """
												data:
												  value: A string
												  list:
												    - 1
												    - 2

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile data.txt -e data.value"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.txt"
										exitCode: 0
										output: """
												A string

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.txt"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile datafile --out json"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile json:datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
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
}
