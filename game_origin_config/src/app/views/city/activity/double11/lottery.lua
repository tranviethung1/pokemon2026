slot0 = class("Double11Lottery", Dialog)
slot1 = {
	OPENED = 2,
	GOTTEN_AWARD = -1,
	CAN_OPEN = 1
}
slot0.RESOURCE_FILENAME = "double_11_lottery.json"
slot0.RESOURCE_BINDING = {
	["rightPanel1.list2"] = "innerList",
	rightPanel1 = "rightPanel1",
	leftItem = "leftItem",
	["rightPanel2.item"] = "recordItem",
	["rightPanel1.item"] = "item",
	rightPanel2 = "rightPanel2",
	["rightPanel1.list1"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				data = bindHelper.self("lotteryData"),
				item = bindHelper.self("innerList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("textName"):text(slot3.name)
					slot1:get("textProbability"):text("(" .. gLanguageCsv.double11Probability .. slot3.weight .. "%)")
					slot1:get("textNum"):text(string.format(gLanguageCsv.double11Num, slot3.num))
					uiEasy.createItemsToList(slot0, slot1:get("awardList"), slot3.award, {
						scale = 0.9
					})
				end
			}
		}
	},
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	leftList = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				padding = 5,
				data = bindHelper.self("btnsAttr"),
				item = bindHelper.self("leftItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()
						slot1:get("selected"):show():get("txt"):getVirtualRenderer():setLineSpacing(-10)
					else
						slot5:hide()
						slot4:show():get("txt"):getVirtualRenderer():setLineSpacing(-10)
					end

					adapt.setAutoText(slot6:get("txt"), slot3.name, slot6:size().height - 20)
					slot5:setTouchEnabled(false)
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onLeftButtonClick")
			}
		}
	},
	["rightPanel2.list1"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				padding = 10,
				data = bindHelper.self("record"),
				item = bindHelper.self("recordItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("textName"):text(string.format(gLanguageCsv.double11IndexAward, slot3.index))
					slot1:get("textProbability"):text("")

					slot4 = ""
					slot5 = rich.createByStr(string.format((not slot3.num or not slot3.awardName or string.format(gLanguageCsv.double11AwardTips1, slot3.num, slot3.num, slot3.awardName)) and (not slot3.num or string.format(gLanguageCsv.double11AwardTips2, slot3.num)) and string.format(gLanguageCsv.double11AwardTips3), 40)):addTo(slot1, 10):xy(slot1:get("textProbability"):x(), slot1:get("textProbability"):y()):anchorPoint(cc.p(0.5, 0.5)):formatText()
				end,
				dataOrderCmp = function (slot0, slot1)
					return slot1.index < slot0.index
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2, slot3, slot4, slot5)
	Dialog.onCreate(slot0)

	slot0.nowGameIndex = slot2
	slot0.activityId = slot3
	slot0.csvId = slot5

	slot0:initGameCfg()
	slot0:initData(slot1, slot4)
	slot0:initModel()
	slot0:showScratch()
end

function slot0.initGameCfg(slot0)
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

function slot0.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.record = idlers.new()
	slot0.tabIndex = idler.new(1)
	slot0.cardNum = nil
	slot0.win = false
	slot0.btnsAttr = idlers.newWithMap({
		{
			select = true,
			name = gLanguageCsv.double11Award
		},
		{
			select = false,
			name = gLanguageCsv.double11Record
		}
	})

	slot0.tabIndex:addListener(function (slot0, slot1, slot2)
		uv3 = "btnsAttr"
		slot3 = slot3.btnsAttr:atproxy(slot1)
		slot3.select = false
		uv3 = "btnsAttr"
		slot3.btnsAttr:atproxy(slot0).select = true

		if slot0 == 1 and slot1 == 1 then
			uv3 = "btnsAttr"
			slot3 = slot3.rightPanel2
			slot3 = slot3.hide

			slot3(slot3)

			uv3 = "btnsAttr"

			slot3.rightPanel1:show()
		else
			uv3 = "btnsAttr"
			slot3 = slot3["rightPanel" .. slot1]
			slot3 = slot3.hide

			slot3(slot3)

			uv3 = "btnsAttr"

			slot3["rightPanel" .. slot0]:show()
		end
	end)
	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		slot2 = {}
		uv3 = "activityId"

		if slot1[slot3.activityId] then
			uv3 = "activityId"
			slot3 = slot1[slot3.activityId].double11
		end

		if slot3 then
			uv4 = "activityId"

			if slot3[slot4.csvId] then
				uv4 = "activityId"

				if slot3[slot4.csvId].card_num then
					uv4 = "activityId"
					uv5 = "activityId"
					slot4.cardNum = slot3[slot5.csvId].card_num
				end
			end

			uv4 = "activityId"

			if slot3[slot4.csvId] then
				uv4 = "activityId"

				if slot3[slot4.csvId].lottery_csv_id > 0 then
					uv4 = "activityId"
					slot4.win = true
				end
			end

			uv5 = "activityId"

			for slot7 = 1, #slot5.gameCfg do
				uv8 = "activityId"
				slot8 = slot8.gameCfg[slot7].csvId
				uv9 = "activityId"

				if slot7 <= slot9.nowGameIndex then
					if slot3[slot8] then
						slot9 = slot3[slot8].lottery_csv_id
						uv11 = "double11"

						if slot3[slot8].card_status ~= slot11.CAN_OPEN and csv.yunying.double11_lottery[slot9] then
							table.insert(slot2, {
								index = slot7,
								awardName = csv.yunying.double11_lottery[slot9].name,
								num = slot3[slot8].card_num
							})
						else
							table.insert(slot2, {
								index = slot7,
								num = slot3[slot8].card_num
							})
						end
					else
						table.insert(slot2, {
							index = slot7
						})
					end
				end
			end
		else
			uv5 = "activityId"

			for slot7 = 1, #slot5.gameCfg do
				uv8 = "activityId"

				if slot7 < slot8.nowGameIndex then
					table.insert(slot2, {
						index = slot7
					})
				end
			end
		end

		uv4 = "activityId"
		slot4 = slot4.initUI

		slot4(slot4)

		uv4 = "activityId"
		slot4 = slot4.record
		slot4 = slot4.update

		slot4(slot4, slot2)

		uv4 = "activityId"

		slot4.rightPanel2:get("duckPanel"):setVisible(#slot2 == 0)
	end)
end

function slot0.initData(slot0, slot1, slot2)
	slot3 = csv.yunying.double11_lottery
	slot0.lotteryData = {}

	if slot2 then
		for slot7, slot8 in orderCsvPairs(slot3) do
			if slot8.huodongID == slot1 then
				slot9 = table.shallowcopy(slot8)
				slot9.num = slot2[slot7]

				table.insert(slot0.lotteryData, slot9)
			end
		end
	end

	for slot10, slot11 in orderCsvPairs(csv.yunying.yyhuodong[slot0.activityId].paramMap.gameTime) do
		slot6 = 0 + 1
	end

	slot8, slot9 = time.getHourAndMin(slot5[slot0.nowGameIndex % slot6 == 0 and slot6 or slot0.nowGameIndex % slot6][2])
	slot0.timeStr = slot8 .. ":" .. slot9
end

function slot0.initUI(slot0, slot1, slot2)
	slot3 = slot0.rightPanel1:get("imgTicket")

	if slot0.cardNum then
		slot3:show()
		slot3:get("textNote"):text(string.format(gLanguageCsv.double11Num, slot0.cardNum))
		slot0.rightPanel1:get("imgNoTicket"):hide()
		slot0.rightPanel1:get("textTip1"):hide()

		if slot0.win then
			slot0.rightPanel1:get("textTip2"):hide()
			slot0.rightPanel1:get("textTip3"):show()
			slot0.rightPanel1:get("textTip4"):show():text(string.format(gLanguageCsv.doubleAwardTime, slot0.timeStr))
		else
			slot6:show()
			slot7:hide()
			slot8:hide()
		end
	else
		slot3:hide()
		slot4:show()
		slot5:show()
		slot6:hide()
		slot7:hide()
		slot8:hide()
	end
end

function slot0.showScratch(slot0, slot1, slot2)
	slot3 = slot0.yyhuodongs:read()[slot0.activityId] and slot0.yyhuodongs:read()[slot0.activityId].double11
	slot4 = slot0.nowGameIndex

	if slot0.nowGameIndex > #slot0.gameCfg then
		slot4 = #slot0.gameCfg
	end

	slot5 = slot0.gameCfg[slot4].csvId

	if slot3 and slot3[slot5] then
		uv7 = "yyhuodongs"

		if slot3[slot5].card_status == slot7.CAN_OPEN then
			gGameUI:stackUI("city.activity.double11.scratch", nil, , slot0.activityId, slot5, slot3[slot5].card_num)
		end
	end
end

function slot0.onLeftButtonClick(slot0, slot1, slot2)
	slot0.tabIndex:set(slot2)
end

return slot0
