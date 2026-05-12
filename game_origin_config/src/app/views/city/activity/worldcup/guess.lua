slot0 = {
	{
		left = 1,
		right = 48,
		text = gLanguageCsv.worldcupGroupStage
	},
	{
		left = 49,
		right = 56,
		text = gLanguageCsv.worldcupGroupEight
	},
	{
		left = 57,
		right = 60,
		text = gLanguageCsv.worldcupGroupFour
	},
	{
		left = 61,
		right = 62,
		text = gLanguageCsv.worldcupGroupTwo
	},
	{
		left = 63,
		right = 63,
		text = gLanguageCsv.worldcupGroupThird
	},
	{
		left = 64,
		right = 64,
		text = gLanguageCsv.worldcupGroupFinal
	}
}
slot1 = {
	ALL = 2,
	SINGLE = 1
}
slot2 = {
	SCORE = 2,
	WDL = 1
}
slot3 = require("app.views.city.activity.worldcup.tools")
slot4 = class("WorldCupGuessView", Dialog)
slot4.RESOURCE_FILENAME = "worldcup_guess.json"
slot4.RESOURCE_BINDING = {
	["leftPanel.item"] = "leftItem",
	subList = "sublist",
	item = "item",
	noData = "noData",
	bg = "bg",
	leftPanel = "leftPanel",
	["leftPanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("tabDatas"),
				item = bindHelper.self("leftItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()

						slot6 = slot1:get("selected"):show()
					else
						slot5:hide()

						slot6 = slot4:show()
					end

					bind.extend(slot0, slot6, {
						class = "red_hint",
						props = {
							state = slot3.select ~= true,
							specialTag = slot2 == 1 and "wordcupGuessGroup" or "wordcupGuessFinal",
							onNode = function (slot0)
								slot0:xy(100, 250)
							end
						}
					})
					adapt.setAutoText(slot6:get("txt"), slot3.name, slot6:size().height - 40)
					slot5:setTouchEnabled(false)
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onTabClick")
			}
		}
	},
	list = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				yMargin = -20,
				columnSize = 2,
				xMargin = 30,
				leftPadding = 5,
				data = bindHelper.self("guessDatas"),
				item = bindHelper.self("sublist"),
				cell = bindHelper.self("item"),
				dataOrderCmp = function (slot0, slot1)
					return (slot0[1] and slot0[1].matchId or slot0[2].matchId) < (slot1[1] and slot1[1].matchId or slot1[2].matchId)
				end,
				itemAction = {
					isAction = false
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot0:getIdx(slot2)
					slot5 = slot1:multiget("title", "hot", "icon1", "team1", "icon2", "vs", "team2", "item", "list")
					slot7 = csv.yunying.worldcup_match[slot3[1] and slot3[1].matchId or slot3[2].matchId]
					slot8 = csv.yunying.worldcup_team[slot7.team1]
					slot9 = csv.yunying.worldcup_team[slot7.team2]
					uv11 = "getIdx"

					for slot13, slot14 in ipairs(slot11) do
						if slot14.left <= slot6 and slot6 <= slot14.right then
							slot5.title:text(slot14.text)

							if slot6 < 49 then
								slot5.title:text(string.format(gLanguageCsv.worldcupGroup, string.char(string.byte("A") - 1 + slot8.group)))
							end

							break
						end
					end

					slot5.team1:text(slot8.teamNameAbbr)
					slot5.icon1:get("icon"):texture(slot8.teamIcon)
					slot5.team2:text(slot9.teamNameAbbr)
					slot5.icon2:get("icon"):texture(slot9.teamIcon)
					slot5.hot:visible(slot7.focus == 1)
					adapt.setTextAdaptWithSize(slot5.team1, {
						margin = -5,
						vertical = "center",
						maxLine = 2,
						horizontal = "center",
						size = cc.size(110, 120)
					})
					adapt.setTextAdaptWithSize(slot5.team2, {
						margin = -5,
						vertical = "center",
						maxLine = 2,
						horizontal = "center",
						size = cc.size(110, 120)
					})
					bind.extend(slot0, slot5.list, {
						class = "listview",
						props = {
							margin = 30,
							data = slot3,
							item = slot5.item,
							itemAction = {
								isAction = false
							},
							onItem = function (slot0, slot1, slot2, slot3)
								slot1:multiget("bg", "titleBg", "title", "icon", "failure").title:text(slot3.type == 1 and gLanguageCsv.worldcupTeamGuessWdl or gLanguageCsv.worldcupTeamGuessScore)
								slot4.failure:hide()
								slot4.icon:hide()
								slot1:setTouchEnabled(slot3.get == 1)

								if slot3.type == 1 then
									if not slot3.notjoin then
										slot4.icon:show()

										if slot3.guess then
											slot4.icon:texture(slot3.get == 1 and "common/icon/icon_box3.png" or "common/icon/icon_box3_open.png")
										else
											slot4.icon:texture(slot3.get == 1 and "common/icon/icon_box1.png" or "common/icon/icon_box1_open.png")
										end
									else
										slot4.failure:texture("activity/world_cup/notjoin.png"):show()
										slot1:setTouchEnabled(false)
									end
								elseif not slot3.notjoin then
									if slot3.guess then
										slot4.icon:show()
										slot4.icon:texture(slot3.get == 1 and "common/icon/icon_box3.png" or "common/icon/icon_box3_open.png")
									else
										slot4.failure:show()
										slot1:setTouchEnabled(false)
									end
								else
									slot4.failure:texture("activity/world_cup/notjoin.png"):show()
									slot1:setTouchEnabled(false)
								end

								uv6 = "multiget"
								uv11 = "multiget"

								bind.touch(slot6, slot1, {
									methods = {
										ended = functools.partial(slot11.clickCell, slot2, slot3)
									}
								})
							end,
							onAfterBuild = function (slot0)
								uv1 = "focus"

								if slot1.focus == 0 then
									slot0:x(slot0:x() + 200)
								end
							end
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onCellClick")
			}
		}
	},
	btnOnekey = {
		varname = "btnOnekey",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onOnekeyClick")
			}
		}
	},
	["topPanel.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot4.onCreate(slot0, slot1)
	slot0:initModel()

	slot0.activityId = slot1

	idlereasy.when(slot0.worldCupdata, function ()
		uv0 = "initDatas"
		uv2 = "initDatas"

		slot0:initDatas(slot2.showTab:read())
	end)
	adapt.setTextScaleWithWidth(slot0.noData:get("txt"), nil, 500)
	Dialog.onCreate(slot0)
end

function slot4.initModel(slot0)
	slot0.worldCupdata = gGameModel.role:getIdler("worldcup")
	slot0.guessDatas = idlers.newWithMap({})
	slot0.tabDatas = idlers.newWithMap({
		{
			name = gLanguageCsv.worldcupGroupStage
		},
		{
			name = gLanguageCsv.worldcupGroupFinal
		}
	})
	slot0.showTab = idler.new(1)

	slot0.showTab:addListener(function (slot0, slot1)
		uv2 = "initDatas"
		slot2 = slot2.initDatas

		slot2(slot2, slot0)

		uv2 = "initDatas"
		slot2 = slot2.tabDatas:atproxy(slot1)
		slot2.select = false
		uv2 = "initDatas"
		slot2.tabDatas:atproxy(slot0).select = true
	end)
end

function slot4.onTabClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

function slot4.isCurTabMatch(slot0, slot1, slot2)
	if slot1 == 1 then
		uv3 = "right"

		return slot2 <= slot3[1].right
	end

	uv3 = "right"

	return slot3[1].right < slot2
end

function slot4.updateWdlMatchData(slot0, slot1, slot2, slot3)
	slot5 = slot0.worldCupdata:read().awards
	slot6 = slot0.worldCupdata:read().bet_score

	for slot10, slot11 in pairs(slot0.worldCupdata:read().bet_wdl) do
		if slot0:isCurTabMatch(slot3, slot10) then
			uv12 = "worldCupdata"

			if slot12.guessPointResult(slot10) ~= nil then
				uv13 = "read"

				if slot5[slot13.WDL] then
					uv13 = "read"
					slot13 = slot5[slot13.WDL][slot10]
				end

				slot14 = csv.yunying.worldcup_match[slot10]
				slot15 = slot12 ~= "wrong"

				if slot13 ~= 0 then
					slot16.gold = (csvClone(slot15 and slot14.betWDLAwards or slot14.betWrong).gold or 0) + slot14.bet * slot14.odds[slot12]
					slot1[slot10] = slot1[slot10] or {}
					uv18 = "read"
					uv20 = "read"
					slot1[slot10][slot18.WDL] = {
						type = slot20.WDL,
						guess = slot15,
						award = slot16,
						matchId = slot10
					}
				end

				slot2[slot10] = slot2[slot10] or {}
				uv17 = "read"
				uv19 = "read"
				slot2[slot10][slot17.WDL] = {
					type = slot19.WDL,
					guess = slot15,
					get = slot13 or 1,
					matchId = slot10
				}

				if slot14.focus == 1 and not slot6[slot10] then
					uv18 = "read"
					uv20 = "read"
					slot2[slot10][slot18.SCORE] = {
						notjoin = true,
						type = slot20.SCORE
					}
				end
			end
		end
	end
end

function slot4.updateScoreMatchData(slot0, slot1, slot2, slot3)
	slot4 = slot0.worldCupdata:read().bet_wdl
	slot5 = slot0.worldCupdata:read().awards

	for slot10, slot11 in pairs(slot0.worldCupdata:read().bet_score) do
		if slot0:isCurTabMatch(slot3, slot10) then
			uv12 = "worldCupdata"

			if slot12.guessScoreResult(slot10) ~= nil then
				uv13 = "read"

				if slot5[slot13.SCORE] then
					uv13 = "read"
					slot13 = slot5[slot13.SCORE][slot10]
				end

				slot14 = slot12

				if slot13 ~= 0 and slot14 then
					slot1[slot10] = slot1[slot10] or {}
					uv17 = "read"
					uv19 = "read"
					slot1[slot10][slot17.SCORE] = {
						type = slot19.SCORE,
						guess = slot14,
						award = csv.yunying.worldcup_match[slot10].betScoreAwards,
						matchId = slot10
					}
				end

				slot2[slot10] = slot2[slot10] or {}
				uv16 = "read"
				uv18 = "read"
				slot2[slot10][slot16.SCORE] = {
					type = slot18.SCORE,
					guess = slot14,
					get = slot13 or 1,
					matchId = slot10
				}

				if not slot4[slot10] then
					uv16 = "read"
					uv18 = "read"
					slot2[slot10][slot16.WDL] = {
						notjoin = true,
						type = slot18.WDL
					}
				end
			end
		end
	end
end

function slot4.initDatas(slot0, slot1)
	slot2 = {}
	slot3 = {}

	slot0:updateWdlMatchData(slot3, slot2, slot1)
	slot0:updateScoreMatchData(slot3, slot2, slot1)
	uiEasy.setBtnShader(slot0.btnOnekey, slot0.btnOnekey:get("txt"), itertools.isempty(slot3) and 2 or 1)

	slot0.onekeyDatas = slot3

	slot0.guessDatas:update(slot2)

	slot4 = itertools.isempty(slot2)

	slot0.noData:visible(slot4)
	slot0.bg:get("bg1"):visible(not slot4)
	slot0.btnOnekey:visible(not slot4)
end

function slot4.onCellClick(slot0, slot1, slot2, slot3)
	gGameApp:requestServer("/game/yy/worldcup/award", function (slot0)
		uv7 = "gGameUI"
		slot7 = slot0.view.result
		uv7 = "stackUI"

		gGameUI:stackUI("city.activity.worldcup.show", nil, , {
			data = slot7,
			award = slot7,
			type = slot7.SINGLE
		})
	end, slot3.matchId, slot3.type)
end

function slot4.onOnekeyClick(slot0)
	slot1 = slot0.onekeyDatas

	gGameApp:requestServer("/game/yy/worldcup/award/get/onekey", function (slot0)
		uv7 = "gGameUI"
		uv7 = "stackUI"

		gGameUI:stackUI("city.activity.worldcup.show", nil, , {
			data = slot7,
			type = slot7.ALL
		})
	end, slot0.showTab:read())
end

return slot4
