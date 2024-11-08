package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "7hxRsRaOEDEEZwn8k7Kg9ow0LtY4l2hdWtOyoogNAb4="
								"upload additional file": "jpJGvo4TmnfAANFgqJRNHObEHQQUOngYFr0U36xT+hs="
								"a hidden file":          "DVM7/Vf38ZfaOCfuMouewjqRGVWurgYiMnDf0YTyu+w="
							}
							code: {
								"a code example": "gFaLlikhzZjorH7URTUqv7eTzBQuWrMBgZpHoZJYaAE="
							}
							multi_step: {
								hash:       "BFGS2J3J341ITLRBOSKP6L8GF2965MPBP73T1PO3P1KCQPNVLKV0===="
								scriptHash: "1K5IR4L5KQL27R6E7ANJ8AGBNEVTHEJKDL4DS7JRTOBCVG32LFNG===="
								steps: [{
									doc:      ""
									cmd:      "cue eval"
									exitCode: 0
									output: """
											y: 2
											x: 1

											"""
								}, {
									doc:      ""
									cmd:      "cue eval >result.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat *.txt"
									exitCode: 0
									output: """
											y: 2
											z: 3
											x: 1

											"""
								}, {
									doc:      ""
									cmd:      "grep bar foo.txt"
									exitCode: 0
									output: """
											bar

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
