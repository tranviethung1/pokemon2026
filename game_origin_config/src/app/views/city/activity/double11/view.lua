slot1 = class("Double11View", cc.load("mvc").ViewBase)
slot2 = {
	GOTTEN_AWARD = -1,
	CAN_OPEN = 1,
	OPENED = 2
}
slot1.RESOURCE_FILENAME = "double_11.json"
slot1.RESOURCE_BINDING = {
	["leftPanel.item"] = "leftItem",
	topPanel = "topPanel",
	["rightPanel.openPanel"] = "rightPanelOpen",
	["rightPanel.overPanel"] = "rightPanelOver",
	leftPanel = "leftPanel",
	["leftPanel.textState"] = {
		varname = "textState",
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						color = cc.c3b(249, 115, 54)
					}
				}
			},
			{
				event = "visible",
				idler = bindHelper.self("status"),
				method = function (slot0)
					uv1 = "GOTTEN_AWARD"

					return slot0 == slot1.GOTTEN_AWARD
				end
			}
		}
	},
	["topPanel.time"] = {
		varname = "textCountDown",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c3b(249, 115, 54)
				}
			}
		}
	},
	["topPanel.textNote"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c3b(249, 115, 54)
				}
			}
		}
	},
	["leftPanel.textRecord"] = {
		varname = "textRecord",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c3b(249, 115, 54)
				}
			}
		}
	},
	["rightPanel.openPanel.textPlayed"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 8,
					color = cc.c3b(238, 78, 50)
				}
			}
		}
	},
	["leftPanel.btnRule"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRule")
			}
		}
	},
	["leftPanel.btnTicket"] = {
		varname = "btnTicket",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onTicketClick")
				}
			}
		}
	},
	["leftPanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				padding = 10,
				data = bindHelper.self("record"),
				item = bindHelper.self("leftItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = ""
					slot6 = rich.createByStr((not slot3.id or string.format(gLanguageCsv.double11AwardText, slot3.index, dataEasy.getCfgByKey(slot3.id).name, slot3.num)) and string.format(gLanguageCsv.double11NotGame, slot3.index), matchLanguage({
						"kr",
						"en"
					}) and 30 or 40):addTo(slot1, 10):xy(2, slot1:height() / 2):anchorPoint(cc.p(0, 0.5)):formatText()
				end,
				dataOrderCmp = function (slot0, slot1)
					return slot1.index < slot0.index
				end
			}
		}
	},
	["rightPanel.openPanel.btnGame"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPlayGameClick")
			}
		}
	}
}

function slot3(slot0, slot1, slot2, slot3)
	slot4 = {
		{
			rotation = 7,
			t1 = 0.1,
			t2 = 0.1
		},
		{
			rotation = -7,
			t1 = 0.1,
			t2 = 0.1
		},
		{
			rotation = 7,
			t1 = 0.1,
			t2 = 0.1
		},
		{
			rotation = -7,
			t1 = 0.1,
			t2 = 0.1
		}
	}

	if slot2 then
		slot0:enableSchedule():schedule(function (slot0)
			uv2 = "tolua"

			if tolua.isnull(slot2) then
				uv1 = "isnull"
				uv3 = "enableSchedule"

				slot1:enableSchedule():unSchedule(slot3)

				return
			end

			uv2 = "tolua"
			slot1 = transition.executeSequence(slot2)
			uv3 = "unSchedule"

			for slot5, slot6 in pairs(slot3) do
				slot1:rotateTo(slot6.t1, slot6.rotation)
			end

			slot1:rotateTo(0.1, 0):done()
		end, 1, nil, slot3 or slot1:getName() .. "toRotationScheduleTag")
	else
		slot0:enableSchedule():unSchedule(slot3)
	end
end

function slot1.onCreate(slot0, slot1, slot2)
	slot0.activityId = slot1

	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		title = gLanguageCsv.double11,
		subTitle = gLanguageCsv.double11Subtitle
	})

	if matchLanguage({
		"en"
	}) then
		slot0.list:x(slot0.list:x() - 50)
		slot0.list:setContentSize(slot0.list:getContentSize().width + 200, slot0.list:getContentSize().height)
		slot0.leftItem:size(slot0.leftItem:size().width + 200, slot0.leftItem:size().height)
	end

	slot0:initGameCfg()
	slot0:initModel()
	slot0:initGameStatus()
	slot0:initData()
	slot0:initCountDown()

	slot0.lotteryInfo = slot2.view.lotteryInfo
end

function slot1.initGameCfg(slot0)
	slot0.gameCfg = {}

	for slot4, slot5 in orderCsvPairs(csv.yunying.double11_game) do
		if slot5.huodongID == csv.yunying.yyhuodong[slot0.activityId].huodongID then
			slot0.gameCfg[slot5.game] = {
				itemId = slot5.itemID,
				csvId = slot4
			}
		end
	end
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.played = idler.new(false)
	slot0.status = idler.new()
	slot0.nowGameIndex = idler.new(0)
	slot0.showIndex = idler.new(1)
	slot0.gameOver = idler.new(false)
	slot0.record = idlers.new()
end

function slot1.initData(slot0)
	idlereasy.any({
		slot0.yyhuodongs,
		slot0.nowGameIndex
	}, function (slot0, slot1, slot2)
		uv3 = "activityId"
		slot4 = (slot1[slot3.activityId] or {}).double11 or {}
		uv7 = "activityId"

		for slot9 = 1, #slot7.gameCfg do
			uv10 = "activityId"

			if slot9 <= slot2 then
				if slot4[slot10.gameCfg[slot9].csvId] then
					uv12 = "activityId"
				else
					slot5[slot9] = {
						index = slot9
					}
				end
			end
		end

		uv6 = "activityId"
		slot6 = slot6.record
		slot7 = slot6

		slot6.update(slot7, {
			[slot9] = {
				index = slot9,
				id = slot12.gameCfg[slot9].itemId,
				num = slot4[slot10].red_packet_num
			}
		})

		slot6 = slot2
		uv7 = "activityId"

		if slot2 > #slot7.gameCfg then
			uv7 = "activityId"
			slot6 = #slot7.gameCfg
		end

		uv7 = "activityId"

		if slot4[slot7.gameCfg[slot6].csvId] then
			uv8 = "activityId"
			slot8 = slot8.played
			slot8 = slot8.set
			slot10 = true

			slot8(slot8, slot10)

			uv8 = "activityId"
			uv10 = "activityId"

			slot8.status:set(slot10.gameCfg[slot6].card_status)
		else
			uv8 = "activityId"

			slot8.played:set(false)
		end

		uv8 = "double11"
		uv9 = "activityId"
		uv10 = "activityId"
		slot10 = slot10.btnTicket

		if slot4[slot7] then
			uv12 = "gameCfg"
			slot11 = slot4[slot7].card_status == slot12.CAN_OPEN
		end

		slot8(slot9, slot10, slot11, "double11CardStatus")
	end)

	slot2 = csv.yunying.yyhuodong[slot0.activityId].paramMap.gameTime

	idlereasy.any({
		slot0.nowGameIndex,
		slot0.gameOver,
		slot0.showIndex,
		slot0.played
	}, function (slot0, slot1, slot2, slot3, slot4)
		if not slot2 then
			uv5 = "gameCfg"

			if slot1 <= #slot5.gameCfg then
				uv5 = "gameCfg"

				if slot3 > #slot5.gameCfg then
					uv5 = "gameCfg"
					slot5 = slot5.rightPanelOpen
					slot5 = slot5.hide

					slot5(slot5)

					uv5 = "gameCfg"

					slot5.rightPanelOver:show()

					return false
				else
					uv5 = "gameCfg"
					slot5 = slot5.rightPanelOpen
					slot5 = slot5.show

					slot5(slot5)

					uv5 = "gameCfg"
					slot5 = slot5.rightPanelOver
					slot5 = slot5.hide

					slot5(slot5)

					uv5 = "gameCfg"
					slot5 = slot5.oneDayCount
					slot6 = math.ceil(slot3 / slot5)
					slot7 = slot3 % slot5 == 0 and slot5 or slot3 % slot5
					uv9 = "rightPanelOpen"
					slot8, slot9 = time.getHourAndMin(slot9[slot7][1])
					uv11 = "rightPanelOpen"
					slot10, slot11 = time.getHourAndMin(slot11[slot7][2])
					slot13 = "%02d:%02d--%02d:%02d"
					uv13 = "gameCfg"
					slot13 = slot13.rightPanelOpen:get("textTipTime")
					slot13 = slot13.text
					slot16 = string.format(slot13, slot8, slot9, slot10, slot11)

					slot13(slot13, string.format(gLanguageCsv.double11Time, slot3) .. slot16)

					uv13 = "gameCfg"
					slot13 = slot13.rightPanelOpen:get("imgAward")
					slot14 = slot13
					uv16 = "gameCfg"
					slot15 = dataEasy.getCfgByKey(slot16.gameCfg[slot3].itemId).icon

					slot13.texture(slot14, slot15)

					uv14 = "gameCfg"
					uv15 = "gameCfg"

					bind.click(slot14, slot15.rightPanelOpen:get("imgAward"), {
						method = function ()
							uv1 = "gameCfg"
							uv2 = "itemId"
							uv3 = "gameCfg"

							gGameUI:showItemDetail(slot3.rightPanelOpen:get("imgAward"), {
								key = slot1.gameCfg[slot2].itemId
							})
						end
					})

					if slot4 == true and slot3 == slot1 then
						uv13 = "gameCfg"
						slot13 = slot13.rightPanelOpen:get("btnGame")
						slot13 = slot13.hide

						slot13(slot13)

						uv13 = "gameCfg"

						slot13.rightPanelOpen:get("textPlayed"):show()
					else
						uv13 = "gameCfg"
						slot13 = slot13.rightPanelOpen:get("btnGame")
						slot13 = slot13.show

						slot13(slot13)

						uv13 = "gameCfg"

						slot13.rightPanelOpen:get("textPlayed"):hide()
					end
				end
			end
		end
	end)
	adapt.setTextScaleWithWidth(slot0.textRecord, nil, 260)

	if matchLanguage({
		"kr"
	}) then
		slot0.topPanel:get("imgTitle"):scale(1.6)
	end
end

function slot1.initGameStatus(slot0)
	slot1 = csv.yunying.yyhuodong[slot0.activityId]
	slot0.canPlay = idler.new(false)
	slot3 = time.getNumTimestamp(slot1.beginDate, 0, 0)
	slot4 = {
		[slot9] = {
			slot11 * 3600 + slot12 * 60,
			slot13 * 3600 + slot14 * 60
		}
	}

	for slot9, slot10 in orderCsvPairs(slot1.paramMap.gameTime) do
		slot11, slot12 = time.getHourAndMin(slot10[1], true)
		slot13, slot14 = time.getHourAndMin(slot10[2], true)
		slot5 = 0 + 1
	end

	slot0.oneDayCount = slot5
	slot6 = {
		[slot10] = {
			beginStamps = slot3 + (slot11 - 1) * 24 * 3600 + slot4[slot12][1],
			endStamps = slot3 + (slot11 - 1) * 24 * 3600 + slot4[slot12][2]
		}
	}

	for slot10 = 1, #slot0.gameCfg do
		slot11 = math.ceil(slot10 / slot5)
		slot13 = slot4[slot10 % slot5 == 0 and slot5 or slot10 % slot5][1]
	end

	function slot7()
		uv0 = "gameCfg"
		uv1 = "endStamps"

		if slot0[#slot1.gameCfg].endStamps < time.getTime() then
			uv2 = "endStamps"
			slot2 = slot2.nowGameIndex
			slot2 = slot2.set
			uv4 = "endStamps"

			slot2(slot2, #slot4.gameCfg + 1)

			uv2 = "endStamps"

			slot2.gameOver:set(true)
		else
			slot2 = 1
			slot3 = 1
			uv5 = "gameCfg"

			for slot7, slot8 in ipairs(slot5) do
				if slot8.beginStamps <= slot1 then
					slot2 = slot7
				end

				if slot8.endStamps <= slot1 then
					slot3 = slot7 + 1
				end
			end

			uv4 = "gameCfg"

			if slot4[slot2].beginStamps <= slot1 then
				uv4 = "gameCfg"

				if slot1 < slot4[slot2].endStamps then
					uv4 = "endStamps"

					slot4.canPlay:set(true)
				end
			else
				uv4 = "endStamps"

				slot4.canPlay:set(false)
			end

			uv4 = "endStamps"
			slot4 = slot4.nowGameIndex
			slot4 = slot4.set

			slot4(slot4, slot2)

			uv4 = "endStamps"

			slot4.showIndex:set(slot3)
		end
	end

	slot7()
	slot0:enableSchedule():schedule(slot7, 1, 0)
end

function slot1.onRule(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1000
	})
end

function slot1.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.rules)
		end),
		slot2.noteText(152),
		slot2.noteText(108001, 108100)
	}
end

function slot1.onTicketClick(slot0)
	slot1 = csv.yunying.yyhuodong[slot0.activityId].huodongID

	if slot0.nowGameIndex:read() == 0 then
		gGameUI:showTip(gLanguageCsv.double11GameTips)

		return
	end

	slot2 = slot0.nowGameIndex:read()
	slot3 = slot2

	if slot2 > #slot0.gameCfg then
		slot3 = #slot0.gameCfg
	end

	slot4 = slot0.gameCfg[slot3].csvId

	gGameUI:stackUI("city.activity.double11.lottery", nil, , slot1, slot0.nowGameIndex:read(), slot0.activityId, slot0.lotteryInfo[slot4], slot4)
end

function slot1.onPlayGameClick(slot0)
	if slot0.canPlay:read() == false then
		gGameUI:showTip(gLanguageCsv.double11GameTips)

		return false
	end

	gGameUI:stackUI("city.activity.double11.game", nil, , slot0.activityId, slot0.nowGameIndex:read())
end

function slot1.initCountDown(slot0)
	slot2 = csv.yunying.yyhuodong[slot0.activityId]
	slot3, slot4 = time.getHourAndMin(slot2.endTime)

	bind.extend(slot0, slot0.textCountDown, {
		class = "cutdown_label",
		props = {
			endTime = time.getNumTimestamp(slot2.endDate, slot3, slot4),
			strFunc = function (slot0)
				return slot0.str
			end,
			endFunc = function ()
				uv0 = "text"

				slot0:text(gLanguageCsv.activityOver)
			end
		}
	})
end

return slot1
