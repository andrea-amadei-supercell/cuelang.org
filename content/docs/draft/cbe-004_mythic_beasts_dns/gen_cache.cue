package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "X/jkMAJgLA2f+jKmbXfnDyigTK0TnyMwKSeNhSohxa8="
								"2": "P4ACtWFzsU8z2ehH2ai0f1byqKO9/SlLp869h8iO/Iw="
								"3": "N4gbuXvEQRfoY9u8HWmv7jMBGuprEqKCEi0zT3JQ0V0="
								"4": "uD/lbOJOncXQZX3F0W6ZVIX5k33bSmsbECqfooK3I/c="
								"5": "j+U8O34ROBXM895itPYkgYN6WrDWd7gZz7VAGJnfyYw="
								"6": "VvyHvG/hQIM9a8M/SyMjSoyqBnLhpWK3GmY7UR0Rrxc="
							}
							multi_step: {
								hash:       "KRAM1IHCOJNP3E0J2ET82RHJI3TCRHO7BUK6F8J40N51F3A0RJJ0===="
								scriptHash: "8T5T0B0K6S3NGIIOLM9255HN4DPN78BO9MK4UGDNESVR2HJLV9MG===="
								steps: [{
									doc: """
											# Actual command in CUE-By-Example guide:
											# cue cmd dump
											"""
									cmd:      "cue cmd dump | head -20 >6.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff 6.expected.txt 6.actual.txt"
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
