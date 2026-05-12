slot1 = class("WorldCupMainView", cc.load("mvc").ViewBase)
slot2 = require("app.views.city.activity.worldcup.tools")
slot3 = 100
slot5 = {
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
slot6 = {
	notStart = 1,
	watch = 3,
	notBet = 4,
	bet = 2
}
slot7 = "activity/world_cup/flag/none.png"
slot1.RESOURCE_FILENAME = "worldcup_main.json"
slot1.RESOURCE_BINDING = {
	["rightPanel.tips"] = "tips",
	["downPanel.btnChampionCalculate.txtCountDown"] = "txtCountDown",
	["leftPanel.leftItem"] = "leftItem",
	cutDownPanel = "cutDownPanel",
	["rightPanel.itemPanel"] = "itemPanel",
	["rightPanel.itemPanel.rightInfoItem"] = "rightInfoItem",
	["rightPanel.itemPanel.rightTabItem"] = "rightTabItem",
	btnToday = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onTodayClick")
			}
		}
	},
	["leftPanel.leftList"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 50,
				data = bindHelper.self("leftDatas"),
				item = bindHelper.self("leftItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()

						slot6 = slot1:get("select"):show()
					else
						slot5:hide()

						slot6 = slot4:show()
					end

					slot6:get("txt"):text(slot3.name)
					adapt.setTextScaleWithWidth(slot6:get("txt"), nil, 200)
					slot5:setTouchEnabled(false)
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onLeftItemClick")
			}
		}
	},
	["rightPanel.rightList"] = {
		varname = "rightList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("rightData"),
				item = bindHelper.self("itemPanel"),
				margin = 20,
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot3.cfg

					slot1:get("rightInfoItem"):hide()
					slot1:get("rightTabItem"):hide()

					if slot3.isTitle then
						slot6:show()

						slot7 = slot6:multiget("date", "isToday")

						slot7.date:text(slot3.date)

						slot10 = slot3.isToday

						slot7.isToday:visible(slot10)

						uv10 = "cfg"

						slot1:height(slot10)
						slot6:y(slot1:height() / 2)
					else
						slot7 = slot4.focus == 1

						slot5:show()

						slot8 = slot5:multiget("group", "hot", "majorTeam", "imgVS", "score", "startTimeTips", "oppoTeam", "btnBet", "imgScoreBg", "startTimeBg", "groupBg")
						slot10 = csv.yunying.worldcup_team[slot4.team2]

						slot8.majorTeam:get("imgResult"):hide()
						slot8.oppoTeam:get("imgResult"):hide()

						if csv.yunying.worldcup_team[slot4.team1] then
							slot8.majorTeam:get("name"):text(slot9.teamName)
							slot8.majorTeam:get("flag"):texture(slot9.teamIcon)
						else
							slot8.majorTeam:get("name"):text(gLanguageCsv.worldcupNoTeam)

							slot13 = "flag"
							uv13 = "get"

							slot8.majorTeam:get(slot13):texture(slot13)
						end

						if slot10 then
							slot8.oppoTeam:get("name"):text(slot10.teamName)
							slot8.oppoTeam:get("flag"):texture(slot10.teamIcon)
						else
							slot8.oppoTeam:get("name"):text(gLanguageCsv.worldcupNoTeam)

							slot13 = "flag"
							uv13 = "get"

							slot8.oppoTeam:get(slot13):texture(slot13)
						end

						adapt.setTextScaleWithWidth(slot8.majorTeam:get("name"), nil, 300)
						adapt.setTextScaleWithWidth(slot8.oppoTeam:get("name"), nil, 300)
						text.addEffect(slot8.majorTeam:get("name"), {
							outline = {
								color = cc.c4b(41, 113, 195, 255)
							}
						})
						text.addEffect(slot8.oppoTeam:get("name"), {
							outline = {
								color = cc.c4b(195, 41, 41, 255)
							}
						})
						slot8.hot:visible(slot4.focus == 1)

						uv12 = "rightInfoItem"

						for slot14, slot15 in ipairs(slot12) do
							if slot15.left <= slot3.id and slot3.id <= slot15.right then
								slot8.group:text(slot15.text)

								if slot3.id < 49 then
									slot8.group:text(string.format(gLanguageCsv.worldcupGroup, string.char(string.byte("A") - 1 + slot9.group)))
								end

								break
							end
						end

						adapt.setTextScaleWithWidth(slot8.group, nil, 130)
						slot8.imgScoreBg:hide()

						if slot3.hasGaming then
							slot8.imgVS:show()
							slot8.startTimeTips:hide()

							if slot4.point ~= "" then
								slot8.imgVS:hide()
								slot8.imgScoreBg:show()

								slot11 = string.split(slot4.point, ":")

								if tonumber(slot11[2]) < tonumber(slot11[1]) then
									slot8.majorTeam:get("imgResult"):show()
								elseif slot12 == slot13 then
									slot8.majorTeam:get("imgResult"):hide()
									slot8.oppoTeam:get("imgResult"):hide()
								else
									slot8.oppoTeam:get("imgResult"):show()
								end

								slot8.imgScoreBg:scaleX(1.4)
								bind.extend(slot0, slot8.score:get("score1"), {
									class = "text_atlas",
									props = {
										isEqualDist = true,
										align = "center",
										pathName = "worldcup",
										data = slot11[1],
										onNode = function (slot0)
											slot0:scaleX(0.8)
										end
									}
								})
								bind.extend(slot0, slot8.score:get("maohao"), {
									class = "text_atlas",
									props = {
										isEqualDist = true,
										data = ":",
										pathName = "worldcup",
										align = "center",
										onNode = function (slot0)
											slot0:scaleX(0.8)
										end
									}
								})
								bind.extend(slot0, slot8.score:get("score2"), {
									class = "text_atlas",
									props = {
										isEqualDist = true,
										align = "center",
										pathName = "worldcup",
										data = slot11[2],
										onNode = function (slot0)
											slot0:scaleX(0.8)
										end
									}
								})
							end
						else
							slot8.startTimeTips:text(slot3.showTime):show()
							slot8.startTimeBg:show()
							slot8.score:hide()
							slot8.imgScoreBg:hide()
							slot8.imgVS:show()
						end

						uv12 = "rightTabItem"

						if slot3.betState == slot12.notStart then
							slot8.btnBet:get("txt"):text(gLanguageCsv.worldcupNotStart)
						else
							uv12 = "rightTabItem"

							if slot3.betState == slot12.bet then
								slot8.btnBet:get("txt"):text(gLanguageCsv.worldcupBet)
							else
								uv12 = "rightTabItem"

								if slot3.betState == slot12.watch then
									slot8.btnBet:get("txt"):text(gLanguageCsv.worldcupBetWatch)
								else
									uv12 = "rightTabItem"

									if slot3.betState == slot12.notBet then
										slot8.btnBet:get("txt"):text(gLanguageCsv.worldcupBetNotJoin)
										uiEasy.setBtnShader(slot8.btnBet, slot8.btnBet:get("txt"), 3)
									end
								end
							end
						end

						adapt.setTextScaleWithWidth(slot8.btnBet:get("txt"), nil, 180)
						bind.extend(slot0, slot8.btnBet, {
							class = "red_hint",
							props = {
								specialTag = "worldcupItemBet",
								listenData = {
									id = slot3.id
								}
							}
						})
						bind.touch(slot0, slot8.majorTeam, {
							methods = {
								ended = functools.partial(slot0.clickTeam, 1, slot3)
							}
						})
						bind.touch(slot0, slot8.oppoTeam, {
							methods = {
								ended = functools.partial(slot0.clickTeam, 2, slot3)
							}
						})
						bind.touch(slot0, slot8.btnBet, {
							methods = {
								ended = functools.partial(slot0.clickBet, slot3)
							}
						})
					end
				end
			},
			handlers = {
				clickTeam = bindHelper.self("onTeamInfoClick"),
				clickBet = bindHelper.self("onBetClick")
			}
		}
	},
	["downPanel.btnRule"] = {
		varname = "btnRule",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRuleClick")
			}
		}
	},
	["downPanel.btnRacingChart"] = {
		varname = "btnRacingChart",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRacingChartClick")
			}
		}
	},
	["downPanel.btnRank"] = {
		varname = "btnRank",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRankClick")
			}
		}
	},
	["downPanel.btnAchievement"] = {
		varname = "btnAchievement",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onAchievementClick")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "wordcupAchievement"
				}
			}
		}
	},
	["downPanel.btnAwardBox"] = {
		varname = "btnAwardBox",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onAwardBoxClick")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "wordcupGuess"
				}
			}
		}
	},
	["downPanel.btnExchange"] = {
		varname = "btnExchange",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onExchangeClick")
			}
		}
	},
	["downPanel.btnChampionCalculate"] = {
		varname = "btnChampionCalculate",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChampionCalculateClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.activityID = slot1

	slot0:enableSchedule()

	slot0.topView = gGameUI.topuiManager:createView("worldcup", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "WORLDCUP",
		title = gLanguageCsv.worldcup
	})
	slot0.leftDatas = idlers.newWithMap({
		{
			name = gLanguageCsv.worldcupGroupStage
		},
		{
			name = gLanguageCsv.worldcupElimation
		},
		{
			name = gLanguageCsv.worldcupFinals
		}
	})

	slot0.tips:text(gLanguageCsv.worldcupMainTips)

	slot0.rightData = idlers.new()
	slot0.showTab = idler.new(1)
	slot0.worldCup = gGameModel.role:getIdler("worldcup")

	slot0:initData()
	slot0:initScrollList()
	slot0:activityOverCutDown()
	slot0.showTab:addListener(function (slot0, slot1)
		uv2 = "leftDatas"
		slot2 = slot2.leftDatas:atproxy(slot1)
		slot2.select = false
		uv2 = "leftDatas"
		slot2.leftDatas:atproxy(slot0).select = true
	end)
	idlereasy.when(slot0.worldCup, function ()
		uv0 = "refreshPredictBtnStatus"

		slot0:refreshPredictBtnStatus()
	end)
	performWithDelay(slot0, function ()
		uv0 = "onTodayClick"

		slot0:onTodayClick(true)
	end, 0.1)

	slot2 = ccui.Layout:create():size(200, 200):anchorPoint(0.5, 0.5):xy(slot0.btnChampionCalculate:x() - 400, slot0.btnChampionCalculate:y() + 10):addTo(slot0.btnChampionCalculate:parent(), 3)

	ccui.ImageView:create("activity/world_cup/icon_sjbjl.png"):scale(1.7):alignCenter(slot2:size()):addTo(slot2, 1, "icon")
	widget.addAnimationByKey(slot2, "effect/jiedianjiangli.skel", "effect", "effect_loop", -1):alignCenter(slot2:size()):y(slot2:height() / 2 - 100)
	slot2:setTouchEnabled(true)
	bind.touch(slot0, slot2, {
		methods = {
			ended = functools.partial(slot0.onLoginWealClick, slot0)
		}
	})

	slot0.loginWealCsvId = idler.new()
	slot0.yyOpen = gGameModel.role:getIdler("yy_open")
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")

	idlereasy.any({
		slot0.yyOpen,
		slot0.yyhuodongs
	}, function (slot0, slot1, slot2)
		for slot6, slot7 in ipairs(slot1) do
			slot8 = csv.yunying.yyhuodong[slot7]

			if slot8.type == game.YYHUODONG_TYPE_ENUM_TABLE.loginWeal and slot8.independent == -1 and slot8.clientParam.type == "worldcup" then
				slot10 = nil
				slot12 = pairs

				for slot15, slot16 in slot12((slot2[slot7] or {}).stamps or {}) do
					if slot16 > 0 and (not slot10 or slot15 < slot10) then
						slot10 = slot15
					end
				end

				uv12 = "ipairs"
				slot12.loginWealYYID = slot7
				uv12 = "ipairs"
				slot12 = slot12.loginWealCsvId
				slot12 = slot12.set

				slot12(slot12, slot10)

				uv12 = "csv"

				slot12:show()

				return
			end
		end

		uv3 = "ipairs"
		slot3 = slot3.loginWealCsvId
		slot3 = slot3.set

		slot3(slot3)

		uv3 = "csv"

		slot3:hide()
	end)
	idlereasy.when(slot0.loginWealCsvId, function (slot0, slot1)
		uv2 = "get"
		slot2 = slot2:get("effect")
		slot3 = slot2
		slot4 = slot1 ~= nil

		slot2.visible(slot3, slot4)

		uv3 = "effect"
		uv4 = "get"

		uiEasy.addVibrateToNode(slot3, slot4, slot1 ~= nil, "loginWeal")
	end)
	audio.playMusic("yyhuodong/worldcup.mp3")
end

function slot1.onCleanup(slot0)
	slot2 = audio.playMusic

	slot2(csv.citysound[userDefault.getForeverLocalKey("musicIdx", 1)].path)

	uv2 = "userDefault"

	slot2.onCleanup(slot0)
end

function slot1.onLoginWealClick(slot0)
	if not slot0.loginWealCsvId:read() then
		gGameUI:showTip(gLanguageCsv.noGiftsToReceiveNow)

		return
	end

	gGameApp:requestServer("/game/yy/award/get", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.loginWealYYID, slot1)
end

function slot1.getData(slot0, slot1)
	slot3 = csv.yunying.worldcup_match[slot1]
	slot4 = false
	slot5 = false
	slot6, slot7 = nil

	if slot0.worldCup:read().bet_wdl and slot2.bet_wdl[slot1] then
		slot6 = slot2.bet_wdl[slot1]
		slot4 = true
	end

	if slot2.bet_score and slot2.bet_score[slot1] then
		slot7 = slot2.bet_score[slot1]
		slot5 = true
	end

	slot8 = {
		id = slot1,
		cfg = slot3,
		isBetted = slot4,
		isScoreBetted = slot5,
		betResult = slot6,
		betScoreResult = slot7,
		betState = slot0:getBetState(slot8)
	}

	return slot8
end

function slot1.initData(slot0)
	slot2 = slot0.activityID
	slot1 = csv.yunying.yyhuodong[slot2]
	uv2 = "csv"
	slot0.championTimeEndStamp = slot2.getCurTimeStamp(slot1.paramMap.championBetEndDate, slot1.paramMap.championBetEndTime)

	slot0:schedule(function ()
		uv1 = "math"
		slot1 = slot1.championTimeEndStamp - time.getTime()
		slot0 = math.max(slot1, 0)
		uv1 = "math"

		slot1.txtCountDown:text(time.getCutDown(slot0).str)

		if slot0 <= 0 then
			uv1 = "math"

			slot1.txtCountDown:text(gLanguageCsv.worldcupPredictOver)

			return false
		end
	end, 1, 0, "championBetCutDown")

	slot2 = time.getTime()
	slot3 = slot0.rightInfoItem:height()
	slot4 = time.getNowDate()
	slot5 = string.formatex(gLanguageCsv.timeMonthDay, {
		month = slot4.month,
		day = slot4.day
	})
	slot8 = {}
	slot9 = 0

	for slot13, slot14 in orderCsvPairs(csv.yunying.worldcup_match) do
		slot15 = slot14.startDate
		slot16 = slot14.startTime
		uv17 = "csv"
		slot18 = time.getDate(slot17.getCurTimeStamp(slot14.startDate, slot14.startTime))
		slot19 = string.formatex(gLanguageCsv.timeMonthDay, {
			month = slot18.month,
			day = slot18.day
		})
		slot20 = string.format(gLanguageCsv.worldcupStartHour, slot18.hour, slot18.min)

		if not nil and slot2 < slot17 then
			slot6 = slot17
		end

		if slot7 ~= slot19 then
			table.insert(slot8, {
				id = slot13,
				dy = slot9,
				isTitle = slot21,
				isToday = slot5 == slot19,
				date = slot19
			})
		end

		if slot21 then
			uv22 = "yunying"
			uv23 = "yyhuodong"

			if not (slot22 + slot23) then
				slot22 = 0
			end
		end

		slot0:getData(slot13).dy = slot9 + slot22
		slot22.hasGaming = slot17 <= slot2
		slot22.showTime = slot20
		slot24 = slot8

		table.insert(slot24, slot22)

		uv24 = "yyhuodong"
		slot9 = slot9 + slot3 + slot24
		slot7 = slot19
	end

	dataEasy.tryCallFunc(slot0.rightList, "updatePreloadCenterIndex")
	slot0.rightData:update(slot8)
	slot0:initTabInListPos()

	if slot6 then
		slot0:schedule(function ()
			uv1 = "math"

			if math.max(slot1 - time.getTime(), 0) == 0 then
				uv2 = "max"

				performWithDelay(slot2, function ()
					uv0 = "initData"

					slot0:initData()
				end, 0)

				return false
			end
		end, 1, 1, "stayCutDown")
	end
end

function slot1.getBetState(slot0, slot1)
	slot2 = slot1.cfg
	uv4 = "cfg"

	if time.getTime() < slot4.getCurTimeStamp(slot2.betStartDate, slot2.betStartTime) then
		uv3 = "time"

		return slot3.notStart
	end

	slot3 = slot2.focus == 1
	uv5 = "cfg"

	if slot5.getCurTimeStamp(slot2.betEndDate, slot2.betEndTime) <= time.getTime() then
		if not slot3 and not slot1.isBetted then
			uv4 = "time"

			return slot4.notBet
		end

		if slot3 and not slot1.isBetted and not slot1.isScoreBetted then
			uv4 = "time"

			return slot4.notBet
		end

		uv4 = "time"

		return slot4.watch
	end

	if not slot3 then
		if slot1.isBetted then
			uv4 = "time"

			return slot4.watch
		else
			uv4 = "time"

			return slot4.bet
		end
	elseif slot1.isBetted and slot1.isScoreBetted then
		uv4 = "time"

		return slot4.watch
	else
		uv4 = "time"

		return slot4.bet
	end
end

function slot1.initTabInListPos(slot0)
	slot1 = slot0.rightInfoItem:height()
	slot2 = slot0.rightList:height()
	slot0.tabYPos = {
		0
	}

	for slot6, slot7 in slot0.rightData:pairs() do
		if slot7:read().id == 49 and #slot0.tabYPos == 1 then
			table.insert(slot0.tabYPos, slot8.dy)
		end

		if slot9 == 64 and #slot0.tabYPos == 2 then
			table.insert(slot0.tabYPos, slot8.dy - slot2 - 20)
		end
	end
end

function slot1.initScrollList(slot0)
	function slot1(slot0)
		uv2 = "ipairs"

		for slot4, slot5 in ipairs(slot2.tabYPos) do
			if slot0 < slot5 then
				uv6 = "ipairs"

				slot6.showTab:set(math.max(1, slot4 - 1))

				return
			end
		end

		uv1 = "ipairs"
		uv3 = "ipairs"

		slot1.showTab:set(#slot3.tabYPos)
	end

	slot0.rightList:onScroll(function (slot0)
		if slot0.name == "CONTAINER_MOVED" then
			uv1 = "name"
			slot1 = slot1.rightList:getInnerContainer()
			slot2 = slot1
			uv2 = "name"
			slot2 = slot2.rightList:height()
			uv2 = "name"
			slot2 = slot2.rightList:getInnerContainer():y()
			uv2 = "CONTAINER_MOVED"

			slot2(slot1.height(slot2) - slot2 + slot2)
		end
	end)
end

function slot1.onLeftItemClick(slot0, slot1, slot2)
	slot0.rightList:jumpToPercentVertical(cc.clampf(slot0.tabYPos[slot2] / (slot0.rightList:getInnerContainer():height() - slot0.rightList:height()) * 100, 0, 100))
	slot0.showTab:set(slot2)
end

function slot1.onTeamInfoClick(slot0, slot1, slot2, slot3)
	slot4 = nil

	if not ((slot2 ~= 1 or csv.yunying.worldcup_team[slot3.cfg.team1]) and csv.yunying.worldcup_team[slot3.cfg.team2]) then
		gGameUI:showTip(gLanguageCsv.worldcupNoTeamInfo)

		return
	end

	gGameUI:stackUI("city.activity.worldcup.team_info", nil, , slot4)
end

function slot1.onBetClick(slot0, slot1, slot2)
	uv4 = "betState"

	if slot2.betState == slot4.notStart then
		uv3 = "notStart"
		slot4 = time.getDate(slot3.getCurTimeStamp(slot2.cfg.betStartDate, slot2.cfg.betStartTime))

		gGameUI:showTip(string.format(gLanguageCsv.worldcupBetNotStart, slot4.month, slot4.day, slot4.hour, slot4.min))

		return
	end

	uv4 = "betState"

	if slot2.betState == slot4.notBet then
		gGameUI:showTip(gLanguageCsv.worldcupBetMiss)

		return
	end

	if slot2.cfg.team1 == 0 or slot2.cfg.team2 == 0 then
		gGameUI:showTip(gLanguageCsv.worldcupNoTeamInfo)

		return
	end

	gGameUI:stackUI("city.activity.worldcup.bet", nil, , slot2.id, slot0:createHandler("refreshBetStatus"))
end

function slot1.onRuleClick(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1500
	})
end

function slot1.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.rules)
		end),
		slot2.noteText(128701, 128800)
	}
end

function slot1.onTodayClick(slot0, slot1)
	for slot5, slot6 in slot0.rightData:pairs() do
		if slot6:read().isToday then
			if slot1 == true then
				slot0.rightList:scrollToPercentVertical(cc.clampf(slot7.dy / (slot0.rightList:getInnerContainer():height() - slot0.rightList:height()) * 100, 0, 100), slot7.dy / 5000, true)
			else
				slot0.rightList:jumpToPercentVertical(slot9)
			end

			return
		end
	end

	if slot1 ~= true then
		gGameUI:showTip(gLanguageCsv.worldcupBetNoMatch)
	end
end

function slot1.onRacingChartClick(slot0)
	gGameUI:stackUI("city.activity.worldcup.schedule", nil, , slot0.activityID)
end

function slot1.onRankClick(slot0)
	gGameApp:requestServer("/game/yy/worldcup/rank", function (slot0)
		gGameUI:stackUI("city.activity.worldcup.rank", nil, , slot0.view)
	end)
end

function slot1.onAchievementClick(slot0)
	gGameUI:stackUI("city.activity.worldcup.achievement", nil, , slot0.activityID)
end

function slot1.onAwardBoxClick(slot0)
	gGameUI:stackUI("city.activity.worldcup.guess", nil, , slot0.activityID)
end

function slot1.onExchangeClick(slot0)
	gGameUI:stackUI("city.activity.worldcup.shop", nil, )
end

function slot1.onChampionCalculateClick(slot0)
	if slot0.championTimeEndStamp < time.getTime() and (slot0.worldCup:read().champion_bet and slot1.champion_bet[1] or 0) == 0 then
		gGameUI:showTip(gLanguageCsv.worldcupPredictTimeout)

		return
	end

	if ((slot0.worldCup:read().champion_bet or {})[1] or 0) == 0 then
		gGameApp:requestServer("/game/yy/worldcup/champion/vote", function (slot0)
			uv6 = "gGameUI"

			gGameUI:stackUI("city.activity.worldcup.predict", nil, , slot6.activityID, nil, slot0.view)
		end)
	else
		gGameUI:stackUI("city.activity.worldcup.predict", nil, , slot0.activityID)
	end
end

function slot1.refreshBetStatus(slot0, slot1)
	for slot5, slot6 in slot0.rightData:pairs() do
		if not slot6:read().isTitle and slot7.id == slot1 then
			slot6:proxy().betState = slot0:getData(slot1).betState

			return
		end
	end
end

function slot1.refreshPredictBtnStatus(slot0)
	slot3 = slot0.btnChampionCalculate:multiget("title", "bg", "title1", "bg1", "country", "countDownBg")

	if (slot0.worldCup:read().champion_bet and slot1.champion_bet[1] or 0) > 0 then
		slot3.country:texture(csv.yunying.worldcup_team[slot2].championPredictRes):show()
		slot3.title1:show()
		slot3.bg1:show()
		slot3.title:hide()
		slot3.bg:hide()
		slot3.countDownBg:hide()
		slot0.txtCountDown:hide()
	else
		slot3.country:hide()
		slot3.title1:hide()
		slot3.bg1:hide()
		slot3.title:show()
		slot3.bg:show()
		slot3.countDownBg:show()
	end
end

function slot1.activityOverCutDown(slot0)
	slot1 = csv.yunying.yyhuodong[slot0.activityID]
	slot3 = gGameModel.role:read("yy_endtime")[slot0.activityID] or 0

	slot0:schedule(function ()
		uv1 = "math"
		slot1 = slot1 - time.getTime()
		slot0 = math.max(slot1, 0)
		uv1 = "max"
		slot1 = slot1.cutDownPanel:get("cutdown")
		slot2 = slot1

		slot1.text(slot2, time.getCutDown(slot0).str)

		slot1 = adapt.oneLinePos
		uv2 = "max"
		slot2 = slot2.cutDownPanel
		slot3 = slot2
		uv3 = "max"

		slot1(slot2.get(slot3, "cutdown"), slot3.cutDownPanel:get("txtCutDown"), nil, "right")

		uv1 = "max"
		slot3 = "bg"
		uv3 = "max"
		slot3 = slot3.cutDownPanel:get("txtCutDown")
		slot4 = slot3
		uv4 = "max"

		slot1.cutDownPanel:get(slot3):width(slot3.width(slot4) + slot4.cutDownPanel:get("cutdown"):width() + 30)

		if slot0 <= 0 then
			uv1 = "max"
			slot1 = slot1.cutDownPanel:get("txtCutDown")
			slot1 = slot1.hide

			slot1(slot1)

			uv1 = "max"
			slot1 = slot1.cutDownPanel:get("cutdown")
			slot1 = slot1.text

			slot1(slot1, gLanguageCsv.activityOver)

			uv1 = "max"
			slot3 = "bg"
			uv3 = "max"

			slot1.cutDownPanel:get(slot3):width(slot3.cutDownPanel:get("cutdown"):width() + 30)

			return false
		end
	end, 1, 0, "worldcupActivityCutDown")
end

return slot1
