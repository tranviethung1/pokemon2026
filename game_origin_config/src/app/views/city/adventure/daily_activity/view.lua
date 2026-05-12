slot0 = class("DailyActivityView", cc.load("mvc").ViewBase)
slot1 = {
	gLanguageCsv.doubleReward,
	gLanguageCsv.additionalNumber
}

function slot2(slot0)
	slot1 = false

	if not ({
		"goldActivity",
		"expActivity",
		"giftActivity",
		"fragActivity",
		nil,
		nil,
		"contractActivity"
	})[slot0] then
		return false
	end

	slot4, slot5, slot6 = dataEasy.isDoubleHuodong(slot3)

	return slot4, 2, slot5, slot6
end

function slot3(slot0)
	slot1, slot2, slot3 = dataEasy.isDoubleHuodong("gateDrop")

	if not slot1 then
		return false
	end

	for slot8, slot9 in pairs(slot2) do
		if csv.scene_conf[tonumber(slot9.start)].gateType == game.GATE_TYPE.dailyGold and slot0 == 1 or slot12 == game.GATE_TYPE.dailyExp and slot0 == 2 or slot12 == game.GATE_TYPE.gift and slot0 == 3 or slot12 == game.GATE_TYPE.fragment and slot0 == 4 or slot12 == game.GATE_TYPE.dailyContract and slot0 == 7 then
			return true
		end
	end

	return false
end

slot0.RESOURCE_FILENAME = "daily_activity.json"
slot0.RESOURCE_BINDING = {
	item = "item",
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("gateDatas"),
				item = bindHelper.self("item"),
				dataOrderCmpGen = bindHelper.self("onSortCards", true),
				margin = bindHelper.self("margin"),
				padding = bindHelper.self("padding"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:name("item" .. slot3.csvId)

					slot4 = slot1:multiget("imgBg", "textName", "imgIcon", "flagIcon", "black", "timeInfo", "textDesc", "leftUp", "doubleFlag")

					slot4.imgBg:texture(slot3.background)
					slot4.imgIcon:texture(slot3.icon)
					slot4.textName:text(slot3.title)
					slot4.flagIcon:visible(slot3.flagIconShow)

					slot7 = "textNote"
					uv7 = "name"

					slot4.flagIcon:get(slot7):text(slot7[slot3.flagIconType])
					slot4.black:visible(slot3.notOpen)
					slot4.timeInfo:get("textTime"):text(slot3.openTime)
					slot4.textDesc:text(slot3.desc)
					slot4.leftUp:get("textTimes"):text(slot3.surplusTimes .. "/" .. slot3.times)
					slot4.doubleFlag:visible(slot3.isDoubleAward)
					slot1:setTouchEnabled(not slot3.notOpen)

					slot5 = gLanguageCsv.notOpenToday

					if slot3.levelNotEnough then
						slot4.flagIcon:visible(false)

						slot5 = string.format(gLanguageCsv.arrivalLevelOpen, slot3.openLevel)
					end

					slot4.black:get("textNote"):text(slot5)

					if dataEasy.isTownRelicBuffUnlock() then
						slot6 = {
							1,
							2,
							3,
							4,
							nil,
							nil,
							13
						}

						idlereasy.when(slot0.relicBuff(), function (slot0, slot1)
							uv2 = "huodongType"
							uv3 = "uiEasy"

							if slot2[slot3.huodongType] then
								uv3 = "addRelicIcon"
								uv5 = "huodongType"
								uv6 = "uiEasy"

								uiEasy.addRelicIcon(slot3, slot1, slot5[slot6.huodongType])
							end
						end):anonyOnly(slot0, slot2)
					end

					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick"),
				relicBuff = bindHelper.self("relicBuff")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	adapt.centerWithScreen({
		"left",
		nil,
		false
	}, {
		"right",
		nil,
		false
	}, nil, {
		{
			slot0.list,
			"width"
		},
		{
			slot0.list,
			"pos",
			"left"
		}
	})
	slot0:initModel()
	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "TRANSCRIPT",
		title = gLanguageCsv.transcriptTitle
	})

	slot3 = slot2
	slot0.gateDatas = idlers.new()
	slot4 = {
		game.PRIVILEGE_TYPE.HuodongTypeGoldTimes,
		game.PRIVILEGE_TYPE.HuodongTypeExpTimes
	}

	idlereasy.any({
		slot0.huodongs,
		slot0.roleLv,
		slot0.trainerLevel
	}, function (slot0, slot1, slot2, slot3)
		uv4 = "day"
		uv5 = "orderCsvPairs"
		slot4.day = slot5.day
		slot4 = {}
		slot5 = nil

		for slot9, slot10 in orderCsvPairs(csv.huodong) do
			if slot10.showLevel <= slot2 then
				if slot10.openTJType == 0 then
					uv11 = "orderCsvPairs"

					if slot11.open[slot9] then
						uv11 = "csv"
						uv13 = "huodong"
						slot13, slot14, slot15, slot16 = slot13(slot10.huodongType)

						if slot14 == 2 and slot13 then
							slot12 = (slot11[slot10.huodongType] and dataEasy.getPrivilegeVal(slot11) or 0) + slot15[1].count or 0
						end

						if slot1[tonumber(time.getTodayStrInClock())] and slot1[slot18][slot9] then
							slot17 = slot10.times + slot12 - slot1[slot18][slot9].times
						end

						slot20 = slot4
						uv22 = "orderCsvPairs"
						slot22 = slot13 and slot15[1]
						uv22 = "showLevel"

						table.insert(slot20, {
							csvId = slot9,
							background = slot10.background,
							title = slot10.name,
							icon = slot10.icon,
							typBg = slot22,
							notOpen = slot10.typBg.open[slot9] ~= 1,
							levelNotEnough = slot2 < slot10.openLevel,
							openLevel = slot10.openLevel,
							openTime = slot10.openTimeDesc,
							desc = slot10.desc,
							times = slot10.times + slot12,
							surplusTimes = math.max(slot17, 0),
							flagIconShow = slot13,
							flagIconType = slot14,
							flagIconParamMap = slot22,
							isDoubleAward = slot22(slot10.huodongType),
							sortValue = slot10.sortValue,
							huodongType = slot10.huodongType
						})

						uv20 = "openTJType"

						if slot10.type == slot20 then
							uv19 = "day"

							if slot19.lastCsvId == nil then
								slot5 = slot4[#slot4]
							end
						end
					end
				end
			end
		end

		uv6 = "day"

		slot6.gateDatas:update(slot4)

		if slot5 then
			uv6 = "day"

			slot6:onItemClick(nil, , slot5)
		end
	end)

	if slot0.gateDatas:size() > 4 then
		slot6 = display.sizeInViewRect.width - slot0.item:width() * 4.5
		slot0.margin = slot6 / 6
		slot0.padding = slot6 / 6
	else
		slot0.margin = 60
		slot0.padding = 70
	end
end

function slot0.initModel(slot0)
	slot0.huodongs = gGameModel.role:getIdler("huodongs")
	slot0.roleLv = gGameModel.role:getIdler("level")
	slot0.trainerLevel = gGameModel.role:getIdler("trainer_level")

	if dataEasy.isTownRelicBuffUnlock() then
		slot0.relicBuff = gGameModel.town:getIdler("relic_buff")
	else
		slot0.relicBuff = idler.new("")
	end
end

function slot0.onItemClick(slot0, slot1, slot2, slot3)
	slot0.lastCsvId = slot3.csvId

	gGameUI:stackUI("city.adventure.daily_activity.gate_select", nil, {
		full = true
	}, slot3.csvId, {
		show = slot3.flagIconShow,
		type = slot3.flagIconType,
		paramMap = slot3.flagIconParamMap,
		isDoubleAward = slot3.isDoubleAward,
		huodongType = slot3.huodongType
	})
end

function slot0.onSortCards(slot0, slot1)
	return function (slot0, slot1)
		if slot0.notOpen ~= slot1.notOpen then
			return slot1.notOpen
		end

		return slot0.sortValue < slot1.sortValue
	end
end

return slot0
