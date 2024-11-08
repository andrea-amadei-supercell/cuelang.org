package site
{
	content: {
		docs: {
			concept: {
				faq: {
					"removing-list-arithmetic-operators-v0.11": {
						page: {
							cache: {
								upload: {
									removed:                 "02f7Yy///ySRLcmTjZZ8gEcvxdA8s+IefAtBrLIuiyA="
									changes:                 "jMc3Hu1r7rlCUuMYEJsXTWCgbXq1J+52a5pdN/qcQ4I="
									"changes: updated file": "K9J84bCs2px54tCCb4BUW/XovzziGKAGMDAEdlwezjI="
									"references: broken":    "M720tsBsisA75pOPqpFpwh9y7ZC/Bh13Uo4jY0tBamA="
									"references: fixed":     "ubinmRZ/qaJ14benrfQNvhtw4xWpUT5UxX89oPqz9i0="
								}
								multi_step: {
									hash:       "8QIMO9GA49NQH0U2V93DGMF23OV9PR910BU12TO06A26H675NB40===="
									scriptHash: "NH43UHAVPJJ6HLG0BN15H409KTJU5NDFEOLMGM7OT1B15H4CUTA0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0-alpha.5:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet list-arithmetic.cue"
										exitCode: 1
										output: """
												A: Multiplication of lists is superseded by list.Repeat; see https://cuelang.org/e/v0.11-list-arithmetic:
												    ./list-arithmetic.cue:1:4
												B: Addition of lists is superseded by list.Concat; see https://cuelang.org/e/v0.11-list-arithmetic:
												    ./list-arithmetic.cue:2:4

												"""
									}, {
										doc:      ""
										cmd:      "cue fix changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv changes-required.cue .changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff changes-required.cue .changes-required.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet references.cue"
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
