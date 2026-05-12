slot0 = class("ChipDetailsView", cc.load("mvc").ViewBase)
slot1 = require("app.views.city.card.chip.tools")
slot0.RESOURCE_FILENAME = "common_chip_details.json"
slot0.RESOURCE_BINDING = {
	["baseNode.panel.suitPanel"] = "suitPanel",
	baseNode = "baseNode",
	["baseNode.panel.linePanel"] = "linePanel",
	["baseNode.panel.icon"] = "icon",
	["baseNode.panel.attrPanel"] = "attrPanel",
	["baseNode.panel"] = "panel",
	["baseNode.panel.name"] = "panelName",
	["baseNode.panel.bg2"] = "bg2",
	["baseNode.panel.level"] = "level",
	["baseNode.panel.list"] = "list",
	["baseNode.panel.bg"] = {
		varname = "bg",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot2, slot3 = nil

	if slot1.dbId then
		slot4 = gGameModel.chips:find(slot1.dbId)
		slot2 = slot4:read("chip_id")
		slot3 = slot4:read("level")
	else
		slot2 = slot1.key
		slot3 = 1
	end

	slot4 = {}
	slot5 = csv.chip.chips[slot2]

	bind.extend(slot0, slot0.icon, {
		class = "icon_key",
		props = {
			noListener = true,
			data = {
				key = slot2
			},
			specialKey = {
				lv = slot3
			},
			onNode = function (slot0)
				slot0:get("defaultLv"):hide()
			end
		}
	})
	uiEasy.setIconName(slot2, 0, {
		node = slot0.panelName
	})
	slot0.level:text(gLanguageCsv.textLv .. slot3)

	slot6 = 0
	slot7 = 0
	slot8 = 0

	slot0.list:removeAllChildren()

	slot9 = slot0.list
	slot9 = slot9.setScrollBarEnabled

	slot9(slot9, false)

	uv9 = "dbId"
	slot9, slot10 = slot9.getAttrByChipId(slot2)

	if slot1.dbId then
		uv11 = "dbId"
		slot9, slot10 = slot11.getAttr(slot1.dbId, slot3, true, true)
	end

	slot11 = false

	for slot15, slot16 in ipairs(slot9) do
		uv18 = "dbId"

		if not slot18.ignoreAttr(slot16.key) then
			slot11 = true
			slot19 = slot0.attrPanel:clone()
			slot20 = slot19
			slot19 = slot19.show(slot20)
			uv20 = "dbId"

			slot19:get("key"):text(slot20.getAttrName(slot17))
			slot19:get("val"):text("+" .. slot16.val)
			slot0.list:pushBackCustomItem(slot19)

			slot6 = slot6 + 1
		end
	end

	if slot11 then
		slot0.list:pushBackCustomItem(slot0.linePanel:clone():show())

		slot7 = slot7 + 1
	end

	slot11 = false

	for slot15, slot16 in ipairs(slot10) do
		slot11 = true

		if not slot16.key then
			slot18 = slot0.attrPanel:clone():show()

			slot18:get("key"):text(slot16.name)
			slot18:get("val"):text(slot16.val)
			text.addEffect(slot18:get("key"), {
				color = ui.COLORS.NORMAL.GRAY
			})
			text.addEffect(slot18:get("val"), {
				color = ui.COLORS.NORMAL.GRAY
			})
			adapt.oneLinePos(slot18:get("key"), slot18:get("val"))
			slot0.list:pushBackCustomItem(slot18)

			slot6 = slot6 + 1
		else
			uv18 = "dbId"

			if not slot18.ignoreAttr(slot17) then
				slot19 = slot0.attrPanel:clone()
				slot20 = slot19
				slot19 = slot19.show(slot20)
				uv20 = "dbId"

				slot19:get("key"):text(slot20.getAttrName(slot17))
				slot19:get("val"):text("+" .. slot16.val)
				adapt.oneLinePos(slot19:get("key"), slot19:get("val"))
				slot0.list:pushBackCustomItem(slot19)

				slot6 = slot6 + 1
			end
		end
	end

	if slot11 then
		slot0.list:pushBackCustomItem(slot0.linePanel:clone():show())

		slot7 = slot7 + 1
	end

	slot12 = {}
	slot14 = {}

	for slot18, slot19 in pairs(gChipSuitCsv[slot5.suitID][slot5.quality]) do
		table.insert(slot14, {
			slot19.suitNum,
			slot19.suitQuality,
			false
		})
	end

	for slot18, slot19 in ipairs(slot14) do
		uv20 = "dbId"

		table.insert(slot12, {
			str = slot20.getSuitAttrStr(slot5.suitID, slot19)
		})
	end

	slot15 = slot0.suitPanel:clone():show()
	slot16, slot17 = beauty.textScroll({
		isRich = true,
		margin = 10,
		list = slot15:get("list"),
		strs = slot12
	})
	slot18 = slot6 * slot0.attrPanel:size().height + slot7 * slot0.linePanel:size().height + slot17

	slot16:height(slot17)
	slot16:setTouchEnabled(false)
	slot15:height(slot17)
	slot0.list:pushBackCustomItem(slot15)
	slot0.bg2:size(cc.size(slot0.bg2:size().width, slot18 + 30))
	slot0.bg:size(cc.size(slot0.bg:size().width, slot18 + 305))
	slot0.baseNode:size(cc.size(slot0.bg:size().width, slot18 + 400))
	slot0.panel:xy(slot0.baseNode:size().width / 2, slot0.baseNode:size().height)
end

return slot0
