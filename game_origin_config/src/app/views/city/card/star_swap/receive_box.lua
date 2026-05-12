slot0 = class("StarSwapReceiveBoxView", Dialog)
slot1 = require("app.views.city.card.star_swap.tools")
slot0.RESOURCE_FILENAME = "receive_prompt_box.json"
slot0.RESOURCE_BINDING = {
	["content.count"] = "contentCount",
	["content.list"] = "contentList",
	["content.tipText"] = "tipText",
	content = "content",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnOkCenter = {
		varname = "btnOkCenter",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onReceive")
			}
		}
	},
	["content.btnOkCenter.title"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.count = slot1.count

	slot0.tipText:text(gLanguageCsv.starSwapGet)
	idlereasy.when(slot0.count, function (slot0, slot1)
		if slot1 <= 0 then
			return
		end

		uv2 = "getReceiveData"
		slot2 = slot2.getReceiveData

		slot2(slot2)

		uv2 = "getReceiveData"
		slot4 = slot1

		slot2.contentCount:text(slot4)

		slot2 = adapt.oneLineCenterPos
		uv4 = "getReceiveData"
		slot4 = slot4.contentList
		slot5 = slot4
		uv5 = "getReceiveData"
		slot5 = slot5.contentList:y() - 30
		uv5 = "getReceiveData"
		slot5 = slot5.tipText
		uv5 = "getReceiveData"

		slot2(cc.p(slot4.x(slot5) + 400, slot5), {
			slot5,
			slot5.contentCount
		}, cc.p(10, 0))

		uv2 = "getReceiveData"

		slot2:refreshView()
	end)
	slot0.contentList:setScrollBarEnabled(false)
	Dialog.onCreate(slot0)
end

function slot0.getReceiveData(slot0)
	slot1 = {}
	slot2 = time.getTime()
	slot3 = gGameModel.role:read("created_time")
	slot4 = gGameModel.role:read("card_star_swap_times_deliver_record")

	for slot8, slot9 in orderCsvPairs(csv.card_star_swap_times_deliver) do
		if not slot4 or not slot4[slot8] then
			slot10, slot11 = time.getHourAndMin(slot9.time)
			slot13, slot14 = time.getHourAndMin(slot9.endTime)

			if matchLanguageForce(slot9.languages) and time.getNumTimestamp(slot9.date, slot10, slot11) <= slot2 and slot2 <= time.getNumTimestamp(slot9.endDate, slot13, slot14) and slot3 <= time.getNumTimestamp(slot9.validRoleCreatedLatestDate) and time.getNumTimestamp(slot9.validRoleCreatedEarliestDate) <= slot3 and ((slot9.type == 3 or slot9.type == 2) and slot9.param <= gGameModel.role:read("level") or slot9.type == 1 and slot9.param <= gGameModel.role:read("vip_level")) then
				table.insert(slot1, {
					id = slot8,
					endTime = string.format(gLanguageCsv.yearMonthDay, time.getYearMonthDay(slot9.endDate)) .. " " .. slot13 .. ":" .. slot14,
					createRoleTime = slot9.validRoleCreatedEarliestDate,
					endRoleTime = slot9.validRoleCreatedLatestDate,
					type = slot9.type,
					value = slot9.param,
					award = slot9.starSwapTimes
				})
			end
		end
	end

	table.sort(slot1, function (slot0, slot1)
		return slot0.id < slot1.id
	end)

	slot0.receiveData = slot1
end

function slot0.refreshView(slot0)
	slot1 = slot0.receiveData[1]
	slot2 = ""

	if slot1.type == 2 or slot1.type == 3 then
		slot2 = string.format(gLanguageCsv.starReceive1, slot1.value, string.format(gLanguageCsv.yearMonthDay, time.getYearMonthDay(slot1.createRoleTime)), string.format(gLanguageCsv.yearMonthDay, time.getYearMonthDay(slot1.endRoleTime)), slot1.endTime)
	elseif slot1.type == 1 then
		slot2 = string.format(gLanguageCsv.starReceive2, uiEasy.getVipStr(slot1.value).str, slot3, slot4, slot1.endTime)
	end

	slot0.content:removeChildByName("richText")

	slot9 = 850

	rich.createWithWidth(slot2, 44, nil, slot9):addTo(slot0.content):xy(450, 300):name("richText")

	slot5 = slot0.contentList
	slot6 = slot5

	slot5.removeAllItems(slot6)

	uv6 = "receiveData"
	slot6 = slot6.SNOUSEPROPKEY
	uv6 = "receiveData"

	for slot9, slot10 in csvMapPairs(slot1.award) do
		slot0.contentList:pushBackCustomItem(rich.createByStr((itertools.include({
			slot6,
			slot6.SPLUSNOUSEPROPKEY
		}, slot9) and "#C0x60C456#" or "#C0x5B545B#") .. dataEasy.getCfgByKey(slot9).name .. "x" .. slot10, 44):formatText())
	end
end

function slot0.onReceive(slot0)
	uv3 = "receiveData"
	uv4 = "receiveData"
	slot4 = slot4.SPROPKEY
	uv4 = "receiveData"
	slot3 = slot1.award[slot4.SNOUSEPROPKEY] or 0
	uv4 = "receiveData"
	slot4 = slot4.SNOUSEPROPKEY
	uv4 = "receiveData"
	uv5 = "receiveData"
	slot5 = slot5.SPLUSPROPKEY
	uv5 = "receiveData"
	uv5 = "receiveData"
	slot3 = (slot1.award[slot4.SPLUSPROPKEY] or 0) + dataEasy.getNumByKey(slot5) + (slot1.award[slot5.SPLUSNOUSEPROPKEY] or 0) + dataEasy.getNumByKey(slot5.SPLUSNOUSEPROPKEY)

	if gCommonConfigCsv.starSwapSMax < (slot0.receiveData[1].award[slot3.SPROPKEY] or 0) + dataEasy.getNumByKey(slot4) + slot3 + dataEasy.getNumByKey(slot4) or gCommonConfigCsv.starSwapSPlusMax < slot3 then
		gGameUI:showTip(gLanguageCsv.starSwapNumLimit)

		return
	end

	gGameApp:requestServer("/game/role/card_star_swap/times/get", function (slot0)
		uv1 = "count"

		if slot1.count:read() <= 0 then
			uv1 = "count"
			slot1 = slot1.addCallbackOnExit

			slot1(slot1, function ()
				uv2 = "gGameUI"

				gGameUI:showGainDisplay(slot2)
			end)

			uv1 = "count"

			slot1:onClose()
		else
			gGameUI:showGainDisplay(slot0)
		end
	end, slot1.id)
end

function slot0.onClose(slot0)
	Dialog.onClose(slot0)
end

return slot0
