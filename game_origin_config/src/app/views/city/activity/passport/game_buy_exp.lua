slot0 = cc.load("mvc").ViewBase
slot1 = class("ActivityGamePassportBuyExpView", Dialog)
slot1.RESOURCE_FILENAME = "activity_game_passport_buy_level.json"
slot1.RESOURCE_BINDING = {
	subList = "subList",
	item = "item",
	text1 = "text1",
	text3 = "text3",
	["barPanel.bar"] = "slider",
	["barPanel.needFrags"] = "needFrags",
	barPanel = "barPanel",
	text4 = "text4",
	["barPanel.myFrags"] = "myFrags",
	text2 = "text2",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				xMargin = 6,
				yMargin = 0,
				data = bindHelper.self("itemDatas1"),
				columnSize = bindHelper.self("midColumnSize"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							data = {
								key = slot3.key,
								num = slot3.num
							}
						}
					})
				end
			}
		}
	},
	btn = {
		varname = "btn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBuyClick")
			}
		}
	},
	text = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 8,
					color = cc.c4b(251, 110, 70, 255)
				}
			}
		}
	},
	["barPanel.subBtn"] = {
		varname = "subBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, -1)
			end)
		}
	},
	["barPanel.addBtn"] = {
		varname = "addBtn",
		binds = {
			event = "touch",
			longtouch = true,
			method = bindHelper.defer(function (slot0, slot1, slot2)
				return slot0:onChangeNum(slot1, slot2, 1)
			end)
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0:initModel()
	slot0:enableSchedule()

	slot2 = csv.yunying.yyhuodong[slot1]
	slot3 = slot2.paramMap.dailyBuyTimes
	slot0.activityId = slot1
	slot0.itemDatas1 = idlers.newWithMap({})
	slot0.midColumnSize = 8
	slot5 = slot0.yyhuodongs:read()[slot0.activityId].info.level or 0
	slot6 = slot0.yyhuodongs:read()[slot0.activityId].info.buy_times or 0
	slot7 = slot0.yyhuodongs:read()[slot0.activityId].info.buy_level or 0
	slot8 = slot0.yyhuodongs:read()[slot0.activityId].info.elite_buy == 1
	slot9 = csv.yunying.playpassport_award
	slot10 = gCostCsv["play_passport_buy_cost" .. slot2.paramMap.type]
	slot0.selectNum = idler.new(1)

	idlereasy.when(slot0.selectNum, function (slot0, slot1)
		slot2 = {}
		slot3 = false
		uv4 = "canMaxNum"
		slot5 = 0
		slot4.canMaxNum = slot5
		uv5 = "csvPairs"

		for slot7, slot8 in csvPairs(slot5) do
			uv10 = "huodongID"

			if slot8.huodongID == slot10.huodongID then
				uv10 = "level"

				if slot10 < slot8.level then
					uv10 = "level"

					if slot8.level <= slot10 + slot1 then
						for slot12, slot13 in csvMapPairs(slot8.normalAward) do
							for slot17, slot18 in ipairs(slot2) do
								if slot18.key == slot12 then
									slot18.num = slot18.num + slot13
									slot3 = true

									break
								end
							end

							if slot3 == false then
								table.insert(slot2, {
									key = slot12,
									num = slot13
								})
							else
								slot3 = false
							end
						end

						uv9 = "csvMapPairs"

						if slot9 then
							for slot12, slot13 in csvMapPairs(slot8.eliteAward) do
								for slot17, slot18 in ipairs(slot2) do
									if slot18.key == slot12 then
										slot18.num = slot18.num + slot13
										slot3 = true

										break
									end
								end

								if slot3 == false then
									table.insert(slot2, {
										key = slot12,
										num = slot13
									})
								else
									slot3 = false
								end
							end
						end
					end
				end

				uv9 = "canMaxNum"
				uv10 = "canMaxNum"
				slot9.canMaxNum = slot10.canMaxNum + 1
			end
		end

		uv4 = "canMaxNum"
		uv5 = "canMaxNum"
		uv6 = "level"
		slot4.canMaxNum = slot5.canMaxNum - slot6
		uv4 = "canMaxNum"
		uv6 = "canMaxNum"
		uv7 = "normalAward"
		uv8 = "ipairs"
		slot4.canMaxNum = math.min(slot6.canMaxNum, slot7 - slot8)
		uv4 = "canMaxNum"
		slot4 = slot4.itemDatas1
		slot4 = slot4.update

		slot4(slot4, slot2)

		uv4 = "canMaxNum"

		if not slot4.slider:isHighlighted() then
			uv5 = "canMaxNum"
			slot5 = slot1 / slot5.canMaxNum * 100
			uv5 = "canMaxNum"

			slot5.slider:setPercent(math.ceil(slot5))
		end

		uv5 = "canMaxNum"
		slot5 = slot5.addBtn
		uv7 = "canMaxNum"

		uiEasy.setBtnShader(slot5, nil, slot1 < slot7.canMaxNum and 1 or 2)

		slot4 = uiEasy.setBtnShader
		uv5 = "canMaxNum"
		slot7 = slot1 > 1 and 1 or 2

		slot4(slot5.subBtn, nil, slot7)

		uv4 = "canMaxNum"
		slot4 = slot4.text2
		slot5 = slot4
		uv7 = "level"

		slot4.text(slot5, gLanguageCsv.textLv .. slot7 + slot1)

		uv5 = "canMaxNum"
		slot5 = slot5.text1

		text.addEffect(slot5, {
			outline = {
				size = 3,
				color = cc.c4b(255, 252, 237, 255)
			}
		})

		slot4 = text.addEffect
		uv5 = "canMaxNum"

		slot4(slot5.text3, {
			outline = {
				size = 3,
				color = cc.c4b(255, 252, 237, 255)
			}
		})

		uv4 = "canMaxNum"
		slot4 = slot4.text1
		slot4 = slot4.text

		slot4(slot4, gLanguageCsv.gamePassportBuyExpText1)

		uv4 = "canMaxNum"

		slot4.text3:text(gLanguageCsv.gamePassportBuyExpText2)

		slot4 = adapt.oneLineCenterPos
		slot7 = 1050
		uv7 = "canMaxNum"
		slot7 = slot7.text1
		uv7 = "canMaxNum"
		slot7 = slot7.text2
		uv7 = "canMaxNum"

		slot4(cc.p(1275, slot7), {
			slot7,
			slot7,
			slot7.text3
		}, cc.p(2, 0))

		uv4 = "canMaxNum"

		if slot4.richText then
			uv4 = "canMaxNum"

			slot4.richText:removeSelf()
		end

		uv4 = "canMaxNum"
		uv9 = "ipairs"
		uv10 = "normalAward"
		slot7 = 40
		uv7 = "canMaxNum"
		slot9 = 0.5
		slot5 = rich.createWithWidth(string.format(gLanguageCsv.gamePassportBuyExpText, slot1, slot9, slot10), slot7, nil, 1250):addTo(slot7.text4, 10):anchorPoint(cc.p(0.5, slot9)):xy(350, 5)
		slot6 = slot5
		slot4.richText = slot5.formatText(slot6)
		uv6 = "key"

		for slot9 = 1, slot1 do
			uv10 = "key"
			uv12 = "num"
			slot4 = 0 + slot10[math.min(slot9 + slot12, table.length(slot6))]
		end

		uv6 = "canMaxNum"
		slot6.cost = slot4
		uv6 = "canMaxNum"

		slot6.btn:get("txt"):text(slot4)
	end)
	slot0.slider:addEventListener(function (slot0, slot1)
		uv2 = "unScheduleAll"

		slot2:unScheduleAll()

		uv5 = "unScheduleAll"
		slot4 = math.ceil(slot5.canMaxNum * slot0:getPercent() * 0.01)
		uv6 = "unScheduleAll"
		uv4 = "unScheduleAll"

		slot4.selectNum:set(cc.clampf(slot4, 1, slot6.canMaxNum))
	end)
	Dialog.onCreate(slot0)
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.rmb = gGameModel.role:getIdler("rmb")
end

function slot1.onBuyClick(slot0)
	if slot0.rmb:read() < slot0.cost then
		uiEasy.showDialog("rmb", nil, {
			dialog = false
		})

		return
	else
		gGameUI:showDialog({
			isRich = true,
			btnType = 2,
			title = gLanguageCsv.passwordTitleTip,
			cb = function ()
				uv4 = "gGameApp"
				uv5 = "gGameApp"

				gGameApp:requestServer("/game/yy/playpassport/exp/buy", function (slot0)
					slot1 = gGameUI
					slot1 = slot1.showTip

					slot1(slot1, gLanguageCsv.buySuccess)

					uv1 = "gGameUI"

					slot1:onClose()
				end, slot4.activityId, slot5.selectNum:read())
			end,
			content = string.format(gLanguageCsv.passportRmbCheck, slot0.cost),
			dialogParams = {
				clickClose = false
			}
		})
	end
end

function slot1.onChangeNum(slot0, slot1, slot2, slot3)
	if slot2.name == "click" then
		slot0:unScheduleAll()
		slot0:onIncreaseNum(slot3)
	elseif slot2.name == "began" then
		slot0:schedule(function ()
			uv0 = "onIncreaseNum"
			uv2 = "onIncreaseNum"

			slot0:onIncreaseNum(slot2)
		end, 0.05, 0, 100)
	elseif slot2.name == "ended" or slot2.name == "cancelled" then
		slot0:unScheduleAll()
	end
end

function slot1.onIncreaseNum(slot0, slot1)
	slot0.selectNum:modify(function (slot0)
		uv3 = "cc"
		uv5 = "clampf"

		return true, cc.clampf(slot0 + slot3, 1, slot5.canMaxNum)
	end)
end

return slot1
