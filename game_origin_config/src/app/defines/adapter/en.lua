return {
	["grow_guide.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item1",
				"visible",
				false
			},
			{
				"item2",
				"visible",
				false
			},
			{
				"rightTop.rewardPanel.textTitle",
				"fontSize",
				36
			}
		},
		scaleWithWidth = {
			{
				"title.textTitle",
				nil,
				300
			}
		}
	},
	["clone_battle_city.json"] = {
		dockWithScreen = {
			{
				"btnRule",
				"right",
				nil,
				false
			},
			{
				"btnShowList",
				"right",
				nil,
				false
			}
		},
		set = {
			{
				"btnShowList.text",
				"fontSize",
				40
			}
		}
	},
	["clone_battle_room.json"] = {
		set = {
			{
				"rightPanel.centerPanel.btnJoinItem",
				"visible",
				false
			},
			{
				"rightPanel.centerPanel.normalItem",
				"visible",
				false
			},
			{
				"rightPanel.centerPanel.mainItem",
				"visible",
				false
			},
			{
				"rightPanel.bottomPanel.btnRobot.text",
				"fontSize",
				36
			}
		},
		dockWithScreen = {
			{
				"leftPanel",
				"left"
			},
			{
				"rightPanel",
				"right"
			}
		}
	},
	["clone_battle_friend_invite.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"empty.text",
				"fontSize",
				46
			}
		}
	},
	["gate_section_detail_normal.json"] = {
		set = {
			{
				"rightDown.selectSkip.textJumpNote",
				"fontSize",
				38
			}
		},
		scaleWithWidth = {
			{
				"rightDown.btnChallenge.textNote",
				nil,
				180
			}
		}
	},
	["gate_section_detail_hard.json"] = {
		set = {
			{
				"rightDown.selectSkip.textJumpNote",
				"fontSize",
				38
			}
		},
		scaleWithWidth = {
			{
				"rightDown.btnChallenge.textNote",
				nil,
				180
			}
		}
	},
	["gate_section_detail_nightmare.json"] = {
		scaleWithWidth = {
			{
				"rightDown.btnChallenge.textNote",
				nil,
				180
			}
		}
	},
	["gate_sweep.json"] = {
		set = {
			{
				"itemTitle",
				"visible",
				false
			},
			{
				"item1",
				"visible",
				false
			},
			{
				"innerList",
				"visible",
				false
			},
			{
				"item",
				"visible",
				false
			},
			{
				"successItem",
				"visible",
				false
			},
			{
				"bottomItem",
				"visible",
				false
			}
		},
		scaleWithWidth = {
			{
				"btnAgain.textNote",
				nil,
				240
			}
		}
	},
	["arena.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"ruleRankItem",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"leftDown",
				"left"
			},
			{
				"rightDown",
				"right"
			},
			{
				"top.leftUp",
				"left"
			},
			{
				"top.rightUp",
				"right"
			}
		},
		oneLinePos = {
			{
				"top.leftUp.textNoteFight",
				"top.leftUp.textFightPoint",
				cc.p(10, 0)
			},
			{
				"top.leftUp.textNoteRank",
				"top.leftUp.textRank",
				cc.p(10, 0)
			}
		}
	},
	["arena_combat_record.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item.textFightPoint",
				"positionX",
				{
					370
				}
			}
		},
		oneLinePos = {
			{
				"title.textTitle1",
				"title.textTitle2",
				cc.p(10, 0)
			}
		}
	},
	["card_embattle.json"] = {
		set = {
			{
				"spritePanel",
				"visible",
				false
			},
			{
				"useDefaultBattle",
				"visible",
				false
			},
			{
				"rightDown.btnSaveReady",
				"visible",
				false
			},
			{
				"btnReady",
				"visible",
				false
			},
			{
				"btnReady.textNote",
				"fontSize",
				36
			},
			{
				"btnWeather",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"dailyGateTipsPos",
				"right"
			}
		},
		scaleWithWidth = {
			{
				"rightDown.btnOneKeySet.textNote",
				nil,
				270
			}
		},
		oneLinePos = {
			{
				"rightDown.textNote",
				"rightDown.textNum",
				cc.p(50, 0),
				"left"
			},
			{
				"rightDown.textNum",
				"rightDown.textNote",
				cc.p(10, 0),
				"right"
			},
			{
				"useDefaultBattle.text",
				"useDefaultBattle.checkBox",
				cc.p(270, 0),
				"right"
			},
			{
				"useDefaultBattle.checkBox",
				"useDefaultBattle.text",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["card_attribute.json"] = {
		set = {
			{
				"innerList",
				"visible",
				false
			},
			{
				"trammelItem",
				"visible",
				false
			},
			{
				"medItem",
				"visible",
				false
			},
			{
				"attrItem",
				"visible",
				false
			},
			{
				"center.top.btnInfo",
				"positionX",
				{
					880
				}
			},
			{
				"trammelItem.textNote",
				"fontSize",
				34
			}
		},
		oneLinePos = {
			{
				"center.center.imgIconLife",
				"center.center.textLiftNote",
				cc.p(5, 0)
			},
			{
				"center.center.imgIconAttack",
				"center.center.textAttackNote",
				cc.p(5, 0)
			},
			{
				"center.center.imgSpeAttack",
				"center.center.textSpeAttackNote",
				cc.p(5, 0)
			},
			{
				"center.center.imgIconSpeed",
				"center.center.textSpeedNote",
				cc.p(5, 0)
			},
			{
				"center.center.imgIconDef",
				"center.center.textDefNote",
				cc.p(5, 0)
			},
			{
				"center.center.imgIconSpeDef",
				"center.center.textSpeDefNote",
				cc.p(5, 0)
			},
			{
				"center.center.textLiftNote",
				"center.center.textLifeNum",
				cc.p(5, 0)
			},
			{
				"center.center.textAttackNote",
				"center.center.textAttackNum",
				cc.p(5, 0)
			},
			{
				"center.center.textSpeAttackNote",
				"center.center.textSpeAttackNum",
				cc.p(5, 0)
			},
			{
				"center.center.textSpeedNote",
				"center.center.textSpeedVal",
				cc.p(5, 0)
			},
			{
				"center.center.textDefNote",
				"center.center.textDefNum",
				cc.p(5, 0)
			},
			{
				"center.center.textSpeDefNote",
				"center.center.textSpeDefNum",
				cc.p(5, 0)
			},
			{
				"center.top.textSexNote",
				"center.top.textSexVal",
				cc.p(5, 0)
			},
			{
				"center.top.textNatureNote",
				"center.top.textNature",
				cc.p(5, 0)
			},
			{
				"center.top.textTypeNote",
				"center.top.textTypeNum",
				cc.p(5, 0)
			}
		}
	},
	["card_skill.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"panel.textNote",
				"fontSize",
				36
			},
			{
				"panel.textNum",
				"fontSize",
				46
			},
			{
				"panel.textFlag",
				"fontSize",
				36
			}
		},
		oneLinePos = {
			{
				"panel.btnAdd",
				"panel.fastUpgradePanel",
				cc.p(15, 0),
				"left"
			}
		}
	},
	["card_effortvalue.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"itemAttr",
				"visible",
				false
			},
			{
				"itemTxt",
				"visible",
				false
			},
			{
				"item.currentNum",
				"positionX",
				{
					280
				}
			},
			{
				"itemTxt.num",
				"positionX",
				{
					185
				}
			},
			{
				"panel.btnCustom.txt",
				"fontSize",
				35
			}
		},
		scaleWithWidth = {
			{
				"panel.leftPanel.btn.txt",
				nil,
				110
			},
			{
				"panel.rightPanel.btn.txt",
				nil,
				80
			}
		},
		oneLinePos = {
			{
				"selectPanel.attrTitle",
				"selectPanel.btnAttr",
				cc.p(10, 0),
				"right"
			}
		}
	},
	["card_effortvalue_custom.json"] = {
		set = {
			{
				"slider",
				"capInsets",
				{
					cc.rect(11, 0, 1, 1)
				}
			},
			{
				"sureBtn.txt",
				"fontSize",
				37
			},
			{
				"sliderNum",
				"anchorPoint",
				{
					0.5,
					0
				}
			},
			{
				"num",
				"anchorPoint",
				{
					0,
					0
				}
			}
		}
	},
	["card_nature_attr.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"curFlag",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"textNote3",
				"imgIcon",
				cc.p(15, 0),
				"left"
			}
		},
		scaleWithWidth = {
			{
				"topList.item.textNote",
				nil,
				100
			},
			{
				"topList.item1.textNote",
				nil,
				100
			},
			{
				"topList.item2.textNote",
				nil,
				100
			},
			{
				"topList.item3.textNote",
				nil,
				100
			},
			{
				"topList.item4.textNote",
				nil,
				100
			},
			{
				"topList.item5.textNote",
				nil,
				100
			},
			{
				"topList.item6.textNote",
				nil,
				100
			},
			{
				"topList.item7.textNote",
				nil,
				100
			},
			{
				"topList.item8.textNote",
				nil,
				100
			},
			{
				"topList.item9.textNote",
				nil,
				100
			},
			{
				"topList.item10.textNote",
				nil,
				100
			},
			{
				"topList.item11.textNote",
				nil,
				100
			},
			{
				"topList.item12.textNote",
				nil,
				100
			},
			{
				"topList.item13.textNote",
				nil,
				100
			},
			{
				"topList.item14.textNote",
				nil,
				100
			},
			{
				"topList.item15.textNote",
				nil,
				100
			},
			{
				"topList.item16.textNote",
				nil,
				100
			},
			{
				"topList.item17.textNote",
				nil,
				100
			},
			{
				"rightList.item.textNote",
				nil,
				100
			},
			{
				"rightList.item1.textNote",
				nil,
				100
			},
			{
				"rightList.item2.textNote",
				nil,
				100
			},
			{
				"rightList.item3.textNote",
				nil,
				100
			},
			{
				"rightList.item4.textNote",
				nil,
				100
			},
			{
				"rightList.item5.textNote",
				nil,
				100
			},
			{
				"rightList.item6.textNote",
				nil,
				100
			},
			{
				"rightList.item7.textNote",
				nil,
				100
			},
			{
				"rightList.item8.textNote",
				nil,
				100
			},
			{
				"rightList.item9.textNote",
				nil,
				100
			},
			{
				"rightList.item10.textNote",
				nil,
				100
			},
			{
				"rightList.item11.textNote",
				nil,
				100
			},
			{
				"rightList.item12.textNote",
				nil,
				100
			},
			{
				"rightList.item13.textNote",
				nil,
				100
			},
			{
				"rightList.item14.textNote",
				nil,
				100
			},
			{
				"rightList.item15.textNote",
				nil,
				100
			},
			{
				"rightList.item16.textNote",
				nil,
				100
			},
			{
				"rightList.item17.textNote",
				nil,
				100
			}
		}
	},
	["rebirth_select_role.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"innerList",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title.textNote1",
				"title.textNote2",
				cc.p(15, 0),
				"left"
			},
			{
				"down.textNote",
				"down.textNum",
				cc.p(10, 0),
				"left"
			},
			{
				"item.textNote",
				"item.textFightPoint",
				cc.p(5, 0)
			}
		}
	},
	["rebirth_select_card.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"innerList",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title.textNote1",
				"title.textNote2",
				cc.p(15, 0),
				"left"
			}
		}
	},
	["card_property_swap_view.json"] = {
		set = {
			{
				"leftItem",
				"visible",
				false
			},
			{
				"centerCharacter",
				"visible",
				false
			},
			{
				"centerNvalue",
				"visible",
				false
			},
			{
				"centerEffortValue",
				"visible",
				false
			},
			{
				"centerFeelValue",
				"visible",
				false
			},
			{
				"centerEffortValue.itemAttr",
				"visible",
				false
			},
			{
				"txt",
				"scale",
				0.9
			},
			{
				"centerEffortValue.rightPanel",
				"positionX",
				{
					1310
				}
			},
			{
				"centerCharacter.leftPanel.name",
				"anchorPoint",
				{
					0,
					0.5
				}
			},
			{
				"centerCharacter.rightPanel.name",
				"anchorPoint",
				{
					0,
					0.5
				}
			}
		},
		oneLinePos = {
			{
				"title",
				"title1",
				cc.p(5, 0),
				"left"
			},
			{
				"centerCharacter.leftPanel.character",
				"centerCharacter.leftPanel.name",
				cc.p(5, 0),
				"left"
			},
			{
				"centerCharacter.rightPanel.character",
				"centerCharacter.rightPanel.name",
				cc.p(5, 0),
				"left"
			},
			{
				"centerEffortValue.leftPanel.txt1",
				"centerEffortValue.leftPanel.num1",
				cc.p(15, 0),
				"left"
			},
			{
				"centerEffortValue.itemAttr.name",
				"centerEffortValue.itemAttr.barBg",
				cc.p(60, 0),
				"left"
			},
			{
				"centerEffortValue.itemAttr.name",
				"centerEffortValue.itemAttr.bar",
				cc.p(60, 0),
				"left"
			},
			{
				"centerEffortValue.itemAttr.barBg",
				"centerEffortValue.itemAttr.num",
				cc.p(15, 0),
				"left"
			},
			{
				"centerCharacter.leftPanel.special.name1",
				"centerCharacter.leftPanel.special.num1",
				cc.p(40, 0),
				"left"
			},
			{
				"centerCharacter.leftPanel.special.num1",
				"centerCharacter.leftPanel.special.green",
				cc.p(40, 0),
				"left"
			},
			{
				"centerCharacter.leftPanel.special.name2",
				"centerCharacter.leftPanel.special.num2",
				cc.p(40, 0),
				"left"
			},
			{
				"centerCharacter.leftPanel.special.num2",
				"centerCharacter.leftPanel.special.red",
				cc.p(40, 0),
				"left"
			},
			{
				"centerCharacter.rightPanel.special.name1",
				"centerCharacter.rightPanel.special.num1",
				cc.p(40, 0),
				"left"
			},
			{
				"centerCharacter.rightPanel.special.num1",
				"centerCharacter.rightPanel.special.green",
				cc.p(40, 0),
				"left"
			},
			{
				"centerCharacter.rightPanel.special.name2",
				"centerCharacter.rightPanel.special.num2",
				cc.p(40, 0),
				"left"
			},
			{
				"centerCharacter.rightPanel.special.num2",
				"centerCharacter.rightPanel.special.red",
				cc.p(40, 0),
				"left"
			}
		},
		scaleWithWidth = {
			{
				"centerNvalue.leftPanel.txt",
				nil,
				290
			},
			{
				"centerNvalue.rightPanel.txt",
				nil,
				290
			},
			{
				"centerCharacter.leftPanel.name",
				nil,
				125
			},
			{
				"centerCharacter.rightPanel.name",
				nil,
				125
			}
		}
	},
	["trainer_view.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item2",
				"visible",
				false
			},
			{
				"item2.desc",
				"fontSize",
				36
			},
			{
				"item2.desc1",
				"fontSize",
				36
			},
			{
				"item2.flag",
				"fontSize",
				46
			}
		},
		dockWithScreen = {
			{
				"btnLeft",
				"left"
			},
			{
				"btnRight",
				"right"
			}
		},
		scaleWithWidth = {
			{
				"item2.desc1",
				nil,
				30
			}
		},
		oneLinePos = {
			{
				"sliderBg",
				"txt",
				cc.p(20, -10),
				"right"
			},
			{
				"item2.lv",
				"item2.btnUp",
				cc.p(130, -15),
				"left"
			},
			{
				"item2.lv",
				"item2.flag",
				cc.p(170, -10),
				"left"
			},
			{
				"item2.desc",
				"item2.desc1",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["achievement_main.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"btn",
				"visible",
				false
			},
			{
				"infoItem",
				"visible",
				false
			},
			{
				"rightAll.btnRank.textNote",
				"fontSize",
				42
			}
		}
	},
	["setting.json"] = {
		set = {
			{
				"voiceBtn.text",
				"anchorPointX",
				0.35
			}
		}
	},
	["setting_normal.json"] = {
		set = {
			{
				"centerPanel.item",
				"visible",
				false
			}
		},
		scaleWithWidth = {
			{
				"centerPanel.bottomPanel.btnFeedback.text",
				nil,
				240
			}
		}
	},
	["city.json"] = {
		dockWithScreen = {
			{
				"leftTopPanel",
				"left",
				"up",
				false
			},
			{
				"leftPanel",
				"left",
				nil,
				true
			},
			{
				"leftBottomPanel",
				"left",
				"down",
				false
			},
			{
				"rightPanel",
				"right",
				"up",
				false
			},
			{
				"growGuide",
				"right",
				nil,
				true
			},
			{
				"activityTip",
				"right",
				nil,
				true
			},
			{
				"rightBottomPanel",
				"right",
				"down",
				true
			},
			{
				"centerBottomPanel",
				nil,
				"bottom",
				false
			},
			{
				"developPanel",
				nil,
				"bottom",
				false
			}
		},
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"rightPanel.onlineGiftPanel",
				"visible",
				false
			},
			{
				"growGuide.textNote2",
				"fontSize",
				28
			},
			{
				"rightPanel.showList",
				"contentSize",
				{
					1100,
					300
				}
			}
		},
		oneLinePos = {
			{
				"leftTopPanel.power",
				"leftTopPanel.powerNum",
				cc.p(25, 0),
				"left"
			},
			{
				"leftTopPanel.powerNum",
				"leftTopPanel.power",
				cc.p(0, 0),
				"right"
			}
		}
	},
	["union_skill.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item.name",
				"fontSize",
				30
			}
		},
		oneLinePos = {
			{
				"title1",
				"title2",
				cc.p(10, 0)
			}
		}
	},
	["union_redpack.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item1",
				"visible",
				false
			},
			{
				"btnItem",
				"visible",
				false
			},
			{
				"innweList",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"leftList",
				"left"
			},
			{
				"btnRule",
				"right",
				nil,
				true
			},
			{
				"textTimesNote",
				"right",
				nil,
				true
			},
			{
				"textTimesNum",
				"right",
				nil,
				true
			},
			{
				"textTimesMax",
				"right",
				nil,
				true
			}
		},
		scaleWithWidth = {
			{
				"item1.title.textTitle1",
				nil,
				280
			},
			{
				"item1.title.textTitle2",
				nil,
				280
			}
		}
	},
	["union_send_redpack.json"] = {
		set = {
			{
				"btnSend.textNote",
				"fontSize",
				42
			}
		}
	},
	["union_lobby.json"] = {
		set = {
			{
				"recordTitleItem.monthNote",
				"visible",
				false
			},
			{
				"recordTitleItem.dayNote",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"leftPanel.list",
				"left"
			}
		},
		oneLinePos = {
			{
				"applyPanel.stateNote",
				"applyPanel.state",
				cc.p(10, 0)
			},
			{
				"informationPanel.unionNameNote",
				"informationPanel.unionName"
			},
			{
				"informationPanel.chairmanNameNote",
				"informationPanel.chairmanName"
			},
			{
				"informationPanel.unionExpNote",
				"informationPanel.unionExp"
			},
			{
				"informationPanel.unionIdNote",
				"informationPanel.unionId"
			},
			{
				"informationPanel.unionNumNote",
				"informationPanel.unionNum"
			}
		},
		scaleWithWidth = {
			{
				"informationPanel.disbandBtn.title",
				nil,
				220
			},
			{
				"informationPanel.changeBtn.title",
				nil,
				220
			},
			{
				"informationPanel.emailBtn.title",
				nil,
				220
			},
			{
				"informationPanel.quitBtn.title",
				nil,
				220
			},
			{
				"applyPanel.recruitBtn.title",
				nil,
				220
			},
			{
				"applyPanel.refuseBtn.title",
				nil,
				220
			}
		}
	},
	["union_contribute_main.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"left.textUnionExp",
				"fontSize",
				36
			}
		},
		oneLinePos = {
			{
				"title.textNote1",
				"title.textNote2",
				cc.p(15, 0),
				"left"
			},
			{
				"left.textCountNote",
				"left.textCount",
				cc.p(0, 0),
				"left"
			}
		},
		scaleWithWidth = {
			{
				"top.textWeekAll",
				nil,
				160
			}
		}
	},
	["talent.json"] = {
		set = {
			{
				"rightPanel.subList1",
				"visible",
				false
			},
			{
				"rightPanel.subList2",
				"visible",
				false
			},
			{
				"leftPanel.item",
				"visible",
				false
			},
			{
				"leftPanel.item.normal.subTxt",
				"visible",
				false
			},
			{
				"leftPanel.item.normal.txt",
				"positionY",
				76
			}
		},
		oneLinePos = {
			{
				"rightPanel.txt",
				"rightPanel.num",
				cc.p(20, 0),
				"left"
			}
		},
		scaleWithWidth = {
			{
				"rightPanel.btnReset.title",
				nil,
				250
			}
		}
	},
	["character_select_card.json"] = {
		oneLinePos = {
			{
				"leftPanel.attrPanel.textSumText",
				"leftPanel.attrPanel.textSum",
				cc.p(10, 0)
			},
			{
				"leftPanel.attrPanel.hp.textNote",
				"leftPanel.attrPanel.hp.textNum",
				cc.p(10, 0)
			},
			{
				"leftPanel.attrPanel.speed.textNote",
				"leftPanel.attrPanel.speed.textNum",
				cc.p(10, 0)
			},
			{
				"leftPanel.attrPanel.attack.textNote",
				"leftPanel.attrPanel.attack.textNum",
				cc.p(10, 0)
			},
			{
				"leftPanel.attrPanel.phyFang.textNote",
				"leftPanel.attrPanel.phyFang.textNum",
				cc.p(10, 0)
			},
			{
				"leftPanel.attrPanel.special.textNote",
				"leftPanel.attrPanel.special.textNum",
				cc.p(10, 0)
			},
			{
				"leftPanel.attrPanel.speFang.textNote",
				"leftPanel.attrPanel.speFang.textNum",
				cc.p(10, 0)
			},
			{
				"rightPanel.leftUpPanel.name1",
				"rightPanel.leftUpPanel.txt",
				cc.p(10, 0)
			},
			{
				"topPanel.title",
				"topPanel.subTitle",
				cc.p(10, 0)
			}
		},
		scaleWithWidth = {
			{
				"itemSkill.txt",
				nil,
				30
			}
		}
	},
	["personal_info.json"] = {
		set = {
			{
				"rightPanel.btnShare",
				"visible",
				false
			},
			{
				"leftPanel.medalBtn",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"rightPanel.icon1",
				"rightPanel.name8",
				cc.p(10, 0),
				"left"
			},
			{
				"rightPanel.name8",
				"rightPanel.collect",
				nil,
				"left"
			},
			{
				"rightPanel.collect",
				"rightPanel.icon2",
				cc.p(150, 0),
				"left"
			},
			{
				"rightPanel.icon2",
				"rightPanel.name9",
				cc.p(10, 0),
				"left"
			},
			{
				"rightPanel.name9",
				"rightPanel.unlock",
				nil,
				"left"
			},
			{
				"rightPanel.name7",
				"rightPanel.barBg",
				cc.p(10, 0)
			},
			{
				"rightPanel.name7",
				"rightPanel.bar",
				cc.p(10, 0)
			},
			{
				"rightPanel.barBg",
				"rightPanel.btnExp",
				cc.p(20, 0)
			},
			{
				"rightPanel.name1",
				"rightPanel.name",
				cc.p(10, 0)
			},
			{
				"rightPanel.name4",
				"rightPanel.uid",
				cc.p(-10, 0)
			},
			{
				"rightPanel.name5",
				"rightPanel.level",
				cc.p(10, 0)
			},
			{
				"rightPanel.name6",
				"rightPanel.power",
				cc.p(30, 0)
			}
		},
		dockWithScreen = {
			{
				"leftPanel",
				"left"
			},
			{
				"rightPanel",
				"right"
			}
		}
	},
	["personal_other.json"] = {
		set = {
			{
				"rightPanel.upPanel.levelPanel.txtContent",
				"positionX",
				{
					165
				}
			},
			{
				"rightPanel.upPanel.powerPanel.txtContent",
				"positionX",
				{
					165
				}
			},
			{
				"rightPanel.upPanel.titlePanel.txt",
				"anchorPoint",
				{
					1,
					0.5
				}
			},
			{
				"rightPanel.upPanel.titlePanel.txt",
				"positionX",
				{
					130
				}
			}
		},
		oneLinePos = {
			{
				"title",
				"title1",
				cc.p(10, 0),
				"left"
			},
			{
				"rightPanel.centerPanel.collectPanel.icon",
				{
					"rightPanel.centerPanel.collectPanel.txt",
					"rightPanel.centerPanel.collectPanel.txtContent"
				},
				cc.p(10, 0),
				"left"
			}
		}
	},
	["personal_figure.json"] = {
		set = {
			{
				"itemLogo",
				"visible",
				false
			},
			{
				"itemSkill",
				"visible",
				false
			},
			{
				"addPanel.itemAttr",
				"visible",
				false
			},
			{
				"btnAdd.txt",
				"fontSize",
				46
			},
			{
				"addPanel.title1",
				"fontSize",
				44
			},
			{
				"addPanel.itemAttr.txt",
				"fontSize",
				38
			}
		},
		oneLinePos = {
			{
				"title",
				"title1",
				cc.p(5, 0),
				"left"
			},
			{
				"addPanel.title",
				"addPanel.title1",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["endless_tower_rank.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"achievementItem",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title1",
				"title2",
				cc.p(5, 0),
				"left"
			}
		},
		scaleWithWidth = {
			{
				"textPoint",
				nil,
				300
			},
			{
				"textLv",
				nil,
				300
			}
		}
	},
	["personal_skill_choose.json"] = {
		set = {
			{
				"itemSkill",
				"visible",
				false
			},
			{
				"subList",
				"visible",
				false
			},
			{
				"conditionList",
				"contentSize",
				{
					580,
					92
				}
			},
			{
				"conditionList",
				"positionY",
				{
					375
				}
			},
			{
				"btnSave",
				"positionY",
				{
					300
				}
			},
			{
				"btnRemove",
				"positionY",
				{
					300
				}
			}
		},
		oneLinePos = {
			{
				"title",
				"title1",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["title_book.json"] = {
		set = {
			{
				"leftPanel.item",
				"visible",
				false
			},
			{
				"leftPanel.title",
				"visible",
				false
			},
			{
				"itemAttr",
				"visible",
				false
			},
			{
				"itemCondition",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"rightPanel.name1",
				"rightPanel.title",
				cc.p(15, 0),
				"left"
			}
		},
		scaleWithWidth = {
			{
				"leftPanel.tip",
				nil,
				200
			}
		}
	},
	["friend.json"] = {
		set = {
			{
				"rightPanel",
				"visible",
				false
			},
			{
				"item1",
				"visible",
				false
			},
			{
				"item2",
				"visible",
				false
			},
			{
				"leftItem",
				"visible",
				false
			},
			{
				"leftPanel.panel.friendPanel.getNum",
				"positionX",
				800
			}
		},
		oneLinePos = {
			{
				"item2.txt",
				"item2.power",
				cc.p(5, 0)
			},
			{
				"item1.txt",
				"item1.power",
				cc.p(5, 0)
			}
		},
		scaleWithWidth = {
			{
				"leftPanel.panel.topPanel.btnSort.txt",
				nil,
				110
			}
		}
	},
	["card_info.json"] = {
		set = {
			{
				"itemNature",
				"visible",
				false
			},
			{
				"item",
				"visible",
				false
			},
			{
				"skillItem",
				"visible",
				false
			},
			{
				"rightPanel.skillPanel",
				"visible",
				false
			},
			{
				"rightPanel.attributePanel",
				"visible",
				false
			},
			{
				"starItem",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"titleTxt1",
				"titleTxt2",
				cc.p(5, 0)
			},
			{
				"itemNature.name",
				"itemNature.num",
				cc.p(100, 0)
			}
		}
	},
	["common_card_detail.json"] = {
		set = {
			{
				"baseCardNode.attrItem",
				"visible",
				false
			},
			{
				"baseCardNode.attrItem.bar",
				"contentSize",
				{
					425,
					20
				}
			},
			{
				"baseCardNode.attrItem.barBg",
				"contentSize",
				{
					425,
					20
				}
			},
			{
				"baseCardNode.attrItem.bar",
				"positionX",
				{
					420
				}
			},
			{
				"baseCardNode.attrItem.barBg",
				"positionX",
				{
					420
				}
			}
		},
		oneLinePos = {
			{
				"baseCardNode.raceNote",
				"baseCardNode.raceNum",
				cc.p(15, 0),
				"left"
			}
		}
	},
	["card_star.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"selectPanel.btnCombine.textNote",
				"fontSize",
				30
			},
			{
				"selectPanel.btnFrags.textNote",
				"fontSize",
				30
			}
		},
		oneLinePos = {
			{
				"selectPanel.textNote",
				"selectPanel.textNum",
				cc.p(0, 0),
				"left"
			},
			{
				"panel.textItemNote",
				"panel.btnChange",
				cc.p(0, 0),
				"left"
			}
		}
	},
	["card_star_changefrags.json"] = {
		set = {
			{
				"barPanel.bar",
				"capInsets",
				{
					cc.rect(11, 0, 1, 1)
				}
			},
			{
				"item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"note",
				"textNeedNum",
				cc.p(0, 0),
				"left"
			}
		},
		scaleWithWidth = {
			{
				"item.title",
				nil,
				70
			}
		}
	},
	["union_train.json"] = {
		set = {
			{
				"leftItem",
				"visible",
				false
			},
			{
				"myItem",
				"visible",
				false
			},
			{
				"otherItem",
				"visible",
				false
			},
			{
				"roleItem",
				"visible",
				false
			},
			{
				"otherPanel.empty",
				"visible",
				false
			}
		},
		scaleWithWidth = {
			{
				"otherItem.exp",
				nil,
				360
			},
			{
				"myItem.panelChange.exp",
				nil,
				370
			}
		},
		oneLinePos = {
			{
				"title1",
				"title2"
			}
		}
	},
	["handbook.json"] = {
		dockWithScreen = {
			{
				"left",
				"left"
			},
			{
				"pageList",
				"right"
			}
		},
		set = {
			{
				"attrItem",
				"visible",
				false
			},
			{
				"btnItem",
				"visible",
				false
			},
			{
				"item",
				"visible",
				false
			},
			{
				"item1",
				"visible",
				false
			},
			{
				"attrTmp",
				"visible",
				false
			},
			{
				"center.btnSpecial",
				"visible",
				false
			},
			{
				"center.btnDetail",
				"positionY",
				370
			}
		},
		oneLinePos = {
			{
				"left.textAllAttr",
				"left.btnShowAttrAdd",
				cc.p(15, 0),
				"left"
			},
			{
				"center.attrPanel.textSumText",
				"center.attrPanel.textSum",
				cc.p(15, 0),
				"left"
			},
			{
				"center.attrPanel.speed.textNote",
				"center.attrPanel.speed.textNum",
				cc.p(15, 0),
				"left"
			},
			{
				"center.attrPanel.attack.textNote",
				"center.attrPanel.attack.textNum",
				cc.p(25, 0),
				"left"
			},
			{
				"center.attrPanel.phyFang.textNote",
				"center.attrPanel.phyFang.textNum",
				cc.p(45, 0),
				"left"
			},
			{
				"center.attrPanel.special.textNote",
				"center.attrPanel.special.textNum",
				cc.p(15, 0),
				"left"
			},
			{
				"center.attrPanel.speFang.textNote",
				"center.attrPanel.speFang.textNum",
				cc.p(15, 0),
				"left"
			},
			{
				"center.textHandBookAdd",
				"attrItem.imgIcon",
				cc.p(-260, 0),
				"left"
			},
			{
				"center.textStarAdd",
				"center.starAttr",
				cc.p(15, 0),
				"left"
			},
			{
				"center.starAttr",
				"center.starList",
				cc.p(115, 0),
				"left"
			},
			{
				"center.textSpriteNote",
				{
					"center.textHeightNote",
					"center.textHeightNum"
				},
				cc.p(10, 0),
				"left"
			},
			{
				"center.textHeightNum",
				"center.textWeightNote",
				cc.p(5, 0),
				"left"
			},
			{
				"center.textWeightNote",
				"center.textWeightNum",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["handbook_detail.json"] = {
		oneLinePos = {
			{
				"textTitle1",
				"textTitle2",
				cc.p(5, 0)
			},
			{
				"rightPanel.textNote1",
				"rightPanel.btnDetail",
				cc.p(15, 0)
			},
			{
				"rightPanel.addPanel.textAddNote",
				"rightPanel.addPanel.imgAttr",
				cc.p(15, 0)
			},
			{
				"rightPanel.nextAddPanel.textAddNote",
				"rightPanel.nextAddPanel.imgAttr",
				cc.p(15, 0)
			}
		}
	},
	["handbook_attadd.json"] = {
		set = {
			{
				"panel.innerList",
				"visible",
				false
			},
			{
				"panel.item",
				"visible",
				false
			},
			{
				"panel.item.textName",
				"fontSize",
				30
			},
			{
				"panel.item.textNum",
				"fontSize",
				30
			}
		}
	},
	["handbook_fetter.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"roleItem",
				"visible",
				false
			},
			{
				"item.textTip",
				"positionX",
				380
			}
		}
	},
	["card_feel.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"attrItem",
				"visible",
				false
			},
			{
				"pageItem",
				"visible",
				false
			},
			{
				"rightPanel.attrNote",
				"positionX",
				{
					0
				}
			},
			{
				"rightPanel.textTip",
				"fontSize",
				30
			},
			{
				"leftPanel.btnSelectItem",
				"positionY",
				{
					280
				}
			},
			{
				"attrItem.icon",
				"positionY",
				{
					30
				}
			},
			{
				"attrItem.txtName",
				"positionY",
				{
					30
				}
			},
			{
				"attrItem.txtNum",
				"positionY",
				{
					30
				}
			},
			{
				"attrItem",
				"contentSize",
				{
					400,
					60
				}
			},
			{
				"rightPanel.attrSubList",
				"contentSize",
				{
					800,
					60
				}
			},
			{
				"rightPanel.attrList",
				"contentSize",
				{
					800,
					210
				}
			},
			{
				"rightPanel.textTip",
				"anchorPoint",
				{
					0,
					0.5
				}
			},
			{
				"rightPanel.textTip",
				"position",
				{
					0,
					960
				}
			}
		},
		oneLinePos = {
			{
				"textTitle1",
				"textTitle2",
				cc.p(15, 0),
				"left"
			},
			{
				"leftPanel.lvBg",
				"leftPanel.feelNote",
				cc.p(5, 0),
				"left"
			}
		},
		scaleWithWidth = {
			{
				"leftPanel.btnLvUp.textTitle",
				nil,
				200
			},
			{
				"leftPanel.btnLvUpEasy.textTitle",
				nil,
				200
			}
		}
	},
	["talent_reset.json"] = {
		oneLinePos = {
			{
				"icon",
				"txt1",
				cc.p(-110, 0),
				"right"
			},
			{
				"txt1",
				"icon",
				cc.p(10, 0),
				"left"
			},
			{
				"icon",
				"num",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["common_gain_gold.json"] = {
		set = {
			{
				"numPanel.bg",
				"contentSize",
				{
					400,
					168
				}
			},
			{
				"numPanel.doublePanel.text1",
				"fontSize",
				35
			},
			{
				"numPanel.doublePanel.text2",
				"fontSize",
				35
			},
			{
				"numPanel.doublePanel.text3",
				"fontSize",
				35
			}
		},
		oneLinePos = {
			{
				"numPanel.info",
				"numPanel.num1",
				cc.p(10, 0),
				"left"
			},
			{
				"numPanel.num1",
				"numPanel.info",
				cc.p(5, 0),
				"right"
			}
		}
	},
	["shop.json"] = {
		set = {
			{
				"leftPanel.item",
				"visible",
				false
			},
			{
				"leftPanel.itemParent",
				"visible",
				false
			},
			{
				"leftPanel.itemChild",
				"visible",
				false
			}
		}
	},
	["shop_item.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"rightPanel.subList",
				"visible",
				false
			},
			{
				"item.item1.discount.imgBg",
				"scale",
				1.2
			},
			{
				"item.item1.discount.textNote",
				"fontSize",
				34
			}
		}
	},
	["mystery_shop.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"innerList",
				"visible",
				false
			},
			{
				"item.textName",
				"fontSize",
				36
			},
			{
				"item.flag.imgBg",
				"scale",
				1.2
			},
			{
				"item.flag.textVal",
				"fontSize",
				34
			}
		}
	},
	["activity_passport.json"] = {
		set = {
			{
				"tabItem",
				"visible",
				false
			},
			{
				"rewardItem",
				"visible",
				false
			},
			{
				"iconItem",
				"visible",
				false
			},
			{
				"taskItem",
				"visible",
				false
			},
			{
				"taskPanel",
				"visible",
				false
			},
			{
				"pointItem",
				"visible",
				false
			},
			{
				"shopPanel.item",
				"visible",
				false
			},
			{
				"taskPanel.btnAllGet",
				"positionY",
				{
					15
				}
			},
			{
				"rewardPanel.target.lv",
				"positionY",
				{
					750
				}
			},
			{
				"taskItem.txtExp",
				"positionX",
				870
			},
			{
				"taskItem.txtTitle",
				"fontSize",
				46
			},
			{
				"taskItem.txtCorner1",
				"fontSize",
				32
			},
			{
				"taskPanel.iconTitle3",
				"scale",
				1.6
			},
			{
				"taskItem.txtExp",
				"positionY",
				{
					80
				}
			},
			{
				"rewardPanel.target.lv",
				"fontSize",
				30
			}
		},
		oneLinePos = {
			{
				"rewardPanel.txtNode",
				"rewardPanel.endTime"
			}
		}
	},
	["drawcard.json"] = {
		set = {
			{
				"btnItem",
				"visible",
				false
			},
			{
				"item",
				"visible",
				false
			},
			{
				"cardItem",
				"visible",
				false
			},
			{
				"equipTip.imgBg",
				"width",
				620
			},
			{
				"limitPanel.single.info.img1",
				"positionX",
				200
			}
		},
		dockWithScreen = {
			{
				"list",
				"left"
			},
			{
				"perview",
				"right"
			},
			{
				"shop",
				"right"
			},
			{
				"switchBtn",
				"right"
			},
			{
				"downPanel",
				"right"
			},
			{
				"selfChooseCurrentUp",
				"right"
			}
		},
		oneLinePos = {
			{
				"equipTip.textNote",
				"equipTip.imgIcon",
				cc.p(45, 0),
				"left"
			},
			{
				"equipTip.imgIcon",
				"equipTip.textNote",
				cc.p(5, 0),
				"right"
			},
			{
				"cutDownPanel.imgIcon",
				{
					"cutDownPanel.textNote",
					"cutDownPanel.textTime"
				},
				cc.p(5, 0),
				"left"
			},
			{
				"limitPanel.single.info.img1",
				"limitPanel.single.info.img2",
				cc.p(10, 0)
			}
		},
		oneLineCenterPos = {
			{
				cc.p(215, 42),
				{
					"diamondUpCutDownPanel.textNote",
					"diamondUpCutDownPanel.textTime"
				},
				cc.p(5, 0)
			}
		}
	},
	["card_common_success.json"] = {
		oneLinePos = {
			{
				"item.note",
				"item.txt1",
				cc.p(120, 0),
				"left"
			},
			{
				"item.txt1",
				{
					"item.iconArrow",
					"item.txt2"
				},
				cc.p(15, 0),
				"left"
			}
		}
	},
	["arena_pass_reward.json"] = {
		set = {
			{
				"item.textReward",
				"anchorPoint",
				{
					0.5,
					0.5
				}
			},
			{
				"item.textReward",
				"positionX",
				130
			}
		},
		oneLinePos = {
			{
				"item.textScore",
				"item.score",
				cc.p(5, 0)
			}
		}
	},
	["card_equip_strengthen.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"panel.strengthenPanel.txt4",
				"panel.strengthenPanel.txt3",
				cc.p(220, 0),
				"right"
			},
			{
				"panel.strengthenPanel.txt3",
				"panel.strengthenPanel.txt4",
				cc.p(8, 0),
				"left"
			},
			{
				"panel.strengthenPanel.txt3",
				"panel.strengthenPanel.txt1",
				cc.p(-155, 0),
				"right"
			},
			{
				"panel.strengthenPanel.txt1",
				"panel.strengthenPanel.txt2",
				cc.p(8, 0),
				"left"
			},
			{
				"panel.strengthenPanel.txt3",
				"panel.strengthenPanel.txt5",
				cc.p(-150, 0),
				"right"
			},
			{
				"panel.strengthenPanel.txt5",
				"panel.strengthenPanel.txt6",
				cc.p(8, 0),
				"left"
			}
		},
		scaleWithWidth = {
			{
				"panel.strengthenPanel.btnFast.textNote",
				nil,
				200
			},
			{
				"panel.strengthenPanel.btnOne.textNote",
				nil,
				200
			},
			{
				"panel.strengthenPanel.btnStrengthen.textNote",
				nil,
				200
			}
		}
	},
	["activity_limit_buy_gift.json"] = {
		set = {
			{
				"leftPanel.item",
				"visible",
				false
			},
			{
				"rightPanel.lv",
				"positionX",
				680
			},
			{
				"rightPanel.countPanel.countTimeBg",
				"contentSize",
				{
					550,
					66
				}
			},
			{
				"rightPanel.countPanel.countTimeNode",
				"fontSize",
				42
			},
			{
				"rightPanel.countPanel.countTime",
				"fontSize",
				52
			}
		},
		oneLinePos = {
			{
				"rightPanel.countPanel.countTimeNode",
				"rightPanel.countPanel.countTime",
				cc.p(5, 0),
				"left"
			}
		},
		scaleWithWidth = {
			{
				"leftPanel.item.btn.name",
				nil,
				210
			}
		}
	},
	["held_item_common_success.json"] = {
		oneLinePos = {
			{
				"item.note",
				"item.txt1",
				cc.p(100, 0)
			}
		},
		set = {
			{
				"item.txt1",
				"fontSize",
				40
			},
			{
				"item.txt2",
				"fontSize",
				40
			},
			{
				"item.note",
				"fontSize",
				38
			}
		}
	},
	["activity_once_recharge_award.json"] = {
		oneLinePos = {
			{
				"btnRules",
				"time",
				cc.p(100, 0),
				"right"
			}
		}
	},
	["activity_world_boss.json"] = {
		set = {
			{
				"centerPanel.skillItem",
				"visible",
				false
			},
			{
				"centerPanel.title",
				"contentSize",
				{
					520,
					44
				}
			},
			{
				"centerPanel.title",
				"positionX",
				570
			},
			{
				"centerPanel.title.txt2",
				"anchorPoint",
				{
					0,
					0.5
				}
			},
			{
				"centerPanel.nameBg.name",
				"fontSize",
				47
			}
		},
		oneLinePos = {
			{
				"centerPanel.title.txt",
				"centerPanel.title.txt1",
				cc.p(2, 0)
			},
			{
				"centerPanel.title.txt1",
				"centerPanel.title.txt2",
				cc.p(2, 0)
			}
		}
	},
	["activity_liveness_wheel.json"] = {
		set = {
			{
				"taskItem",
				"visible",
				false
			},
			{
				"selected",
				"visible",
				false
			},
			{
				"taskPanel.taskTips",
				"fontSize",
				34
			},
			{
				"timeTitle",
				"fontSize",
				38
			},
			{
				"time",
				"fontSize",
				38
			}
		},
		oneLinePos = {
			{
				"timeTitle",
				"time"
			},
			{
				"btnSkip",
				"tips",
				cc.p(10, 0)
			}
		}
	},
	["recharge.json"] = {
		dockWithScreen = {
			{
				"privilegePanel.leftBtn",
				"left"
			},
			{
				"privilegePanel.rightBtn",
				"right"
			}
		},
		set = {
			{
				"rechargePanel.item",
				"visible",
				false
			},
			{
				"privilegePanel.panel",
				"visible",
				false
			},
			{
				"rechargePanel.item.doublePanel.label",
				"contentSize",
				{
					90,
					93
				}
			},
			{
				"rechargePanel.item.doublePanel.label",
				"fontSize",
				28
			}
		},
		oneLineCenter = {
			{
				"privilegePanel.panel.oldIcon",
				"privilegePanel.panel.textNode",
				"privilegePanel.panel.oldPrice",
				cc.p(5, 0)
			},
			{
				"privilegePanel.panel.icon",
				"privilegePanel.panel.textNode2",
				"privilegePanel.panel.price",
				cc.p(5, 0)
			}
		},
		oneLinePos = {
			{
				"topPanel.maxPanel.label",
				"topPanel.maxPanel.vipIcon",
				cc.p(0, 0)
			}
		}
	},
	["activity_level_fund.json"] = {
		oneLinePos = {
			{
				"bg",
				"buyBtn",
				cc.p(-280, -20)
			},
			{
				"buyBtn",
				"diamondNum",
				cc.p(-200, 0)
			},
			{
				"diamondNum",
				"diamondIcon",
				cc.p(5, 4)
			}
		}
	},
	["activity_new_player_welfare.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"iconItem",
				"visible",
				false
			},
			{
				"ImageActivity.imgSptireName",
				"position",
				{
					625,
					120
				}
			},
			{
				"ImageActivity.imgTotalDay",
				"positionX",
				520
			}
		},
		scaleWithWidth = {
			{
				"item.textGotten",
				nil,
				200
			}
		}
	},
	["activity_recharge_wheel.json"] = {
		scaleWithWidth = {
			{
				"recordPanel.btnJumpToRecharge.txtNode",
				nil,
				220
			}
		}
	},
	["activity_item_buy.json"] = {
		set = {
			{
				"item.logoDesc",
				"fontSize",
				28
			},
			{
				"item.mask.label",
				"fontSize",
				33
			},
			{
				"item.logo",
				"scale",
				1.1
			},
			{
				"item.mask.img",
				"contentSize",
				{
					360,
					80
				}
			}
		}
	},
	["activity_month_card.json"] = {
		set = {
			{
				"panel1.list",
				"anchorPoint",
				{
					0.5,
					0
				}
			},
			{
				"panel2.list",
				"anchorPoint",
				{
					0.5,
					0
				}
			},
			{
				"panel1.list",
				"positionX",
				392
			},
			{
				"panel2.list",
				"positionX",
				392
			},
			{
				"panel1.list",
				"scale",
				0.75
			},
			{
				"panel2.list",
				"scale",
				0.75
			}
		},
		oneLinePos = {
			{
				"panel1.item4.label",
				"panel1.item4.num",
				nil,
				"left"
			},
			{
				"panel1.item2.label1",
				"panel1.item2.label2",
				nil,
				"left"
			},
			{
				"panel1.label",
				"panel1.num",
				nil,
				"left"
			},
			{
				"panel1.textHas",
				"panel1.num",
				nil,
				"textHasNum"
			},
			{
				"panel2.item4.label",
				"panel2.item4.num",
				nil,
				"left"
			},
			{
				"panel2.item2.label1",
				"panel2.item2.label2",
				nil,
				"left"
			},
			{
				"panel2.label",
				"panel2.num",
				nil,
				"left"
			},
			{
				"panel2.textHas",
				"panel2.num",
				nil,
				"textHasNum"
			}
		}
	},
	["activity_month_card_privilege.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"list",
				"anchorPoint",
				{
					0.1,
					0
				}
			}
		}
	},
	["dispatch_task.json"] = {
		scaleWithWidth = {
			{
				"item.btnReward.textNote",
				nil,
				280
			}
		},
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"attrItem",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"bottomPanel.taskTimeNote",
				"bottomPanel.taskTime",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["dispatch_task_sprite_select.json"] = {
		scaleWithWidth = {
			{
				"rightPanel.title",
				nil,
				300
			}
		},
		set = {
			{
				"rightPanel.title",
				"positionX",
				525
			},
			{
				"rightPanel.condition1",
				"fontSize",
				36
			},
			{
				"rightPanel.condition2",
				"fontSize",
				36
			},
			{
				"rightPanel.extraCondition1",
				"fontSize",
				36
			},
			{
				"rightPanel.extraCondition2",
				"fontSize",
				36
			}
		}
	},
	["craft_main.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"special.imgIconBg",
				"contentSize",
				{
					260,
					58
				}
			},
			{
				"special.textNote",
				"fontSize",
				30
			}
		},
		oneLinePos = {
			{
				"top1.down.textFightPointNote",
				"top1.down.textFightPoint",
				cc.p(10, 0),
				"left"
			},
			{
				"top2.down.textFightPointNote",
				"top2.down.textFightPoint",
				cc.p(10, 0),
				"left"
			},
			{
				"top3.down.textFightPointNote",
				"top3.down.textFightPoint",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["activity_gold_lucky_cat.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"numItem",
				"visible",
				false
			},
			{
				"txt4",
				"visible",
				false
			},
			{
				"txtVipTips",
				"visible",
				false
			},
			{
				"iconVipTips",
				"visible",
				false
			},
			{
				"dialogPanel.vip5",
				"visible",
				false
			},
			{
				"txt4",
				"contentSize",
				{
					340,
					114
				}
			}
		}
	},
	["activity_lucky_cat.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"numItem",
				"visible",
				false
			},
			{
				"txt4",
				"visible",
				false
			},
			{
				"txtVipTips",
				"visible",
				false
			},
			{
				"iconVipTips",
				"visible",
				false
			},
			{
				"dialogPanel.vip5",
				"visible",
				false
			},
			{
				"dialogPanel.descNormal",
				"fontSize",
				36
			},
			{
				"dialogPanel.descVip10",
				"fontSize",
				36
			},
			{
				"txt",
				"fontSize",
				38
			}
		}
	},
	["random_tower_point_reward.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item1",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"down.textTodayNote",
				"down.textScore",
				cc.p(5, 0),
				"left"
			},
			{
				"down.textTodayNote",
				"down.textNote",
				cc.p(300, 0),
				"left"
			},
			{
				"down.textAwardNote",
				"down.list",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["craft_schedule.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"roleItem",
				"visible",
				false
			},
			{
				"item.btnReplay",
				"contentSize",
				{
					200,
					80
				}
			},
			{
				"item.btnReplay.textNote",
				"positionX",
				100
			},
			{
				"topLeftPanel.textNote2",
				"positionX",
				750
			}
		},
		dockWithScreen = {
			{
				"btnMainSchedule",
				"left"
			},
			{
				"btnMyTeam",
				"left"
			},
			{
				"btns",
				"right"
			},
			{
				"topLeftPanel",
				"left"
			},
			{
				"leftDown",
				"left"
			}
		},
		oneLinePos = {
			{
				"item.textNoteLeft",
				"item.textFightPointL",
				cc.p(10, 0)
			},
			{
				"item.textNoteRight",
				"item.textFightPointR",
				cc.p(10, 0)
			}
		}
	},
	["card_character.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"subList",
				"visible",
				false
			},
			{
				"panel1.txt2",
				"scale",
				0.65
			},
			{
				"panel1.txt3",
				"scale",
				0.65
			},
			{
				"panel1.txt4",
				"scale",
				0.65
			},
			{
				"panel1.txt5",
				"scale",
				0.65
			},
			{
				"panel1.txt6",
				"scale",
				0.65
			},
			{
				"panel2.txt2",
				"scale",
				0.65
			},
			{
				"panel2.txt3",
				"scale",
				0.65
			},
			{
				"panel2.txt4",
				"scale",
				0.65
			},
			{
				"panel2.txt5",
				"scale",
				0.65
			},
			{
				"panel2.txt6",
				"scale",
				0.65
			},
			{
				"panel3.txt2",
				"scale",
				0.65
			},
			{
				"panel3.txt3",
				"scale",
				0.65
			},
			{
				"panel3.txt4",
				"scale",
				0.65
			},
			{
				"panel3.txt5",
				"scale",
				0.65
			},
			{
				"panel3.txt6",
				"scale",
				0.65
			},
			{
				"panel1.txt4",
				"positionX",
				388
			},
			{
				"panel2.txt4",
				"positionX",
				388
			},
			{
				"panel3.txt4",
				"positionX",
				388
			},
			{
				"item.name",
				"positionX",
				85
			},
			{
				"item.img",
				"positionX",
				645
			}
		},
		oneLinePos = {
			{
				"titleTxt1",
				"titleTxt2",
				cc.p(15, 0),
				"left"
			},
			{
				"commentPanel.txt4",
				"commentPanel.txt3",
				cc.p(160, 0),
				"right"
			},
			{
				"commentPanel.txt3",
				"commentPanel.txt2",
				cc.p(10, 0),
				"right"
			},
			{
				"commentPanel.txt2",
				"commentPanel.txt1",
				cc.p(35, 0),
				"right"
			},
			{
				"commentPanel.txt3",
				"commentPanel.txt4",
				cc.p(35, 0),
				"left"
			},
			{
				"commentPanel.txt4",
				"commentPanel.txt5",
				cc.p(10, 0),
				"left"
			},
			{
				"commentPanel.txt5",
				"commentPanel.txt6",
				cc.p(35, 0),
				"left"
			},
			{
				"commentPanel.txt6",
				"commentPanel.txt7",
				cc.p(10, 0),
				"left"
			},
			{
				"commentPanel.img2",
				"commentPanel.txt8",
				cc.p(-10, 0),
				"right"
			},
			{
				"commentPanel.txt8",
				"commentPanel.img2",
				cc.p(35, 0),
				"left"
			},
			{
				"commentPanel.img2",
				"commentPanel.txt9",
				cc.p(10, 0),
				"left"
			},
			{
				"commentPanel.txt8",
				"commentPanel.img1",
				cc.p(10, 0),
				"right"
			}
		},
		scaleWithWidth = {
			{
				"item.name",
				nil,
				80
			}
		}
	},
	["card_battle_recommend.json"] = {
		set = {
			{
				"item.recommendPanel.textRecommend",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title",
				"title1",
				cc.p(15, 0),
				"left"
			}
		}
	},
	["gift_choose.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"sliderPanel.slider",
				"capInsets",
				{
					cc.rect(11, 0, 1, 1)
				}
			},
			{
				"title.textNote",
				"positionX",
				{
					160
				}
			}
		},
		oneLinePos = {
			{
				"title.textNote",
				"title.textNote2",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["drawcard_preview.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"roleItem",
				"visible",
				false
			},
			{
				"innerList",
				"visible",
				false
			},
			{
				"textItem",
				"visible",
				false
			},
			{
				"textItem.textName",
				"fontSize",
				40
			},
			{
				"textItem.textVal",
				"fontSize",
				40
			}
		}
	},
	["union_select_sprite.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title1",
				"title2",
				cc.p(15, 0),
				"left"
			},
			{
				"textNumNote",
				"textNum"
			}
		}
	},
	["explore_draw_item_view.json"] = {
		set = {
			{
				"onePanel.costPanel.bg",
				"contentSize",
				{
					485,
					80
				}
			},
			{
				"onePanel.costPanel.bg",
				"positionX",
				318
			},
			{
				"topRightPanel.txt1",
				"fontSize",
				36
			},
			{
				"topRightPanel.txt",
				"positionX",
				60
			}
		}
	},
	["activity_resource_retrieve.json"] = {
		set = {
			{
				"item.textType",
				"fontSize",
				36
			},
			{
				"item.textState",
				"anchorPoint",
				{
					0,
					0.5
				}
			},
			{
				"item.textState",
				"positionX",
				{
					25
				}
			},
			{
				"item.img3",
				"anchorPoint",
				{
					0,
					0.5
				}
			},
			{
				"item.img3",
				"positionX",
				{
					15
				}
			}
		}
	},
	["union_main.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"scrollBuilding.dailygift.imgTextBG",
				"contentSize",
				{
					72,
					260
				}
			},
			{
				"scrollBuilding.dailygift.textNote",
				"positionY",
				{
					223
				}
			},
			{
				"scrollBuilding.training.imgTextBG",
				"contentSize",
				{
					72,
					295
				}
			},
			{
				"scrollBuilding.training.textNote",
				"positionY",
				{
					585
				}
			},
			{
				"scrollBuilding.dailygift.imgTextBGMask",
				"contentSize",
				{
					72,
					320
				}
			},
			{
				"scrollBuilding.training.imgTextBGMask",
				"contentSize",
				{
					72,
					320
				}
			},
			{
				"scrollBuilding.unionskill.imgTextBGMask",
				"contentSize",
				{
					72,
					320
				}
			},
			{
				"scrollBuilding.fuben.imgTextBGMask",
				"contentSize",
				{
					72,
					320
				}
			},
			{
				"scrollBuilding.unionfight.imgTextBGMask",
				"contentSize",
				{
					72,
					320
				}
			},
			{
				"scrollBuilding.unionFuli.imgTextBGMask",
				"contentSize",
				{
					72,
					320
				}
			},
			{
				"scrollBuilding.unionNoName3.imgTextBGMask",
				"contentSize",
				{
					72,
					320
				}
			},
			{
				"scrollBuilding.fragdonate.imgTextBGMask",
				"contentSize",
				{
					72,
					320
				}
			},
			{
				"scrollBuilding.unionAnswer.imgTextBGMask",
				"contentSize",
				{
					72,
					320
				}
			},
			{
				"scrollBuilding.unionfight.imgTextBGMask",
				"positionY",
				222
			},
			{
				"scrollBuilding.dailygift.imgTextBGMask",
				"positionY",
				191
			},
			{
				"scrollBuilding.training.imgTextBGMask",
				"positionY",
				573
			},
			{
				"scrollBuilding.unionskill.imgTextBGMask",
				"positionY",
				442
			},
			{
				"scrollBuilding.fuben.imgTextBGMask",
				"positionY",
				213
			},
			{
				"scrollBuilding.fragdonate.imgTextBGMask",
				"positionY",
				315
			},
			{
				"scrollBuilding.unionAnswer.imgTextBGMask",
				"positionY",
				143
			}
		},
		dockWithScreen = {
			{
				"redpacket",
				"right"
			},
			{
				"leftUp",
				"left"
			}
		}
	},
	["union_current_state.json"] = {
		set = {
			{
				"needRequest.textNote",
				"fontSize",
				36
			},
			{
				"refuse.textNote",
				"fontSize",
				36
			},
			{
				"free.textNote",
				"fontSize",
				36
			}
		}
	},
	["card_changename.json"] = {
		set = {
			{
				"nameField",
				"contentSize",
				{
					500,
					45
				}
			}
		}
	},
	["activity_duanwu_fabrication.json"] = {
		set = {
			{
				"item.name",
				"fontSize",
				{
					34
				}
			}
		}
	},
	["character_select_figure.json"] = {
		set = {
			{
				"topPanel.subTitle",
				"visible",
				false
			}
		}
	},
	["activity_direct_buy_gift.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item.subList",
				"visible",
				false
			},
			{
				"item.item",
				"visible",
				false
			},
			{
				"item.mask.img",
				"contentSize",
				{
					350,
					80
				}
			}
		}
	},
	["common_prompt_box.json"] = {
		set = {
			{
				"content",
				"contentSize",
				{
					850,
					460
				}
			}
		}
	},
	["common_item_detail.json"] = {
		set = {
			{
				"baseNode.name",
				"fontSize",
				44
			}
		}
	},
	["activity_poster.json"] = {
		oneLinePos = {
			{
				"leftPanel.checkBox",
				"leftPanel.title",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["activity_server_open_discount.json"] = {
		set = {
			{
				"item.name",
				"fontSize",
				35
			},
			{
				"newPrice.num",
				"fontSize",
				45
			}
		},
		oneLinePos = {
			{
				"oldPrice.icon",
				"oldPrice.textNode",
				cc.p(15, 10),
				"right"
			},
			{
				"newPrice.icon",
				"newPrice.textNode_1",
				cc.p(15, 10),
				"right"
			},
			{
				"newPrice",
				"txt",
				cc.p(80, 5),
				"left"
			}
		}
	},
	["activity_weekly_card.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"text1",
				"fontSize",
				50
			},
			{
				"textCountDown",
				"fontSize",
				50
			}
		}
	},
	["activity_limit_sprite.json"] = {
		set = {
			{
				"bottomPanel.item",
				"visible",
				false
			},
			{
				"rightPanel.rankItem",
				"visible",
				false
			},
			{
				"rightPanel.scoreItem",
				"visible",
				false
			},
			{
				"leftPanel.drawTenPanel.textBg",
				"positionX",
				205
			},
			{
				"rightPanel.timeTextNote",
				"positionY",
				1050
			},
			{
				"rightPanel.timeTextNote",
				"positionX",
				235
			},
			{
				"rightPanel.timeText",
				"positionY",
				1050
			},
			{
				"rightPanel.timeText",
				"positionX",
				523
			},
			{
				"leftPanel.drawTenPanel.textBg.text",
				"fontSize",
				28
			},
			{
				"leftPanel.drawOnePanel.textBg.text",
				"fontSize",
				28
			},
			{
				"bottomPanel.text",
				"fontSize",
				22
			},
			{
				"bottomPanel.text",
				"scale",
				1.5
			}
		}
	},
	["activity_chinese_new_year.json"] = {
		oneLinePos = {
			{
				"text",
				"time",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["activity_get_particulars.json"] = {
		oneLinePos = {
			{
				"name",
				"txt",
				cc.p(-20, 0),
				"right"
			},
			{
				"txt",
				"name",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["activity_lucky_egg.json"] = {
		set = {
			{
				"mainPanel.drawOnePanel.oneBg.text",
				"fontSize",
				28
			}
		}
	},
	["arena_point_reward.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item1",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title.textTitle1",
				"title.textTitle2",
				cc.p(15, 0),
				"left"
			},
			{
				"down.textTodayNote",
				"down.textScore"
			}
		}
	},
	["union_gate_rank.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title1",
				"title2",
				cc.p(15, 0),
				"left"
			}
		}
	},
	["mail.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item1",
				"visible",
				false
			},
			{
				"btnItem",
				"visible",
				false
			},
			{
				"right",
				"visible",
				false
			},
			{
				"left.noMailPanel.textNote",
				"fontSize",
				46
			},
			{
				"right.textTitle",
				"fontSize",
				45
			}
		}
	},
	["common_send_text.json"] = {
		oneLinePos = {
			{
				"texe2",
				"num2",
				cc.p(15, 0),
				"left"
			},
			{
				"texe3",
				{
					"num3",
					"currency"
				},
				cc.p(15, 0),
				"left"
			}
		}
	},
	["clone_battle_spr_show.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item.text",
				"fontSize",
				34
			}
		}
	},
	["card_star_skill.json"] = {
		set = {
			{
				"barPanel.bar",
				"capInsets",
				{
					cc.rect(11, 0, 1, 1)
				}
			},
			{
				"item",
				"visible",
				false
			},
			{
				"selectPanel",
				"visible",
				false
			},
			{
				"cardItem",
				"visible",
				false
			},
			{
				"selectPanel",
				"visible",
				false
			},
			{
				"selectPanel.subList",
				"visible",
				false
			},
			{
				"item",
				"contentSize",
				{
					300,
					102
				}
			},
			{
				"item.btn",
				"contentSize",
				{
					300,
					102
				}
			},
			{
				"item.btn",
				"positionX",
				{
					150
				}
			},
			{
				"item.title",
				"positionX",
				{
					150
				}
			},
			{
				"item.title",
				"fontSize",
				35
			},
			{
				"textTips",
				"anchorPoint",
				{
					0,
					0.5
				}
			},
			{
				"cardPanel2.btnFrags",
				"contentSize",
				{
					280,
					102
				}
			},
			{
				"cardPanel2.btnFrags.textNote",
				"positionX",
				{
					140
				}
			},
			{
				"selectPanel.btnCombine",
				"contentSize",
				{
					200,
					102
				}
			},
			{
				"selectPanel.btnCombine.textNote",
				"positionX",
				{
					100
				}
			}
		},
		oneLinePos = {
			{
				"btnList",
				"textTips",
				cc.p(0, -40)
			},
			{
				"selectPanel.textNote",
				"selectPanel.textNum",
				cc.p(10, 0)
			},
			{
				"selectPanel.btnCombine",
				"selectPanel.btnFrags",
				cc.p(0, 0)
			}
		},
		scaleWithWidth = {
			{
				"cardPanel2.btnFrags.textNote",
				nil,
				240
			},
			{
				"selectPanel.btnCombine.textNote",
				nil,
				160
			},
			{
				"selectPanel.btnFrags.textNote",
				nil,
				200
			}
		}
	},
	["random_tower_select_event.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"textTitle",
				"anchorPoint",
				{
					0.5,
					0.5
				}
			}
		}
	},
	["activity_recharge_gift.json"] = {
		set = {
			{
				"itemBox",
				"visible",
				false
			},
			{
				"item",
				"visible",
				false
			},
			{
				"txtBg",
				"contentSize",
				{
					1100,
					84
				}
			}
		},
		oneLinePos = {
			{
				"txtBg1",
				"rmb",
				cc.p(10, 0),
				"left"
			},
			{
				"txtBg2",
				"box",
				cc.p(-40, 0),
				"left"
			},
			{
				"box",
				"txtBg2",
				cc.p(8, 0),
				"right"
			}
		}
	},
	["activity_fight_rank.json"] = {
		set = {
			{
				"centerPanel.mainPanel.fightAwardPanel.item",
				"visible",
				false
			},
			{
				"centerPanel.mainPanel.rankAwardPanel.item",
				"visible",
				false
			},
			{
				"centerPanel.mainPanel.rankPanel.item",
				"visible",
				false
			},
			{
				"centerPanel.spritePanel.item",
				"visible",
				false
			},
			{
				"leftPanel.item",
				"visible",
				false
			},
			{
				"centerPanel.mainPanel.fightAwardPanel",
				"visible",
				false
			},
			{
				"centerPanel.mainPanel.rankAwardPanel",
				"visible",
				false
			},
			{
				"centerPanel.mainPanel.rankPanel",
				"visible",
				false
			},
			{
				"topPanel.ruleBtn",
				"positionX",
				1250
			}
		}
	},
	["login_server.json"] = {
		set = {
			{
				"leftItem",
				"visible",
				false
			},
			{
				"item",
				"visible",
				false
			},
			{
				"subList",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"hideTip",
				"hideIcon",
				cc.p(40, 0),
				"right"
			},
			{
				"hideIcon",
				"hideTip",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["battle.json"] = {
		dockWithScreen = {
			{
				"topLeftPanel",
				"left",
				"up",
				false
			},
			{
				"topRightPanel",
				"right",
				"up",
				false
			},
			{
				"midPanel.widgetPanel.speedRank",
				"right",
				nil,
				true
			},
			{
				"midPanel.widgetPanel.wavePanel",
				"left",
				"up",
				false
			},
			{
				"midPanel.skip",
				"left",
				nil,
				true
			},
			{
				"bottomLeftPanel",
				"left",
				"down",
				false
			},
			{
				"bottomRightPanel",
				"right",
				"down",
				false
			}
		},
		set = {
			{
				"midPanel.widgetPanel.topinfo.weather",
				"visible",
				false
			},
			{
				"midPanel.widgetPanel.weatherInfo",
				"visible",
				false
			},
			{
				"bottomRightPanel.skillInfo",
				"visible",
				false
			},
			{
				"bottomLeftPanel.mainSkillPass.imgClose.text",
				"fontSize",
				25
			},
			{
				"bottomLeftPanel.mainSkillPass.imgClose.text",
				"width",
				100
			}
		}
	},
	["activity_passport_buy.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item.txtDiscount",
				"fontSize",
				40
			}
		}
	},
	["union_fight_fighting_list.json"] = {
		set = {
			{
				"itemBattle.baseNode.rightEmpty.text",
				"fontSize",
				34
			},
			{
				"itemBattle.baseNode.leftEmpty.text",
				"fontSize",
				34
			}
		}
	},
	["union_fight_fighting_list_dialog.json"] = {
		set = {
			{
				"itemBattle.baseNode.rightEmpty.text",
				"fontSize",
				34
			},
			{
				"itemBattle.baseNode.leftEmpty.text",
				"fontSize",
				34
			}
		}
	},
	["union_combat_star.json"] = {
		set = {
			{
				"text",
				"fontSize",
				50
			}
		}
	},
	["union_fight_assign.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item.info.textFightPoint",
				"scale",
				0.9
			},
			{
				"item.info.textFightNote",
				"scale",
				0.9
			},
			{
				"item1",
				"visible",
				false
			},
			{
				"item2",
				"visible",
				false
			},
			{
				"innerList",
				"visible",
				false
			},
			{
				"timeInfo.textTimeNote",
				"fontSize",
				40
			}
		},
		oneLinePos = {
			{
				"item.info.textFightNote",
				"item.info.textFightPoint",
				cc.p(10, 0)
			}
		}
	},
	["card_comment_rank.json"] = {
		set = {
			{
				"left.item",
				"visible",
				false
			},
			{
				"right.commentRank.left.pageItem",
				"visible",
				false
			},
			{
				"right.commentRank.right.item",
				"visible",
				false
			},
			{
				"right.fightingRank.right.item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title.txt",
				"title.txt1",
				cc.p(10, 0)
			},
			{
				"right.commentRank.right.item.imgCompare",
				"right.commentRank.right.item.txtCompare",
				cc.p(20, 0),
				"right"
			},
			{
				"right.commentRank.left.scoreBg.txt3",
				"right.commentRank.left.scoreBg.img",
				cc.p(20, 0)
			}
		}
	},
	["gem_add_effect.json"] = {
		set = {
			{
				"item2",
				"visible",
				false
			},
			{
				"harm",
				"visible",
				false
			},
			{
				"effect",
				"visible",
				false
			},
			{
				"suitItem",
				"visible",
				false
			},
			{
				"noItem",
				"visible",
				false
			},
			{
				"suitItem",
				"contentSize",
				{
					650,
					228
				}
			},
			{
				"suitPanel.suitList",
				"contentSize",
				{
					1950,
					228
				}
			},
			{
				"list",
				"contentSize",
				{
					1950,
					1103
				}
			}
		},
		oneLinePos = {
			{
				"effect.name",
				"effect.num",
				cc.p(100, 0)
			},
			{
				"suitItem.num",
				"suitItem.txt1",
				cc.p(50, 0)
			},
			{
				"suitItem.num",
				"suitItem.txt2",
				cc.p(50, 0)
			}
		}
	},
	["gem_resonance.json"] = {
		oneLinePos = {
			{
				"titleTxt1",
				"titleTxt2",
				cc.p(5, 0),
				"left"
			}
		},
		set = {
			{
				"title1",
				"anchorPoint",
				{
					0.4,
					0.5
				}
			},
			{
				"title2",
				"fontSize",
				35
			},
			{
				"icon1.txt",
				"fontSize",
				35
			},
			{
				"icon2.txt",
				"fontSize",
				35
			},
			{
				"icon3.txt",
				"fontSize",
				35
			},
			{
				"icon4.txt",
				"fontSize",
				35
			},
			{
				"icon5.txt",
				"fontSize",
				35
			}
		}
	},
	["gem_strengthen.json"] = {
		oneLinePos = {
			{
				"titleTxt1",
				"titleTxt2",
				cc.p(5, 0)
			}
		}
	},
	["gem_draw.json"] = {
		oneLinePos = {
			{
				"autoDecompose",
				"txtAutoDecompose",
				cc.p(0, 0),
				"left"
			},
			{
				"drawOnePanel.cutDownPanel.textNote",
				"drawOnePanel.cutDownPanel.imgIcon",
				cc.p(10, 0),
				"right"
			},
			{
				"drawOnePanel2.cutDownPanel.textNote",
				"drawOnePanel2.cutDownPanel.imgIcon",
				cc.p(10, 0),
				"right"
			}
		},
		set = {
			{
				"txtAutoDecompose",
				"fontSize",
				30
			},
			{
				"drawOnePanel.cutDownPanel.textNote",
				"fontSize",
				30
			},
			{
				"drawOnePanel2.cutDownPanel.textNote",
				"fontSize",
				30
			}
		}
	},
	["gem_index.json"] = {
		set = {
			{
				"counTxt1",
				"scale",
				0.8
			},
			{
				"counTxt2",
				"scale",
				0.8
			},
			{
				"list",
				"contentSize",
				{
					755,
					662
				}
			}
		},
		oneLinePos = {
			{
				"titleTxt1",
				"titleTxt2",
				cc.p(5, 0)
			}
		}
	},
	["gem_preview.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item1",
				"visible",
				false
			},
			{
				"item2",
				"visible",
				false
			},
			{
				"item21",
				"visible",
				false
			},
			{
				"item21.textName",
				"fontSize",
				38
			},
			{
				"item21.textName",
				"textVal",
				38
			}
		}
	},
	["gem_select_sprite.json"] = {
		oneLinePos = {
			{
				"titleTxt1",
				"titleTxt2",
				cc.p(0, 0),
				"left"
			}
		}
	},
	["gem_resolve.json"] = {
		oneLinePos = {
			{
				"titleTxt1",
				"titleTxt2",
				cc.p(5, 0),
				"left"
			},
			{
				"jumpShop.textNote1",
				"jumpShop.textNote2",
				cc.p(10, 0),
				"left"
			}
		},
		set = {
			{
				"jumpShop.textNote1",
				"fontSize",
				40
			},
			{
				"jumpShop.textNote2",
				"fontSize",
				40
			}
		}
	},
	["gem.json"] = {
		set = {
			{
				"left.btnDraw",
				"positionX",
				120
			},
			{
				"left.btnDecompose",
				"positionX",
				120
			}
		}
	},
	["gem_filter.json"] = {
		set = {
			{
				"item.name",
				"fontSize",
				25
			}
		}
	},
	["gate_quick.json"] = {
		set = {
			{
				"leftPanel.tabItem",
				"visible",
				false
			},
			{
				"panel.listPanel",
				"visible",
				false
			},
			{
				"panel.listPanel.item",
				"visible",
				false
			},
			{
				"panel1.panelNormal.listPanel",
				"visible",
				false
			},
			{
				"panel1.panelNormal.listPanel.item1",
				"visible",
				false
			},
			{
				"item",
				"visible",
				false
			},
			{
				"panel1.btnBuy1.txt",
				"anchorPoint",
				{
					0.5,
					0.5
				}
			},
			{
				"panel1.btnBuy1.txt",
				"positionX",
				{
					160
				}
			},
			{
				"panel1.btnBuy1.txt",
				"fontSize",
				40
			}
		}
	},
	["cross_arena_embattle.json"] = {
		set = {
			{
				"battlePanel1.imgDuiwu.textNote",
				"fontSize",
				25
			},
			{
				"battlePanel2.imgDuiwu.textNote",
				"fontSize",
				25
			}
		},
		oneLinePos = {
			{
				"battlePanel1.fightNote.textFightNote",
				"battlePanel1.fightNote.textFightPoint",
				cc.p(5, 0)
			},
			{
				"battlePanel2.fightNote.textFightNote",
				"battlePanel2.fightNote.textFightPoint",
				cc.p(5, 0)
			}
		}
	},
	["cross_arena_combat_record.json"] = {
		set = {
			{
				"myPanel.item",
				"visible",
				false
			},
			{
				"goodPanel.item",
				"visible",
				false
			},
			{
				"leftPanel.tabItem",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title.textTitle1",
				"title.textTitle2",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["cross_arena_stage_reward.json"] = {
		set = {
			{
				"rewardPanel.rankItem",
				"visible",
				false
			},
			{
				"rewardPanel1.rankItem",
				"visible",
				false
			},
			{
				"rewardPanel2.rankItem",
				"visible",
				false
			},
			{
				"rewardPanel3.rankItem",
				"visible",
				false
			},
			{
				"leftPanel.tabItem",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"topPanel.txtNode",
				"topPanel.txtNode1",
				cc.p(5, 0)
			}
		}
	},
	["card_bag.json"] = {
		scaleWithWidth = {
			{
				"panelBtn.btn1.textNote",
				nil,
				140
			},
			{
				"panelBtn.btn2.textNote",
				nil,
				140
			},
			{
				"panelBtn.btn3.textNote",
				nil,
				140
			}
		}
	},
	["trainer_skill_upgrade.json"] = {
		oneLinePos = {
			{
				"txt1",
				"curr",
				cc.p(10, 0)
			},
			{
				"txt2",
				"next",
				cc.p(10, 0)
			}
		}
	},
	["trainer_attr.json"] = {
		scaleWithWidth = {
			{
				"name",
				nil,
				50
			}
		}
	},
	["activity_item_exchange.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"item.checkPanel.ignoreHint",
				"item.checkPanel.checkBox",
				cc.p(5, 0),
				"right"
			}
		},
		scaleWithWidth = {
			{
				"item.exchangebtn.label",
				nil,
				230
			}
		}
	},
	["main_schedule_eight.json"] = {
		scaleWithWidth = {
			{
				"pageBtns.btnChampion.textNote",
				nil,
				200
			}
		}
	},
	["card_equip_fast_strengthen.json"] = {
		set = {
			{
				"top.bg",
				"positionX",
				{
					670
				}
			},
			{
				"top.subBtn",
				"positionX",
				{
					520
				}
			},
			{
				"top.addBtn",
				"positionX",
				{
					823
				}
			},
			{
				"top.nameMax",
				"positionX",
				{
					670
				}
			}
		},
		oneLinePos = {
			{
				"materialNote",
				"title",
				cc.p(10, 0),
				"left"
			}
		},
		scaleWithWidth = {
			{
				"title",
				nil,
				1000
			}
		}
	},
	["handbook_break.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"btnItem",
				"visible",
				false
			},
			{
				"item.btnBreak",
				"contentSize",
				{
					260,
					122
				}
			},
			{
				"item.btnBreak.textNote",
				"positionX",
				{
					130
				}
			}
		},
		oneLinePos = {
			{
				"panel.title.textNote1",
				"panel.title.textNote2",
				cc.p(10, 0),
				"left"
			}
		},
		scaleWithWidth = {
			{
				"item.btnBreak.textNote",
				nil,
				230
			}
		}
	},
	["held_item_bag.json"] = {
		set = {
			{
				"innweList",
				"visible",
				false
			},
			{
				"attrInnerList",
				"visible",
				false
			},
			{
				"item",
				"visible",
				false
			},
			{
				"item1",
				"visible",
				false
			},
			{
				"roleItem",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"right.center.textHoldEffect",
				"right.center.btnInfo",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["held_item_advance.json"] = {
		set = {
			{
				"leftPanel.attrSubList",
				"visible",
				false
			},
			{
				"strengthenPanel.itemSubList",
				"visible",
				false
			},
			{
				"strengthenPanel.slider",
				"capInsets",
				{
					cc.rect(11, 0, 1, 1)
				}
			}
		},
		oneLinePos = {
			{
				"advancePanel.attrNote",
				"advancePanel.btnInfo",
				cc.p(10, 0),
				"left"
			}
		},
		scaleWithWidth = {
			{
				"advancePanel.btnAdvance.title",
				nil,
				230
			}
		}
	},
	["held_item_advance_select.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"textNote",
				"textNum",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["craft_battle_enemy.json"] = {
		set = {
			{
				"imgStar",
				"visible",
				false
			},
			{
				"finalPanel.championPanel.bg",
				"scale",
				0.8
			},
			{
				"finalPanel.finalFourPanel.bg",
				"scale",
				0.8
			}
		},
		oneLinePos = {
			{
				"topPanel.txtNode",
				"topPanel.txtNode2",
				cc.p(10, 0),
				"left"
			},
			{
				"rolePanel.txtNodeRecord",
				"rolePanel.txtRecord",
				cc.p(10, 0),
				"left"
			}
		},
		scaleWithWidth = {
			{
				"finalPanel.championPanel.txtNode",
				nil,
				100
			},
			{
				"finalPanel.semifinalsPanel.txtNode",
				nil,
				100
			},
			{
				"finalPanel.finalFourPanel.txtNode",
				nil,
				100
			}
		}
	},
	["craft_battle.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"imgStar",
				"visible",
				false
			},
			{
				"roleItem",
				"visible",
				false
			},
			{
				"up.spe.textTitle",
				"fontSize",
				25
			}
		},
		oneLinePos = {
			{
				"down.textNum",
				"down.textNote1",
				cc.p(10, 0),
				"right"
			}
		},
		scaleWithWidth = {
			{
				"down.btnOneKeySet.textNote",
				nil,
				300
			}
		}
	},
	["random_tower_use_buff.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title.textTitle1",
				"title.textTitle2",
				cc.p(5, 0),
				"left"
			},
			{
				"textNote",
				"textNum",
				cc.p(5, 0)
			}
		}
	},
	["random_tower_rank.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title.textTitle1",
				"title.textTitle2",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["personal_overflow_experience.json"] = {
		oneLinePos = {
			{
				"up.title1",
				"up.title2",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["arena_rank.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title.textTitle1",
				"title.textTitle2",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["trainer_attr_skills.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"titleTxt1",
				"titleTxt2",
				cc.p(10, 0),
				"left"
			},
			{
				"txt5",
				{
					"num",
					"icon",
					"btnReset"
				},
				cc.p(10, 0),
				"left"
			}
		},
		scaleWithWidth = {
			{
				"item.panel.attrName",
				nil,
				35
			}
		}
	},
	["card_nvalue.json"] = {
		set = {
			{
				"panel.down.textNote",
				"positionY",
				300
			}
		}
	},
	["arena_personal_info.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title.textTitle1",
				"title.textTitle2"
			},
			{
				"top.textNameNote",
				"top.textName"
			},
			{
				"top.textRankNote",
				"top.textRank"
			},
			{
				"top.textFightPointNote",
				"top.textFightPoint"
			},
			{
				"top.textUnionNote",
				"top.textUnion"
			}
		}
	},
	["daily_activity_rank.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title.textTitle1",
				"title.textTitle2"
			}
		}
	},
	["explore_decompose_view.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"subList",
				"visible",
				false
			},
			{
				"item1",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title",
				"title1"
			}
		}
	},
	["craft_bet.json"] = {
		set = {
			{
				"betPanel.betItem",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"topPanel.txtNode",
				"topPanel.txtNode2",
				cc.p(10, 0)
			}
		}
	},
	["union_gate_progress.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title1",
				"title2",
				cc.p(10, 0)
			}
		}
	},
	["activity.json"] = {
		set = {
			{
				"leftPanel.item",
				"visible",
				false
			},
			{
				"rightPanel.topPanel.iconAll",
				"visible",
				false
			},
			{
				"rightPanel.topPanel.name",
				"fontSize",
				85
			}
		},
		scaleWithWidth = {
			{
				"rightPanel.topPanel.iconAll.txt",
				nil,
				230
			}
		}
	},
	["union_frag_donate.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"item.haveNote",
				"item.haveNum",
				cc.p(10, 0)
			}
		}
	},
	["union_info.json"] = {
		oneLinePos = {
			{
				"title.textNote1",
				"title.textNote2",
				cc.p(10, 0)
			}
		}
	},
	["card_advance_onekey.json"] = {
		oneLinePos = {
			{
				"titleTxt1",
				"titleTxt2",
				nil,
				"left"
			}
		}
	},
	["mystery_shop_show.json"] = {
		set = {
			{
				"imgTip",
				"scale",
				2.5
			}
		}
	},
	["talent_detail.json"] = {
		scaleWithWidth = {
			{
				"upgradePanel.btnUpgrade.title",
				nil,
				300
			}
		}
	},
	["card_attrdetail.json"] = {
		set = {
			{
				"list.centerPanel.attrPanel1.item",
				"contentSize",
				{
					415,
					42
				}
			},
			{
				"list.centerPanel.attrPanel1.innerList",
				"contentSize",
				{
					830,
					42
				}
			},
			{
				"list.centerPanel.attrPanel1.item.txt1",
				"positionY",
				{
					21
				}
			},
			{
				"list.centerPanel.attrPanel1.item.txt2",
				"positionY",
				{
					21
				}
			},
			{
				"list.centerPanel.attrPanel1.item.txt1",
				"fontSize",
				36
			},
			{
				"list.centerPanel.attrPanel1.item.txt2",
				"fontSize",
				36
			}
		},
		oneLinePos = {
			{
				"titleTxt1",
				"titleTxt2",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["card_upgrade.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"slider",
				"capInsets",
				{
					cc.rect(11, 0, 1, 1)
				}
			}
		},
		oneLinePos = {
			{
				"titleTxt1",
				"titleTxt2",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["common_gain_stamina.json"] = {
		oneLinePos = {
			{
				"content.leftTimesInfo",
				"content.leftTimes1",
				cc.p(120, 0),
				"left"
			},
			{
				"content.leftTimes1",
				"content.leftTimesInfo",
				cc.p(10, 0),
				"right"
			}
		}
	},
	["common_gain_way.json"] = {
		set = {
			{
				"item.title",
				"fontSize",
				52
			}
		}
	},
	["zawake_choose_frag.json"] = {
		set = {
			{
				"tipPanel.imgTextBg",
				"scaleX",
				1.5
			},
			{
				"innerList",
				"visible",
				false
			},
			{
				"item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title.textNote1",
				"title.textNote2",
				cc.p(10, 0)
			}
		}
	},
	["card_property_swap_choose.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"subList",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title",
				"title1",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["rebirth_main.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"btnItem",
				"visible",
				false
			},
			{
				"innerList",
				"visible",
				false
			},
			{
				"starItem",
				"visible",
				false
			},
			{
				"attrItem",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"left.panelGem",
				"left",
				nil,
				true
			},
			{
				"left.panelChip",
				"left",
				nil,
				true
			},
			{
				"right",
				"right",
				nil,
				true
			},
			{
				"page",
				"right",
				nil,
				true
			}
		},
		oneLinePos = {
			{
				"left.panelDecompose.jumpShop.textNote1",
				"left.panelDecompose.jumpShop.textNote2",
				cc.p(0, 3),
				"left"
			}
		},
		scaleWithWidth = {
			{
				"left.panelChip.txtInfo01",
				nil,
				500
			},
			{
				"left.panelChip.txtInfo02",
				nil,
				500
			}
		}
	},
	["union_embattle.json"] = {
		set = {
			{
				"btnOneKeySet.textNote",
				"fontSize",
				40
			}
		}
	},
	["union_fight_battle_review.json"] = {
		oneLinePos = {
			{
				"itemBattle.baseNode.rightPanel.team",
				"itemBattle.baseNode.rightPanel.hpText",
				cc.p(100, 0),
				"left"
			},
			{
				"itemBattle.baseNode.leftPanel.team",
				"itemBattle.baseNode.leftPanel.hpText",
				cc.p(100, 0),
				"left"
			}
		}
	},
	["gem_details.json"] = {
		set = {
			{
				"panel.title",
				"anchorPoint",
				{
					0.3,
					0.5
				}
			}
		},
		oneLinePos = {
			{
				"panel.quile",
				"panel.quality",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["activity_weekly_card.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"textCountDown",
				"text1",
				cc.p(-300, 5),
				"right"
			}
		}
	},
	["craft_battle_enemy.json"] = {
		set = {
			{
				"imgStar",
				"visible",
				false
			},
			{
				"finalPanel.substitutePanel.txtNode",
				"fontSize",
				25
			},
			{
				"finalPanel.championPanel.txtNode",
				"fontSize",
				25
			},
			{
				"finalPanel.semifinalsPanel.txtNode",
				"fontSize",
				25
			},
			{
				"finalPanel.finalFourPanel.txtNode",
				"fontSize",
				25
			}
		},
		oneLinePos = {
			{
				"rolePanel.txtNodeRecord",
				"rolePanel.txtRecord",
				cc.p(10, 0),
				"left"
			},
			{
				"topPanel.txtNode",
				"topPanel.txtNode2",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["craft_rank.json"] = {
		set = {
			{
				"leftPanel.tabItem",
				"visible",
				false
			},
			{
				"rankPanel.rankItem",
				"visible",
				false
			},
			{
				"rewardPanel.rewardItem",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"topPanel.title",
				"topPanel.subTitle",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["cross_craft_rank.json"] = {
		set = {
			{
				"leftPanel.tabItem",
				"visible",
				false
			},
			{
				"rankPanel.rankItem",
				"visible",
				false
			},
			{
				"rewardPanel.rewardItem",
				"visible",
				false
			},
			{
				"rewardPanel.txtNode1",
				"positionX",
				{
					250
				}
			}
		},
		oneLinePos = {
			{
				"topPanel.txtNode",
				"topPanel.txtNode1",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["cross_craft_array_info.json"] = {
		set = {
			{
				"prePanel.group",
				"visible",
				false
			},
			{
				"prePanel.group.item",
				"visible",
				false
			},
			{
				"finalPanel.group",
				"visible",
				false
			},
			{
				"finalPanel.group.item",
				"visible",
				false
			},
			{
				"finalPanel.backup.item",
				"visible",
				false
			},
			{
				"finalPanel.backup.txt",
				"fontSize",
				25
			},
			{
				"finalPanel.group.state",
				"fontSize",
				25
			}
		},
		oneLinePos = {
			{
				"topPanel.title1",
				"topPanel.title2",
				cc.p(5, 0),
				"left"
			},
			{
				"rolePanel.txt",
				"rolePanel.record",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["cross_craft_embattle.json"] = {
		set = {
			{
				"up.special",
				"visible",
				false
			},
			{
				"down.btnOneKey.txt",
				"fontSize",
				40
			},
			{
				"up.groupItem.state",
				"scale",
				0.1
			}
		},
		oneLinePos = {
			{
				"prepare.title",
				"prepare.round",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["cross_craft_bet.json"] = {
		set = {
			{
				"leftPanel.tabItem",
				"visible",
				false
			},
			{
				"betPanel.betItem",
				"visible",
				false
			}
		}
	},
	["cross_craft_myschedule.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item.time.textTime",
				"fontSize",
				75
			}
		}
	},
	["cross_craft_mainschedule.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item1",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"leftDown",
				"left",
				"down"
			},
			{
				"btnMySchedule",
				"right",
				"down"
			}
		},
		oneLinePos = {
			{
				"view1.title.imgTitle1",
				"view1.title.imgTitle2",
				cc.p(5, 0),
				"left"
			},
			{
				"view1.title.imgTitle2",
				"view1.title.imgTitle3",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["common_details.json"] = {
		set = {
			{
				"baseNode.title",
				"anchorPoint",
				{
					0.3,
					0.5
				}
			}
		},
		oneLinePos = {
			{
				"baseNode.quile",
				"baseNode.quality",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["beach_ice_rank.json"] = {
		oneLinePos = {
			{
				"title.txt",
				"title.txt1",
				cc.p(5, 0),
				"left"
			}
		},
		scaleWithWidth = {
			{
				"right.noRank.img3.txt",
				nil,
				550
			}
		},
		set = {
			{
				"right.rank.item",
				"visible",
				false
			}
		}
	},
	["volleyball_reward.json"] = {
		oneLinePos = {
			{
				"topPanel.txtNode",
				"topPanel.txtNode1",
				cc.p(5, 0),
				"left"
			}
		},
		set = {
			{
				"rewardPanel1.rankItem",
				"visible",
				false
			},
			{
				"rewardPanel2.rankItem",
				"visible",
				false
			},
			{
				"leftPanel.tabItem",
				"visible",
				false
			}
		},
		scaleWithWidth = {
			{
				"leftPanel.tabItem.selected.txt",
				nil,
				235
			}
		}
	},
	["volleyball_game.json"] = {
		set = {
			{
				"scoreboard.enemy.txt",
				"fontSize",
				50
			}
		}
	},
	["activity_once_recharge_award.json"] = {
		set = {
			{
				"rechargeItem1.txtTitleNode",
				"fontSize",
				28
			},
			{
				"rechargeItem2.txtTitleNode",
				"fontSize",
				28
			},
			{
				"rechargeItem3.txtTitleNode",
				"fontSize",
				28
			},
			{
				"rechargeItem4.txtTitleNode",
				"fontSize",
				30
			},
			{
				"rechargeItem5.txtTitleNode",
				"fontSize",
				30
			},
			{
				"rechargeItem6.txtTitleNode",
				"fontSize",
				30
			},
			{
				"rechargeItem7.txtTitleNode",
				"fontSize",
				30
			},
			{
				"rechargeItem1.txtDescNode",
				"fontSize",
				30
			},
			{
				"rechargeItem2.txtDescNode",
				"fontSize",
				30
			},
			{
				"rechargeItem3.txtDescNode",
				"fontSize",
				30
			},
			{
				"rechargeItem1.txtDescNode",
				"positionX",
				{
					54
				}
			},
			{
				"rechargeItem2.txtDescNode",
				"positionX",
				{
					54
				}
			},
			{
				"time",
				"positionX",
				{
					1630
				}
			},
			{
				"time",
				"fontSize",
				40
			}
		}
	},
	["activity_server_open_may_day.json"] = {
		set = {
			{
				"topPanel.time",
				"fontSize",
				45
			}
		}
	},
	["beach_ice_view.json"] = {
		set = {
			{
				"demandPanel.item",
				"visible",
				false
			},
			{
				"huodongTimePanel",
				"positionX",
				{
					2130
				}
			}
		},
		dockWithScreen = {
			{
				"leftDownPanel",
				"left",
				"down",
				true
			},
			{
				"huodongTimePanel",
				"right",
				"up",
				true
			}
		}
	},
	["activity_gem_up.json"] = {
		set = {
			{
				"titleTxt1",
				"anchorPoint",
				{
					0.3,
					0.5
				}
			},
			{
				"right.title",
				"fontSize",
				35
			},
			{
				"left.clickPanel1.txt",
				"fontSize",
				30
			},
			{
				"left.clickPanel2.txt",
				"fontSize",
				25
			}
		},
		oneLinePos = {
			{
				"titleTxt1",
				"titleTxt2",
				cc.p(5, 0),
				"left"
			},
			{
				"left.hint",
				"left.hintBtn",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["common_gem_details.json"] = {
		set = {
			{
				"baseNode.title",
				"anchorPoint",
				{
					0.3,
					0.5
				}
			}
		},
		oneLinePos = {
			{
				"baseNode.quile",
				"baseNode.quality",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["activity_gem.json"] = {
		set = {
			{
				"timeBg",
				"anchorPoint",
				{
					-0.5,
					1
				}
			},
			{
				"time",
				"anchorPoint",
				{
					-0.6,
					1
				}
			},
			{
				"btnClose",
				"anchorPoint",
				{
					-2.5,
					0.7
				}
			}
		}
	},
	["cross_arena_enemy.json"] = {
		set = {
			{
				"enemyPanel.btnChallenge.textNote",
				"fontSize",
				30
			}
		},
		dockWithScreen = {
			{
				"rightDownPanel",
				"right",
				"down",
				false
			}
		},
		oneLinePos = {
			{
				"noteBg",
				"textNoteTime",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["cross_arena_info.json"] = {
		set = {
			{
				"sevenPanel.txt",
				"anchorPoint",
				{
					0.28,
					0.5
				}
			}
		},
		oneLinePos = {
			{
				"sevenPanel.txt",
				"sevenPanel.textTime",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["cross_arena_stage_reward.json"] = {
		set = {
			{
				"rewardPanel.rankItem",
				"visible",
				false
			},
			{
				"rewardPanel1.rankItem",
				"visible",
				false
			},
			{
				"rewardPanel2.rankItem",
				"visible",
				false
			},
			{
				"rewardPanel3.rankItem",
				"visible",
				false
			},
			{
				"leftPanel.tabItem",
				"visible",
				false
			},
			{
				"rewardPanel.txt",
				"fontSize",
				35
			},
			{
				"rewardPanel2.txt",
				"fontSize",
				35
			},
			{
				"rewardPanel3.txt",
				"fontSize",
				35
			}
		},
		oneLinePos = {
			{
				"topPanel.txtNode",
				"topPanel.txtNode1",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["cross_arena_personal_info.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"baseNode.down1.imgOrangeBg.textNote",
				"fontSize",
				32
			},
			{
				"baseNode.down1.imgOrangeBg.textNote",
				"anchorPoint",
				{
					0.28,
					0.45
				}
			},
			{
				"baseNode.down2.imgOrangeBg.textNote",
				"anchorPoint",
				{
					0.28,
					0.45
				}
			},
			{
				"baseNode.down2.imgOrangeBg.textNote",
				"fontSize",
				32
			}
		},
		oneLinePos = {
			{
				"baseNode.top.textRankNote",
				"baseNode.top.textRank",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["cross_arena.json"] = {
		set = {
			{
				"serverPanel.subList",
				"visible",
				false
			},
			{
				"serverPanel.item",
				"visible",
				false
			},
			{
				"downPanel.defend.name",
				"fontSize",
				28
			}
		},
		dockWithScreen = {
			{
				"downPanel",
				"left",
				"down",
				false
			}
		}
	},
	["chat.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"btn",
				"visible",
				false
			},
			{
				"topView",
				"visible",
				false
			},
			{
				"chatPanel.bottomPanel",
				"visible",
				false
			},
			{
				"item.system.txtFlag",
				"fontSize",
				35
			}
		}
	},
	["fishing_main.json"] = {
		dockWithScreen = {
			{
				"left",
				"left"
			},
			{
				"right.scenePanel.list",
				"left"
			},
			{
				"right.scenePanel.txt",
				"left"
			},
			{
				"right.underLeft",
				"left"
			},
			{
				"right.underRight",
				"right"
			},
			{
				"right.fishingGameTag",
				"right"
			}
		},
		set = {
			{
				"right.underLeft.btnRank",
				"visible",
				false
			},
			{
				"right.tip",
				"visible",
				false
			},
			{
				"right.fishingGameTag",
				"visible",
				false
			},
			{
				"right.underRight.tip",
				"visible",
				false
			},
			{
				"right.underRight.numTip",
				"visible",
				false
			},
			{
				"btn",
				"visible",
				false
			},
			{
				"right.time",
				"visible",
				false
			},
			{
				"right.underRight.numTip",
				"positionX",
				100
			},
			{
				"right.underRight.tip",
				"positionX",
				100
			}
		},
		oneLinePos = {
			{
				"right.underRight.time",
				"right.underRight.times",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["fishing_bag.json"] = {
		set = {
			{
				"btn",
				"visible",
				false
			},
			{
				"center.item",
				"visible",
				false
			},
			{
				"rightBait",
				"visible",
				false
			},
			{
				"rightPartner",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title.txt",
				"title.txt1",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["fishing.json"] = {
		set = {
			{
				"auto",
				"visible",
				false
			},
			{
				"activityTip",
				"visible",
				false
			},
			{
				"auto.btnOk",
				"visible",
				false
			},
			{
				"centerPanel",
				"visible",
				false
			},
			{
				"waitPanel",
				"visible",
				false
			},
			{
				"txtRank",
				"visible",
				false
			},
			{
				"txtRank.item",
				"visible",
				false
			},
			{
				"rightPanel.btnTake",
				"visible",
				false
			},
			{
				"rightPanel.imgTip",
				"visible",
				false
			},
			{
				"auto.tipOver",
				"visible",
				false
			},
			{
				"auto.tipOver1",
				"visible",
				false
			},
			{
				"rightPanel.imgTip.tip",
				"fontSize",
				25
			},
			{
				"auto.fish.txt1",
				"fontSize",
				40
			},
			{
				"auto.fish.txt2",
				"fontSize",
				43
			},
			{
				"auto.fish.txt3",
				"fontSize",
				40
			},
			{
				"auto.fish.txt4",
				"fontSize",
				43
			},
			{
				"auto.fish.txt5",
				"fontSize",
				40
			},
			{
				"auto.fish.txt6",
				"fontSize",
				43
			},
			{
				"auto.fish.txt7",
				"fontSize",
				40
			},
			{
				"partner.bg.txt",
				"fontSize",
				30
			},
			{
				"auto.txt",
				"anchorPoint",
				{
					0.8,
					0.5
				}
			},
			{
				"auto.tipOver",
				"anchorPoint",
				{
					0.485,
					0.5
				}
			},
			{
				"activityTip.txt",
				"fontSize",
				29
			},
			{
				"txtRank.rank",
				"anchorPoint",
				{
					0.2,
					0.5
				}
			}
		},
		dockWithScreen = {
			{
				"rightPanel",
				"right",
				"down",
				false
			},
			{
				"btnRules",
				"right",
				"up",
				false
			},
			{
				"leftPanel.btnLv",
				"left",
				"down",
				false
			},
			{
				"leftPanel.btnHandbook",
				"left",
				"down",
				false
			},
			{
				"leftPanel.btnShop",
				"left",
				"down",
				false
			},
			{
				"leftPanel.btnRank",
				"left",
				"down",
				false
			},
			{
				"activityTip",
				"right",
				nil,
				true
			},
			{
				"txtRank",
				"right",
				nil,
				true
			}
		},
		oneLinePos = {
			{
				"centerPanel.tipPanel.txtKeep",
				{
					"centerPanel.tipPanel.imgFish",
					"centerPanel.tipPanel.txtAnd",
					"centerPanel.tipPanel.imgFishHook",
					"centerPanel.tipPanel.txtEnd"
				},
				cc.p(5, 0),
				"left"
			}
		}
	},
	["fishing_rank.json"] = {
		set = {
			{
				"right.rank.item",
				"visible",
				false
			},
			{
				"left.item",
				"visible",
				false
			},
			{
				"right.reward.server.item",
				"visible",
				false
			},
			{
				"right.reward.reward.item",
				"visible",
				false
			},
			{
				"right.reward.server.txt",
				"anchorPoint",
				{
					0.3,
					0.45
				}
			},
			{
				"right.reward.reward.txt",
				"anchorPoint",
				{
					0.28,
					0.45
				}
			}
		},
		oneLinePos = {
			{
				"title.txt",
				"title.txt1",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["fishing_auto.json"] = {
		set = {
			{
				"fish.txt1",
				"fontSize",
				40
			},
			{
				"fish.txt2",
				"fontSize",
				43
			},
			{
				"fish.txt3",
				"fontSize",
				40
			},
			{
				"fish.txt4",
				"fontSize",
				43
			},
			{
				"fish.txt5",
				"fontSize",
				40
			},
			{
				"fish.txt6",
				"fontSize",
				43
			},
			{
				"fish.txt7",
				"fontSize",
				40
			},
			{
				"tipMain",
				"anchorPoint",
				{
					0.485,
					0.5
				}
			}
		}
	},
	["card_mega_choose_card.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"innerList",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title.textNote1",
				"title.textNote2",
				cc.p(5, 0),
				"left"
			},
			{
				"down.textNote",
				"down.textNum",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["card_mega_debris.json"] = {
		set = {
			{
				"sliderPanel.slider",
				"capInsets",
				{
					cc.rect(11, 0, 1, 1)
				}
			},
			{
				"item",
				"visible",
				false
			},
			{
				"timesPanel.tip",
				"fontSize",
				35
			}
		}
	},
	["card_evolution.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item1",
				"visible",
				false
			},
			{
				"branchPanel.btnBranch.title",
				"fontSize",
				40
			}
		},
		oneLinePos = {
			{
				"title",
				"title1",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["card_evolution_branch.json"] = {
		set = {
			{
				"item1",
				"visible",
				false
			},
			{
				"item2",
				"visible",
				false
			},
			{
				"line12",
				"visible",
				false
			},
			{
				"line122",
				"visible",
				false
			},
			{
				"line133",
				"visible",
				false
			},
			{
				"line13",
				"visible",
				false
			},
			{
				"btnPanel1.btnBranch.title",
				"fontSize",
				35
			},
			{
				"btnPanel.btnBranch.title",
				"fontSize",
				35
			},
			{
				"txt",
				"anchorPoint",
				{
					0.3,
					0.5
				}
			}
		},
		oneLinePos = {
			{
				"title",
				"title1",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["card_mega_fragment_select.json"] = {
		oneLinePos = {
			{
				"title.textNote1",
				"title.textNote2",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["random_tower_jump.json"] = {
		set = {
			{
				"panel1",
				"visible",
				false
			},
			{
				"panel1.item",
				"visible",
				false
			},
			{
				"panel2",
				"visible",
				false
			},
			{
				"panel2.item",
				"visible",
				false
			},
			{
				"panel3",
				"visible",
				false
			},
			{
				"panel3.item",
				"visible",
				false
			},
			{
				"panel4",
				"visible",
				false
			},
			{
				"panel4.item",
				"visible",
				false
			},
			{
				"panel2.item.btn1.textNote",
				"fontSize",
				38
			},
			{
				"panel2.item.btn2.textNote",
				"fontSize",
				38
			},
			{
				"panel3.btnRandom.textNote",
				"fontSize",
				38
			}
		},
		oneLinePos = {
			{
				"title.textTitle1",
				"title.textTitle2",
				cc.p(5, 0)
			}
		}
	},
	["random_tower.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"panel",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"leftBottomPanel",
				"left",
				"down",
				false
			},
			{
				"rightBottomPanel",
				"right",
				"down",
				false
			}
		},
		oneLinePos = {
			{
				"leftBottomPanel.floorTitle",
				"leftBottomPanel.floor",
				cc.p(5, 0)
			},
			{
				"leftBottomPanel.floor",
				"leftBottomPanel.roomTitle",
				cc.p(10, 0)
			},
			{
				"leftBottomPanel.roomTitle",
				"leftBottomPanel.room",
				cc.p(5, 0)
			}
		}
	},
	["activity_flip_card.json"] = {
		set = {
			{
				"leftPanel.item",
				"visible",
				false
			},
			{
				"leftPanel.list2",
				"visible",
				false
			},
			{
				"rightPanel.itemTask",
				"visible",
				false
			},
			{
				"rightPanel.itemHX",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"rightPanel.itemTask.text1",
				"rightPanel.itemTask.textNum1",
				cc.p(5, 0)
			}
		}
	},
	["online_fight.json"] = {
		set = {
			{
				"mainPanel.rightPanel.unlimitedPanel.item",
				"visible",
				false
			},
			{
				"mainPanel.rankPointPanel.txt1",
				"positionX",
				15
			},
			{
				"mainPanel.rankPointPanel.txt2",
				"positionX",
				15
			},
			{
				"rightBtn.limitedRank.name",
				"fontSize",
				35
			},
			{
				"rightBtn.unlimitedRank.name",
				"fontSize",
				35
			}
		}
	},
	["online_fight_rank.json"] = {
		set = {
			{
				"leftPanel.tabItem",
				"visible",
				false
			},
			{
				"item",
				"visible",
				false
			},
			{
				"leftPanel.tabItem.selected.txt",
				"fontSize",
				30
			},
			{
				"leftPanel.tabItem.normal.txt",
				"fontSize",
				28
			}
		},
		oneLinePos = {
			{
				"topPanel.txtNode",
				"topPanel.txtNode1",
				cc.p(5, 0)
			}
		}
	},
	["online_fight_record.json"] = {
		set = {
			{
				"leftPanel.tabItem",
				"visible",
				false
			},
			{
				"tabItem",
				"visible",
				false
			},
			{
				"item1",
				"visible",
				false
			},
			{
				"item2",
				"visible",
				false
			},
			{
				"tabItem.name",
				"fontSize",
				30
			}
		},
		oneLinePos = {
			{
				"topPanel.txtNode",
				"topPanel.txtNode1",
				cc.p(5, 0)
			}
		}
	},
	["activity_liveness_wheel.json"] = {
		set = {
			{
				"taskItem",
				"visible",
				false
			},
			{
				"selected",
				"visible",
				false
			},
			{
				"wheelPanel.lessNums",
				"position",
				{
					620,
					363
				}
			}
		},
		oneLinePos = {
			{
				"btnSkip",
				"tips",
				cc.p(30, 0)
			}
		}
	},
	["gate.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"level",
				"visible",
				false
			},
			{
				"box",
				"visible",
				false
			},
			{
				"speLevel",
				"visible",
				false
			},
			{
				"levelInfo.textNoteNum4",
				"positionX",
				100
			}
		},
		dockWithScreen = {
			{
				"leftDown",
				"left",
				"down"
			},
			{
				"btnLeft",
				"left"
			},
			{
				"btnRight",
				"right"
			},
			{
				"rightDown",
				"right",
				"down"
			},
			{
				"rightTop",
				"right",
				"up"
			}
		}
	},
	["gym_challenge.json"] = {
		dockWithScreen = {
			{
				"rightDownPanel",
				"right",
				"up",
				false
			},
			{
				"rightTopPanel",
				"right",
				"down",
				false
			},
			{
				"btnLog",
				"left",
				"down",
				false
			}
		},
		set = {
			{
				"rightDownPanel.btnCross.textNote",
				"fontSize",
				35
			},
			{
				"rightTopPanel.textNote2",
				"fontSize",
				35
			},
			{
				"rightTopPanel.textTimes",
				"fontSize",
				35
			},
			{
				"rightTopPanel.textNote1",
				"fontSize",
				35
			},
			{
				"rightTopPanel.textTime",
				"fontSize",
				35
			},
			{
				"rightTopPanel.textTimes",
				"anchorPoint",
				{
					0.5,
					0.5
				}
			}
		},
		oneLinePos = {
			{
				"rightTopPanel.textNote2",
				"rightTopPanel.textTimes",
				cc.p(60, 0),
				"left"
			},
			{
				"rightTopPanel.textTimes",
				"rightTopPanel.btnAdd",
				cc.p(50, 0),
				"left"
			}
		}
	},
	["gym_gate_detail.json"] = {
		set = {
			{
				"roleItem",
				"visible",
				false
			},
			{
				"iconItem",
				"visible",
				false
			},
			{
				"infoPanel.btnChallenge.textNote",
				"fontSize",
				40
			}
		},
		oneLinePos = {
			{
				"infoPanel.textNote1",
				"infoPanel.text1",
				cc.p(10, 0),
				"left"
			},
			{
				"infoPanel.textNote2",
				"infoPanel.text2",
				cc.p(10, 0),
				"left"
			},
			{
				"infoPanel.textNote3",
				"infoPanel.text3",
				cc.p(10, 0),
				"left"
			},
			{
				"infoPanel.textNote4",
				"infoPanel.text4",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["gym_npc_info.json"] = {
		set = {
			{
				"imgBG.attrItem",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title.textTitle1",
				"title.textTitle2",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["gym_buf_detail.json"] = {
		set = {
			{
				"textDesc",
				"fontSize",
				35
			},
			{
				"lockPanel.textNote2",
				"anchorPoint",
				{
					0,
					1
				}
			},
			{
				"lockPanel.textNote3",
				"anchorPoint",
				{
					0,
					1
				}
			},
			{
				"lockPanel.textLevel",
				"anchorPoint",
				{
					0,
					1
				}
			}
		},
		oneLinePos = {
			{
				"lockPanel.textNote3",
				"lockPanel.textLevel",
				cc.p(20, 0),
				"left"
			}
		}
	},
	["gym_master_info.json"] = {
		oneLinePos = {
			{
				"title.textTitle1",
				"title.textTitle2",
				cc.p(0, 0),
				"left"
			}
		}
	},
	["gym_badge.json"] = {
		set = {
			{
				"gymBtn.text",
				"fontSize",
				35
			}
		}
	},
	["gym_badge_talent.json"] = {
		set = {
			{
				"leftPanel.top.item",
				"visible",
				false
			},
			{
				"leftPanel.middle.item",
				"visible",
				false
			},
			{
				"rightPanel.top.item",
				"visible",
				false
			},
			{
				"rightPanel.bottom.costPanel.item",
				"visible",
				false
			},
			{
				"rightPanel.bottom.btnPanel.btn.title",
				"fontSize",
				40
			},
			{
				"rightPanel.bottom.btnPanel.fastUpgradePanel.checkText",
				"fontSize",
				30
			}
		},
		oneLinePos = {
			{
				"leftPanel.bottomPanel.title",
				"leftPanel.bottomPanel.title1",
				cc.p(30, 0),
				"left"
			}
		}
	},
	["summer_shop.json"] = {
		set = {
			{
				"singlePanel.item",
				"visible",
				false
			},
			{
				"timeText",
				"fontSize",
				35
			}
		}
	},
	["gym_badge_awake.json"] = {
		set = {
			{
				"rightPanel.btnPanel.txt",
				"fontSize",
				35
			},
			{
				"rightPanel.topPanel.title",
				"anchorPoint",
				{
					0.28,
					0.5
				}
			},
			{
				"rightPanel.topPanel.title1",
				"anchorPoint",
				{
					0.3,
					0.5
				}
			}
		},
		oneLinePos = {
			{
				"title",
				"title1",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["gym_badge_choose_card.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"subList",
				"visible",
				false
			},
			{
				"cardItem",
				"visible",
				false
			},
			{
				"useBtn.txt",
				"fontSize",
				40
			}
		},
		oneLinePos = {
			{
				"title",
				"title1",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["gym_battle_detail.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"left.textNote1",
				"fontSize",
				35
			},
			{
				"left.textNote2",
				"fontSize",
				35
			},
			{
				"right.textNote1",
				"fontSize",
				35
			},
			{
				"right.textNote2",
				"fontSize",
				35
			}
		},
		oneLinePos = {
			{
				"left.imgBg.textNote",
				"left.imgBg.textZl",
				cc.p(20, 0),
				"left"
			},
			{
				"right.imgBg.textNote",
				"right.imgBg.textZl",
				cc.p(20, 0),
				"left"
			},
			{
				"title.textTitle1",
				"title.textTitle2",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["card_equip_awake.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"panel.btnAwakeAbility.txt",
				"fontSize",
				35
			},
			{
				"item.name",
				"fontSize",
				35
			},
			{
				"item.left",
				"fontSize",
				35
			},
			{
				"item.right",
				"fontSize",
				35
			}
		},
		scaleWithWidth = {
			{
				"panel.bottomPanel.btnAwakeFast.textNote",
				nil,
				290
			}
		}
	},
	["activity_boss.json"] = {
		dockWithScreen = {
			{
				"leftPanel",
				"left"
			},
			{
				"btnRule",
				"left"
			},
			{
				"rightPanel",
				"right"
			}
		},
		set = {
			{
				"leftPanel.item",
				"visible",
				false
			},
			{
				"rightPanel.enemy.item",
				"visible",
				false
			},
			{
				"rightPanel.drop.item",
				"visible",
				false
			},
			{
				"rightPanel.btnChallenge.text",
				"anchorPoint",
				{
					0.3,
					0.4
				}
			},
			{
				"rightPanel.hasChallenged",
				"anchorPoint",
				{
					0.2,
					0.5
				}
			},
			{
				"rightPanel.hasChallenged",
				"fontSize",
				35
			},
			{
				"rightPanel.btnPlayer.btnPlayerText",
				"anchorPoint",
				{
					0.2,
					0.5
				}
			},
			{
				"centerPanel.escapeTip",
				"anchorPoint",
				{
					0.7,
					0.5
				}
			}
		},
		oneLinePos = {
			{
				"leftPanel.myChallengeTimesText",
				"leftPanel.myChallengeTimesNum",
				cc.p(5, 0)
			},
			{
				"centerPanel.escapeTip",
				"centerPanel.escapeTime",
				cc.p(5, 0)
			},
			{
				"centerPanel.escapeTime",
				"centerPanel.escapeTip2",
				cc.p(5, 0)
			}
		}
	},
	["activity_boss_clearance.json"] = {
		oneLinePos = {
			{
				"title.textNote",
				"title.textNote2",
				cc.p(5, 0)
			}
		}
	},
	["card_skin.json"] = {
		set = {
			{
				"panelCell",
				"visible",
				false
			},
			{
				"itemAttr",
				"visible",
				false
			},
			{
				"starItem",
				"visible",
				false
			},
			{
				"attrItem",
				"visible",
				false
			},
			{
				"item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"panelRight.panelNature.title1",
				"panelRight.panelNature.txtBuffObj",
				cc.p(5, 0)
			}
		}
	},
	["card_skin_reward.json"] = {
		oneLinePos = {
			{
				"panelNature.title1",
				"panelNature.txtBuffObj",
				cc.p(5, 0)
			}
		}
	},
	["reunion_sign.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item.subList",
				"visible",
				false
			},
			{
				"item.item",
				"visible",
				false
			},
			{
				"item.noReceive.label",
				"fontSize",
				35
			}
		}
	},
	["reunion_bind.json"] = {
		set = {
			{
				"rightPanel.invitePanel.worldBtn.label",
				"fontSize",
				35
			},
			{
				"rightPanel.invitePanel.recommendBtn.label",
				"fontSize",
				40
			}
		}
	},
	["reunion_task.json"] = {
		set = {
			{
				"topPanel.bg.reunion.title",
				"fontSize",
				44
			},
			{
				"topPanel.bg.reunion.title",
				"anchorPoint",
				{
					0.15,
					0
				}
			}
		}
	},
	["clone_battle_sprite.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title",
				"title1",
				cc.p(5, 0)
			}
		}
	},
	["clone_battle_friend_invite.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title1",
				"title2",
				cc.p(5, 0)
			}
		}
	},
	["card_ability.json"] = {
		set = {
			{
				"extraItem.lockText",
				"visible",
				false
			}
		}
	},
	["card_ability_strengthen.json"] = {
		set = {
			{
				"panel.descTableList",
				"contentSize",
				{
					842,
					326
				}
			},
			{
				"panel.descTableList",
				"positionY",
				{
					520
				}
			}
		},
		oneLinePos = {
			{
				"panel.textNote",
				"panel.textNum",
				cc.p(65, -2),
				"left"
			},
			{
				"panel.textNum",
				"panel.iconMax",
				cc.p(60, 0),
				"left"
			},
			{
				"panel.textNum",
				"panel.iconArrow",
				cc.p(60, 0),
				"left"
			},
			{
				"panel.iconArrow",
				"panel.textNextNum",
				cc.p(20, 0),
				"left"
			}
		}
	},
	["card_ability_strengthen.json"] = {
		set = {
			{
				"panel.btnSure.textNote",
				"fontSize",
				40
			},
			{
				"panel.btnSureOne.textNote",
				"fontSize",
				40
			},
			{
				"panel.textNextNum",
				"anchorPoint",
				{
					1,
					0.5
				}
			}
		},
		oneLinePos = {
			{
				"panel.textNote",
				"panel.textNum",
				cc.p(70, 0)
			},
			{
				"panel.textNum",
				"panel.iconMax",
				cc.p(100, 0)
			},
			{
				"panel.textNum",
				"panel.iconArrow",
				cc.p(100, 0)
			},
			{
				"panel.iconMax",
				"panel.textNextNum",
				cc.p(-50, 0)
			}
		}
	},
	["card_ability_strengthen_onekey.json"] = {
		set = {
			{
				"panel.textNote",
				"fontSize",
				35
			},
			{
				"title.textTitle",
				"anchorPoint",
				{
					0.3,
					0.5
				}
			}
		},
		oneLinePos = {
			{
				"panel.textName",
				"panel.textLvNote",
				cc.p(160, 0)
			},
			{
				"panel.textLvNote",
				"panel.textLvNum",
				cc.p(1, 0)
			},
			{
				"panel.textLvNum",
				"panel.textLvMaxNum",
				cc.p(1, 0)
			},
			{
				"title.textTitle",
				"title.textTitle1",
				cc.p(5, 0)
			}
		}
	},
	["card_embattle_ready.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item.node",
				"visible",
				false
			},
			{
				"item.btnSure.textNote",
				"fontSize",
				33
			}
		},
		oneLinePos = {
			{
				"title",
				"title1",
				cc.p(10, 0)
			}
		}
	},
	["card_embattle_attr_dialog.json"] = {
		set = {
			{
				"leftPanel.item",
				"visible",
				false
			},
			{
				"buffPanel.item",
				"visible",
				false
			},
			{
				"buffPanel.textItem1",
				"visible",
				false
			},
			{
				"buffPanel.subList",
				"visible",
				false
			},
			{
				"buffPanel.bottomItem",
				"visible",
				false
			},
			{
				"buffPanel.textItem2",
				"visible",
				false
			},
			{
				"armPanel.topItem",
				"visible",
				false
			},
			{
				"armPanel.subList",
				"visible",
				false
			},
			{
				"armPanel.bottomItem",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title",
				"title1",
				cc.p(10, 0)
			},
			{
				"buffPanel.textNote2",
				"buffPanel.text",
				cc.p(10, 0)
			}
		}
	},
	["double_11_lottery.json"] = {
		set = {
			{
				"leftItem",
				"visible",
				false
			},
			{
				"rightPanel1.list2",
				"visible",
				false
			},
			{
				"rightPanel1.item",
				"visible",
				false
			},
			{
				"rightPanel2.item",
				"visible",
				false
			},
			{
				"rightPanel1.imgNoTicket.textNote",
				"fontSize",
				40
			},
			{
				"rightPanel1.textTitle1",
				"anchorPoint",
				{
					0.3,
					0.5
				}
			},
			{
				"rightPanel2.textTitle1",
				"anchorPoint",
				{
					0.2,
					0.5
				}
			}
		},
		oneLinePos = {
			{
				"rightPanel1.textTitle1",
				"rightPanel1.textTitle2",
				cc.p(10, 0)
			},
			{
				"rightPanel2.textTitle1",
				"rightPanel2.textTitle2",
				cc.p(10, 0)
			}
		}
	},
	["double11_shop.json"] = {
		set = {
			{
				"singlePanel.item",
				"visible",
				false
			},
			{
				"leftPanel.item",
				"visible",
				false
			},
			{
				"bagPanel.item",
				"visible",
				false
			},
			{
				"singlePanel.item.price.text",
				"anchorPoint",
				{
					0.15,
					0.5
				}
			}
		},
		oneLinePos = {
			{
				"singlePanel.item.price.text",
				"singlePanel.item.price.num",
				cc.p(10, 0)
			}
		}
	},
	["cross_mine_person_info.json"] = {
		set = {
			{
				"down1.imgOrangeBg.textNote",
				"fontSize",
				32
			},
			{
				"down2.imgOrangeBg.textNote",
				"fontSize",
				32
			},
			{
				"down3.imgOrangeBg.textNote",
				"fontSize",
				32
			}
		},
		oneLinePos = {
			{
				"top.textInfo01",
				{
					"top.imgGlod",
					"top.textProRate"
				},
				cc.p(5, 0),
				"left"
			}
		}
	},
	["cross_mine_rank.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"leftPanel.tabItem",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title.textTitle1",
				"title.textTitle2",
				cc.p(5, 0)
			}
		}
	},
	["cross_mine_combat_record.json"] = {
		set = {
			{
				"myPanel.item",
				"visible",
				false
			},
			{
				"goodPanel.item",
				"visible",
				false
			},
			{
				"leftPanel.tabItem",
				"visible",
				false
			},
			{
				"myPanel.item.bgDefend.txtTop",
				"fontSize",
				30
			},
			{
				"myPanel.item.bgAttack.txtTop",
				"fontSize",
				30
			},
			{
				"myPanel.item.textNoChange",
				"fontSize",
				38
			}
		},
		oneLinePos = {
			{
				"title.textTitle1",
				"title.textTitle2",
				cc.p(5, 0)
			},
			{
				"goodPanel.item.txtTop",
				"goodPanel.item.txtFight",
				cc.p(125, 0),
				"left"
			},
			{
				"goodPanel.item.txtTop1",
				"goodPanel.item.txtFight1",
				cc.p(125, 0),
				"left"
			}
		}
	},
	["cross_mine_embattle.json"] = {
		set = {
			{
				"rightDown.btnOneKeySet.textNote",
				"fontSize",
				38
			}
		}
	},
	["cross_mine.json"] = {
		set = {
			{
				"serverPanel.item",
				"visible",
				false
			},
			{
				"overPanel.item",
				"visible",
				false
			},
			{
				"overPanel.item.vip",
				"visible",
				false
			},
			{
				"overPanel.rightPanel.item",
				"visible",
				false
			},
			{
				"downPanel.defend.name",
				"fontSize",
				28
			}
		},
		dockWithScreen = {
			{
				"viewPanel",
				"left",
				nil,
				false
			},
			{
				"downPanel",
				"right",
				"down",
				false
			}
		},
		oneLinePos = {
			{
				"noServerPanel.img1",
				"noServerPanel.label",
				cc.p(5, 0)
			},
			{
				"noServerPanel.label",
				"noServerPanel.img2",
				cc.p(5, 0)
			}
		}
	},
	["cross_mine_wish.json"] = {
		set = {
			{
				"item1",
				"visible",
				false
			},
			{
				"item2",
				"visible",
				false
			},
			{
				"leftPanel.tabItem",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title.textTitle1",
				"title.textTitle2",
				cc.p(5, 0)
			}
		}
	},
	["cross_mine_boss_challenge.json"] = {
		set = {
			{
				"buffItem",
				"visible",
				false
			},
			{
				"rewardItem",
				"visible",
				false
			},
			{
				"rankItem",
				"visible",
				false
			},
			{
				"centerPanel.textHpNote",
				"fontSize",
				35
			},
			{
				"centerPanel.textHp",
				"fontSize",
				35
			},
			{
				"buffItem.icon",
				"anchorPoint",
				{
					0.4,
					0.5
				}
			}
		},
		oneLinePos = {
			{
				"centerPanel.textHpNote",
				"centerPanel.textHp",
				cc.p(5, 0)
			},
			{
				"centerPanel.labelInfo03",
				"centerPanel.jifenLabel",
				cc.p(20, 0),
				"left"
			}
		}
	},
	["activity_snowman.json"] = {
		set = {
			{
				"leftPanel.mainItem",
				"visible",
				false
			},
			{
				"leftPanel.subPanel.subItem",
				"visible",
				false
			},
			{
				"btnAward.txt",
				"fontSize",
				40
			},
			{
				"btnRule.txt",
				"fontSize",
				40
			}
		},
		oneLinePos = {
			{
				"bottomPanel.haveText",
				"bottomPanel.haveNum",
				cc.p(200, 0)
			},
			{
				"bottomPanel.haveNum",
				"bottomPanel.icon",
				cc.p(20, 0),
				"left"
			}
		}
	},
	["union_answer.json"] = {
		set = {
			{
				"topPanel.item",
				"visible",
				false
			},
			{
				"timePanel.title",
				"scale",
				1.7
			}
		},
		scaleWithWidth = {
			{
				"topPanel.unionBtn.text",
				nil,
				340
			},
			{
				"topPanel.personBtn.text",
				nil,
				340
			}
		}
	},
	["union_answer_rank.json"] = {
		set = {
			{
				"leftPanel.tabItem",
				"visible",
				false
			},
			{
				"item",
				"visible",
				false
			},
			{
				"leftPanel.tabItem.selected.txt",
				"fontSize",
				25
			},
			{
				"leftPanel.tabItem.normal.txt",
				"fontSize",
				28
			}
		},
		oneLinePos = {
			{
				"title.textTitle1",
				"title.textTitle2",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["union_answer_problem.json"] = {
		set = {
			{
				"panel1.item",
				"visible",
				false
			},
			{
				"panel2.item",
				"visible",
				false
			},
			{
				"panel3.item",
				"visible",
				false
			},
			{
				"topPanel.text",
				"anchorPoint",
				{
					0,
					0.5
				}
			},
			{
				"topPanel.text",
				"positionX",
				{
					20
				}
			}
		},
		oneLinePos = {
			{
				"topPanel.text",
				"topPanel.textNum",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["sky_scraper_view.json"] = {
		scaleWithWidth = {
			{
				"icon.textRank",
				nil,
				200
			}
		},
		oneLinePos = {
			{
				"leftDownPanel.rankPanel",
				"leftDownPanel.taskPanel",
				cc.p(70, 0),
				"left"
			}
		}
	},
	["sky_scraper_reward.json"] = {
		set = {
			{
				"rightPanel.tabItem",
				"visible",
				false
			},
			{
				"rightPanel.centerItem",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"topPanel.txtNode",
				"topPanel.txtNode1",
				cc.p(5, 0),
				"left"
			}
		},
		scaleWithWidth = {
			{
				"leftPanel.icon.textRank",
				nil,
				200
			},
			{
				"rightPanel.tabItem.selected.txt",
				nil,
				240
			},
			{
				"rightPanel.tabItem.normal.txt",
				nil,
				240
			}
		}
	},
	["sky_scraper_rank.json"] = {
		set = {
			{
				"right.rank.item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title.txt",
				"title.txt1",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["activity_rmbgold_reward.json"] = {
		scaleWithWidth = {
			{
				"topPanel.info.textTip",
				nil,
				200
			},
			{
				"topPanel.info.textTime",
				nil,
				160
			}
		}
	},
	["activity_new_year_flip_card.json"] = {
		scaleWithWidth = {
			{
				"rightPanel.title",
				nil,
				500
			},
			{
				"rightPanel.title1",
				nil,
				760
			}
		},
		set = {
			{
				"rightPanel.itemTask.text",
				"contentSize",
				{
					303,
					130
				}
			}
		}
	},
	["chip_select_suit.json"] = {
		set = {
			{
				"item02",
				"visible",
				false
			},
			{
				"item01",
				"visible",
				false
			},
			{
				"item02.panelInfo",
				"positionY",
				0
			}
		},
		oneLinePos = {
			{
				"imgTitle01",
				"imgTitle02",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["chip_select_sprite.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"subList",
				"visible",
				false
			},
			{
				"item.isCur",
				"scale",
				1.5
			}
		},
		oneLinePos = {
			{
				"titleTxt1",
				"titleTxt2",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["chip_advance.json"] = {
		set = {
			{
				"tabItem",
				"visible",
				false
			},
			{
				"leftPanel.attrPanel.attrItem",
				"visible",
				false
			},
			{
				"leftPanel.attrPanel.lineItem",
				"visible",
				false
			},
			{
				"advancePanel.attrItem",
				"visible",
				false
			},
			{
				"advancePanel.lineItem",
				"visible",
				false
			},
			{
				"strengthenPanel.item",
				"visible",
				false
			},
			{
				"strengthenPanel.subList",
				"visible",
				false
			},
			{
				"strengthenPanel.quickSelectPanel.item",
				"visible",
				false
			},
			{
				"panelRule",
				"visible",
				false
			},
			{
				"strengthenPanel.quickSelectPanel",
				"positionY",
				130
			},
			{
				"leftPanel.btnRebirth.txtInfo01",
				"scale",
				0.7
			},
			{
				"leftPanel.btnRebirth.txtInfo02",
				"scale",
				0.7
			}
		},
		oneLinePos = {
			{
				"leftPanel.btnRebirth.txtInfo01",
				"leftPanel.btnRebirth.txtInfo02",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["chip_bag.json"] = {
		set = {
			{
				"suitFilterPanel.panel.btnAll.txt",
				"fontSize",
				"35"
			},
			{
				"right.suitAttrPanel.list",
				"positionX",
				{
					230
				}
			},
			{
				"right.suitAttrPanel.list",
				"positionY",
				{
					-5
				}
			}
		}
	},
	["chip_plan.json"] = {
		set = {
			{
				"right.suitAttrPanel.list",
				"positionX",
				{
					230
				}
			},
			{
				"right.suitAttrPanel.list",
				"positionY",
				{
					-5
				}
			}
		}
	},
	["chip_suit_preview.json"] = {
		set = {
			{
				"title1",
				"positionX",
				{
					630
				}
			}
		}
	},
	["hunting.json"] = {
		scaleWithWidth = {
			{
				"centerPanel.elitePanel.btnElite.text",
				nil,
				400
			},
			{
				"centerPanel.normalPanel.btnNormal.text",
				nil,
				400
			}
		},
		set = {
			{
				"centerPanel.normalPanel.playing",
				"positionX",
				{
					250
				}
			}
		}
	},
	["card_chip.json"] = {
		set = {
			{
				"panel.chipPanel.btnChips.img",
				"scale",
				0.7
			},
			{
				"panel.suitAttrPanel.list",
				"positionY",
				-5
			}
		}
	},
	["activity_game_passport.json"] = {
		set = {
			{
				"rewardItem",
				"visible",
				false
			},
			{
				"rewardPanel.lvName",
				"fontSize",
				50
			},
			{
				"rewardPanel.lv",
				"fontSize",
				50
			}
		}
	},
	["held_item_bag_handbook.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"innweList",
				"visible",
				false
			},
			{
				"item1",
				"visible",
				false
			},
			{
				"attrInnerList",
				"visible",
				false
			},
			{
				"right.rightInfo.item",
				"visible",
				false
			},
			{
				"right.center.btnInfo",
				"positionX",
				{
					300
				}
			}
		}
	},
	["cross_union_fight_battle.json"] = {
		set = {
			{
				"panelTip",
				"positionX",
				1257
			},
			{
				"panelTip.tip2",
				"positionY",
				125
			}
		}
	},
	["cross_union_fight.json"] = {
		scaleWithWidth = {
			{
				"centerPanel.unionBattlefield",
				nil,
				240
			},
			{
				"centerPanel.roleBattlefield",
				nil,
				240
			}
		}
	},
	["daily_assistant_union_contribute.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"title.textNote1",
				"title.textNote2",
				cc.p(5, 0),
				"left"
			}
		}
	},
	["horse_race_rank.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"title.textTitle2",
				"visible",
				false
			}
		}
	},
	["grid_walk_shop.json"] = {
		set = {
			{
				"txt1",
				"position",
				{
					1900,
					1150
				}
			}
		}
	},
	["horse_race_main.json"] = {
		dockWithScreen = {
			{
				"leftPanel",
				"left",
				"down",
				true
			},
			{
				"rightPanel",
				"right",
				"down",
				true
			}
		},
		set = {
			{
				"player",
				"visible",
				false
			},
			{
				"ruleRankTitle",
				"visible",
				false
			},
			{
				"ruleRankItem",
				"visible",
				false
			},
			{
				"bg2.textTip2",
				"fontSize",
				44
			}
		}
	},
	["activity_brave_challenge_rank.json"] = {
		set = {
			{
				"content.rank.item",
				"visible",
				false
			},
			{
				"title.txt1",
				"visible",
				false
			}
		}
	},
	["activity_brave_challenge_view_select_card.json"] = {
		set = {
			{
				"selectItem",
				"visible",
				false
			},
			{
				"starItem",
				"visible",
				false
			},
			{
				"selectItem.panelAddInfo.txtUp",
				"positionX",
				{
					330
				}
			}
		}
	},
	["activity_brave_challenge_embattle.json"] = {
		set = {
			{
				"panelTop.panelOpp.btnSelfBadges",
				"positionX",
				{
					480
				}
			}
		}
	},
	["common_battle_card_list.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item.textNote",
				"positionX",
				{
					105
				}
			}
		}
	},
	["zawake.json"] = {
		dockWithScreen = {
			{
				"bgMap",
				"left",
				nil,
				true
			},
			{
				"leftPanel",
				"left",
				nil,
				true
			},
			{
				"rightPanel",
				"right",
				nil,
				true
			}
		},
		scaleWithWidth = {
			{
				"bgMap.npcPanel.tip.txt",
				nil,
				250
			}
		}
	},
	["zawake_debris.json"] = {
		set = {
			{
				"barPanel.bar",
				"capInsets",
				{
					cc.rect(11, 0, 1, 1)
				}
			},
			{
				"item",
				"visible",
				false
			},
			{
				"priceItem",
				"visible",
				false
			}
		}
	},
	["zawake_stage.json"] = {
		set = {
			{
				"rightPanel.effectItem",
				"visible",
				false
			},
			{
				"rightPanel.effectInnerList",
				"visible",
				false
			},
			{
				"rightPanel.activateItem",
				"visible",
				false
			},
			{
				"rightPanel.costItem",
				"visible",
				false
			},
			{
				"rightPanel.effectPanel",
				"visible",
				false
			},
			{
				"rightPanel.skillPanel",
				"visible",
				false
			},
			{
				"rightPanel.activatePanel",
				"visible",
				false
			},
			{
				"rightPanel.costPanel",
				"visible",
				false
			},
			{
				"rightPanel.skillPanel.skillText",
				"scale",
				0.4
			}
		},
		oneLinePos = {
			{
				"rightPanel.effectPanel.titlePanel.title",
				"rightPanel.effectPanel.titlePanel.txt",
				cc.p(10, 0)
			}
		}
	},
	["worldcup_achievement.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item.achvDesc",
				"fontSize",
				44
			}
		},
		oneLinePos = {
			{
				"topPanel.txt",
				"topPanel.txt1",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["yybet_view.json"] = {
		dockWithScreen = {
			{
				"downPanel",
				"left"
			},
			{
				"rightPanel",
				"right"
			}
		},
		scaleWithWidth = {
			{
				"btnMain.textNote",
				nil,
				250
			}
		},
		set = {
			{
				"rightPanel.imgBg.textNote",
				"fontSize",
				40
			}
		}
	},
	["zawake_force.json"] = {
		oneLinePos = {
			{
				"bgPanel.title1",
				"bgPanel.title2",
				cc.p(5, 0),
				"left"
			}
		},
		set = {
			{
				"leftInnerList",
				"visible",
				false
			},
			{
				"leftItem",
				"visible",
				false
			},
			{
				"item",
				"visible",
				false
			}
		}
	},
	["explore_advance.json"] = {
		set = {
			{
				"strengthenPanel.leftPanel.atterPanel.attrSubList",
				"visible",
				false
			},
			{
				"strengthenPanel.itemSubList",
				"visible",
				false
			},
			{
				"strengthenPanel.slider",
				"capInsets",
				{
					cc.rect(11, 0, 1, 1)
				}
			},
			{
				"strengthenPanel.leftPanel.advancePanel.infoItem",
				"contentSize",
				{
					666,
					52
				}
			},
			{
				"strengthenPanel.leftPanel.advancePanel.infoSubList",
				"contentSize",
				{
					1286,
					60
				}
			},
			{
				"strengthenPanel.leftPanel.advancePanel.infoList",
				"contentSize",
				{
					1360,
					140
				}
			}
		}
	},
	["activity_seven_day_login.json"] = {
		oneLinePos = {
			{
				"btnClose",
				"textCountDown",
				cc.p(0, 0),
				"right"
			}
		}
	},
	["recharge_vip.json"] = {
		set = {
			{
				"btnGo",
				"visible",
				false
			}
		}
	},
	["mimicry.json"] = {
		set = {
			{
				"subList",
				"visible",
				false
			},
			{
				"buffLvItem",
				"visible",
				false
			},
			{
				"cell",
				"visible",
				false
			},
			{
				"buffRightPanel.rightBuffItem",
				"visible",
				false
			}
		},
		scaleWithWidth = {
			{
				"buffLeftPanel.panelNobuff.Label_18",
				nil,
				420
			}
		}
	}
}
