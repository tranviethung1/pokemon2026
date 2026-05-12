slot0 = {
	SIGNUP = 3,
	UNION = 5,
	ADVENTURE = 4,
	REWARD = 1,
	DRAWCARD = 2
}
slot1 = {
	{
		specialTag = "dailyAssistantReward"
	},
	{
		specialTag = "dailyAssistantDrawCard"
	},
	{
		specialTag = "dailyAssistantSignup"
	},
	{
		specialTag = "dailyAssistantAdventure"
	},
	{
		specialTag = "dailyAssistantUnion"
	}
}
slot2 = {
	gem = gLanguageCsv.dailyAssistantGemSelectedTxt,
	catch = gLanguageCsv.dailyAssistantJumpCatch,
	endlessTower = gLanguageCsv.dailyAssistantEndlessTip
}
slot3 = {
	gLanguageCsv.reward,
	gLanguageCsv.drawCard,
	gLanguageCsv.battleSignUp,
	gLanguageCsv.quickAdventure,
	gLanguageCsv.unionMatters
}
slot4 = {
	hadSignUp = 2,
	canSignUp = 1,
	cantSignUp = 3
}
slot5 = {
	gLanguageCsv.getAwardAll,
	gLanguageCsv.oneClickCardDraw,
	gLanguageCsv.oneClickRegistration,
	gLanguageCsv.oneClickDoing,
	gLanguageCsv.oneClickCompletion
}
slot6 = gCommonConfigCsv.chipUpLimit

function slot7(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0) do
		if type(slot7) == "table" then
			uv8 = "pairs"

			slot8(slot7, slot1, slot2)
		elseif slot2 == nil or slot6 == slot2 then
			slot1[slot6] = (slot1[slot6] or 0) + slot7
		end
	end
end

function slot8(slot0, slot1, slot2, slot3, slot4)
	slot1:show()

	slot5 = slot1:multiget("gate", "txt1", "txt", "btnReward", "errTxt")

	slot5.btnReward:hide()
	slot5.txt:hide()
	slot5.txt1:hide()
	slot5.errTxt:hide()
	slot5.gate:hide()

	if slot4.hasReward then
		slot5.btnReward:show()
		text.addEffect(slot5.btnReward:get("text"), {
			outline = {
				color = ui.COLORS.NORMAL.WHITE
			}
		})
	end

	if slot4.errTxt then
		slot5.errTxt:show()
		slot5.errTxt:text(slot4.errTxt)
		adapt.oneLinePos(slot2, slot5.errTxt, cc.p(30, 0))
	else
		if slot4.txt or slot4.txt1 then
			if slot4.txt == nil then
				slot4.txt = ""
			end

			if slot4.txt1 == nil then
				slot4.txt1 = ""
			end

			slot5.txt:show()
			slot5.txt1:show()

			slot6 = slot5.txt
			slot7 = slot5.txt1

			slot6:text(slot4.txt)
			slot7:text(slot4.txt1)
			adapt.oneLinePos(slot6, slot7, cc.p(10, 0))

			if slot0.isAllGateClear() then
				slot6:text(gLanguageCsv.unionGateClearTips)
				slot7:hide()
			end

			adapt.setTextScaleWithWidth(slot6, nil, 280)

			if slot4.leftTimes and slot4.leftTimes == 0 then
				text.addEffect(slot7, {
					color = cc.c3b(251, 96, 35)
				})
			end
		end

		slot5.gate:show()

		slot6 = slot5.gate:multiget("icon", "imgSelect", "textOrder", "textHp")

		slot6.icon:texture(slot4.data.icon)
		slot6.imgSelect:visible(slot4.data.selectEffect == true)
		slot6.textOrder:text(slot4.data.csvId)
		slot6.textHp:text(string.format("%s:%s%%", gLanguageCsv.leftHP, slot4.data.maxHp == 0 and 100 or mathEasy.getPreciseDecimal(slot4.data.surplusHp / slot4.data.maxHp * 100, 2)))
		text.addEffect(slot6.textHp, {
			outline = {
				color = ui.COLORS.NORMAL.DEFAULT
			}
		})
	end
end

function slot9(slot0, slot1, slot2, slot3, slot4)
	slot1:show()

	slot5 = slot1:multiget("redpackPanel", "txt", "finshImg")

	slot5.redpackPanel:show()
	slot5.txt:hide()
	slot5.finshImg:hide()

	if slot4.finish then
		slot5.finshImg:show()
	end

	if slot4.txt then
		slot5.redpackPanel:hide()
		slot5.finshImg:hide()
		slot5.txt:show()
		slot5.txt:text(slot4.txt)

		if slot2:width() + slot5.txt:width() / 2 > slot5.txt:x() - slot2:x() then
			adapt.oneLinePos(slot2, slot5.txt, cc.p(20, 0))
		end
	end
end

function slot10(slot0, slot1, slot2, slot3, slot4)
	slot1:show()

	slot6 = slot1:multiget("txtPanel", "panelSelectSuit", "finshImg", "txt").panelSelectSuit:get("suitPanel")

	if slot4.txt or slot4.txt1 then
		slot5.txtPanel:show()

		slot7 = slot5.txtPanel:get("txt")
		slot8 = slot5.txtPanel:get("txt1")

		slot7:text(slot4.txt or "")
		slot8:text(slot4.txt1 or "")
		adapt.oneLineCenterPos(cc.p(slot5.txtPanel:width() / 2, slot5.txtPanel:height() / 2), {
			slot7,
			slot8
		}, cc.p(20, 0))

		if slot4.leftTimes and slot4.leftTimes == 0 then
			text.addEffect(slot8, {
				color = cc.c3b(251, 96, 35)
			})
		end
	end

	slot5.txt:visible(table.length(slot4.chip) == 0)
	slot5.panelSelectSuit:visible(table.length(slot4.chip) > 0)

	if table.length(slot4.chip) > 0 then
		uv8 = "show"

		for slot10 = 1, slot8 do
			slot13 = slot4.chip[slot10] ~= nil

			(slot6:get("item0" .. slot10) or slot2:clone():show():xy(90 * (slot10 - 1), 0):addTo(slot6, 1, "item0" .. slot10)):get("imgIcon"):visible(slot13)

			if slot13 then
				slot14, slot15 = next(gChipSuitCsv[slot4.chip[slot10]][6])

				slot12:texture(string.gsub(slot15.suitIcon, "0.png", "2.png"))
			end
		end
	end

	slot5.finshImg:visible(slot4.finish)
end

function slot11(slot0, slot1, slot2, slot3, slot4)
	slot1:show()

	slot5 = slot1:multiget("selectPanel", "txtPanel", "stateText", "stateImg", "btn", "list", "finshImg", "gemSelectPanel")

	slot5.selectPanel:hide()
	slot5.txtPanel:hide()
	slot5.stateText:hide()
	slot5.stateImg:hide()
	slot5.finshImg:hide()
	slot5.btn:hide()
	slot5.list:hide()
	slot5.gemSelectPanel:hide()

	if slot4.btnName then
		slot5.btn:show()
		slot5.btn:get("txtNode"):text(slot4.btnName)
	end

	if slot4.reward then
		slot5.list:show()
		uiEasy.createItemsToList(slot0, slot5.list, slot4.reward, {
			scale = 0.9
		})
	end

	if slot4.txt or slot4.txt1 then
		slot5.txtPanel:show()
		slot5.txtPanel:get("txt"):text(slot4.txt or "")
		slot5.txtPanel:get("txt1"):text(slot4.txt1 or "")

		slot8 = slot5.txtPanel:height() / 2

		if slot4.selected and slot4.selectedType == "center" then
			slot8 = slot5.txtPanel:height() / 2 + 41
		end

		adapt.oneLineCenterPos(cc.p(slot5.txtPanel:width() / 2, slot8), {
			slot6,
			slot7
		}, cc.p(20, 0))

		if slot4.leftTimes and slot4.leftTimes == 0 then
			text.addEffect(slot7, {
				color = cc.c3b(251, 96, 35)
			})
		end

		if slot4.feature == "craft" or slot4.feature == "crossCraft" or slot4.feature == "unionFight" then
			slot6:text(string.format(slot4.txt, dataEasy.getTimeStrByKey(slot4.feature, "signUpStart"), dataEasy.getTimeStrByKey(slot4.feature, "signUpEnd")))

			if slot4.feature == "unionFight" then
				slot6:text(string.format(slot4.txt, dataEasy.getTimeStrByKey("unionFight", "signUpEnd"), dataEasy.getTimeStrByKey("unionFight", "matchStart")))
			end
		end
	end

	if slot4.rich then
		slot5.txtPanel:show()

		slot6 = slot5.txtPanel:get("txt")

		slot6:text("")
		slot5.txtPanel:get("txt1"):text("")
		slot6:removeAllChildren()

		slot8 = rich.createByStr(slot4.rich, 40)

		if matchLanguage({
			"kr"
		}) then
			slot8 = rich.createByStr(slot4.rich, 38)
		end

		slot8:addTo(slot6)
		slot8:anchorPoint(0.5, 0.5)
		slot8:xy(0, 0)

		if matchLanguage({
			"en"
		}) then
			slot8 = rich.createByStr(slot4.rich, 38, 200)

			slot8:formatText()
			slot6:x(slot2:x() + slot8:getContentSize().width / 2 - 150 + slot2:width() - 300)
		end
	end

	if slot4.state then
		uv7 = "show"

		if slot4.state == slot7.canSignUp then
			slot5.stateText:show()
			slot5.stateText:text(gLanguageCsv.canSignup)
			text.addEffect(slot5.stateText, {
				color = cc.c3b(96, 196, 86)
			})
		else
			uv7 = "show"

			if slot4.state == slot7.hadSignUp then
				slot5.stateImg:show()
			else
				uv7 = "show"

				if slot4.state == slot7.cantSignUp then
					slot5.stateText:show()
					slot5.stateText:text(gLanguageCsv.cantSignup)
					text.addEffect(slot5.stateText, {
						color = cc.c3b(127, 127, 127)
					})
				end
			end
		end
	end

	if slot4.selected then
		slot5.selectPanel:show()
		slot5.selectPanel:get("sPanel"):get("select"):visible(slot4.selected == 1)

		slot7 = slot5.selectPanel:get("txt")
		uv10 = "multiget"

		slot7:text(slot10[slot4.feature])

		if slot5.btn:width() < slot7:width() then
			adapt.oneLinePos(slot7, slot6, cc.p(5, 0), "right")
		else
			adapt.oneLineCenterPos(cc.p(slot5.selectPanel:width() / 2, slot5.selectPanel:height() / 2 + 7), {
				slot6,
				slot7
			}, cc.p(5, 0))
		end

		if slot4.selectedType == "center" then
			adapt.oneLineCenterPos(cc.p(slot1:width() / 2 - slot5.selectPanel:x() + 40, slot5.selectPanel:height() / 2 + 32), {
				slot7,
				slot6
			}, cc.p(5, 0))
		end
	end

	if slot4.finish then
		slot5.finshImg:show()
	end
end

function slot12(slot0, slot1, slot2, slot3, slot4)
	uv5 = "multiget"

	slot5(slot0, slot1, slot2, slot3, slot4)

	slot5 = slot1:multiget("selectPanel", "txtPanel", "stateText", "stateImg", "btn", "list", "finshImg", "gemSelectPanel")

	slot5.txtPanel:x(600)
	slot5.selectPanel:show()
	slot5.gemSelectPanel:show()
	slot5.gemSelectPanel:x(830)
	slot5.gemSelectPanel:get("txt"):hide()

	slot7 = "#C0x5B545B#"

	slot5.gemSelectPanel:removeChildByName("gemRichText")

	slot8 = rich.createByStr(string.format(gLanguageCsv.dailyAssistantGem10Draw .. "    " .. (slot4.leftGemGold10DrawCount > 0 and "#C0x60C456#" or "#C0xFB6023#") .. "#Pfont/youmi1.ttf#" .. slot4.leftGemGold10DrawCount .. "/" .. slot4.max10Count, mathEasy.getShortNumber(gCommonConfigCsv.draw10GemGoldCostPrice * slot4.leftGemGold10DrawCount, 2)), 40, 200)

	slot8:addTo(slot5.gemSelectPanel)
	slot8:name("gemRichText")
	slot8:anchorPoint(0, 0.5)
	slot8:xy(0, 38)
	slot8:formatText()
	slot5.gemSelectPanel:get("sPanel"):get("select"):visible(slot4.gemDrawGold10Selected == 1)
	slot5.gemSelectPanel:width(slot8:width() + 80)
	adapt.oneLinePos(slot8, slot9, cc.p(10, 0))
	slot9:hide()
end

slot13 = require("app.views.city.union.tools")
slot14 = require("app.views.city.daily_assistant.tools")
slot16 = class("DailyAssistantView", cc.load("mvc").ViewBase)
slot16.RESOURCE_FILENAME = "daily_assistant.json"
slot16.RESOURCE_BINDING = {
	item = "item",
	tabItem = "tabItem",
	selectSuitItem = "selectSuitItem",
	["rightPanel.btnOneClick"] = {
		varname = "btnOneClick",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onBtnOneClick")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					state = bindHelper.self("oneClickShowRedHint"),
					onNode = function (slot0)
						slot0:xy(340, 130)
					end
				}
			}
		}
	},
	["rightPanel.bg"] = {
		binds = {
			event = "texture",
			idler = bindHelper.self("rightBgPath")
		}
	},
	["rightPanel.activePanel"] = {
		varname = "activePanel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnShowActiveNoteClick")
			}
		}
	},
	["rightPanel.activePanel.txtNode"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(176, 89, 41, 255)
				}
			}
		}
	},
	tabList = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("tabDatas"),
				item = bindHelper.self("tabItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("selected", "normal")

					slot4.selected:visible(slot3.selected)
					slot4.normal:visible(not slot3.selected)
					slot4.selected:get("txtNode"):text(slot3.name)
					slot4.normal:get("txtNode"):text(slot3.name)

					if matchLanguage({
						"en"
					}) then
						adapt.setTextScaleWithWidth(slot4.selected:get("txtNode"), nil, 240)
						adapt.setTextScaleWithWidth(slot4.normal:get("txtNode"), nil, 240)
					end

					slot5 = slot1.onClick

					slot5(slot1, functools.partial(slot0.clickCell, slot2, slot3))

					uv5 = "multiget"

					if slot5[slot2] then
						uv5 = "multiget"
						slot5 = slot5[slot2]
						slot5.state = not slot3.selected

						bind.extend(slot0, slot1, {
							class = "red_hint",
							props = slot5
						})
					end
				end
			},
			handlers = {
				clickCell = bindHelper.self("onTabClick")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 5,
				data = bindHelper.self("showDatas"),
				item = bindHelper.self("item"),
				suitItem = bindHelper.self("selectSuitItem"),
				dataOrderCmp = function (slot0, slot1)
					return slot0.sortID < slot1.sortID
				end,
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("title", "activeImg", "unionGatePanel", "normalPanel", "unionRedpacketPanel", "chipPanel")

					text.addEffect(slot4.title, {
						outline = {
							size = 5,
							color = ui.COLORS.NORMAL.WHITE
						}
					})
					slot4.title:text(slot3.name)

					if slot4.title:width() > 480 then
						adapt.setTextScaleWithWidth(slot4.title, nil, slot6)
					end

					slot4.activeImg:hide()

					if slot3.active then
						slot4.activeImg:show()
						adapt.oneLinePos(slot4.title, slot4.activeImg, cc.p(-5, 0))
					end

					slot4.normalPanel:hide()
					slot4.unionGatePanel:hide()
					slot4.unionRedpacketPanel:hide()

					slot7 = slot4.chipPanel
					slot8 = slot7

					slot7.hide(slot8)

					uv8 = "multiget"

					if slot3.type == slot8.UNION and slot3.feature == "unionFuben" then
						uv7 = "title"

						slot7(slot0, slot4.unionGatePanel, slot4.title, slot2, slot3)
					else
						uv8 = "multiget"

						if slot3.type == slot8.REWARD and slot3.feature == "unionRedpacket" then
							uv7 = "activeImg"

							slot7(slot0, slot4.unionRedpacketPanel, slot4.title, slot2, slot3)
						else
							uv8 = "multiget"

							if slot3.type == slot8.DRAWCARD and slot3.feature == "chip" then
								uv7 = "unionGatePanel"

								slot7(slot0, slot4.chipPanel, slot0.suitItem, slot2, slot3)
							else
								uv8 = "multiget"

								if slot3.type == slot8.DRAWCARD and slot3.feature == "gem" then
									uv7 = "normalPanel"

									slot7(slot0, slot4.normalPanel, slot4.title, slot2, slot3)
								else
									uv7 = "unionRedpacketPanel"

									slot7(slot0, slot4.normalPanel, slot4.title, slot2, slot3)
								end
							end
						end
					end

					bind.touch(slot0, slot4.normalPanel:get("btn"), {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
					bind.touch(slot0, slot4.unionGatePanel:get("btnReward"), {
						methods = {
							ended = functools.partial(slot0.unionGateCell, slot2, slot3)
						}
					})
					slot4.normalPanel:get("selectPanel.sPanel"):onClick(functools.partial(slot0.selectCell, slot2, slot3))
					slot4.normalPanel:get("selectPanel.txt"):onClick(functools.partial(slot0.selectCell, slot2, slot3))
					slot4.normalPanel:get("gemSelectPanel.sPanel"):onClick(functools.partial(slot0.clickCell, slot2, slot3))
					slot4.normalPanel:get("gemSelectPanel"):onClick(functools.partial(slot0.clickCell, slot2, slot3))
				end
			},
			handlers = {
				clickCell = bindHelper.self("onBtnClick"),
				selectCell = bindHelper.self("onSelectClick"),
				unionGateCell = bindHelper.self("onUnionRewardBtnClick"),
				isAllGateClear = bindHelper.self("isAllGateClear")
			}
		}
	}
}

function slot16.onCreate(slot0)
	slot7 = slot0
	slot6 = slot0.createHandler(slot7, "onClose")

	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot6
	}):init({
		subTitle = "DAILY ASSISTANT",
		title = gLanguageCsv.dailyAssistant
	})
	slot0:initModel()
	slot0.tabSelected:addListener(function (slot0, slot1)
		if slot0 == nil then
			return
		end

		if slot1 then
			uv2 = "tabDatas"
			slot2.tabDatas:atproxy(slot1).selected = false
		end

		uv2 = "tabDatas"
		slot2 = slot2.tabDatas:atproxy(slot0)
		slot2.selected = true
		uv2 = "tabDatas"
		slot4 = "txtNode"
		uv4 = "atproxy"

		slot2.btnOneClick:get(slot4):text(slot4[slot0])

		if matchLanguage({
			"en"
		}) then
			uv3 = "tabDatas"

			adapt.setTextScaleWithWidth(slot3.btnOneClick:get("txtNode"), nil, 300)
		end

		uv2 = "tabDatas"
		slot2 = slot2.setRightBgPath

		slot2(slot2, slot0)

		uv2 = "tabDatas"
		slot2 = slot2.updateShowDatas

		slot2(slot2, slot0)

		uv2 = "tabDatas"
		slot2.errorTips = nil
	end)

	slot2 = {}
	slot0.allDatas = {}

	for slot6, slot7 in pairs(gDailyAssistantCsv) do
		if slot2[slot7.cfg.type] == nil then
			uv11 = "topuiManager"
			slot2[slot8.type] = {
				selected = false,
				name = slot11[slot8.type],
				type = slot8.type
			}
			slot1 = math.min(5, slot8.type)
		end

		if slot0.allDatas[slot8.type] == nil then
			slot0.allDatas[slot8.type] = {}
		end

		if slot8.inUnlock == 0 or dataEasy.isShow(slot6) then
			slot0.allDatas[slot8.type][slot6] = {
				csvId = slot7.csvId,
				sortID = slot8.sortID,
				name = slot8.name,
				type = slot8.type,
				feature = slot8.features
			}
		end
	end

	slot0.tabDatas:update(slot2)
	slot0.tabSelected:set(slot1)
	idlereasy.when(slot0.dailyAssistant, function (slot0, slot1)
		if slot1 == nil then
			return
		end

		uv2 = "showDatas"

		if not slot2.showDatas:atproxy("unionContrib") then
			uv2 = "showDatas"

			if not slot2.showDatas:atproxy("unionFragDonate") then
				uv2 = "showDatas"

				if not slot2.showDatas:atproxy("catch") then
					uv2 = "showDatas"

					if slot2.showDatas:atproxy("endlessTower") then
						uv2 = "showDatas"
						uv4 = "showDatas"

						slot2:updateShowDatas(slot4.tabSelected:read())
					end
				end
			end
		end
	end)
	idlereasy.any({
		slot0.curChallengeId,
		slot0.resetCount,
		slot0.maxGateId
	}, function (slot0, slot1, slot2, slot3)
		slot4 = nil

		if slot1 == 0 then
			slot4 = 1
		else
			for slot9, slot10 in orderCsvPairs(csv.endless_tower_scene) do
				if slot1 > 0 and slot9 == slot1 then
					slot4 = 0 + 1

					break
				end
			end

			slot4 = slot4 or slot5
		end

		uv5 = "orderCsvPairs"
		slot5.curGateIdx = slot4
		uv5 = "orderCsvPairs"

		if slot5.showDatas:atproxy("endlessTower") then
			uv5 = "orderCsvPairs"
			uv7 = "orderCsvPairs"

			slot5:updateShowDatas(slot7.tabSelected:read())
		end
	end)

	slot3 = idlereasy.any

	slot3({
		slot0.unionFubenPassed,
		slot0.unionFbTimes,
		slot0.unionFbAward
	}, function (slot0, slot1, slot2, slot3)
		uv4 = "showDatas"

		if slot4.showDatas:atproxy("unionFuben") then
			uv4 = "showDatas"
			uv6 = "showDatas"

			slot4:updateShowDatas(slot6.tabSelected:read())
		end
	end)

	uv3 = "createView"

	if slot3.getUnionFubenIsOpen() then
		idlereasy.when(slot0.unionFuben, function (slot0, slot1)
			if slot1 == nil then
				return
			end

			slot2 = {}
			uv3 = "selectCsvId"
			slot3.selectCsvId = 1

			for slot6, slot7 in orderCsvPairs(csv.union.union_fuben) do
				slot8 = csv.scene_conf[slot7.gateID]

				if not itertools.isempty(slot1[slot6]) then
					uv10 = "selectCsvId"

					if slot10.selectCsvId < slot6 then
						uv10 = "selectCsvId"
						slot10.selectCsvId = slot6
					end

					table.insert(slot2, {
						csvId = slot6,
						icon = slot8.icon,
						buff = slot9.buff,
						surplusHp = math.max(slot9.hpmax - slot9.damage, 0),
						maxHp = slot9.hpmax,
						damage = slot9.damage,
						time = slot9.time
					})
				end
			end

			uv3 = "selectCsvId"

			slot3.unionFubenData:update(slot2)
		end)
	end

	idlereasy.any({
		slot0.fishingSelectScene,
		slot0.selectBait,
		slot0.selectRod,
		slot0.items
	}, function (slot0, slot1, slot2, slot3, slot4)
		uv5 = "showDatas"

		if slot5.showDatas:atproxy("catch") then
			uv5 = "showDatas"
			uv7 = "showDatas"

			slot5:updateShowDatas(slot7.tabSelected:read())
		end
	end)
	idlereasy.when(slot0.lianjinTimes, function (slot0, slot1)
		uv2 = "showDatas"

		if slot2.showDatas:atproxy("gainGold") then
			uv2 = "showDatas"
			uv4 = "showDatas"

			slot2:updateShowDatas(slot4.tabSelected:read())
		end
	end)
	slot0.btnOnekeyState:addListener(function (slot0, slot1)
		if slot0 == nil then
			return
		end

		slot3 = cache.setShader
		uv4 = "leftFinished"

		slot3(slot4.btnOneClick, false, slot0.leftFinished > 0 and "normal" or "hsl_gray")

		uv3 = "leftFinished"

		slot3.btnOneClick:setTouchEnabled(slot0.leftFinished > 0)
	end)
end

function slot16.initModel(slot0)
	slot0.dailyAssistant = gGameModel.role:getIdler("daily_assistant")
	slot0.rmb = gGameModel.role:getIdler("rmb")
	slot0.gold = gGameModel.role:getIdler("gold")
	slot0.items = gGameModel.role:getIdler("items")
	slot0.level = gGameModel.role:getIdler("level")
	slot0.vip = gGameModel.role:getIdler("vip_level")
	slot0.unionFbAward = gGameModel.role:getIdler("union_fb_award")
	slot0.unionFubenPassed = gGameModel.role:getIdler("union_fuben_passed")
	slot0.unionId = gGameModel.role:getIdler("union_db_id")
	slot0.crossFishingRound = gGameModel.role:getIdler("cross_fishing_round")
	slot0.unionLevel = gGameModel.role:getIdler("union_level")
	slot0.curChallengeId = gGameModel.role:getIdler("endless_tower_current")
	slot0.maxGateId = gGameModel.role:getIdler("endless_tower_max_gate")
	slot1 = gGameModel.daily_record
	slot0.resetCount = slot1:getIdler("endless_tower_reset_times")
	slot0.lianjinTimes = slot1:getIdler("lianjin_times")
	slot0.lianjinFreeTimes = gGameModel.daily_record:getIdler("lianjin_free_times")
	slot0.unionTrainingSpeedup = slot1:getIdler("union_training_speedup")
	slot0.unionFbTimes = slot1:getIdler("union_fb_times")
	slot2 = slot1:getIdler("union_daily_gift_times")
	slot0.dailyGiftTimes = slot2
	uv2 = "dailyAssistant"

	if slot2.getUnionFubenIsOpen() then
		slot0.unionFuben = gGameModel.union_fuben:getIdler("states")
	end

	slot0.fishingSelectScene = gGameModel.fishing:getIdler("select_scene")
	slot0.autoFishing = gGameModel.fishing:getIdler("is_auto")
	slot0.selectRod = gGameModel.fishing:getIdler("select_rod")
	slot0.selectBait = gGameModel.fishing:getIdler("select_bait")
	slot0.tabDatas = idlers.new()
	slot0.showDatas = idlers.new()
	slot0.tabSelected = idler.new()
	slot0.btnOnekeyState = idlertable.new()
	slot0.unionFubenData = idlers.new()
	slot0.rightBgPath = idler.new("city/daily_assistant/img_assistant_1.png")
	slot0.curGateIdx = 1
	slot0.oneClickShowRedHint = idler.new(false)
	slot0.errorTips = nil
end

slot17 = {
	unionDailyGift = function (slot0, slot1, slot2, slot3)
		if slot0.unionId:read() and slot0.unionLevel:read() then
			uv4 = "unionId"
			slot4, slot1.txt = slot4.getUnionLockAndText(slot1.feature)

			if slot4 then
				slot1.finishFlag = true
			else
				slot1.reward = csv.union.union_level[slot0.unionLevel:read()].dailyGift
				slot1.finish = slot0.dailyGiftTimes:read() > 0
				slot1.finishFlag = slot1.finish
			end
		else
			slot1.txt = gLanguageCsv.nonunion
			slot1.finishFlag = true
		end
	end,
	unionRedpacket = function (slot0, slot1, slot2, slot3)
		if not slot0.unionId:read() or not slot0.unionLevel:read() then
			slot1.txt = gLanguageCsv.nonunion
			slot1.finishFlag = true
		else
			uv4 = "unionId"
			slot4, slot1.txt = slot4.getUnionLockAndText(slot1.feature)

			if slot4 then
				slot1.finishFlag = true
			else
				slot1.finish = not gGameModel.role:read("union_sys_packet_can_rob")
				slot1.finishFlag = slot1.finish
			end
		end
	end,
	trainer = function (slot0, slot1, slot2, slot3)
		slot1.finish = gGameModel.daily_record:read("trainer_gift_times") > 0
		slot1.finishFlag = slot1.finish
		slot1.reward = csv.trainer.trainer_level[gGameModel.role:read("trainer_level")].dailyAward
	end,
	gainGold = function (slot0, slot1, slot2, slot3)
		uv4 = "getGainGoldTimes"
		slot1.rich, slot5 = slot4.getGainGoldTimes(slot0.lianjinTimes:read(), slot0.lianjinFreeTimes:read())
		slot1.finish = slot5 == 0
		slot1.finishFlag = slot1.finish
		slot1.leftTimes = slot5
		slot1.active = dataEasy.isDoubleHuodong("buyGold")

		if slot1.active then
			uv6 = "getGainGoldTimes"
			slot6, slot7 = slot6.getActiveText("buyGold")

			if slot6 then
				if slot7 then
					slot6 = string.format("%s、%s", string.format("%s: %s", gDailyAssistantCsv[slot1.feature].cfg.name, slot6), gLanguageCsv.reunion)
				end

				table.insert(slot3, slot6)
			end
		end
	end,
	drawCardRmb = function (slot0, slot1)
		slot1.txt = gLanguageCsv.dailyAssistantFreeDrawCard
		slot4 = gGameModel.daily_record:read("dc1_free_count") < 1 and 1 or 0
		slot1.txt1 = string.format("%s/1", slot4)
		slot1.finish = slot4 == 0
		slot1.finishFlag = slot1.finish
		slot1.leftTimes = slot4
	end,
	drawCardGold = function (slot0, slot1)
		slot1.txt = gLanguageCsv.dailyAssistantFreeDrawCard
		slot5 = gCommonConfigCsv.drawGoldFreeLimit + dataEasy.getPrivilegeVal(game.PRIVILEGE_TYPE.FreeGoldDrawCardTimes)
		slot6 = slot5 - gGameModel.daily_record:read("gold1_free_count") - gGameModel.daily_record:read("draw_card_gold1_trainer")
		slot1.txt1 = string.format("%s/%s", slot6, slot5)
		slot1.finish = slot6 == 0
		slot1.finishFlag = slot1.finish
		slot1.leftTimes = slot6
	end,
	drawEquip = function (slot0, slot1)
		slot1.txt = gLanguageCsv.dailyAssistantFreeDrawCard
		slot4 = gGameModel.daily_record:read("eq_dc1_free_counter") < 1 and 1 or 0
		slot1.txt1 = string.format("%s/1", slot4)
		slot1.finish = slot4 == 0
		slot1.finishFlag = slot1.finish
		slot1.leftTimes = slot4
	end,
	explorer = function (slot0, slot1)
		slot2 = dataEasy.getPrivilegeVal(game.PRIVILEGE_TYPE.DrawItemFreeTimes)
		slot1.txt = gLanguageCsv.dailyAssistantFreeDrawCardItem
		slot4 = math.max(slot2 + 1 - gGameModel.daily_record:read("item_dc1_free_counter"), 0)
		slot1.txt1 = string.format("%s/%s", slot4, slot2 + 1)
		slot1.finish = slot4 == 0
		slot1.finishFlag = slot1.finish
		slot1.leftTimes = slot4
	end,
	gem = function (slot0, slot1)
		slot5 = csv.vip[gGameModel.role:read("vip_level") + 1].goldDrawGemCountLimit
		slot7 = math.max(2 - gGameModel.daily_record:read("gem_gold_dc1_free_count") - gGameModel.daily_record:read("gem_rmb_dc1_free_count"), 0)
		slot1.txt = gLanguageCsv.dailyAssistantFreeGem
		slot1.txt1 = string.format("%s/2", slot7)
		slot1.gemDrawGold10Selected = slot0.dailyAssistant:read().draw_gem_gold10
		slot1.leftGemGold10DrawCount = math.floor((slot5 - gGameModel.daily_record:read("draw_gem_gold")) / 10)
		slot1.max10Count = math.floor(slot5 / 10)
		slot1.finish = slot7 == 0 and (slot6 == 0 or slot1.gemDrawGold10Selected == 0)
		slot1.finishFlag = slot1.finish
		slot1.selected = userDefault.getForeverLocalKey("gemDrawAutoDecompose", false) and 1 or 0
		slot1.selectedType = "center"
		slot1.leftTimes = slot7
	end,
	chip = function (slot0, slot1)
		slot4 = math.max(2 - gGameModel.daily_record:read("chip_item_dc1_free_count") - gGameModel.daily_record:read("chip_rmb_dc1_free_count"), 0)
		slot1.txt = gLanguageCsv.dailyAssistantFreeGem
		slot1.txt1 = string.format("%s/2", slot4)
		slot1.finish = slot4 == 0
		slot1.finishFlag = slot1.finish
		slot1.leftTimes = slot4
		slot5 = {}
		slot6 = userDefault.getForeverLocalKey("selectUpSuitID", {})
		uv8 = "gGameModel"

		for slot10 = 1, slot8 do
			if slot6[slot10] ~= 0 then
				table.insert(slot5, slot6[slot10])
			end
		end

		slot1.chip = slot5
	end,
	totemDraw = function (slot0, slot1)
		if dataEasy.isTotemUnlock() then
			slot1.txt = gLanguageCsv.dailyAssistantTotemDraw
			slot4 = gGameModel.daily_record:read("totem_rmb_dc1_free_count") < 1 and 1 or 0
			slot1.txt1 = string.format("%s/1", slot4)
			slot1.finish = slot4 == 0
			slot1.finishFlag = slot1.finish
			slot1.leftTimes = slot4
		else
			slot1.txt = string.format(gLanguageCsv.totemTownExplorationUnlock, csv.unlock[gUnlockCsv.totem].startLevel)
		end
	end,
	craft = function (slot0, slot1)
		slot2, slot3 = dataEasy.judgeServerOpen("craft")

		if not slot2 and slot3 then
			slot1.txt = string.format(gLanguageCsv.unlockServerOpen, slot3)
		else
			uv4 = "dataEasy"
			slot1.state = slot4.getCraftState()
			slot1.txt = gLanguageCsv.dailyAssistantCraftText
		end
	end,
	unionFight = function (slot0, slot1)
		if not slot0.unionId:read() or not slot0.unionLevel:read() then
			slot1.txt = gLanguageCsv.nonunion
		else
			uv2 = "unionId"
			slot2, slot1.txt = slot2.getUnionLockAndText(slot1.feature)

			if slot2 then
				-- Nothing
			else
				uv4 = "unionId"
				slot1.state = slot4.getUnionFightState()
				slot1.txt = gLanguageCsv.dailyAssistantUnionFighttText
			end
		end
	end,
	crossCraft = function (slot0, slot1)
		slot2, slot3 = dataEasy.judgeServerOpen("crossCraft")

		if not slot2 and slot3 then
			slot1.txt = string.format(gLanguageCsv.unlockServerOpen, slot3)
		else
			uv4 = "dataEasy"
			slot1.state = slot4.getCrossCraftState()
			slot1.txt = gLanguageCsv.dailyAssistantCrossCraftText
		end
	end,
	activityGate = function (slot0, slot1, slot2, slot3)
		uv4 = "getActivityGateInfo"
		slot4, slot5, slot6, slot7, slot8 = slot4.getActivityGateInfo()
		slot1.txt = gLanguageCsv.dailyAssistantLeftTimes
		slot1.txt1 = string.format("%s/%s", slot4, slot5)

		if slot4 == 0 then
			slot1.finishFlag = true
		end

		slot1.leftTimes = slot4
		slot9, slot10 = dataEasy.isShowDailyActivityIcon()
		slot1.active = slot9 or slot7

		if slot1.active then
			slot11 = ""

			for slot16, slot17 in ipairs(slot6) do
				function ()
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
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 834, in _build_const_expression
					--     return _build_numeric_constant(state, instruction.CD)
					--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1027, in _build_numeric_constant
					--     number = state.constants.numeric_constants[index]
					--              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
					-- IndexError: list index out of range
				end(slot17)
			end

			if slot9 then
				slot12(slot10.name)
			end

			if slot8 then
				slot12(gLanguageCsv.reunion)
			end

			if string.len(slot11) > 0 then
				table.insert(slot3, string.format("%s: %s", gDailyAssistantCsv[slot1.feature].cfg.name, slot11))
			end
		end

		slot2[slot1.feature] = slot4
	end,
	endlessTower = function (slot0, slot1, slot2, slot3)
		uv4 = "getEndlessLeftTimes"
		slot1.btnName, slot5, slot6 = slot4.getEndlessLeftTimes()
		slot1.selected = slot0.dailyAssistant:read().endless_buy_reset

		if slot0.maxGateId:read() <= slot0.curChallengeId:read() and (slot1.selected == 0 or slot5 == 0) then
			slot1.finishFlag = true
		end

		slot1.rich = string.format(gLanguageCsv.dailyAssistantEndlessGate, slot0.curGateIdx)
		slot1.active = dataEasy.isDoubleHuodong("endlessSaodang")

		if slot1.active then
			uv8 = "getEndlessLeftTimes"
			slot8, slot9 = slot8.getActiveText("endlessSaodang")

			if slot8 then
				if slot9 then
					slot8 = string.format("%s、%s", string.format("%s: %s", gDailyAssistantCsv[slot1.feature].cfg.name, slot8), gLanguageCsv.reunion)
				end

				table.insert(slot3, slot8)
			end
		end

		slot2[slot1.feature] = slot7 and slot5 or slot5 + 1
	end,
	catch = function (slot0, slot1, slot2, slot3)
		if not dataEasy.isUnlock("fishing") then
			slot1.txt = dataEasy.getUnlockTip("fishing")
			slot1.finishFlag = true
		else
			slot4 = slot0.dailyAssistant:read().fishing_skip
			slot1.selected = slot4
			uv4 = "dataEasy"
			slot1.rich, slot5, slot6 = slot4.getFishingText()
			slot1.btnName = gLanguageCsv.adjustment

			if slot6 == 0 then
				slot1.finishFlag = true
			end

			slot1.active = slot0.crossFishingRound:read() == "start"

			if slot1.active then
				table.insert(slot3, string.format("%s: %s", gDailyAssistantCsv[slot1.feature].cfg.name, gLanguageCsv.FishingCompetition))
			end

			slot2[slot1.feature] = slot5
		end
	end,
	unionContrib = function (slot0, slot1, slot2)
		uv3 = "getUnionLockAndText"
		slot3, slot1.txt = slot3.getUnionLockAndText(slot1.feature)

		if slot3 then
			-- Nothing
		else
			slot5 = gLanguageCsv.replacementMethod
			slot1.btnName = slot5
			uv5 = "getUnionLockAndText"
			slot1.rich, slot2[slot1.feature] = slot5.getUnionContribText()
		end
	end,
	unionFragDonate = function (slot0, slot1, slot2)
		uv3 = "getUnionLockAndText"
		slot3, slot1.txt = slot3.getUnionLockAndText(slot1.feature)

		if slot3 then
			-- Nothing
		else
			slot5 = gLanguageCsv.spaceExchange2
			slot1.btnName = slot5
			uv5 = "getUnionLockAndText"
			slot1.rich, slot2[slot1.feature] = slot5.getUnionFragDonateText()
		end
	end,
	unionTrainingSpeedup = function (slot0, slot1, slot2)
		uv3 = "getUnionLockAndText"
		slot3, slot1.txt = slot3.getUnionLockAndText(slot1.feature)

		if slot3 then
			-- Nothing
		else
			slot5 = math.max(6 - slot0.unionTrainingSpeedup:read(), 0)
			slot1.txt = gLanguageCsv.dailyAssistantSpeedTimes
			slot1.txt1 = string.format("%s/6", slot5)
			slot1.leftTimes = slot5
			slot2[slot1.feature] = slot5
		end
	end,
	unionFuben = function (slot0, slot1, slot2)
		uv3 = "getUnionLockAndText"
		slot3, slot1.errTxt = slot3.getUnionLockAndText(slot1.feature)

		if slot3 then
			-- Nothing
		else
			uv5 = "feature"

			if slot5.currentOpenFuben() == "weekError" then
				slot1.errTxt = gLanguageCsv.fubenClosedOnSunday
			else
				uv5 = "feature"

				if slot5.currentOpenFuben() ~= "open" then
					slot1.errTxt = gLanguageCsv.unionFubenNoOpen
				else
					slot5 = gLanguageCsv.changeTimes .. ":"
					slot1.txt = slot5
					uv5 = "getUnionLockAndText"
					slot1.txt1, slot6 = slot5.getUnionFubenTimes()

					if slot0.selectCsvId then
						slot1.data = slot0.unionFubenData:atproxy(slot0.selectCsvId)
					end

					slot1.leftTimes = slot6
					slot2[slot1.feature] = slot6
				end
			end

			slot1.hasReward = dataEasy.haveUnionFubenReward()
		end
	end,
	randomTowerJump = function (slot0, slot1, slot2, slot3)
		slot1.active = dataEasy.isDoubleHuodong("randomGold")

		if slot1.active then
			uv4 = "active"

			if slot4.getActiveText("randomGold") then
				if isReunion then
					slot4 = string.format("%s、%s", string.format("%s: %s", gDailyAssistantCsv[slot1.feature].cfg.name, slot4), gLanguageCsv.reunion)
				end

				table.insert(slot3, slot4)
			end
		end

		uv4 = "active"

		if not slot4.getRandomTowerJumpOpen() then
			slot1.txt = dataEasy.getUnlockTip("randomTowerJump")
			slot1.finishFlag = true
		else
			uv4 = "active"
			slot5 = itertools.include({
				0,
				2,
				4,
				5
			}, slot4.getRandomTowerJumpState())
			slot1.finishFlag = slot5
			uv5 = "active"
			slot1.rich = slot5.getRandomTowerJumpText()
		end
	end
}
slot18 = {
	[slot0.SIGNUP] = function (slot0, slot1)
		if slot0.state ~= nil then
			uv3 = "state"

			if slot0.state ~= slot3.hadSignUp then
				uv3 = "state"

				if slot0.state ~= slot3.cantSignUp then
					slot2 = false
				end
			end
		else
			slot2 = true
		end

		return slot2
	end,
	[slot0.UNION] = function (slot0, slot1)
		return not slot1[slot0.feature] or slot1[slot0.feature] == 0
	end
}

function slot16.updateShowDatas(slot0, slot1)
	slot2 = table.deepcopy(slot0.allDatas[slot1], true)
	slot4 = {}
	slot5 = {}

	for slot9, slot10 in pairs(slot2) do
		if gDailyAssistantCsv[slot10.feature].cfg.inUnlock == 1 and not dataEasy.isUnlock(slot10.feature) then
			slot10.txt = dataEasy.getUnlockTip(slot10.feature)
			slot3 = itertools.size(slot2) - 1
		else
			uv11 = "table"
			slot11 = slot11[slot10.feature]

			slot11(slot0, slot10, slot4, slot5)

			uv11 = "deepcopy"

			if slot11[slot1] then
				uv11 = "deepcopy"

				if slot11[slot1](slot10, slot4) then
					slot10.finishFlag = true
				end
			end

			if slot10.finishFlag then
				slot3 = slot3 - 1
			end
		end

		slot10.finishFlag = nil
	end

	if slot1 == 2 and dataEasy.isTotemUnlock() == false and slot2.totemDraw then
		slot3 = slot3 - 1
	end

	if slot1 == 5 and slot0:isAllGateClear() then
		slot3 = slot3 - 1
	end

	slot0.activePanel:visible(not itertools.isempty(slot5))
	slot0.btnOnekeyState:set({
		showType = slot1,
		leftFinished = slot3,
		featuresLeftTimes = slot4,
		activeTxt = slot5
	})
	slot0.oneClickShowRedHint:set(slot3 > 0)
	dataEasy.tryCallFunc(slot0.list, "updatePreloadCenterIndex")
	slot0.showDatas:update(slot2)
end

function slot16.onTabClick(slot0, slot1, slot2, slot3)
	uv4 = "UNION"

	if slot2 == slot4.UNION and (not slot0.unionId:read() or not slot0.unionLevel:read()) then
		gGameUI:showTip(gLanguageCsv.nonunion)

		return
	end

	uv4 = "UNION"

	if slot2 == slot4.ADVENTURE then
		uv4 = "unionId"

		if slot4.getRandomTowerJumpOpen() then
			gGameApp:requestServer("/game/random_tower/prepare", function (slot0)
				uv1 = "tabSelected"
				uv3 = "set"

				slot1.tabSelected:set(slot3)
			end)

			return
		end
	end

	slot0.tabSelected:set(slot2)
end

function slot16.onBtnClick(slot0, slot1, slot2, slot3)
	if slot3.feature == "endlessTower" then
		if gVipCsv[slot0.vip:read()].endlessTowerResetTimes - slot0.resetCount:read() <= 0 then
			gGameUI:showTip(gLanguageCsv.resetTimesNotEnough)

			return
		end

		if slot0.curGateIdx == 1 then
			gGameUI:showTip(gLanguageCsv.cannotResetGate)

			return
		end

		gGameUI:showDialog({
			btnType = 2,
			clearFast = true,
			cb = function ()
				uv0 = "rmb"

				if slot0 > 0 then
					uv0 = "read"
					slot0 = slot0.rmb
					slot1 = slot0
					uv1 = "rmb"

					if slot0.read(slot1) < slot1 then
						uiEasy.showDialog("rmb")

						return
					end
				end

				slot0 = gGameApp
				slot0 = slot0.requestServer

				slot0(slot0, "/game/endless/reset")

				uv0 = "read"
				slot0.errorTips = nil
			end,
			isRich = gCostCsv.endless_tower_reset_times_cost[math.min(slot0.resetCount:read() + 1, table.length(gCostCsv.endless_tower_reset_times_cost))] ~= 0,
			content = slot6 == 0 and gLanguageCsv.resetGate or string.format(gLanguageCsv.endlessTowerResetCost, slot6)
		})

		return
	end

	if slot3.feature == "catch" then
		if slot0.autoFishing:read() then
			gGameUI:showTip(gLanguageCsv.dailyAssistantAutoFishingTips)

			return
		end

		gGameUI:stackUI("city.daily_assistant.fishing_select")
	elseif slot3.feature == "unionContrib" then
		gGameUI:stackUI("city.daily_assistant.union_contribute", nil, , {
			callBack = function (slot0, slot1)
				uv2 = "setInfo"
				uv5 = "csvId"

				slot2:setInfo(slot1, slot5.csvId, slot0)
			end
		})
	elseif slot3.feature == "unionFragDonate" then
		gGameUI:stackUI("city.union.frag_donate.wish", nil, , {
			isDailySelected = true,
			callBack = function (slot0, slot1)
				uv2 = "setInfo"
				uv5 = "csvId"

				slot2:setInfo(slot1, slot5.csvId, slot0)
			end
		})
	end
end

function slot16.onSelectClick(slot0, slot1, slot2, slot3)
	slot4 = nil

	function slot5(slot0)
		uv1 = "setInfo"
		uv4 = "csvId"

		slot1:setInfo(nil, slot4.csvId, slot0)
	end

	if slot3.feature == "catch" then
		if (slot0.dailyAssistant:read().fishing_skip or 1) == 1 then
			gGameUI:showDialog({
				btnType = 2,
				clearFast = true,
				content = gLanguageCsv.dailyAssistantFishTip,
				cb = function ()
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
			})
		else
			slot5(slot4 == 1 and 0 or 1)
		end
	elseif slot3.feature == "endlessTower" then
		slot5((slot0.dailyAssistant:read().endless_buy_reset or 0) == 1 and 0 or 1)
	elseif slot3.feature == "gem" then
		slot6 = userDefault.getForeverLocalKey("gemDrawAutoDecompose", false)

		userDefault.setForeverLocalKey("gemDrawAutoDecompose", not slot6)

		slot0.showDatas:atproxy("gem").selected = not slot6 and 1 or 0
	end
end

function slot16.onUnionRewardBtnClick(slot0, slot1, slot2, slot3)
	if not dataEasy.haveUnionFubenReward() then
		gGameUI:showTip(gLanguageCsv.noRewardAvailable)

		return
	end

	gGameUI:stackUI("city.union.gate.reward", nil, , slot0.unionFuben:read(), slot0:createHandler("onRewardCb"))
end

function slot16.onRewardCb(slot0, slot1, slot2)
	slot3 = nil

	if slot2 then
		slot3 = {
			cb = slot2
		}
	end

	gGameUI:showGainDisplay(slot1, slot3)
end

function slot16.setRightBgPath(slot0, slot1)
	slot0.rightBgPath:set(string.format("city/daily_assistant/img_assistant_%s.png", slot1))
end

function slot16.setInfo(slot0, slot1, slot2, slot3, slot4)
	gGameApp:requestServer("/game/daily/assistant/set", function (slot0)
		if slot0.ret then
			for slot4, slot5 in pairs(gDailyAssistantCsv) do
				uv7 = "ret"

				if slot5.csvId == slot7 then
					slot6 = nil

					if slot4 == "unionContrib" then
						uv7 = "pairs"
						slot6 = gLanguageCsv[csv.union.contrib[slot7.dailyAssistant:read().union_contrib or 1].title]
					elseif slot4 == "unionFragDonate" then
						uv7 = "gDailyAssistantCsv"
						uv8 = "pairs"
						slot6 = slot7.getCardFragmentsName(slot8.dailyAssistant:read().union_frag_donate_card_id)
					end

					if slot6 then
						gGameUI:showTip(string.format(gLanguageCsv.dailyAssistantChangeSuccess, slot6))
					end

					break
				end
			end

			uv1 = "pairs"
			slot1.errorTips = nil
		end

		uv1 = "csvId"

		if slot1 then
			uv1 = "csvId"

			slot1()
		end
	end, slot2, slot3, slot4)
end

slot19 = {
	drawCardRmb = function (slot0, slot1)
		slot1.carddbIDs = slot0[1].carddbIDs
	end,
	drawCardGold = function (slot0, slot1)
		for slot5, slot6 in pairs(slot0) do
			slot1[slot7] = (slot1[slot6.items[1][1]] or 0) + slot6.items[1][2]
		end
	end,
	drawEquip = function (slot0, slot1)
		slot1[slot2] = (slot1[slot0[1].items[1][1]] or 0) + slot0[1].items[1][2]
	end,
	explorer = function (slot0, slot1)
		slot1[slot2] = (slot1[slot0[1][1][1][1]] or 0) + slot0[1][1][1][2]
	end,
	gem = function (slot0, slot1)
		for slot5, slot6 in pairs(slot0) do
			for slot10, slot11 in pairs(slot6.items) do
				slot1[slot12] = (slot1[slot11[1]] or 0) + slot11[2]
			end
		end
	end,
	chip = function (slot0, slot1)
		for slot5, slot6 in pairs(slot0) do
			if slot6.chipdbIDs then
				if slot1.chipdbIDs == nil then
					slot1.chipdbIDs = {}
				end

				table.insert(slot1.chipdbIDs, slot6.chipdbIDs[1])
			elseif slot6.items then
				for slot10, slot11 in pairs(slot6.items) do
					slot1[slot12] = (slot1[slot11[1]] or 0) + slot11[2]
				end
			end
		end
	end,
	totemDraw = function (slot0, slot1)
		slot1[slot2] = (slot1[slot0[1].items[1][1]] or 0) + slot0[1].items[1][2]
	end,
	unionDailyGift = slot7,
	unionRedpacket = slot7,
	trainer = slot7,
	gainGold = function (slot0, slot1)
		uv2 = "gold"

		slot2(slot0, slot1, "gold")
	end
}

function slot20(slot0, slot1)
	return (slot0 ~= "" or string.format("[ %s ]", slot1)) and string.format("%s%s [ %s ]", string.format("[ %s ]", slot1), gLanguageCsv.symbolComma, slot1)
end

function slot16.sendOnekey(slot0, slot1, slot2, slot3)
	slot4 = slot0.tabSelected:read()
	slot5 = slot0.btnOnekeyState:read().featuresLeftTimes

	if itertools.isempty(slot1) then
		slot1 = nil
	end

	gGameApp:requestServer("/game/daily/assistant/onekey", function (slot0)
		uv1 = "updateShowDatas"
		uv3 = "view"

		slot1:updateShowDatas(slot3)

		slot1 = slot0.view
		slot2 = ""
		uv3 = "view"
		uv4 = ""

		if slot3 == slot4.SIGNUP then
			slot3 = ""

			for slot7, slot8 in pairs(slot1) do
				uv10 = "updateShowDatas"
				uv11 = "view"

				for slot12, slot13 in pairs(slot10.allDatas[slot11]) do
					if slot13.csvId == slot7 then
						if slot8 == 1 then
							uv14 = "SIGNUP"
							slot2 = slot14(slot2, slot13.name)

							break
						elseif type(slot8) == "table" and slot8.errorID then
							uv14 = "SIGNUP"
							slot3 = slot14(slot3, slot13.name)

							break
						end
					end
				end
			end

			if slot2 ~= "" or slot3 ~= "" then
				if slot2 ~= "" then
					slot2 = string.format("%s %s", slot2, gLanguageCsv.signUpSuccess)
				end

				if slot3 ~= "" then
					if slot2 ~= "" then
						slot2 = slot2 .. ","
					end

					slot2 = string.format("%s %s %s", slot2, slot3, gLanguageCsv.signUpFailed)
				end

				gGameUI:showTip(slot2)
			end

			return
		else
			for slot6, slot7 in pairs(slot1) do
				uv9 = "updateShowDatas"
				uv10 = "view"

				for slot11, slot12 in pairs(slot9.allDatas[slot10]) do
					if slot12.csvId == slot6 and type(slot7) == "table" and slot7.errorID then
						slot2 = gLanguageCsv[slot7.errorID] or slot7.errorID
						slot1[slot6] = nil

						break
					end
				end
			end
		end

		uv3 = "view"
		uv4 = ""

		if slot3 ~= slot4.REWARD then
			uv3 = "view"
			uv4 = ""

			if slot3 == slot4.DRAWCARD then
				if not itertools.isempty(slot1) then
					slot3 = {}

					for slot8, slot9 in pairs(slot1) do
						uv11 = "pairs"

						slot11[csv.daily_assistant[slot8].features](slot9, slot3)
					end

					uv5 = "updateShowDatas"

					slot5:onRewardCb(slot3)
				end

				if slot2 ~= "" then
					gGameUI:showTip(slot2)
				end
			else
				uv3 = "view"
				uv4 = ""

				if slot3 == slot4.ADVENTURE then
					uv3 = "updateShowDatas"
					slot4 = slot3
					uv5 = "allDatas"
					uv7 = "csvId"
					slot3 = slot3.showSweepView(slot4, slot5, slot1, slot7)
					uv4 = "name"

					if slot4.getRandomTowerJumpState() == 1 or slot4 == 3 then
						if slot3 then
							slot3:onNodeEvent("exit", function ()
								uv1 = "performWithDelay"

								performWithDelay(slot1, function ()
									uv0 = "stackRandomTowerJump"

									slot0:stackRandomTowerJump()
								end, 0)
							end)
						else
							uv5 = "updateShowDatas"

							slot5:stackRandomTowerJump()
						end
					end
				else
					uv3 = "view"
					uv4 = ""

					if slot3 == slot4.UNION then
						uv3 = "updateShowDatas"
						uv5 = "allDatas"
						uv7 = "csvId"

						slot3:showSweepView(slot5, slot1, slot7)
					end
				end
			end
		end
	end, slot4, slot1, slot3)
end

function slot16.stackRandomTowerJump(slot0)
	if gGameModel.random_tower:read("jump_step") == game.RANDOM_TOWER_JUMP_STATE.BEGIN or slot1 == game.RANDOM_TOWER_JUMP_STATE.POINT then
		gGameApp:requestServer("/game/random_tower/jump/next", function (slot0)
			uv7 = "gGameUI"
			uv10 = "stackUI"

			gGameUI:stackUI("city.adventure.random_tower.jump", nil, , slot0.view, slot7:createHandler("updateShowDatas", slot10.ADVENTURE))
		end)
	else
		uv11 = "gGameModel"

		gGameUI:stackUI("city.adventure.random_tower.jump", nil, , , slot0:createHandler("updateShowDatas", slot11.ADVENTURE))
	end
end

function slot16.sendRequestServerOnekey(slot0, slot1)
	slot3 = slot0.btnOnekeyState:read()
	slot5 = {
		[gDailyAssistantCsv[slot13].csvId] = 0
	}
	slot6 = {}
	slot7 = {}

	function slot8(slot0, slot1)
		gGameUI:showDialog({
			btnType = 2,
			clearFast = true,
			content = slot0.content,
			cb = function ()
				uv0 = "okInput"

				if slot0.okInput then
					uv0 = "okInput"

					if slot0.okInput() then
						uv0 = "okInput"

						slot0()
					end
				end
			end,
			cancelCb = function ()
				uv0 = "cancelInput"

				if slot0.cancelInput then
					uv0 = "cancelInput"

					if slot0.cancelInput() then
						uv0 = "cancelInput"

						slot0()
					end
				end
			end,
			isRich = slot0.isRich or false
		})
	end

	function slot9()
		uv1 = "itertools"

		if itertools.isempty(slot1) then
			uv0 = "isempty"
			uv2 = "sendOnekey"
			uv3 = "table"
			uv4 = "deepcopy"

			slot0:sendOnekey(slot2, slot3, slot4)
		else
			uv1 = "itertools"
			slot1 = table.remove
			uv2 = "itertools"
			slot3 = 1

			slot1(slot2, slot3)

			uv1 = "remove"
			uv3 = "itertools"

			slot1(table.deepcopy(slot1[1]), slot3)
		end
	end

	for slot13, slot14 in pairs(table.deepcopy(slot0.allDatas[slot0.tabSelected:read()], true)) do
		if slot13 == "endlessTower" then
			slot17 = gVipCsv[slot0.vip:read()].endlessTowerResetTimes
			slot18 = slot0.resetCount:read()

			if slot0.dailyAssistant:read().endless_buy_reset == 1 and slot17 > 1 and slot18 < 2 then
				for slot23 = slot18 + 1, slot17 do
					slot19 = 0 + gCostCsv.endless_tower_reset_times_cost[math.min(slot23, table.length(gCostCsv.endless_tower_reset_times_cost))]
				end

				table.insert(slot7, {
					isRich = true,
					content = string.format(gLanguageCsv.dailyAssistantEndlessTip1, slot19),
					okInput = function ()
						uv0 = "rmb"

						if slot0 > 0 then
							uv0 = "read"
							slot0 = slot0.rmb
							slot1 = slot0
							uv1 = "rmb"

							if slot0.read(slot1) < slot1 then
								uiEasy.showDialog("rmb")

								return false
							end
						else
							uv0 = "uiEasy"
							uv1 = "showDialog"
							slot0[slot1] = 1

							return true
						end
					end
				})
			end
		elseif slot13 == "catch" then
			if slot0.autoFishing:read() then
				table.insert(slot6, slot15)
			end
		elseif slot13 == "gem" then
			slot5[slot15] = userDefault.getForeverLocalKey("gemDrawAutoDecompose", false) and 1 or 0

			if slot0.dailyAssistant:read().draw_gem_gold10 == 1 and slot0.gold:read() < gCommonConfigCsv.draw10GemGoldCostPrice * math.floor((csv.vip[gGameModel.role:read("vip_level") + 1].goldDrawGemCountLimit - gGameModel.daily_record:read("draw_gem_gold")) / 10) then
				table.insert(slot7, {
					isRich = true,
					content = gLanguageCsv.dailyAssistantGemGold10DrawTip,
					okInput = function ()
						uv0 = "gold"
						slot0 = slot0.gold
						slot1 = slot0
						uv1 = "read"

						if slot0.read(slot1) < slot1 then
							uiEasy.showDialog("gold")

							return false
						else
							return true
						end
					end
				})
			end
		elseif slot13 == "chip" then
			slot17 = {}

			for slot21, slot22 in ipairs(userDefault.getForeverLocalKey("selectUpSuitID", {})) do
				if slot22 ~= 0 then
					table.insert(slot17, slot22)
				end
			end

			slot5[slot15] = slot17
		end
	end

	slot9()
end

slot21 = {
	catch = function (slot0, slot1, slot2, slot3, slot4)
		if slot1 > 0 and slot2 then
			table.insert(slot3, {
				exp = slot2.win,
				items = {
					fish = slot2.fish
				},
				dailyDatas = {
					feature = slot0,
					win = slot2.win,
					fail = slot2.fail
				}
			})
			table.insert(slot3, {
				textDatas = {
					content = gLanguageCsv.textReward
				}
			})
			table.insert(slot3, {
				noTitle = true,
				items = slot2.award
			})

			return false
		end

		return true
	end,
	activityGate = function (slot0, slot1, slot2, slot3, slot4)
		if slot2 and not itertools.isempty(slot2) then
			table.insert(slot3, {
				exp = slot1,
				items = slot2,
				dailyDatas = {
					feature = slot0
				}
			})

			return false
		end

		return true
	end,
	endlessTower = function (slot0, slot1, slot2, slot3, slot4)
		if slot2 and not itertools.isempty(slot2) then
			table.insert(slot3, {
				exp = slot1,
				items = slot2,
				dailyDatas = {
					feature = slot0
				}
			})

			return false
		end

		return true
	end,
	unionContrib = function (slot0, slot1, slot2, slot3, slot4)
		slot5 = {}

		if slot1 > 0 and slot2 then
			for slot9, slot10 in pairs(slot2) do
				for slot14, slot15 in pairs(slot10) do
					slot5[slot14] = (slot5[slot14] or 0) + slot15
				end
			end

			table.insert(slot3, {
				exp = slot1,
				items = slot5,
				dailyDatas = {
					feature = slot0
				}
			})

			return false
		end

		return true
	end,
	unionFragDonate = function (slot0, slot1, slot2, slot3, slot4)
		if slot1 > 0 and gGameModel.role:read("daily_assistant").union_frag_donate_card_id then
			for slot9, slot10 in gGameModel.cards:pairs() do
				if slot5 == slot10:read("card_id") then
					table.insert(slot4, string.format(gLanguageCsv.wishSuccess, csv.cards[slot11].name .. gLanguageCsv.fragment))

					return false, true
				end
			end

			return false
		end

		return true
	end,
	unionTrainingSpeedup = function (slot0, slot1, slot2, slot3, slot4)
		if slot1 > 0 then
			table.insert(slot3, {
				exp = slot1,
				items = {
					gold = gCommonConfigCsv.unionTrainingSpeedUpGold * slot1
				},
				dailyDatas = {
					feature = slot0
				}
			})

			return false
		end

		return true
	end
}

function slot16.showSweepView(slot0, slot1, slot2, slot3)
	slot8 = "unionFuben"
	slot11 = false

	for slot15, slot16 in pairs(table.deepcopy(slot0.allDatas[slot0.tabSelected:read()], true)) do
		uv22 = "tabSelected"

		if slot22[slot15] then
			uv22 = "tabSelected"
			slot22, slot11 = slot22[slot15](slot15, (slot1[slot15] or 0) - (slot0.btnOnekeyState:read().featuresLeftTimes[slot15] or 0), slot2[slot16.csvId], {}, {})

			if slot22 and slot20 > 0 then
				table.insert({}, slot15)
			end
		end
	end

	if slot3 then
		for slot15, slot16 in pairs(slot3) do
			table.insert(slot7, {
				exp = slot16.exp,
				items = slot16.items,
				dailyDatas = {
					feature = "unionFuben"
				}
			})

			if slot16.bossKilled then
				table.insert(slot7, {
					textDatas = {
						content = "#Pfont/youmi1.ttf##C0xFF5B545B#" .. gLanguageCsv.crossMineBossHasKilled,
						params = {
							isRich = true
						}
					}
				})
			end
		end
	end

	if not itertools.isempty(slot10) then
		for slot16, slot17 in pairs(slot10) do
			if slot16 ~= #slot10 then
				slot12 = string.format("%s[ %s ] ", "", gDailyAssistantCsv[slot17].cfg.name) .. gLanguageCsv.symbolComma
			end
		end

		if itertools.isempty(slot7) then
			if slot11 then
				slot12 = string.format("%s,%s", gLanguageCsv.wishSuccess1, slot12 .. gLanguageCsv.dailyAssistantCantTodo)
			end

			gGameUI:showTip(slot12)

			if itertools.isempty(slot2) then
				slot0.errorTips = slot12
			end

			return
		else
			table.insert(slot9, "#C0xFF5B545B#" .. slot12)
		end
	end

	if not itertools.isempty(slot9) then
		table.insert(slot7, {
			textDatas = {
				content = slot9,
				params = {
					isRich = true,
					align = "left",
					fontSize = 40
				}
			},
			dailyDatas = {
				hasTitle = gLanguageCsv.mopUpNotes
			}
		})
	end

	if itertools.isempty(slot7) then
		return
	end

	return gGameUI:stackUI("city.gate.sweep", nil, , {
		showType = 2,
		from = "dailyAssistant",
		hasExtra = false,
		sweepData = slot7,
		oldRoleLv = slot0.level:read(),
		title1 = gLanguageCsv.oneKey,
		title2 = gLanguageCsv.mopUp1,
		oldCapture = gGameModel.capture:read("limit_sprites")
	})
end

function slot16.onBtnOneClick(slot0)
	if slot0.errorTips then
		gGameUI:showTip(slot0.errorTips)

		return
	end

	slot2 = slot0.tabSelected
	slot3 = slot2
	uv3 = "errorTips"

	if slot2.read(slot3) == slot3.UNION and slot0.btnOnekeyState:read().featuresLeftTimes.unionFuben then
		slot0:onBtnThreeFight()
	else
		slot0:sendRequestServerOnekey()
	end
end

function slot16.onBtnThreeFight(slot0)
	slot5 = slot0.unionFubenData:atproxy(slot0.selectCsvId).maxHp == 0
	slot6 = slot2.surplusHp
	slot7 = csv.union.union_fuben[slot0.selectCsvId]
	slot8 = {}
	slot9 = 0

	function slot10()
		uv0 = "atproxy"
		uv2 = "selectCsvId"
		uv0 = 0
		uv0 = "csv"

		if slot0.unionFubenData:atproxy(slot2) == 0 then
			uv0 = "atproxy"
			slot0 = slot0.selectCsvId
			uv2 = 0
			uv1 = "selectCsvId"
			slot0 = csv.union.union_fuben[slot1]
			uv4 = 0
		end

		uv0 = "union_fuben"
		slot0 = slot0 + 1
		uv5 = 0
		uv2 = "selectCsvId"
		uv3 = "union"

		battleEntrance.battleRequest("/game/union/fuben/start", slot2, slot3.gateID):onStartOK(function (slot0)
			uv1 = "damage"
			slot1 = slot1.damage
			slot0.damage = slot1
			uv1 = "damage"
			slot0.hpMax = slot1.maxHp
		end):onResult(function ()
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
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 834, in _build_const_expression
			--     return _build_numeric_constant(state, instruction.CD)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1027, in _build_numeric_constant
			--     number = state.constants.numeric_constants[index]
			--              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
			-- IndexError: list index out of range
		end):run()
	end

	if math.max(0, 3 - slot0.unionFbTimes:read()) > 0 then
		if slot0:isAllGateClear() then
			gGameUI:showTip(gLanguageCsv.unionGateClearTips)
			slot0.btnOneClick:setTouchEnabled(false)
			performWithDelay(slot0, function ()
				uv0 = "sendRequestServerOnekey"
				slot0 = slot0.sendRequestServerOnekey

				slot0(slot0)

				uv0 = "sendRequestServerOnekey"

				slot0.btnOneClick:setTouchEnabled(true)
			end, 0.5)
		else
			slot10()
		end
	else
		slot0:sendRequestServerOnekey()
	end
end

function slot16.onBtnShowActiveNoteClick(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1000
	})
end

function slot16.getRuleContext(slot0, slot1)
	slot3 = {
		adaptContext.clone(slot1.title, function (slot0)
			uv5 = "get"
			uv6 = "text"

			slot0:get("text"):text(string.format(gLanguageCsv.dailyAssistantActiveTxt, slot5[slot6.tabSelected:read()]))
		end)
	}

	for slot7, slot8 in pairs(slot0.btnOnekeyState:read().activeTxt) do
		table.insert(slot3, slot8)
	end

	return slot3
end

function slot16.isAllGateClear(slot0)
	return csvSize(csv.union.union_fuben) <= gGameModel.role:read("union_fuben_passed")
end

return slot16
