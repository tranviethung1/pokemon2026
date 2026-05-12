slot0 = require("app.views.city.union.tools")
slot1 = require("app.views.city.union.cross_unionfight.tools")
slot2 = {
	"dailygift",
	"redpacket",
	"training",
	"unionskill",
	"fuben",
	"unionFight",
	"contribute",
	"fragdonate",
	"unionqa",
	"crossunionfight",
	"crossUnionAdventure"
}
slot3 = {
	fragdonate = function (slot0, slot1)
		uv2 = "canEnterBuilding"

		if not slot2.canEnterBuilding("fragdonate", nil, true) then
			return false
		end

		return slot0.unionFragDonateStartTimes:read() == 0
	end,
	contribute = function (slot0, slot1)
		uv2 = "canEnterBuilding"

		if not slot2.canEnterBuilding("contribute", nil, true) then
			return false
		end

		return slot0.contribCount:read() < csv.union.union_level[slot0.unionLv:read()].ContribMax
	end,
	uniontask = function (slot0, slot1)
		uv2 = "canEnterBuilding"

		if not slot2.canEnterBuilding("contribute", nil, true) then
			return false
		end

		slot3 = false
		slot4 = {
			[slot8] = slot9[2]
		}

		for slot8, slot9 in pairs(slot0.unionAllTasks:read()) do
			-- Nothing
		end

		for slot8, slot9 in orderCsvPairs(csv.union.union_task) do
			if slot9.type == 1 and (not slot4[slot8] or slot4[slot8] == 0) then
				slot3 = true

				break
			end
		end

		return slot3
	end,
	dailygift = function (slot0, slot1)
		uv2 = "canEnterBuilding"

		if not slot2.canEnterBuilding("dailygift", nil, true) then
			return false
		end

		return slot0.dailyGiftTimes:read() <= 0
	end,
	speedup = function (slot0, slot1)
		uv2 = "canEnterBuilding"

		if not slot2.canEnterBuilding("training", nil, true) then
			return false
		end

		slot3 = 0

		if slot1.tarhetArg then
			slot3 = math.max(6 - slot0.trainingSpeedup:read(), 0)
		end

		return slot0.trainingSpeedup:read() < 6, slot3
	end,
	dailypacket = function (slot0, slot1)
		uv2 = "canEnterBuilding"

		if not slot2.canEnterBuilding("redpacket", nil, true) then
			return false
		end

		return slot0.systemRedPacket:read()
	end,
	fuben = function (slot0, slot1)
		uv2 = "canEnterBuilding"
		slot3 = "fuben"
		uv3 = "canEnterBuilding"

		if not slot2.canEnterBuilding(slot3, nil, true) or slot3.currentOpenFuben() ~= "open" then
			return false
		end

		slot4 = slot0.unionFbTimes:read()
		slot5 = 0

		if slot1.tarhetArg then
			slot5 = math.max(3 - slot4, 0)
		end

		return math.max(3 - slot4, 0) > 0, slot5
	end,
	fightsign = function (slot0, slot1)
		return false
	end
}

function slot4(slot0, slot1)
	slot3 = slot0:size()

	if not slot0:get("effect") then
		slot2 = widget.addAnimationByKey(slot0, "union/hongbaokeling.skel", "effect", slot1, 2):xy(slot3.width / 2 + 0, slot3.height / 2 + 0)
	else
		slot2:show():play(slot1)
	end
end

slot5 = {
	dailygift = function (slot0)
		uv1 = "canEnterBuilding"

		if not slot1.canEnterBuilding("dailygift") then
			return
		end

		if slot0.dailyGiftTimes:read() > 0 then
			gGameUI:showTip(gLanguageCsv.aleardyGetGift)

			return
		end

		gGameApp:requestServerCustom("/game/union/daily_gift"):params():onResponse(function (slot0)
			uv1 = "dailygift"
			slot1 = slot1.dailygift:get("effect")
			slot1 = slot1.play

			slot1(slot1, "dianji_houjing")

			uv1 = "dailygift"

			if not slot1.effectPanel:get("effect") then
				uv3 = "dailygift"

				widget.addAnimationByKey(slot3.effectPanel, "union/gonghuimeiri.skel", "effect", "dianji_qianjing", 1):xy(650, 260):setSpriteEventHandler(function (slot0, slot1)
					uv2 = "hide"
					slot2 = slot2.hide

					slot2(slot2)

					uv2 = "dailygift"
					slot2 = slot2.dailygift:get("effect")
					slot2 = slot2.play

					slot2(slot2, "standby_loop")

					uv2 = "get"
					slot2[1] = true
				end, sp.EventType.ANIMATION_COMPLETE)
			else
				slot1:show():play("dianji_qianjing")
			end
		end):wait({
			false
		}):doit(function (slot0)
			sdk.trackEvent("claim_uniondaily")
			gGameUI:showGainDisplay(slot0)
		end)
	end,
	redpacket = function (slot0)
		uv1 = "canEnterBuilding"

		if not slot1.canEnterBuilding("redpacket", true) then
			return
		end

		gGameApp:requestServer("/game/union/redpacket/info", function (slot0)
			gGameUI:stackUI("city.union.redpack.view", nil, {
				full = true
			}, slot0.view)
		end)
	end,
	training = function (slot0)
		uv1 = "canEnterBuilding"

		if not slot1.canEnterBuilding("training") then
			return
		end

		gGameApp:requestServer("/game/union/training/open", function (slot0)
			if gGameModel.union_training then
				gGameUI:stackUI("city.union.train.view", nil, , slot0)
			end
		end)
	end,
	unionskill = function (slot0)
		uv1 = "canEnterBuilding"

		if not slot1.canEnterBuilding("unionskill", true) then
			return
		end

		gGameUI:stackUI("city.union.skill.view")
	end,
	fuben = function (slot0)
		uv1 = "canEnterBuilding"

		if not slot1.canEnterBuilding("fuben") then
			return
		end

		gGameApp:requestServer("/game/union/fuben/get", function (slot0)
			gGameUI:stackUI("city.union.gate.view", nil, , slot0.view)
		end)
	end,
	unionFight = function (slot0)
		if not dataEasy.isInServer("unionFight") then
			return
		end

		uv1 = "dataEasy"

		if not slot1.canEnterBuilding("unionFight") then
			return
		end

		if not dataEasy.isUnlock(gUnlockCsv.unionFight) then
			gGameUI:showTip(dataEasy.getUnlockTip(gUnlockCsv.unionFight))

			return
		end

		for slot5, slot6 in csvPairs(csv.pvpandpve) do
			if slot6.unlockFeature == "unionFight" and dataEasy.serverOpenDaysLess(getCsv(slot6.serverDayInfo.sevCsv)) then
				gGameUI:showTip(string.format(gLanguageCsv.unlockServerOpen, slot7))

				return
			end
		end

		gGameApp:requestServer("/game/union/fight/battle/main", function (slot0)
			gGameUI:stackUI("city.union.union_fight.view", nil, {
				full = true
			})
		end)
	end,
	contribute = function (slot0)
		uv1 = "canEnterBuilding"

		if not slot1.canEnterBuilding("contribute") then
			return
		end

		gGameUI:stackUI("city.union.contrib.view")
	end,
	fragdonate = function (slot0)
		uv1 = "canEnterBuilding"

		if not slot1.canEnterBuilding("fragdonate") then
			return
		end

		gGameApp:requestServer("/game/union/get", function (slot0)
			gGameUI:stackUI("city.union.frag_donate.view")
		end)
	end,
	lobby = function ()
		gGameApp:requestServer("/game/union/get", function (slot0)
			gGameUI:stackUI("city.union.lobby.view", nil, {
				full = true
			})
		end)
	end,
	unionnotice = function (slot0)
		gGameUI:showDialog({
			content = slot0.unionNoticeText:read(),
			title = gLanguageCsv.notice
		})
	end,
	unionshop = function (slot0)
		uiEasy.goToShop(game.SHOP_INIT.UNION_SHOP)
	end,
	unionqa = function (slot0)
		uv1 = "canEnterBuilding"

		if not slot1.canEnterBuilding("unionqa") then
			return
		end

		if not dataEasy.isUnlock(gUnlockCsv.unionQA) then
			gGameUI:showTip(dataEasy.getUnlockTip(gUnlockCsv.unionQA))

			return
		end

		if dataEasy.serverOpenDaysLess(csv.cross.union_qa.base[1].servOpenDays) then
			gGameUI:showTip(string.format(gLanguageCsv.unlockServerOpen, slot2))

			return
		end

		gGameApp:requestServer("/game/union/qa/main", function (slot0)
			gGameUI:stackUI("city.union.answer.view", nil, {
				full = true
			}, slot0)
		end)
	end,
	crossunionfight = function (slot0)
		if not dataEasy.isInServer("crossunionfight") then
			return
		end

		if not dataEasy.isUnlock(gUnlockCsv.crossunionfight) then
			gGameUI:showTip(dataEasy.getUnlockTip(gUnlockCsv.crossunionfight))

			return
		end

		if dataEasy.serverOpenDaysLess(csv.cross.union_fight.base[1].servOpenDays) then
			gGameUI:showTip(string.format(gLanguageCsv.unlockServerOpen, slot1))

			return
		end

		if dataEasy.notUseUnionBuild() then
			gGameUI:showTip(gLanguageCsv.crossunionfightJionTimeUp)

			return
		end

		if (gUnionFeatureCsv.crossunionfight or 0) <= slot0.unionLv:read() then
			gGameApp:requestServer("/game/cross/union/fight/main", function ()
				uv5 = "gGameUI"

				gGameUI:stackUI("city.union.cross_unionfight.view", nil, , slot5:createHandler("crossUnionAnimaShow"))
			end)
		end
	end,
	crossUnionAdventure = function (slot0)
		if not dataEasy.isInServer("crossUnionAdventure") then
			return
		end

		if not dataEasy.isUnlock(gUnlockCsv.crossUnionAdventure) then
			gGameUI:showTip(dataEasy.getUnlockTip(gUnlockCsv.crossUnionAdventure))

			return
		end

		if dataEasy.serverOpenDaysLess(csv.cross.union_adventure.base[1].servOpenDays) then
			gGameUI:showTip(string.format(gLanguageCsv.unlockServerOpen, slot1))

			return
		end

		jumpEasy.jumpTo("crossUnionAdventure")
	end
}
slot6 = class("UnionView", cc.load("mvc").ViewBase)
slot6.RESOURCE_FILENAME = "union_main.json"
slot6.RESOURCE_BINDING = {
	["scrollBuilding.unionNoName3.textNote"] = "textNote12",
	["scrollBuilding.unionfight.imgTextBG"] = "imgTextBG7",
	["scrollBuilding.crossunionfight.textNote"] = "textNote14",
	["scrollBuilding.unionNotice.textNote"] = "textNote8",
	["scrollBuilding.unionskill.textNote"] = "textNote5",
	["scrollBuilding.fragdonate.imgTextBG"] = "imgTextBG10",
	item = "item",
	["scrollBuilding.dailygift.imgTextBG"] = "imgTextBG3",
	["scrollBuilding.unionShop.imgTextBG"] = "imgTextBG11",
	["scrollBuilding.unionAnswer.imgTextBG"] = "imgTextBG13",
	["scrollBuilding.contribute.imgTextBG"] = "imgTextBG4",
	["scrollBuilding.crossUnionAdventure.imgTextBG"] = "imgTextBG15",
	["scrollBuilding.unionFuli.imgTextBG"] = "imgTextBG9",
	["scrollBuilding.unionfight.textNote"] = "textNote7",
	["scrollBuilding.unionNoName3.imgTextBG"] = "imgTextBG12",
	["scrollBuilding.dailygift.textNote"] = "textNote3",
	["scrollBuilding.training.textNote"] = "textNote2",
	["scrollBuilding.fuben.imgTextBG"] = "imgTextBG6",
	["scrollBuilding.unionskill.imgTextBG"] = "imgTextBG5",
	["scrollBuilding.unionFuli.textNote"] = "textNote9",
	["scrollBuilding.unionNotice.imgTextBG"] = "imgTextBG8",
	["scrollBuilding.unionShop.textNote"] = "textNote11",
	["scrollBuilding.ribbon"] = "ribbon",
	["scrollBuilding.crossunionfight.imgTextBG"] = "imgTextBG14",
	effectPanel = "effectPanel",
	["scrollBuilding.lobby.imgTextBG"] = "imgTextBG1",
	["scrollBuilding.fragdonate.textNote"] = "textNote10",
	["scrollBuilding.contribute.textNote"] = "textNote4",
	["scrollBuilding.lobby.textNote"] = "textNote1",
	["scrollBuilding.unionNoName2"] = "unionNoName2",
	["scrollBuilding.crossUnionAdventure.textNote"] = "textNote15",
	["scrollBuilding.fuben.textNote"] = "textNote6",
	["scrollBuilding.unionAnswer.textNote"] = "textNote13",
	["scrollBuilding.training.imgTextBG"] = "imgTextBG2",
	leftUp = {
		varname = "leftUp",
		binds = {
			event = "visible",
			idler = bindHelper.self("hasEnter")
		}
	},
	redpacket = {
		varname = "redpacket",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.defer(function (slot0)
						slot0:onBuildingClick("redpacket")
					end)
				}
			},
			{
				event = "visible",
				idler = bindHelper.self("isShowRedPack")
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					state = bindHelper.self("isShowRedPack"),
					specialTag = {
						"unionSystemRedPacket",
						"unionMemberRedPacket",
						"unionSendedRedPacket"
					},
					onNode = function (slot0)
						slot0:xy(171, 175)
					end
				}
			}
		}
	},
	["redpacket.textNote"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["leftUp.list"] = {
		varname = "listview",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("quickDatas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				dataOrderCmp = function (slot0, slot1)
					return slot0.csvId < slot1.csvId
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:removeChildByName("content")

					if slot3.cfg.tarhetArg then
						slot4 = string.format("%s(%d/%d)", slot3.cfg.desc, slot3.leftNum, slot3.cfg.tarhetArg)
					end

					slot5 = rich.createWithWidth("#L100#" .. slot4, 40, nil, 400)

					slot5:anchorPoint(0, 0.5)
					slot1:addChild(slot5, 2, "content")
					slot1:height(slot5:height())
					slot5:xy(55, slot5:height() / 2)
					slot1:get("imgIcon"):y(slot5:y())
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3.cfg)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	},
	bgEffect = {
		binds = {
			event = "animation",
			res = "union/tiankongdi.skel",
			action = "effect_loop"
		}
	},
	scrollCloud = {
		varname = "scrollCloud",
		binds = {
			{
				event = "animation",
				res = "union/yun.skel",
				action = "effect_loop"
			},
			{
				event = "scrollBarEnabled",
				data = false
			}
		}
	},
	scrollMont1 = {
		varname = "scrollMont1",
		binds = {
			{
				event = "animation",
				res = "union/shan1.skel",
				action = "effect_loop"
			},
			{
				event = "scrollBarEnabled",
				data = false
			}
		}
	},
	scrollMont2 = {
		varname = "scrollMont2",
		binds = {
			{
				event = "animation",
				res = "union/shan2.skel",
				action = "effect_loop"
			},
			{
				event = "scrollBarEnabled",
				data = false
			}
		}
	},
	scrollMont3 = {
		varname = "scrollMont3",
		binds = {
			{
				event = "animation",
				res = "union/shan3.skel",
				action = "effect_loop"
			},
			{
				event = "scrollBarEnabled",
				data = false
			}
		}
	},
	scroll = {
		varname = "scroll",
		binds = {
			{
				event = "animation",
				res = "union/dimian.skel",
				action = "effect_loop"
			},
			{
				event = "scrollBarEnabled",
				data = false
			}
		}
	},
	scrollBuilding = {
		varname = "scrollBuilding",
		binds = {
			{
				event = "animation",
				res = "union/dimian2.skel",
				action = "effect_loop"
			},
			{
				event = "scrollBarEnabled",
				data = false
			}
		}
	},
	scrollPlant = {
		varname = "scrollPlant",
		binds = {
			{
				event = "animation",
				res = "union/zhibei.skel",
				action = "effect_loop",
				name = "effect"
			},
			{
				event = "scrollBarEnabled",
				data = false
			}
		}
	},
	["scrollBuilding.contribute"] = {
		varname = "contribute",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.defer(function (slot0)
						slot0:onBuildingClick("contribute")
					end)
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "unionContribute",
					state = bindHelper.self("state"),
					onNode = function (slot0)
						slot0:xy(171, 375)
					end
				}
			},
			{
				res = "union/yanjiusuo.skel",
				name = "effect",
				action = "effect_loop",
				event = "animation",
				pos = {
					x = 320,
					y = 190
				}
			}
		}
	},
	["scrollBuilding.fragdonate"] = {
		varname = "fragdonate",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.defer(function (slot0)
						slot0:onBuildingClick("fragdonate")
					end)
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "unionFragDonate",
					state = bindHelper.self("state"),
					onNode = function (slot0)
						slot0:xy(46, 488)
					end
				}
			},
			{
				res = "union/beiyong3.skel",
				name = "effect",
				action = "effect_loop",
				event = "animation",
				pos = {
					x = 45,
					y = 170
				}
			}
		}
	},
	["scrollBuilding.lobby"] = {
		varname = "lobby",
		binds = {
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "unionLobby",
					state = bindHelper.self("state"),
					onNode = function (slot0)
						slot0:xy(175, 545)
					end
				}
			},
			{
				event = "touch",
				methods = {
					ended = bindHelper.defer(function (slot0)
						slot0:onBuildingClick("lobby")
					end)
				}
			},
			{
				res = "union/gonghuidating.skel",
				name = "effect",
				action = "effect_loop",
				event = "animation",
				pos = {
					x = 390,
					y = 395
				}
			}
		}
	},
	["scrollBuilding.lobby.crossUnionAnima"] = {
		varname = "crossUnionAnima",
		binds = {
			scale = 2,
			res = "cross_union/jzgd.skel",
			action = "stanby_loop",
			event = "animation",
			zOrder = 10,
			pos = {
				x = 220,
				y = -160
			}
		}
	},
	["scrollBuilding.training"] = {
		varname = "training",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.defer(function (slot0)
						slot0:onBuildingClick("training")
					end)
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					state = bindHelper.self("trainingRedHint"),
					onNode = function (slot0)
						slot0:xy(334, 750)
					end
				}
			},
			{
				res = "union/xunlianzhongxin.skel",
				name = "effect",
				action = "effect_loop",
				event = "animation",
				pos = {
					x = 200,
					y = 705
				}
			}
		}
	},
	["scrollBuilding.unionskill"] = {
		varname = "unionskill",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.defer(function (slot0)
						slot0:onBuildingClick("unionskill")
					end)
				}
			},
			{
				res = "union/xiulianzhongxin.skel",
				name = "effect",
				action = "effect_loop",
				event = "animation",
				pos = {
					x = 221,
					y = 225
				}
			}
		}
	},
	["scrollBuilding.fuben"] = {
		varname = "fuben",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.defer(function (slot0)
						slot0:onBuildingClick("fuben")
					end)
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "unionFuben",
					state = bindHelper.self("state"),
					onNode = function (slot0)
						slot0:xy(339, 390)
					end
				}
			},
			{
				res = "union/gonghuifuben.skel",
				name = "effect",
				action = "effect_loop",
				event = "animation",
				pos = {
					x = 275,
					y = 165
				}
			}
		}
	},
	["scrollBuilding.dailygift"] = {
		varname = "dailygift",
		binds = {
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "unionDailyGift",
					state = bindHelper.self("state"),
					onNode = function (slot0)
						slot0:xy(423, 365)
					end
				}
			},
			{
				event = "touch",
				methods = {
					ended = bindHelper.defer(function (slot0)
						slot0:onBuildingClick("dailygift")
					end)
				}
			}
		}
	},
	["scrollBuilding.unionfight"] = {
		varname = "unionFight",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.defer(function (slot0)
						slot0:onBuildingClick("unionFight")
					end)
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = {
						"unionFightSignUp"
					},
					onNode = function (slot0)
						slot0:xy(52, 390)
					end
				}
			},
			{
				res = "union/gonghuizhan.skel",
				name = "effect",
				action = "effect_loop",
				event = "animation",
				pos = {
					x = 450,
					y = 258
				}
			}
		}
	},
	["scrollBuilding.unionNotice"] = {
		varname = "unionNotice",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.defer(function (slot0)
						slot0:onBuildingClick("unionnotice")
					end)
				}
			},
			{
				res = "union/gonggaoban.skel",
				name = "effect",
				action = "effect_loop",
				event = "animation",
				pos = {
					x = 160,
					y = 125
				}
			}
		}
	},
	["scrollBuilding.unionAnswer"] = {
		varname = "unionqa",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.defer(function (slot0)
						slot0:onBuildingClick("unionqa")
					end)
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = {
						"unionAnswer"
					},
					onNode = function (slot0)
						slot0:xy(345, 320)
					end
				}
			},
			{
				res = "union/renwu2.skel",
				name = "effect",
				action = "effect_loop",
				event = "animation",
				zOrder = 10,
				pos = {
					x = 150,
					y = 100
				}
			}
		}
	},
	["scrollBuilding.unionNotice.textNotice"] = {
		varname = "textNotice",
		binds = {
			event = "text",
			idler = bindHelper.self("unionNoticeText")
		}
	},
	["scrollBuilding.unionNoName3"] = {
		varname = "unionNoName3",
		binds = {
			res = "union/beiyong1.skel",
			name = "effect",
			action = "effect_loop",
			event = "animation",
			pos = {
				x = 355,
				y = 315
			}
		}
	},
	["scrollBuilding.unionShop"] = {
		varname = "unionShop",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.defer(function (slot0)
						slot0:onBuildingClick("unionshop")
					end)
				}
			},
			{
				res = "union/shangdian.skel",
				name = "effect",
				action = "effect_loop",
				event = "animation",
				pos = {
					x = 325,
					y = 165
				}
			}
		}
	},
	["scrollBuilding.unionFuli"] = {
		varname = "unionFuli",
		binds = {
			res = "union/shuiche.skel",
			name = "effect",
			action = "effect_loop",
			event = "animation",
			pos = {
				x = 215,
				y = 260
			}
		}
	},
	["scrollBuilding.icon"] = {
		varname = "icon",
		binds = {
			res = "union/beiyong2.skel",
			name = "effect",
			action = "effect_loop",
			event = "animation",
			pos = {
				x = 85,
				y = 90
			}
		}
	},
	["scrollBuilding.renwu1"] = {
		varname = "renwu1",
		binds = {
			res = "union/renwu1.skel",
			name = "effect",
			action = "effect_loop",
			event = "animation",
			zOrder = 10,
			pos = {
				x = 300,
				y = 200
			}
		}
	},
	["scrollBuilding.renwu3"] = {
		varname = "renwu3",
		binds = {
			res = "union/renwu3.skel",
			name = "effect",
			action = "effect_loop",
			event = "animation",
			zOrder = 10,
			pos = {
				x = 50,
				y = 85
			}
		}
	},
	["scrollBuilding.renwu4"] = {
		varname = "renwu4",
		binds = {
			res = "union/renwu4.skel",
			name = "effect",
			action = "effect_loop",
			event = "animation",
			zOrder = 10,
			pos = {
				x = 175,
				y = 100
			}
		}
	},
	["scrollBuilding.crossunionfight"] = {
		varname = "crossunionfight",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.defer(function (slot0)
						slot0:onBuildingClick("crossunionfight")
					end)
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = {
						"crossUnionFight",
						"crossUnionFightBetOutSide"
					},
					onNode = function (slot0)
						slot0:xy(-70, 425)
					end
				}
			},
			{
				res = "cross_union/byxj.skel",
				name = "effect",
				action = "stanby_loop",
				zOrder = 10,
				event = "animation",
				scale = 1.2,
				pos = {
					x = 195,
					y = 100
				}
			}
		}
	},
	["scrollBuilding.crossUnionAdventure"] = {
		varname = "crossUnionAdventure",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.defer(function (slot0)
						slot0:onBuildingClick("crossUnionAdventure")
					end)
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = {
						"crossUnionAdventure"
					},
					onNode = function (slot0)
						slot0:xy(90, 435)
					end
				}
			},
			{
				res = "cross_union_adventure/changertu_saichenvlang.skel",
				name = "effect",
				action = "effect_loop",
				zOrder = 0,
				event = "animation",
				scale = 1.2,
				pos = {
					x = 195,
					y = 60
				}
			}
		}
	}
}
slot7 = {
	unionFight = function (slot0, slot1, slot2, slot3, slot4)
		slot5, slot6 = dataEasy.judgeServerOpen("unionFight")
		slot2 = slot2 or not slot5 or not slot3

		if not dataEasy.isInServer(slot1) then
			slot2 = true
		end

		return slot2
	end,
	unionqa = function (slot0, slot1, slot2, slot3, slot4)
		if not gUnlockCsv.unionQA then
			slot4:setTouchEnabled(false)
			slot4:get("textNote"):visible(false)
			slot4:get("imgTextBG"):visible(false)
			slot4:get("imgTextBGMask"):visible(false)

			return
		end

		if not dataEasy.isUnlock(gUnlockCsv.unionQA) or dataEasy.serverOpenDaysLess(csv.cross.union_qa.base[1].servOpenDays) then
			slot2 = true
		end

		return slot2
	end,
	dailygift = function (slot0, slot1, slot2, slot3, slot4)
		slot0.dailygift:get("effect"):play((slot0.dailyGiftTimes:read() >= 1 or slot2 or not not dataEasy.notUseUnionBuild()) and "standby_loop" or "kelingqu_loop")

		return slot2
	end,
	crossunionfight = function (slot0, slot1, slot2, slot3, slot4)
		slot5, slot6 = dataEasy.judgeServerOpen("crossunionfight")
		slot2 = slot2 or not slot5 or not slot3

		if not dataEasy.isInServer(slot1) then
			slot2 = true
		end

		return slot2
	end
}
slot8 = {
	unionFight = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
		slot7, slot8 = dataEasy.judgeServerOpen("unionFight")

		if slot5 or not slot7 or not slot6 then
			if not dataEasy.isInServer(slot4) then
				slot3 = gLanguageCsv.pleaseWait
			elseif slot1 == 0 or slot2 < slot1 then
				slot3 = string.format(gLanguageCsv.unionUnlockLevel, slot1)
			elseif not slot7 then
				slot3 = string.format(gLanguageCsv.unlockServerOpen, slot8)
			elseif not slot6 then
				slot3 = dataEasy.getUnlockTip(gUnlockCsv.unionFight)
			end
		elseif gGameModel.role:read("union_fight_round") == "battle" then
			slot9 = slot0.unionFight:size()
			slot11 = widget.addAnimationByKey(slot0.unionFight, "union_fight/gonghuizhan.skel", "main_ani", "effect_loop", 8):xy(slot9.width / 2 + 40, slot9.height / 2 + 80)
		end

		return slot3
	end,
	unionqa = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
		if slot1 ~= 0 and slot2 >= slot1 then
			if dataEasy.serverOpenDaysLess(csv.cross.union_qa.base[1].servOpenDays) then
				slot3 = string.format(gLanguageCsv.unlockServerOpen, slot7)
			end

			if not dataEasy.isUnlock(gUnlockCsv.unionQA) then
				slot3 = dataEasy.getUnlockTip(gUnlockCsv.unionQA)
			end
		end

		return slot3
	end,
	crossunionfight = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
		slot7, slot8 = dataEasy.judgeServerOpen("crossunionfight")

		if slot5 or not slot7 or not slot6 then
			if not dataEasy.isInServer(slot4) then
				slot3 = gLanguageCsv.pleaseWait
			elseif slot1 == 0 or slot2 < slot1 then
				slot3 = string.format(gLanguageCsv.unionUnlockLevel, slot1)
			elseif not slot7 then
				slot3 = string.format(gLanguageCsv.unlockServerOpen, slot8)
			elseif not slot6 then
				slot3 = dataEasy.getUnlockTip(gUnlockCsv.unionFight)
			end
		end

		return slot3
	end,
	crossUnionAdventure = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
		if slot5 or not slot6 then
			if not dataEasy.isInServer(slot4) then
				slot3 = gLanguageCsv.pleaseWait
			elseif slot1 == 0 or slot2 < slot1 then
				slot3 = string.format(gLanguageCsv.unionUnlockLevel, slot1)
			elseif not slot6 then
				slot3 = dataEasy.getUnlockTip(gUnlockCsv.crossUnionAdventure)
			end
		end

		return slot3
	end
}

function slot6.initCrossUnionAdventrue(slot0)
	slot0.crossUnionAdventure:hide()

	if not dataEasy.isInServer("crossUnionAdventure") then
		return
	end

	if not dataEasy.isUnlock(gUnlockCsv.crossUnionAdventure) then
		return
	end

	if dataEasy.serverOpenDaysLess(csv.cross.union_adventure.base[1].servOpenDays) then
		return
	end

	if slot0.unionLv:read() < (gUnionFeatureCsv.crossUnionAdventure or 0) then
		return
	end

	if not dataEasy.getCrossServiceData("unionadventure", nil, -3628800) then
		return false
	end

	if not itertools.include(csv.cross.union_adventure.base[1].openWeekday, time.getNowDate().wday == 1 and 7 or slot7 - 1) then
		return false
	end

	slot0.crossUnionAdventure:show()

	return true
end

function slot6.onCreate(slot0, slot1, slot2)
	slot0.crossUnionData = slot2

	slot0:initModel()
	slot0.crossunionfight:visible(dataEasy.isShow("crossunionfight"))
	slot0:initCrossUnionAdventrue()
	slot0.scrollBuilding:size(display.sizeInViewRect):x(display.sizeInViewRect.x):jumpToPercentHorizontal(50)
	slot0.scrollPlant:size(display.sizeInViewRect):x(display.sizeInViewRect.x)
	slot0.scroll:size(display.sizeInViewRect):x(display.sizeInViewRect.x)
	slot0.scrollCloud:size(display.sizeInViewRect):x(display.sizeInViewRect.x)
	slot0.scrollMont1:size(display.sizeInViewRect):x(display.sizeInViewRect.x)
	slot0.scrollMont2:size(display.sizeInViewRect):x(display.sizeInViewRect.x)
	slot0.scrollMont3:size(display.sizeInViewRect):x(display.sizeInViewRect.x)
	function (slot0)
		uv1 = "scrollPlant"
		slot1 = slot1.scrollPlant
		slot1 = slot1.jumpToPercentHorizontal

		slot1(slot1, slot0)

		uv1 = "scrollPlant"
		slot1 = slot1.scroll
		slot1 = slot1.jumpToPercentHorizontal

		slot1(slot1, slot0)

		uv1 = "scrollPlant"
		slot1 = slot1.scrollMont1
		slot1 = slot1.jumpToPercentHorizontal

		slot1(slot1, slot0 * 0.78)

		uv1 = "scrollPlant"
		slot1 = slot1.scrollMont2
		slot1 = slot1.jumpToPercentHorizontal

		slot1(slot1, slot0 * 0.55)

		uv1 = "scrollPlant"
		slot1 = slot1.scrollMont3
		slot1 = slot1.jumpToPercentHorizontal

		slot1(slot1, slot0 * 0.45)

		uv1 = "scrollPlant"

		slot1.scrollCloud:jumpToPercentHorizontal(slot0 * 0.38)
	end(50)
	slot0.scrollBuilding:onEvent(function (slot0)
		if slot0.name == "CONTAINER_MOVED" then
			uv1 = "name"
			slot1 = slot1.scrollBuilding
			slot2 = slot1
			uv2 = "CONTAINER_MOVED"

			slot2(slot1.getScrolledPercentHorizontal(slot2))
		end
	end)
	widget.addAnimationByKey(slot0.dailygift, "union/gonghuimeiri.skel", "effect", (slot0.dailyGiftTimes:read() >= 1 or (not gUnionFeatureCsv.dailygift or slot0.unionLv:read() < gUnionFeatureCsv.dailygift) or not not dataEasy.notUseUnionBuild()) and "standby_loop" or "kelingqu_loop", 1):xy(225, 40)

	slot0.isShowRedPack = dataEasy.getListenUnlock(gUnlockCsv.unionRedpacket)
	slot0.tarinRedHintState = false
	slot0.trainingRedHint = idler.new(false)

	gGameUI.topuiManager:createView("union", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "CONSORTIA",
		title = gLanguageCsv.guild
	})
	idlereasy.when(slot0.unionLv, function (slot0, slot1)
		uv3 = "pairs"

		for slot5, slot6 in pairs(slot3) do
			slot7 = gUnionFeatureCsv[slot6] or 0
			uv10 = "gUnionFeatureCsv"
			slot10 = slot10[slot6]
			uv11 = "get"

			if slot11[slot6] then
				uv11 = "get"
				uv12 = "gUnionFeatureCsv"
				slot8 = slot11[slot6](slot12, slot6, slot7 == 0 or slot1 < slot7, true, slot10)
			end

			if slot10:get("lock") then
				cache.setShader(slot10:get("effect"), false, slot8 and "gray" or "normal")
				slot11:visible(slot8)
				slot10:get("imgTextBGMask"):visible(slot8)

				if matchLanguage({
					"en"
				}) then
					slot10:get("imgTextBGMask"):height(320)
				end

				slot13 = gLanguageCsv.unionUnlockLevel
				uv13 = "lock"

				if slot13[slot6] then
					uv13 = "lock"
					uv14 = "gUnionFeatureCsv"
					slot12 = slot13[slot6](slot14, slot7, slot1, string.format(slot13, slot7), slot6, slot8, slot9)
				end

				slot11:get("textNote"):text(slot12)
				slot11:get("imgBg"):width(slot11:get("textNote"):width() + 30)
			end

			if slot10:get("effect") then
				slot13:setTimeScale(slot8 and 0 or 1)
			end
		end

		uv2 = "gUnionFeatureCsv"

		slot2:setTrainingRedHint()
	end)

	slot0.quickDatas = idlertable.new({})

	idlereasy.any({
		slot0.unionLv,
		slot0.contribCount,
		slot0.unionAllTasks,
		slot0.unionTasks,
		slot0.dailyGiftTimes,
		slot0.trainingSpeedup,
		slot0.memberRedPacket,
		slot0.systemRedPacket,
		slot0.unionFbTimes,
		slot0.unionFragDonateStartTimes
	}, function (slot0, ...)
		slot1 = {}
		slot2 = 0

		for slot6, slot7 in orderCsvPairs(csv.union.daily_notice) do
			uv8 = "orderCsvPairs"

			if slot8[slot7.targetType] then
				uv10 = "csv"
				slot9, slot10 = slot8(slot10, slot7)

				if slot9 then
					table.insert(slot1, {
						cfg = slot7,
						leftNum = slot10,
						csvId = slot6
					})

					if slot2 + 1 == 3 then
						break
					end
				end
			end
		end

		uv3 = "csv"
		slot3 = slot3.quickDatas
		slot3 = slot3.set

		slot3(slot3, slot1)

		uv3 = "csv"
		slot3 = slot3.item
		slot4 = slot3
		uv4 = "csv"
		slot6 = slot4.listview:getItemsMargin() * (slot2 - 1)
		slot5 = slot2 * slot3.size(slot4).height + slot6
		uv6 = "csv"
		slot6 = slot6.leftUp:get("imgBg")
		slot7 = slot6
		uv7 = "csv"
		slot7 = slot7.leftUp:get("imgBg")
		slot7 = slot7.size

		slot7(slot7, slot6.size(slot7).width, slot5 + 37 + 39)

		uv7 = "csv"
		slot7 = slot7.listview:size()
		uv7 = "csv"
		slot7 = slot7.listview
		slot7 = slot7.size
		slot9 = slot7.width

		slot7(slot7, slot9, slot5)

		uv7 = "csv"
		slot6 = slot7.leftUp:size()
		slot8 = slot6.height / 2 + (slot6.height - (slot5 + 37 + 39)) / 2
		uv9 = "csv"
		slot9 = slot9.leftUp:get("imgBg")
		slot9 = slot9.y

		slot9(slot9, slot8)

		uv9 = "csv"

		slot9.listview:y(slot8 - (slot5 + 37 + 39) / 2 + 37)
	end)

	slot0.hasEnter = idler.new(false)

	idlereasy.when(slot0.quickDatas, function (slot0, slot1)
		uv2 = "hasEnter"

		slot2.hasEnter:set(#slot1 > 0)
	end)
	idlereasy.any({
		slot0.unionLv,
		slot0.memberRedPacket,
		slot0.systemRedPacket,
		slot0.redPacketRobCount,
		slot0.unionRedpackets,
		slot0.sendedRedPacket
	}, function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
		slot7 = gUnionFeatureCsv.redpacket or 0
		slot9 = true
		uv12 = "gUnionFeatureCsv"
		uv13 = "redpacket"

		slot12(slot13.redpacket, (not dataEasy.notUseUnionBuild() and not (slot7 == 0 or slot1 < slot7) or false) and (slot3 and dataEasy.canSystemRedPacket() or slot2 and slot4 < gCommonConfigCsv.unionRobRedpacketDailyLimit or not slot6 and itertools.size(slot5) > 0) and "effect_loop" or "effect1_loop")
	end)

	if matchLanguage({
		"en"
	}) then
		for slot11 = 1, math.huge do
			if not slot0["textNote" .. slot11] then
				break
			end

			slot0["imgTextBG" .. slot11]:height(320)
			adapt.setAutoText(slot0["textNote" .. slot11], nil, 300)
			slot0["textNote" .. slot11]:y(slot0["imgTextBG" .. slot11]:y() - 165)
		end
	else
		for slot11 = 1, math.huge do
			if not slot0["textNote" .. slot11] then
				break
			end

			adapt.setAutoText(slot0["textNote" .. slot11], nil, 244)
		end
	end

	slot0:crossUnionAnimaShow()
end

function slot6.crossUnionAnimaShow(slot0)
	if gGameModel.role:read("cross_union_fight_status") == nil then
		slot0.crossUnionAnima:hide()
	elseif slot1 == "closed" then
		slot0.crossUnionAnima:hide()

		if slot0.crossUnionData and slot0.crossUnionData.union_db_id then
			uv2 = "gGameModel"

			if slot2.whetherCloseShowUI() and not slot0.ribbon:get("panel"):get("rich") then
				slot0.ribbon:show()
				slot0.ribbon:get("imgIcon"):show()
				slot0.ribbon:get("panel"):show()
				slot0.ribbon:get("panel.name"):hide()

				slot4 = rich.createWithWidth(string.format(gLanguageCsv.getFirstPlace, string.format(gLanguageCsv.brackets, getServerArea(slot0.crossUnionData.server_key, nil)), slot0.crossUnionData.union_name), 32, nil, 240):addTo(slot0.ribbon:get("panel"), 10, "rich"):anchorPoint(cc.p(0.5, 1)):xy(130, 66):formatText()

				slot4:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.MoveTo:create(gCommonConfigCsv.crossUnionFight, cc.p(120, slot4:height() / 36 * 67)), cc.CallFunc:create(function ()
					uv0 = "xy"

					slot0:xy(120, 20)
				end))))
			end
		end
	else
		slot0.crossUnionAnima:show()
	end
end

function slot6.initModel(slot0)
	slot0.roleLv = gGameModel.role:getIdler("level")
	slot0.id = gGameModel.role:getIdler("id")
	slot1 = gGameModel.union
	slot0.unionLv = slot1:getIdler("level")
	slot0.unionNoticeText = slot1:getIdler("intro")
	slot2 = gGameModel.daily_record
	slot0.dailyGiftTimes = slot2:getIdler("union_daily_gift_times")
	slot0.memberRedPacket = gGameModel.role:getIdler("union_role_packet_can_rob")
	slot0.systemRedPacket = gGameModel.role:getIdler("union_sys_packet_can_rob")
	slot0.contribCount = slot2:getIdler("union_contrib_times")
	slot0.unionAllTasks = gGameModel.role:getIdler("union_contrib_tasks")
	slot0.unionTasks = slot1:getIdler("contrib_tasks")
	slot0.members = slot1:getIdler("members")
	slot0.trainingSpeedup = slot2:getIdler("union_training_speedup")
	slot0.unionFbTimes = slot2:getIdler("union_fb_times")
	slot0.redPacketRobCount = slot2:getIdler("redPacket_rob_count")
	slot0.unionRedpackets = gGameModel.role:getIdler("union_redpackets")
	slot0.sendedRedPacket = gGameModel.currday_dispatch:getIdler("sendedRedPacket")
	slot0.unionFragDonateStartTimes = slot2:getIdler("union_frag_donate_start_times")
end

function slot6.setTrainingRedHint(slot0)
	uv1 = "canEnterBuilding"

	if not slot0.tarinRedHintState and slot1.canEnterBuilding("training", nil, true) and gGameModel.union_training then
		slot0.tarinRedHintState = true

		performWithDelay(slot0, function ()
			gGameApp:requestServer("/game/union/training/list", function (slot0)
				uv2 = "id"

				for slot6, slot7 in ipairs(slot0.view) do
					if slot2.id:read() ~= slot7[1] and slot7[2] > 0 then
						slot1 = 0 + 1
					end
				end

				uv3 = "id"
				uv4 = "read"
				slot4 = slot4:getIdler("opened")
				slot3.opened = slot4
				uv3 = "id"
				uv4 = "read"
				slot3.slots = slot4:getIdler("slots")
				uv3 = "id"
				slot4 = gGameModel.daily_record
				slot5 = slot4
				slot3.trainSpeedUp = slot4.getIdler(slot5, "union_training_speedup")
				uv5 = "id"
				slot5 = slot5.opened
				uv5 = "id"
				slot5 = slot5.slots
				uv5 = "id"
				slot5 = slot5.trainSpeedUp
				uv5 = "id"

				function slot5(slot0, slot1, slot2, slot3, slot4)
					slot5 = false

					if slot3 < 6 then
						uv6 = "csvPairs"

						if slot6 > 0 then
							slot5 = true
						end
					end

					for slot9, slot10 in csvPairs(csv.union.training) do
						if slot1[slot9] and not slot2[slot9] then
							slot5 = true

							break
						end

						if slot2[slot9] and slot4 <= slot2[slot9].level then
							slot5 = true

							break
						end
					end

					uv6 = "csv"

					slot6.trainingRedHint:set(slot5)
				end

				uv5 = "id"

				idlereasy.any({
					slot5,
					slot5,
					slot5,
					slot5.roleLv
				}, slot5):anonyOnly(slot5, "setTrainingRedHint")
			end)
		end, 0)
	end
end

function slot6.onBuildingClick()
	error("Decompilation failed")
	-- Exception in function building!
	-- Traceback (most recent call last):
	-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
	--     return _build_function_definition(prototype, state.header)
	--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
	--     node.statements.contents = _build_function_blocks(state, instructions)
	--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
	--     statement, line_marked_elements = _build_statement(state, addr, instruction)
	--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
	--     return _build_var_assignment(state, addr, instruction)
	--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
	--     assn = func(*args, **kwargs)
	--            ^^^^^^^^^^^^^^^^^^^^^
	-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
	--     expression = _build_const_expression(state, addr, instruction)
	--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
	--     return _build_string_constant(state, instruction.CD)
	--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
	--     node.value = state.constants.complex_constants[index]
	--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
	-- IndexError: list index out of range
end

function slot6.onItemClick(slot0, slot1, slot2, slot3)
	if not slot3.goto then
		return
	end

	slot0:onBuildingClick(slot3.goto)
end

return slot6
