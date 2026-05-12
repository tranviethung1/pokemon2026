slot0 = {
	[4] = {
		30
	},
	[5] = {
		{
			processId = 4,
			__size = 1
		}
	},
	[9] = {
		20,
		21
	},
	[11] = {
		__size = 2,
		process = "field|left(1)",
		input = "enemyForce|nodead"
	},
	[13] = {
		116
	},
	[20] = {
		125
	},
	[23] = {
		115
	},
	[24] = {
		2,
		99
	},
	[27] = {
		124
	},
	[33] = {
		[0] = 1001,
		__size = 1
	},
	[36] = {
		__size = 2,
		process = "field|excludeID(list(csvSelf:id()))|random(1)",
		input = "selfForce|nodead"
	},
	[38] = {
		126
	},
	[39] = {
		[0] = 1005,
		__size = 1
	},
	[41] = {
		114
	},
	[43] = {
		119
	},
	[44] = {
		[0] = 1003,
		__size = 1
	},
	[49] = {
		24,
		25
	},
	[52] = {
		10,
		11
	},
	[53] = {
		10,
		13
	},
	[58] = {
		127
	},
	[59] = {
		[0] = 1006,
		__size = 1
	},
	[62] = {
		10,
		12
	},
	[65] = {
		133
	},
	[66] = {
		[0] = {
			triggerPoint = 1,
			__size = 1
		},
		{
			__size = 3,
			triggerPoint = 1,
			effectFuncs = {
				"castBuff"
			},
			funcArgs = {
				{
					{
						__size = 4,
						cfgId = 100040,
						holder = 2,
						caster = 2,
						value = {
							3
						}
					}
				}
			}
		},
		__size = 2
	},
	[68] = {
		132
	},
	[69] = {
		[0] = 1016,
		__size = 1
	},
	[73] = {
		20,
		22
	},
	[75] = {
		137
	},
	[82] = {
		20,
		23
	},
	[86] = {
		101704
	},
	[88] = {
		[0] = {
			triggerPoint = 1,
			__size = 1
		},
		{
			__size = 3,
			triggerPoint = 1,
			effectFuncs = {
				"castBuff",
				"castBuff"
			},
			funcArgs = {
				{
					{
						__size = 4,
						cfgId = 100040,
						holder = 2,
						caster = 2,
						value = {
							2
						}
					}
				},
				{
					{
						__size = 4,
						cfgId = 100040,
						holder = 1,
						caster = 2,
						value = {
							3
						}
					}
				}
			}
		},
		__size = 2
	},
	[100] = {
		112
	},
	[111] = {
		100011
	},
	[118] = {
		122
	},
	[120] = {
		117
	},
	[150] = {
		[0] = 1004,
		__size = 1
	},
	[151] = {
		129
	},
	[152] = {
		"holder:hasBuffGroup(124)"
	},
	[170] = {
		128
	},
	[173] = {
		120
	},
	[176] = {
		"more(beAttacked:broken(),0)"
	},
	[178] = {
		__size = 2,
		process = "field|attr(\"broken\",\"max\",1)",
		input = "enemyForce|nodead"
	},
	[182] = {
		121
	},
	[200] = {
		123
	},
	[201] = {
		[0] = 1002,
		__size = 1
	},
	[209] = {
		144
	},
	[210] = {
		[0] = 1009,
		__size = 1
	},
	[211] = {
		2,
		1
	},
	[223] = {
		145
	},
	[254] = {
		24,
		27
	},
	[258] = {
		31
	},
	[260] = {
		31,
		21
	},
	[261] = {
		31,
		25
	},
	[293] = {
		14,
		17
	},
	[295] = {
		14,
		15
	},
	[340] = {
		135
	},
	[341] = {
		40
	},
	[342] = {
		[0] = {
			triggerPoint = 1,
			__size = 1
		},
		{
			__size = 2,
			triggerPoint = 32,
			delSelfWhenTriggered = 1
		},
		__size = 2
	},
	[343] = {
		[0] = 1017,
		__size = 1
	},
	[409] = {
		{
			__size = 3,
			triggerPoint = 1,
			effectFuncs = {
				"castBuff"
			},
			funcArgs = {
				{
					{
						__size = 5,
						cfgId = 102712,
						holder = 1,
						value = 0,
						caster = 1,
						bond = 1
					}
				}
			}
		},
		{
			triggerPoint = 204,
			__size = 4,
			effectFuncs = {
				"castBuff"
			},
			funcArgs = {
				{
					{
						__size = 4,
						cfgId = 102713,
						value = 0,
						caster = 1,
						holder = {
							__size = 2,
							process = "field|random(1)",
							input = "enemyForce|nodead"
						}
					}
				}
			},
			onSomeFlag = {
				"target:inField()"
			}
		},
		__size = 2
	},
	[461] = {
		131
	},
	[468] = {
		{
			processId = 5,
			__size = 1
		}
	},
	[519] = {
		141
	},
	[571] = {
		2000513
	},
	[648] = {
		[0] = {
			triggerPoint = 1,
			__size = 1
		},
		{
			__size = 2,
			triggerPoint = 21,
			delSelfWhenTriggered = 1
		},
		__size = 2
	},
	[668] = {
		1000010902
	},
	[678] = {
		1000020403
	}
}
csv.auto_chess.buff = {
	{
		name = "莱希拉姆测试",
		time = 99,
		id = 1,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 7,
							cfgId = 2,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	{
		name = "莱希拉姆测试",
		time = 99,
		id = 2,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 18,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 3,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 3,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	{
		name = "莱希拉姆测试",
		id = 3,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 17,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 4,
							value = "target:getBuffOverlayCount(3)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 5,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	{
		name = "莱希拉姆测试",
		easyEffectFunc = "buffDamage",
		id = 4,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	{
		name = "莱希拉姆测试",
		id = 5,
		overlayLimit = 1,
		overlayType = 1,
		dispelBuff = {
			3
		},
		dispelType = {
			1,
			1,
			1
		}
	},
	__size = 1188,
	[11] = {
		name = "风速狗测试",
		time = 99,
		id = 11,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 18,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 12,
							value = "target:star()",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 13,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:selectCsvTarget():hasBuff(3)"
				}
			},
			__size = 1
		}
	},
	[12] = {
		id = 12,
		name = "风速狗测试",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[13] = {
		id = 13,
		name = "风速狗测试",
		easyEffectFunc = "newAction",
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1
	},
	[81] = {
		name = "新手引导喷火龙技能",
		time = 99,
		id = 81,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 82,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[82] = {
		id = 82,
		name = "新手引导喷火龙技能",
		time = 99,
		easyEffectFunc = "changeAttackTarget",
		overlayLimit = 1,
		overlayType = 1,
		combineArgs = true,
		specialVal = slot0[4],
		specialTarget = slot0[11]
	},
	[100] = {
		name = "鸭嘴炎兽(新手引导)",
		time = 99,
		id = 100,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[101] = {
		name = "鸭嘴炎兽(新手引导)",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 101,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 102,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[102] = {
		name = "鸭嘴炎兽(新手引导)",
		time = 99,
		id = 102,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 32,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 103,
							value = "self:star()*3",
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(1)",
								input = "enemyForce|nodead"
							}
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField() and target:hasBuffGroup(115)"
				}
			},
			__size = 1
		}
	},
	[103] = {
		name = "鸭嘴炎兽(新手引导)",
		easyEffectFunc = "buffDamage",
		id = 103,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[110] = {
		name = "喵喵(新手引导）",
		time = 99,
		id = 110,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 3,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 111,
							value = "target:star()*3",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[111] = {
		name = "喵喵(新手引导）",
		easyEffectFunc = "gainGold",
		id = 111,
		overlayLimit = 1,
		overlayType = 1
	},
	[1001] = {
		name = "新手引导技能",
		id = 1001,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 1002,
							holder = 3,
							value = 0,
							caster = 2,
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1002] = {
		name = "新手引导技能",
		id = 1002,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 8,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 1003,
							value = 20,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1003] = {
		name = "新手引导技能",
		easyEffectFunc = "gainGold",
		id = 1003,
		overlayLimit = 1,
		overlayType = 1
	},
	[5000] = {
		name = "奇怪的蛋",
		time = 99,
		id = 5000,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 4,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 5003,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 7,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 5002,
							prob = 0.5,
							caster = 1,
							value = {
								"randomChoose(c.cards6())",
								4,
								0,
								0,
								1
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField() and not target:hasBuff(5003)"
				}
			},
			__size = 2
		}
	},
	[5001] = {
		name = "奇怪的蛋",
		easyEffectFunc = "sell",
		id = 5001,
		overlayLimit = 99,
		overlayType = 2
	},
	[5002] = {
		name = "奇怪的蛋",
		easyEffectFunc = "permanentTransform",
		id = 5002,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[20]
	},
	[5003] = {
		name = "奇怪的蛋",
		time = 99,
		id = 5003,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 25,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 5001,
							holder = 1,
							caster = 1,
							value = {
								0
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[100010] = {
		name = "通用",
		time = 99,
		triggerPriority = 98,
		combineArgs = true,
		id = 100010,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 32,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100011,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField() and target:hasBuffGroup(115)"
				}
			},
			__size = 1
		}
	},
	[100011] = {
		name = "通用",
		id = 100011,
		overlayLimit = 1,
		overlayType = 1,
		dispelBuff = slot0[23],
		dispelType = slot0[24]
	},
	[100020] = {
		name = "通用",
		time = 99,
		triggerPriority = 98,
		combineArgs = true,
		id = 100020,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 18,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100021,
							value = 999,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField() and target:hasBuffGroup(121)"
				}
			},
			__size = 1
		}
	},
	[100021] = {
		name = "通用",
		easyEffectFunc = "removeBroken",
		id = 100021,
		overlayLimit = 1,
		overlayType = 1
	},
	[100030] = {
		name = "通用",
		time = 99,
		triggerPriority = 98,
		combineArgs = true,
		id = 100030,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 14,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100031,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField() and target:hasBuffGroup(124)"
				}
			},
			__size = 1
		}
	},
	[100031] = {
		name = "通用",
		id = 100031,
		overlayLimit = 1,
		overlayType = 1,
		dispelBuff = slot0[27],
		dispelType = slot0[24]
	},
	[100040] = {
		name = "通用",
		easyEffectFunc = "playEffect",
		id = 100040,
		overlayLimit = 1,
		overlayType = 1
	},
	[100050] = {
		overlayType = 1,
		name = "通用",
		id = 100050,
		overlayLimit = 1,
		isShow = true,
		specialEffect = {
			[0] = 1012,
			__size = 1
		}
	},
	[100051] = {
		name = "通用",
		overlayType = 1,
		id = 100051,
		overlayLimit = 1,
		isShow = true,
		dispelBuff = {
			100050
		},
		dispelType = {
			1,
			99
		},
		specialEffect = {
			[0] = 1011,
			__size = 1
		}
	},
	[100100] = {
		name = "火炎狮",
		time = 99,
		id = 100100,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100101,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				triggerPoint = 33,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100101,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[100101] = {
		combineArgs = true,
		name = "火炎狮",
		easyEffectFunc = "strike",
		overlayLimit = 1,
		overlayType = 1,
		id = 100101,
		isShow = true,
		group = slot0[23],
		specialEffect = slot0[33]
	},
	[100200] = {
		name = "百变怪·橙色",
		time = 99,
		id = 100200,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 100201,
							holder = 1,
							value = 0,
							caster = 2,
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[100201] = {
		name = "百变怪·橙色",
		time = 99,
		id = 100201,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 3,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 100202,
							holder = 1,
							caster = 2,
							value = {
								1001,
								"target:star()",
								1,
								0,
								1
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[100202] = {
		name = "百变怪·橙色",
		easyEffectFunc = "permanentTransform",
		id = 100202,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[20],
		specialTarget = slot0[36]
	},
	[100300] = {
		name = "奇诺栗鼠",
		time = 99,
		id = 100300,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100301,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				triggerPoint = 33,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100301,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[100301] = {
		id = 100301,
		name = "奇诺栗鼠",
		easyEffectFunc = "divineShield",
		combineArgs = true,
		overlayLimit = 1,
		isShow = true,
		group = slot0[38],
		specialEffect = slot0[39]
	},
	[100400] = {
		name = "晃晃斑",
		time = 99,
		id = 100400,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100401,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[100401] = {
		name = "晃晃斑",
		time = 99,
		id = 100401,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				triggerPoint = 204,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 100402,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(csvSelectObj:star())",
								input = "enemyForce|nodead"
							},
							value = {
								2,
								1
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[100402] = {
		combineArgs = true,
		name = "晃晃斑",
		easyEffectFunc = "stun",
		overlayLimit = 1,
		overlayType = 1,
		id = 100402,
		isShow = true,
		group = slot0[43],
		specialEffect = slot0[44]
	},
	[100500] = {
		name = "爆音怪",
		time = 99,
		id = 100500,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100501,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[100501] = {
		name = "爆音怪",
		time = 99,
		id = 100501,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 205,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 5,
							prob = "moreE(target:star(),1) and 1 or 0",
							cfgId = 100502,
							value = 1,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|excludeID(list(csvSelf:id()))",
								input = "all|nodead"
							}
						}
					},
					{
						{
							__size = 5,
							prob = "moreE(target:star(),2) and 1 or 0",
							cfgId = 100502,
							value = 1,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|excludeID(list(csvSelf:id()))",
								input = "all|nodead"
							}
						}
					},
					{
						{
							__size = 5,
							prob = "moreE(target:star(),4) and 1 or 0",
							cfgId = 100502,
							value = 1,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|excludeID(list(csvSelf:id()))",
								input = "all|nodead"
							}
						}
					},
					{
						{
							__size = 5,
							prob = "moreE(target:star(),4) and 1 or 0",
							cfgId = 100502,
							value = 1,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|excludeID(list(csvSelf:id()))",
								input = "all|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[100502] = {
		name = "爆音怪",
		easyEffectFunc = "buffDamage",
		id = 100502,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[100600] = {
		name = "大舌头",
		time = 99,
		id = 100600,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100601,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[100601] = {
		name = "大舌头",
		time = 99,
		id = 100601,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 32,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 100602,
							holder = 9,
							caster = 2,
							value = {
								2,
								1
							}
						}
					},
					{
						{
							__size = 4,
							holder = 9,
							cfgId = 100603,
							value = "-target:star()*3",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[100602] = {
		combineArgs = true,
		name = "大舌头",
		easyEffectFunc = "stun",
		overlayLimit = 1,
		overlayType = 1,
		id = 100602,
		isShow = true,
		group = slot0[43],
		specialEffect = slot0[44]
	},
	[100603] = {
		id = 100603,
		name = "大舌头",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[100700] = {
		name = "请假王",
		time = 99,
		id = 100700,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100701,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100705,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[100701] = {
		name = "请假王",
		time = 99,
		id = 100701,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 32,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 100702,
							holder = 1,
							caster = 2,
							value = {
								2,
								1
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[100702] = {
		combineArgs = true,
		name = "请假王",
		easyEffectFunc = "stun",
		overlayLimit = 1,
		overlayType = 1,
		id = 100702,
		isShow = true,
		group = slot0[43],
		specialEffect = slot0[44]
	},
	[100703] = {
		easyEffectFunc = "attack",
		name = "请假王",
		time = 99,
		combineArgs = true,
		id = 100703,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[100704] = {
		easyEffectFunc = "hpMax",
		name = "请假王",
		time = 99,
		combineArgs = true,
		id = 100704,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[100705] = {
		name = "请假王",
		time = 99,
		id = 100705,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 16,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100703,
							value = "target:star()*2",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100704,
							value = "target:star()*3",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"hasIntersection(trigger:group(),list(119)) and target:inField()"
				}
			},
			__size = 1
		}
	},
	[100800] = {
		name = "幸福蛋",
		time = 99,
		id = 100800,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100801,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[100801] = {
		name = "幸福蛋",
		time = 99,
		id = 100801,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 18,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 100802,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(csvSelectObj:star())",
								input = "selfForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[100802] = {
		name = "幸福蛋",
		id = 100802,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 100803,
							prob = "moreE(target:hp(),target:hpMax()) and 1 or 0",
							value = "self:star()",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 100804,
							prob = 1,
							value = 10,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[100803] = {
		easyEffectFunc = "hpMax",
		name = "幸福蛋",
		time = 99,
		combineArgs = true,
		id = 100803,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[100804] = {
		overlayType = 1,
		name = "幸福蛋",
		easyEffectFunc = "heal",
		id = 100804,
		overlayLimit = 1,
		isShow = true,
		group = slot0[58],
		specialEffect = slot0[59]
	},
	[100900] = {
		name = "喵喵",
		time = 99,
		id = 100900,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 3,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 100901,
							value = "target:star()*3",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[100901] = {
		name = "喵喵",
		easyEffectFunc = "gainGold",
		id = 100901,
		overlayLimit = 1,
		overlayType = 1
	},
	[101000] = {
		name = "宝宝丁",
		id = 101000,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101001,
							value = "self:star()*5",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[101001] = {
		easyEffectFunc = "defence",
		name = "宝宝丁",
		time = 99,
		combineArgs = true,
		id = 101001,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[62]
	},
	[101100] = {
		name = "雷吉奇卡斯",
		time = 99,
		id = 101100,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101101,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[101101] = {
		name = "雷吉奇卡斯",
		time = 99,
		id = 101101,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 14,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101102,
							value = "math.floor(trigger.lostHp:get(3)*target:star()*0.5)",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 31,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 9,
							cfgId = 101103,
							prob = "lessE(target2:hp(),target:attack()) and 1 or 0",
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[101102] = {
		id = 101102,
		name = "雷吉奇卡斯",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[101103] = {
		name = "雷吉奇卡斯",
		easyEffectFunc = "destroy",
		id = 101103,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[65],
		triggerBehaviors = slot0[66]
	},
	[101200] = {
		name = "小卡比兽",
		time = 99,
		id = 101200,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101201,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				__size = 3,
				triggerPoint = 32,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 9,
							cfgId = 101202,
							value = "self:shield()*self:star()",
							caster = 2
						}
					}
				}
			},
			__size = 2
		}
	},
	[101201] = {
		combineArgs = true,
		name = "小卡比兽",
		time = 99,
		easyEffectFunc = "shieldEX",
		overlayLimit = 1,
		overlayType = 1,
		id = 101201,
		isShow = true,
		group = slot0[68],
		specialEffect = slot0[69]
	},
	[101202] = {
		name = "小卡比兽",
		easyEffectFunc = "buffDamage",
		id = 101202,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[101300] = {
		name = "胖丁",
		time = 99,
		id = 101300,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101301,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[101301] = {
		name = "胖丁",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 101301,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 101302,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and  1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[101302] = {
		name = "胖丁",
		time = 99,
		id = 101302,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 231,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								1008
							}
						}
					},
					{
						{
							__size = 6,
							caster = 2,
							cfgId = 101303,
							ignoreAura = 1,
							value = "self:star()*4",
							prob = 1,
							holder = 1
						}
					},
					{
						{
							__size = 6,
							caster = 2,
							cfgId = 101303,
							ignoreAura = 1,
							value = "self:star()*4",
							prob = 1,
							holder = 2
						}
					}
				},
				onSomeFlag = {
					"less(target:attack(),self:attack())"
				}
			},
			__size = 1
		}
	},
	[101303] = {
		id = 101303,
		name = "胖丁",
		easyEffectFunc = "defence",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[73]
	},
	[101400] = {
		name = "嘟嘟",
		time = 99,
		id = 101400,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 101401,
							prob = 1,
							caster = 2,
							value = {
								"self:star()"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[101401] = {
		easyEffectFunc = "actionTimes",
		name = "嘟嘟",
		time = 99,
		combineArgs = true,
		id = 101401,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[75]
	},
	[101500] = {
		name = "小拉达",
		time = 99,
		id = 101500,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101501,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[101501] = {
		name = "小拉达",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 101501,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 101502,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and  1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[101502] = {
		name = "小拉达",
		time = 99,
		id = 101502,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 231,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								1008
							}
						}
					},
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 101503,
							value = "self:star()*5",
							caster = 2,
							holder = {
								__size = 2,
								process = "random(1)",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"less(target:attack(),self:attack())"
				}
			},
			__size = 1
		}
	},
	[101503] = {
		name = "小拉达",
		easyEffectFunc = "buffDamage",
		id = 101503,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[101600] = {
		name = "美洛耶塔·歌声",
		time = 99,
		id = 101600,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101601,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[101601] = {
		name = "美洛耶塔·歌声",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 101601,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 101602,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and  1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[101602] = {
		name = "美洛耶塔·歌声",
		time = 99,
		id = 101602,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 231,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								1008
							}
						}
					},
					{
						{
							__size = 6,
							caster = 2,
							cfgId = 101603,
							ignoreAura = 1,
							value = "max(0,(self:attack()-target:attack()))",
							prob = 1,
							holder = 1
						}
					},
					{
						{
							__size = 6,
							caster = 2,
							cfgId = 101603,
							ignoreAura = 1,
							value = "self:star()*6",
							prob = 1,
							holder = 2
						}
					},
					{
						{
							__size = 6,
							caster = 2,
							cfgId = 101604,
							ignoreAura = 1,
							value = "self:star()*6",
							prob = 1,
							holder = 2
						}
					}
				},
				onSomeFlag = {
					"less(target:attack(),self:attack())"
				}
			},
			__size = 1
		}
	},
	[101603] = {
		id = 101603,
		name = "美洛耶塔·歌声",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[101604] = {
		id = 101604,
		name = "美洛耶塔·歌声",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[101700] = {
		name = "美洛耶塔·舞步",
		time = 99,
		id = 101700,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101701,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[101701] = {
		name = "美洛耶塔·舞步",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 101701,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 101702,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and  1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[101702] = {
		name = "美洛耶塔·舞步",
		time = 99,
		id = 101702,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 231,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								1008
							}
						}
					},
					{
						{
							__size = 6,
							caster = 2,
							cfgId = 101703,
							ignoreAura = 1,
							value = "self:star()*6",
							prob = 1,
							holder = 2
						}
					},
					{
						{
							__size = 6,
							caster = 2,
							cfgId = 101707,
							ignoreAura = 1,
							value = "self:star()*6",
							prob = 1,
							holder = 2
						}
					},
					{
						{
							__size = 5,
							holder = 2,
							cfgId = 101704,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"less(target:attack(),self:attack())"
				}
			},
			__size = 1
		}
	},
	[101703] = {
		id = 101703,
		name = "美洛耶塔·舞步",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[101704] = {
		name = "美洛耶塔·舞步",
		id = 101704,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[86],
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 101705,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "attrFilter(\"attack\",\"less\",csvSelf:attack())|random(csvSelectObj:star())",
								input = "enemyForce|nodead"
							}
						}
					},
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 101706,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:getBuffOverlayCount(101704)==3"
				}
			},
			__size = 1
		}
	},
	[101705] = {
		name = "美洛耶塔·舞步",
		easyEffectFunc = "destroy",
		id = 101705,
		overlayLimit = 1,
		overlayType = 1,
		combineArgs = true,
		isShow = true,
		group = slot0[65],
		triggerBehaviors = slot0[88],
		specialEffect = {
			[0] = 1013,
			__size = 1
		}
	},
	[101706] = {
		name = "美洛耶塔·舞步",
		id = 101706,
		overlayLimit = 1,
		overlayType = 1,
		dispelBuff = slot0[86]
	},
	[101707] = {
		id = 101707,
		name = "美洛耶塔·舞步",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[101800] = {
		name = "猫老大",
		time = 99,
		id = 101800,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 3,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101801,
							value = "math.floor(target:star()*getGoldNum())",
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101802,
							value = "math.floor(target:star()*getGoldNum())",
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[101801] = {
		easyEffectFunc = "attack",
		name = "猫老大",
		time = 99,
		combineArgs = true,
		id = 101801,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[101802] = {
		easyEffectFunc = "hpMax",
		name = "猫老大",
		time = 99,
		combineArgs = true,
		id = 101802,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[101900] = {
		name = "青绵鸟",
		time = 99,
		id = 101900,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 3,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 101901,
							prob = "target:star()==1 and 1 or 0",
							caster = 2,
							value = {
								"c.cards2_cards3()",
								1,
								1,
								1
							}
						}
					},
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 101901,
							prob = "target:star()==2 and 1 or 0",
							caster = 2,
							value = {
								"c.cards2_cards3_cards4()",
								1,
								1,
								1
							}
						}
					},
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 101901,
							prob = "target:star()==4 and 1 or 0",
							caster = 2,
							value = {
								"c.cards2_cards3_cards4_cards5_cards6()",
								1,
								1,
								1
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[101901] = {
		name = "青绵鸟",
		easyEffectFunc = "getCard",
		id = 101901,
		overlayLimit = 1,
		overlayType = 1
	},
	[102000] = {
		name = "七夕青鸟",
		time = 99,
		id = 102000,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 25,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 102001,
							value = 0,
							caster = 1
						}
					},
					{
						{
							__size = 4,
							cfgId = 102001,
							value = 0,
							caster = 1,
							holder = {
								__size = 2,
								process = "field|left(1)",
								input = "selfForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[102001] = {
		name = "七夕青鸟",
		easyEffectFunc = "backToHand",
		id = 102001,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			[0] = {
				triggerPoint = 1,
				__size = 1
			},
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 102002,
							value = "self:star()*3",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 102003,
							value = "self:star()*3",
							caster = 2
						}
					}
				}
			},
			__size = 2
		}
	},
	[102002] = {
		easyEffectFunc = "attack",
		name = "七夕青鸟",
		time = 99,
		combineArgs = true,
		id = 102002,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[102003] = {
		easyEffectFunc = "hpMax",
		name = "七夕青鸟",
		time = 99,
		combineArgs = true,
		id = 102003,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[102100] = {
		name = "波波",
		id = 102100,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 102101,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[102101] = {
		name = "波波",
		easyEffectFunc = "backToHand",
		id = 102101,
		overlayLimit = 1,
		overlayType = 1
	},
	[102200] = {
		name = "大葱鸭",
		time = 99,
		id = 102200,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 32,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 102201,
							holder = 9,
							caster = 1,
							value = {
								2,
								1
							}
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 102202,
							value = "target:star()*5",
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[102201] = {
		combineArgs = true,
		name = "大葱鸭",
		easyEffectFunc = "stun",
		overlayLimit = 1,
		overlayType = 1,
		id = 102201,
		isShow = true,
		group = slot0[43],
		specialEffect = slot0[44]
	},
	[102202] = {
		overlayType = 1,
		name = "大葱鸭",
		easyEffectFunc = "heal",
		id = 102202,
		overlayLimit = 1,
		isShow = true,
		group = slot0[58],
		specialEffect = slot0[59]
	},
	[102300] = {
		name = "烈雀",
		time = 99,
		id = 102300,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 3,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 102301,
							value = "math.floor(target:star()*self2:lostHp())",
							caster = 3
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 102302,
							value = "math.floor(target:star()*self2:lostHp())",
							caster = 3
						}
					}
				}
			},
			__size = 1
		}
	},
	[102301] = {
		id = 102301,
		name = "烈雀",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[102302] = {
		id = 102302,
		name = "烈雀",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[200100] = {
		name = "凤王",
		time = 99,
		id = 200100,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200101,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[200101] = {
		name = "凤王",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 200101,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 200102,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and not target2:hasBuff(200100) and target2:hasNature(2) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[200102] = {
		name = "凤王",
		time = 99,
		id = 200102,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 4,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 200103,
							holder = 2,
							caster = 2,
							value = {
								"target:unitID()",
								"self:star()",
								1,
								{
									200105
								}
							}
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField() and less(target:seat(),self:seat())"
				}
			},
			__size = 1
		}
	},
	[200103] = {
		name = "凤王",
		easyEffectFunc = "summon",
		id = 200103,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[100]
	},
	[200104] = {
		combineArgs = true,
		name = "凤王",
		easyEffectFunc = "strike",
		overlayLimit = 1,
		overlayType = 1,
		id = 200104,
		isShow = true,
		group = slot0[23],
		specialEffect = slot0[33]
	},
	[200105] = {
		name = "凤王",
		id = 200105,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200104,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[200200] = {
		name = "风速狗",
		time = 99,
		id = 200200,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200201,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[200201] = {
		name = "风速狗",
		time = 99,
		id = 200201,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 205,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200203,
							value = 0,
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200202,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[200202] = {
		name = "风速狗",
		time = 99,
		id = 200202,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				triggerPoint = 204,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 200204,
							value = 0,
							caster = 1,
							holder = {
								__size = 2,
								process = "field|excludeID(list(csvSelectObj:id()))|attrDiffer(\"natureType\", {2})|random(1)",
								input = "selfForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[200203] = {
		id = 200203,
		name = "风速狗",
		easyEffectFunc = "newAction",
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1
	},
	[200204] = {
		name = "风速狗",
		id = 200204,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200205,
							value = "self:star()*3*(1+selfTrainer:getBuffOverlayCount(200208))",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200207,
							value = "self:star()*3*(1+selfTrainer:getBuffOverlayCount(200208))",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200206,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200202,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 200208,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[200205] = {
		id = 200205,
		name = "风速狗",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[200206] = {
		combineArgs = true,
		name = "风速狗",
		easyEffectFunc = "strike",
		overlayLimit = 1,
		overlayType = 1,
		id = 200206,
		isShow = true,
		group = slot0[23],
		specialEffect = slot0[33]
	},
	[200207] = {
		id = 200207,
		name = "风速狗",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[200208] = {
		id = 200208,
		name = "风速狗",
		overlayLimit = 99,
		overlayType = 2
	},
	[200300] = {
		name = "鸭嘴炎兽",
		time = 99,
		id = 200300,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200301,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[200301] = {
		name = "鸭嘴炎兽",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 200301,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 200302,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[200302] = {
		name = "鸭嘴炎兽",
		time = 99,
		id = 200302,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 32,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 200303,
							value = "math.floor(self:star()*0.5*self:attack())",
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(1)",
								input = "enemyForce|nodead"
							}
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField() and target:hasBuffGroup(115)"
				}
			},
			__size = 1
		}
	},
	[200303] = {
		name = "鸭嘴炎兽",
		easyEffectFunc = "buffDamage",
		id = 200303,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[200400] = {
		name = "火焰鸟",
		time = 99,
		id = 200400,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200401,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[200401] = {
		name = "火焰鸟",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 200401,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 200402,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					},
					{
						{
							__size = 6,
							cfgId = 200403,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[200402] = {
		name = "火焰鸟",
		time = 99,
		id = 200402,
		overlayLimit = 1,
		immuneBuff = slot0[111]
	},
	[200403] = {
		name = "火焰鸟",
		time = 99,
		id = 200403,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 32,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 200404,
							holder = 1,
							ignoreAura = 1,
							value = "self:star()",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField() and target:hasBuffGroup(115)"
				}
			},
			__size = 1
		}
	},
	[200404] = {
		easyEffectFunc = "attack",
		name = "火焰鸟",
		time = 99,
		combineArgs = true,
		id = 200404,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[200500] = {
		name = "炎帝",
		time = 99,
		id = 200500,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200501,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200505,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[200501] = {
		name = "炎帝",
		time = 99,
		id = 200501,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 13,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200507,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200503,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[200502] = {
		id = 200502,
		name = "炎帝",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[200503] = {
		combineArgs = true,
		name = "炎帝",
		easyEffectFunc = "strike",
		overlayLimit = 1,
		overlayType = 1,
		id = 200503,
		isShow = true,
		group = slot0[23],
		specialEffect = slot0[33]
	},
	[200504] = {
		easyEffectFunc = "hpMax",
		name = "炎帝",
		time = 99,
		combineArgs = true,
		id = 200504,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[200505] = {
		name = "炎帝",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 200505,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 200506,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[200506] = {
		name = "炎帝",
		time = 99,
		id = 200506,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 32,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 200504,
							holder = 2,
							ignoreAura = 1,
							value = "self:star()*1",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField() and target:hasBuffGroup(115)"
				}
			},
			__size = 1
		}
	},
	[200507] = {
		id = 200507,
		name = "炎帝",
		easyEffectFunc = "newAction",
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1
	},
	[200600] = {
		name = "火焰鸡",
		time = 99,
		id = 200600,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200601,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200602,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[200601] = {
		combineArgs = true,
		name = "火焰鸡",
		time = 99,
		easyEffectFunc = "changeAttackTarget",
		overlayLimit = 1,
		overlayType = 1,
		id = 200601,
		group = slot0[118],
		specialVal = slot0[4],
		specialTarget = {
			__size = 2,
			process = "field|attr(\"hp\",\"min\",1)",
			input = "enemyForce|nodead"
		}
	},
	[200602] = {
		easyEffectFunc = "penetrate",
		name = "火焰鸡",
		time = 99,
		combineArgs = true,
		id = 200602,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[120]
	},
	[200700] = {
		name = "席多蓝恩",
		time = 99,
		id = 200700,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200701,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[200701] = {
		name = "席多蓝恩",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 200701,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 200702,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[200702] = {
		name = "席多蓝恩",
		time = 99,
		id = 200702,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 32,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 200703,
							ignoreAura = 1,
							value = "self:star()*1",
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "selfForce|nodead"
							}
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				},
				onSomeFlag = {
					"target:hasBuffGroup(115)"
				}
			},
			__size = 1
		}
	},
	[200703] = {
		easyEffectFunc = "defence",
		name = "席多蓝恩",
		time = 99,
		combineArgs = true,
		id = 200703,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[62]
	},
	[200800] = {
		name = "喷火龙",
		time = 99,
		id = 200800,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200805,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200802,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200801,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[200801] = {
		combineArgs = true,
		name = "喷火龙",
		time = 99,
		easyEffectFunc = "strike",
		overlayLimit = 1,
		overlayType = 1,
		id = 200801,
		isShow = true,
		group = slot0[23],
		specialEffect = slot0[33]
	},
	[200802] = {
		name = "喷火龙",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 200802,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 200803,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and target2:hasNature(2) and (target2:id()~=self:id()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[200803] = {
		name = "喷火龙",
		id = 200803,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 22,
				__size = 4,
				delSelfWhenTriggered = 1,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 200804,
							holder = 2,
							ignoreAura = 1,
							value = "self:star()*2",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							cfgId = 200806,
							holder = 2,
							ignoreAura = 1,
							value = "self:star()*1",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[200804] = {
		easyEffectFunc = "attack",
		name = "喷火龙",
		time = 99,
		combineArgs = true,
		id = 200804,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[200805] = {
		name = "喷火龙",
		time = 99,
		id = 200805,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200801,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 33,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200801,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[200806] = {
		easyEffectFunc = "hpMax",
		name = "喷火龙",
		time = 99,
		combineArgs = true,
		id = 200806,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[200900] = {
		name = "火暴兽",
		time = 99,
		id = 200900,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200901,
							value = 0,
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200902,
							value = 0,
							caster = 1
						}
					}
				}
			},
			{
				triggerPoint = 33,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200902,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[200901] = {
		combineArgs = true,
		name = "火暴兽",
		time = 99,
		easyEffectFunc = "strike",
		overlayLimit = 1,
		overlayType = 1,
		id = 200901,
		isShow = true,
		group = slot0[23],
		immuneBuff = slot0[111],
		specialEffect = slot0[33]
	},
	[200902] = {
		name = "火暴兽",
		time = 99,
		id = 200902,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200901,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 33,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 200901,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[201000] = {
		name = "喷火驼",
		time = 99,
		id = 201000,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 201001,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[201001] = {
		name = "喷火驼",
		time = 99,
		id = 201001,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 205,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 5,
							caster = 1,
							cfgId = 201002,
							prob = "self:star()==1 and 1 or 0",
							holder = {
								__size = 2,
								process = "field|buffDifferExclude('group',{115})|random(2)",
								input = "all|nodead"
							},
							value = {
								2,
								1
							}
						}
					},
					{
						{
							__size = 5,
							caster = 1,
							cfgId = 201002,
							prob = "self:star()==2 and 1 or 0",
							holder = {
								__size = 2,
								process = "field|buffDifferExclude('group',{115})|random(4)",
								input = "all|nodead"
							},
							value = {
								2,
								1
							}
						}
					},
					{
						{
							__size = 5,
							caster = 1,
							cfgId = 201002,
							prob = "self:star()==4 and 1 or 0",
							holder = {
								__size = 2,
								process = "field|buffDifferExclude('group',{115})|random(8)",
								input = "all|nodead"
							},
							value = {
								2,
								1
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[201002] = {
		combineArgs = true,
		name = "喷火驼",
		easyEffectFunc = "stun",
		overlayLimit = 1,
		overlayType = 1,
		id = 201002,
		isShow = true,
		group = slot0[43],
		specialEffect = slot0[44]
	},
	[201100] = {
		name = "炎武王",
		time = 99,
		id = 201100,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 201101,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 201103,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 201104,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[201101] = {
		name = "炎武王",
		time = 99,
		id = 201101,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 31,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 201102,
							prob = "more(trigger.target:shield(),0) and 1 or 0",
							value = "math.floor(target:attack()*0.5*self:star())",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 201105,
							prob = "more(trigger.target:shield(),0) and 1 or 0",
							value = "math.floor(target:hpMax()*0.5*self:star())",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 2,
							cfgId = 100040,
							prob = "more(trigger.target:shield(),0) and 1 or 0",
							caster = 2,
							value = {
								2
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[201102] = {
		id = 201102,
		name = "炎武王",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[9]
	},
	[201103] = {
		name = "炎武王",
		time = 99,
		id = 201103,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 201104,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 33,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 201104,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[201104] = {
		combineArgs = true,
		name = "炎武王",
		time = 99,
		easyEffectFunc = "strike",
		overlayLimit = 1,
		overlayType = 1,
		id = 201104,
		isShow = true,
		group = slot0[23],
		specialEffect = slot0[33]
	},
	[201105] = {
		id = 201105,
		name = "炎武王",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[201200] = {
		name = "妖火红狐",
		time = 99,
		id = 201200,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 201201,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[201201] = {
		name = "妖火红狐",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 201201,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 201202,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and target2:hasNature(2) and (target2:id()~=self:id())  and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[201202] = {
		name = "妖火红狐",
		id = 201202,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 22,
				__size = 4,
				delSelfWhenTriggered = 1,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 201203,
							holder = 1,
							ignoreAura = 1,
							value = "self:star()*4",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							cfgId = 201204,
							holder = 1,
							ignoreAura = 1,
							value = "self:star()*4",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[201203] = {
		id = 201203,
		name = "妖火红狐",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[201204] = {
		id = 201204,
		name = "妖火红狐",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[201300] = {
		name = "比克提尼",
		time = 99,
		id = 201300,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 207,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 5,
							holder = 4,
							cfgId = 201301,
							prob = "target2:hasNature(2) and 1 or 0",
							value = "self:star()*2",
							caster = 1
						}
					},
					{
						{
							__size = 5,
							holder = 4,
							cfgId = 201302,
							prob = "target2:hasNature(2) and 1 or 0",
							value = "self:star()*1",
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[201301] = {
		easyEffectFunc = "attack",
		name = "比克提尼",
		time = 99,
		combineArgs = true,
		id = 201301,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[201302] = {
		easyEffectFunc = "hpMax",
		name = "比克提尼",
		time = 99,
		combineArgs = true,
		id = 201302,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[201400] = {
		name = "砰头小丑",
		time = 99,
		id = 201400,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				triggerPoint = 204,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 201401,
							value = "self:star()*4*(countObj(\"nature\",target:team(),list(2)))",
							caster = 2,
							holder = {
								__size = 2,
								process = "field|attr(\"attack\",\"max\",1)",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[201401] = {
		name = "砰头小丑",
		easyEffectFunc = "buffDamage",
		id = 201401,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[201500] = {
		name = "小火焰猴",
		time = 99,
		id = 201500,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 201501,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[201501] = {
		name = "小火焰猴",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 201501,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 201502,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[201502] = {
		name = "小火焰猴",
		time = 99,
		id = 201502,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 32,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 201503,
							holder = 1,
							ignoreAura = 1,
							value = "self:star()",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField() and target:hasBuffGroup(115)"
				}
			},
			__size = 1
		}
	},
	[201503] = {
		easyEffectFunc = "hpMax",
		name = "小火焰猴",
		time = 99,
		combineArgs = true,
		id = 201503,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[400100] = {
		name = "谢米·陆地",
		time = 99,
		id = 400100,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 400101,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[400101] = {
		name = "谢米·陆地",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 400101,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 400102,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "moreE(target:star(),1) and target2:hasNature(4) and (target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					},
					{
						{
							__size = 6,
							cfgId = 400102,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "moreE(target:star(),2) and target2:hasNature(4) and (target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					},
					{
						{
							__size = 6,
							cfgId = 400102,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "moreE(target:star(),4) and target2:hasNature(4) and (target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					},
					{
						{
							__size = 6,
							cfgId = 400102,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "moreE(target:star(),4) and target2:hasNature(4) and (target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[400102] = {
		id = 400102,
		name = "谢米·陆地",
		time = 99,
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2
	},
	[400200] = {
		name = "谢米·天空",
		time = 99,
		id = 400200,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 400201,
							value = "target:attack()",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 400202,
							value = "target:hpMax()",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[400201] = {
		easyEffectFunc = "attack",
		name = "谢米·天空",
		time = 99,
		combineArgs = true,
		id = 400201,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[400202] = {
		easyEffectFunc = "hpMax",
		name = "谢米·天空",
		time = 99,
		combineArgs = true,
		id = 400202,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[400300] = {
		name = "木守宫",
		time = 99,
		id = 400300,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 10,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 400301,
							holder = 1,
							caster = 2,
							value = {
								"randomChoose(c.grassCards())",
								"target:star()",
								0,
								{
									400302
								}
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[400301] = {
		name = "木守宫",
		easyEffectFunc = "summon",
		id = 400301,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[100]
	},
	[400302] = {
		name = "木守宫",
		id = 400302,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 400303,
							value = "target:origin():attack()-target:attack()",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 400304,
							value = "target:origin():hpMax()-target:hpMax()",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[400303] = {
		id = 400303,
		name = "木守宫",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[400304] = {
		id = 400304,
		name = "木守宫",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[400400] = {
		name = "藤藤蛇",
		time = 99,
		id = 400400,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				triggerPoint = 204,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 400401,
							prob = "target:star()==1 and 1 or 0",
							caster = 2,
							value = {
								"c.grow1()",
								1,
								0,
								1
							}
						}
					},
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 400401,
							prob = "target:star()==2 and 1 or 0",
							caster = 2,
							value = {
								"c.grow2()",
								1,
								0,
								1
							}
						}
					},
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 400401,
							prob = "target:star()==4 and 1 or 0",
							caster = 2,
							value = {
								"c.grow4()",
								1,
								0,
								1
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[400401] = {
		name = "藤藤蛇",
		easyEffectFunc = "getCard",
		id = 400401,
		overlayLimit = 1,
		overlayType = 1
	},
	[400500] = {
		name = "木木枭",
		time = 99,
		id = 400500,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 400501,
							prob = 1,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 400502,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				triggerPoint = 33,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 400501,
							prob = 1,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 400502,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[400501] = {
		id = 400501,
		name = "木木枭",
		easyEffectFunc = "stealth",
		combineArgs = true,
		overlayLimit = 1,
		isShow = true,
		group = slot0[27],
		specialEffect = slot0[150]
	},
	[400502] = {
		combineArgs = true,
		name = "木木枭",
		time = 99,
		easyEffectFunc = "quickStrike",
		overlayLimit = 1,
		overlayType = 1,
		id = 400502,
		group = slot0[151],
		specialVal = slot0[152]
	},
	[400600] = {
		name = "甜竹竹",
		time = 99,
		id = 400600,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 400601,
							prob = 1,
							caster = 2,
							value = {
								1
							}
						}
					}
				}
			},
			{
				triggerPoint = 32,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 400602,
							prob = "target:star()==1 and 1 or 0",
							caster = 2,
							value = {
								"c.grow1()",
								1,
								0,
								1
							}
						}
					},
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 400602,
							prob = "target:star()==2 and 1 or 0",
							caster = 2,
							value = {
								"c.grow2()",
								1,
								0,
								1
							}
						}
					},
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 400602,
							prob = "target:star()==4 and 1 or 0",
							caster = 2,
							value = {
								"c.grow4()",
								1,
								0,
								1
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[400601] = {
		easyEffectFunc = "actionTimes",
		name = "甜竹竹",
		time = 99,
		combineArgs = true,
		id = 400601,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[75]
	},
	[400602] = {
		name = "甜竹竹",
		easyEffectFunc = "getCard",
		id = 400602,
		overlayLimit = 1,
		overlayType = 1
	},
	[400700] = {
		name = "毕力吉翁",
		time = 99,
		id = 400700,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 400701,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[400701] = {
		name = "毕力吉翁",
		time = 99,
		id = 400701,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 28,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 400702,
							value = "target:star()",
							caster = 2,
							holder = {
								__size = 2,
								process = "field|attrDiffer(\"natureType\", {4})",
								input = "selfForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField() and trigger.obj:type()==3"
				}
			},
			__size = 1
		}
	},
	[400702] = {
		easyEffectFunc = "hpMax",
		name = "毕力吉翁",
		time = 99,
		combineArgs = true,
		id = 400702,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[400800] = {
		name = "妙蛙种子",
		time = 99,
		id = 400800,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 400801,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[400801] = {
		name = "妙蛙种子",
		time = 99,
		id = 400801,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 9,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 400802,
							prob = "target:star()==1 and 1 or 0",
							caster = 2,
							value = {
								"c.grow1()",
								1,
								0,
								1
							}
						}
					},
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 400802,
							prob = "target:star()==2 and 1 or 0",
							caster = 2,
							value = {
								"c.grow2()",
								1,
								0,
								1
							}
						}
					},
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 400802,
							prob = "target:star()==4 and 1 or 0",
							caster = 2,
							value = {
								"c.grow4()",
								1,
								0,
								1
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[400802] = {
		name = "妙蛙种子",
		easyEffectFunc = "getCard",
		id = 400802,
		overlayLimit = 1,
		overlayType = 1
	},
	[400900] = {
		name = "菊草叶",
		time = 99,
		id = 400900,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 400901,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[400901] = {
		name = "菊草叶",
		time = 99,
		id = 400901,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 14,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 400902,
							value = "target:star()*3",
							caster = 2,
							holder = {
								__size = 2,
								process = "field|attrDiffer(\"natureType\", {4})",
								input = "selfForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[400902] = {
		overlayType = 1,
		name = "菊草叶",
		easyEffectFunc = "heal",
		id = 400902,
		overlayLimit = 1,
		isShow = true,
		group = slot0[58],
		specialEffect = slot0[59]
	},
	[401000] = {
		name = "草苗龟",
		time = 99,
		id = 401000,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 14,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 401001,
							value = 1,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|buffDifferExclude('id',{401000})",
								input = "all|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[401001] = {
		name = "草苗龟",
		easyEffectFunc = "buffDamage",
		id = 401001,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[401100] = {
		name = "哈力栗",
		time = 99,
		id = 401100,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 401101,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[401101] = {
		name = "哈力栗",
		time = 99,
		id = 401101,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 14,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 4,
							cfgId = 401102,
							value = "target:star()",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 4,
							cfgId = 401103,
							value = "target:star()",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[401102] = {
		id = 401102,
		name = "哈力栗",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[401103] = {
		id = 401103,
		name = "哈力栗",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[401200] = {
		name = "喇叭芽",
		time = 99,
		id = 401200,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 401201,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[401201] = {
		name = "喇叭芽",
		time = 99,
		id = 401201,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 28,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 401202,
							prob = 1,
							value = "target:star()",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 401203,
							prob = 1,
							value = "target:star()",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and trigger.obj:type()==3"
				}
			},
			__size = 1
		}
	},
	[401202] = {
		easyEffectFunc = "attack",
		name = "喇叭芽",
		time = 99,
		combineArgs = true,
		id = 401202,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[401203] = {
		easyEffectFunc = "hpMax",
		name = "喇叭芽",
		time = 99,
		combineArgs = true,
		id = 401203,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[401300] = {
		name = "时拉比",
		time = 99,
		id = 401300,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 401301,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[401301] = {
		name = "时拉比",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 401301,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 401302,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[401302] = {
		name = "时拉比",
		time = 99,
		id = 401302,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 4,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 401303,
							ignoreAura = 1,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(csvSelf:star())",
								input = "selfForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[401303] = {
		name = "时拉比",
		time = 99,
		id = 401303,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = "randomChoose(list(520101,520102,520103))",
							prob = "(self:star()==1) and 1 or 0",
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = "randomChoose(list(520104,520105,520106))",
							prob = "(self:star()==2) and 1 or 0",
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = "randomChoose(list(520107,520108,520109))",
							prob = "(self:star()==4) and 1 or 0",
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[401400] = {
		name = "纸御剑",
		time = 99,
		id = 401400,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 401401,
							prob = 1,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 401402,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				triggerPoint = 6,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 401403,
							prob = "target:star()==1 and 1 or 0",
							caster = 2,
							value = {
								"c.grow1()",
								1,
								0,
								1
							}
						}
					},
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 401403,
							prob = "target:star()==2 and 1 or 0",
							caster = 2,
							value = {
								"c.grow2()",
								1,
								0,
								1
							}
						}
					},
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 401403,
							prob = "target:star()==4 and 1 or 0",
							caster = 2,
							value = {
								"c.grow4()",
								1,
								0,
								1
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[401401] = {
		easyEffectFunc = "ignoreShield",
		name = "纸御剑",
		time = 99,
		combineArgs = true,
		id = 401401,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[170]
	},
	[401402] = {
		easyEffectFunc = "penetrate",
		name = "纸御剑",
		time = 99,
		combineArgs = true,
		id = 401402,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[120]
	},
	[401403] = {
		name = "纸御剑",
		easyEffectFunc = "getCard",
		id = 401403,
		overlayLimit = 1,
		overlayType = 1
	},
	[700100] = {
		name = "玛夏多",
		time = 99,
		id = 700100,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 700101,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 700103,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[700101] = {
		name = "玛夏多",
		time = 99,
		id = 700101,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 31,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 700102,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField() and more(trigger.target:broken(),0)"
				}
			},
			__size = 1
		}
	},
	[700102] = {
		combineArgs = true,
		name = "玛夏多",
		easyEffectFunc = "strike",
		overlayLimit = 1,
		overlayType = 1,
		id = 700102,
		isShow = true,
		group = slot0[23],
		specialEffect = slot0[33]
	},
	[700103] = {
		name = "玛夏多",
		time = 99,
		id = 700103,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[173],
		triggerBehaviors = {
			{
				triggerPoint = 6,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 700104,
							caster = 1,
							holder = {
								__size = 2,
								process = "field|buffDiffer('group',{114})|random(csvSelectObj:star())",
								input = "selfForce|nodead"
							},
							value = {
								"list(204)",
								"target:star()"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[700104] = {
		name = "玛夏多",
		easyEffectFunc = "forceTrigger",
		id = 700104,
		overlayLimit = 1,
		overlayType = 1
	},
	[700200] = {
		name = "利欧路",
		time = 99,
		id = 700200,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 700201,
							prob = 1,
							caster = 2,
							value = {
								"self:star()"
							}
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 700202,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[700201] = {
		easyEffectFunc = "actionTimes",
		name = "利欧路",
		time = 99,
		combineArgs = true,
		id = 700201,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[75]
	},
	[700202] = {
		combineArgs = true,
		name = "利欧路",
		time = 99,
		easyEffectFunc = "quickStrike",
		overlayLimit = 1,
		overlayType = 1,
		id = 700202,
		group = slot0[151],
		specialVal = slot0[176]
	},
	[700300] = {
		name = "怪力",
		time = 99,
		id = 700300,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 700301,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 700302,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[700301] = {
		combineArgs = true,
		name = "怪力",
		time = 99,
		easyEffectFunc = "changeAttackTarget",
		overlayLimit = 1,
		overlayType = 1,
		id = 700301,
		group = slot0[118],
		specialVal = slot0[4],
		specialTarget = slot0[178]
	},
	[700302] = {
		name = "怪力",
		time = 99,
		id = 700302,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 31,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 700303,
							value = "math.floor(trigger.target:broken()*0.5*target:star())",
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 700304,
							value = "math.floor(trigger.target:broken()*0.5*target:star())",
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField() and more(trigger.target:broken(),0)"
				}
			},
			__size = 1
		}
	},
	[700303] = {
		id = 700303,
		name = "怪力",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[700304] = {
		id = 700304,
		name = "怪力",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[700400] = {
		name = "飞腿郎",
		time = 99,
		id = 700400,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 700401,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[700401] = {
		name = "飞腿郎",
		time = 99,
		id = 700401,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 31,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 700402,
							holder = 9,
							caster = 1,
							value = {
								2,
								1
							}
						}
					},
					{
						{
							__size = 4,
							holder = 9,
							cfgId = 700403,
							value = "self:star()*3",
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[700402] = {
		combineArgs = true,
		name = "飞腿郎",
		easyEffectFunc = "stun",
		overlayLimit = 1,
		overlayType = 1,
		id = 700402,
		isShow = true,
		group = slot0[43],
		specialEffect = slot0[44]
	},
	[700403] = {
		id = 700403,
		name = "飞腿郎",
		easyEffectFunc = "broken",
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[182]
	},
	[700500] = {
		name = "战舞郎",
		time = 99,
		id = 700500,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 700501,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[700501] = {
		name = "战舞郎",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 700501,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 700502,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and target2:hasNature(7) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[700502] = {
		name = "战舞郎",
		time = 99,
		id = 700502,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 31,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 5,
							cfgId = 700503,
							holder = 1,
							ignoreAura = 1,
							value = "self:star()",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							cfgId = 700504,
							holder = 1,
							ignoreAura = 1,
							value = "self:star()",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and more(trigger.target:broken(),0)"
				}
			},
			__size = 1
		}
	},
	[700503] = {
		easyEffectFunc = "attack",
		name = "战舞郎",
		time = 99,
		combineArgs = true,
		id = 700503,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[700504] = {
		easyEffectFunc = "hpMax",
		name = "战舞郎",
		time = 99,
		combineArgs = true,
		id = 700504,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[700600] = {
		name = "快拳郎",
		time = 99,
		id = 700600,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 700601,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[700601] = {
		name = "快拳郎",
		time = 99,
		id = 700601,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 32,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 700602,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and more(trigger.target:broken(),0)"
				}
			},
			__size = 1
		}
	},
	[700602] = {
		id = 700602,
		name = "快拳郎",
		easyEffectFunc = "newAction",
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1
	},
	[700700] = {
		name = "搬运小匠",
		time = 99,
		id = 700700,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 700701,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 700702,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[700701] = {
		name = "搬运小匠",
		time = 99,
		id = 700701,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 14,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 700705,
							value = "trigger.lostHp:get(3)",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[700702] = {
		name = "搬运小匠",
		time = 99,
		triggerPriority = 9,
		id = 700702,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 10,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 700704,
							value = "target:broken()*target:star()",
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(1)",
								input = "enemyForce|nodead"
							}
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 700703,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and more(target:broken(),0)"
				}
			},
			__size = 1
		}
	},
	[700703] = {
		name = "搬运小匠",
		easyEffectFunc = "removeBroken",
		id = 700703,
		overlayLimit = 1,
		overlayType = 1
	},
	[700704] = {
		id = 700704,
		name = "搬运小匠",
		easyEffectFunc = "broken",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[182]
	},
	[700705] = {
		id = 700705,
		name = "搬运小匠",
		easyEffectFunc = "broken",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[182]
	},
	[700800] = {
		name = "摔角鹰人",
		time = 99,
		id = 700800,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 700801,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[700801] = {
		name = "摔角鹰人",
		time = 99,
		id = 700801,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 31,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 700802,
							value = "target:star()*4",
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 9,
							cfgId = 700803,
							value = "target:attack()",
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[700802] = {
		id = 700802,
		name = "摔角鹰人",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[700803] = {
		id = 700803,
		name = "摔角鹰人",
		easyEffectFunc = "broken",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[182]
	},
	[700900] = {
		name = "火暴猴",
		time = 99,
		id = 700900,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 700901,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[700901] = {
		name = "火暴猴",
		time = 99,
		id = 700901,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				triggerPoint = 204,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 6,
							cfgId = 700902,
							value = "target:star()*3",
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[700902] = {
		id = 700902,
		name = "火暴猴",
		easyEffectFunc = "broken",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[182]
	},
	[701000] = {
		name = "葱游兵",
		time = 99,
		id = 701000,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 701001,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[701001] = {
		name = "葱游兵",
		time = 99,
		id = 701001,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[173],
		triggerBehaviors = {
			{
				triggerPoint = 10,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 701002,
							value = "target:star()*5",
							caster = 1,
							holder = {
								__size = 2,
								process = "field|random(csvSelectObj:star())",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[701002] = {
		id = 701002,
		name = "葱游兵",
		easyEffectFunc = "broken",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[182]
	},
	[701100] = {
		name = "藏玛然特",
		time = 99,
		id = 701100,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 701101,
							value = 0,
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 701104,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[701101] = {
		name = "藏玛然特",
		time = 99,
		id = 701101,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[173],
		triggerBehaviors = {
			{
				triggerPoint = 13,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 701102,
							value = 0,
							caster = 1,
							holder = {
								__size = 2,
								process = "field|attrDiffer(\"natureType\", {7})|random(csvSelectObj:star())",
								input = "selfForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[701102] = {
		name = "藏玛然特",
		id = 701102,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 701103,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 701105,
							value = "self:star()*3",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[701103] = {
		id = 701103,
		name = "藏玛然特",
		easyEffectFunc = "divineShield",
		combineArgs = true,
		overlayLimit = 1,
		isShow = true,
		group = slot0[38],
		specialEffect = slot0[39]
	},
	[701104] = {
		combineArgs = true,
		name = "藏玛然特",
		time = 99,
		easyEffectFunc = "protector",
		overlayLimit = 1,
		overlayType = 1,
		id = 701104,
		isShow = true,
		group = slot0[200],
		specialEffect = slot0[201]
	},
	[701105] = {
		id = 701105,
		name = "藏玛然特",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[701200] = {
		name = "童偶熊",
		time = 99,
		id = 701200,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 701201,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[701201] = {
		name = "童偶熊",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 701201,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 701202,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and target2:hasNature(7) and 1 or 0",
							bond = 1
						}
					},
					{
						{
							__size = 6,
							cfgId = 701203,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and target2:hasNature(7) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[701202] = {
		combineArgs = true,
		name = "童偶熊",
		time = 99,
		easyEffectFunc = "quickStrike",
		overlayLimit = 1,
		overlayType = 1,
		id = 701202,
		group = slot0[151],
		specialVal = slot0[176]
	},
	[701203] = {
		name = "童偶熊",
		time = 99,
		id = 701203,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[173],
		triggerBehaviors = {
			{
				triggerPoint = 31,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 701204,
							value = "trigger.target:broken()*self:star()",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and more(trigger.target:broken(),0)"
				}
			},
			__size = 1
		}
	},
	[701204] = {
		overlayType = 1,
		name = "童偶熊",
		easyEffectFunc = "heal",
		id = 701204,
		overlayLimit = 1,
		isShow = true,
		group = slot0[58],
		specialEffect = slot0[59]
	},
	[1100100] = {
		name = "洛奇亚",
		time = 99,
		id = 1100100,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1100101,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				triggerPoint = 7,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1100105,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(1)",
								input = "selfForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[1100101] = {
		name = "洛奇亚",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1100101,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1100102,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1100102] = {
		name = "洛奇亚",
		id = 1100102,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 22,
				__size = 4,
				delSelfWhenTriggered = 1,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 1100103,
							holder = 1,
							ignoreAura = 1,
							value = "self:star()*5",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							cfgId = 1100104,
							holder = 1,
							ignoreAura = 1,
							value = "self:star()*5",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[1100103] = {
		easyEffectFunc = "attack",
		name = "洛奇亚",
		time = 99,
		combineArgs = true,
		id = 1100103,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[1100104] = {
		easyEffectFunc = "hpMax",
		name = "洛奇亚",
		time = 99,
		combineArgs = true,
		id = 1100104,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[1100105] = {
		name = "洛奇亚",
		easyEffectFunc = "backToHand",
		id = 1100105,
		overlayLimit = 1,
		overlayType = 1
	},
	[1100200] = {
		name = "解放胡帕",
		time = 99,
		id = 1100200,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 10,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 1100201,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|buffDifferExclude('group',{144})|random(1)",
								input = "enemyForce|nodead"
							}
						}
					},
					{
						{
							__size = 4,
							cfgId = 1100202,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|buffDiffer('group',{144})|random(csvSelf:star())",
								input = "selfForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1100201] = {
		name = "解放胡帕",
		easyEffectFunc = "oneHitKill",
		id = 1100201,
		overlayLimit = 1,
		isShow = true,
		group = slot0[209],
		specialEffect = slot0[210]
	},
	[1100202] = {
		name = "解放胡帕",
		id = 1100202,
		overlayLimit = 1,
		overlayType = 1,
		dispelBuff = slot0[209],
		dispelType = slot0[211]
	},
	[1100300] = {
		name = "基拉祈",
		time = 99,
		id = 1100300,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1100301,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1100302,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1100301] = {
		combineArgs = true,
		name = "基拉祈",
		time = 99,
		easyEffectFunc = "shieldEX",
		overlayLimit = 1,
		overlayType = 1,
		id = 1100301,
		isShow = true,
		group = slot0[68],
		specialEffect = slot0[69]
	},
	[1100302] = {
		name = "基拉祈",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1100302,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1100304,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1100304] = {
		name = "基拉祈",
		id = 1100304,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 4,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 1100305,
							holder = 5,
							ignoreAura = 1,
							value = "self:star()*(target:hasBuffGroup(144) and 14 or 7)",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1100305] = {
		id = 1100305,
		name = "基拉祈",
		easyEffectFunc = "defence",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[73]
	},
	[1100306] = {
		name = "基拉祈",
		id = 1100306,
		overlayLimit = 1,
		overlayType = 1,
		dispelBuff = {
			1100304
		}
	},
	[1100400] = {
		name = "超梦",
		time = 99,
		id = 1100400,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1100401,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				__size = 3,
				triggerPoint = 10,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1100406,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|buffDiffer('group',{144})|random(1)",
								input = "all|nodead"
							}
						}
					}
				}
			},
			__size = 2
		}
	},
	[1100401] = {
		name = "超梦",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1100401,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1100403,
							holder = 18,
							caster = 2,
							value = 0,
							prob = 1,
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1100403] = {
		name = "超梦",
		id = 1100403,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 4,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 1100404,
							holder = 2,
							ignoreAura = 1,
							value = "math.floor(self:star()*target:attack()*0.5)",
							caster = 2
						}
					},
					{
						{
							__size = 6,
							caster = 2,
							cfgId = 1100405,
							ignoreAura = 1,
							value = "math.floor(self:star()*target:hpMax()*0.5)",
							prob = "target:hasBuffGroup(144) and 1 or 0",
							holder = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1100404] = {
		id = 1100404,
		name = "超梦",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1100405] = {
		id = 1100405,
		name = "超梦",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[1100406] = {
		name = "超梦",
		easyEffectFunc = "destroy",
		id = 1100406,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[65],
		triggerBehaviors = slot0[66]
	},
	[1100407] = {
		name = "超梦",
		id = 1100407,
		overlayLimit = 1,
		overlayType = 1,
		dispelBuff = {
			1100403
		}
	},
	[1100500] = {
		name = "梦幻",
		time = 99,
		id = 1100500,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 10,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1100501,
							prob = "moreE(target:star(),1) and 1 or 0",
							caster = 2,
							value = {
								14002,
								"target:star()",
								0,
								{
									1100502
								}
							}
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1100501,
							prob = "moreE(target:star(),2) and 1 or 0",
							caster = 2,
							value = {
								14002,
								"target:star()",
								0,
								{
									1100502
								}
							}
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1100501,
							prob = "moreE(target:star(),4) and 1 or 0",
							caster = 2,
							value = {
								14002,
								"target:star()",
								0,
								{
									1100502
								}
							}
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1100501,
							prob = "moreE(target:star(),4) and 1 or 0",
							caster = 2,
							value = {
								14002,
								"target:star()",
								0,
								{
									1100502
								}
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1100501] = {
		name = "梦幻",
		easyEffectFunc = "summon",
		id = 1100501,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[100],
		specialTarget = {
			__size = 2,
			process = "field|random(1)",
			input = "all|nodead"
		}
	},
	[1100502] = {
		name = "梦幻",
		easyEffectFunc = "oneHitKill",
		id = 1100502,
		overlayLimit = 1,
		isShow = true,
		group = slot0[209],
		specialEffect = slot0[210]
	},
	[1100600] = {
		name = "凯西",
		time = 99,
		id = 1100600,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 12,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 1100601,
							holder = 1,
							caster = 2,
							value = {
								11006,
								"target:star()",
								0,
								{
									1100602,
									1100603
								}
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1100601] = {
		name = "凯西",
		easyEffectFunc = "summon",
		id = 1100601,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[100]
	},
	[1100602] = {
		overlayType = 1,
		name = "凯西",
		easyEffectFunc = "protector",
		id = 1100602,
		overlayLimit = 1,
		isShow = true,
		group = slot0[200],
		specialEffect = slot0[201]
	},
	[1100603] = {
		name = "凯西",
		easyEffectFunc = "oneHitKill",
		id = 1100603,
		overlayLimit = 1,
		isShow = true,
		group = slot0[209],
		specialEffect = slot0[210]
	},
	[1100700] = {
		name = "小果然",
		time = 99,
		id = 1100700,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[223],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100050,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				triggerPoint = 33,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100050,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 212,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 8,
							cfgId = 1100701,
							value = "math.floor(target2:attack()*self:star()*0.5)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100051,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:hasBuff(100050)"
				}
			},
			__size = 3
		}
	},
	[1100701] = {
		name = "小果然",
		easyEffectFunc = "buffDamage",
		id = 1100701,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[1100800] = {
		name = "克雷色利亚",
		time = 99,
		id = 1100800,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1100801,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1100801] = {
		name = "克雷色利亚",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1100801,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1100802,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1100802] = {
		name = "克雷色利亚",
		id = 1100802,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 4,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 5,
							cfgId = 1100803,
							value = "self:star()*(target:hasBuffGroup(144) and 6 or 3)",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1100803] = {
		overlayType = 1,
		name = "克雷色利亚",
		easyEffectFunc = "heal",
		id = 1100803,
		overlayLimit = 1,
		isShow = true,
		group = slot0[58],
		specialEffect = slot0[59]
	},
	[1100900] = {
		name = "哥德宝宝",
		time = 99,
		id = 1100900,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1100901,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1100903,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				triggerPoint = 33,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1100903,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[1100901] = {
		name = "哥德宝宝",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1100901,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1100902,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and (not target2:hasBuff(1100900)) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1100902] = {
		name = "哥德宝宝",
		id = 1100902,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 4,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 1100904,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1100903] = {
		easyEffectFunc = "oneHitKill",
		name = "哥德宝宝",
		time = 99,
		id = 1100903,
		overlayLimit = 1,
		isShow = true,
		group = slot0[209],
		specialEffect = slot0[210]
	},
	[1100904] = {
		name = "哥德宝宝",
		id = 1100904,
		overlayLimit = 1,
		overlayType = 1,
		dispelBuff = slot0[209],
		dispelType = slot0[211]
	},
	[1101100] = {
		name = "宝石海星",
		time = 99,
		id = 1101100,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				triggerPoint = 204,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 5,
							holder = 10,
							cfgId = 1101101,
							prob = "target2:isTrainer() and 0 or 1",
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 1101102,
							value = 1,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(csvSelectObj:star())",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1101101] = {
		name = "宝石海星",
		easyEffectFunc = "oneHitKill",
		id = 1101101,
		overlayLimit = 1,
		isShow = true,
		group = slot0[209],
		specialEffect = slot0[210]
	},
	[1101102] = {
		name = "宝石海星",
		easyEffectFunc = "buffDamage",
		id = 1101102,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[1101300] = {
		name = "艾路雷朵",
		time = 99,
		id = 1101300,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1101301,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1101305,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1101301] = {
		name = "艾路雷朵",
		time = 99,
		id = 1101301,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 31,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1101302,
							prob = "trigger.target:hasBuffGroup(144) and 1 or 0",
							value = "math.floor(target:star()*trigger.target:attack()*0.5)",
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 9,
							cfgId = 1101303,
							value = "target:attack()",
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1101302] = {
		easyEffectFunc = "attack",
		name = "艾路雷朵",
		time = 99,
		combineArgs = true,
		id = 1101302,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[1101303] = {
		name = "艾路雷朵",
		id = 1101303,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 13,
							cfgId = 1101304,
							value = "target:getBuff(1101303):getValue()",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1101304] = {
		id = 1101304,
		name = "艾路雷朵",
		easyEffectFunc = "broken",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[182]
	},
	[1101305] = {
		id = 1101305,
		equipBond = true,
		time = 99,
		easyEffectFunc = "quickStrike",
		overlayLimit = 1,
		overlayType = 1,
		name = "艾路雷朵",
		combineArgs = true,
		group = slot0[151],
		specialVal = {
			"beAttacked:hasBuffGroup(144)"
		}
	},
	[1101400] = {
		name = "奈克洛兹玛",
		time = 99,
		id = 1101400,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1101401,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1101402,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1101403,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1101401] = {
		combineArgs = true,
		name = "奈克洛兹玛",
		time = 99,
		easyEffectFunc = "changeAttackTarget",
		overlayLimit = 1,
		overlayType = 1,
		id = 1101401,
		group = slot0[118],
		specialVal = slot0[4],
		specialTarget = {
			__size = 2,
			process = "field|buffDiffer('group',{144})|random(1)",
			input = "enemyForce|nodead"
		}
	},
	[1101402] = {
		easyEffectFunc = "penetrate",
		name = "奈克洛兹玛",
		time = 99,
		combineArgs = true,
		id = 1101402,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[120]
	},
	[1101403] = {
		name = "奈克洛兹玛",
		time = 99,
		id = 1101403,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 31,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1101404,
							value = "math.floor(target:star()*trigger.target:hpMax()*0.5)",
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1101405,
							value = "math.floor(target:star()*trigger.target:attack()*0.5)",
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField() and trigger.target:hasBuffGroup(144)"
				}
			},
			__size = 1
		}
	},
	[1101404] = {
		id = 1101404,
		name = "奈克洛兹玛",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1101405] = {
		id = 1101405,
		name = "奈克洛兹玛",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[1101500] = {
		name = "蛋蛋",
		time = 99,
		id = 1101500,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				triggerPoint = 204,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 1101501,
							holder = 1,
							caster = 2,
							value = {
								"randomChoose(c.allCards())",
								"target:star()",
								0,
								{
									1101502
								}
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1101501] = {
		name = "蛋蛋",
		easyEffectFunc = "summon",
		id = 1101501,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[100]
	},
	[1101502] = {
		name = "蛋蛋",
		easyEffectFunc = "oneHitKill",
		id = 1101502,
		overlayLimit = 1,
		isShow = true,
		group = slot0[209],
		specialEffect = slot0[210]
	},
	[1101600] = {
		name = "呆呆兽",
		time = 99,
		id = 1101600,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 35,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 1101601,
							holder = 2,
							caster = 2,
							value = {
								{}
							}
						}
					},
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 1101602,
							value = "trigger.damage",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and lessE(target:broken(),0)"
				}
			},
			{
				triggerPoint = 10,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 1101603,
							value = 9999,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[1101601] = {
		name = "呆呆兽",
		easyEffectFunc = "immuneDamage",
		id = 1101601,
		overlayLimit = 1,
		triggerBehaviors = {
			[0] = {
				triggerPoint = 1,
				__size = 1
			},
			{
				__size = 2,
				triggerPoint = 99,
				delSelfWhenTriggered = 1
			},
			__size = 2
		}
	},
	[1101602] = {
		id = 1101602,
		name = "呆呆兽",
		easyEffectFunc = "broken",
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[182]
	},
	[1101603] = {
		id = 1101603,
		name = "呆呆兽",
		easyEffectFunc = "removeBroken"
	},
	[1400100] = {
		name = "惩戒胡帕",
		time = 99,
		id = 1400100,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 10,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 1400101,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(1)",
								input = "enemyForce|nodead"
							},
							value = {
								14002,
								"self:star()",
								0,
								{}
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1400101] = {
		name = "惩戒胡帕",
		easyEffectFunc = "summon",
		id = 1400101,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[100]
	},
	[1400200] = {
		name = "恶作剧之影",
		time = 99,
		id = 1400200,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1400201,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				triggerPoint = 204,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 1400202,
							value = "self:star()*7",
							caster = 1,
							holder = {
								__size = 2,
								process = "field|random(6)",
								input = "selfForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[1400201] = {
		time = 99,
		name = "恶作剧之影",
		easyEffectFunc = "oneHitKill",
		overlayLimit = 1,
		overlayType = 1,
		id = 1400201,
		isShow = true,
		group = slot0[209],
		specialEffect = slot0[210]
	},
	[1400202] = {
		name = "恶作剧之影",
		easyEffectFunc = "buffDamage",
		id = 1400202,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[1400300] = {
		name = "露奈雅拉",
		time = 99,
		id = 1400300,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				triggerPoint = 205,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 1400304,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|buffDifferExclude('id',{1400300})|attrDiffer(\"natureType\", {14})|random(csvSelectObj:star())",
								input = "selfForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 13,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 1400304,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|buffDifferExclude('id',{1400300})|attrDiffer(\"natureType\", {14})|random(csvSelectObj:star())",
								input = "selfForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 204,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 1400302,
							holder = 1,
							caster = 2,
							value = {
								14003,
								"self:star()",
								0,
								{}
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField() and more(countObj(\"group\",self:team(),list(124)),0)"
				}
			},
			__size = 3
		}
	},
	[1400301] = {
		id = 1400301,
		name = "露奈雅拉",
		easyEffectFunc = "stealth",
		combineArgs = true,
		overlayLimit = 1,
		isShow = true,
		group = slot0[27],
		specialEffect = slot0[150]
	},
	[1400302] = {
		name = "露奈雅拉",
		easyEffectFunc = "summon",
		id = 1400302,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[100]
	},
	[1400303] = {
		id = 1400303,
		name = "露奈雅拉",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1400304] = {
		name = "露奈雅拉",
		id = 1400304,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1400301,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1400303,
							value = "self:star()*3",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1400400] = {
		name = "梦妖",
		time = 99,
		id = 1400400,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1400401,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1400401] = {
		name = "梦妖",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1400401,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1400402,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()~=self:team()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1400402] = {
		name = "梦妖",
		id = 1400402,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 4,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 1400403,
							holder = 13,
							ignoreAura = 1,
							caster = 2,
							value = {
								2,
								1
							}
						}
					}
				},
				onSomeFlag = {
					"target:unitID()~=14003"
				}
			},
			__size = 1
		}
	},
	[1400403] = {
		combineArgs = true,
		name = "梦妖",
		easyEffectFunc = "stun",
		overlayLimit = 1,
		overlayType = 1,
		id = 1400403,
		isShow = true,
		group = slot0[43],
		specialEffect = slot0[44]
	},
	[1400500] = {
		name = "夜巡灵",
		time = 99,
		id = 1400500,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 1400501,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				__size = 3,
				triggerPoint = 204,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1400504,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|attrFilter(\"attack\",\"less\",(1+csvSelf:getBuffOverlayCount(1400503))*5*csvSelf:star())|random(csvSelf:star())",
								input = "enemyForce|nodead"
							}
						}
					}
				}
			},
			__size = 2
		}
	},
	[1400501] = {
		name = "夜巡灵",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1400501,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1400502,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()~=self:team()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1400502] = {
		name = "夜巡灵",
		id = 1400502,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 4,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 1400503,
							holder = 2,
							ignoreAura = 1,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1400503] = {
		id = 1400503,
		name = "夜巡灵",
		overlayLimit = 99,
		overlayType = 2
	},
	[1400504] = {
		name = "夜巡灵",
		easyEffectFunc = "destroy",
		id = 1400504,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[65],
		triggerBehaviors = slot0[88]
	},
	[1400600] = {
		name = "烛光灵",
		time = 99,
		id = 1400600,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 204,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1400601,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "enemyForce|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[1400601] = {
		name = "烛光灵",
		id = 1400601,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1400602,
							value = "-self:star()*4",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1400603,
							value = "-self:star()*4",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1400602] = {
		id = 1400602,
		name = "烛光灵",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[1400603] = {
		id = 1400603,
		name = "烛光灵",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[254]
	},
	[1400700] = {
		name = "鬼斯",
		time = 99,
		id = 1400700,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1400701,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1400701] = {
		name = "鬼斯",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1400701,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1400702,
							holder = 18,
							caster = 2,
							value = "self:star()",
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1400702] = {
		name = "鬼斯",
		time = 99,
		id = 1400702,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 31,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 9,
							cfgId = 1400703,
							value = 0,
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 9,
							cfgId = 1400706,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField() and target:hasBuffGroup(124)"
				}
			},
			__size = 1
		}
	},
	[1400703] = {
		name = "鬼斯",
		id = 1400703,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[258],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							caster = 2,
							cfgId = 1400704,
							ignoreAura = 1,
							value = "min(target:attack(),self:getBuff(1400702):getValue()*3)",
							prob = 1,
							holder = 2
						}
					},
					{
						{
							__size = 6,
							caster = 2,
							cfgId = 1400705,
							ignoreAura = 1,
							value = "self:star()*(self:getBuff(1400702):getValue()*3)*-1",
							prob = 1,
							holder = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1400704] = {
		id = 1400704,
		name = "鬼斯",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[260]
	},
	[1400705] = {
		id = 1400705,
		name = "鬼斯",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[261]
	},
	[1400706] = {
		name = "鬼斯",
		id = 1400706,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 1400708,
							holder = 2,
							ignoreAura = 1,
							value = "min(target:hp(),self:getBuff(1400702):getValue()*3)",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							cfgId = 1400707,
							holder = 1,
							ignoreAura = 1,
							value = "-self:getBuff(1400702):getValue()*3",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1400707] = {
		id = 1400707,
		name = "鬼斯",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[254]
	},
	[1400708] = {
		id = 1400708,
		name = "鬼斯",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[1400800] = {
		name = "谜拟Q",
		time = 99,
		id = 1400800,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1400801,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1400803,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 2
		}
	},
	[1400801] = {
		id = 1400801,
		name = "谜拟Q",
		easyEffectFunc = "stealth",
		combineArgs = true,
		overlayLimit = 1,
		isShow = true,
		group = slot0[27],
		specialEffect = slot0[150]
	},
	[1400802] = {
		id = 1400802,
		name = "谜拟Q",
		easyEffectFunc = "divineShield",
		combineArgs = true,
		overlayLimit = 1,
		isShow = true,
		group = slot0[38],
		specialEffect = slot0[39]
	},
	[1400803] = {
		name = "谜拟Q",
		time = 99,
		id = 1400803,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 16,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1400802,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"hasIntersection(trigger:group(),list(124)) and target:inField()"
				}
			},
			__size = 1
		}
	},
	[1400900] = {
		name = "怨影娃娃",
		time = 99,
		id = 1400900,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1400901,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				triggerPoint = 33,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1400901,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 34,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 1400902,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(csvSelf:star())",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"trigger.name==\"stealth\" and target:inField() and (trigger.overType==2 or trigger.overType==0)"
				}
			},
			__size = 3
		}
	},
	[1400901] = {
		id = 1400901,
		name = "怨影娃娃",
		easyEffectFunc = "stealth",
		combineArgs = true,
		overlayLimit = 1,
		isShow = true,
		group = slot0[27],
		specialEffect = slot0[150]
	},
	[1400902] = {
		name = "怨影娃娃",
		id = 1400902,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1400903,
							prob = 1,
							value = -5,
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1400904,
							prob = 1,
							caster = 2,
							value = {
								2,
								1
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[1400903] = {
		id = 1400903,
		name = "怨影娃娃",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[1400904] = {
		combineArgs = true,
		name = "怨影娃娃",
		easyEffectFunc = "stun",
		overlayLimit = 1,
		overlayType = 1,
		id = 1400904,
		isShow = true,
		group = slot0[43],
		specialEffect = slot0[44]
	},
	[1401000] = {
		name = "勾魂眼",
		time = 99,
		id = 1401000,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1401001,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				triggerPoint = 33,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1401001,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 31,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 5,
							holder = 9,
							cfgId = 1401002,
							prob = "more(target2:attack(),0) and 1 or 0",
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 3
		}
	},
	[1401001] = {
		id = 1401001,
		name = "勾魂眼",
		easyEffectFunc = "stealth",
		combineArgs = true,
		overlayLimit = 1,
		isShow = true,
		group = slot0[27],
		specialEffect = slot0[150]
	},
	[1401002] = {
		name = "攻击偷取",
		id = 1401002,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[258],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 2,
							cfgId = 1401003,
							prob = 1,
							value = "min(target:attack(),self:star()*(self:hasBuffGroup(124) and 4 or 2))",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1401004,
							prob = 1,
							value = "self:star()*(self:hasBuffGroup(124) and 4 or 2)*-1",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1401003] = {
		id = 1401003,
		name = "加攻击",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[260]
	},
	[1401004] = {
		id = 1401004,
		name = "减攻击",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[261]
	},
	[1401100] = {
		name = "小木灵",
		time = 99,
		id = 1401100,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				triggerPoint = 204,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 1401101,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|buffDifferExclude('group',{124})|random(csvSelf:star()*1)",
								input = "selfForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1401101] = {
		id = 1401101,
		name = "小木灵",
		easyEffectFunc = "stealth",
		combineArgs = true,
		overlayLimit = 1,
		isShow = true,
		group = slot0[27],
		specialEffect = slot0[150]
	},
	[1401200] = {
		name = "骑拉帝纳",
		time = 99,
		id = 1401200,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1401201,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1401201] = {
		name = "骑拉帝纳",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1401201,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1401202,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1401202] = {
		name = "骑拉帝纳",
		id = 1401202,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 34,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					},
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 1401203,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1401203,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"trigger.name==\"stealth\" and target:inField() and (trigger.overType==2 or trigger.overType==0)"
				}
			},
			__size = 1
		}
	},
	[1401203] = {
		name = "骑拉帝纳",
		id = 1401203,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 1401204,
							holder = 1,
							ignoreAura = 1,
							value = "self:star()*2",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							cfgId = 1401205,
							holder = 1,
							ignoreAura = 1,
							value = "self:star()*2",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1401204] = {
		easyEffectFunc = "attack",
		name = "骑拉帝纳",
		time = 99,
		combineArgs = true,
		id = 1401204,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[1401205] = {
		easyEffectFunc = "hpMax",
		name = "骑拉帝纳",
		time = 99,
		combineArgs = true,
		id = 1401205,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[1600100] = {
		name = "伊裴尔塔尔",
		time = 99,
		id = 1600100,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1600101,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1600106,
							prob = "target:attack()~=target:hp() and 1 or 0",
							value = "target:hp()-target:attack()",
							caster = 2
						}
					}
				}
			},
			{
				triggerPoint = 16,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1600106,
							value = "target:hp()-target:attack()",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and hasIntersection(trigger:group(),list(27,17,13,23)) and target:attack()~=target:hp()"
				}
			},
			{
				triggerPoint = 14,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1600106,
							value = "target:hp()-target:attack()",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and target:attack()~=target:hp()"
				}
			},
			{
				triggerPoint = 15,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1600106,
							value = "target:hp()-target:attack()",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and target:attack()~=target:hp()"
				}
			},
			{
				triggerPoint = 33,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1600106,
							value = "target:hp()-target:attack()",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and target:attack()~=target:hp()"
				}
			},
			__size = 5
		}
	},
	[1600101] = {
		name = "伊裴尔塔尔",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1600101,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1600102,
							holder = 18,
							caster = 2,
							value = 0,
							prob = 1,
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1600102] = {
		name = "伊裴尔塔尔",
		id = 1600102,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 10,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1600103,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				triggerPoint = 4,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 1600107,
							holder = 2,
							ignoreAura = 1,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[1600103] = {
		name = "伊裴尔塔尔",
		id = 1600103,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 1600105,
							holder = 2,
							ignoreAura = 1,
							value = "min(target:hp(),(self:star()+self:getBuffOverlayCount(1600107))*2)",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							cfgId = 1600104,
							holder = 1,
							ignoreAura = 1,
							value = "-(1+self:getBuffOverlayCount(1600107))*2*self:star()",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1600104] = {
		id = 1600104,
		name = "伊裴尔塔尔",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[254]
	},
	[1600105] = {
		id = 1600105,
		name = "伊裴尔塔尔",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[1600106] = {
		id = 1600106,
		name = "伊裴尔塔尔",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1600107] = {
		id = 1600107,
		name = "伊裴尔塔尔",
		overlayLimit = 99,
		overlayType = 2
	},
	[1600300] = {
		name = "达克莱伊",
		time = 99,
		id = 1600300,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1600301,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				__size = 3,
				triggerPoint = 18,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1600302,
							holder = 7,
							caster = 2,
							value = {
								2,
								1
							}
						}
					}
				}
			},
			__size = 2
		}
	},
	[1600301] = {
		name = "达克莱伊",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1600301,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1600303,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()~=self:team()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1600302] = {
		combineArgs = true,
		name = "达克莱伊",
		easyEffectFunc = "stun",
		overlayLimit = 1,
		overlayType = 1,
		id = 1600302,
		isShow = true,
		group = slot0[43],
		specialEffect = slot0[44]
	},
	[1600303] = {
		name = "达克莱伊",
		id = 1600303,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 16,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					},
					{
						{
							__size = 5,
							cfgId = 1600304,
							holder = 1,
							ignoreAura = 1,
							value = "-self:star()*6",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1600305,
							prob = "target:attack()==0 and 1 or 0",
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"hasIntersection(trigger:group(),list(119)) and target:inField()"
				}
			},
			__size = 1
		}
	},
	[1600304] = {
		id = 1600304,
		name = "达克莱伊",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[1600305] = {
		name = "达克莱伊",
		easyEffectFunc = "destroy",
		id = 1600305,
		overlayLimit = 1,
		overlayType = 1,
		combineArgs = true,
		isShow = true,
		group = slot0[65],
		triggerBehaviors = slot0[66],
		specialEffect = {
			[0] = 1007,
			__size = 1
		}
	},
	[1600400] = {
		name = "阿勃梭鲁",
		time = 99,
		id = 1600400,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 1600401,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1600401] = {
		name = "阿勃梭鲁",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1600401,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1600402,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()~=self:team()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1600402] = {
		name = "阿勃梭鲁",
		id = 1600402,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 16,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1600403,
							value = "-self:star()*3",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and hasIntersection(trigger:group(),list(27,17))"
				}
			},
			{
				triggerPoint = 14,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1600403,
							value = "-self:star()*3",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[1600403] = {
		id = 1600403,
		name = "阿勃梭鲁",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[1600500] = {
		name = "索罗亚",
		time = 99,
		id = 1600500,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 205,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1600502,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|near|random(1)",
								input = "enemyForce|nodead"
							}
						}
					},
					{
						{
							__size = 4,
							cfgId = 1600501,
							holder = 1,
							caster = 2,
							value = {
								16005,
								"target:star()",
								0,
								0,
								0,
								{
									1600509
								}
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1600501] = {
		name = "索罗亚",
		easyEffectFunc = "temporaryTransform",
		id = 1600501,
		overlayLimit = 1,
		overlayType = 1,
		specialTarget = {
			__size = 2,
			process = "field|near|buffDiffer('id',{1600502})",
			input = "enemyForce|nodead"
		}
	},
	[1600502] = {
		name = "索罗亚",
		id = 1600502,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 1600503,
							value = "math.floor(target:attack()*0.5)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1600505,
							value = "-math.floor(target:attack()*0.5)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 1600506,
							value = "math.floor(target:hpMax()*0.5)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1600508,
							value = "-math.floor(target:hpMax()*0.5)",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1600503] = {
		id = 1600503,
		name = "索罗亚",
		overlayLimit = 1,
		overlayType = 1
	},
	[1600504] = {
		id = 1600504,
		name = "索罗亚",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1600505] = {
		id = 1600505,
		name = "索罗亚",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[1600506] = {
		id = 1600506,
		name = "索罗亚",
		overlayLimit = 1,
		overlayType = 1
	},
	[1600507] = {
		id = 1600507,
		name = "索罗亚",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[1600508] = {
		id = 1600508,
		name = "索罗亚",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[254]
	},
	[1600509] = {
		name = "索罗亚",
		id = 1600509,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1600504,
							prob = 1,
							value = "target:transformOrigin():getBuff(1600503):getValue()",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1600507,
							prob = 1,
							value = "target:transformOrigin():getBuff(1600506):getValue()",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1600600] = {
		name = "甲贺忍蛙",
		time = 99,
		id = 1600600,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 31,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 9,
							cfgId = 1600604,
							prob = "target2:hasBuffGroup(119) and 0 or 1",
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 9,
							cfgId = 1600601,
							prob = "target2:hasBuffGroup(119) and 0 or 1",
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 9,
							cfgId = 1600610,
							prob = "target2:hasBuffGroup(119) and 1 or 0",
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 9,
							cfgId = 1600607,
							prob = "target2:hasBuffGroup(119) and 1 or 0",
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1600601] = {
		name = "甲贺忍蛙",
		id = 1600601,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 1600603,
							value = "min(target:hp(),self:star()*3)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1600602,
							value = "-self:star()*3",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1600602] = {
		id = 1600602,
		name = "甲贺忍蛙",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[254]
	},
	[1600603] = {
		id = 1600603,
		name = "甲贺忍蛙",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[1600604] = {
		name = "甲贺忍蛙",
		id = 1600604,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 1600606,
							value = "min(target:attack(),self:star()*3)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1600605,
							value = "-self:star()*3",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1600605] = {
		id = 1600605,
		name = "甲贺忍蛙",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[1600606] = {
		id = 1600606,
		name = "甲贺忍蛙",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1600607] = {
		name = "甲贺忍蛙",
		id = 1600607,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 1600609,
							value = "min(target:hp(),self:star()*3)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1600608,
							value = "-self:star()*3",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1600608] = {
		easyEffectFunc = "hpMax",
		name = "甲贺忍蛙",
		time = 99,
		combineArgs = true,
		id = 1600608,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[293]
	},
	[1600609] = {
		easyEffectFunc = "hpMax",
		name = "甲贺忍蛙",
		time = 99,
		combineArgs = true,
		id = 1600609,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[1600610] = {
		name = "甲贺忍蛙",
		id = 1600610,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 1600612,
							value = "min(target:attack(),self:star()*3)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1600611,
							value = "-self:star()*3",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1600611] = {
		easyEffectFunc = "attack",
		name = "甲贺忍蛙",
		time = 99,
		combineArgs = true,
		id = 1600611,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[295]
	},
	[1600612] = {
		easyEffectFunc = "attack",
		name = "甲贺忍蛙",
		time = 99,
		combineArgs = true,
		id = 1600612,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[1600700] = {
		name = "单首龙",
		time = 99,
		id = 1600700,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 13,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1600701,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(csvSelf:star())",
								input = "enemyForce|nodead"
							},
							value = {
								2,
								1
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[1600701] = {
		combineArgs = true,
		name = "单首龙",
		easyEffectFunc = "stun",
		overlayLimit = 1,
		overlayType = 1,
		id = 1600701,
		isShow = true,
		group = slot0[43],
		specialEffect = slot0[44]
	},
	[1600800] = {
		name = "戴鲁比",
		time = 99,
		id = 1600800,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 204,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1600801,
							value = "self:star()*4*(target2:hasBuffGroup(119) and (1+self:star()) or 1)",
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "enemyForce|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[1600801] = {
		name = "戴鲁比",
		easyEffectFunc = "buffDamage",
		id = 1600801,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[1600900] = {
		name = "流氓鳄",
		time = 99,
		id = 1600900,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[223],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100050,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				triggerPoint = 33,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100050,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 212,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 8,
							cfgId = 1600901,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 1600904,
							holder = 8,
							caster = 2,
							value = {
								2,
								1
							}
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100051,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:hasBuff(100050)"
				}
			},
			__size = 3
		}
	},
	[1600901] = {
		name = "流氓鳄",
		id = 1600901,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 1600903,
							value = "math.floor(target:attack()*0.5)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1600902,
							value = "-math.floor(target:attack()*0.5)",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1600902] = {
		id = 1600902,
		name = "流氓鳄",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[1600903] = {
		id = 1600903,
		name = "流氓鳄",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1600904] = {
		combineArgs = true,
		name = "流氓鳄",
		easyEffectFunc = "stun",
		overlayLimit = 1,
		overlayType = 1,
		id = 1600904,
		isShow = true,
		group = slot0[43],
		specialEffect = slot0[44]
	},
	[1601000] = {
		name = "狃拉",
		time = 99,
		id = 1601000,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 32,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1601001,
							holder = 9,
							caster = 2,
							value = {
								2,
								1
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[1601001] = {
		combineArgs = true,
		name = "狃拉",
		easyEffectFunc = "stun",
		overlayLimit = 1,
		overlayType = 1,
		id = 1601001,
		isShow = true,
		group = slot0[43],
		specialEffect = slot0[44]
	},
	[1601100] = {
		name = "混混鳄",
		time = 99,
		id = 1601100,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100050,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				triggerPoint = 33,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100050,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 212,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 8,
							cfgId = 1601101,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 8,
							cfgId = 1601104,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100051,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:hasBuff(100050)"
				}
			},
			__size = 3
		}
	},
	[1601101] = {
		name = "混混鳄",
		id = 1601101,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 1601103,
							value = "min(target:hp(),self:star()*4)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1601102,
							value = "-self:star()*4",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1601102] = {
		id = 1601102,
		name = "混混鳄",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[254]
	},
	[1601103] = {
		id = 1601103,
		name = "混混鳄",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[1601104] = {
		name = "混混鳄",
		id = 1601104,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 1601106,
							value = "min(target:attack(),self:star()*4)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1601105,
							value = "-self:star()*4",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1601105] = {
		id = 1601105,
		name = "混混鳄",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[1601106] = {
		id = 1601106,
		name = "混混鳄",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1700100] = {
		name = "美录梅塔",
		time = 99,
		id = 1700100,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1700101,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1700104,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1700101] = {
		name = "美录梅塔",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1700101,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1700102,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and target2:hasNature(17) and (target2:id()~=self:id()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1700102] = {
		name = "美录梅塔",
		time = 99,
		id = 1700102,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 18,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 1700103,
							holder = 2,
							ignoreAura = 1,
							value = "self:star()*2",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1700103] = {
		id = 1700103,
		name = "美录梅塔",
		easyEffectFunc = "defence",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[73]
	},
	[1700104] = {
		name = "美录梅塔",
		time = 99,
		id = 1700104,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 26,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1700105,
							value = "math.floor(trigger.lostShield:get(3)*self:star()*0.5)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1700105] = {
		id = 1700105,
		name = "美录梅塔",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1700200] = {
		name = "玛机雅娜",
		time = 99,
		id = 1700200,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1700201,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1700201] = {
		name = "玛机雅娜",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1700201,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1700202,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and target2:hasNature(17) and 1 or 0",
							bond = 1
						}
					},
					{
						{
							__size = 6,
							cfgId = 1700203,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and target2:hasNature(17) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1700202] = {
		combineArgs = true,
		name = "玛机雅娜",
		time = 99,
		easyEffectFunc = "shieldEX",
		overlayLimit = 1,
		overlayType = 1,
		id = 1700202,
		isShow = true,
		group = slot0[68],
		specialEffect = slot0[69]
	},
	[1700203] = {
		name = "玛机雅娜",
		time = 99,
		id = 1700203,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 13,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 1700204,
							holder = 1,
							ignoreAura = 1,
							value = "self:star()*3",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1700204] = {
		id = 1700204,
		name = "玛机雅娜",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1700300] = {
		name = "大钢蛇",
		time = 99,
		id = 1700300,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1700301,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1700301] = {
		name = "大钢蛇",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1700301,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1700302,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and target2:hasNature(17) and (target2:id()~=self:id()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1700302] = {
		name = "大钢蛇",
		time = 99,
		id = 1700302,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 13,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 1700304,
							holder = 2,
							ignoreAura = 1,
							value = "self:star()*2",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 1700303,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1700303] = {
		id = 1700303,
		name = "大钢蛇",
		easyEffectFunc = "newAction",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2
	},
	[1700304] = {
		id = 1700304,
		name = "大钢蛇",
		easyEffectFunc = "defence",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[73]
	},
	[1700400] = {
		name = "波士可多拉",
		time = 99,
		id = 1700400,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1700401,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1700401] = {
		name = "波士可多拉",
		time = 99,
		id = 1700401,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 18,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 4,
							cfgId = 1700402,
							prob = "target2:hasNature(17) and 1 or 0",
							value = "self:star()*4",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1700402] = {
		id = 1700402,
		name = "波士可多拉",
		easyEffectFunc = "defence",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[73]
	},
	[1700500] = {
		name = "巨金怪",
		time = 99,
		id = 1700500,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1700501,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1700502,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1700501] = {
		combineArgs = true,
		name = "巨金怪",
		time = 99,
		easyEffectFunc = "protector",
		overlayLimit = 1,
		overlayType = 1,
		id = 1700501,
		isShow = true,
		group = slot0[200],
		specialEffect = slot0[201]
	},
	[1700502] = {
		combineArgs = true,
		name = "巨金怪",
		time = 99,
		easyEffectFunc = "shieldEX",
		overlayLimit = 1,
		overlayType = 1,
		id = 1700502,
		isShow = true,
		group = slot0[68],
		specialEffect = slot0[69]
	},
	[1700600] = {
		name = "勾帕路翁",
		time = 99,
		id = 1700600,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1700601,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1700601] = {
		name = "勾帕路翁",
		time = 99,
		id = 1700601,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 9,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1700602,
							value = "self:star()*2",
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(2)",
								input = "selfForce|nodead"
							}
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1700602] = {
		easyEffectFunc = "defence",
		name = "勾帕路翁",
		time = 99,
		combineArgs = true,
		id = 1700602,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[62]
	},
	[1700700] = {
		name = "坚盾剑怪",
		time = 99,
		id = 1700700,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1700701,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1700702,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1700701] = {
		combineArgs = true,
		name = "坚盾剑怪",
		time = 99,
		easyEffectFunc = "protector",
		overlayLimit = 1,
		overlayType = 1,
		id = 1700701,
		isShow = true,
		group = slot0[200],
		specialEffect = slot0[201]
	},
	[1700702] = {
		name = "坚盾剑怪",
		time = 99,
		id = 1700702,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 13,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1700703,
							value = "self:star()*2",
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(csvSelf:star())",
								input = "selfForce|nodead"
							}
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1700703] = {
		id = 1700703,
		name = "坚盾剑怪",
		easyEffectFunc = "defence",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[73]
	},
	[1700800] = {
		name = "齿轮怪",
		time = 99,
		id = 1700800,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1700801,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1700801] = {
		name = "齿轮怪",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1700801,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1700802,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and (target2:id()~=self:id()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1700802] = {
		name = "齿轮怪",
		time = 99,
		id = 1700802,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 10,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 1700803,
							holder = 2,
							ignoreAura = 1,
							value = "self:star()*1",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							cfgId = 1700803,
							holder = 1,
							ignoreAura = 1,
							value = "self:star()*1",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1700803] = {
		id = 1700803,
		name = "齿轮怪",
		easyEffectFunc = "defence",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[73]
	},
	[1700900] = {
		name = "龙头地鼠",
		time = 99,
		id = 1700900,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1700901,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1700901] = {
		name = "龙头地鼠",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1700901,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1700902,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and target2:hasNature(17) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1700902] = {
		name = "龙头地鼠",
		time = 99,
		id = 1700902,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 27,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 1700903,
							holder = 2,
							ignoreAura = 1,
							value = "self:star()*2",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				},
				onSomeFlag = {
					"inBattle() and target:inField()"
				}
			},
			__size = 1
		}
	},
	[1700903] = {
		id = 1700903,
		name = "龙头地鼠",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1701000] = {
		name = "雷吉斯奇鲁",
		time = 99,
		id = 1701000,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1701001,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1701001] = {
		name = "雷吉斯奇鲁",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1701001,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1701002,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and target2:hasNature(17) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1701002] = {
		name = "雷吉斯奇鲁",
		time = 99,
		id = 1701002,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 18,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1701003,
							value = "self:star()*5",
							caster = 2,
							holder = {
								__size = 2,
								process = "field|attr(\"hp\",\"max\",1)",
								input = "enemyForce|nodead"
							}
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1701003] = {
		name = "雷吉斯奇鲁",
		easyEffectFunc = "buffDamage",
		id = 1701003,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[1701100] = {
		name = "索尔迦雷欧",
		time = 99,
		id = 1701100,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1701101,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1701101] = {
		name = "索尔迦雷欧",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1701101,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1701102,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and target2:hasNature(17) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1701102] = {
		name = "索尔迦雷欧",
		time = 99,
		id = 1701102,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 27,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1701103,
							value = "self:star()*4+math.floor(self:getBuffOverlayCount(1701104)/(12-self:star()*2))*8",
							caster = 2,
							holder = {
								__size = 2,
								process = "field|attr(\"hp\",\"max\",1)",
								input = "enemyForce|nodead"
							}
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				},
				onSomeFlag = {
					"inBattle() and target:inField()"
				}
			},
			__size = 1
		}
	},
	[1701103] = {
		name = "索尔迦雷欧",
		easyEffectFunc = "buffDamage",
		id = 1701103,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5],
		triggerBehaviors = {
			[0] = {
				triggerPoint = 1,
				__size = 1
			},
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 1701104,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 2
		}
	},
	[1701104] = {
		id = 1701104,
		name = "索尔迦雷欧",
		overlayLimit = 99,
		overlayType = 2
	},
	[1701200] = {
		name = "垒磊石",
		time = 99,
		id = 1701200,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1701201,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1701202,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1701201] = {
		combineArgs = true,
		name = "垒磊石",
		time = 99,
		easyEffectFunc = "protector",
		overlayLimit = 1,
		overlayType = 1,
		id = 1701201,
		isShow = true,
		group = slot0[200],
		specialEffect = slot0[201]
	},
	[1701202] = {
		name = "垒磊石",
		time = 99,
		id = 1701202,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 27,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1701203,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1701204,
							value = "target:star()*3",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					}
				},
				onSomeFlag = {
					"inBattle() and target:inField()"
				}
			},
			__size = 1
		}
	},
	[1701203] = {
		id = 1701203,
		name = "垒磊石",
		easyEffectFunc = "divineShield",
		combineArgs = true,
		overlayLimit = 1,
		isShow = true,
		group = slot0[38],
		specialEffect = slot0[39]
	},
	[1701204] = {
		id = 1701204,
		name = "垒磊石",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1800100] = {
		name = "哲尔尼亚斯",
		time = 99,
		id = 1800100,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1800101,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1800101] = {
		name = "哲尔尼亚斯",
		time = 99,
		id = 1800101,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 18,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 5,
							prob = "moreE(target:star(),1) and 1 or 0",
							cfgId = 1800102,
							value = "target:star()*3",
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "selfForce|nodead"
							}
						}
					},
					{
						{
							__size = 5,
							prob = "moreE(target:star(),2) and 1 or 0",
							cfgId = 1800102,
							value = "target:star()*3",
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "selfForce|nodead"
							}
						}
					},
					{
						{
							__size = 5,
							prob = "moreE(target:star(),4) and 1 or 0",
							cfgId = 1800102,
							value = "target:star()*3",
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "selfForce|nodead"
							}
						}
					},
					{
						{
							__size = 5,
							prob = "moreE(target:star(),4) and 1 or 0",
							cfgId = 1800102,
							value = "target:star()*3",
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "selfForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1800102] = {
		overlayType = 1,
		name = "哲尔尼亚斯",
		easyEffectFunc = "heal",
		id = 1800102,
		overlayLimit = 1,
		isShow = true,
		group = slot0[58],
		specialEffect = slot0[59]
	},
	[1800200] = {
		name = "闪光超级沙奈朵",
		time = 99,
		id = 1800200,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1800201,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				triggerPoint = 205,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1800202,
							value = 0,
							caster = 1,
							holder = {
								__size = 2,
								process = "field|random(csvSelectObj:star())",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[1800201] = {
		name = "闪光超级沙奈朵",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1800201,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1800203,
							holder = 18,
							caster = 2,
							value = 0,
							prob = 1,
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1800202] = {
		name = "闪光超级沙奈朵",
		easyEffectFunc = "changeAttackTarget",
		overlayLimit = 1,
		id = 1800202,
		isShow = true,
		group = slot0[340],
		specialVal = slot0[341],
		specialTarget = slot0[36],
		triggerBehaviors = slot0[342],
		specialEffect = slot0[343]
	},
	[1800203] = {
		name = "闪光超级沙奈朵",
		time = 99,
		id = 1800203,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 4,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					},
					{
						{
							__size = 5,
							cfgId = 1800204,
							holder = 2,
							ignoreAura = 1,
							value = "math.floor(target:attack()*self:star()*0.5)",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							cfgId = 1800205,
							holder = 2,
							ignoreAura = 1,
							value = "math.floor(target:hpMax()*self:star()*0.5)",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and target:hasBuffGroup(135)"
				}
			},
			__size = 1
		}
	},
	[1800204] = {
		id = 1800204,
		name = "闪光超级沙奈朵",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1800205] = {
		id = 1800205,
		name = "闪光超级沙奈朵",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[1800300] = {
		name = "苍响",
		time = 99,
		id = 1800300,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1800301,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1800301] = {
		name = "苍响",
		time = 99,
		id = 1800301,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 15,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 1800302,
							value = "target:star()*trigger.healHp:get(1)",
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(csvSelectObj:star())",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1800302] = {
		name = "苍响",
		easyEffectFunc = "buffDamage",
		id = 1800302,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[1800400] = {
		name = "沙奈朵",
		time = 99,
		id = 1800400,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 18,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 1800401,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(1)",
								input = "enemyForce|nodead"
							}
						}
					},
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 1800402,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 5,
							prob = "self:getBuffOverlayCount(1800402)%(6-self:star())==0 and 1 or 0",
							cfgId = 1800403,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|buffDiffer('group',{135})|random(1)",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1800401] = {
		name = "沙奈朵",
		easyEffectFunc = "changeAttackTarget",
		overlayLimit = 1,
		id = 1800401,
		isShow = true,
		group = slot0[340],
		specialVal = slot0[341],
		specialTarget = slot0[36],
		triggerBehaviors = slot0[342],
		specialEffect = slot0[343]
	},
	[1800402] = {
		id = 1800402,
		name = "沙奈朵",
		overlayLimit = 99,
		overlayType = 2
	},
	[1800403] = {
		name = "沙奈朵",
		easyEffectFunc = "control",
		id = 1800403,
		overlayLimit = 1,
		overlayType = 1,
		group = {
			136
		},
		dispelBuff = slot0[340],
		dispelType = slot0[24]
	},
	[1800500] = {
		name = "奇鲁莉安",
		time = 99,
		id = 1800500,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 18,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 1800501,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(1)",
								input = "enemyForce|nodead"
							},
							value = {
								14002,
								0,
								0,
								{
									1800502
								}
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1800501] = {
		name = "奇鲁莉安",
		easyEffectFunc = "summon",
		id = 1800501,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[100],
		specialTarget = {
			__size = 2,
			process = "field|random(1)",
			input = "selfForce|nodead"
		}
	},
	[1800502] = {
		name = "奇鲁莉安",
		id = 1800502,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1800503,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1800504,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1800505,
							value = "self:star()*6",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1800506,
							value = "self:star()*6",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1800503] = {
		name = "奇鲁莉安",
		easyEffectFunc = "changeAttackTarget",
		overlayLimit = 1,
		id = 1800503,
		isShow = true,
		group = slot0[340],
		specialVal = slot0[341],
		specialTarget = slot0[36],
		triggerBehaviors = slot0[342],
		specialEffect = slot0[343]
	},
	[1800504] = {
		name = "奇鲁莉安",
		easyEffectFunc = "oneHitKill",
		id = 1800504,
		overlayLimit = 1,
		isShow = true,
		group = slot0[209],
		specialEffect = slot0[210]
	},
	[1800505] = {
		id = 1800505,
		name = "奇鲁莉安",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1800506] = {
		id = 1800506,
		name = "奇鲁莉安",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[1800600] = {
		name = "波克比",
		time = 99,
		id = 1800600,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1800601,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1800601] = {
		name = "波克比",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1800601,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1800602,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and (not target2:hasBuff(1800600)) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1800602] = {
		name = "波克比",
		time = 99,
		id = 1800602,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 15,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					},
					{
						{
							__size = 5,
							cfgId = 1800603,
							holder = 1,
							ignoreAura = 1,
							value = "math.floor(self:star()*0.5*trigger.healHp:get(1))",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							cfgId = 1800604,
							holder = 1,
							ignoreAura = 1,
							value = "math.floor(self:star()*0.5*trigger.healHp:get(1))",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1800603] = {
		id = 1800603,
		name = "波克比",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1800604] = {
		id = 1800604,
		name = "波克比",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[1800700] = {
		name = "花蓓蓓",
		time = 99,
		id = 1800700,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1800701,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1800701] = {
		name = "花蓓蓓",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		id = 1800701,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1800702,
							holder = 18,
							caster = 2,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1,
							value = {
								2,
								"1+self:star()*0.5"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1800702] = {
		easyEffectFunc = "beHealAdd",
		name = "花蓓蓓",
		time = 99,
		id = 1800702,
		overlayLimit = 99,
		overlayType = 2
	},
	[1800800] = {
		name = "胖可丁",
		time = 99,
		id = 1800800,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1800801,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1800801] = {
		name = "胖可丁",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		id = 1800801,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1800802,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and (not target2:hasBuff(1800800)) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1800802] = {
		name = "胖可丁",
		time = 99,
		id = 1800802,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 15,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					},
					{
						{
							__size = 5,
							cfgId = 1800803,
							holder = 1,
							ignoreAura = 1,
							value = "self:star()*3",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1800803] = {
		id = 1800803,
		name = "胖可丁",
		easyEffectFunc = "defence",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[73]
	},
	[1800900] = {
		name = "西狮海壬",
		time = 99,
		id = 1800900,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1800901,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1800901] = {
		name = "西狮海壬",
		time = 99,
		id = 1800901,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 13,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 1800902,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(csvSelectObj:star())",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1800902] = {
		name = "西狮海壬",
		easyEffectFunc = "changeAttackTarget",
		overlayLimit = 1,
		id = 1800902,
		isShow = true,
		group = slot0[340],
		specialVal = slot0[341],
		specialTarget = slot0[36],
		triggerBehaviors = slot0[342],
		specialEffect = slot0[343]
	},
	[1801000] = {
		name = "拉鲁拉斯",
		time = 99,
		id = 1801000,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1801001,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1801001] = {
		name = "拉鲁拉斯",
		time = 99,
		id = 1801001,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				triggerPoint = 204,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 1801002,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(csvSelectObj:star())",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1801002] = {
		name = "拉鲁拉斯",
		easyEffectFunc = "changeAttackTarget",
		overlayLimit = 1,
		id = 1801002,
		isShow = true,
		group = slot0[340],
		specialVal = slot0[341],
		specialTarget = slot0[36],
		triggerBehaviors = slot0[342],
		specialEffect = slot0[343]
	},
	[1801100] = {
		name = "胖甜妮",
		time = 99,
		id = 1801100,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1801101,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1801101] = {
		name = "胖甜妮",
		time = 99,
		id = 1801101,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 15,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1801102,
							value = "math.floor(self:star()*0.5*trigger.healHp:get(2))",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and more(trigger.healHp:get(2),0)"
				}
			},
			__size = 1
		}
	},
	[1801102] = {
		easyEffectFunc = "hpMax",
		name = "胖甜妮",
		time = 99,
		combineArgs = true,
		id = 1801102,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[1801200] = {
		name = "绵绵泡芙",
		time = 99,
		id = 1801200,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1801201,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1801201] = {
		name = "绵绵泡芙",
		time = 99,
		id = 1801201,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 10,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1801202,
							value = "self:star()",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1801203,
							value = "self:star()",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and target:hp()==target:hpMax()"
				}
			},
			__size = 1
		}
	},
	[1801202] = {
		easyEffectFunc = "attack",
		name = "绵绵泡芙",
		time = 99,
		combineArgs = true,
		id = 1801202,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[1801203] = {
		easyEffectFunc = "hpMax",
		name = "绵绵泡芙",
		time = 99,
		combineArgs = true,
		id = 1801203,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[1801300] = {
		name = "皮宝宝",
		time = 99,
		id = 1801300,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1801301,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1801302,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1801301] = {
		combineArgs = true,
		name = "皮宝宝",
		time = 99,
		easyEffectFunc = "protector",
		overlayLimit = 1,
		overlayType = 1,
		id = 1801301,
		isShow = true,
		group = slot0[200],
		specialEffect = slot0[201]
	},
	[1801302] = {
		name = "皮宝宝",
		time = 99,
		id = 1801302,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 13,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 1801303,
							value = "self:star()*3",
							caster = 2,
							holder = {
								__size = 2,
								process = "field|excludeID(list(csvSelectObj:id()))",
								input = "selfForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1801303] = {
		overlayType = 1,
		name = "皮宝宝",
		easyEffectFunc = "heal",
		id = 1801303,
		overlayLimit = 1,
		isShow = true,
		group = slot0[58],
		specialEffect = slot0[59]
	},
	[1801400] = {
		name = "露力丽",
		time = 99,
		id = 1801400,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1801401,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1801401] = {
		name = "露力丽",
		time = 99,
		id = 1801401,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 31,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 9,
							cfgId = 1801402,
							prob = "target2:hasNature(15) and 1 or 0",
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1801402] = {
		name = "露力丽",
		easyEffectFunc = "destroy",
		id = 1801402,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[65],
		triggerBehaviors = slot0[66]
	},
	[1801500] = {
		name = "魔尼尼",
		time = 99,
		id = 1801500,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1801501,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1801501] = {
		name = "魔尼尼",
		time = 99,
		id = 1801501,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 15,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1801502,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1801502] = {
		id = 1801502,
		name = "魔尼尼",
		easyEffectFunc = "divineShield",
		combineArgs = true,
		overlayLimit = 1,
		isShow = true,
		group = slot0[38],
		specialEffect = slot0[39]
	},
	[1801600] = {
		name = "捣蛋小妖",
		time = 99,
		id = 1801600,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1801601,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1801601] = {
		name = "捣蛋小妖",
		time = 99,
		id = 1801601,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 13,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 8,
							cfgId = 1801603,
							value = "self:star()",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1801602,
							value = "self:attack()",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1801602] = {
		overlayType = 1,
		name = "捣蛋小妖",
		easyEffectFunc = "heal",
		id = 1801602,
		overlayLimit = 1,
		isShow = true,
		group = slot0[58],
		specialEffect = slot0[59]
	},
	[1801603] = {
		name = "捣蛋小妖",
		id = 1801603,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 1801604,
							value = "min(target:attack(),self:star())",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1801605,
							value = "-self:star()",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1801604] = {
		id = 1801604,
		name = "捣蛋小妖",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1801605] = {
		id = 1801605,
		name = "捣蛋小妖",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[1801700] = {
		name = "蒂安希",
		time = 99,
		id = 1801700,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1801701,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1801701] = {
		combineArgs = true,
		name = "蒂安希",
		time = 99,
		easyEffectFunc = "protector",
		overlayLimit = 1,
		overlayType = 1,
		id = 1801701,
		isShow = true,
		group = slot0[200],
		specialEffect = slot0[201]
	},
	[1801702] = {
		name = "蒂安希",
		time = 99,
		id = 1801702,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1801703,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1801703] = {
		name = "蒂安希",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		id = 1801703,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1801704,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1801704] = {
		name = "蒂安希",
		time = 99,
		id = 1801704,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 13,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								2
							}
						}
					},
					{
						{
							__size = 5,
							cfgId = 1801705,
							ignoreAura = 1,
							value = "self:star()*3",
							caster = 2,
							holder = {
								__size = 2,
								process = "field|buffDiffer('group',{123})",
								input = "selfForce|nodead"
							}
						}
					},
					{
						{
							__size = 5,
							cfgId = 1801706,
							ignoreAura = 1,
							value = "self:star()*3",
							caster = 2,
							holder = {
								__size = 2,
								process = "field|buffDiffer('group',{123})",
								input = "selfForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField() and target:hasBuffGroup(123)"
				}
			},
			__size = 1
		}
	},
	[1801705] = {
		id = 1801705,
		name = "蒂安希",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1801706] = {
		id = 1801706,
		name = "蒂安希",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[100111] = {
		equipBond = true,
		time = 99,
		name = "吃剩的苹果 总",
		id = 100111,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 18,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100112,
							value = 10,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[100112] = {
		equipBond = true,
		name = "吃剩的苹果 总",
		easyEffectFunc = "heal",
		overlayLimit = 1,
		overlayType = 1,
		id = 100112,
		isShow = true,
		group = slot0[58],
		specialEffect = slot0[59]
	},
	[100211] = {
		equipBond = true,
		time = 99,
		name = "硬石头 总",
		id = 100211,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100212,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[100212] = {
		id = 100212,
		equipBond = true,
		time = 99,
		name = "硬石头 总",
		easyEffectFunc = "shieldEX",
		overlayLimit = 1,
		overlayType = 1,
		combineArgs = true,
		isShow = true,
		group = slot0[68],
		specialEffect = slot0[69]
	},
	[100311] = {
		equipBond = true,
		time = 99,
		name = "弹簧拳套总",
		id = 100311,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100312,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[100312] = {
		id = 100312,
		equipBond = true,
		time = 99,
		easyEffectFunc = "quickStrike",
		overlayLimit = 1,
		overlayType = 1,
		name = "弹簧拳套总",
		combineArgs = true,
		group = slot0[151],
		specialVal = {
			"more(holder:attack(),beAttacked:attack())"
		}
	},
	[100411] = {
		equipBond = true,
		time = 99,
		id = 100411,
		name = "金假牙",
		overlayLimit = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				triggerPoint = 204,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 100412,
							value = 1,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[100412] = {
		equipBond = true,
		name = "金假牙",
		easyEffectFunc = "gainGold",
		id = 100412,
		overlayLimit = 1,
		overlayType = 1
	},
	[100811] = {
		equipBond = true,
		time = 99,
		name = "泡沫奶油",
		id = 100811,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 5,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 100812,
							holder = 1,
							caster = 1,
							value = {
								2,
								1
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[100812] = {
		combineArgs = true,
		equipBond = true,
		easyEffectFunc = "stun",
		name = "泡沫奶油",
		overlayLimit = 1,
		overlayType = 1,
		id = 100812,
		isShow = true,
		group = slot0[43],
		specialEffect = slot0[44]
	},
	[100911] = {
		equipBond = true,
		time = 99,
		name = "力量护腕",
		id = 100911,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 17,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 100912,
							value = 2,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[100912] = {
		id = 100912,
		name = "力量护腕",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[101011] = {
		equipBond = true,
		time = 99,
		name = "灵界之布",
		id = 101011,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101012,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 33,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101012,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[101012] = {
		combineArgs = true,
		equipBond = true,
		easyEffectFunc = "stealth",
		name = "灵界之布",
		overlayLimit = 1,
		id = 101012,
		isShow = true,
		group = slot0[27],
		specialEffect = slot0[150]
	},
	[101111] = {
		equipBond = true,
		time = 99,
		name = "先制之爪",
		id = 101111,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 12,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101112,
							value = 3,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[101112] = {
		id = 101112,
		name = "先制之爪",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[101211] = {
		equipBond = true,
		time = 99,
		name = "焦点镜",
		id = 101211,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101212,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 33,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101212,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[101212] = {
		combineArgs = true,
		equipBond = true,
		easyEffectFunc = "strike",
		name = "焦点镜",
		overlayLimit = 1,
		overlayType = 1,
		id = 101212,
		isShow = true,
		group = slot0[23],
		specialEffect = slot0[33]
	},
	[101311] = {
		equipBond = true,
		time = 99,
		id = 101311,
		name = "熔岩增幅器",
		overlayLimit = 1,
		immuneBuff = slot0[111],
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101312,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 33,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101312,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[101312] = {
		combineArgs = true,
		equipBond = true,
		easyEffectFunc = "strike",
		name = "熔岩增幅器",
		overlayLimit = 1,
		overlayType = 1,
		id = 101312,
		isShow = true,
		group = slot0[23],
		specialEffect = slot0[33]
	},
	[101411] = {
		equipBond = true,
		time = 99,
		name = "王者之证",
		id = 101411,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 32,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 101412,
							holder = 9,
							caster = 1,
							value = {
								2,
								1
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[101412] = {
		combineArgs = true,
		equipBond = true,
		easyEffectFunc = "stun",
		name = "王者之证",
		overlayLimit = 1,
		overlayType = 1,
		id = 101412,
		isShow = true,
		group = slot0[43],
		specialEffect = slot0[44]
	},
	[101511] = {
		equipBond = true,
		time = 99,
		name = "心灵香草",
		id = 101511,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 16,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101512,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"hasIntersection(trigger:group(),list(119)) and target:inField()"
				}
			},
			__size = 1
		}
	},
	[101512] = {
		name = "心灵香草",
		equipBond = true,
		id = 101512,
		overlayLimit = 1,
		overlayType = 1,
		dispelBuff = slot0[43]
	},
	[101611] = {
		equipBond = true,
		time = 99,
		name = "黑带",
		id = 101611,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101612,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[101612] = {
		id = 101612,
		equipBond = true,
		time = 99,
		easyEffectFunc = "changeAttackTarget",
		overlayLimit = 1,
		overlayType = 1,
		name = "黑带",
		combineArgs = true,
		group = slot0[118],
		specialVal = slot0[4],
		specialTarget = slot0[178]
	},
	[101711] = {
		equipBond = true,
		time = 99,
		name = "不朽之剑",
		id = 101711,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 101712,
							caster = 1,
							bond = 1,
							value = {
								1
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 31,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101713,
							value = 3,
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101714,
							value = 3,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[101712] = {
		id = 101712,
		equipBond = true,
		time = 99,
		name = "不朽之剑",
		easyEffectFunc = "actionTimes",
		overlayLimit = 1,
		overlayType = 1,
		combineArgs = true,
		group = slot0[75]
	},
	[101713] = {
		id = 101713,
		name = "不朽之剑",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[101714] = {
		id = 101714,
		name = "不朽之剑",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[101811] = {
		equipBond = true,
		time = 99,
		name = "不朽之盾",
		id = 101811,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 101812,
							holder = 1,
							value = 0,
							caster = 1,
							bond = 1
						}
					},
					{
						{
							__size = 5,
							cfgId = 101813,
							holder = 1,
							value = 0,
							caster = 1,
							bond = 1
						}
					},
					{
						{
							__size = 5,
							cfgId = 101814,
							holder = 1,
							value = 0,
							caster = 1,
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 33,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 101812,
							holder = 1,
							value = 0,
							caster = 1,
							bond = 1
						}
					},
					{
						{
							__size = 5,
							cfgId = 101813,
							holder = 1,
							value = 0,
							caster = 1,
							bond = 1
						}
					},
					{
						{
							__size = 5,
							cfgId = 101814,
							holder = 1,
							value = 0,
							caster = 1,
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[101812] = {
		combineArgs = true,
		equipBond = true,
		easyEffectFunc = "divineShield",
		name = "不朽之盾",
		overlayLimit = 1,
		id = 101812,
		isShow = true,
		group = slot0[38],
		specialEffect = slot0[39]
	},
	[101813] = {
		id = 101813,
		equipBond = true,
		time = 99,
		name = "不朽之盾",
		easyEffectFunc = "protector",
		overlayLimit = 1,
		overlayType = 1,
		combineArgs = true,
		isShow = true,
		group = slot0[200],
		specialEffect = slot0[201]
	},
	[101814] = {
		id = 101814,
		equipBond = true,
		time = 99,
		name = "不朽之盾",
		easyEffectFunc = "thorn",
		overlayLimit = 1,
		overlayType = 1,
		combineArgs = true,
		group = slot0[65]
	},
	[101911] = {
		equipBond = true,
		time = 99,
		name = "精灵之笛",
		id = 101911,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 101912,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[101912] = {
		equipBond = true,
		easyEffectFunc = "specialAction",
		name = "精灵之笛",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 101912,
		triggerBehaviors = {
			[0] = {
				triggerPoint = 1,
				__size = 1
			},
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 101915,
							value = "-math.ceil(target:attack()*0.5)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 101913,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(1)",
								input = "enemyForce|nodead"
							},
							value = {
								2,
								1
							}
						}
					},
					{
						{
							__size = 5,
							holder = 6,
							cfgId = 101914,
							prob = "target2:hasBuffGroup(119) and 1 or 0",
							value = 5,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and more(target:attack(),0)"
				}
			},
			__size = 2
		}
	},
	[101913] = {
		combineArgs = true,
		equipBond = true,
		easyEffectFunc = "stun",
		name = "精灵之笛",
		overlayLimit = 1,
		overlayType = 1,
		id = 101913,
		isShow = true,
		group = slot0[43],
		specialEffect = slot0[44]
	},
	[101914] = {
		name = "精灵之笛",
		equipBond = true,
		easyEffectFunc = "buffDamage",
		id = 101914,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[101915] = {
		id = 101915,
		name = "精灵之笛",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[102011] = {
		equipBond = true,
		time = 99,
		name = "强力手环",
		id = 102011,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 102012,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[102012] = {
		id = 102012,
		equipBond = true,
		time = 99,
		easyEffectFunc = "quickStrike",
		overlayLimit = 1,
		overlayType = 1,
		name = "强力手环",
		combineArgs = true,
		group = slot0[151],
		specialVal = {
			"beAttacked:hasBuffGroup(119)"
		}
	},
	[102111] = {
		equipBond = true,
		time = 99,
		name = "极巨腕带",
		id = 102111,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 102112,
							value = "target:attack()",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 102113,
							value = "target:hpMax()",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[102112] = {
		id = 102112,
		equipBond = true,
		time = 99,
		name = "极巨腕带",
		easyEffectFunc = "attack",
		overlayLimit = 99,
		overlayType = 2,
		combineArgs = true,
		group = slot0[52]
	},
	[102113] = {
		id = 102113,
		equipBond = true,
		time = 99,
		name = "极巨腕带",
		easyEffectFunc = "hpMax",
		overlayLimit = 99,
		overlayType = 2,
		combineArgs = true,
		group = slot0[53]
	},
	[102211] = {
		equipBond = true,
		time = 99,
		name = "博士面具",
		id = 102211,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 102212,
							value = "target:attack()",
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 102213,
							value = "target:hpMax()",
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[102212] = {
		immuneType = 2,
		name = "博士面具",
		time = 99,
		equipBond = true,
		id = 102212,
		overlayLimit = 1,
		overlayType = 1,
		immuneBuff = {
			119,
			133
		}
	},
	[102311] = {
		equipBond = true,
		time = 99,
		name = "讲究眼镜",
		id = 102311,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 102312,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[102312] = {
		id = 102312,
		equipBond = true,
		time = 99,
		easyEffectFunc = "changeAttackTarget",
		overlayLimit = 1,
		overlayType = 1,
		name = "讲究眼镜",
		combineArgs = true,
		group = slot0[118],
		specialVal = slot0[4],
		specialTarget = {
			__size = 2,
			process = "field|near",
			input = "enemyForce|nodead"
		}
	},
	[102411] = {
		equipBond = true,
		time = 99,
		name = "探宝器",
		id = 102411,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 208,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 102412,
							holder = 3,
							caster = 1,
							value = {
								"c.allEvents()",
								1
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[102412] = {
		equipBond = true,
		name = "探宝器",
		easyEffectFunc = "getCard",
		id = 102412,
		overlayLimit = 1,
		overlayType = 1
	},
	[102511] = {
		equipBond = true,
		time = 99,
		name = "金属膜",
		id = 102511,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 102512,
							holder = 1,
							value = 0,
							caster = 1,
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 9,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 102513,
							value = 3,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[102512] = {
		id = 102512,
		equipBond = true,
		time = 99,
		name = "金属膜",
		easyEffectFunc = "protector",
		overlayLimit = 1,
		overlayType = 1,
		combineArgs = true,
		isShow = true,
		group = slot0[200],
		specialEffect = slot0[201]
	},
	[102513] = {
		easyEffectFunc = "defence",
		name = "金属膜",
		time = 99,
		combineArgs = true,
		id = 102513,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[62]
	},
	[102611] = {
		equipBond = true,
		time = 99,
		name = "球根",
		id = 102611,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 9,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 102612,
							value = 1,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[102612] = {
		easyEffectFunc = "hpMax",
		name = "球根",
		time = 99,
		combineArgs = true,
		id = 102612,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[102711] = {
		equipBond = true,
		time = 99,
		id = 102711,
		name = "诅咒之符",
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = slot0[409]
	},
	[102712] = {
		name = "诅咒之符",
		equipBond = true,
		easyEffectFunc = "oneHitKill",
		time = 99,
		overlayLimit = 1,
		id = 102712,
		isShow = true,
		group = slot0[209],
		specialEffect = slot0[210]
	},
	[102713] = {
		name = "诅咒之符",
		id = 102713,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 102714,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[102714] = {
		name = "诅咒之符",
		id = 102714,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = slot0[409]
	},
	[102811] = {
		equipBond = true,
		time = 99,
		name = "心之水滴",
		id = 102811,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 32,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 102812,
							value = 8,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:hp()==target:hpMax()"
				}
			},
			__size = 1
		}
	},
	[102812] = {
		id = 102812,
		name = "心之水滴",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[102911] = {
		equipBond = true,
		time = 99,
		name = "迅猛铃铛",
		id = 102911,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 102912,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[102912] = {
		equipBond = true,
		easyEffectFunc = "auraEffect",
		name = "迅猛铃铛",
		time = 99,
		overlayLimit = 1,
		overlayType = 1,
		id = 102912,
		combineArgs = true,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 102913,
							holder = 18,
							caster = 1,
							value = 0,
							prob = "(target2:team()==target:team()) and  1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[102913] = {
		equipBond = true,
		time = 99,
		name = "迅猛铃铛",
		id = 102913,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 231,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 102914,
							holder = 2,
							ignoreAura = 1,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"less(target:attack(),self:attack())"
				}
			},
			__size = 1
		}
	},
	[102914] = {
		id = 102914,
		name = "迅猛铃铛",
		easyEffectFunc = "newAction",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2
	},
	[103011] = {
		equipBond = true,
		time = 99,
		name = "坚固铃铛",
		id = 103011,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 103012,
							value = 0,
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 103015,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[103012] = {
		equipBond = true,
		easyEffectFunc = "auraEffect",
		name = "坚固铃铛",
		time = 99,
		overlayLimit = 1,
		overlayType = 1,
		id = 103012,
		combineArgs = true,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 103013,
							holder = 18,
							caster = 1,
							value = 0,
							prob = "(target2:team()==target:team()) and  1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[103013] = {
		equipBond = true,
		time = 99,
		name = "坚固铃铛",
		id = 103013,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 231,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 103014,
							holder = 2,
							ignoreAura = 1,
							value = 8,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"less(target:attack(),self:attack())"
				}
			},
			__size = 1
		}
	},
	[103014] = {
		id = 103014,
		name = "坚固铃铛",
		easyEffectFunc = "defence",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[73]
	},
	[103015] = {
		id = 103015,
		equipBond = true,
		time = 99,
		name = "坚固铃铛",
		easyEffectFunc = "shieldEX",
		overlayLimit = 1,
		overlayType = 1,
		combineArgs = true,
		isShow = true,
		group = slot0[68],
		specialEffect = slot0[69]
	},
	[103111] = {
		equipBond = true,
		time = 99,
		name = "羁绊铃铛",
		id = 103111,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 103112,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[103112] = {
		equipBond = true,
		easyEffectFunc = "auraEffect",
		name = "羁绊铃铛",
		time = 99,
		overlayLimit = 1,
		overlayType = 1,
		id = 103112,
		combineArgs = true,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 103113,
							holder = 18,
							caster = 1,
							value = 0,
							prob = "(target2:team()==target:team()) and  1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[103113] = {
		equipBond = true,
		time = 99,
		name = "羁绊铃铛",
		id = 103113,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 231,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 103114,
							holder = 2,
							ignoreAura = 1,
							value = 5,
							caster = 2
						}
					},
					{
						{
							__size = 5,
							cfgId = 103114,
							holder = 1,
							ignoreAura = 1,
							value = 5,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"less(target:attack(),self:attack())"
				}
			},
			__size = 1
		}
	},
	[103114] = {
		id = 103114,
		name = "羁绊铃铛",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[103211] = {
		equipBond = true,
		time = 99,
		id = 103211,
		name = "混元之石",
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				triggerPoint = 204,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 103212,
							value = 10,
							caster = 1,
							holder = {
								__size = 2,
								process = "field|random(1)",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[103212] = {
		name = "混元之石",
		equipBond = true,
		easyEffectFunc = "buffDamage",
		id = 103212,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[103311] = {
		equipBond = true,
		time = 99,
		name = "气势头带",
		id = 103311,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 4,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 103312,
							holder = 1,
							caster = 1,
							value = {
								"target:unitID()",
								"target:star()",
								0,
								{}
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[103312] = {
		name = "气势头带",
		equipBond = true,
		easyEffectFunc = "summon",
		id = 103312,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[100]
	},
	[103411] = {
		equipBond = true,
		time = 99,
		name = "宝石手镯",
		id = 103411,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 103412,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[103412] = {
		equipBond = true,
		easyEffectFunc = "specialAction",
		name = "宝石手镯",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 103412,
		triggerBehaviors = {
			[0] = {
				triggerPoint = 1,
				__size = 1
			},
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 103413,
							value = "-math.ceil(target:attack()*0.5)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 103414,
							value = 5,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(1)",
								input = "enemyForce|nodead"
							}
						}
					},
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 103415,
							value = 1,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and more(target:attack(),0)"
				}
			},
			__size = 2
		}
	},
	[103413] = {
		id = 103413,
		name = "宝石手镯",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[103414] = {
		name = "宝石手镯",
		equipBond = true,
		easyEffectFunc = "buffDamage",
		id = 103414,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[103415] = {
		equipBond = true,
		name = "宝石手镯",
		easyEffectFunc = "gainGold",
		id = 103415,
		overlayLimit = 1,
		overlayType = 1
	},
	[103511] = {
		equipBond = true,
		time = 99,
		name = "高能护腕",
		id = 103511,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 10,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 103512,
							value = 0,
							caster = 1,
							holder = {
								__size = 2,
								process = "field|excludeID(list(csvSelectObj:id()))|random(1)",
								input = "selfForce|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[103512] = {
		equipBond = true,
		name = "高能护腕",
		id = 103512,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 103513,
							value = "target:attack()",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 103514,
							value = "target:shield()",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 103515,
							value = "target:hp()",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 103516,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[103513] = {
		id = 103513,
		name = "高能护腕",
		easyEffectFunc = "attack",
		equipBond = true,
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[103514] = {
		id = 103514,
		name = "高能护腕",
		easyEffectFunc = "defence",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[73]
	},
	[103515] = {
		id = 103515,
		name = "高能护腕",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[103516] = {
		id = 103516,
		name = "高能护腕",
		easyEffectFunc = "destroy",
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[65]
	},
	[103611] = {
		equipBond = true,
		time = 99,
		name = "饱腹熏香",
		id = 103611,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 32,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 103612,
							value = 8,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:hp()==target:hpMax()"
				}
			},
			__size = 1
		}
	},
	[103612] = {
		id = 103612,
		name = "饱腹熏香",
		easyEffectFunc = "defence",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[73]
	},
	[103711] = {
		equipBond = true,
		time = 99,
		name = "讲究头带",
		id = 103711,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 103712,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[103712] = {
		id = 103712,
		equipBond = true,
		time = 99,
		easyEffectFunc = "changeAttackTarget",
		overlayLimit = 1,
		overlayType = 1,
		name = "讲究头带",
		combineArgs = true,
		group = slot0[118],
		specialVal = slot0[4],
		specialTarget = slot0[11]
	},
	[103811] = {
		equipBond = true,
		time = 99,
		name = "柔软沙子",
		id = 103811,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 12,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 8,
							cfgId = 103812,
							value = -5,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[103812] = {
		id = 103812,
		name = "柔软沙子",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[103911] = {
		equipBond = true,
		time = 99,
		name = "丝绸围巾",
		id = 103911,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 208,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 103912,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[103912] = {
		name = "丝绸围巾",
		easyEffectFunc = "backToHand",
		id = 103912,
		overlayLimit = 1,
		overlayType = 1
	},
	[104011] = {
		equipBond = true,
		time = 99,
		name = "龙之牙",
		id = 104011,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 31,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 9,
							cfgId = 104012,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[104012] = {
		name = "龙之牙",
		id = 104012,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 13,
							cfgId = 104013,
							value = "math.floor(self:attack()*0.5)",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[104013] = {
		name = "龙之牙",
		easyEffectFunc = "buffDamage",
		id = 104013,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[104111] = {
		equipBond = true,
		time = 99,
		name = "力量负重",
		id = 104111,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 5,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 104112,
							holder = 1,
							caster = 1,
							value = {
								2,
								1
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[104112] = {
		equipBond = true,
		easyEffectFunc = "stun",
		name = "力量负重",
		id = 104112,
		overlayLimit = 1,
		overlayType = 1,
		combineArgs = true,
		isShow = true,
		group = slot0[43],
		triggerBehaviors = {
			[0] = {
				triggerPoint = 1,
				__size = 1
			},
			{
				__size = 3,
				triggerPoint = 2,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 104113,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 104114,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 2
		},
		specialEffect = slot0[44]
	},
	[104113] = {
		combineArgs = true,
		equipBond = true,
		easyEffectFunc = "strike",
		name = "力量负重",
		overlayLimit = 1,
		overlayType = 1,
		id = 104113,
		isShow = true,
		group = slot0[23],
		specialEffect = slot0[33]
	},
	[104114] = {
		id = 104114,
		name = "力量负重",
		easyEffectFunc = "penetrate",
		equipBond = true,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[120]
	},
	[104211] = {
		equipBond = true,
		time = 99,
		name = "奇异熏香",
		id = 104211,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 104212,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[104212] = {
		equipBond = true,
		easyEffectFunc = "specialAction",
		name = "奇异熏香",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 104212,
		triggerBehaviors = {
			[0] = {
				triggerPoint = 1,
				__size = 1
			},
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 104213,
							value = "-math.ceil(target:attack()*0.5)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 104214,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(1)",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField() and more(target:attack(),0)"
				}
			},
			__size = 2
		}
	},
	[104213] = {
		id = 104213,
		name = "奇异熏香",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[104214] = {
		combineArgs = true,
		name = "奇异熏香",
		overlayLimit = 1,
		overlayType = 1,
		immuneType = 2,
		id = 104214,
		isShow = true,
		group = {
			142
		},
		immuneBuff = {
			13,
			23,
			127
		},
		specialEffect = {
			[0] = 1014,
			__size = 1
		}
	},
	[104311] = {
		equipBond = true,
		time = 99,
		id = 104311,
		name = "神隐王冠",
		overlayLimit = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 205,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 4,
							cfgId = 104312,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				__size = 3,
				triggerPoint = 204,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 4,
							cfgId = 104312,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 2
		}
	},
	[104312] = {
		id = 104312,
		name = "神隐王冠",
		easyEffectFunc = "stealth",
		combineArgs = true,
		overlayLimit = 1,
		isShow = true,
		group = slot0[27],
		specialEffect = slot0[150]
	},
	[104411] = {
		equipBond = true,
		time = 99,
		name = "鬼手拳套",
		id = 104411,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 104412,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				__size = 3,
				triggerPoint = 6,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 104413,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 2
		}
	},
	[104412] = {
		id = 104412,
		equipBond = true,
		time = 99,
		easyEffectFunc = "quickStrike",
		overlayLimit = 1,
		overlayType = 1,
		name = "鬼手拳套",
		combineArgs = true,
		group = slot0[151],
		specialVal = slot0[152]
	},
	[104413] = {
		id = 104413,
		name = "鬼手拳套",
		easyEffectFunc = "stealth",
		combineArgs = true,
		overlayLimit = 1,
		isShow = true,
		group = slot0[27],
		specialEffect = slot0[150]
	},
	[104511] = {
		equipBond = true,
		time = 99,
		name = "痛苦面具",
		id = 104511,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 104512,
							value = 0,
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 104515,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[104512] = {
		equipBond = true,
		easyEffectFunc = "specialAction",
		name = "痛苦面具",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 104512,
		triggerBehaviors = {
			[0] = {
				triggerPoint = 1,
				__size = 1
			},
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 104513,
							value = "-math.ceil(target:attack()*0.5)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 104514,
							value = 1,
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "all|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField() and more(target:attack(),0)"
				}
			},
			__size = 2
		}
	},
	[104513] = {
		id = 104513,
		name = "痛苦面具",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[104514] = {
		id = 104514,
		name = "痛苦面具",
		easyEffectFunc = "broken",
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[182]
	},
	[104515] = {
		equipBond = true,
		easyEffectFunc = "auraEffect",
		name = "痛苦面具",
		time = 99,
		overlayLimit = 1,
		overlayType = 1,
		id = 104515,
		combineArgs = true,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 104516,
							holder = 18,
							caster = 1,
							value = 0,
							prob = 1,
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[104516] = {
		id = 104516,
		name = "痛苦面具",
		time = 99,
		immuneBuff = {
			100021
		}
	},
	[104611] = {
		equipBond = true,
		time = 99,
		name = "混沌魔方球",
		id = 104611,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 104612,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[104612] = {
		equipBond = true,
		easyEffectFunc = "specialAction",
		name = "混沌魔方球",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 104612,
		triggerBehaviors = {
			[0] = {
				triggerPoint = 1,
				__size = 1
			},
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 104613,
							value = 100,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(1)",
								input = "enemyForce|nodead"
							}
						}
					},
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 104613,
							value = 100,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and more(target:attack(),0)"
				}
			},
			__size = 2
		}
	},
	[104613] = {
		name = "混沌魔方球",
		equipBond = true,
		easyEffectFunc = "buffDamage",
		id = 104613,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[104711] = {
		equipBond = true,
		time = 99,
		name = "气势被带",
		id = 104711,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 4,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 104712,
							holder = 1,
							caster = 1,
							value = {
								"target:unitID()",
								1,
								0,
								{}
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[104712] = {
		name = "气势被带",
		equipBond = true,
		easyEffectFunc = "summon",
		id = 104712,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[100]
	},
	[104811] = {
		equipBond = true,
		time = 99,
		name = "太阳之笛",
		id = 104811,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 17,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 4,
							cfgId = 104812,
							value = "math.ceil(target:hp()/countObj(\"all\",1))",
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[104812] = {
		id = 104812,
		name = "太阳之笛",
		easyEffectFunc = "defence",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[73]
	},
	[104911] = {
		equipBond = true,
		time = 99,
		name = "月亮之笛",
		id = 104911,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 104912,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[104912] = {
		equipBond = true,
		easyEffectFunc = "specialAction",
		name = "月亮之笛",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 104912,
		triggerBehaviors = {
			[0] = {
				triggerPoint = 1,
				__size = 1
			},
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 104919,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(1)",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField() and more(target:attack(),0)"
				}
			},
			__size = 2
		}
	},
	[104913] = {
		equipBond = true,
		name = "月亮之笛",
		id = 104913,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 104915,
							value = "min(target:hp(),5)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 104914,
							value = -5,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[104914] = {
		id = 104914,
		name = "月亮之笛",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[254]
	},
	[104915] = {
		id = 104915,
		name = "月亮之笛",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[104916] = {
		equipBond = true,
		name = "月亮之笛",
		id = 104916,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 104918,
							value = "min(target:attack(),5)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 104917,
							value = -5,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[104917] = {
		id = 104917,
		name = "月亮之笛",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[104918] = {
		id = 104918,
		name = "月亮之笛",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[104919] = {
		equipBond = true,
		name = "月亮之笛",
		id = 104919,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 104913,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 104916,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[105011] = {
		equipBond = true,
		time = 99,
		name = "葛拉西蒂亚花",
		id = 105011,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 105012,
							value = "target:hp()-target:attack()",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and target:attack()~=target:hp()"
				}
			},
			{
				triggerPoint = 14,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 105012,
							value = "target:hp()-target:attack()",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and target:attack()~=target:hp()"
				}
			},
			{
				triggerPoint = 15,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 105012,
							value = "target:hp()-target:attack()",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and target:attack()~=target:hp()"
				}
			},
			{
				triggerPoint = 16,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 105012,
							value = "target:hp()-target:attack()",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and hasIntersection(trigger:group(),list(27,17,13,23)) and target:attack()~=target:hp()"
				}
			},
			{
				triggerPoint = 33,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 105012,
							value = "target:hp()-target:attack()",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField() and target:attack()~=target:hp()"
				}
			},
			__size = 5
		}
	},
	[105012] = {
		id = 105012,
		name = "葛拉西蒂亚花",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2
	},
	[105111] = {
		equipBond = true,
		time = 99,
		name = "金腰带",
		id = 105111,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 7,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 105112,
							value = 5,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 105113,
							value = 5,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 8,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 105114,
							value = -10,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 105115,
							value = -10,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[105112] = {
		id = 105112,
		name = "金腰带",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[105113] = {
		id = 105113,
		name = "金腰带",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[105114] = {
		id = 105114,
		name = "金腰带",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[295]
	},
	[105115] = {
		id = 105115,
		name = "金腰带",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[293]
	},
	[105211] = {
		equipBond = true,
		time = 99,
		name = "神秘项链",
		id = 105211,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 205,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 105212,
							holder = 13,
							caster = 1,
							value = {
								"list(3)",
								1
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[105212] = {
		name = "神秘项链",
		easyEffectFunc = "forceTrigger",
		id = 105212,
		overlayLimit = 1,
		overlayType = 1
	},
	[500001] = {
		name = "钢铁之盾",
		id = 500001,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 500002,
							value = 8,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[500002] = {
		easyEffectFunc = "defence",
		name = "钢铁之盾",
		time = 99,
		combineArgs = true,
		id = 500002,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[62]
	},
	[500101] = {
		name = "坚钢之力",
		time = 99,
		id = 500101,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 9,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 500002,
							value = 1,
							caster = 2,
							bond = 1,
							holder = {
								__size = 2,
								process = "field|attrDiffer('natureType', {17})",
								input = "selfForce|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[500102] = {
		easyEffectFunc = "defence",
		name = "坚钢之力",
		time = 99,
		combineArgs = true,
		id = 500102,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[62]
	},
	[500201] = {
		name = "星夜祈愿",
		id = 500201,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 500202,
							holder = 3,
							caster = 2,
							value = {
								100001,
								100002,
								100003
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[500202] = {
		name = "星夜祈愿",
		easyEffectFunc = "find",
		id = 500202,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[461]
	},
	[500301] = {
		name = "改造之锤",
		id = 500301,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 500302,
							caster = 2,
							bond = 1,
							value = {
								"randomChoose(c.allCards())",
								"target:star()",
								0,
								2,
								0
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[500302] = {
		name = "改造之锤",
		easyEffectFunc = "permanentTransform",
		id = 500302,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[20]
	},
	[500401] = {
		name = "回收装置",
		id = 500401,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 500402,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[500402] = {
		name = "回收装置",
		easyEffectFunc = "backToHand",
		id = 500402,
		overlayLimit = 1,
		overlayType = 1
	},
	[500501] = {
		name = "量身定制",
		id = 500501,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 500502,
							holder = 1,
							caster = 2,
							value = {
								2
							}
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 1,
							caster = 2,
							value = {
								3
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[500502] = {
		name = "量身定制",
		easyEffectFunc = "setEquipSlots",
		id = 500502,
		overlayLimit = 1,
		overlayType = 1
	},
	[500601] = {
		name = "团结一心",
		time = 99,
		id = 500601,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 500602,
							holder = 4,
							value = 0,
							caster = 2,
							bond = 1
						}
					},
					{
						{
							__size = 5,
							cfgId = 500603,
							holder = 4,
							value = "1*countObj(\"all\",target:team())",
							caster = 2,
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[500602] = {
		name = "团结一心",
		id = 500602,
		overlayLimit = 1,
		overlayType = 1,
		group = {
			500602
		}
	},
	[500603] = {
		id = 500603,
		name = "团结一心",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[500701] = {
		name = "除虫喷雾",
		id = 500701,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 6,
							cfgId = 500702,
							value = 8,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[500702] = {
		name = "除虫喷雾",
		easyEffectFunc = "buffDamage",
		id = 500702,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[4],
		specialVal = slot0[468]
	},
	[500801] = {
		name = "虚弱喷雾",
		id = 500801,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 500802,
							value = 0,
							caster = 2,
							bond = 1,
							holder = {
								__size = 2,
								process = "field|random(1)",
								input = "enemyForce|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[500802] = {
		name = "虚弱喷雾",
		id = 500802,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 500803,
							value = "-math.ceil(target2:attack()*0.5)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 500804,
							holder = 1,
							caster = 2,
							value = {
								2,
								1
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[500803] = {
		id = 500803,
		name = "虚弱喷雾",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[500804] = {
		combineArgs = true,
		name = "虚弱喷雾",
		easyEffectFunc = "stun",
		overlayLimit = 1,
		overlayType = 1,
		id = 500804,
		isShow = true,
		group = slot0[43],
		specialEffect = slot0[44]
	},
	[500901] = {
		name = "防护装置",
		time = 99,
		id = 500901,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 500902,
							holder = 4,
							caster = 2,
							value = {
								2
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[500902] = {
		name = "防护装置",
		easyEffectFunc = "reduceTakeDamage",
		id = 500902,
		overlayLimit = 99,
		overlayType = 2
	},
	[501001] = {
		name = "神奇糖果",
		id = 501001,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 501002,
							holder = 1,
							caster = 2,
							value = {
								2
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[501002] = {
		name = "神奇糖果",
		easyEffectFunc = "setStar",
		id = 501002,
		overlayLimit = 1,
		overlayType = 1
	},
	[501101] = {
		name = "巨化喷雾",
		id = 501101,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 501102,
							value = "target2:hpMax()",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[501102] = {
		easyEffectFunc = "hpMax",
		name = "巨化喷雾",
		time = 99,
		combineArgs = true,
		id = 501102,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[501201] = {
		name = "硬化喷雾",
		id = 501201,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 501202,
							value = "target2:defence()",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[501202] = {
		easyEffectFunc = "defence",
		name = "硬化喷雾",
		time = 99,
		combineArgs = true,
		id = 501202,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[62]
	},
	[501301] = {
		name = "强化喷雾",
		id = 501301,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 501302,
							value = "target2:attack()",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[501302] = {
		easyEffectFunc = "attack",
		name = "强化喷雾",
		time = 99,
		combineArgs = true,
		id = 501302,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[501401] = {
		name = "贵重球",
		id = 501401,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 501402,
							value = "c.cards4_cards5_cards6()",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[501402] = {
		name = "贵重球",
		easyEffectFunc = "find",
		id = 501402,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[461]
	},
	[501501] = {
		name = "精灵球",
		id = 501501,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 501502,
							value = "c.cards2_cards3()",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[501502] = {
		name = "精灵球",
		easyEffectFunc = "find",
		id = 501502,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[461]
	},
	[501601] = {
		name = "黄金宝箱",
		id = 501601,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 501602,
							value = "c.equips4_equips5_equips6()",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[501602] = {
		name = "黄金宝箱",
		easyEffectFunc = "find",
		id = 501602,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[461]
	},
	[501701] = {
		name = "木制宝箱",
		id = 501701,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 501702,
							value = "c.equips2_equips3()",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[501702] = {
		name = "木制宝箱",
		easyEffectFunc = "find",
		id = 501702,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[461]
	},
	[501801] = {
		name = "预言之书",
		time = 2,
		id = 501801,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 7,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 501802,
							value = 6,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[501802] = {
		name = "预言之书",
		easyEffectFunc = "gainGold",
		id = 501802,
		overlayLimit = 99,
		overlayType = 2
	},
	[501901] = {
		name = "讨价还价",
		id = 501901,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 501902,
							holder = 1,
							caster = 2,
							value = {
								-1
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[501902] = {
		name = "讨价还价",
		easyEffectFunc = "sell",
		id = 501902,
		overlayLimit = 99,
		overlayType = 2
	},
	[502001] = {
		name = "理财能手",
		id = 502001,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 502002,
							value = "math.floor(getGoldNum()/5)",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[502002] = {
		name = "理财能手",
		easyEffectFunc = "gainGold",
		id = 502002,
		overlayLimit = 99,
		overlayType = 2
	},
	[502101] = {
		name = "营地休整",
		id = 502101,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 502102,
							value = 6,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[502102] = {
		name = "营地休整",
		easyEffectFunc = "changeTrainerHp",
		id = 502102,
		overlayLimit = 99,
		overlayType = 2
	},
	[502201] = {
		name = "离洞绳",
		id = 502201,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 502202,
							holder = 3,
							caster = 2,
							value = {
								999
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[502202] = {
		name = "离洞绳",
		easyEffectFunc = "reduceTrainerTakeDamage",
		id = 502202,
		overlayLimit = 99,
		overlayType = 2
	},
	[502301] = {
		name = "爱心便当",
		id = 502301,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 502302,
							value = 3,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[502302] = {
		name = "爱心便当",
		easyEffectFunc = "changeTrainerHp",
		id = 502302,
		overlayLimit = 99,
		overlayType = 2
	},
	[502401] = {
		name = "神奇药水",
		id = 502401,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 502402,
							value = 5,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[502402] = {
		easyEffectFunc = "hpMax",
		name = "神奇药水",
		time = 99,
		combineArgs = true,
		id = 502402,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[502501] = {
		name = "神奇药水",
		id = 502501,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 502502,
							value = 5,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[502502] = {
		easyEffectFunc = "defence",
		name = "神奇药水",
		time = 99,
		combineArgs = true,
		id = 502502,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[62]
	},
	[502601] = {
		name = "神奇药水",
		id = 502601,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 502602,
							value = 5,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[502602] = {
		easyEffectFunc = "attack",
		name = "神奇药水",
		time = 99,
		combineArgs = true,
		id = 502602,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[502701] = {
		name = "神奇药水",
		id = 502701,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 502702,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[502702] = {
		id = 502702,
		name = "神奇药水",
		easyEffectFunc = "stealth",
		combineArgs = true,
		overlayLimit = 1,
		isShow = true,
		group = slot0[27],
		specialEffect = slot0[150]
	},
	[502801] = {
		name = "神奇药水",
		id = 502801,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 502802,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[502802] = {
		id = 502802,
		name = "神奇药水",
		easyEffectFunc = "divineShield",
		combineArgs = true,
		overlayLimit = 1,
		isShow = true,
		group = slot0[38],
		specialEffect = slot0[39]
	},
	[502901] = {
		name = "神奇药水",
		id = 502901,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 502902,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[502902] = {
		combineArgs = true,
		name = "神奇药水",
		easyEffectFunc = "strike",
		overlayLimit = 1,
		overlayType = 1,
		id = 502902,
		isShow = true,
		group = slot0[23],
		specialEffect = slot0[33]
	},
	[503001] = {
		name = "神奇药水",
		id = 503001,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 503002,
							value = 50,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[503002] = {
		id = 503002,
		name = "神奇药水",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[503101] = {
		name = "神奇药水",
		id = 503101,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 503102,
							value = 50,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[503102] = {
		id = 503102,
		name = "神奇药水",
		easyEffectFunc = "defence",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[73]
	},
	[503201] = {
		name = "神奇药水",
		id = 503201,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 503202,
							value = 50,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[503202] = {
		id = 503202,
		name = "神奇药水",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[503301] = {
		name = "神奇药水",
		id = 503301,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 503302,
							value = 6,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[503302] = {
		name = "神奇药水",
		easyEffectFunc = "changeTrainerHp",
		id = 503302,
		overlayLimit = 99,
		overlayType = 2
	},
	[510301] = {
		name = "强化·改造之锤",
		id = 510301,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 510302,
							value = 0,
							caster = 1,
							bond = 1,
							holder = {
								__size = 2,
								process = "field",
								input = "selfForce|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[510302] = {
		name = "强化·改造之锤",
		id = 510302,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 510303,
							caster = 2,
							bond = 1,
							value = {
								"randomChoose(c.allCards())",
								"target:star()",
								0,
								2,
								0
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[510303] = {
		name = "强化·改造之锤",
		easyEffectFunc = "permanentTransform",
		id = 510303,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[20]
	},
	[510401] = {
		name = "强化·回收装置",
		id = 510401,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 4,
							cfgId = 510402,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[510402] = {
		name = "强化·回收装置",
		easyEffectFunc = "backToHand",
		id = 510402,
		overlayLimit = 1,
		overlayType = 1
	},
	[510511] = {
		name = "强化·量身定制",
		id = 510511,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 510502,
							holder = 4,
							caster = 1,
							value = {
								2
							}
						}
					},
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 4,
							caster = 1,
							value = {
								3
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[510502] = {
		name = "强化·量身定制",
		easyEffectFunc = "setEquipSlots",
		id = 510502,
		overlayLimit = 1,
		overlayType = 1
	},
	[510601] = {
		name = "强化·团结一心",
		time = 99,
		id = 510601,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 510602,
							holder = 4,
							value = 0,
							caster = 2,
							bond = 1
						}
					},
					{
						{
							__size = 5,
							cfgId = 510603,
							holder = 4,
							value = "4*countObj(\"all\",target:team())",
							caster = 2,
							bond = 1
						}
					},
					{
						{
							__size = 5,
							cfgId = 510604,
							holder = 4,
							value = "4*countObj(\"all\",target:team())",
							caster = 2,
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[510602] = {
		name = "强化·团结一心",
		id = 510602,
		overlayLimit = 1,
		overlayType = 1,
		group = {
			510602
		}
	},
	[510603] = {
		id = 510603,
		name = "强化·团结一心",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[510604] = {
		id = 510604,
		name = "强化·团结一心",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[510701] = {
		name = "强化·除虫喷雾",
		id = 510701,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 6,
							cfgId = 510702,
							value = 8,
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 6,
							cfgId = 510702,
							value = 8,
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 6,
							cfgId = 510702,
							value = 8,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[510702] = {
		name = "强化·除虫喷雾",
		easyEffectFunc = "buffDamage",
		id = 510702,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[4],
		specialVal = slot0[468]
	},
	[510801] = {
		name = "强化·虚弱喷雾",
		id = 510801,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 510802,
							value = 0,
							caster = 2,
							bond = 1,
							holder = {
								__size = 2,
								process = "field",
								input = "enemyForce|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[510802] = {
		name = "强化·虚弱喷雾",
		id = 510802,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 510803,
							value = "-math.ceil(target2:attack()*0.5)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							cfgId = 510804,
							holder = 1,
							caster = 2,
							value = {
								2,
								1
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[510803] = {
		id = 510803,
		name = "强化·虚弱喷雾",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[510804] = {
		combineArgs = true,
		name = "强化·虚弱喷雾",
		easyEffectFunc = "stun",
		overlayLimit = 1,
		overlayType = 1,
		id = 510804,
		isShow = true,
		group = slot0[43],
		specialEffect = slot0[44]
	},
	[510901] = {
		name = "强化·防护装置",
		time = 99,
		id = 510901,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 510902,
							holder = 4,
							caster = 2,
							value = {
								6
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[510902] = {
		name = "强化·防护装置",
		easyEffectFunc = "reduceTakeDamage",
		id = 510902,
		overlayLimit = 99,
		overlayType = 2
	},
	[511001] = {
		name = "强化·神奇糖果",
		id = 511001,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 4,
							cfgId = 511002,
							prob = "target2:star()==1 and 1 or 0",
							caster = 2,
							value = {
								2
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[511002] = {
		name = "强化·神奇糖果",
		easyEffectFunc = "setStar",
		id = 511002,
		overlayLimit = 1,
		overlayType = 1
	},
	[511101] = {
		name = "强化·巨化喷雾",
		id = 511101,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 4,
							cfgId = 511102,
							value = "target2:hpMax()",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[511102] = {
		easyEffectFunc = "hpMax",
		name = "强化·巨化喷雾",
		time = 99,
		combineArgs = true,
		id = 511102,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[511201] = {
		name = "强化·硬化喷雾",
		id = 511201,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 4,
							cfgId = 511202,
							value = "target2:defence()",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[511202] = {
		easyEffectFunc = "defence",
		name = "强化·硬化喷雾",
		time = 99,
		combineArgs = true,
		id = 511202,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[62]
	},
	[511301] = {
		name = "强化·强化喷雾",
		id = 511301,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 4,
							cfgId = 511302,
							value = "target2:attack()",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[511302] = {
		easyEffectFunc = "attack",
		name = "强化·强化喷雾",
		time = 99,
		combineArgs = true,
		id = 511302,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[511401] = {
		name = "强化·贵重球",
		id = 511401,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 511402,
							value = "c.cards6()",
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[511402] = {
		name = "强化·贵重球",
		easyEffectFunc = "find",
		id = 511402,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[461]
	},
	[511511] = {
		name = "强化·精灵球",
		id = 511511,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 511502,
							value = "c.allCards()",
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 511502,
							value = "c.allCards()",
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[511502] = {
		name = "强化·精灵球",
		easyEffectFunc = "find",
		id = 511502,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[461]
	},
	[511601] = {
		name = "强化·黄金宝箱",
		id = 511601,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 511602,
							value = "c.equips6()",
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[511602] = {
		name = "强化·黄金宝箱",
		easyEffectFunc = "find",
		id = 511602,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[461]
	},
	[511701] = {
		name = "强化·木制宝箱",
		id = 511701,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 511702,
							value = "c.allEquips()",
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 511702,
							value = "c.allEquips()",
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[511702] = {
		name = "强化·木制宝箱",
		easyEffectFunc = "find",
		id = 511702,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[461]
	},
	[511801] = {
		name = "强化·预言之书",
		time = 4,
		id = 511801,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 7,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 511802,
							value = 8,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[511802] = {
		name = "强化·预言之书",
		easyEffectFunc = "gainGold",
		id = 511802,
		overlayLimit = 99,
		overlayType = 2
	},
	[511901] = {
		name = "强化·讨价还价",
		id = 511901,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 511902,
							holder = 4,
							caster = 1,
							value = {
								4
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[511902] = {
		name = "强化·讨价还价",
		easyEffectFunc = "sell",
		id = 511902,
		overlayLimit = 99,
		overlayType = 2
	},
	[512001] = {
		name = "强化·理财能手",
		id = 512001,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 512002,
							value = "getGoldNum()",
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[512002] = {
		name = "强化·理财能手",
		easyEffectFunc = "gainGold",
		id = 512002,
		overlayLimit = 99,
		overlayType = 2
	},
	[512101] = {
		name = "强化·营地休整",
		id = 512101,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 512102,
							value = 6,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 4,
							cfgId = 512103,
							value = 10,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[512102] = {
		name = "强化·营地休整",
		easyEffectFunc = "changeTrainerHp",
		id = 512102,
		overlayLimit = 99,
		overlayType = 2
	},
	[512103] = {
		easyEffectFunc = "hpMax",
		name = "强化·营地休整",
		time = 99,
		combineArgs = true,
		id = 512103,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[512201] = {
		name = "强化·离洞绳",
		time = 3,
		id = 512201,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 512202,
							holder = 3,
							caster = 2,
							value = {
								999
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[512202] = {
		easyEffectFunc = "reduceTrainerTakeDamage",
		name = "强化·离洞绳",
		time = 3,
		id = 512202,
		overlayLimit = 99,
		overlayType = 2
	},
	[520001] = {
		easyEffectFunc = "attack",
		name = "生长加攻击",
		time = 99,
		combineArgs = true,
		id = 520001,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[520002] = {
		easyEffectFunc = "hpMax",
		name = "生长加生命",
		time = 99,
		combineArgs = true,
		id = 520002,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[520101] = {
		name = "生长1",
		id = 520101,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[519],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 520001,
							value = "1+(target2:hasBuff(400102) and target2:getBuffOverlayCount(400102) or 0)*2",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[520102] = {
		name = "生长2",
		id = 520102,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[519],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 520002,
							value = "1+(target2:hasBuff(400102) and target2:getBuffOverlayCount(400102) or 0)*2",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[520103] = {
		name = "生长3",
		id = 520103,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[519],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 520001,
							value = "1+(target2:hasBuff(400102) and target2:getBuffOverlayCount(400102) or 0)*2",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 520002,
							value = "1+(target2:hasBuff(400102) and target2:getBuffOverlayCount(400102) or 0)*2",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[520104] = {
		name = "生长4",
		id = 520104,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[519],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 520001,
							value = "2+(target2:hasBuff(400102) and target2:getBuffOverlayCount(400102) or 0)*2",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[520105] = {
		name = "生长5",
		id = 520105,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[519],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 520002,
							value = "2+(target2:hasBuff(400102) and target2:getBuffOverlayCount(400102) or 0)*2",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[520106] = {
		name = "生长6",
		id = 520106,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[519],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 520001,
							value = "2+(target2:hasBuff(400102) and target2:getBuffOverlayCount(400102) or 0)*2",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 520002,
							value = "2+(target2:hasBuff(400102) and target2:getBuffOverlayCount(400102) or 0)*2",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[520107] = {
		name = "生长7",
		id = 520107,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[519],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 520001,
							value = "4+(target2:hasBuff(400102) and target2:getBuffOverlayCount(400102) or 0)*2",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[520108] = {
		name = "生长8",
		id = 520108,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[519],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 520002,
							value = "4+(target2:hasBuff(400102) and target2:getBuffOverlayCount(400102) or 0)*2",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[520109] = {
		name = "生长9",
		id = 520109,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[519],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 520001,
							value = "4+(target2:hasBuff(400102) and target2:getBuffOverlayCount(400102) or 0)*2",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 520002,
							value = "4+(target2:hasBuff(400102) and target2:getBuffOverlayCount(400102) or 0)*2",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000001] = {
		id = 1000001,
		name = "测试1",
		overlayLimit = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = "target2:hasNature(17) and 1 or 0",
							cfgId = 1000002,
							value = 20,
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "selfForce|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000002] = {
		id = 1000002,
		name = "测试1",
		easyEffectFunc = "defence",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[73]
	},
	[1000101] = {
		name = "测试2",
		id = 1000101,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000102,
							prob = 1,
							caster = 2,
							value = {
								1001,
								1004,
								1005,
								1006,
								1007,
								1008,
								1009,
								1010,
								1011,
								2001,
								2002,
								2003,
								2004,
								2005,
								2006,
								2007,
								2008,
								2009,
								2010,
								2011,
								2012,
								17001,
								17002,
								17003,
								17004,
								17005,
								17006,
								17007,
								17008,
								17009,
								17010
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000102] = {
		name = "测试2",
		easyEffectFunc = "find",
		id = 1000102,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[461]
	},
	[1000201] = {
		name = "测试3",
		id = 1000201,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000202,
							prob = 1,
							value = -1,
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000203,
							prob = 1,
							value = 1,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000202] = {
		name = "测试3",
		easyEffectFunc = "changeTrainerHp",
		id = 1000202,
		overlayLimit = 1,
		overlayType = 1
	},
	[1000203] = {
		easyEffectFunc = "attack",
		name = "测试3",
		time = 99,
		combineArgs = true,
		id = 1000203,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[1000301] = {
		name = "测试4",
		id = 1000301,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000302,
							prob = 1,
							caster = 2,
							value = {
								3,
								{
									-1,
									0,
									0
								}
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000302] = {
		easyEffectFunc = "shopFix",
		name = "测试4",
		time = 99,
		id = 1000302,
		overlayLimit = 1,
		overlayType = 1
	},
	[1000401] = {
		name = "测试5",
		id = 1000401,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 7,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000402,
							prob = 1,
							value = 1,
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000403,
							prob = 1,
							value = 1,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000402] = {
		name = "测试5",
		easyEffectFunc = "changeTrainerHp",
		id = 1000402,
		overlayLimit = 1,
		overlayType = 1
	},
	[1000403] = {
		name = "测试5",
		easyEffectFunc = "gainGold",
		id = 1000403,
		overlayLimit = 1,
		overlayType = 1
	},
	[1000111] = {
		name = "治愈",
		time = 99,
		id = 1000111,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000112,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000112] = {
		name = "治愈",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1000112,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1000113,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000113] = {
		name = "治愈",
		time = 99,
		id = 1000113,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 18,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1000114,
							value = 5,
							caster = 1,
							holder = {
								__size = 2,
								process = "field",
								input = "selfForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1000114] = {
		overlayType = 1,
		name = "治愈",
		easyEffectFunc = "heal",
		id = 1000114,
		overlayLimit = 1,
		isShow = true,
		group = slot0[58],
		specialEffect = slot0[59]
	},
	[1000211] = {
		name = "怒火",
		time = 99,
		id = 1000211,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000212,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000212] = {
		name = "怒火",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1000212,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1000213,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000213] = {
		name = "怒火",
		time = 99,
		id = 1000213,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 14,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1000214,
							value = 3,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1000214] = {
		id = 1000214,
		name = "怒火",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1000311] = {
		name = "狂怒",
		time = 99,
		id = 1000311,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000312,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000312] = {
		name = "狂怒",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1000312,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1000313,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000313] = {
		combineArgs = true,
		name = "狂怒",
		easyEffectFunc = "strike",
		overlayLimit = 1,
		overlayType = 1,
		id = 1000313,
		isShow = true,
		group = slot0[23],
		specialEffect = slot0[33]
	},
	[1000411] = {
		name = "祝福Ⅰ",
		time = 99,
		id = 1000411,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 1000412,
							value = 5,
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "selfForce|nodead"
							}
						}
					},
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 1000413,
							value = 10,
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "selfForce|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000412] = {
		id = 1000412,
		name = "祝福Ⅰ",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1000413] = {
		id = 1000413,
		name = "祝福Ⅰ",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[1000511] = {
		name = "幽冥火",
		time = 99,
		id = 1000511,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000512,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000512] = {
		name = "幽冥火",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1000512,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1000513,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000513] = {
		name = "幽冥火",
		id = 1000513,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				triggerPoint = 204,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1000514,
							value = 10,
							caster = 1,
							holder = {
								__size = 2,
								process = "field|random(1)",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1000514] = {
		name = "幽冥火",
		easyEffectFunc = "buffDamage",
		id = 1000514,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[1000611] = {
		name = "凝聚",
		time = 99,
		id = 1000611,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000612,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000612] = {
		name = "凝聚",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1000612,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1000613,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000613] = {
		name = "凝聚",
		id = 1000613,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 17,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 1000614,
							value = 3,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(1)",
								input = "selfForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1000614] = {
		id = 1000614,
		name = "凝聚",
		easyEffectFunc = "defence",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[73]
	},
	[1000711] = {
		name = "戏法",
		time = 99,
		id = 1000711,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 1000712,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "all|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000712] = {
		name = "戏法",
		id = 1000712,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000713,
							prob = 1,
							value = "target:attack()",
							caster = 1
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000714,
							prob = 1,
							value = "target:hpMax()",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000715,
							prob = 1,
							value = "target:getBuff(1000714):getValue()-target:getBuff(1000713):getValue()",
							caster = 1
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000716,
							prob = 1,
							value = "target:getBuff(1000713):getValue()-target:getBuff(1000714):getValue()",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000713] = {
		id = 1000713,
		name = "戏法",
		overlayLimit = 1,
		overlayType = 1
	},
	[1000714] = {
		id = 1000714,
		name = "戏法",
		overlayLimit = 1,
		overlayType = 1
	},
	[1000715] = {
		id = 1000715,
		name = "戏法",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1000716] = {
		id = 1000716,
		name = "戏法",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[1000811] = {
		name = "幻灭",
		time = 99,
		id = 1000811,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 1000812,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|left(1)",
								input = "selfForce|nodead"
							}
						}
					},
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 1000812,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|left(1)",
								input = "enemyForce|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000812] = {
		name = "幻灭",
		easyEffectFunc = "oneHitKill",
		id = 1000812,
		overlayLimit = 1,
		isShow = true,
		group = slot0[209],
		specialEffect = slot0[210]
	},
	[1000911] = {
		name = "遗愿",
		time = 99,
		id = 1000911,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000912,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000912] = {
		name = "遗愿",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1000912,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1000913,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000913] = {
		name = "遗愿",
		id = 1000913,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				triggerPoint = 204,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1000914,
							value = 5,
							caster = 1,
							holder = {
								__size = 2,
								process = "field",
								input = "selfForce|nodead"
							}
						}
					},
					{
						{
							__size = 4,
							cfgId = 1000915,
							value = 5,
							caster = 1,
							holder = {
								__size = 2,
								process = "field",
								input = "selfForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1000914] = {
		id = 1000914,
		name = "遗愿",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1000915] = {
		id = 1000915,
		name = "遗愿",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[1001011] = {
		name = "铁卫",
		time = 99,
		id = 1001011,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1001012,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1001012] = {
		name = "铁卫",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1001012,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1001013,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1001013] = {
		name = "铁卫",
		id = 1001013,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 20,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 1001014,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|right(1)",
								input = "selfForce|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[1001014] = {
		combineArgs = true,
		name = "铁卫",
		time = 99,
		easyEffectFunc = "protector",
		overlayLimit = 1,
		overlayType = 1,
		id = 1001014,
		isShow = true,
		group = slot0[200],
		specialEffect = slot0[201]
	},
	[1001111] = {
		name = "欲壑",
		time = 99,
		id = 1001111,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1001112,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1001112] = {
		name = "欲壑",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1001112,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1001113,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1001113] = {
		name = "欲壑",
		id = 1001113,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				triggerPoint = 204,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1001114,
							value = 0,
							caster = 1,
							holder = {
								__size = 2,
								process = "field|random(1)",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1001114] = {
		name = "欲壑",
		easyEffectFunc = "changeAttackTarget",
		overlayLimit = 1,
		id = 1001114,
		isShow = true,
		group = slot0[340],
		specialVal = slot0[341],
		specialTarget = slot0[36],
		triggerBehaviors = slot0[342],
		specialEffect = slot0[343]
	},
	[2000111] = {
		name = "盾护",
		time = 99,
		triggerPriority = 11,
		id = 2000111,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 2000112,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "selfForce|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[2000112] = {
		name = "盾护",
		triggerPriority = 11,
		id = 2000112,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 2000114,
							prob = "target:hasBuffGroup(126) and 1 or 0",
							value = "target:attack()",
							caster = 1
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 2000113,
							prob = "target:hasBuffGroup(126) and 0 or 1",
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[2000113] = {
		id = 2000113,
		name = "盾护",
		easyEffectFunc = "divineShield",
		combineArgs = true,
		overlayLimit = 1,
		isShow = true,
		group = slot0[38],
		specialEffect = slot0[39]
	},
	[2000114] = {
		id = 2000114,
		name = "盾护",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[2000211] = {
		name = "破山",
		time = 99,
		id = 2000211,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 2000212,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[2000212] = {
		name = "破山",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 2000212,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 2000213,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[2000213] = {
		id = 2000213,
		name = "破山",
		easyEffectFunc = "ignoreShield",
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[170]
	},
	[2000311] = {
		name = "祝福Ⅱ",
		time = 99,
		id = 2000311,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 2000312,
							value = 10,
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "selfForce|nodead"
							}
						}
					},
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 2000313,
							value = 20,
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "selfForce|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[2000312] = {
		id = 2000312,
		name = "祝福Ⅱ",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[2000313] = {
		id = 2000313,
		name = "祝福Ⅱ",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[2000411] = {
		name = "固守",
		time = 99,
		id = 2000411,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 2000412,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[2000412] = {
		name = "固守",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 2000412,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 2000413,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[2000413] = {
		name = "固守",
		triggerPriority = 11,
		id = 2000413,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 2000414,
							prob = 1,
							value = 1,
							caster = 1
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 2000415,
							prob = 1,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[2000414] = {
		id = 2000414,
		name = "固守",
		easyEffectFunc = "defence",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[73]
	},
	[2000415] = {
		combineArgs = true,
		name = "固守",
		time = 99,
		easyEffectFunc = "shieldEX",
		overlayLimit = 1,
		overlayType = 1,
		id = 2000415,
		isShow = true,
		group = slot0[68],
		specialEffect = slot0[69]
	},
	[2000511] = {
		name = "永恒",
		time = 99,
		id = 2000511,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 2000516,
							prob = 1,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[2000512] = {
		name = "永恒",
		id = 2000512,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 13,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 2000513,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[2000513] = {
		name = "永恒",
		id = 2000513,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[571],
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 4,
							cfgId = 2000514,
							value = 20,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 2000515,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:getBuffOverlayCount(2000513)==6"
				}
			},
			__size = 1
		}
	},
	[2000514] = {
		id = 2000514,
		name = "永恒",
		easyEffectFunc = "defence",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[73]
	},
	[2000515] = {
		name = "永恒",
		id = 2000515,
		overlayLimit = 1,
		overlayType = 1,
		dispelBuff = slot0[571]
	},
	[2000516] = {
		name = "永恒",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 2000516,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 2000512,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[2000611] = {
		name = "精神利刃",
		time = 99,
		id = 2000611,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 2000612,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[2000612] = {
		name = "精神利刃",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 2000612,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 2000613,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[2000613] = {
		name = "精神利刃",
		time = 99,
		id = 2000613,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 32,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 2000614,
							holder = 9,
							caster = 1,
							value = {
								2,
								1
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[2000614] = {
		combineArgs = true,
		name = "精神利刃",
		easyEffectFunc = "stun",
		overlayLimit = 1,
		overlayType = 1,
		id = 2000614,
		isShow = true,
		group = slot0[43],
		specialEffect = slot0[44]
	},
	[2000711] = {
		name = "窃取",
		time = 99,
		id = 2000711,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 2000712,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[2000712] = {
		name = "窃取",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 2000712,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 2000713,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[2000713] = {
		name = "窃取",
		time = 99,
		id = 2000713,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 32,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 9,
							cfgId = 2000714,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[2000714] = {
		name = "窃取",
		id = 2000714,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 2000716,
							value = "min(target:attack(),5)",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 2000715,
							value = -5,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[2000715] = {
		id = 2000715,
		name = "窃取",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[2000716] = {
		id = 2000716,
		name = "窃取",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[2000811] = {
		name = "暗魂",
		time = 99,
		id = 2000811,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 2000812,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[2000812] = {
		name = "暗魂",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 2000812,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 2000813,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[2000813] = {
		name = "暗魂",
		time = 99,
		id = 2000813,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 12,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 8,
							cfgId = 2000814,
							value = -5,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[2000814] = {
		id = 2000814,
		name = "暗魂",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[2000911] = {
		name = "剑守",
		time = 99,
		id = 2000911,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 2000912,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[2000912] = {
		name = "剑守",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 2000912,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 2000913,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[2000913] = {
		id = 2000913,
		equipBond = true,
		time = 99,
		name = "剑守",
		easyEffectFunc = "thorn",
		overlayLimit = 1,
		overlayType = 1,
		combineArgs = true,
		group = slot0[65]
	},
	[2001011] = {
		name = "枷锁",
		time = 99,
		id = 2001011,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 2001012,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|attr(\"attack\",\"max\",3)",
								input = "enemyForce|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[2001012] = {
		name = "枷锁",
		triggerPriority = 11,
		id = 2001012,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 2001013,
							prob = 1,
							value = "-math.floor(target:attack()*0.5)",
							caster = 1
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 2001014,
							prob = 1,
							caster = 1,
							value = {
								2,
								1
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[2001013] = {
		id = 2001013,
		name = "枷锁",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[2001014] = {
		combineArgs = true,
		name = "枷锁",
		easyEffectFunc = "stun",
		overlayLimit = 1,
		overlayType = 1,
		id = 2001014,
		isShow = true,
		group = slot0[43],
		specialEffect = slot0[44]
	},
	[2001111] = {
		name = "牵制",
		time = 99,
		id = 2001111,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 2001112,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(1)",
								input = "enemyForce|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[2001112] = {
		name = "牵制",
		triggerPriority = 11,
		id = 2001112,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 2001113,
							prob = 1,
							value = "1-target:attack()",
							caster = 1
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 2001114,
							prob = 1,
							value = "1-target:hpMax()",
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[2001113] = {
		id = 2001113,
		name = "牵制",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[2001114] = {
		id = 2001114,
		name = "牵制",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[254]
	},
	[3000111] = {
		name = "贯穿",
		time = 99,
		id = 3000111,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 3000112,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[3000112] = {
		name = "贯穿",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 3000112,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 3000113,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[3000113] = {
		name = "贯穿",
		triggerPriority = 11,
		id = 3000113,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 3000115,
							value = 10,
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 3000116,
							value = 10,
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 3000114,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[3000114] = {
		easyEffectFunc = "penetrate",
		name = "贯穿",
		time = 99,
		combineArgs = true,
		id = 3000114,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[120]
	},
	[3000115] = {
		id = 3000115,
		name = "贯穿",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[3000116] = {
		id = 3000116,
		name = "贯穿",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[3000211] = {
		name = "爆裂",
		time = 99,
		id = 3000211,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 3000212,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[3000212] = {
		name = "爆裂",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 3000212,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 3000213,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[3000213] = {
		name = "爆裂",
		time = 99,
		id = 3000213,
		overlayLimit = 1,
		triggerBehaviors = {
			{
				triggerPoint = 31,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 9,
							cfgId = 3000214,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 3000216,
							value = 10,
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 3000217,
							value = 10,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[3000214] = {
		name = "爆裂",
		id = 3000214,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 13,
							cfgId = 3000215,
							value = "math.floor(self:attack()*0.5)",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[3000215] = {
		name = "爆裂",
		easyEffectFunc = "buffDamage",
		id = 3000215,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[3000216] = {
		id = 3000216,
		name = "爆裂",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[3000217] = {
		id = 3000217,
		name = "爆裂",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[3000311] = {
		name = "祝福Ⅲ",
		time = 99,
		id = 3000311,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 3000312,
							value = 20,
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "selfForce|nodead"
							}
						}
					},
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 3000313,
							value = 40,
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "selfForce|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[3000312] = {
		id = 3000312,
		name = "祝福Ⅲ",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[3000313] = {
		id = 3000313,
		name = "祝福Ⅲ",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[3000411] = {
		name = "乘胜",
		time = 99,
		id = 3000411,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 3000417,
							prob = 1,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[3000412] = {
		name = "乘胜",
		time = 99,
		id = 3000412,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 6,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 3000413,
							value = 0,
							caster = 1,
							holder = {
								__size = 2,
								process = "left(1)",
								input = "selfRight"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[3000413] = {
		name = "乘胜",
		id = 3000413,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 3000414,
							prob = 1,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 3000415,
							prob = 1,
							value = 5,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[3000414] = {
		id = 3000414,
		name = "乘胜",
		easyEffectFunc = "newAction",
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1
	},
	[3000415] = {
		id = 3000415,
		name = "乘胜",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[3000416] = {
		name = "乘胜",
		id = 3000416,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 3000412,
							prob = 1,
							value = 0,
							caster = 1
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 3000418,
							prob = 1,
							value = 10,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[3000417] = {
		name = "乘胜",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 3000417,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 3000416,
							holder = 18,
							caster = 1,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[3000418] = {
		id = 3000418,
		name = "乘胜",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[3000511] = {
		name = "剑舞",
		time = 99,
		id = 3000511,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 3000512,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[3000512] = {
		name = "剑舞",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 3000512,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 3000513,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[3000513] = {
		name = "剑舞",
		time = 99,
		id = 3000513,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 6,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 3000514,
							value = 10,
							caster = 1,
							holder = {
								__size = 2,
								process = "field",
								input = "selfForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 3000515,
							value = 20,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[3000514] = {
		id = 3000514,
		name = "剑舞",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[3000515] = {
		id = 3000515,
		name = "剑舞",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[3000611] = {
		name = "协力",
		time = 99,
		id = 3000611,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 3000612,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[3000612] = {
		name = "协力",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 3000612,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 3000613,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[3000613] = {
		name = "协力",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 3000613,
		group = slot0[13],
		triggerBehaviors = {
			{
				triggerPoint = 99,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 3000614,
							holder = 18,
							caster = 1,
							value = 0,
							prob = "(target2:team()==self:team()) and  1 or 0",
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[3000614] = {
		name = "协力",
		time = 99,
		id = 3000614,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 231,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 100040,
							holder = 2,
							caster = 2,
							value = {
								1008
							}
						}
					},
					{
						{
							__size = 6,
							caster = 2,
							cfgId = 3000615,
							ignoreAura = 1,
							value = 3,
							prob = 1,
							holder = 2
						}
					},
					{
						{
							__size = 6,
							caster = 2,
							cfgId = 3000616,
							ignoreAura = 1,
							value = 3,
							prob = 1,
							holder = 2
						}
					}
				},
				onSomeFlag = {
					"less(target:attack(),self:attack())"
				}
			},
			__size = 1
		}
	},
	[3000615] = {
		id = 3000615,
		name = "协力",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[3000616] = {
		id = 3000616,
		name = "协力",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[3000711] = {
		name = "腐坏",
		time = 99,
		id = 3000711,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 3000712,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[3000712] = {
		name = "腐坏",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 3000712,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 3000713,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[3000713] = {
		name = "腐坏",
		time = 99,
		id = 3000713,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 32,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 9,
							cfgId = 3000714,
							value = "target:attack()",
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[3000714] = {
		id = 3000714,
		name = "腐坏",
		easyEffectFunc = "broken",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[182]
	},
	[3000811] = {
		name = "脆弱",
		time = 99,
		id = 3000811,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 3000812,
							value = "-math.floor(target2:hpMax()*0.5)",
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "enemyForce|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[3000812] = {
		id = 3000812,
		name = "脆弱",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[254]
	},
	[3000911] = {
		name = "束缚",
		time = 99,
		id = 3000911,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							caster = 2,
							cfgId = 3000912,
							prob = 1,
							holder = {
								__size = 2,
								process = "field",
								input = "enemyForce|nodead"
							},
							value = {
								2,
								1
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[3000912] = {
		combineArgs = true,
		name = "束缚",
		easyEffectFunc = "stun",
		overlayLimit = 1,
		overlayType = 1,
		id = 3000912,
		isShow = true,
		group = slot0[43],
		specialEffect = slot0[44]
	},
	[3001011] = {
		name = "偏折",
		time = 99,
		id = 3001011,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 3001012,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[3001012] = {
		name = "偏折",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 3001012,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 3001013,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[3001013] = {
		name = "偏折",
		time = 99,
		id = 3001013,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 12,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 3001014,
							value = "trigger.attacker:attack()",
							caster = 1,
							holder = {
								__size = 2,
								process = "field|random(1)",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[3001014] = {
		name = "偏折",
		easyEffectFunc = "buffDamage",
		id = 3001014,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[3001111] = {
		name = "牵制Ⅱ",
		time = 99,
		id = 3001111,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 3001112,
							value = "1-target2:hpMax()",
							caster = 2,
							holder = {
								__size = 2,
								process = "field|attr(\"attack\",\"max\",1)",
								input = "enemyForce|nodead"
							}
						}
					},
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 3001113,
							value = "1-target2:attack()",
							caster = 2,
							holder = {
								__size = 2,
								process = "field|attr(\"hp\",\"max\",1)",
								input = "enemyForce|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[3001112] = {
		id = 3001112,
		name = "牵制Ⅱ",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[254]
	},
	[3001113] = {
		id = 3001113,
		name = "牵制Ⅱ",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[49]
	},
	[4000111] = {
		name = "潜袭",
		time = 99,
		id = 4000111,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 4000112,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[4000112] = {
		name = "潜袭",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 4000112,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 4000115,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[4000113] = {
		id = 4000113,
		name = "潜袭",
		easyEffectFunc = "stealth",
		combineArgs = true,
		overlayLimit = 1,
		isShow = true,
		group = slot0[27],
		specialEffect = slot0[150]
	},
	[4000114] = {
		combineArgs = true,
		name = "潜袭",
		time = 99,
		easyEffectFunc = "quickStrike",
		overlayLimit = 1,
		overlayType = 1,
		id = 4000114,
		group = slot0[151],
		specialVal = slot0[152]
	},
	[4000115] = {
		name = "潜袭",
		triggerPriority = 11,
		id = 4000115,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 4000113,
							prob = 1,
							value = 0,
							caster = 1
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 4000114,
							prob = 1,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[4000211] = {
		name = "祝福Ⅳ",
		time = 99,
		id = 4000211,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 4000212,
							value = 30,
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "selfForce|nodead"
							}
						}
					},
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 4000213,
							value = 60,
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "selfForce|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[4000212] = {
		id = 4000212,
		name = "祝福Ⅳ",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[4000213] = {
		id = 4000213,
		name = "祝福Ⅳ",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[4000311] = {
		name = "银色之风",
		time = 99,
		id = 4000311,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 4000312,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 4000314,
							value = 8,
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "enemyForce|nodead"
							}
						}
					}
				}
			},
			__size = 2
		}
	},
	[4000312] = {
		name = "银色之风",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 4000312,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 4000313,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 0 or 1",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[4000313] = {
		name = "银色之风",
		id = 4000313,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 4,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 4000314,
							value = 8,
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[4000314] = {
		name = "银色之风",
		easyEffectFunc = "buffDamage",
		id = 4000314,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[4000411] = {
		name = "自爆",
		time = 99,
		id = 4000411,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 4000412,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[4000412] = {
		name = "自爆",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 4000412,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 4000413,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[4000413] = {
		name = "自爆",
		id = 4000413,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				triggerPoint = 204,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 4000414,
							value = "target:attack()",
							caster = 1,
							holder = {
								__size = 2,
								process = "field",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 18,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 4000415,
							value = 5,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[4000414] = {
		name = "自爆",
		easyEffectFunc = "buffDamage",
		id = 4000414,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[4000415] = {
		id = 4000415,
		name = "自爆",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[4000511] = {
		name = "摧破",
		time = 99,
		id = 4000511,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 4000512,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[4000512] = {
		name = "摧破",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 4000512,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 4000513,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[4000513] = {
		name = "摧破",
		id = 4000513,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 17,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 4000514,
							value = 3,
							caster = 1,
							holder = {
								__size = 2,
								process = "field",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[4000514] = {
		name = "摧破",
		easyEffectFunc = "buffDamage",
		id = 4000514,
		overlayLimit = 1,
		overlayType = 1,
		group = {
			29
		},
		specialVal = {
			{
				processId = 6,
				__size = 1
			}
		}
	},
	[4000611] = {
		name = "无尽",
		time = 99,
		id = 4000611,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 4000612,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field",
								input = "selfForce|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[4000612] = {
		name = "无尽",
		id = 4000612,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				triggerPoint = 204,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 4000613,
							holder = 1,
							caster = 1,
							value = {
								"target:unitID()",
								"target:star()",
								0,
								{}
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[4000613] = {
		name = "无尽",
		easyEffectFunc = "summon",
		id = 4000613,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[100]
	},
	[4000711] = {
		name = "泡沫",
		time = 99,
		id = 4000711,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 4000712,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[4000712] = {
		name = "泡沫",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 4000712,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 4000713,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[4000713] = {
		name = "泡沫",
		id = 4000713,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				triggerPoint = 204,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 10,
							cfgId = 4000714,
							prob = "target2:isTrainer() and 0 or 1",
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[4000714] = {
		name = "泡沫",
		id = 4000714,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 20,
				__size = 5,
				delSelfWhenTriggered = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 4000715,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[4000715] = {
		name = "泡沫",
		easyEffectFunc = "oneHitKill",
		id = 4000715,
		overlayLimit = 1,
		isShow = true,
		group = slot0[209],
		specialEffect = slot0[210]
	},
	[4000811] = {
		name = "野蛮",
		time = 99,
		id = 4000811,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 4000812,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[4000812] = {
		name = "野蛮",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 4000812,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 4000813,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[4000813] = {
		name = "野蛮",
		id = 4000813,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				triggerPoint = 17,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 4000814,
							value = "target:attack()",
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 4000815,
							value = "target:hpMax()",
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[4000814] = {
		id = 4000814,
		name = "野蛮",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[4000815] = {
		id = 4000815,
		name = "野蛮",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[4000911] = {
		name = "疯狂",
		time = 99,
		id = 4000911,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 4000912,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[4000912] = {
		name = "疯狂",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 4000912,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 4000913,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[4000913] = {
		name = "疯狂",
		id = 4000913,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				triggerPoint = 17,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 4000915,
							value = "target:hpMax()",
							caster = 1
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 4000916,
							value = 5,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 4000914,
							holder = 1,
							caster = 1,
							value = {
								1
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 2
		}
	},
	[4000914] = {
		name = "疯狂",
		easyEffectFunc = "actionTimes",
		id = 4000914,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[75]
	},
	[4000915] = {
		overlayType = 1,
		name = "疯狂",
		easyEffectFunc = "heal",
		id = 4000915,
		overlayLimit = 1,
		isShow = true,
		group = slot0[58],
		specialEffect = slot0[59]
	},
	[4000916] = {
		id = 4000916,
		name = "疯狂",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[4001011] = {
		name = "平等",
		time = 99,
		id = 4001011,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 4001012,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|attr(\"attack\",\"max\",3)",
								input = "all|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[4001012] = {
		id = 4001012,
		name = "平等",
		easyEffectFunc = "destroy",
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[65]
	},
	[4001111] = {
		name = "水中月",
		time = 99,
		id = 4001111,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 7,
							cfgId = 4001112,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[4001112] = {
		name = "水中月",
		easyEffectFunc = "oneHitKill",
		id = 4001112,
		overlayLimit = 1,
		isShow = true,
		group = slot0[209],
		triggerBehaviors = slot0[648],
		specialEffect = slot0[210]
	},
	[4001211] = {
		name = "镜中花",
		time = 99,
		id = 4001211,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 4001212,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[4001212] = {
		name = "镜中花",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 4001212,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 4001213,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[4001213] = {
		name = "镜中花",
		id = 4001213,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[41],
		triggerBehaviors = {
			{
				triggerPoint = 10,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 4001214,
							prob = 1,
							caster = 2,
							value = {
								"target:unitID()",
								"target:star()",
								0,
								{
									4001215
								}
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[4001214] = {
		name = "镜中花",
		easyEffectFunc = "summon",
		id = 4001214,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[100]
	},
	[4001215] = {
		name = "镜中花",
		easyEffectFunc = "oneHitKill",
		id = 4001215,
		overlayLimit = 1,
		isShow = true,
		group = slot0[209],
		specialEffect = slot0[210]
	},
	[1000010101] = {
		name = "余烬",
		id = 1000010101,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000010102,
							prob = 1,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000010102] = {
		name = "余烬",
		time = 99,
		id = 1000010102,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 8,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000010103,
							prob = 1,
							value = "c.fireCards_combatCards()",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"lessE(target:hp(),10)"
				}
			},
			__size = 1
		}
	},
	[1000010103] = {
		name = "余烬",
		easyEffectFunc = "find",
		id = 1000010103,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[461]
	},
	[1000010201] = {
		name = "星火",
		id = 1000010201,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000010202,
							prob = 1,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000010202] = {
		name = "星火",
		time = 99,
		id = 1000010202,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 28,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 18,
							cfgId = 1000010203,
							prob = 1,
							value = 5,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"trigger.obj:type()==1"
				}
			},
			__size = 1
		}
	},
	[1000010203] = {
		id = 1000010203,
		name = "星火",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1000010301] = {
		name = "熊熊",
		id = 1000010301,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1000010302,
							holder = 1,
							caster = 1,
							value = {
								1
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000010302] = {
		name = "熊熊",
		easyEffectFunc = "actionTimes",
		id = 1000010302,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[75]
	},
	[1000010401] = {
		name = "燃烧",
		id = 1000010401,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000010402,
							prob = 1,
							value = -3,
							caster = 1
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000010403,
							prob = 1,
							value = "self:lostHp()",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000010402] = {
		name = "燃烧",
		easyEffectFunc = "changeTrainerHp",
		id = 1000010402,
		overlayLimit = 1,
		overlayType = 1
	},
	[1000010403] = {
		id = 1000010403,
		name = "燃烧",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1000010501] = {
		name = "燎原",
		time = 99,
		id = 1000010501,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 4,
							cfgId = 1000010502,
							prob = 1,
							value = "5*countObj(\"nature\",target:team(),list(2,7))",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000010502] = {
		id = 1000010502,
		name = "燎原",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1000010601] = {
		name = "乘胜",
		time = 99,
		id = 1000010601,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000010607,
							prob = 1,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000010602] = {
		name = "乘胜",
		time = 99,
		id = 1000010602,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 6,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1000010603,
							value = 0,
							caster = 1,
							holder = {
								__size = 2,
								process = "left(1)",
								input = "selfRight"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1000010603] = {
		name = "乘胜",
		id = 1000010603,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000010604,
							prob = 1,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000010605,
							prob = 1,
							value = 5,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000010604] = {
		id = 1000010604,
		name = "乘胜",
		easyEffectFunc = "newAction",
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1
	},
	[1000010605] = {
		id = 1000010605,
		name = "乘胜",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1000010606] = {
		name = "乘胜",
		id = 1000010606,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000010602,
							prob = 1,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000010607] = {
		name = "乘胜",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1000010607,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1000010606,
							holder = 18,
							caster = 1,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000010701] = {
		name = "涅槃",
		id = 1000010701,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000010702,
							prob = 1,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000010702] = {
		name = "涅槃",
		id = 1000010702,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 4,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1000010703,
							holder = 1,
							caster = 1,
							value = {
								"target:unitID()",
								"target:star()",
								0,
								{}
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1000010703] = {
		name = "涅槃",
		easyEffectFunc = "summon",
		id = 1000010703,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[100]
	},
	[1000010801] = {
		name = "红莲",
		time = 99,
		id = 1000010801,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 7,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 4,
							cfgId = 1000010802,
							prob = "(target2:hasNature(2) or target2:hasNature(7)) and 1 or 0",
							value = 3,
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 4,
							cfgId = 1000010803,
							prob = "(target2:hasNature(2) or target2:hasNature(7)) and 1 or 0",
							value = 3,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000010802] = {
		easyEffectFunc = "attack",
		name = "红莲",
		time = 99,
		combineArgs = true,
		id = 1000010802,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[1000010803] = {
		easyEffectFunc = "hpMax",
		name = "红莲",
		time = 99,
		combineArgs = true,
		id = 1000010803,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[1000010901] = {
		name = "谜题",
		time = 99,
		id = 1000010901,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000010904,
							prob = 1,
							value = 0,
							caster = 1
						}
					}
				}
			},
			{
				__size = 3,
				triggerPoint = 7,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000010902,
							prob = 1,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 2
		}
	},
	[1000010902] = {
		name = "谜题",
		time = 99,
		id = 1000010902,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[668],
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 1000010903,
							value = 5,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:getBuffOverlayCount(1000010902)==4"
				}
			},
			__size = 1
		}
	},
	[1000010903] = {
		name = "谜题",
		easyEffectFunc = "changeTrainerHp",
		id = 1000010903,
		overlayLimit = 1,
		overlayType = 1,
		dispelBuff = slot0[668]
	},
	[1000010904] = {
		name = "谜题",
		time = 99,
		id = 1000010904,
		overlayLimit = 1,
		overlayType = 1
	},
	[1000011001] = {
		name = "业火",
		id = 1000011001,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 4,
							cfgId = 1000011004,
							prob = 1,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000011002] = {
		name = "业火",
		id = 1000011002,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 1000011003,
							value = "target:attack()",
							caster = 1,
							holder = {
								__size = 2,
								process = "field|near|random(1)",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1000011003] = {
		name = "业火",
		easyEffectFunc = "buffDamage",
		id = 1000011003,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[1000011004] = {
		name = "业火",
		id = 1000011004,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000011002,
							prob = 1,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000020101] = {
		name = "配件",
		id = 1000020101,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000020102,
							prob = 1,
							value = "c.allEquips()",
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000020102] = {
		name = "配件",
		easyEffectFunc = "find",
		id = 1000020102,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[461]
	},
	[1000020201] = {
		name = "坚硬",
		time = 99,
		id = 1000020201,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 9,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 4,
							cfgId = 1000020202,
							prob = 1,
							value = 2,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000020202] = {
		easyEffectFunc = "defence",
		name = "坚硬",
		time = 99,
		combineArgs = true,
		id = 1000020202,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[62]
	},
	[1000020301] = {
		name = "丰饶",
		time = 99,
		id = 1000020301,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 9,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000020302,
							prob = 1,
							caster = 2,
							value = {
								"c.allGrow()",
								2,
								0,
								1
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000020302] = {
		name = "丰饶",
		easyEffectFunc = "getCard",
		id = 1000020302,
		overlayLimit = 1,
		overlayType = 1
	},
	[1000020401] = {
		name = "永恒",
		time = 99,
		id = 1000020401,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000020406,
							prob = 1,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000020402] = {
		name = "永恒",
		id = 1000020402,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 13,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000020403,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000020403] = {
		name = "永恒",
		id = 1000020403,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[678],
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 4,
							cfgId = 1000020404,
							value = 20,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 3,
							cfgId = 1000020405,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:getBuffOverlayCount(1000020403)==6"
				}
			},
			__size = 1
		}
	},
	[1000020404] = {
		id = 1000020404,
		name = "永恒",
		easyEffectFunc = "defence",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[73]
	},
	[1000020405] = {
		name = "永恒",
		id = 1000020405,
		overlayLimit = 1,
		overlayType = 1,
		dispelBuff = slot0[678]
	},
	[1000020406] = {
		name = "永恒",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1000020406,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1000020402,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000020501] = {
		name = "组装",
		id = 1000020501,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 1000020503,
							value = "target:attack()",
							caster = 2,
							holder = {
								__size = 2,
								process = "field|left(1)",
								input = "selfForce|nodead"
							}
						}
					},
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 1000020504,
							value = "target:hpMax()",
							caster = 2,
							holder = {
								__size = 2,
								process = "field|left(1)",
								input = "selfForce|nodead"
							}
						}
					},
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 1000020505,
							value = "target:defence()",
							caster = 2,
							holder = {
								__size = 2,
								process = "field|left(1)",
								input = "selfForce|nodead"
							}
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000020502,
							prob = 1,
							caster = 2,
							value = {
								-1
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000020502] = {
		name = "组装",
		easyEffectFunc = "sell",
		id = 1000020502,
		overlayLimit = 1,
		overlayType = 1
	},
	[1000020503] = {
		easyEffectFunc = "attack",
		name = "组装",
		time = 99,
		combineArgs = true,
		id = 1000020503,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[1000020504] = {
		easyEffectFunc = "hpMax",
		name = "组装",
		time = 99,
		combineArgs = true,
		id = 1000020504,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[1000020505] = {
		easyEffectFunc = "defence",
		name = "组装",
		time = 99,
		combineArgs = true,
		id = 1000020505,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[62]
	},
	[1000020601] = {
		name = "熔化",
		id = 1000020601,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000020602,
							prob = 1,
							value = "target:attack()",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000020603,
							prob = 1,
							value = "target:defence()",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000020604,
							prob = 1,
							value = "target:getBuff(1000020603):getValue()-target:getBuff(1000020602):getValue()",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000020605,
							prob = 1,
							value = "target:getBuff(1000020602):getValue()-target:getBuff(1000020603):getValue()",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000020602] = {
		id = 1000020602,
		name = "熔化",
		overlayLimit = 1,
		overlayType = 1
	},
	[1000020603] = {
		id = 1000020603,
		name = "熔化",
		overlayLimit = 1,
		overlayType = 1
	},
	[1000020604] = {
		easyEffectFunc = "attack",
		name = "熔化",
		time = 99,
		combineArgs = true,
		id = 1000020604,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[1000020605] = {
		easyEffectFunc = "defence",
		name = "熔化",
		time = 99,
		combineArgs = true,
		id = 1000020605,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[62]
	},
	[1000020701] = {
		name = "好运",
		id = 1000020701,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000020702,
							prob = 1,
							value = "c.allEvents()",
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000020702] = {
		name = "好运",
		easyEffectFunc = "find",
		id = 1000020702,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[461]
	},
	[1000020801] = {
		name = "绝对防御",
		time = 99,
		id = 1000020801,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 4,
							cfgId = 1000020802,
							prob = 1,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 4,
							cfgId = 1000020803,
							prob = 1,
							value = "1-target2:hpMax()",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 4,
							cfgId = 1000020805,
							prob = 1,
							value = "target2:defence()",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000020802] = {
		name = "绝对防御",
		id = 1000020802,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 26,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 1000020804,
							value = "target:shield()",
							caster = 1,
							holder = {
								__size = 2,
								process = "field|random(1)",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1000020803] = {
		id = 1000020803,
		name = "绝对防御",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1
	},
	[1000020804] = {
		name = "绝对防御",
		easyEffectFunc = "buffDamage",
		id = 1000020804,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[1000020805] = {
		id = 1000020805,
		name = "绝对防御",
		easyEffectFunc = "defence",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[73]
	},
	[1000020901] = {
		name = "锋利",
		id = 1000020901,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 1,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000020902,
							prob = 1,
							value = "target:defence()",
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1000020902] = {
		id = 1000020902,
		name = "锋利",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1000021001] = {
		name = "凝聚",
		time = 99,
		id = 1000021001,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 4,
							cfgId = 1000021002,
							prob = 1,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000021002] = {
		name = "凝聚",
		id = 1000021002,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 17,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 1000021003,
							value = 3,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|random(1)",
								input = "selfForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1000021003] = {
		id = 1000021003,
		name = "凝聚",
		easyEffectFunc = "defence",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[73]
	},
	[1000030101] = {
		name = "影杀",
		time = 99,
		id = 1000030101,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000030102,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000030102] = {
		name = "影杀",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1000030102,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1000030103,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000030103] = {
		name = "影杀",
		id = 1000030103,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 34,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1000030104,
							value = 5,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"trigger.name==\"stealth\" and target:inField() and (trigger.overType==2 or trigger.overType==0)"
				}
			},
			__size = 1
		}
	},
	[1000030104] = {
		id = 1000030104,
		name = "影杀",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1000030201] = {
		name = "藏形",
		time = 99,
		id = 1000030201,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 1000030202,
							value = 0,
							caster = 2,
							holder = {
								__size = 2,
								process = "field|right(1)",
								input = "selfForce|nodead"
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000030202] = {
		name = "藏形",
		id = 1000030202,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000030203,
							prob = 1,
							value = 0,
							caster = 1
						}
					},
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000030204,
							prob = 1,
							value = 5,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000030203] = {
		id = 1000030203,
		name = "藏形",
		easyEffectFunc = "stealth",
		combineArgs = true,
		overlayLimit = 1,
		isShow = true,
		group = slot0[27],
		specialEffect = slot0[150]
	},
	[1000030204] = {
		id = 1000030204,
		name = "藏形",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1000030301] = {
		name = "唤灵",
		id = 1000030301,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000030302,
							prob = 1,
							value = "c.ghostCards_evilCards()",
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000030302] = {
		name = "唤灵",
		easyEffectFunc = "find",
		id = 1000030302,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[461]
	},
	[1000030401] = {
		name = "困倦",
		time = 99,
		id = 1000030401,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							caster = 2,
							cfgId = 1000030402,
							prob = 1,
							holder = {
								__size = 2,
								process = "attr(\"attack\",\"max\",3)",
								input = "selfForce|nodead"
							},
							value = {
								2,
								1
							}
						}
					},
					{
						{
							__size = 5,
							caster = 2,
							cfgId = 1000030402,
							prob = 1,
							holder = {
								__size = 2,
								process = "attr(\"attack\",\"max\",3)",
								input = "enemyForce|nodead"
							},
							value = {
								2,
								1
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000030402] = {
		combineArgs = true,
		name = "困倦",
		easyEffectFunc = "stun",
		overlayLimit = 1,
		overlayType = 1,
		id = 1000030402,
		isShow = true,
		group = slot0[43],
		specialEffect = slot0[44]
	},
	[1000030501] = {
		name = "灾祸",
		easyEffectFunc = "auraEffect",
		id = 1000030501,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1000030502,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000030502] = {
		name = "灾祸",
		id = 1000030502,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 18,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							prob = 1,
							cfgId = 1000030503,
							value = 1,
							caster = 1,
							holder = {
								__size = 2,
								process = "field",
								input = "enemyForce|nodead"
							}
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1000030503] = {
		name = "灾祸",
		easyEffectFunc = "buffDamage",
		id = 1000030503,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[4],
		specialVal = slot0[5]
	},
	[1000030601] = {
		name = "遁影",
		id = 1000030601,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1000030602,
							holder = 1,
							caster = 1,
							value = 0,
							prob = 1,
							bond = 1
						}
					},
					{
						{
							__size = 6,
							cfgId = 1000030603,
							holder = 1,
							caster = 1,
							value = 0,
							prob = 1,
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000030602] = {
		id = 1000030602,
		name = "遁影",
		easyEffectFunc = "stealth",
		combineArgs = true,
		overlayLimit = 1,
		isShow = true,
		group = slot0[27],
		specialEffect = slot0[150]
	},
	[1000030603] = {
		name = "遁影",
		id = 1000030603,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[173],
		triggerBehaviors = {
			{
				triggerPoint = 13,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							cfgId = 1000030602,
							holder = 1,
							value = 0,
							caster = 1,
							bond = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1000030701] = {
		name = "衰竭",
		easyEffectFunc = "auraEffect",
		id = 1000030701,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1000030702,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000030702] = {
		name = "衰竭",
		id = 1000030702,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[173],
		triggerBehaviors = {
			{
				triggerPoint = 13,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 8,
							cfgId = 1000030703,
							value = -5,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1000030703] = {
		id = 1000030703,
		name = "衰竭",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[261]
	},
	[1000030801] = {
		name = "虚影",
		easyEffectFunc = "auraEffect",
		id = 1000030801,
		time = 99,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1000030802,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000030802] = {
		name = "虚影",
		time = 99,
		id = 1000030802,
		overlayLimit = 99,
		overlayType = 2,
		triggerBehaviors = {
			{
				triggerPoint = 32,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1000030803,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField() and trigger.target:attack()==0"
				}
			},
			__size = 1
		}
	},
	[1000030803] = {
		id = 1000030803,
		name = "虚影",
		easyEffectFunc = "newAction",
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1
	},
	[1000030901] = {
		name = "腐化",
		id = 1000030901,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000030902,
							prob = 1,
							caster = 1,
							value = {
								"randomChoose(c.ghostCards_evilCards())",
								"target:star()",
								0,
								0,
								0
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000030902] = {
		name = "腐化",
		easyEffectFunc = "permanentTransform",
		id = 1000030902,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[20]
	},
	[1000031001] = {
		name = "契约",
		id = 1000031001,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000031002,
							prob = 1,
							value = "-math.floor(target2:hp()*0.5)",
							caster = 2
						}
					},
					{
						{
							__size = 5,
							holder = 3,
							cfgId = 1000031003,
							prob = 1,
							caster = 2,
							value = {
								"c.ghostCards6_evilCards6()",
								1,
								0,
								0
							}
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000031002] = {
		name = "契约",
		easyEffectFunc = "changeTrainerHp",
		id = 1000031002,
		overlayLimit = 1,
		overlayType = 1
	},
	[1000031003] = {
		name = "契约",
		easyEffectFunc = "getCard",
		id = 1000031003,
		overlayLimit = 1,
		overlayType = 1
	},
	[1000040101] = {
		name = "缥缈",
		id = 1000040101,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1000040102,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000040102] = {
		name = "缥缈",
		id = 1000040102,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 5,
				__size = 4,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							cfgId = 1000040103,
							value = 0,
							caster = 1,
							holder = {
								__size = 2,
								process = "field|near",
								input = "enemyForce|nodead"
							}
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1000040103,
							value = 0,
							caster = 1
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1000040103] = {
		name = "缥缈",
		easyEffectFunc = "oneHitKill",
		id = 1000040103,
		overlayLimit = 1,
		isShow = true,
		group = slot0[209],
		specialEffect = slot0[210]
	},
	[1000040201] = {
		name = "联结",
		time = 99,
		id = 1000040201,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000040202,
							prob = 1,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000040202] = {
		name = "联结",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1000040202,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1000040203,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000040203] = {
		name = "联结",
		id = 1000040203,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 4,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 5,
							cfgId = 1000040204,
							prob = 1,
							value = 0,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:hasBuffGroup(144) and target:inField()"
				}
			},
			__size = 1
		}
	},
	[1000040204] = {
		name = "联结",
		id = 1000040204,
		overlayLimit = 99,
		overlayType = 2,
		group = {
			1000040203
		},
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1000040205,
							value = 5,
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1000040206,
							value = 5,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000040205] = {
		id = 1000040205,
		name = "联结",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1000040206] = {
		id = 1000040206,
		name = "联结",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[1000040301] = {
		name = "背水",
		id = 1000040301,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1000040302,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000040302] = {
		name = "背水",
		id = 1000040302,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 32,
				effectFuncs = {
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1000040303,
							value = "self:lostHp()",
							caster = 2
						}
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1000040304,
							value = "target:hpMax()",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000040303] = {
		easyEffectFunc = "hpMax",
		name = "背水",
		time = 99,
		id = 1000040303,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[1000040304] = {
		overlayType = 1,
		name = "背水",
		easyEffectFunc = "heal",
		id = 1000040304,
		overlayLimit = 1,
		isShow = true,
		group = slot0[58],
		specialEffect = slot0[59]
	},
	[1000040401] = {
		name = "镜花",
		time = 99,
		id = 1000040401,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000040402,
							prob = 1,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000040402] = {
		name = "镜花",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1000040402,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1000040403,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000040403] = {
		name = "镜花",
		id = 1000040403,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 10,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							cfgId = 1000040404,
							holder = 1,
							caster = 2,
							value = {
								"target:unitID()",
								"target:star()",
								0,
								{
									1000040405
								}
							}
						}
					},
					{
						{
							__size = 4,
							cfgId = 1000040404,
							holder = 1,
							caster = 2,
							value = {
								"target:unitID()",
								"target:star()",
								0,
								{
									1000040405
								}
							}
						}
					},
					{
						{
							__size = 4,
							cfgId = 1000040404,
							holder = 1,
							caster = 2,
							value = {
								"target:unitID()",
								"target:star()",
								0,
								{
									1000040405
								}
							}
						}
					}
				},
				onSomeFlag = {
					"countObj(\"all\",1)==1 and target:inField()"
				}
			},
			__size = 1
		}
	},
	[1000040404] = {
		name = "镜花",
		easyEffectFunc = "summon",
		id = 1000040404,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[100]
	},
	[1000040405] = {
		name = "镜花",
		easyEffectFunc = "oneHitKill",
		id = 1000040405,
		overlayLimit = 1,
		isShow = true,
		group = slot0[209],
		specialEffect = slot0[210]
	},
	[1000040501] = {
		name = "魅影",
		id = 1000040501,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1000040502,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000040502] = {
		name = "魅影",
		id = 1000040502,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 32,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 9,
							cfgId = 1000040503,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000040503] = {
		name = "魅影",
		easyEffectFunc = "changeAttackTarget",
		overlayLimit = 1,
		id = 1000040503,
		isShow = true,
		group = slot0[340],
		specialVal = slot0[341],
		specialTarget = slot0[36],
		triggerBehaviors = slot0[342],
		specialEffect = slot0[343]
	},
	[1000040601] = {
		name = "灵动",
		time = 99,
		id = 1000040601,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000040602,
							prob = 1,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000040602] = {
		name = "灵动",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1000040602,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1000040603,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000040603] = {
		name = "灵动",
		id = 1000040603,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 10,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 5,
							cfgId = 1000040604,
							holder = 1,
							ignoreAura = 1,
							value = 1,
							caster = 2
						}
					},
					{
						{
							__size = 5,
							cfgId = 1000040605,
							holder = 1,
							ignoreAura = 1,
							value = 1,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:hp()==target:hpMax() and target:inField()"
				}
			},
			__size = 1
		}
	},
	[1000040604] = {
		easyEffectFunc = "attack",
		name = "灵动",
		time = 99,
		combineArgs = true,
		id = 1000040604,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[52]
	},
	[1000040605] = {
		easyEffectFunc = "hpMax",
		name = "灵动",
		time = 99,
		combineArgs = true,
		id = 1000040605,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[1000040701] = {
		name = "共生",
		id = 1000040701,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 2,
							cfgId = 1000040702,
							value = "target:hpMax()",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000040702] = {
		name = "共生",
		id = 1000040702,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 5,
							cfgId = 1000040703,
							value = "self:getBuff(1000040702):getValue()-target2:hpMax()",
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000040703] = {
		easyEffectFunc = "hpMax",
		name = "共生",
		time = 99,
		combineArgs = true,
		id = 1000040703,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[53]
	},
	[1000040801] = {
		name = "棋子",
		time = 99,
		id = 1000040801,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000040802,
							prob = 1,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000040802] = {
		name = "棋子",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1000040802,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1000040803,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()~=self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000040803] = {
		name = "棋子",
		triggerPriority = 9,
		id = 1000040803,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 32,
				__size = 4,
				effectFuncs = {
					"playEffect",
					"castBuff",
					"castBuff",
					"castBuff"
				},
				funcArgs = {
					{
						2
					},
					{
						{
							__size = 4,
							holder = 1,
							cfgId = 1000040804,
							value = 0,
							caster = 2
						}
					},
					{
						{
							__size = 5,
							cfgId = 1000040805,
							holder = 5,
							ignoreAura = 1,
							value = 5,
							caster = 2
						}
					},
					{
						{
							__size = 5,
							cfgId = 1000040806,
							holder = 5,
							ignoreAura = 1,
							value = 5,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:hasBuffGroup(135) and target:inField()"
				}
			},
			__size = 1
		}
	},
	[1000040804] = {
		id = 1000040804,
		name = "棋子",
		easyEffectFunc = "destroy",
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		group = slot0[65]
	},
	[1000040805] = {
		id = 1000040805,
		name = "棋子",
		easyEffectFunc = "attack",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[9]
	},
	[1000040806] = {
		id = 1000040806,
		name = "棋子",
		easyEffectFunc = "hpMax",
		combineArgs = true,
		overlayLimit = 99,
		overlayType = 2,
		group = slot0[82]
	},
	[1000040901] = {
		name = "水月",
		id = 1000040901,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 5,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 7,
							cfgId = 1000040902,
							value = 0,
							caster = 2
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000040902] = {
		name = "水月",
		easyEffectFunc = "oneHitKill",
		id = 1000040902,
		overlayLimit = 1,
		isShow = true,
		group = slot0[209],
		triggerBehaviors = slot0[648],
		specialEffect = slot0[210]
	},
	[1000041001] = {
		name = "治愈",
		time = 99,
		id = 1000041001,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 1,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 5,
							holder = 1,
							cfgId = 1000041002,
							prob = 1,
							value = 0,
							caster = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000041002] = {
		name = "治愈",
		easyEffectFunc = "auraEffect",
		time = 99,
		combineArgs = true,
		overlayLimit = 1,
		overlayType = 1,
		id = 1000041002,
		group = slot0[13],
		triggerBehaviors = {
			{
				__size = 3,
				triggerPoint = 99,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 6,
							cfgId = 1000041003,
							holder = 18,
							caster = 2,
							value = 0,
							prob = "(target2:team()==self:team()) and 1 or 0",
							bond = 1
						}
					}
				}
			},
			__size = 1
		}
	},
	[1000041003] = {
		name = "治愈",
		id = 1000041003,
		overlayLimit = 1,
		overlayType = 1,
		triggerBehaviors = {
			{
				triggerPoint = 18,
				__size = 4,
				effectFuncs = {
					"castBuff"
				},
				funcArgs = {
					{
						{
							__size = 4,
							holder = 5,
							cfgId = 1000041004,
							value = 5,
							caster = 2
						}
					}
				},
				onSomeFlag = {
					"target:inField()"
				}
			},
			__size = 1
		}
	},
	[1000041004] = {
		overlayType = 1,
		name = "治愈",
		easyEffectFunc = "heal",
		id = 1000041004,
		overlayLimit = 1,
		isShow = true,
		group = slot0[58],
		specialEffect = slot0[59]
	},
	__default = {
		__index = {
			equipBond = false,
			easyEffectFunc = "buff1",
			time = 1,
			overlayLimit = 999999,
			overlayType = 0,
			immuneType = 1,
			combineArgs = false,
			groupPower = 101,
			skillTimePos = 1,
			isShow = false,
			group = {},
			immuneBuff = {},
			dispelBuff = {},
			dispelType = {},
			triggerBehaviors = {
				[0] = {
					triggerPoint = 1,
					__size = 1
				},
				__size = 1
			}
		}
	}
}

return csv.auto_chess.buff
