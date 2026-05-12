return {
	["login.json"] = {
		dockWithScreen = {
			{
				"leftPanel",
				"left",
				"up"
			},
			{
				"version",
				"right",
				nil,
				true
			}
		},
		set = {
			{
				"midPanel.server",
				"visible",
				false
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
		}
	},
	["login_placard.json"] = {
		set = {
			{
				"leftPanel.item",
				"visible",
				false
			},
			{
				"topBg",
				"visible",
				false
			},
			{
				"titleItem",
				"visible",
				false
			},
			{
				"contentItem",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"bottomPanel.btnKnow",
				{
					"bottomPanel.tip",
					"bottomPanel.icon"
				},
				cc.p(5, 0),
				"right"
			}
		}
	},
	["character_select_card.json"] = {
		set = {
			{
				"itemCard",
				"visible",
				false
			},
			{
				"itemSkill",
				"visible",
				false
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
			}
		}
	},
	["battle_craft.json"] = {
		dockWithScreen = {
			{
				"selfInfo",
				"left",
				"up",
				false
			},
			{
				"enemyInfo",
				"right",
				"up",
				false
			},
			{
				"selfMp",
				"left",
				"down",
				false
			},
			{
				"enemyMp",
				"right",
				"down",
				false
			}
		}
	},
	["battle_end_fail.json"] = {
		set = {
			{
				"advanceBtn",
				"visible",
				false
			}
		}
	},
	["battle_story_panel.json"] = {
		set = {
			{
				"selectItem",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"skipBtn",
				"right",
				"up",
				false
			}
		}
	},
	["battle_daily_activity.json"] = {
		dockWithScreen = {
			{
				"item1",
				"left",
				"up",
				true
			},
			{
				"item2",
				"left",
				"up",
				true
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
				"followPanel",
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
				"rightPanel.showList",
				"contentSize",
				{
					1100,
					300
				}
			}
		}
	},
	["common_gain_display.json"] = {
		set = {
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
		}
	},
	["common_gain_way.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["common_buy_info.json"] = {
		set = {
			{
				"content.sliderPanel.slider",
				"capInsets",
				{
					cc.rect(11, 0, 1, 1)
				}
			},
			{
				"priceItem",
				"visible",
				false
			},
			{
				"selectItem",
				"visible",
				false
			}
		}
	},
	["common_gain_gold_display.json"] = {
		set = {
			{
				"panel1",
				"visible",
				false
			},
			{
				"panel10",
				"visible",
				false
			}
		}
	},
	["common_guide.json"] = {
		dockWithScreen = {
			{
				"skipBtn",
				"right",
				"up",
				false
			}
		}
	},
	["common_rule.json"] = {
		set = {
			{
				"title",
				"visible",
				false
			},
			{
				"awardItem",
				"visible",
				false
			},
			{
				"panelChip",
				"visible",
				false
			}
		}
	},
	["common_capture_tips.json"] = {
		dockWithScreen = {
			{
				"imgBG",
				"left",
				"up",
				false
			}
		}
	},
	["sign_in.json"] = {
		set = {
			{
				"centerPanel.subList",
				"visible",
				false
			},
			{
				"itemBox",
				"visible",
				false
			},
			{
				"itemSmall",
				"visible",
				false
			},
			{
				"itemBig",
				"visible",
				false
			}
		}
	},
	["bag.json"] = {
		dockWithScreen = {
			{
				"leftPanel",
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
				"midPanel.subList",
				"visible",
				false
			},
			{
				"midPanel.item",
				"visible",
				false
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
			}
		}
	},
	["rank.json"] = {
		set = {
			{
				"leftPanel.item",
				"visible",
				false
			},
			{
				"itemFight",
				"visible",
				false
			},
			{
				"itemCollect",
				"visible",
				false
			},
			{
				"itemUnion",
				"visible",
				false
			},
			{
				"itemGateStar",
				"visible",
				false
			},
			{
				"rightPanel.topPanelFight",
				"visible",
				false
			},
			{
				"rightPanel.topPanelCollect",
				"visible",
				false
			},
			{
				"rightPanel.topPanelCraft",
				"visible",
				false
			},
			{
				"rightPanel.topPanelUnion",
				"visible",
				false
			},
			{
				"rightPanel.topPanelGateStar",
				"visible",
				false
			},
			{
				"rightPanel.bottomPanelFight",
				"visible",
				false
			},
			{
				"rightPanel.bottomPanelCollect",
				"visible",
				false
			},
			{
				"rightPanel.bottomPanelCraft",
				"visible",
				false
			},
			{
				"rightPanel.bottomPanelUnion",
				"visible",
				false
			},
			{
				"rightPanel.bottomPanelGateStar",
				"visible",
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
			}
		}
	},
	["chat_privataly.json"] = {
		set = {
			{
				"leftPanel.item",
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
	["chat_emoji.json"] = {
		set = {
			{
				"dot",
				"visible",
				false
			},
			{
				"btnItem",
				"visible",
				false
			},
			{
				"pagePanel",
				"visible",
				false
			},
			{
				"pagePanel.subList",
				"visible",
				false
			},
			{
				"pagePanel.item",
				"visible",
				false
			}
		}
	},
	["task.json"] = {
		set = {
			{
				"leftPanel.item",
				"visible",
				false
			},
			{
				"itemBox",
				"visible",
				false
			},
			{
				"itemTask",
				"visible",
				false
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
			}
		}
	},
	["card_bag.json"] = {
		set = {
			{
				"centerPanel.subList",
				"visible",
				false
			},
			{
				"centerPanel.cardItem",
				"visible",
				false
			},
			{
				"centerPanel.fragItem",
				"visible",
				false
			}
		}
	},
	["card_bag_filter.json"] = {
		set = {
			{
				"filterBtn.attrListPanel.item",
				"visible",
				false
			},
			{
				"filterBtn.attrListPanel.subList",
				"visible",
				false
			},
			{
				"filterBtn.rarityListPanel.item",
				"visible",
				false
			},
			{
				"filterBtn.rarityListPanel.subList",
				"visible",
				false
			}
		}
	},
	["common_battle_card_list.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
			}
		}
	},
	["card_equip.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["card_equip_star.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["card_equip_awake.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
			}
		}
	},
	["gate_section_detail.json"] = {
		set = {
			{
				"itemText",
				"visible",
				false
			},
			{
				"roleItem",
				"visible",
				false
			},
			{
				"starItem",
				"visible",
				false
			},
			{
				"iconItem",
				"visible",
				false
			},
			{
				"leftTop.btnSave",
				"visible",
				false
			}
		}
	},
	["gate_section_box.json"] = {
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
			}
		}
	},
	["activity_month_card_privilege.json"] = {
		set = {
			{
				"item",
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
			}
		}
	},
	["activity_item_buy.json"] = {
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
		}
	},
	["activity_general_task.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
		}
	},
	activity_recharge_gift = {
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
			}
		}
	},
	["activity_regain_stamina.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["activity_server_open.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"itemDay",
				"visible",
				false
			}
		}
	},
	["activity_server_open_get.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["activity_first_recharge.json"] = {
		set = {
			{
				"btnLeft",
				"visible",
				false
			},
			{
				"btnRight",
				"visible",
				false
			},
			{
				"dot0",
				"visible",
				false
			},
			{
				"dot1",
				"visible",
				false
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
	["personal_role_logo.json"] = {
		set = {
			{
				"itemLogo",
				"visible",
				false
			},
			{
				"itemFrame",
				"visible",
				false
			},
			{
				"leftItem",
				"visible",
				false
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
				"addPanel.title1",
				"fontSize",
				46
			},
			{
				"item",
				"visible",
				false
			},
			{
				"shade",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"addPanel.title",
				"addPanel.title1",
				cc.p(10, 0),
				"left"
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
			}
		}
	},
	["handbook_skill.json"] = {
		set = {
			{
				"skillItem",
				"visible",
				false
			}
		}
	},
	["handbook_from.json"] = {
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
			}
		}
	},
	["rule.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
		}
	},
	["arena_rank_reward.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
		}
	},
	["arena_combat_record.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["arena_head_icon.json"] = {
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
	["arena_rank.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["adventure.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"pvpItem",
				"visible",
				false
			}
		}
	},
	["daily_activity.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["daily_activity_gate_select.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
		}
	},
	["card_strengthen.json"] = {
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
				"left.btnItem",
				"visible",
				false
			},
			{
				"left.developBtnItem",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"cardPanel",
				"left"
			},
			{
				"right",
				"right"
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
			}
		}
	},
	["card_skill.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["card_advance.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["card_star.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
				"selectPanel",
				"visible",
				false
			},
			{
				"selectPanel.subList",
				"visible",
				false
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
				"btnWeather",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"dailyGateTipsPos",
				"right"
			},
			{
				"btnReady",
				"left"
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
				cc.p(10, 0),
				"left"
			}
		}
	},
	["card_fetter.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"subItem",
				"visible",
				false
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
				"selfChooseCurrentUp.icon",
				"visible",
				false
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
		}
	},
	["drawcard_result.json"] = {
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
				"effectItem",
				"visible",
				false
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
			}
		}
	},
	["common_upgrade_notice.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["endless_tower.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"bgItem",
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
			}
		}
	},
	["endless_tower_gate_detail.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["endless_tower_battle_video.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
		}
	},
	["union_main.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
	["union_lobby.json"] = {
		dockWithScreen = {
			{
				"leftPanel.list",
				"left"
			}
		}
	},
	["union_join.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
		}
	},
	["union_skill.json"] = {
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
		}
	},
	["union_select_sprite.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["union_select_logo.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["union_gate.json"] = {
		dockWithScreen = {
			{
				"leftPanel",
				"left"
			},
			{
				"right",
				"right"
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
		}
	},
	["union_gate_rank.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["union_gate_reward.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["union_redpack_info.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["union_contribute_main.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["union_contribute.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
		}
	},
	["held_item_info.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
		}
	},
	["common_helditem_detail.json"] = {
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
				"innerList",
				"visible",
				false
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
		}
	},
	["trainer_attr_skills.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["trainer_attr.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["trainer_success.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
		}
	},
	["setting_voice.json"] = {
		set = {
			{
				"centerPanel.itemBgVoice.slider",
				"capInsets",
				{
					cc.rect(11, 0, 1, 20)
				}
			},
			{
				"centerPanel.itemBattleVoice.slider",
				"capInsets",
				{
					cc.rect(11, 0, 1, 20)
				}
			},
			{
				"centerPanel.item",
				"visible",
				false
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
		}
	},
	["setting_scene.json"] = {
		set = {
			{
				"centerPanel.subList",
				"visible",
				false
			},
			{
				"centerPanel.item",
				"visible",
				false
			}
		}
	},
	["card_property_swap_view.json"] = {
		oneLinePos = {
			{
				"title",
				"title1"
			}
		},
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
			}
		}
	},
	["common_card_detail.json"] = {
		set = {
			{
				"baseCardNode.attrItem",
				"visible",
				false
			}
		}
	},
	["online_gift_gain.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"rewardPanel",
				"visible",
				false
			},
			{
				"label",
				"visible",
				false
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
			}
		}
	},
	["explore_view.json"] = {
		set = {
			{
				"componentPanel",
				"visible",
				false
			},
			{
				"bottomPanel.item",
				"visible",
				false
			},
			{
				"mask",
				"visible",
				false
			},
			{
				"flip1",
				"visible",
				false
			},
			{
				"flip2",
				"visible",
				false
			},
			{
				"flip3",
				"visible",
				false
			},
			{
				"flip4",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"upRightPanel",
				"right"
			},
			{
				"upLeftPanel",
				"left"
			},
			{
				"componentPanel",
				"left"
			}
		},
		scaleWithWidth = {
			{
				"upLeftPanel.btnFind.txt",
				nil,
				160
			},
			{
				"upLeftPanel.btnShop.txt",
				nil,
				160
			},
			{
				"upLeftPanel.btnDecompose.txt",
				nil,
				160
			},
			{
				"upLeftPanel.btnRule.txt",
				nil,
				160
			}
		}
	},
	["explore_component_success_view.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["explore_detail_view.json"] = {
		set = {
			{
				"item1",
				"visible",
				false
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
		}
	},
	["explore_draw_item_success.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
			}
		}
	},
	["shop_sell.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
			}
		}
	},
	["card_fragment_compose.json"] = {
		set = {
			{
				"barPanel.bar",
				"capInsets",
				{
					cc.rect(11, 0, 1, 0)
				}
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
		}
	},
	["random_tower_rank.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
		}
	},
	["random_tower_use_buff.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["random_tower_select_event.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["random_tower_look_buff.json"] = {
		set = {
			{
				"centerItem",
				"visible",
				false
			},
			{
				"buffItem",
				"visible",
				false
			},
			{
				"buffItem.logo",
				"visible",
				false
			},
			{
				"rightItem",
				"visible",
				false
			}
		}
	},
	["random_tower_event_reward.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
			}
		}
	},
	["craft_main.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
				"topPanel.subTitle"
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
		}
	},
	["craft_battle_enemy.json"] = {
		set = {
			{
				"imgStar",
				"visible",
				false
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
		}
	},
	["clone_battle_spr_show.json"] = {
		set = {
			{
				"mainPanel.natureItem",
				"visible",
				false
			},
			{
				"mainPanel.showItem",
				"visible",
				false
			}
		}
	},
	["clone_battle_spr_show.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
	["clone_battle_sprite.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
			}
		},
		oneLinePos = {
			{
				"rewardPanel.txtNode",
				"rewardPanel.endTime"
			}
		}
	},
	["activity_passport_buy.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["activity_passport_buy_exp.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"itemList",
				"visible",
				false
			}
		}
	},
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
			}
		}
	},
	["activity_limit_buy_gift.json"] = {
		set = {
			{
				"leftPanel.item",
				"visible",
				false
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
			}
		}
	},
	["activity_seven_day_login.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["activity_spring_festival.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
		}
	},
	["capture_limit.json"] = {
		dockWithScreen = {
			{
				"leftDownPanel",
				"left",
				"down",
				false
			},
			{
				"rightDownPanel",
				"right",
				"down",
				false
			}
		},
		set = {
			{
				"panelSprite",
				"visible",
				false
			}
		}
	},
	["dispatch_task.json"] = {
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
			}
		}
	},
	["activity_recharge_wheel.json"] = {
		set = {
			{
				"showItem",
				"visible",
				false
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
		}
	},
	["main_schedule.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["battle_recommend.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["battle_detail.json"] = {
		set = {
			{
				"cardItem",
				"visible",
				false
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
				"donateTimes",
				"donateTimesNote",
				cc.p(10, 0),
				"right"
			},
			{
				"item.haveNote",
				"item.haveNum",
				cc.p(10, 0)
			}
		}
	},
	["union_frag_donate_wish.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"textNumNote",
				"textNum",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["union_frag_donate_record.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
			}
		}
	},
	["cross_craft.json"] = {
		dockWithScreen = {
			{
				"leftBtn1",
				"left",
				"down"
			},
			{
				"leftBtn2",
				"left",
				"down"
			},
			{
				"rightBtn",
				"right",
				"down"
			}
		},
		set = {
			{
				"signupPanel.item",
				"visible",
				false
			},
			{
				"signupPanel.subList",
				"visible",
				false
			}
		}
	},
	["cross_craft_embattle.json"] = {
		set = {
			{
				"up.special",
				"visible",
				false
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
			}
		}
	},
	["cross_craft_myschedule.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
			}
		}
	},
	["gem_onekey_strengthen.json"] = {
		set = {
			{
				"sliderPanel.slider",
				"capInsets",
				{
					cc.rect(11, 0, 1, 1)
				}
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
			}
		}
	},
	["arena_pass_reward.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["activity_world_boss.json"] = {
		set = {
			{
				"centerPanel.skillItem",
				"visible",
				false
			}
		}
	},
	["activity_world_boss_reward.json"] = {
		set = {
			{
				"leftPanel.tabItem",
				"visible",
				false
			},
			{
				"panel.rankItem",
				"visible",
				false
			}
		}
	},
	["activity_world_boss_rank.json"] = {
		set = {
			{
				"leftPanel.tabItem",
				"visible",
				false
			},
			{
				"trainerPanel.rankItem",
				"visible",
				false
			},
			{
				"unionPanel.rankItem",
				"visible",
				false
			},
			{
				"rightPanel",
				"visible",
				false
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
	["cross_arena_enemy.json"] = {
		dockWithScreen = {
			{
				"rightDownPanel",
				"right",
				"down",
				false
			}
		}
	},
	["cross_arena_personal_info.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["cross_arena_head_icon.json"] = {
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
		}
	},
	["cross_arena_rank.json"] = {
		set = {
			{
				"rankPanel.rankItem",
				"visible",
				false
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
		}
	},
	["cross_arena_record_info.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["cross_arena_personal_info.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["activity_zongzi_bag.json"] = {
		set = {
			{
				"right.sliderPanel.slider",
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
		}
	},
	["fishing_result.json"] = {
		set = {
			{
				"fishItem.imgNew",
				"visible",
				false
			},
			{
				"score1",
				"visible",
				false
			},
			{
				"score2",
				"visible",
				false
			}
		}
	},
	["common_fish_detail.json"] = {
		set = {
			{
				"baseNode.lockPanel",
				"visible",
				false
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
		}
	},
	["fishing_level.json"] = {
		set = {
			{
				"left.item",
				"visible",
				false
			},
			{
				"right.now.attr.item",
				"visible",
				false
			},
			{
				"right.now.fish.item",
				"visible",
				false
			},
			{
				"left.item.bar",
				"capInsets",
				{
					cc.rect(11, 10, 1, 1)
				}
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
			}
		}
	},
	["fishing_award.json"] = {
		set = {
			{
				"point.bar",
				"capInsets",
				{
					cc.rect(11, 10, 1, 1)
				}
			},
			{
				"point.barBg",
				"capInsets",
				{
					cc.rect(11, 10, 1, 1)
				}
			}
		}
	},
	["card_mega.json"] = {
		dockWithScreen = {
			{
				"list",
				"left"
			},
			{
				"listBg",
				"left"
			},
			{
				"rightPanel",
				"right"
			},
			{
				"rightPanelFetter",
				"right"
			},
			{
				"panel",
				"right"
			},
			{
				"btn",
				"right"
			},
			{
				"btn1",
				"right"
			},
			{
				"btn2",
				"right"
			},
			{
				"btnBranch",
				"right"
			},
			{
				"btnFetter",
				"right"
			},
			{
				"titlePanel",
				"right"
			}
		},
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"itemPanel.starItem",
				"visible",
				false
			},
			{
				"itemPanel.attrItem",
				"visible",
				false
			},
			{
				"rightPanel.item",
				"visible",
				false
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
			}
		}
	},
	["card_comment.json"] = {
		set = {
			{
				"center.pageItem",
				"visible",
				false
			},
			{
				"right.item",
				"visible",
				false
			},
			{
				"right.item.bottom.btnLike.select",
				"visible",
				false
			},
			{
				"right.item.bottom.btnDislike.select",
				"visible",
				false
			},
			{
				"right.noComment",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"left",
				"left"
			},
			{
				"right",
				"right"
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
			}
		}
	},
	["online_fight_reward.json"] = {
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
			}
		}
	},
	["online_fight_record_info.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["online_fight.json"] = {
		set = {
			{
				"mainPanel.rightPanel.unlimitedPanel.item",
				"visible",
				false
			}
		}
	},
	["online_fight_limited_embattle.json"] = {
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
	["online_fight_ban_embattle.json"] = {
		dockWithScreen = {
			{
				"btnClose",
				"left",
				"up",
				true
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
		}
	},
	["gym_npc_info.json"] = {
		set = {
			{
				"imgBG.attrItem",
				"visible",
				false
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
			}
		}
	},
	["gym_badge_awake.json"] = {
		set = {
			{
				"leftPanel.item",
				"visible",
				false
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
			}
		}
	},
	["gym_badge_guard.json"] = {
		set = {
			{
				"item1",
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
		}
	},
	["activity_quality_exchange_fragment.json"] = {
		set = {
			{
				"sliderPanel.slider",
				"capInsets",
				{
					cc.rect(11, 0, 1, 1)
				}
			}
		}
	},
	["activity_quality_exchange_helditem_select.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["reunion.json"] = {
		set = {
			{
				"leftPanel.item",
				"visible",
				false
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
			}
		}
	},
	["reunion_bind.json"] = {
		set = {
			{
				"rightPanel.receiveBtn",
				"visible",
				false
			}
		}
	},
	["reunion_invite.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"leftItem",
				"visible",
				false
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
			}
		}
	},
	["coupon_shop.json"] = {
		set = {
			{
				"singlePanel.item",
				"visible",
				false
			},
			{
				"leftPanel",
				"visible",
				false
			}
		}
	},
	["summer_shop.json"] = {
		set = {
			{
				"singlePanel.item",
				"visible",
				false
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
			}
		}
	},
	["gym_log.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["gym_battle_detail.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
		}
	},
	["card_skin_reward.json"] = {
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
			}
		}
	},
	["activity_snowman_reward.json"] = {
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
		}
	},
	["snow_ball_rank.json"] = {
		oneLinePos = {
			{
				"title.txt",
				"title.txt1"
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
	["snow_ball_reward.json"] = {
		oneLinePos = {
			{
				"topPanel.txtNode",
				"topPanel.txtNode1"
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
	["cross_mine_street.json"] = {
		set = {
			{
				"normalItem",
				"visible",
				false
			},
			{
				"npcItem",
				"visible",
				false
			},
			{
				"npcItem.talkPanel.startTalkPanel",
				"visible",
				false
			},
			{
				"npcItem.talkPanel.waitPanel",
				"visible",
				false
			},
			{
				"leftPanel.buffPanel.item",
				"visible",
				false
			}
		}
	},
	["cross_mine_server_rank.json"] = {
		set = {
			{
				"rankPanel.item",
				"visible",
				false
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
			}
		}
	},
	["cross_mine_lineup_adjust.json"] = {
		set = {
			{
				"panelBuff",
				"visible",
				false
			}
		}
	},
	["cross_mine_record_info.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
			}
		}
	},
	["union_answer.json"] = {
		set = {
			{
				"topPanel.item",
				"visible",
				false
			}
		}
	},
	["activity_new_year_flip_card.json"] = {
		set = {
			{
				"leftPanel.list2",
				"visible",
				false
			},
			{
				"leftPanel.item",
				"visible",
				false
			},
			{
				"rightPanel.itemTask",
				"visible",
				false
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
		}
	},
	["daily_assistant.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"tabItem",
				"visible",
				false
			},
			{
				"selectSuitItem",
				"visible",
				false
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
		}
	},
	["daily_assistant_fishing_select.json"] = {
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
		}
	},
	["activity_game_passport_buy_level.json"] = {
		set = {
			{
				"barPanel.bar",
				"capInsets",
				{
					cc.rect(11, 0, 1, 0)
				}
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
		}
	},
	["activity_game_passport.json"] = {
		set = {
			{
				"rewardItem",
				"visible",
				false
			}
		}
	},
	["activity_game_passport_buy.json"] = {
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
		}
	},
	["activity_record_passport.json"] = {
		set = {
			{
				"rewardItem",
				"visible",
				false
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
			}
		}
	},
	["grid_walk.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item.jump",
				"visible",
				false
			},
			{
				"item1",
				"visible",
				false
			},
			{
				"showDicePanel",
				"visible",
				false
			},
			{
				"touchPanel",
				"visible",
				false
			},
			{
				"tipPanel",
				"visible",
				false
			},
			{
				"rightPanel.diceInfo",
				"visible",
				false
			},
			{
				"treasuresPanel",
				"visible",
				false
			},
			{
				"itemPanel",
				"visible",
				false
			},
			{
				"mapPanel.mapTouchClose",
				"visible",
				false
			},
			{
				"mapPanel.eventInfo",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"rightPanel",
				"right",
				nil,
				false
			},
			{
				"leftPanel",
				"left",
				nil,
				false
			},
			{
				"LeftDownPanel",
				"left",
				"down",
				false
			}
		}
	},
	["grid_walk_task.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"tabItem",
				"visible",
				false
			}
		}
	},
	["grid_walk_bag.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"bgPanel.empty",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"bgPanel",
				"left",
				"down",
				false
			}
		}
	},
	["horse_race_rank.json"] = {
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
	["horse_race_point_reward.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["horse_race_bet.json"] = {
		set = {
			{
				"player",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"topPanel.txtNode",
				"topPanel.txtNode2"
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
			}
		}
	},
	["horse_race_match.json"] = {
		set = {
			{
				"name",
				"visible",
				false
			}
		}
	},
	["horse_race_record.json"] = {
		set = {
			{
				"rankPanel.recordItem",
				"visible",
				false
			},
			{
				"rankPanel.recordItem.horseItem",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"topPanel.txtNode",
				"topPanel.txtNode1"
			}
		}
	},
	["activity_brave_challenge_rank.json"] = {
		set = {
			{
				"content.rank.item",
				"visible",
				false
			}
		}
	},
	["activity_brave_challenge_badge.json"] = {
		set = {
			{
				"iconPanel",
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
	["activity_brave_challenge_select_badge.json"] = {
		set = {
			{
				"normal",
				"visible",
				false
			},
			{
				"rare",
				"visible",
				false
			},
			{
				"forever",
				"visible",
				false
			}
		}
	},
	["activity_brave_challenge_rank_detail.json"] = {
		set = {
			{
				"baseNode.item",
				"visible",
				false
			}
		}
	},
	["activity_brave_challenge_achievement.json"] = {
		set = {
			{
				"leftPanel.tabItem",
				"visible",
				false
			},
			{
				"rankItem",
				"visible",
				false
			}
		}
	},
	["activity_dispatch_main.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"leftDownPanel",
				"left",
				"down"
			}
		}
	},
	["activity_dispatch_sprite_select.json"] = {
		set = {
			{
				"leftPanel.subList",
				"visible",
				false
			},
			{
				"item",
				"visible",
				false
			},
			{
				"imgExtra",
				"visible",
				false
			},
			{
				"attrItem",
				"visible",
				false
			}
		}
	},
	["activity_dispatch_task.json"] = {
		set = {
			{
				"leftPanel.tabItem",
				"visible",
				false
			},
			{
				"rankItem",
				"visible",
				false
			}
		}
	},
	["activity_exclusive_limit.json"] = {
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
		}
	},
	["zawake_reset.json"] = {
		set = {
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
		}
	},
	["zawake_force.json"] = {
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
	["zawake_choose_card.json"] = {
		set = {
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
				"chooseItem",
				"visible",
				false
			}
		}
	},
	["zawake_unlock_tips.json"] = {
		set = {
			{
				"item",
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
	["zawake_awake_success.json"] = {
		set = {
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
		}
	},
	["zawake_preview.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
	["zawake_choose_frag.json"] = {
		set = {
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
		}
	},
	["card_chip.json"] = {
		set = {
			{
				"panel.baseAttrPanel.item",
				"visible",
				false
			},
			{
				"panel.baseAttrPanel.subList",
				"visible",
				false
			},
			{
				"panel.suitAttrPanel.item",
				"visible",
				false
			}
		}
	},
	["chip_bag.json"] = {
		set = {
			{
				"left.posItem",
				"visible",
				false
			},
			{
				"left.item",
				"visible",
				false
			},
			{
				"left.subList",
				"visible",
				false
			},
			{
				"right.baseAttrPanel.item",
				"visible",
				false
			},
			{
				"right.baseAttrPanel.subList",
				"visible",
				false
			},
			{
				"right.suitAttrPanel.item",
				"visible",
				false
			},
			{
				"suitFilterPanel.panel.item",
				"visible",
				false
			},
			{
				"suitFilterPanel.panel.subList",
				"visible",
				false
			},
			{
				"attrFilterPanel.panel.item",
				"visible",
				false
			},
			{
				"attrFilterPanel.panel.subList",
				"visible",
				false
			}
		}
	},
	["chip_detail.json"] = {
		set = {
			{
				"panel.attrItem",
				"visible",
				false
			},
			{
				"panel.lineItem",
				"visible",
				false
			},
			{
				"panel.suitItem",
				"visible",
				false
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
			}
		}
	},
	["chip_plan.json"] = {
		set = {
			{
				"left.posItem",
				"visible",
				false
			},
			{
				"left.item",
				"visible",
				false
			},
			{
				"left.subList",
				"visible",
				false
			},
			{
				"leftPlan.item",
				"visible",
				false
			},
			{
				"leftPlan.subList",
				"visible",
				false
			},
			{
				"right.baseAttrPanel.item",
				"visible",
				false
			},
			{
				"right.baseAttrPanel.subList",
				"visible",
				false
			},
			{
				"right.suitAttrPanel.item",
				"visible",
				false
			},
			{
				"suitFilterPanel.panel.item",
				"visible",
				false
			},
			{
				"suitFilterPanel.panel.subList",
				"visible",
				false
			},
			{
				"attrFilterPanel.panel.item",
				"visible",
				false
			},
			{
				"attrFilterPanel.panel.subList",
				"visible",
				false
			},
			{
				"planSuitFilterPanel.panel.item",
				"visible",
				false
			},
			{
				"planSuitFilterPanel.panel.subList",
				"visible",
				false
			}
		}
	},
	["chip_item_details.json"] = {
		set = {
			{
				"panel.sliderPanel.slider",
				"capInsets",
				{
					cc.rect(11, 0, 1, 1)
				}
			}
		}
	},
	["hunting_route.json"] = {
		set = {
			{
				"coverProPanel.prograssPanel.proPanel2",
				"visible",
				false
			},
			{
				"coverProPanel.prograssPanel.proPanel3",
				"visible",
				false
			},
			{
				"buffPanel.item",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"buffPanel",
				"left",
				"down",
				true
			},
			{
				"rightBottomPanel",
				"right",
				"down",
				true
			}
		}
	},
	["hunting.json"] = {
		dockWithScreen = {
			{
				"leftBottomPanel",
				"left",
				"down",
				true
			}
		}
	},
	["hunting_select_buff.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["hunting_supply.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["hunting_supply_detail.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["hunting_gate_detail.json"] = {
		set = {
			{
				"enemyPanel.item",
				"visible",
				false
			}
		}
	},
	["common_chip_details.json"] = {
		set = {
			{
				"baseNode.panel.attrPanel",
				"visible",
				false
			},
			{
				"baseNode.panel.linePanel",
				"visible",
				false
			},
			{
				"baseNode.panel.suitPanel",
				"visible",
				false
			}
		}
	},
	["chip_base_attr.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item01",
				"visible",
				false
			},
			{
				"item02",
				"visible",
				false
			},
			{
				"item03",
				"visible",
				false
			}
		}
	},
	["chip_rate_preview.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"subTitle",
				"visible",
				false
			},
			{
				"listLine",
				"visible",
				false
			},
			{
				"listLine2",
				"visible",
				false
			}
		}
	},
	["chip_result.json"] = {
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
	["chip_suit_attr.json"] = {
		set = {
			{
				"item01",
				"visible",
				false
			}
		}
	},
	["chip_suit_preview.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"suit1",
				"visible",
				false
			},
			{
				"suitList2",
				"visible",
				false
			}
		}
	},
	["chip_draw.json"] = {
		dockWithScreen = {
			{
				"panelUpRight",
				"right",
				"up",
				false
			},
			{
				"panelMidRight",
				"right",
				nil,
				true
			}
		}
	},
	["chip_plan_equip_tip.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["hunting_select_event.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["common_box_detail.json"] = {
		set = {
			{
				"content",
				"positionY",
				{
					868
				}
			},
			{
				"list",
				"positionY",
				{
					590
				}
			}
		}
	},
	["activity_zongzi_select.json"] = {
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
			}
		}
	},
	["drawcard_property_choose.json"] = {
		set = {
			{
				"subList",
				"visible",
				false
			},
			{
				"item",
				"visible",
				false
			},
			{
				"icon",
				"visible",
				false
			},
			{
				"subList2",
				"visible",
				false
			}
		}
	},
	["drawcard_property_detail.json"] = {
		set = {
			{
				"icon",
				"visible",
				false
			},
			{
				"subList",
				"visible",
				false
			}
		}
	},
	["summer_challenge.json"] = {
		dockWithScreen = {
			{
				"leftPanel",
				"left",
				"down",
				true
			},
			{
				"rightTimePanel",
				"right",
				"up",
				true
			}
		}
	},
	["beach_ice_view.json"] = {
		set = {
			{
				"demandPanel.item",
				"visible",
				false
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
	["beach_ice_check.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["beach_ice_rank.json"] = {
		set = {
			{
				"right.rank.item",
				"visible",
				false
			}
		}
	},
	["volleyball_rank.json"] = {
		oneLinePos = {
			{
				"title.txt",
				"title.txt1"
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
				"topPanel.txtNode1"
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
		}
	},
	["volleyball_main.json"] = {
		dockWithScreen = {
			{
				"leftPanel",
				"left",
				"down",
				true
			},
			{
				"textTipTime",
				"right",
				"up",
				true
			}
		},
		set = {
			{
				"ruleItem",
				"visible",
				false
			}
		}
	},
	["volleyball_game.json"] = {
		dockWithScreen = {
			{
				"movePanel",
				"left",
				"down",
				true
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
			}
		}
	},
	["activity_brave_challenge_gate.json"] = {
		set = {
			{
				"itemGate",
				"visible",
				false
			},
			{
				"item01",
				"visible",
				false
			}
		}
	},
	["activity_brave_challenge_gain_achievement.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["town_home_main_view.json"] = {
		set = {
			{
				"panelScale.sliderScale",
				"capInsets",
				{
					cc.rect(20, 0, 1, 1)
				}
			},
			{
				"panelShow",
				"visible",
				false
			},
			{
				"itemFurn",
				"visible",
				false
			},
			{
				"itemTitle",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"panelAssign.btnClear",
				"right",
				nil,
				true
			},
			{
				"panelAssign.btnSave",
				"right",
				nil,
				true
			},
			{
				"panelAssign.txtDecorateBg",
				"right",
				"up",
				false
			},
			{
				"panelAssign.txtDecorate",
				"right",
				"up",
				false
			},
			{
				"panelVisit.btnVisit",
				"left",
				"down",
				false
			},
			{
				"panelVisit.btnReceive",
				"right",
				nil,
				true
			},
			{
				"panelScale",
				"left",
				nil,
				true
			},
			{
				"panelButton.btnPreview",
				"left",
				nil,
				true
			},
			{
				"panelButton.btnToParty",
				"left",
				nil,
				true
			},
			{
				"panelButton.panelOpt",
				"right",
				"down",
				false
			},
			{
				"panelOtherHome.btnLike",
				"right",
				"down",
				false
			},
			{
				"panelOtherHome.evaluatePanel",
				"left",
				"down",
				false
			}
		}
	},
	["town_home_plan_main_view.json"] = {
		set = {
			{
				"itemCell",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"panelPlan.btnDelete",
				"right",
				"down",
				true
			},
			{
				"panelPlan.btnUse",
				"right",
				"down",
				true
			},
			{
				"panelPlan.btnCover",
				"right",
				"down",
				true
			}
		}
	},
	["activity_midautumn_task.json"] = {
		set = {
			{
				"rankItem",
				"visible",
				false
			},
			{
				"leftPanel.tabItem",
				"visible",
				false
			},
			{
				"infoItem",
				"visible",
				false
			}
		}
	},
	["activity_midautumn_draw.json"] = {
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
			},
			{
				"endTime",
				"right",
				"up",
				true
			}
		}
	},
	["cross_union_fight_record.json"] = {
		set = {
			{
				"leftPanel.tabItem",
				"visible",
				false
			},
			{
				"goodPanel.item",
				"visible",
				false
			}
		}
	},
	["cross_union_fight_battle.json"] = {
		dockWithScreen = {
			{
				"procList",
				"left",
				nil,
				true
			}
		}
	},
	["activity_customize_gift.json"] = {
		set = {
			{
				"iconItem",
				"visible",
				false
			},
			{
				"panel",
				"visible",
				false
			}
		}
	},
	["activity_customize_gift_select.json"] = {
		set = {
			{
				"subList",
				"visible",
				false
			},
			{
				"iconItem",
				"visible",
				false
			},
			{
				"slotIcon",
				"visible",
				false
			}
		}
	},
	["cross_union.json"] = {
		dockWithScreen = {
			{
				"integralRank",
				"left",
				"down"
			},
			{
				"embattle",
				"left",
				"down"
			},
			{
				"rightBtn",
				"right",
				"down"
			},
			{
				"combat",
				"left",
				"down"
			}
		}
	},
	["cross_union_competition.json"] = {
		dockWithScreen = {
			{
				"battle",
				"left",
				"down"
			},
			{
				"battlefield",
				"right",
				"down"
			}
		}
	},
	["cross_union_fight.json"] = {
		dockWithScreen = {
			{
				"leftPanel",
				"left"
			},
			{
				"integral",
				"left"
			}
		}
	},
	["cross_union_fight_bet.json"] = {
		dockWithScreen = {
			{
				"leftPanel",
				"left"
			}
		}
	},
	["cross_supremacy.json"] = {
		dockWithScreen = {
			{
				"downPanel",
				"left",
				"down"
			}
		}
	},
	["cross_supremacy_rank_info.json"] = {
		set = {
			{
				"showList.item",
				"visible",
				false
			}
		}
	},
	["cross_supremacy_award.json"] = {
		set = {
			{
				"rewardPanel.rankItem",
				"visible",
				false
			},
			{
				"leftPanel.tabItem",
				"visible",
				false
			}
		}
	},
	["cross_supremacy_combat_record.json"] = {
		set = {
			{
				"leftPanel.tabItem",
				"visible",
				false
			},
			{
				"myPanel.item",
				"visible",
				false
			},
			{
				"goodPanel.item",
				"visible",
				false
			}
		}
	},
	["cross_supremacy_rank.json"] = {
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
		}
	},
	["cross_supremacy_info.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["cross_supremacy_record_info.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["cross_supremacy_memorial.json"] = {
		dockWithScreen = {
			{
				"leftPanel",
				"left"
			}
		}
	},
	["cross_supremacy_battle_array.json"] = {
		set = {
			{
				"upPosition",
				"visible",
				false
			}
		}
	},
	["town_shop.json"] = {
		set = {
			{
				"topPanel.item",
				"visible",
				false
			},
			{
				"leftPanel.item",
				"visible",
				false
			},
			{
				"singlePanel.item",
				"visible",
				false
			},
			{
				"singlePanel.subList",
				"visible",
				false
			}
		}
	},
	["town_supershop.json"] = {
		set = {
			{
				"centerPanel.item",
				"visible",
				false
			},
			{
				"centerPanel.subList",
				"visible",
				false
			}
		}
	},
	["town_map.json"] = {
		set = {
			{
				"barPanel.slider",
				"capInsets",
				{
					cc.rect(20, 10, 1, 1)
				}
			}
		},
		dockWithScreen = {
			{
				"barPanel",
				"left",
				nil,
				true
			},
			{
				"onekeyPanel",
				"right",
				nil,
				true
			}
		}
	},
	["town_collection.json"] = {
		set = {
			{
				"leftTabPanel.item",
				"visible",
				false
			},
			{
				"furniturePanel.topItem",
				"visible",
				false
			},
			{
				"furniturePanel.centerItem",
				"visible",
				false
			},
			{
				"furniturePanel.subList",
				"visible",
				false
			},
			{
				"rolePanel.rightPanel.levelPanel.item",
				"visible",
				false
			},
			{
				"rolePanel.rightPanel.bonusesPanel.attrItem",
				"visible",
				false
			},
			{
				"rolePanel.rightPanel.rulePanel.title",
				"visible",
				false
			},
			{
				"seriesPanel.item",
				"visible",
				false
			},
			{
				"seriesPanel.rightItem",
				"visible",
				false
			}
		},
		scaleWithWidth = {
			{
				"seriesPanel.item.attrAdd",
				nil,
				680
			}
		}
	},
	["town_rest.json"] = {
		dockWithScreen = {
			{
				"rightPanel",
				"right",
				nil,
				true
			}
		},
		set = {
			{
				"rightPanel.item",
				"visible",
				false
			}
		}
	},
	["town_rest_detail.json"] = {
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
		}
	},
	["town_building_center.json"] = {
		set = {
			{
				"rightPanel.upPanel.textTask",
				"visible",
				false
			}
		}
	},
	["town_factory_choose.json"] = {
		set = {
			{
				"rightPanel.item",
				"visible",
				false
			},
			{
				"rightPanel.subList",
				"visible",
				false
			}
		},
		scaleWithWidth = {
			{
				"leftPanel.noData",
				nil,
				700
			}
		}
	},
	["town_normal_factory.json"] = {
		set = {
			{
				"rightBottomPanel.item",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"rightBottomPanel.title",
				"rightBottomPanel.team",
				cc.p(5, 0)
			}
		}
	},
	["town_order_factory.json"] = {
		set = {
			{
				"rightBottomPanel.item",
				"visible",
				false
			}
		}
	},
	["town_exploration_reward.json"] = {
		set = {
			{
				"leftPanel.tabItem",
				"visible",
				false
			},
			{
				"rankItem",
				"visible",
				false
			}
		}
	},
	["town_exploration_skill.json"] = {
		set = {
			{
				"centerPanel.item",
				"visible",
				false
			}
		}
	},
	["town_exploration_view.json"] = {
		set = {
			{
				"centerPanel.item",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"teamPanel",
				"left",
				"down",
				false
			}
		}
	},
	["town_map_right_panel.json"] = {
		dockWithScreen = {
			{
				"rightPanel",
				"right",
				"up",
				false
			}
		}
	},
	["town_exploration_right_panel.json"] = {
		set = {
			{
				"rightPanel.teamItem",
				"visible",
				false
			},
			{
				"rightPanel.item",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"rightPanel",
				"right",
				"up",
				false
			}
		}
	},
	["town_factory_level_up.json"] = {
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
		}
	},
	["totem_bag.json"] = {
		set = {
			{
				"leftPanel.tabItem",
				"visible",
				false
			}
		}
	},
	["totem_view.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"collection",
				"left"
			},
			{
				"book",
				"left"
			},
			{
				"shop",
				"left"
			},
			{
				"decompose",
				"left"
			},
			{
				"draw",
				"left"
			},
			{
				"rule",
				"right"
			}
		}
	},
	["totem_inset.json"] = {
		set = {
			{
				"leftItem",
				"visible",
				false
			},
			{
				"icon",
				"visible",
				false
			},
			{
				"rightPanel.item",
				"visible",
				false
			},
			{
				"centerPanel.panel1.box",
				"visible",
				false
			},
			{
				"centerPanel.panel1.text",
				"visible",
				false
			},
			{
				"rightPanel.starText",
				"visible",
				false
			},
			{
				"rightPanel.starIcon",
				"visible",
				false
			},
			{
				"rightPanel.nextStarBtn",
				"visible",
				false
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
	["totem_collect.json"] = {
		set = {
			{
				"award.itemBox",
				"visible",
				false
			},
			{
				"items",
				"visible",
				false
			}
		}
	},
	["totem_activate.json"] = {
		set = {
			{
				"attrs",
				"visible",
				false
			},
			{
				"imgItem",
				"visible",
				false
			},
			{
				"one.starNum",
				"visible",
				false
			},
			{
				"one.starIcon",
				"visible",
				false
			},
			{
				"multi.attrItems",
				"visible",
				false
			},
			{
				"multi.attrItems.iconTag",
				"visible",
				false
			},
			{
				"multi.attrItems.starNum",
				"visible",
				false
			},
			{
				"multi.attrItems.starIcon",
				"visible",
				false
			}
		},
		scaleWithWidth = {
			{
				"multi.attrItems.txt",
				nil,
				200
			}
		}
	},
	["totem_info.json"] = {
		set = {
			{
				"node.attrItem",
				"visible",
				false
			}
		}
	},
	["totem_quick_inset.json"] = {
		dockWithScreen = {
			{
				"sureBtn",
				"right",
				"down",
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
				"item.starPanel.text",
				"visible",
				false
			},
			{
				"item.starPanel.starText",
				"visible",
				false
			},
			{
				"item.starPanel.icon",
				"visible",
				false
			},
			{
				"activePanel",
				"visible",
				false
			}
		}
	},
	["totem_quick_inset_detail.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"icon",
				"visible",
				false
			}
		}
	},
	["totem_resolve.json"] = {
		dockWithScreen = {
			{
				"duckPanel",
				"left"
			},
			{
				"leftPanel.list",
				"left"
			},
			{
				"leftPanel.tips",
				"left"
			},
			{
				"leftPanel.bottomList",
				"left"
			},
			{
				"leftPanel.title",
				"left"
			}
		}
	},
	["totem_star_preview.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
		}
	},
	["yybet_rank.json"] = {
		set = {
			{
				"content.rank.item",
				"visible",
				false
			}
		}
	},
	["yybet_shop.json"] = {
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
		}
	},
	["yybet_award.json"] = {
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
		}
	},
	["yybet_record.json"] = {
		set = {
			{
				"tableItems",
				"visible",
				false
			},
			{
				"goodPanel.item",
				"visible",
				false
			}
		}
	},
	["yybet_bet.json"] = {
		dockWithScreen = {
			{
				"betPanelL",
				"left"
			},
			{
				"betPanelR",
				"right"
			},
			{
				"bottomPanel.listL",
				"left"
			},
			{
				"bottomPanel.listR",
				"right"
			},
			{
				"bottomPanel.barragePanel",
				"right"
			},
			{
				"betPanel.panelL",
				"left"
			},
			{
				"betPanel.panelR",
				"right"
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
			}
		}
	},
	["explore_advance_rule_detail.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["town_home_visit.json"] = {
		set = {
			{
				"rightPanel.item",
				"visible",
				false
			},
			{
				"leftPanel.item",
				"visible",
				false
			},
			{
				"rightPanel.list2",
				"visible",
				false
			},
			{
				"rightPanel.emptyPanel",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"leftPanel",
				"left"
			}
		}
	},
	["town_home_rank.json"] = {
		set = {
			{
				"leftPanel.item",
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
				"title.textTitle1",
				"title.textTitle2"
			}
		}
	},
	["totem_preview.json"] = {
		set = {
			{
				"mid.totemItem",
				"visible",
				false
			},
			{
				"mid.proItem",
				"visible",
				false
			}
		}
	},
	["totem_draw.json"] = {
		dockWithScreen = {
			{
				"topRightPanel",
				"right",
				"up",
				false
			},
			{
				"btnPreview",
				"right",
				nil,
				false
			},
			{
				"btnExchange",
				"right",
				nil,
				false
			}
		}
	},
	["totem_exchange.json"] = {
		set = {
			{
				"leftPanel.item",
				"visible",
				false
			},
			{
				"centerPanel.subList",
				"visible",
				false
			},
			{
				"centerPanel.item",
				"visible",
				false
			},
			{
				"bottomPanel.item",
				"visible",
				false
			}
		}
	},
	["activity_seeksprite.json"] = {
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
		}
	},
	["activity_seeksprite_reward.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["seeksprite_task.json"] = {
		set = {
			{
				"taskItem",
				"visible",
				false
			}
		}
	},
	["town_wish.json"] = {
		dockWithScreen = {
			{
				"ruleBtn",
				"left",
				"down",
				false
			},
			{
				"wishBoxBtn",
				"left",
				"down",
				false
			},
			{
				"levelUpBtn",
				"right",
				"down",
				false
			},
			{
				"progressPanel",
				"right",
				"up",
				false
			}
		}
	},
	["town_wish_box.json"] = {
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
		}
	},
	["town_party_card_energy.json"] = {
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
		}
	},
	["town_party_invation_send.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"leftItem",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"item.txt",
				"item.power",
				cc.p(10, 0),
				"left"
			}
		}
	},
	["town_party_invation_look.json"] = {
		set = {
			{
				"leftItem",
				"visible",
				false
			},
			{
				"talkPanel.item",
				"visible",
				false
			},
			{
				"talkPanel.leftPanel.item",
				"visible",
				false
			},
			{
				"worldPanel.item",
				"visible",
				false
			},
			{
				"worldPanel.innerList",
				"visible",
				false
			}
		}
	},
	["town_party_prepare.json"] = {
		dockWithScreen = {
			{
				"rightPanel",
				"right",
				"down",
				false
			}
		}
	},
	["town_party_change.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"listCell",
				"visible",
				false
			}
		}
	},
	["town_party_main.json"] = {
		set = {
			{
				"uiPanel.danmuPanel.barrage",
				"visible",
				false
			},
			{
				"uiPanel.itemTitle",
				"visible",
				false
			},
			{
				"uiPanel.itemColor",
				"visible",
				false
			},
			{
				"uiPanel.itemUnder",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"previewBtn",
				"left",
				"up",
				false
			}
		}
	},
	["town_exploration_onekey.json"] = {
		set = {
			{
				"item.panel.subList",
				"visible",
				false
			}
		}
	},
	["town_factory_team.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item.item",
				"visible",
				false
			}
		}
	},
	["mimicry_embattle.json"] = {
		dockWithScreen = {
			{
				"limitPanel",
				"right",
				"up",
				true
			},
			{
				"bossPanel",
				"right",
				"up",
				true
			},
			{
				"limitCardPanel",
				"right",
				"up",
				true
			},
			{
				"limitSkillPanel",
				"right",
				"up",
				true
			}
		},
		set = {
			{
				"limitPanel.rareItem",
				"visible",
				false
			},
			{
				"limitCardPanel.subItem",
				"visible",
				false
			},
			{
				"limitCardPanel.cell",
				"visible",
				false
			},
			{
				"limitPanel.subItem",
				"visible",
				false
			}
		}
	},
	["mimicry_addition.json"] = {
		set = {
			{
				"item2",
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
				"noBuffItem",
				"visible",
				false
			},
			{
				"itemUnlock",
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
		}
	},
	["strange_meteor.json"] = {
		dockWithScreen = {
			{
				"rule",
				"right",
				nil,
				false
			},
			{
				"meteorItem1",
				"left"
			},
			{
				"meteorItem2",
				"left"
			},
			{
				"meteorItem4",
				"right"
			},
			{
				"meteorItem5",
				"right"
			}
		}
	},
	["strange_meteor_held_select.json"] = {
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
			}
		}
	},
	["strange_meteor_sprite_select.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["strange_meteor_detail.json"] = {
		dockWithScreen = {
			{
				"meteorTabBg",
				"left"
			},
			{
				"rightPanel",
				"right"
			}
		}
	},
	["strange_meteor_unlock_tips.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
		}
	},
	["medal_collection_view.json"] = {
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
				"pageItem",
				"visible",
				false
			}
		}
	},
	["medal_collection_tip.json"] = {
		set = {
			{
				"baseNode.attrPanel.item",
				"visible",
				false
			},
			{
				"baseNode.attrPanel.subList",
				"visible",
				false
			}
		}
	},
	["medal_coollection_detail.json"] = {
		set = {
			{
				"normal.bottom.item",
				"visible",
				false
			},
			{
				"normal.left.tag",
				"visible",
				false
			},
			{
				"normal.right.btn",
				"visible",
				true
			},
			{
				"normal.right.btnShow",
				"visible",
				false
			},
			{
				"normal.right.iconPanel",
				"visible",
				false
			},
			{
				"normal.right.attrPanel",
				"visible",
				false
			}
		}
	},
	["hunting_jump.json"] = {
		set = {
			{
				"panel2.item",
				"visible",
				false
			},
			{
				"panel3.item",
				"visible",
				false
			}
		}
	},
	["activity_brave_challenge_view_jump.json"] = {
		set = {
			{
				"panel2.item",
				"visible",
				false
			}
		}
	},
	["cross_mine_blackjack_view.json"] = {
		set = {
			{
				"gamePanel.pointPanel1",
				"visible",
				false
			},
			{
				"gamePanel.pointPanel2",
				"visible",
				false
			},
			{
				"gamePanel.iconDouble",
				"visible",
				false
			},
			{
				"gamePanel.iconBlackJ",
				"visible",
				false
			},
			{
				"gamePanel.iconWin",
				"visible",
				false
			},
			{
				"gamePanel.iconArrow",
				"visible",
				false
			},
			{
				"gamePanel.cardPanel",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"btnRule",
				"left",
				"up"
			},
			{
				"gamePanel.btnDivide",
				"right",
				"down"
			},
			{
				"gamePanel.btnDouble",
				"right",
				"down"
			}
		}
	},
	["worldcup_schedule.json"] = {
		set = {
			{
				"panel1.item",
				"visible",
				false
			},
			{
				"panel1.item.panel.item",
				"visible",
				false
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
		}
	},
	["worldcup_guess.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"item.item",
				"visible",
				false
			},
			{
				"leftPanel.item",
				"visible",
				false
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
	["worldcup_achievement.json"] = {
		set = {
			{
				"item",
				"visible",
				false
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
	["worldcup_predict.json"] = {
		set = {
			{
				"predictPanel.item",
				"visible",
				false
			},
			{
				"predictPanel.subList",
				"visible",
				false
			},
			{
				"selectPanel.item",
				"visible",
				false
			}
		},
		scaleWithWidth = {
			{
				"predictPanel.item.name",
				nil,
				80
			}
		}
	},
	["worldcup_rank.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["worldcup_main.json"] = {
		set = {
			{
				"leftPanel.leftItem",
				"visible",
				false
			},
			{
				"rightPanel.itemPanel",
				"visible",
				false
			}
		}
	},
	["town_relic.json"] = {
		set = {
			{
				"rightPanel.item",
				"visible",
				false
			},
			{
				"leftPanel.item",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"btnClick",
				"right",
				"down"
			},
			{
				"buffPanel",
				"right",
				"up"
			},
			{
				"leftPanel",
				"left"
			}
		}
	},
	["town_attr_get.json"] = {
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
		}
	},
	["contest_bet_view.json"] = {
		dockWithScreen = {
			{
				"downLeftPanel",
				"left",
				"down"
			},
			{
				"downRightPanel",
				"right",
				"down"
			}
		}
	},
	["contest_bet_schedule.json"] = {
		set = {
			{
				"groupPanel.item",
				"visible",
				false
			},
			{
				"groupPanel.item.item",
				"visible",
				false
			},
			{
				"btnItem",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"bottomPanel",
				"right",
				"down"
			},
			{
				"btnList",
				"left",
				"down"
			}
		}
	},
	["contest_bet_detail.json"] = {
		set = {
			{
				"baseNode.item",
				"visible",
				false
			}
		}
	},
	["contest_bet_champion.json"] = {
		set = {
			{
				"subList",
				"visible",
				false
			},
			{
				"item",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"btnAward",
				"left",
				"down"
			},
			{
				"barragetOperationPanel",
				"right",
				"down"
			},
			{
				"betPanel",
				"right",
				"down"
			},
			{
				"teamList",
				"left",
				"down"
			},
			{
				"infoPanel",
				"right",
				"down"
			}
		}
	},
	["contest_bet_attrdetail.json"] = {
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
				"skillItem",
				"visible",
				false
			}
		}
	},
	["sprite_jump_game.json"] = {
		dockWithScreen = {
			{
				"panelScore",
				"left",
				"up"
			},
			{
				"panelGameTime",
				"right",
				"up"
			},
			{
				"panelGameTimeRed",
				"right",
				"up"
			},
			{
				"btnOperate",
				"right",
				"down"
			}
		},
		oneLinePos = {
			{
				"panelScore.imgMax",
				"panelScore.panelMaxScore"
			}
		}
	},
	["sprite_jump_task.json"] = {
		dockWithScreen = {
			{
				"listBg",
				"right",
				nil,
				false
			},
			{
				"list",
				"right",
				nil,
				false
			},
			{
				"oneKeyBtn",
				"right",
				nil,
				false
			},
			{
				"img3",
				"left",
				"down",
				false
			}
		},
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["sprite_jump_rank.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["sprite_jump_over.json"] = {
		dockWithScreen = {
			{
				"rightPanel",
				"right",
				nil,
				false
			},
			{
				"img3",
				"left",
				"down",
				false
			}
		}
	},
	["town_party_darts.json"] = {
		dockWithScreen = {
			{
				"leftPanel",
				"left"
			}
		}
	},
	["town_party_darts_game.json"] = {
		set = {
			{
				"aimImg",
				"visible",
				false
			},
			{
				"dropImg",
				"visible",
				false
			},
			{
				"scorePanel",
				"visible",
				false
			},
			{
				"countPanel.item",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"talkPanel",
				"left"
			},
			{
				"countPanel",
				"right"
			}
		}
	},
	["town_party_darts_rank.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["follow.json"] = {
		set = {
			{
				"rightPanel.subList",
				"visible",
				false
			},
			{
				"rightPanel.item",
				"visible",
				false
			},
			{
				"rightPanel.rarityItem",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"rightPanel",
				"right"
			}
		}
	},
	["activity_preferential_goods.json"] = {
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
			}
		},
		scaleWithWidth = {
			{
				"leftItem.normal.txt",
				nil,
				180
			},
			{
				"leftItem.selected.txt",
				nil,
				180
			}
		}
	},
	["activity_preferential_goods_select.json"] = {
		set = {
			{
				"iconItem",
				"visible",
				false
			},
			{
				"slotIcon",
				"visible",
				false
			},
			{
				"subList",
				"visible",
				false
			}
		}
	},
	["star_rating_main.json"] = {
		dockWithScreen = {
			{
				"leftPanel",
				"left"
			},
			{
				"tabPanel",
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
				"tabPanel.item",
				"visible",
				false
			},
			{
				"leftPanel.item.bg1",
				"visible",
				false
			},
			{
				"centerPanel.starItem",
				"visible",
				false
			}
		}
	},
	["star_select_role.json"] = {
		set = {
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
		}
	},
	["confirm_preview.json"] = {
		set = {
			{
				"centerPanel.leftIcon",
				"visible",
				false
			},
			{
				"centerPanel.rightIcon",
				"visible",
				false
			},
			{
				"bottomNoUse",
				"visible",
				false
			}
		}
	},
	["swap_over.json"] = {
		set = {
			{
				"starItem",
				"visible",
				false
			}
		}
	},
	["auto_chess.json"] = {
		dockWithScreen = {
			{
				"cutDownPanel",
				"right",
				"up",
				false
			},
			{
				"downPanel",
				"left",
				"down",
				false
			},
			{
				"personPanel.infoPanel",
				"left",
				"up",
				false
			},
			{
				"achievementPanel",
				"right",
				"down",
				false
			}
		}
	},
	["auto_chess_change_trainer.json"] = {
		dockWithScreen = {
			{
				"trainerPanel.trainerList",
				"left"
			},
			{
				"btnBag",
				"right",
				"down"
			},
			{
				"skillPanel",
				"right"
			},
			{
				"infoPanel",
				"right",
				"up"
			}
		},
		set = {
			{
				"trainerPanel.item",
				"visible",
				false
			},
			{
				"skillPanel.skillItem",
				"visible",
				false
			},
			{
				"infoPanel.icon",
				"visible",
				false
			},
			{
				"achievementTips",
				"visible",
				false
			}
		}
	},
	["auto_chess_skill_detail.json"] = {
		dockWithScreen = {
			{
				"panel",
				"right"
			}
		}
	},
	["auto_chess_end_accounts.json"] = {
		set = {
			{
				"achievementTips",
				"visible",
				false
			}
		}
	},
	["auto_chess_battle.json"] = {
		dockWithScreen = {
			{
				"ui.pauseBtn",
				"left",
				"up",
				false
			},
			{
				"ui.playBtn",
				"left",
				"up",
				false
			},
			{
				"ui.backBtn",
				"left",
				"up",
				false
			},
			{
				"ui.goldIcon",
				"right",
				"up",
				false
			},
			{
				"ui.goldNum",
				"right",
				"up",
				false
			}
		},
		set = {
			{
				"encounterPanel",
				"visible",
				false
			},
			{
				"bossPanel",
				"visible",
				false
			},
			{
				"pointSpr",
				"visible",
				false
			}
		}
	},
	["cross_union_adventure.json"] = {
		set = {
			{
				"panelScale.sliderScale",
				"capInsets",
				{
					cc.rect(11, 0, 1, 1)
				}
			},
			{
				"panelTopInfo1",
				"visible",
				false
			},
			{
				"panelTopInfo2",
				"visible",
				false
			},
			{
				"panelTopInfo3",
				"visible",
				false
			},
			{
				"panelLeftTop",
				"visible",
				false
			},
			{
				"panelRight",
				"visible",
				false
			},
			{
				"panelRightBottom",
				"visible",
				false
			},
			{
				"panelVertexInfo",
				"visible",
				false
			},
			{
				"panelVS",
				"visible",
				false
			},
			{
				"panelRight.item",
				"visible",
				false
			},
			{
				"panelBottom.item",
				"visible",
				false
			},
			{
				"panelLeftBottom.item",
				"visible",
				false
			},
			{
				"panelLeftBottom.tabItem",
				"visible",
				false
			},
			{
				"panelResult",
				"visible",
				false
			},
			{
				"panelTip",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"panelScale",
				"left",
				nil,
				true
			},
			{
				"panelRight",
				"right",
				nil,
				true
			},
			{
				"panelLeftTop",
				"left",
				"up",
				false
			},
			{
				"panelRightTop",
				"right",
				nil,
				false
			},
			{
				"panelLeftBottom",
				"left",
				"down",
				false
			},
			{
				"panelRightBottom",
				"right",
				nil,
				false
			},
			{
				"panelTip",
				"left",
				nil,
				false
			}
		}
	},
	["cross_union_adventure_vertex_info.json"] = {
		set = {
			{
				"panelRight.item",
				"visible",
				false
			},
			{
				"panelRight.subList",
				"visible",
				false
			}
		}
	},
	["cross_union_adventure_union_info.json"] = {
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
			}
		}
	},
	["cross_union_adventure_team_info.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["cross_union_adventure_combat_record.json"] = {
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
				"rankPanel.item",
				"visible",
				false
			}
		}
	},
	["cross_union_adventure_record_info.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["cross_union_adventure_main.json"] = {
		set = {
			{
				"serverPanel.item",
				"visible",
				false
			},
			{
				"serverPanel.subList",
				"visible",
				false
			},
			{
				"serverPanel.unionPanel",
				"visible",
				false
			},
			{
				"serverPanel.emptyPanel",
				"visible",
				false
			},
			{
				"serverPanel.waitPanel",
				"visible",
				false
			},
			{
				"downPanel.item",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"downPanel",
				"left",
				"down",
				false
			},
			{
				"overPanel.leftArrow",
				"left"
			},
			{
				"overPanel.rightArrow",
				"right"
			}
		}
	},
	["cross_union_adventure_sign.json"] = {
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
				"subList",
				"visible",
				false
			},
			{
				"emptyPanel",
				"visible",
				false
			}
		}
	},
	["cross_union_adventure_sign_info.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["cross_union_adventure_rank.json"] = {
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
			}
		}
	},
	["cross_union_adventure_review.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["cross_union_adventure_review_info.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["cross_union_adventure_car.json"] = {
		set = {
			{
				"leftPanel.item",
				"visible",
				false
			},
			{
				"rightPanel.subList",
				"visible",
				false
			},
			{
				"rightPanel.item",
				"visible",
				false
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
	["new_new_world_tasks.json"] = {
		set = {
			{
				"panel.topPanel.topItem",
				"visible",
				false
			},
			{
				"panel.item",
				"visible",
				false
			}
		}
	},
	["common_skill_detail1.json"] = {
		set = {
			{
				"actionPanel.rightPanel",
				"visible",
				false
			},
			{
				"item",
				"visible",
				false
			},
			{
				"actionPanel.rightPanel.item",
				"visible",
				false
			}
		}
	},
	["weather_select.json"] = {
		set = {
			{
				"panel.ruleItem",
				"visible",
				false
			},
			{
				"panel.item",
				"visible",
				false
			}
		}
	},
	["arm_card_select.json"] = {
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
		}
	},
	["arm_overview.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["arm.json"] = {
		set = {
			{
				"naturePanel.item",
				"visible",
				false
			}
		}
	},
	["arm_detail.json"] = {
		set = {
			{
				"downPanel.spriteItem",
				"visible",
				false
			}
		}
	},
	["qixi_task.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["qixi_find_bird_game.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"sublist",
				"visible",
				false
			}
		}
	},
	["qixi_find_bird_start.json"] = {
		dockWithScreen = {
			{
				"btnRule",
				"left",
				"down"
			}
		}
	},
	["qixi_collect.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["qixi_main.json"] = {
		dockWithScreen = {
			{
				"bottomLeftPanel",
				"left",
				"down"
			},
			{
				"awardBtn",
				"right",
				"down"
			},
			{
				"topPanel",
				"right",
				"up"
			}
		}
	},
	["vip_shop.json"] = {
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
		}
	},
	["contract_exchange.json"] = {
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
				"pageItem",
				"visible",
				false
			}
		}
	},
	["contract_exchange_detail.json"] = {
		set = {
			{
				"leftPanel.attrPanel.item",
				"visible",
				false
			},
			{
				"leftPanel.attrPanel.subList",
				"visible",
				false
			}
		}
	},
	["contract_exchange_buy.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["contract_choose.json"] = {
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
		}
	},
	["contract_filter.json"] = {
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
		}
	},
	["contract_handbook.json"] = {
		set = {
			{
				"tabItem",
				"visible",
				false
			},
			{
				"leftPanel.item",
				"visible",
				false
			},
			{
				"leftPanel.subList",
				"visible",
				false
			},
			{
				"rightPanel.attrPanel.item",
				"visible",
				false
			},
			{
				"rightPanel.attrPanel.subList",
				"visible",
				false
			}
		}
	},
	["contract_card_select.json"] = {
		set = {
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
				"item.contractItem",
				"visible",
				false
			}
		}
	},
	["contract_change.json"] = {
		set = {
			{
				"leftPanel.attrPanel.item",
				"visible",
				false
			},
			{
				"leftPanel.attrPanel.subList",
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
		}
	},
	["contract_strength.json"] = {
		set = {
			{
				"infoPanel.attrPanel.item",
				"visible",
				false
			},
			{
				"infoPanel.attrPanel.subList",
				"visible",
				false
			},
			{
				"upgradePanel.attrItem",
				"visible",
				false
			},
			{
				"upgradePanel.attrSubList",
				"visible",
				false
			},
			{
				"upgradePanel.item",
				"visible",
				false
			},
			{
				"upgradePanel.itemSubList",
				"visible",
				false
			},
			{
				"upgradePanel.quickSelectPanel.item",
				"visible",
				false
			},
			{
				"advancePanel.costItem",
				"visible",
				false
			},
			{
				"advancePanel.attrItem",
				"visible",
				false
			},
			{
				"advancePanel.attrSubList",
				"visible",
				false
			},
			{
				"tabItem",
				"visible",
				false
			}
		}
	},
	["contract_bag.json"] = {
		set = {
			{
				"innweList",
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
	["contract.json"] = {
		dockWithScreen = {
			{
				"btnGain",
				"left",
				"down"
			},
			{
				"btnShop",
				"left",
				"down"
			},
			{
				"btnBag",
				"right",
				"down"
			},
			{
				"btnHandbook",
				"right",
				"down"
			},
			{
				"btnRule",
				"left",
				"up",
				false
			}
		}
	},
	["contract_common_success.json"] = {
		set = {
			{
				"centerPanel.attrItem",
				"visible",
				false
			},
			{
				"centerPanel.attrSubList",
				"visible",
				false
			}
		}
	},
	["card_filter.json"] = {
		set = {
			{
				"tabPanel.btnItem",
				"visible",
				false
			},
			{
				"searchPanel.posNode",
				"visible",
				false
			},
			{
				"searchPanel.historyItem",
				"visible",
				false
			},
			{
				"attrListPanel.item",
				"visible",
				false
			},
			{
				"attrListPanel.subList",
				"visible",
				false
			},
			{
				"rarityListPanel.item",
				"visible",
				false
			},
			{
				"rarityListPanel.subList",
				"visible",
				false
			}
		},
		oneLinePos = {
			{
				"topPanel.title",
				"topPanel.title1",
				cc.p(0, 0),
				"left"
			}
		}
	},
	["auto_chess_handbook.json"] = {
		dockWithScreen = {
			{
				"btnRule",
				"left",
				"up",
				false
			}
		}
	},
	["auto_chess_handbook_filter.json"] = {
		set = {
			{
				"panel.item1",
				"visible",
				false
			},
			{
				"panel.item2",
				"visible",
				false
			},
			{
				"panel.item3",
				"visible",
				false
			},
			{
				"panel.subList",
				"visible",
				false
			}
		}
	},
	["auto_chess_handbook_award_preview.json"] = {
		set = {
			{
				"panel.item",
				"visible",
				false
			}
		}
	},
	["vip_gift_2.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			},
			{
				"itemTitle",
				"visible",
				false
			},
			{
				"itemGift",
				"visible",
				false
			}
		}
	},
	["hell_random_tower_embattle.json"] = {
		set = {
			{
				"rightPanel.item",
				"visible",
				false
			},
			{
				"rightPanel.sublist",
				"visible",
				false
			}
		},
		dockWithScreen = {
			{
				"btnGHimg",
				"left"
			},
			{
				"btnWeather",
				"left"
			},
			{
				"themePanel",
				"left"
			},
			{
				"themeTip.box",
				"left"
			},
			{
				"rightPanel",
				"right"
			},
			{
				"fightCardTip.box",
				"right"
			}
		}
	},
	["hell_random_tower.json"] = {
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
		}
	},
	["block_blast_game.json"] = {
		set = {
			{
				"blockPanel.item",
				"visible",
				false
			}
		}
	},
	["block_blast_task.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	},
	["block_blast_rank.json"] = {
		set = {
			{
				"item",
				"visible",
				false
			}
		}
	}
}
