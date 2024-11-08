package site
{
	content: {
		docs: {
			concept: {
				"using-the-cue-export-command": {
					inputs: {
						page: {
							cache: {
								code: {
									"cue export # package x1":                                   "fUVZhHiRTb7J8K2FH5khMazWb550IiOUk38TVxyv2x0="
									"! cue export # package x2":                                 "MBYYtygfgSi8qCSHrhbs1uLLw8j4FoC2t59GN1ebRVY="
									"cue export . # package x1":                                 "XIPZrj9FpgMm5P4/DbrqRAtnCrW9bKfdmWTdNzeBN30="
									"cue export .:one":                                          "jFK4S6+C1vU3IraeavNP77JqoXGYPA3wrK/CgWRHcLs="
									"cue export data.yaml":                                      "00m4c5TRGXNErifP4wR2ornwVX8VxAFkpltImyYw9Z8="
									"cue export yaml: some.yaml.data":                           "W5jS7ZTDOPCgwQHv8WMfu96pNrhfv2zDFRTH75ln2xQ="
									"cue export .:one .:two .:three":                            "VEJwjSmaGPtvIWG/SpL86ySDt8OJYkNeqN1FopeXKY8="
									"cue export package + package file + data + packageless":    "T069zeb0aToCVoMOESOl9mopD5cr3POID33D+bM8XlA="
									"package file + data":                                       "V+SwcSUSLL8w8cTvs9X+OTXFfA5r6bV7l3x326PINa4="
									"cue export package + 2x package file + data + packageless": "DqLLtNSls3rB1kD2Lf+3gFsRC0e+H833s1lCuQ5yO60="
									"data file inputs":                                          "iEzK8GOH0f6cshxT0pCk4x3TEIEg1YR9TU/7KaAL/IU="
									"data file inputs failure":                                  "3Ib4wqcKCALLpvJpRxn2Uhwy1l32w+su13p+1rYOywg="
									"constraint file validating data":                           "oiuOKN6oVzSJzz5T/cU6LGrDAtJa3Q/sUGjbSIn4di8="
									"constraint file exported as data":                          "IJnMc7MWfSFXcvD046EZXZSM4Iss+PCiLDRSEmcuFcg="
									"-l static single":                                          "R/DlFGFk8apgyN8g9CyjD3EEFn8sL0BtVL2h77QmckU="
									"-l static multiple":                                        "rQBOceI8vad4hO6QVDYGwy8OGkwaS6SXlsKNzypzLyM="
									"-l static multiple files":                                  "kuHlcY4FYlYY3rEZV+DfBXxGSwFAiVPt6EM48rQO1IM="
									"-l dynamic single":                                         "DpbOai08pZs/aabOte+mm9ZLT8XZoQtgD/JThjfwmVU="
									"-l dynamic single with function":                           "T8+8FgrMz73O+xhPfV1u9NR0ze2too192EO6WRy4NbU="
									"-l dynamic --with-context":                                 "LA2ZWqTA1Qk3Ur1FNsUOt/Tb/ZXiqDRa4x87Bvca2uY="
									"multi-doc merge":                                           "bcUbWFolS+flvAt/a7xbp9YqPeDKnEa0vYjf6YwWXjM="
									"multi-doc list":                                            "0btj/LtC1EATR2df+5DpO+pap/L9w33pLQ3/vTbOsiw="
								}
								upload: {
									"test cue package inputs prose":              "56y0GqzzhjD8ykGkOdzxKTOUUy5Hx9Wme9Hew+YSksg="
									"test multiple cue package inputs prose":     "6PAXsupfsUm+26L2SxxG36UeCGrcr4emfdO4cEh5kBw="
									"test cue package + other input types prose": "BRMvsi2pwzqxap7rlfHTQy3GZ3TQ8PzmfB7VVMrFtSA="
									"stdin data":                                 "kI7u6FeLm+E6/ky5V+ToiCYFlxt7X+pASk23dttkk18="
								}
								multi_step: {
									hash:       "VEBG2LE3QD64GCRM23BFID914VKN67GL54PHDKH32LRR6TA814TG===="
									scriptHash: "89HBMOT8AA8UQ8IK2O3ALTSIC68PN1CPK8P82O16CPN7KV1FOF80===="
									steps: [{
										doc:      "# \"A <u style='text-decoration-style: dotted;'>CUE package</u> input can either be combined with other <u style='text-decoration-style: dotted;'>CUE package</u> inputs,\""
										cmd:      "cue export .:A .:B"
										exitCode: 0
										output: """
												{
												    "x": "foo"
												}
												{
												    "y": 2
												}

												"""
									}, {
										doc:      "# \"or with any other types of input.\""
										cmd:      "cue export .:A data.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A packageB.cue"
										exitCode: 0
										output: """
												{
												    "y": 2,
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A data.yml"
										exitCode: 0
										output: """
												{
												    "y": 2,
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A schema.json"
										exitCode: 0
										output: """
												{
												    "x": "foo"
												}

												"""
									}, {
										doc: """
												# "A <u style='text-decoration-style: dotted;'>CUE package</u> input cannot be combined with other <u style='text-decoration-style: dotted;'>CUE package</u> inputs
												# **and** other types of input."
												"""
										cmd:      "cue export .:A .:B data.cue"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A .:B packageB.cue"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A .:B data.yml"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A .:B schema.json"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      "# Tidy up."
										cmd:      "rm -f *.cue data.yml schema.json *.out"
										exitCode: 0
										output:   ""
									}, {
										doc: """
												# "When multiple <u style='text-decoration-style: dotted;'>CUE package</u> inputs are specified then the resulting CUE
												# evaluation is executed once for each package."
												"""
										cmd:      "cue export .:one .:two >2-packages.out"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat 2-packages.out | grep -c '^{$' | grep -x 2"
										exitCode: 0
										output: """
												2

												"""
									}, {
										doc:      ""
										cmd:      "cat 2-packages.out | grep -c '^}$' | grep -x 2"
										exitCode: 0
										output: """
												2

												"""
									}, {
										doc:      ""
										cmd:      "cat 2-packages.out | grep -c '\"x\":' | grep -x 2"
										exitCode: 0
										output: """
												2

												"""
									}, {
										doc: """
												# "Multiple <u style='text-decoration-style: dotted;'>CUE package</u> inputs
												# cannot be combined with any other input types"
												"""
										cmd:      "cue export .:one .:two data.cue"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:one .:two data.yml"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:one .:two schema.json"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      "# Tidy up."
										cmd:      "rm -f *.cue data.yml schema.json *.out"
										exitCode: 0
										output:   ""
									}, {
										doc: """
												# "Issue #3341 tracks a problem when combining a *CUE
												# package* input with a <u style='text-decoration-style: dotted;'>constraint file</u> and some other input types)."
												"""
										cmd:      "cue export .:A schema.json data.yml >3341.out 2>&1"
										exitCode: 1
										output:   ""
									}, {
										doc:      ""
										cmd:      "grep \"cannot combine packages with individual schema files\" 3341.out"
										exitCode: 0
										output: """
												cannot combine packages with individual schema files

												"""
									}, {
										doc: """
												# "The <u style='text-decoration-style: dotted;'>CUE package</u> input must be the first input specified in the list of
												# arguments"
												"""
										cmd:      "cue export .:A data.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export data.cue .:A"
										exitCode: 1
										output: """
												no encoding specified for file ".:A"

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A data.yml"
										exitCode: 0
										output: """
												{
												    "y": 2,
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export data.yml .:A"
										exitCode: 1
										output: """
												no encoding specified for file ".:A"

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A packageB.cue"
										exitCode: 0
										output: """
												{
												    "y": 2,
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export packageB.cue .:A"
										exitCode: 1
										output: """
												no encoding specified for file ".:A"

												"""
									}, {
										doc: """
												# "If <u style='text-decoration-style: dotted;'>CUE package file</u> inputs are present then their package clauses need to be
												# the same as each other"
												"""
										cmd:      "cue export packageA.cue packageA.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export packageA.cue packageB.cue"
										exitCode: 1
										output: """
												found packages "A" (packageA.cue) and "B" (packageB.cue) in "/home/runner"

												"""
									}, {
										doc: """
												# "but don't need to match the name of any <u style='text-decoration-style: dotted;'>CUE package</u>
												# input that's present."
												"""
										cmd:      "cue export .:A packageB.cue"
										exitCode: 0
										output: """
												{
												    "y": 2,
												    "x": "foo"
												}

												"""
									}, {
										doc:      "# Tidy up."
										cmd:      "rm -f *.cue data.yml schema.json *.out"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.yml | cue export yaml: -"
										exitCode: 0
										output: """
												{
												    "A": [
												        "b",
												        "c"
												    ]
												}

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
}
