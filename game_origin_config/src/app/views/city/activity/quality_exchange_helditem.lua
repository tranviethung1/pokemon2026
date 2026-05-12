slot0 = class("ActivityQualityExchangeHelditemView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "activity_quality_exchange_helditem.json"
slot0.RESOURCE_BINDING = {
	costPanel = "costPanel",
	rightItem = "rightItem",
	numList = "numList",
	btn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnClick")
			}
		}
	},
	["btn.label"] = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	leftItem = {
		varname = "leftItem",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onLeftItemClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.activityId = slot1
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.vipLevel = gGameModel.role:getIdler("vip_level")
	slot0.rmb = gGameModel.role:getIdler("rmb")
	slot0.datas = {}

	for slot8, slot9 in orderCsvPairs(csv.yunying.qualityexchange) do
		if slot9.huodongID == csv.yunying.yyhuodong[slot1].huodongID then
			slot10, slot11 = next(slot9.items[1])
			slot0.datas[slot9.quality] = {
				csvId = slot8,
				cfg = slot9,
				key = slot10,
				num = slot11,
				rmb = slot9.costMap.rmb or 0
			}
			slot4 = nil or slot10
		end
	end

	bind.extend(slot0, slot0.rightItem, {
		class = "icon_key",
		props = {
			data = idlereasy.new({
				key = slot4
			})
		}
	})
	idlereasy.any({
		slot0.yyhuodongs,
		slot0.vipLevel
	}, function (slot0, slot1, slot2)
		uv3 = "stamps"
		slot6 = {}
		uv8 = "gVipCsv"

		for slot10, slot11 in csvPairs(slot8.paramMap.quality) do
			table.insert(slot6, {
				quality = slot10,
				leftTimes = slot11 + (gVipCsv[slot2].heldItemExchangeTimes[slot10] or 0) - (((slot1[slot3] or {}).stamps or {})[slot10] or 0)
			})
		end

		table.sort(slot6, function (slot0, slot1)
			return slot0.quality < slot1.quality
		end)

		slot7 = {}

		for slot11, slot12 in ipairs(slot6) do
			uv13 = "csvPairs"

			if slot13.datas[slot12.quality] then
				uv13 = "csvPairs"
				slot13.datas[slot12.quality].leftTimes = slot12.leftTimes
			end

			table.insert(slot7, {
				str = string.format(gLanguageCsv.qualityExchangeHelditemDesc, ui.QUALITYCOLOR[slot12.quality], gLanguageCsv[ui.QUALITY_COLOR_TEXT[slot12.quality]], slot12.leftTimes > 0 and "#C0x60C456#" or "#C0xF13B54#", slot12.leftTimes)
			})
		end

		uv10 = "csvPairs"

		beauty.textScroll({
			isRich = true,
			margin = 10,
			list = slot10.numList,
			strs = slot7
		})
	end)

	slot0.selectId = idler.new()

	idlereasy.any({
		slot0.selectId,
		slot0.rmb
	}, function (slot0, slot1, slot2)
		uv3 = "costPanel"
		slot3 = slot3.costPanel
		slot3 = slot3.hide

		slot3(slot3)

		uv3 = "costPanel"
		slot3.selectData = nil

		if not slot1 then
			uv3 = "costPanel"
			slot3 = slot3.leftItem:get("icon")
			slot3 = slot3.show

			slot3(slot3)

			uv3 = "costPanel"
			slot3 = slot3.leftItem:get("add")
			slot3 = slot3.show

			slot3(slot3)

			uv3 = "hide"
			uv6 = "selectData"

			slot3:set({
				key = slot6
			})
		elseif gGameModel.held_items:find(slot1) then
			slot4 = slot3:read("held_item_id", "advance", "card_db_id", "level")
			slot6 = slot4.held_item_id
			slot5 = dataEasy.getCfgByKey(slot6).quality
			uv6 = "costPanel"
			slot6 = slot6.leftItem:get("icon")
			slot6 = slot6.hide

			slot6(slot6)

			uv6 = "costPanel"
			slot8 = "add"
			slot6 = slot6.leftItem:get(slot8)
			slot7 = slot6

			slot6.hide(slot7)

			uv7 = "costPanel"
			uv8 = "costPanel"
			slot8 = slot8.leftItem

			bind.extend(slot7, slot8, {
				class = "icon_key",
				props = {
					noListener = true,
					data = {
						num = 1,
						key = slot4.held_item_id
					},
					specialKey = {
						lv = slot4.level
					},
					onNode = function (slot0)
						slot0:setTouchEnabled(false)
					end
				}
			})

			slot7 = slot4.held_item_id
			uv7 = "costPanel"
			uv8 = "costPanel"
			slot7.selectData = slot8.datas[dataEasy.getCfgByKey(slot7).quality]
			uv7 = "costPanel"

			if slot7.selectData then
				uv7 = "hide"
				slot7 = slot7.set
				uv10 = "costPanel"
				slot10 = slot10.selectData.key
				uv10 = "costPanel"

				slot7(slot7, {
					key = slot10,
					num = slot10.selectData.num
				})

				uv7 = "costPanel"
				slot10 = "num"
				slot11 = "icon"
				slot7 = slot7.costPanel:multiget("txt", slot10, slot11)
				uv10 = "costPanel"

				slot7.num:text(slot10.selectData.rmb)

				uv11 = "costPanel"

				text.addEffect(slot7.num, {
					color = slot11.selectData.rmb <= slot2 and ui.COLORS.NORMAL.DEFAULT or ui.COLORS.NORMAL.RED
				})

				slot8 = adapt.oneLineCenterPos

				slot8(cc.p(200, 30), {
					slot7.txt,
					slot7.num,
					slot7.icon
				}, cc.p(10, 0))

				uv8 = "costPanel"

				slot8.costPanel:show()
			end
		end
	end)
end

function slot0.onInit(slot0)
	slot0.selectId:set()
end

function slot0.getQualities(slot0)
	for slot5, slot6 in pairs(slot0.datas) do
		if slot6.leftTimes and slot6.leftTimes > 0 then
			-- Nothing
		end
	end

	return {
		[slot5] = slot6.leftTimes
	}
end

function slot0.onLeftItemClick(slot0)
	if itertools.isempty(slot0:getQualities()) then
		gGameUI:showTip(gLanguageCsv.qualityExchangeHelditemTimes)

		return
	end

	gGameUI:stackUI("city.activity.quality_exchange_helditem_select", nil, , slot1, slot0:createHandler("onChooseItem"))
end

function slot0.onChooseItem(slot0, slot1)
	slot0.selectId:set(slot1)
end

function slot0.onBtnClick(slot0)
	if itertools.isempty(slot0:getQualities()) then
		gGameUI:showTip(gLanguageCsv.qualityExchangeHelditemTimes)

		return
	end

	if not slot0.selectData then
		gGameUI:showTip(gLanguageCsv.qualityExchangeFragmentChooseTip)

		return
	end

	if slot0.rmb:read() < slot0.selectData.rmb then
		uiEasy.showDialog("rmb")

		return
	end

	gGameUI:showDialog({
		btnType = 2,
		isRich = true,
		cb = function ()
			uv0 = "selectId"
			slot0 = slot0.selectId
			slot1 = slot0
			uv1 = "selectId"
			uv6 = "selectId"

			gGameApp:requestServer("/game/yy/award/exchange", function (slot0)
				uv1 = "selectId"

				slot1.selectId:set(nil)
				gGameUI:showGainDisplay(slot0)
			end, slot6.activityId, slot1.selectData.csvId, slot0.read(slot1), 1, 1)
		end,
		content = "#C0x5B545B#" .. gLanguageCsv.qualityExchangeHelditemExchangeTip
	})
end

return slot0
