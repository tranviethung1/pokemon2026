slot0 = {
	TEXT = 3,
	TITLE = 1,
	TEAM = 2
}
slot1 = {
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
		right = 64,
		text = gLanguageCsv.worldcupGroupThird
	}
}
slot2 = require("app.views.city.activity.worldcup.tools")
slot3 = class("WorldCupPredictView", Dialog)
slot3.RESOURCE_FILENAME = "worldcup_predict.json"
slot3.RESOURCE_BINDING = {
	["predictPanel.subList"] = "predictSublist",
	bg = "bg",
	predictPanel = "predictPanel",
	selectPanel = "selectPanel",
	["predictPanel.time"] = "time1",
	title = "title",
	["selectPanel.item"] = "selectItem",
	["predictPanel.timeText"] = "timeText",
	["selectPanel.title"] = "teamTitle",
	["predictPanel.item"] = "predictItem",
	["selectPanel.icon"] = "teamIcon",
	["predictPanel.list"] = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				yMargin = 2,
				leftPadding = 5,
				asyncPreload = 20,
				xMargin = 20,
				columnSize = 4,
				data = bindHelper.self("teamDatas"),
				item = bindHelper.self("predictSublist"),
				cell = bindHelper.self("predictItem"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot0:getIdx(slot2)
					slot5 = slot1:multiget("name", "icon", "mask", "hotImg", "hotText")

					slot5.name:text(slot3.cfg.teamName)
					slot5.icon:texture(slot3.cfg.teamIcon)
					slot5.mask:visible(slot3.selected)
					slot5.hotText:text(slot3.hot)
					adapt.oneLinePos(slot5.hotText, slot5.hotImg, cc.p(10, 0), "right")
					adapt.setTextScaleWithWidth(slot5.name, nil, 180)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onCellClick")
			}
		}
	},
	["predictPanel.btnSure"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSureClick")
			}
		}
	},
	["predictPanel.btnSure.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["selectPanel.list"] = {
		varname = "selectList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("selectDatas"),
				item = bindHelper.self("selectItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("type" .. slot3.type):show()

					slot6 = "type" .. slot3.type
					uv6 = "get"

					if slot3.type == slot6.TITLE then
						slot1:get(slot6):get("title"):text(slot3.text)
					else
						uv6 = "get"

						if slot3.type == slot6.TEAM then
							slot6 = slot4
							slot5 = slot4.multiget(slot6, "time", "hot", "teamName1", "teamIcon1", "win1", "teamName2", "teamIcon2", "score", "win2", "iconBg2", "iconBg1", "vs")
							uv6 = "type"

							slot5.time:text(slot6.getCurTimeStr(slot3.data.startDate, slot3.data.startTime))
							slot5.hot:visible(slot3.data.focus == 1)

							slot8 = csv.yunying.worldcup_team[slot3.data.team2]

							if csv.yunying.worldcup_team[slot3.data.team1] == nil then
								slot5.teamName1:text(gLanguageCsv.worldcupNoTeam)
								slot5.teamIcon1:texture("activity/world_cup/flag/none.png")
							else
								slot5.teamName1:text(slot7.teamName)
								slot5.teamIcon1:texture(slot7.teamIcon)
							end

							if slot8 == nil then
								slot5.teamName2:text(gLanguageCsv.worldcupNoTeam)
								slot5.teamIcon2:texture("activity/world_cup/flag/none.png")
							else
								slot5.teamName2:text(slot8.teamName)
								slot5.teamIcon2:texture(slot8.teamIcon)
							end

							if slot3.data.point == "" or not slot3.gameEnd then
								slot5.vs:show()
								slot5.score:hide()
								slot5.win1:hide()
								slot5.win2:hide()
							else
								slot5.vs:hide()
								slot5.score:show()

								slot9 = string.split(slot3.data.point, ":")

								slot5.win1:visible(tonumber(slot9[2]) < tonumber(slot9[1]))
								slot5.win2:visible(slot10 < slot11)
								bind.extend(slot0, slot5.score:get("left"), {
									class = "text_atlas",
									props = {
										isEqualDist = true,
										align = "center",
										pathName = "worldcup",
										data = slot9[1],
										onNode = function (slot0)
											slot0:xy(0, 0)
											slot0:scale(0.7)
											slot0:scaleX(0.5)
										end
									}
								})
								bind.extend(slot0, slot5.score, {
									class = "text_atlas",
									props = {
										isEqualDist = true,
										data = ":",
										pathName = "worldcup",
										align = "center",
										onNode = function (slot0)
											uv3 = "xy"
											slot3 = slot3.score
											slot4 = slot3
											uv4 = "xy"

											slot0:xy(slot3.width(slot4) / 2, slot4.score:height() / 2)
											slot0:scale(0.7)
											slot0:scaleX(0.5)
										end
									}
								})
								bind.extend(slot0, slot5.score:get("right"), {
									class = "text_atlas",
									props = {
										isEqualDist = true,
										align = "center",
										pathName = "worldcup",
										data = slot9[2],
										onNode = function (slot0)
											slot0:xy(0, 0)
											slot0:scale(0.7)
											slot0:scaleX(0.5)
										end
									}
								})
							end

							adapt.oneLinePos(slot5.teamName1, slot5.hot, cc.p(10, 0), "right")
							slot5.iconBg2:x(slot5.teamIcon2:x())

							return
						end

						uv6 = "get"

						if slot3.type == slot6.TEXT then
							slot4:get("txt"):text(slot3.text)
						end
					end
				end
			}
		}
	}
}

function slot3.onCreate(slot0, slot1, slot2, slot3)
	slot0.cb = slot2
	slot0.activityId = slot1
	slot0.data = slot3

	slot0:initModel()
	idlereasy.any({
		slot0.worldCupdata,
		slot0.clientBuyTimes
	}, function (slot0, slot1, slot2)
		if ((slot1.champion_bet or {})[1] or 0) ~= 0 then
			slot5 = csv.yunying.worldcup_team[slot4]
			uv6 = "champion_bet"
			slot6 = slot6.predictPanel
			slot6 = slot6.hide

			slot6(slot6)

			uv6 = "champion_bet"
			slot6 = slot6.selectPanel
			slot6 = slot6.show

			slot6(slot6)

			uv6 = "champion_bet"
			slot6 = slot6.teamIcon
			slot6 = slot6.texture

			slot6(slot6, slot5.teamIcon)

			uv6 = "champion_bet"
			slot6 = slot6.teamTitle
			slot6 = slot6.text

			slot6(slot6, string.format(gLanguageCsv.worldcupPredictTeam, slot5.teamName))

			uv6 = "champion_bet"
			slot6 = slot6.initTeamDetail

			slot6(slot6, slot4)

			uv6 = "champion_bet"

			slot6:enableSchedule():schedule(function (slot0)
				uv1 = "selectList"

				slot1.selectList:scrollToBottom(1, true)

				return false
			end, 0.016666666666666666, 0, "oneKey")
		else
			uv5 = "champion_bet"
			slot5 = slot5.predictPanel
			slot5 = slot5.show

			slot5(slot5)

			uv5 = "champion_bet"
			slot5 = slot5.selectPanel
			slot5 = slot5.hide

			slot5(slot5)

			uv5 = "champion_bet"
			slot5 = slot5.initData

			slot5(slot5)

			uv5 = "champion_bet"
			slot5 = slot5.initTime

			slot5(slot5)

			uv5 = "champion_bet"

			slot5.selectTeamNumber:addListener(function (slot0, slot1, slot2)
				uv4 = "teamDatas"

				for slot6 = 1, slot4.teamDatas:size() do
					uv7 = "teamDatas"

					if slot7.teamDatas:atproxy(slot6).teamId == slot0 then
						uv7 = "teamDatas"
						slot7.teamDatas:atproxy(slot6).selected = true
					else
						uv7 = "teamDatas"

						if slot7.teamDatas:atproxy(slot6).teamId == slot1 then
							uv7 = "teamDatas"
							slot7.teamDatas:atproxy(slot6).selected = false
						end
					end
				end
			end)
		end
	end)
	Dialog.onCreate(slot0)
end

function slot3.initModel(slot0)
	slot0.teamDatas = idlers.newWithMap({})
	slot0.selectDatas = idlers.newWithMap({})
	slot0.selectTeamNumber = idler.new(0)
	slot0.worldCupdata = gGameModel.role:getIdler("worldcup")
	slot0.clientBuyTimes = idler.new(true)
end

function slot3.initTime(slot0)
	slot2 = csv.yunying.yyhuodong[slot0.activityId].paramMap or {}
	uv4 = "csv"

	if slot4.getCurTimeStamp(slot2.championBetEndDate, slot2.championBetEndTime) < time.getTime() then
		slot0.timeText:text(gLanguageCsv.worldcupPredictTimeout)
		slot0.time1:hide()
	else
		uv8 = "csv"

		bind.extend(slot0, slot0.time1, {
			class = "cutdown_label",
			props = {
				delay = 1,
				endTime = slot8.getCurTimeStamp(slot2.championBetEndDate, slot2.championBetEndTime),
				endFunc = function ()
					uv0 = "timeText"
					slot0 = slot0.timeText
					slot0 = slot0.text

					slot0(slot0, gLanguageCsv.worldcupPredictTimeout)

					uv0 = "timeText"

					slot0.time1:hide()
				end
			}
		})
	end
end

function slot3.initTeamDetail(slot0, slot1)
	slot3 = csv.yunying.worldcup_team[slot1]
	slot6 = true
	uv10 = "csv"
	slot10 = slot10.TITLE
	uv10 = "yunying"
	slot10 = slot10[1].text

	table.insert({}, {
		type = slot10,
		text = slot10
	})

	for slot10, slot11 in orderCsvPairs(csv.yunying.worldcup_match) do
		uv12 = "yunying"

		if slot10 <= slot12[1].right and slot11.huodongID == csv.yunying.yyhuodong[slot0.activityId].huodongID and (slot11.team1 == slot1 or slot11.team2 == slot1) then
			uv15 = "csv"
			uv16 = "yyhuodong"

			table.insert(slot5, {
				type = slot15.TEAM,
				data = slot11,
				gameEnd = slot16.getCurTimeStamp(slot11.betEndDate, slot11.betEndTime) < time.getTime()
			})
		end
	end

	for slot10 = 2, 5 do
		if not slot0:insertTeamData(slot5, slot1, slot10) then
			break
		end
	end

	if slot3.finalRank ~= 0 then
		uv10 = "csv"

		table.insert(slot5, {
			type = slot10.TEXT,
			text = string.format(gLanguageCsv.worldcupTimeFinal, slot3.teamName, slot3.finalRank)
		})
	end

	slot0.selectDatas:update(slot5)
end

function slot3.insertTeamData(slot0, slot1, slot2, slot3)
	slot5 = false
	uv6 = "text"
	slot6 = slot6[slot3].text
	uv7 = "text"
	uv8 = "text"

	for slot10 = slot7[slot3].left, slot8[slot3].right do
		if csv.yunying.worldcup_match[slot10].team1 ~= 0 and slot11.team2 ~= 0 then
			slot4 = 0 + 1
		end

		if slot11.team1 == slot2 or slot11.team2 == slot2 then
			slot5 = true

			if slot10 == 64 then
				slot6 = gLanguageCsv.worldcupGroupFinal or slot6
			end

			uv15 = "left"
			slot15 = slot15.TITLE

			table.insert(slot1, {
				type = slot15,
				text = slot6
			})

			uv15 = "left"
			uv16 = "right"

			table.insert(slot1, {
				type = slot15.TEAM,
				data = slot11,
				gameEnd = slot16.getCurTimeStamp(slot11.betEndDate, slot11.betEndTime) < time.getTime()
			})

			return true
		end
	end

	if not slot5 then
		uv7 = "text"
		uv8 = "text"

		if slot4 == slot7[slot3].right - slot8[slot3].left + 1 then
			uv10 = "left"
			slot10 = slot10.TITLE

			table.insert(slot1, {
				type = slot10,
				text = slot6
			})

			uv10 = "left"

			table.insert(slot1, {
				type = slot10.TEXT,
				text = gLanguageCsv.worldcupTeamFaiure
			})

			return false
		end
	end

	return false
end

function slot3.initData(slot0)
	slot1 = {}

	for slot6, slot7 in orderCsvPairs(csv.yunying.worldcup_team) do
		table.insert(slot1, {
			selected = false,
			teamId = slot6,
			cfg = slot7,
			hot = (slot0.data and slot0.data.vote_count or {})[slot6] or 0
		})
	end

	table.sort(slot1, function (slot0, slot1)
		return slot0.cfg.worldrank < slot1.cfg.worldrank
	end)
	slot0.teamDatas:update(slot1)
end

function slot3.onCellClick(slot0, slot1, slot2)
	slot0.selectTeamNumber:set(slot2.teamId)
end

function slot3.onSureClick(slot0)
	slot2 = csv.yunying.yyhuodong[slot0.activityId].paramMap or {}
	slot7, slot4 = time.getHourAndMin(slot2.championBetEndTime, true)
	slot5 = time.getNumTimestamp(slot2.championBetEndDate, slot7, slot4)
	uv7 = "csv"

	if slot7.getCurTimeStamp(slot2.championBetEndDate, slot2.championBetEndTime) < time.getTime() then
		gGameUI:showTip(gLanguageCsv.worldcupPredictTimeout)

		return
	end

	if slot0.selectTeamNumber:read() == 0 then
		gGameUI:showTip(gLanguageCsv.worldcupNoTeamIdTip)

		return
	end

	gGameUI:showDialog({
		selectType = 1,
		clearFast = true,
		btnType = 1,
		content = string.format(gLanguageCsv.worldcupSurePredict, csv.yunying.worldcup_team[slot0.selectTeamNumber:read()].teamName),
		cb = function ()
			uv4 = "gGameApp"

			gGameApp:requestServer("/game/yy/worldcup/champion/bet", function (slot0)
				uv1 = "data"
				slot1.data = slot0.view
				uv1 = "data"
				slot1 = slot1.clientBuyTimes
				slot1 = slot1.notify

				slot1(slot1)

				uv1 = "data"

				if slot1.cb then
					uv1 = "data"

					slot1.cb()
				end
			end, slot4.selectTeamNumber:read())
		end
	})
end

return slot3
