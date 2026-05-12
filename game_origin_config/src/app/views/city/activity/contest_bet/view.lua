slot0 = require("app.views.city.activity.yy_bet.view")
slot1 = clone(rawget(slot0, "RESOURCE_BINDING"))
slot2 = class("ContestBetView", slot0)
slot3 = {
	binds = {
		event = "effect",
		data = {
			outline = {
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		}
	}
}
slot4 = {
	CHAMPITION_BETTING = 0,
	OVER = 3,
	BATTLING = 2,
	BETTING = 1
}
slot5 = {
	SemiFinal = 3,
	Champion = 6,
	GroupMatchs = 1,
	Third = 4,
	Finals = 5,
	FinalFour = 2
}
slot6 = {
	gLanguageCsv.contestBetFinalWinner,
	[6] = gLanguageCsv.contestBetMissingEight,
	[5] = gLanguageCsv.contestBetEight,
	[4] = gLanguageCsv.contestBetFinalFour,
	[3] = gLanguageCsv.contestBetFinalThird,
	[2] = gLanguageCsv.contestBetFinalSecond
}
slot2.RESOURCE_FILENAME = "contest_bet_view.json"
slot2.RESOURCE_BINDING = {
	["imgdi.zhuchirenSpine"] = "comperePanel",
	spriteL = "spriteL",
	overPanel = "overPanel",
	bg = "bg",
	trophy = "trophy",
	spriteR = "spriteR",
	imgdi = "imgdi",
	championBetPanel = "championBetPanel",
	infoPanel = slot1.infoPanel,
	battlingPanel = slot1.battlingPanel,
	["infoPanel.textNote"] = slot1["infoPanel.textNote"],
	["infoPanel.textTime"] = slot1["infoPanel.textTime"],
	["btnMain.textNote"] = slot1["btnMain.textNote"],
	["downRightPanel.bet.name"] = slot3,
	["downRightPanel.bet"] = {
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onBet")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					listenData = {
						activityId = bindHelper.self("yyid")
					},
					specialTag = {
						"contestBetAllContestBet",
						"contestBetAward",
						"contestBetChampionBet"
					},
					onNode = function (slot0)
						slot0:xy(150, 150)
					end
				}
			}
		}
	},
	["downLeftPanel.shop.name"] = slot3,
	["downLeftPanel.shop"] = slot1["downPanel.shop"],
	["downLeftPanel.rank.name"] = slot3,
	["downLeftPanel.rank"] = slot1["downPanel.rank"],
	["downRightPanel.award.name"] = slot3,
	["downRightPanel.award"] = {
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onAward")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "contestBetTaskAward",
					listenData = {
						activityId = bindHelper.self("yyid")
					},
					onNode = function (slot0)
						slot0:xy(150, 150)
					end
				}
			}
		}
	},
	["downLeftPanel.rule.name"] = slot3,
	["downLeftPanel.rule"] = slot1["downPanel.rule"],
	["downRightPanel.contest.name"] = slot3,
	["downRightPanel.contest"] = {
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onContest")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "contestBetChampionBet",
					listenData = {
						activityId = bindHelper.self("yyid")
					},
					onNode = function (slot0)
						slot0:xy(140, 150)
					end
				}
			}
		}
	},
	btnMain = slot1.btnMain,
	rightPanel = slot1.rightPanel,
	["overPanel.textNote"] = slot3,
	["championBetPanel.btnChampion"] = {
		varname = "btnChampion",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onChampitionBet")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "contestBetChampionBet",
					listenData = {
						activityId = bindHelper.self("yyid")
					},
					onNode = function (slot0)
						slot0:xy(590, 250)
					end
				}
			}
		}
	},
	["championBetPanel.textNote"] = {
		varname = "championTextState",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["championBetPanel.textTime"] = {
		varname = "championTextTime",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	}
}

function slot2.onCreate(slot0, slot1, slot2)
	slot0.tools = require("app.views.city.activity.contest_bet.tools")

	gGameModel.role:setYYCoin(slot1)
	slot0.tools.createTopui(slot0, slot1)

	slot0.yyid = slot1
	slot0.data = idlertable.new(slot2.view)
	slot0.talkIndex = 0

	slot0:initModel()
	slot0:initCompere()
	slot0:setCountdown()
	slot0:catTalk()
end

function slot2.setCountdown(slot0)
	slot1, slot2 = slot0.tools.getNextContestAndState(slot0.yyid)

	slot0.contestId:set(slot1)

	slot3 = slot0.state
	slot3 = slot3.set

	slot3(slot3, slot2)

	uv3 = "tools"

	if slot2 == slot3.OVER then
		return
	elseif slot1 == 0 then
		bind.extend(slot0, slot0.championTextTime, {
			class = "cutdown_label",
			props = {
				endTime = slot0.tools.getChampionBetDueStamp(slot0.yyid),
				endFunc = function ()
					uv1 = "performWithDelay"

					performWithDelay(slot1.textTime, function ()
						uv4 = "gGameApp"

						gGameApp:requestServer("/game/yy/contestbet/main", function (slot0)
							uv1 = "data"
							slot1 = slot1.data
							slot1 = slot1.set

							slot1(slot1, slot0.view)

							uv1 = "data"

							slot1:setCountdown()
						end, slot4.yyid)
					end, 3)
				end
			}
		})

		return
	end

	slot3 = slot0.tools.getCsv("contest")[slot1]
	slot4 = 0
	uv5 = "tools"

	if slot2 == slot5.BETTING then
		slot4 = time.getNumTimestamp(slot0.tools.getContestDate(slot0.yyid, slot3.contestDate), time.getHourAndMin(slot3.betEndTime, true))
	else
		uv5 = "tools"

		if slot2 == slot5.BATTLING then
			slot4 = time.getNumTimestamp(slot0.tools.getContestDate(slot0.yyid, slot3.contestDate), time.getHourAndMin(slot3.contestEndTime, true))
		end
	end

	bind.extend(slot0, slot0.textTime, {
		class = "cutdown_label",
		props = {
			endTime = slot4,
			endFunc = function ()
				uv1 = "performWithDelay"

				performWithDelay(slot1.textTime, function ()
					uv4 = "gGameApp"

					gGameApp:requestServer("/game/yy/contestbet/main", function (slot0)
						uv1 = "data"
						slot1 = slot1.data
						slot1 = slot1.set

						slot1(slot1, slot0.view)

						uv1 = "data"

						slot1:setCountdown()
					end, slot4.yyid)
				end, 3)
			end
		}
	})
end

function slot2.initCompere(slot0)
	slot0.compereSpine = widget.addAnimationByKey(slot0.comperePanel, "spine/contestbet/dandi.skel", "compereSpine", "effect_loop", 20)

	slot0.compereSpine:xy(275, -450)
	widget.addAnimationByKey(slot0:getResourceNode(), "spine/battlebet/caidai.skel", "caidaiSpine", "caidai_loop", 20):xy(slot0:getResourceNode():width() / 2, slot0:getResourceNode():height() / 2)
end

function slot2.initModel(slot0)
	slot0.state = idler.new()
	slot0.contestId = idler.new()

	idlereasy.when(slot0.state, function (slot0, slot1)
		uv2 = "CHAMPITION_BETTING"

		if slot1 == slot2.CHAMPITION_BETTING then
			uv2 = "rightPanel"
			slot2 = slot2.rightPanel
			slot2 = slot2.hide

			slot2(slot2)

			uv2 = "rightPanel"
			slot2 = slot2.overPanel
			slot2 = slot2.hide

			slot2(slot2)

			uv2 = "rightPanel"
			slot2 = slot2.infoPanel
			slot2 = slot2.hide

			slot2(slot2)

			uv2 = "rightPanel"
			slot2 = slot2.btnMain
			slot2 = slot2.hide

			slot2(slot2)

			uv2 = "rightPanel"
			slot2 = slot2.championBetPanel
			slot2 = slot2.show

			slot2(slot2)

			uv2 = "rightPanel"
			slot2 = slot2.rightPanel
			slot2 = slot2.show

			slot2(slot2)

			uv2 = "rightPanel"
			slot2 = slot2.bg:scale(3.2)
			slot2 = slot2.y

			slot2(slot2, 300)

			uv2 = "rightPanel"
			slot2 = slot2.imgdi:scale(1.65)
			slot2 = slot2.y

			slot2(slot2, 900)

			uv2 = "rightPanel"

			slot2.trophy:xy(display.sizeInView.width / 2 - 500, 750):scale(1)
		else
			uv2 = "CHAMPITION_BETTING"

			if slot1 == slot2.BETTING then
				uv2 = "rightPanel"
				slot2 = slot2.rightPanel
				slot2 = slot2.show

				slot2(slot2)

				uv2 = "rightPanel"
				slot2 = slot2.overPanel
				slot2 = slot2.hide

				slot2(slot2)

				uv2 = "rightPanel"
				slot2 = slot2.infoPanel
				slot2 = slot2.show

				slot2(slot2)

				uv2 = "rightPanel"
				slot2 = slot2.btnMain
				slot2 = slot2.show

				slot2(slot2)

				uv2 = "rightPanel"
				slot2 = slot2.comperePanel
				slot2 = slot2.show

				slot2(slot2)

				uv2 = "rightPanel"
				slot2 = slot2.textState
				slot2 = slot2.text

				slot2(slot2, gLanguageCsv.yyBetNotStart)

				uv2 = "rightPanel"
				slot2 = slot2.championBetPanel
				slot2 = slot2.hide

				slot2(slot2)

				uv2 = "rightPanel"
				slot2 = slot2.bg:scale(2)
				slot2 = slot2.y

				slot2(slot2, 720)

				uv2 = "rightPanel"
				slot2 = slot2.imgdi:scale(1)
				slot2 = slot2.y

				slot2(slot2, 1050)

				uv2 = "rightPanel"

				slot2.trophy:xy(display.sizeInView.width / 2 - 250, 950):scale(0.6)
			else
				uv2 = "CHAMPITION_BETTING"

				if slot1 == slot2.BATTLING then
					uv2 = "rightPanel"
					slot2 = slot2.rightPanel
					slot2 = slot2.show

					slot2(slot2)

					uv2 = "rightPanel"
					slot2 = slot2.btnMain
					slot2 = slot2.show

					slot2(slot2)

					uv2 = "rightPanel"
					slot2 = slot2.overPanel
					slot2 = slot2.hide

					slot2(slot2)

					uv2 = "rightPanel"
					slot2 = slot2.infoPanel
					slot2 = slot2.show

					slot2(slot2)

					uv2 = "rightPanel"
					slot2 = slot2.comperePanel
					slot2 = slot2.show

					slot2(slot2)

					uv2 = "rightPanel"
					slot2 = slot2.textState
					slot2 = slot2.text

					slot2(slot2, gLanguageCsv.yyBetBattling)

					uv2 = "rightPanel"
					slot2 = slot2.championBetPanel
					slot2 = slot2.hide

					slot2(slot2)

					uv2 = "rightPanel"
					slot2 = slot2.bg:scale(2)
					slot2 = slot2.y

					slot2(slot2, 720)

					uv2 = "rightPanel"
					slot2 = slot2.imgdi:scale(1)
					slot2 = slot2.y

					slot2(slot2, 1050)

					uv2 = "rightPanel"
					slot2 = slot2.comperePanel
					slot2 = slot2.y

					slot2(slot2, 1050)

					uv2 = "rightPanel"

					slot2.trophy:xy(display.sizeInView.width / 2 - 250, 950):scale(0.6)
				else
					uv2 = "CHAMPITION_BETTING"

					if slot1 == slot2.OVER then
						uv2 = "rightPanel"
						slot2 = slot2.rightPanel
						slot2 = slot2.hide

						slot2(slot2)

						uv2 = "rightPanel"
						slot2 = slot2.infoPanel
						slot2 = slot2.hide

						slot2(slot2)

						uv2 = "rightPanel"
						slot2 = slot2.btnMain
						slot2 = slot2.hide

						slot2(slot2)

						uv2 = "rightPanel"
						slot2 = slot2.overPanel
						slot2 = slot2.show

						slot2(slot2)

						uv2 = "rightPanel"
						slot2 = slot2.comperePanel
						slot2 = slot2.hide

						slot2(slot2)

						uv2 = "rightPanel"
						slot2 = slot2.textState
						slot2 = slot2.text

						slot2(slot2, gLanguageCsv.yyBetBattleEnd)

						uv2 = "rightPanel"
						slot2 = slot2.updateCaptain

						slot2(slot2, 0)

						uv2 = "rightPanel"
						slot2 = slot2.championBetPanel
						slot2 = slot2.hide

						slot2(slot2)

						uv2 = "rightPanel"
						slot2 = slot2.showOver

						slot2(slot2)

						uv2 = "rightPanel"
						slot2 = slot2.bg:scale(3.2)
						slot2 = slot2.y

						slot2(slot2, 300)

						uv2 = "rightPanel"
						slot2 = slot2.imgdi:scale(1.65)
						slot2 = slot2.y

						slot2(slot2, 900)

						uv2 = "rightPanel"

						slot2.trophy:xy(display.sizeInView.width / 2 - 200, 700):scale(1)
					end
				end
			end
		end
	end)
	idlereasy.when(slot0.contestId, function (slot0, slot1)
		if slot1 == nil or slot1 == 0 then
			uv2 = "updateCaptain"

			slot2:updateCaptain(0)

			return
		end

		uv2 = "updateCaptain"
		slot2 = slot2.updateTeamInfo

		slot2(slot2, slot1)

		uv2 = "updateCaptain"

		slot2:updateCaptain(slot1)
	end)
end

function slot2.showOver(slot0)
	for slot6, slot7 in ipairs(slot0.data:read().teams or {}) do
		slot8 = nil
		slot9 = 1
		slot10 = nil
		uv12 = "data"

		if slot7.round == slot12.Champion then
			slot8 = slot0.overPanel:get("winnerPanel")
			slot9 = 3
			slot10 = 100
		else
			uv12 = "data"

			if slot7.round == slot12.Finals then
				slot8 = slot0.overPanel:get("secondPanel")
				slot9 = 2
				slot10 = 50
			else
				uv12 = "data"

				if slot7.round == slot12.Third then
					slot8 = slot0.overPanel:get("thirdPanel")
					slot9 = 2
					slot10 = 50
				end
			end
		end

		if slot8 then
			slot11 = slot0.tools.getCsv("teams")[slot7.csv_id]

			slot8:get("name"):text(slot11.name)

			slot15 = dataEasy.getUnitCsv(slot0.tools.getCsv("cards")[slot11.team[slot11.captainID]].cardID, 0)

			widget.addAnimation(slot8:get("spine"), slot15.unitRes, "standby_loop", 11):scaleX(-slot9):scaleY(slot9):xy(slot8:get("spine"):width() / 2, slot10):setSkin(slot15.skin)
			text.addEffect(slot8:get("name"), {
				outline = {
					size = 4,
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			})
		end
	end
end

function slot2.updateTeamInfo(slot0, slot1)
	slot2 = slot0.data:read().contests
	slot3 = slot0.data:read().teams

	slot0.infoPanel:get("textNameL"):text(slot0.tools.getCsv("teams")[slot2[slot1].left_team].name)
	slot0.infoPanel:get("textNameR"):text(slot0.tools.getCsv("teams")[slot2[slot1].right_team].name)
end

function slot2.updateCaptain(slot0, slot1)
	slot0.spriteR:removeChildByName("sprite")
	slot0.spriteL:removeChildByName("sprite")

	if slot1 == 0 then
		slot0.spriteL:hide()
		slot0.spriteR:hide()

		return
	end

	slot0.spriteL:show()
	slot0.spriteR:show()

	slot2 = slot0.data:read().contests
	slot3 = slot2[slot1].left_team
	slot6 = slot0.tools.getCsv("cards")[slot0.tools.getCsv("teams")[slot3].team[slot0.tools.getCsv("teams")[slot3].captainID]].cardID
	slot7 = dataEasy.getUnitCsv(slot6, 0)
	slot9 = csv.unit[csv.cards[slot6].unitID]

	widget.addAnimation(slot0.spriteL, slot7.unitRes, "standby_loop", 11):scaleX(slot7.scale):scaleY(slot7.scale):xy(150, 0):z(0):name("sprite"):setSkin(slot7.skin)

	slot11 = slot2[slot1].right_team
	slot14 = slot0.tools.getCsv("cards")[slot0.tools.getCsv("teams")[slot11].team[slot0.tools.getCsv("teams")[slot11].captainID]].cardID
	slot15 = dataEasy.getUnitCsv(slot14, 0)
	slot17 = csv.unit[csv.cards[slot14].unitID]

	widget.addAnimation(slot0.spriteR, slot15.unitRes, "standby_loop", 11):scaleX(-slot15.scale):scaleY(slot15.scale):xy(150, 0):z(0):name("sprite"):setSkin(slot15.skin)
	slot0.spriteL:z(100)
	slot0.spriteR:z(100)
end

function slot2.onChampitionBet(slot0)
	gGameUI:stackUI("city.activity.contest_bet.champion_bet_view", nil, , slot0.yyid, slot0.data:read().teams)
end

function slot2.onMain(slot0)
	gGameApp:requestServer("/game/yy/contestbet/contest", function (slot0)
		uv6 = "gGameUI"
		uv8 = "gGameUI"
		uv11 = "stackUI"

		gGameUI:stackUI("city.activity.contest_bet.bet_view", nil, {
			full = true
		}, slot6.yyid, slot0.view, slot8:createHandler("getWiner", slot11))
	end, slot0.yyid, slot0.contestId:read())
end

function slot2.onBet(slot0)
	slot2 = slot0.data:read().rank or 0

	if slot1.rank ~= 0 then
		slot3 = slot1.total - 1
	else
		slot2 = slot1.total
	end

	gGameUI:stackUI("city.activity.contest_bet.record", nil, {
		clickClose = true
	}, slot0.yyid, slot3 <= 0 and 0 or math.floor((slot1.total - slot2) / slot3 * 100), slot0:createHandler("getData"))
end

function slot2.onShop(slot0)
	gGameUI:stackUI("city.activity.contest_bet.shop", nil, {
		full = true
	}, slot0.yyid)
end

function slot2.onRank(slot0)
	gGameApp:requestServer("/game/yy/contestbet/rank", function (slot0)
		uv7 = "gGameUI"

		gGameUI:stackUI("city.activity.yy_bet.rank", nil, , slot0.view, slot7.yyid)
	end, slot0.yyid)
end

function slot2.onAward(slot0)
	gGameUI:stackUI("city.activity.contest_bet.award", nil, , slot0.yyid)
end

function slot2.onContest(slot0)
	gGameUI:stackUI("city.activity.contest_bet.schedule", nil, , slot0.yyid, slot0.data:read())
end

function slot2.onRule(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1500
	})
end

function slot2.getRuleContext(slot0, slot1)
	slot2 = adaptContext
	slot3 = {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.rules)
		end),
		slot2.noteText(127051, 127100),
		slot2.noteText(103)
	}

	for slot12, slot13 in orderCsvPairs(slot0.tools.getCsv("base")[(csv.yunying.yyhuodong[slot0.yyid].paramMap or {}).base].championBetAwards) do
		-- Nothing
	end

	for slot12, slot13 in ipairs({
		[7 - slot12] = slot13
	}) do
		table.insert(slot3, slot2.clone(slot1.awardItem, function (slot0)
			slot4 = "list"
			slot1 = slot0:multiget("text", slot4)
			slot2 = slot1.text
			slot3 = slot2
			uv4 = "multiget"
			uv5 = "text"

			slot2.text(slot3, slot4[slot5])

			uv3 = "list"
			uv5 = "uiEasy"

			uiEasy.createItemsToList(slot3, slot1.list, slot5)
		end))
	end

	return slot3
end

function slot2.onGet(slot0)
	gGameUI:stackUI("city.activity.contest_bet.prompt_box", nil, , slot0.yyid)
end

function slot2.onClose(slot0)
	slot1 = require("app.views.city.activity.contest_bet.champion_bet_view")
	slot2 = slot1.cleanCache

	slot2(slot1)

	uv2 = "require"

	slot2.onClose(slot0)
end

return slot2
