slot0 = {
	{
		__size = 0
	},
	__size = 19,
	[3] = {
		__size = 2,
		x = 0,
		y = 0
	},
	[6] = {
		__size = 2,
		x = 30,
		y = 0
	},
	[9] = {
		"zuzhou_loop"
	},
	[10] = {
		__size = 2,
		x = 0,
		y = -90
	},
	[15] = {
		typ = "opacity",
		__size = 2,
		args = {
			value = 0,
			__size = 1
		}
	},
	[21] = {
		__size = 3,
		flip = true,
		x = 0,
		y = 0
	},
	[22] = {
		"yingcang_loop"
	},
	[38] = {
		"effect_loop3"
	},
	[39] = {
		__size = 2,
		action = {
			death = "effect_break3",
			hit = "effect_hit3",
			__size = 3,
			standby = "effect_loop3"
		},
		unitRes = {
			"buff/quantihudun/xingqiangpf.skel"
		}
	},
	[40] = {
		__size = 2,
		x = 800,
		y = 200
	},
	[41] = {
		__size = 2,
		x = 200,
		y = 400
	},
	[44] = {
		typ = "hide",
		__size = 2,
		args = {
			__size = 2,
			sprite = {
				__size = 1,
				isShow = false
			},
			lifebar = {
				__size = 1,
				isShow = false
			}
		}
	},
	[46] = {
		__size = 2,
		x = 750,
		y = 330
	},
	[59] = {
		"buff_yueying_loop"
	},
	[62] = {
		__size = 2,
		x = 0,
		y = 0
	},
	[79] = {
		__size = 2,
		x = -100,
		y = 30
	},
	[82] = {
		__size = 3,
		flip = true,
		x = 10,
		y = -20
	},
	[90] = {
		"baozou_loop"
	}
}
slot1 = {
	[3633688] = slot0[46],
	[3633644] = slot0[41],
	[3633687] = slot0[46],
	[4601001] = slot0[79],
	default = slot0[3],
	[397653] = slot0[21],
	[4601311] = slot0[82],
	[397015] = slot0[6]
}
slot2 = {
	default = slot0[1],
	[3633596] = slot0[39],
	[3633595] = slot0[39],
	[3633598] = slot0[39],
	[3633597] = slot0[39]
}
slot3 = {
	[4024659] = slot0[59],
	[3633598] = slot0[38],
	[397653] = slot0[22],
	[3633596] = slot0[38],
	[3633597] = slot0[38],
	[3633595] = slot0[38],
	[7031839] = slot0[90],
	[7031838] = slot0[90],
	[4024666] = slot0[59],
	[397222] = slot0[9],
	[397224] = slot0[9],
	[397659] = slot0[22]
}
slot4 = {
	[4071311] = slot0[62],
	[3633598] = slot0[40],
	[397222] = slot0[10],
	[3633596] = slot0[40],
	[3633597] = slot0[40],
	[3633644] = slot0[41],
	[3633595] = slot0[40],
	[4601001] = slot0[79],
	default = slot0[3],
	[397653] = slot0[21],
	[4601311] = slot0[82],
	[397224] = slot0[10],
	[397015] = slot0[6],
	[397659] = slot0[21],
	[7031719] = slot0[62]
}
slot5 = {
	[397331] = slot0[15],
	[4024659] = slot0[44],
	[4101331] = slot0[15],
	[3633668] = slot0[44],
	[4024666] = slot0[44],
	default = slot0[1]
}
csv.skin_effect = {
	__size = 82,
	[397011] = {
		effectResPath = "koudai_shinygengguimega_pifu/hero_shinygengguimega_pifu.skel",
		id = 397011,
		effectAniName = {
			"yuandu_loop"
		}
	},
	[397015] = {
		effectResPath = "koudai_shinygengguimega_pifu/hero_shinygengguimega_pifu.skel",
		effectResDelay = 858,
		onceEffectResPath = "koudai_shinygengguimega_pifu/hero_shinygengguimega_pifu.skel",
		onceEffectWait = true,
		onceEffectAniName = "shijuedusu",
		id = 397015,
		onceEffectOffsetPos = slot1[397015],
		effectAniName = {
			"shijuedusu_loop"
		},
		effectOffsetPos = slot4[397015]
	},
	[397019] = {
		onceEffectResPath = "koudai_shinygengguimega_pifu/hero_shinygengguimega_pifu.skel",
		id = 397019,
		onceEffectAniName = "yuandushang",
		onceEffectWait = true
	},
	[397021] = {
		effectResPath = "koudai_shinygengguimega_pifu/hero_shinygengguimega_pifu.skel",
		id = 397021,
		effectAniName = {
			"bianxing_loop"
		}
	},
	[397222] = {
		onceEffectPos = 4,
		onceEffectDelay = 20,
		onceEffectResPath = "koudai_shinygengguimega_pifu/hero_shinygengguimega_pifu.skel",
		effectResDelay = 900,
		onceEffectWait = true,
		effectResPath = "koudai_shinygengguimega_pifu/hero_shinygengguimega_pifu.skel",
		onceEffectAniName = "zuzhou",
		id = 397222,
		effectAniName = slot3[397222],
		effectOffsetPos = slot4[397222]
	},
	[397224] = {
		onceEffectPos = 4,
		onceEffectDelay = 20,
		onceEffectResPath = "koudai_shinygengguimega_pifu/hero_shinygengguimega_pifu.skel",
		effectResDelay = 900,
		onceEffectWait = true,
		effectResPath = "koudai_shinygengguimega_pifu/hero_shinygengguimega_pifu.skel",
		onceEffectAniName = "zuzhou",
		id = 397224,
		effectAniName = slot3[397224],
		effectOffsetPos = slot4[397224]
	},
	[397225] = {
		onceEffectResPath = "koudai_shinygengguimega_pifu/hero_shinygengguimega_pifu.skel",
		onceEffectAniName = "zuzhoujihuo",
		onceEffectPos = 4,
		id = 397225,
		onceEffectWait = true
	},
	[397320] = {
		onceEffectPos = 3,
		onceEffectResPath = "koudai_shinygengguimega_pifu/hero_shinygengguimega_pifu.skel",
		effectPos = 5,
		onceEffectAniName = "heiyingchangjingchuxian",
		effectResDelay = 990,
		effectResPath = "koudai_shinygengguimega_pifu/hero_shinygengguimega_pifu.skel",
		effectAssignLayer = 4,
		id = 397320,
		effectOnEnd = {
			__size = 3,
			res = "koudai_shinygengguimega_pifu/hero_shinygengguimega_pifu.skel",
			pos = 3,
			aniName = "heiyingchangjingxiaoshi"
		},
		onceEffectOffsetPos = {
			__size = 3,
			flip = true,
			x = 0,
			y = -90
		},
		effectAniName = {
			"heiyingchangjing_loop"
		},
		effectOffsetPos = {
			__size = 2,
			x = 0,
			y = 170
		}
	},
	[397331] = {
		onceEffectPos = 4,
		effectResDelay = 1320,
		onceEffectResPath = "koudai_shinygengguimega_pifu/hero_shinygengguimega_pifu.skel",
		effectResPath = "koudai_shinygengguimega_pifu/hero_shinygengguimega_pifu.skel",
		onceEffectAniName = "guiwu_bianshen",
		id = 397331,
		holderActionType = slot5[397331],
		effectOnEnd = {
			__size = 3,
			res = "koudai_shinygengguimega_pifu/hero_shinygengguimega_pifu.skel",
			pos = 0,
			aniName = "guiwu_huanyuan"
		},
		effectAniName = {
			"guiwu_stanby_loop"
		}
	},
	[397335] = {
		effectResPath = "koudai_shinygengguimega_pifu/hero_shinygengguimega_pifu.skel",
		id = 397335,
		effectAniName = {
			"guiwushouji_loop"
		},
		effectOffsetPos = {
			__size = 3,
			flip = true,
			x = 0,
			y = 40
		}
	},
	[397653] = {
		effectResDelay = 1500,
		onceEffectResPath = "koudai_shinygengguimega_pifu/hero_shinygengguimega_pifu.skel",
		onceEffectWait = true,
		effectResPath = "koudai_shinygengguimega_pifu/hero_shinygengguimega_pifu.skel",
		onceEffectAniName = "yingcang",
		id = 397653,
		deepCorrect = 9,
		holderActionType = {
			typ = "shader",
			playTime = 1,
			__size = 3,
			args = {
				switch = 2,
				buffId = 397653,
				__size = 3,
				extraArgs = {
					0.3,
					0.3,
					0.3,
					0.8
				}
			}
		},
		onceEffectOffsetPos = slot1[397653],
		effectAniName = slot3[397653],
		effectOffsetPos = slot4[397653]
	},
	[397659] = {
		effectResPath = "koudai_shinygengguimega_pifu/hero_shinygengguimega_pifu.skel",
		effectResDelay = 1500,
		id = 397659,
		deepCorrect = 9,
		onceEffectWait = true,
		holderActionType = {
			typ = "opacity",
			__size = 2,
			args = {
				value = 0.6,
				__size = 1
			}
		},
		effectAniName = slot3[397659],
		effectOffsetPos = slot4[397659]
	},
	[762201] = {
		effectResPath = "koudai_chaojichaomengx_pf/hero_chaojichaomengx_pf.skel",
		id = 762201,
		effectAniName = {
			"huajinchuxian_loop"
		}
	},
	[762513] = {
		onceEffectResPath = "koudai_chaojichaomengx_pf/hero_chaojichaomengx_pf.skel",
		id = 762513,
		onceEffectAniName = "quanyichufa"
	},
	[762612] = {
		id = 762612,
		comboPointEffect = {
			__size = 4,
			res = "koudai_chaojichaomengx_pf/hero_chaojichaomengx_pf.skel",
			highLightLimit = 4,
			hideEmptyPoint = true,
			activeAction = "quanyilianjie_loop"
		}
	},
	[2424601] = {
		effectResPath = "buff/manafei_buff/manafei_pifu/ruodingyu.skel",
		id = 2424601,
		effectAniChoose = {
			__size = 2,
			type = 1,
			mapping = {
				1,
				2,
				3,
				4,
				5
			}
		},
		effectAniName = {
			"buff1_loop",
			"buff2_loop",
			"buff3_loop",
			"buff4_loop",
			"standby_loop"
		},
		effectOffsetPos = {
			__size = 2,
			x = 0,
			y = 80
		}
	},
	[2424602] = {
		id = 2424602,
		onceEffectAniName = "effect1",
		onceEffectResPath = "buff/manafei_buff/manafei_pifu/houjingwang_pifu.skel",
		deepCorrect = 11,
		holderActionType = {
			typ = "hide",
			__size = 2,
			args = {
				__size = 2,
				other = {
					__size = 1,
					isShow = false
				},
				lifebar = {
					__size = 1,
					isShow = false
				}
			}
		},
		effectOnEnd = {
			__size = 3,
			res = "buff/manafei_buff/manafei_pifu/houjingwang_pifu.skel",
			pos = 0,
			aniName = "effect2"
		}
	},
	[2424603] = {
		effectResPath = "buff/manafei_buff/manafei_pifu/ruodingyu.skel",
		id = 2424603,
		effectAniName = {
			"standby_loop"
		}
	},
	[3633201] = {
		effectResPath = "koudai_dianxi_megapf/hero_dianxi_megapf.skel",
		onceEffectAniName = "buff_cuicangguangmang_chuxian",
		id = 3633201,
		onceEffectResPath = "koudai_dianxi_megapf/hero_dianxi_megapf.skel",
		effectOnEnd = {
			__size = 3,
			res = "koudai_dianxi_megapf/hero_dianxi_megapf.skel",
			pos = 0,
			aniName = "buff_cuicangguangmang_xiaoshi"
		},
		effectAniName = {
			"buff_cuicangguangmang_loop"
		}
	},
	[3633221] = {
		effectResPath = "koudai_dianxi_megapf/hero_dianxi_megapf.skel",
		id = 3633221,
		effectAniName = {
			"buff_hudun_loop"
		}
	},
	[3633222] = {
		onceEffectResPath = "koudai_dianxi_megapf/hero_dianxi_megapf.skel",
		id = 3633222,
		onceEffectAniName = "buff_hudun_xiaoshi"
	},
	[3633301] = {
		effectResPath = "koudai_dianxi_megapf/hero_dianxi_megapf.skel",
		onceEffectAniName = "buff_fengying_chuxian",
		id = 3633301,
		onceEffectResPath = "koudai_dianxi_megapf/hero_dianxi_megapf.skel",
		effectOnEnd = {
			__size = 3,
			res = "koudai_dianxi_megapf/hero_dianxi_megapf.skel",
			pos = 0,
			aniName = "buff_fengying_xiaoshi"
		},
		effectAniName = {
			"buff_fengying_loop"
		}
	},
	[3633309] = {
		effectResPath = "koudai_dianxi_megapf/hero_dianxi_megapf.skel",
		id = 3633309,
		effectAniName = {
			"buff_lengjing_loop"
		}
	},
	[3633595] = {
		effectResPath = "buff/quantihudun/xingqiangpf.skel",
		effectAssignLayer = 4,
		id = 3633595,
		effectPos = 3,
		effectAniName = slot3[3633595],
		spineEffect = slot2[3633595],
		effectOffsetPos = slot4[3633595]
	},
	[3633596] = {
		effectResPath = "buff/quantihudun/xingqiangpf.skel",
		effectAssignLayer = 4,
		id = 3633596,
		effectPos = 3,
		effectAniName = slot3[3633596],
		spineEffect = slot2[3633596],
		effectOffsetPos = slot4[3633596]
	},
	[3633597] = {
		effectResPath = "buff/quantihudun/xingqiangpf.skel",
		effectAssignLayer = 4,
		id = 3633597,
		effectPos = 3,
		effectAniName = slot3[3633597],
		spineEffect = slot2[3633597],
		effectOffsetPos = slot4[3633597]
	},
	[3633598] = {
		effectResPath = "buff/quantihudun/xingqiangpf.skel",
		effectAssignLayer = 4,
		id = 3633598,
		effectPos = 3,
		effectAniName = slot3[3633598],
		spineEffect = slot2[3633598],
		effectOffsetPos = slot4[3633598]
	},
	[3633644] = {
		onceEffectPos = 5,
		onceEffectResPath = "koudai_dianxi_mega/hero_dianxi_mega.skel",
		effectPos = 3,
		onceEffectAniName = "buff_yanjingyan_chuxian",
		effectResPath = "koudai_dianxi_megapf/hero_dianxi_megapf.skel",
		effectAssignLayer = 2,
		id = 3633644,
		deepCorrect = 20050,
		onceEffectOffsetPos = slot1[3633644],
		effectAniName = {
			"buff_yanjingyan_loop"
		},
		effectOffsetPos = slot4[3633644]
	},
	[3633646] = {
		effectResPath = "koudai_dianxi_megapf/hero_dianxi_megapf.skel",
		id = 3633646,
		effectAniName = {
			"buff_yanjingyan_jihuo_loop"
		}
	},
	[3633668] = {
		effectResPath = "koudai_dianxi_megapf/hero_dianxi_megapf.skel",
		id = 3633668,
		holderActionType = slot5[3633668],
		effectAniName = {
			"die_loop"
		}
	},
	[3633687] = {
		id = 3633687,
		onceEffectResPath = "buff/quantihudun/xingqiangpf.skel",
		onceEffectPos = 5,
		onceEffectAniName = "effect_break3",
		onceEffectOffsetPos = slot1[3633687]
	},
	[3633688] = {
		id = 3633688,
		onceEffectResPath = "buff/quantihudun/xingqiangpf.skel",
		onceEffectPos = 5,
		onceEffectAniName = "effect_break3",
		onceEffectOffsetPos = slot1[3633688]
	},
	[4023215] = {
		effectResPath = "koudai_sejlopifu/hero_sejlopifu.skel",
		id = 4023215,
		effectAniName = {
			"buffdun_loop"
		},
		effectOffsetPos = {
			__size = 2,
			x = -70,
			y = 0
		}
	},
	[4024211] = {
		effectResPath = "koudai_lunaiyalapf/hero_lunaiyalapf.skel",
		id = 4024211,
		holderActionType = {
			typ = "opacity",
			__size = 2,
			args = {
				value = 0.4,
				__size = 1
			}
		},
		effectAniName = {
			"buff_yueyin_loop"
		}
	},
	[4024311] = {
		effectResPath = "koudai_lunaiyalapf/hero_lunaiyalapf.skel",
		id = 4024311,
		effectAniName = {
			"buff_guyue_loop"
		}
	},
	[4024316] = {
		id = 4024316,
		spineEffect = {
			__size = 2,
			skin = "MY",
			unitRes = {
				"koudai_lunaiyalapf/hero_lunaiyalapf.skel"
			}
		}
	},
	[4024611] = {
		effectResPath = "koudai_lunaiyalapf/lunaiyalapf_yuexiang.skel",
		effectAssignLayer = 0,
		effectPos = 7,
		id = 4024611,
		deepCorrect = 19999,
		effectAniName = {
			"suyue"
		}
	},
	[4024614] = {
		effectResPath = "koudai_lunaiyalapf/lunaiyalapf_yuexiang.skel",
		effectAssignLayer = 0,
		effectPos = 5,
		id = 4024614,
		deepCorrect = 19998,
		effectAniName = {
			"beijing_loop"
		},
		effectOffsetPos = {
			__size = 2,
			x = 0,
			y = 400
		}
	},
	[4024621] = {
		effectResPath = "koudai_lunaiyalapf/lunaiyalapf_yuexiang.skel",
		effectAssignLayer = 0,
		effectPos = 7,
		id = 4024621,
		deepCorrect = 19999,
		effectAniName = {
			"xianyue_shang"
		}
	},
	[4024631] = {
		effectResPath = "koudai_lunaiyalapf/lunaiyalapf_yuexiang.skel",
		effectAssignLayer = 0,
		effectPos = 7,
		id = 4024631,
		deepCorrect = 19999,
		effectAniName = {
			"manyue"
		}
	},
	[4024632] = {
		onceEffectResPath = "koudai_lunaiyalapf/hero_lunaiyalapf.skel",
		id = 4024632,
		onceEffectAniName = "buff_yuehua"
	},
	[4024637] = {
		onceEffectResPath = "koudai_lunaiyalapf/hero_lunaiyalapf.skel",
		id = 4024637,
		onceEffectAniName = "buff_yuehua"
	},
	[4024641] = {
		effectResPath = "koudai_lunaiyalapf/lunaiyalapf_yuexiang.skel",
		effectAssignLayer = 0,
		effectPos = 7,
		id = 4024641,
		deepCorrect = 19999,
		effectAniName = {
			"xianyue_xia"
		}
	},
	[4024659] = {
		effectResPath = "koudai_lunaiyalapf/hero_lunaiyalapf.skel",
		id = 4024659,
		holderActionType = slot5[4024659],
		effectAniName = slot3[4024659]
	},
	[4024666] = {
		effectResPath = "koudai_lunaiyalapf/hero_lunaiyalapf.skel",
		id = 4024666,
		holderActionType = slot5[4024666],
		effectAniName = slot3[4024666]
	},
	[4024668] = {
		onceEffectResPath = "koudai_lunaiyalapf/hero_lunaiyalapf.skel",
		id = 4024668,
		onceEffectAniName = "buff_yueying_chuxian"
	},
	[4024669] = {
		onceEffectResPath = "koudai_lunaiyalapf/hero_lunaiyalapf.skel",
		id = 4024669,
		onceEffectAniName = "buff_yueying_xiaoshi"
	},
	[4071214] = {
		id = 4071214,
		spineEffect = {
			__size = 2,
			action = {
				__size = 1,
				hit = "xuli_hit"
			},
			unitRes = {
				"koudai_thhypf/hero_thhypf.skel"
			}
		}
	},
	[4071311] = {
		effectResPath = "koudai_thhypf/hero_thhypf.skel",
		effectAssignLayer = 4,
		effectPos = 5,
		id = 4071311,
		deepCorrect = 998,
		effectAniName = {
			"yanmu_loop"
		},
		effectOffsetPos = slot4[4071311]
	},
	[4071316] = {
		onceEffectResPath = "koudai_thhypf/hero_thhypf.skel",
		id = 4071316,
		onceEffectAniName = "xialuo"
	},
	[4071321] = {
		onceEffectResPath = "koudai_thhypf/hero_thhypf.skel",
		id = 4071321,
		onceEffectAniName = "xialuo"
	},
	[4101011] = {
		id = 4101011,
		pointEffect = {
			__size = 6,
			emptyAction = "guangneng_loop",
			activeAction = "guangneng_loop",
			res = "koudai_naikeluozima_pifu/hero_naikeluozima_pifu_buff.skel",
			offsetY = -25,
			hideEmptyPoint = true,
			offsetX = -90
		}
	},
	[4101017] = {
		id = 4101017,
		onceEffectResPath = "koudai_naikeluozima_pifu/hero_naikeluozima_pifu_buff.skel",
		onceEffectPos = 4,
		onceEffectAniName = "chuantouguangxian",
		onceEffectWait = true,
		onceEffectOffsetPos = {
			__size = 3,
			flip = true,
			x = 360,
			y = 120
		}
	},
	[4101024] = {
		id = 4101024,
		holderActionType = {
			__size = 1,
			list = {
				{
					typ = "hide",
					playType = 1,
					__size = 3,
					args = {
						__size = 3,
						sprite = {
							__size = 1,
							isShow = false
						},
						other = {
							__size = 1,
							isShow = false
						},
						lifebar = {
							__size = 1,
							isShow = false
						}
					}
				},
				{
					playTime = 1,
					typ = "onceEffect",
					playType = 1,
					__size = 4,
					args = {
						__size = 4,
						onceEffectPos = 6,
						onceEffectAniName = "guangzipenyong",
						onceEffectResPath = "koudai_naikeluozima_pifu/hero_naikeluozima_pifu.skel",
						onceEffectOffsetPos = {
							__size = 2,
							x = -520,
							y = 160
						}
					}
				},
				{
					typ = "wait",
					playType = 1,
					__size = 3,
					args = {
						__size = 1,
						lifetime = 352
					}
				},
				{
					typ = "hide",
					playType = 1,
					__size = 3,
					args = {
						__size = 3,
						sprite = {
							__size = 1,
							isShow = true
						},
						other = {
							__size = 1,
							isShow = true
						},
						lifebar = {
							__size = 1,
							isShow = true
						}
					}
				}
			}
		}
	},
	[4101214] = {
		effectResDelay = 594,
		onceEffectResPath = "koudai_naikeluozima_pifu/hero_naikeluozima_pifu_buff.skel",
		onceEffectWait = true,
		effectResPath = "koudai_naikeluozima_pifu/hero_naikeluozima_pifu_buff.skel",
		onceEffectAniName = "lengjing_chuxian",
		id = 4101214,
		deepCorrect = 11,
		effectOnEnd = {
			__size = 3,
			res = "koudai_naikeluozima_pifu/hero_naikeluozima_pifu_buff.skel",
			pos = 0,
			aniName = "lengjing_xiaoshi"
		},
		effectAniName = {
			"lengjing_loop"
		}
	},
	[4101311] = {
		id = 4101311,
		spineEffect = {
			__size = 2,
			action = {
				__size = 1,
				standby = "leishe_loop"
			},
			unitRes = {
				"koudai_naikeluozima_pifu/hero_naikeluozima_pifu.skel"
			}
		}
	},
	[4101314] = {
		id = 4101314,
		onceEffectResPath = "koudai_naikeluozima_pifu/hero_naikeluozima_pifu.skel",
		onceEffectAniName = "leishe_attack",
		onceEffectWait = true,
		onceEffectOffsetPos = {
			__size = 3,
			flip = true,
			x = 1050,
			y = 0
		}
	},
	[4101331] = {
		onceEffectPos = 4,
		effectResDelay = 495,
		onceEffectResPath = "koudai_naikeluozima_pifu/hero_naikeluozima_pifu_buff.skel",
		onceEffectWait = true,
		effectResPath = "koudai_naikeluozima_pifu/hero_naikeluozima_pifu_buff.skel",
		onceEffectAniName = "shijie_chuxian",
		id = 4101331,
		holderActionType = slot5[4101331],
		effectOnEnd = {
			__size = 3,
			res = "koudai_naikeluozima_pifu/hero_naikeluozima_pifu_buff.skel",
			pos = 0,
			aniName = "shijie_xiaoshi"
		},
		effectAniName = {
			"shijie_loop"
		}
	},
	[4101615] = {
		id = 4101615,
		rayEffect = {
			startDelayTime = 10,
			endDelayTime = 400,
			time = 800,
			deep = 13,
			__size = 8,
			effectRes = "koudai_naikeluozima_pifu/hero_naikeluozima_pifu_guangshu.skel",
			aniName = "buff_guangshu_loop",
			scaleX = 1,
			offsetPos = {
				__size = 2,
				x = 0,
				y = 0
			}
		}
	},
	[4101619] = {
		id = 4101619,
		onceEffectResPath = "koudai_naikeluozima_pifu/hero_naikeluozima_pifu_buff.skel",
		onceEffectPos = 4,
		onceEffectAniName = "chuantouguangxian",
		onceEffectWait = true,
		onceEffectOffsetPos = {
			__size = 3,
			flip = true,
			x = 440,
			y = 120
		}
	},
	[4101642] = {
		id = 4101642,
		spineEffect = {
			__size = 2,
			action = {
				__size = 1,
				standby = "baozou_loop"
			},
			unitRes = {
				"koudai_naikeluozima_pifu/hero_naikeluozima_pifu.skel"
			}
		}
	},
	[4112211] = {
		effectResPath = "koudai_majiyana_pifu/hero_majiyana_pifu.skel",
		onceEffectPos = 4,
		onceEffectAniName = "buff_fanzhi_chuxian",
		id = 4112211,
		onceEffectResPath = "koudai_majiyana_pifu/hero_majiyana_pifu.skel",
		effectResDelay = 990,
		onceEffectWait = true,
		effectAniName = {
			"buff_fanzhi_loop"
		}
	},
	[4112212] = {
		onceEffectResPath = "koudai_majiyana_pifu/hero_majiyana_pifu.skel",
		onceEffectAniName = "buff_fanzhi_effect",
		onceEffectPos = 4,
		onceEffectDelay = 1000,
		id = 4112212,
		onceEffectWait = true
	},
	[4431627] = {
		id = 4431627,
		spineEffect = {
			__size = 2,
			action = {
				__size = 2,
				hit = "hit2",
				standby = "standby_loop2"
			},
			unitRes = {
				"koudai_congyoubing/hero_dacongya.skel"
			}
		}
	},
	[4601001] = {
		onceEffectAniName = "zhenqidun_chuxian",
		onceEffectResPath = "koudai_zangmarante_pifu/hero_zangmarante_pifu.skel",
		effectResDelay = 1100,
		onceEffectWait = true,
		effectResPath = "koudai_zangmarante_pifu/hero_zangmarante_pifu.skel",
		onceEffectPos = 4,
		id = 4601001,
		holderActionType = {
			typ = "showShieldBarIcon",
			__size = 1
		},
		effectOnEnd = {
			__size = 3,
			res = "koudai_zangmarante_pifu/hero_zangmarante_pifu.skel",
			pos = 0,
			aniName = "zhenqidun_xiaoshi"
		},
		onceEffectOffsetPos = slot1[4601001],
		effectAniName = {
			"zhenqidun_loop"
		},
		effectOffsetPos = slot4[4601001]
	},
	[4601311] = {
		onceEffectResPath = "koudai_zangmarante_pifu/hero_zangmarante_pifu.skel",
		effectResDelay = 1056,
		onceEffectWait = true,
		effectResPath = "koudai_zangmarante_pifu/hero_zangmarante_pifu.skel",
		onceEffectAniName = "numu_chuxian",
		id = 4601311,
		effectOnEnd = {
			__size = 3,
			res = "koudai_zangmarante_pifu/hero_zangmarante_pifu.skel",
			pos = 0,
			aniName = "numu_xiaoshi"
		},
		onceEffectOffsetPos = slot1[4601311],
		effectAniName = {
			"numu_loop"
		},
		effectOffsetPos = slot4[4601311]
	},
	[4601621] = {
		id = 4601621,
		holderActionType = {
			typ = "changeShieldBar",
			__size = 2,
			args = {
				__size = 10,
				scaleX = 1,
				mulMarkAniName = "hudunyichu_loop",
				mulMarkResPath = "koudai_zangmarante_pifu/hero_zangmarante_pifu.skel",
				aniName = "hudun_loop",
				scaleY = 1.65,
				mulMarkScaleY = 5.8,
				resPath = "koudai_zangmarante_pifu/hero_zangmarante_pifu.skel",
				mulMarkScaleX = 1,
				offSet = {
					__size = 2,
					x = 0,
					y = 1
				},
				mulMarkOffSet = {
					__size = 2,
					x = -18,
					y = 45
				}
			}
		}
	},
	[7031218] = {
		effectResPath = "koudai_sgcjbjlspf/sg_banjila_buff.skel",
		effectPos = 1,
		id = 7031218,
		effectAniName = {
			"7jushi_loop"
		},
		effectOffsetPos = {
			__size = 2,
			x = -600,
			y = 0
		}
	},
	[7031221] = {
		onceEffectResPath = "koudai_sgcjbjlspf/sg_banjila_buff.skel",
		id = 7031221,
		onceEffectAniName = "7jushi"
	},
	[7031222] = {
		onceEffectResPath = "koudai_sgcjbjlspf/sg_banjila_buff.skel",
		id = 7031222,
		onceEffectAniName = "7jushi"
	},
	[7031613] = {
		onceEffectResPath = "koudai_sgcjbjlspf/sg_banjila_buff.skel",
		id = 7031613,
		onceEffectAniName = "1suishi"
	},
	[7031622] = {
		effectResPath = "koudai_sgcjbjlspf/sg_banjila_buff.skel",
		id = 7031622,
		effectAniName = {
			"2hujia_loop"
		}
	},
	[7031627] = {
		effectResPath = "koudai_sgcjbjlspf/hero_sgcjbjlspf.skel",
		id = 7031627,
		effectAniName = {
			"bati_loop"
		}
	},
	[7031719] = {
		effectResPath = "koudai_sgcjbjlspf/sg_banjila_buff.skel",
		effectAssignLayer = 4,
		id = 7031719,
		effectPos = 5,
		effectAniName = {
			"4shabao_loop"
		},
		effectOffsetPos = slot4[7031719]
	},
	[7031838] = {
		id = 7031838,
		effectResPath = "koudai_sgcjbjlspf/hero_sgcjbjlspf.skel",
		effectAniName = slot3[7031838],
		spineEffect = {
			__size = 2,
			skin = "baozou",
			unitRes = {
				"koudai_shanguangbanjilasi_mega/hero_shanguangbanjilasi_mega.skel",
				"koudai_sgcjbjlspf/hero_sgcjbjlspf.skel"
			}
		}
	},
	[7031839] = {
		effectResPath = "koudai_sgcjbjlspf/hero_sgcjbjlspf.skel",
		id = 7031839,
		effectAniName = slot3[7031839]
	},
	[7051113] = {
		effectResPath = "buff/sgcjsnd_buff/sgcjsndyzpf_buff.skel",
		id = 7051113,
		deepCorrect = 9,
		effectAniName = {
			"jingji_loop"
		},
		effectOffsetPos = {
			__size = 2,
			x = 0,
			y = -20
		}
	},
	[7051114] = {
		onceEffectResPath = "buff/sgcjsnd_buff/sgcjsndyzpf_buff.skel",
		id = 7051114,
		onceEffectAniName = "jingji_effect"
	},
	[7051451] = {
		effectResPath = "buff/sgcjsnd_buff/sgcjsndyzpf_buff.skel",
		id = 7051451,
		effectAniName = {
			"meihuofenxiang_loop"
		}
	},
	[7051622] = {
		effectResPath = "buff/sgcjsnd_buff/sgcjsndyzpf_buff.skel",
		effectPos = 2,
		id = 7051622,
		effectAniName = {
			"qinxin_loop"
		},
		effectOffsetPos = {
			__size = 2,
			x = 0,
			y = -140
		}
	},
	[7051633] = {
		effectResPath = "buff/sgcjsnd_buff/sgcjsndyzpf_buff.skel",
		id = 7051633,
		effectAniName = {
			"jjwy_loop"
		}
	},
	[7051634] = {
		id = 7051634,
		deepCorrect = 9,
		effectResPath = "buff/sgcjsnd_buff/sgcjsndyzpf_buff.skel",
		effectAniName = {
			"jjwy_hou_loop"
		}
	},
	__default = {
		__index = {
			effectResPath = "",
			onceEffectResPath = "",
			effectPos = 0,
			onceEffectPos = 0,
			onceEffectWait = false,
			effectAssignLayer = 1,
			effectResDelay = 0,
			onceEffectDelay = 0,
			onceEffectAniName = "effect",
			deepCorrect = 12,
			effectShowOnAttack = false,
			holderActionType = slot5.default,
			effectAniChoose = {
				__size = 1,
				type = 0
			},
			onceEffectOffsetPos = slot1.default,
			effectAniName = {
				"effect_loop"
			},
			spineEffect = slot2.default,
			effectOffsetPos = slot4.default
		}
	}
}

return csv.skin_effect
