slot0 = require("app.views.city.develop.totem.tools")
slot2 = class("TotemItemDetailView", require("app.views.common.item_detail"))
slot2.RESOURCE_FILENAME = "totem_item_detail.json"
slot2.RESOURCE_BINDING = {
	["baseNode.textNum"] = "textNum",
	["baseNode.bg"] = "imgBg",
	["baseNode.content"] = "contentLabel",
	["baseNode.name"] = "nodeName",
	baseNode = "baseNode",
	["baseNode.status"] = "status",
	["baseNode.list"] = "list",
	["baseNode.icon"] = {
		varname = "icon",
		binds = {
			event = "extend",
			class = "icon_key",
			props = {
				noListener = true,
				data = bindHelper.self("data"),
				onNode = function (slot0)
					slot0:alignCenter(slot0:size())
				end
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	if slot1.status then
		slot0.status:show()
		slot0.status:text(slot2 == 1 and gLanguageCsv.totemInserted or gLanguageCsv.totemNotInsert)
	else
		slot0.status:hide()
	end

	slot0.status:y(slot0.textNum:y())

	slot3 = 1

	if dataEasy.isUnlock(gUnlockCsv.totemStar) then
		uv4 = "status"

		if slot4.isUnlockUse() then
			slot3 = 2
		end
	end

	slot0.info = ""

	for slot7 = 1, slot3 do
		slot8 = gLanguageCsv.totemInfo
		slot9, slot10 = nil

		if slot7 == 1 then
			slot9, slot10 = slot0:initActiveText(slot1.key)
		else
			slot8 = gLanguageCsv.totemStarText
			slot9, slot10 = slot0:initUpStarText(slot1.key)
		end

		for slot17, slot18 in pairs(slot10) do
			slot11 = (slot9[slot17] or 0) + 0
			slot12 = slot18 + 0

			if slot18 ~= 0 then
				table.insert({}, string.format("%s (%d/%d)", csv.totem.symbol_group[slot17].name, slot9[slot17] or 0, slot18))
			end
		end

		slot14 = "#C0xF76B45#"

		if slot12 <= slot11 then
			slot14 = "#C0x60c456#"
		end

		slot0.info = slot0.info .. "#F10#\n#F40##L10#" .. slot14 .. string.format(slot8, slot11, slot12) .. table.concat(slot13, gLanguageCsv.pauseMark)
	end

	uv4 = "show"

	slot4.onCreate(slot0, slot1)
end

function slot2.initActiveText(slot0, slot1)
	slot3 = gGameModel.totem:read("totem_star") or {}
	uv4 = "gGameModel"
	slot4 = slot4.getActivateTotemEnergy(gGameModel.totem:read("totem_insetted"))
	slot5 = {}
	slot6 = {}

	for slot10, slot11 in orderCsvPairs(csv.totem.symbol) do
		if csv.totem.symbol_group[slot11.symbolGroupType] and csv.totem.symbol_group[slot12].unlockEnergy <= slot4 and csv.totem.symbol_group[slot12].showEnergy <= slot4 then
			for slot16, slot17 in pairs(slot11.totemGroup1) do
				if slot17 == slot1 then
					slot6[slot12] = (slot6[slot12] or 0) + 1

					if slot3[slot10] or slot2[slot10] and slot2[slot10][slot16] then
						slot5[slot12] = (slot5[slot12] or 0) + 1
					end
				end
			end
		end
	end

	return slot5, slot6
end

function slot2.initUpStarText(slot0, slot1)
	slot3 = gGameModel.totem
	slot4 = slot3
	slot3 = slot3.read(slot4, "totem_star")
	uv4 = "gGameModel"
	slot4 = slot4.getActivateTotemEnergy(gGameModel.totem:read("totem_insetted"))
	slot5 = {}
	slot6 = {}

	for slot10, slot11 in orderCsvPairs(csv.totem.symbol) do
		if csv.totem.symbol_group[slot11.symbolGroupType] and csv.totem.symbol_group[slot12].unlockEnergy <= slot4 and csv.totem.symbol_group[slot12].showEnergy <= slot4 then
			for slot17, slot18 in pairs(slot11.totemGroup1) do
				if slot18 == slot1 then
					slot6[slot12] = (slot6[slot12] or 0) + itertools.size(gTotemStarIdCsv[slot11.starSeqID])
					slot5[slot12] = (slot5[slot12] or 0) + (slot3[slot10] or 0)
				end
			end
		end
	end

	return slot5, slot6
end

function slot2.initText(slot0)
	slot1, slot2 = beauty.textScroll({
		isRich = true,
		list = slot0.list,
		strs = "#C0x5B545B#" .. uiEasy.getIconDesc(slot0.data.key, slot0.data.num) .. slot0.info
	})
	slot3 = cc.clampf(slot2, 250, 600) - 120

	slot0.imgBg:size(slot0.imgBg:size().width, slot0.imgBg:size().height + slot3)
	slot1:size(slot1:size().width, 130 + slot3)
	slot1:y(slot1:y() - slot3)
	slot0.baseNode:anchorPoint(0.5, 1)
	slot0.baseNode:y(slot0.baseNode:y() + slot0.baseNode:height() / 2 + slot3 / 2)
	setContentSizeOfAnchor(slot0.baseNode, cc.size(slot0.baseNode:width(), slot0.baseNode:height() + slot3))
end

return slot2
