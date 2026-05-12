slot0 = require("app.views.city.card.chip.tools")
slot1 = class("ChipSuitAttrView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "chip_suit_attr.json"
slot1.RESOURCE_BINDING = {
	txtTip = "txtTip",
	item01 = "item",
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("showDatas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:multiget("imgChip", "txtName").txtName:text(slot3.name)

					slot5 = rich.createWithWidth(slot3.twoStr, 40, nil, 1240, nil, cc.p(0, 0)):anchorPoint(cc.p(0, 1)):xy(280, 210):addTo(slot1)

					if not slot3.fourSign then
						rich.createWithWidth(slot3.fourStr, 40, nil, 1240, nil, cc.p(0, 0)):anchorPoint(cc.p(0, 1)):xy(280, 150):addTo(slot1):setOpacity(130)
					end

					slot4.imgChip:texture(slot3.icon)
				end,
				onAfterBuild = function (slot0)
					if slot0:getInnerContainerSize().height <= slot0:getContentSize().height then
						slot0:setTouchEnabled(false)
					end
				end
			}
		}
	}
}
slot1.RESOURCE_STYLES = {
	clickClose = true,
	blackLayer = true,
	backGlass = true
}

function slot1.onCreate(slot0, slot1)
	slot0.cardDBID = slot1
	slot3 = {}
	slot0.showDatas = idlertable.new(slot3)
	slot2 = {}
	uv3 = "cardDBID"

	for slot7, slot8 in pairs(slot3.getComplateSuitAttrByCard(slot0.cardDBID)) do
		uv11 = "cardDBID"

		for slot14, slot15 in ipairs(slot8.data) do
			slot18 = string.format(gLanguageCsv.chipSuitCount, slot15[1], string.format("%s(%s)", ui.QUALITY_DARK_COLOR[slot15[2]], gLanguageCsv[ui.QUALITY_COLOR_TEXT[slot15[2]]]))

			if gChipSuitCsv[slot10][slot15[2]][slot15[1]].skillID == 0 then
				for slot22 = 1, 3 do
					if slot16["attrType" .. slot22] and slot23 ~= 0 then
						slot18 = slot18 .. string.format(gLanguageCsv.chipSuit01, getLanguageAttr(slot23), dataEasy.getAttrValueString(slot23, slot16["attrNum" .. slot22]))
					end

					if slot16["attrType" .. slot22 + 1] and slot24 ~= 0 then
						slot18 = slot18 .. "#C0xFFFCED#, "
					end
				end
			else
				slot9.fourStr = string.gsub(slot18 .. "#C0xFFFCED#" .. string.gsub(dataEasy.getSkillDesc(csv.skill[slot16.skillID]), "#C0x5B545B#", "#C0xFFFCED#"), "#C0x5c9970#", "#C0x91e1b1#")
				slot9.fourSign = slot15[3]
			end
		end

		table.insert(slot2, {
			icon = slot11.getSuitRes(slot8.suitId, slot8.data),
			name = slot16.suitName,
			twoStr = slot18,
			twoSign = slot15[3]
		})
	end

	if #slot2 == 0 then
		slot0.txtTip:show()
		slot0.list:hide()
	else
		slot0.showDatas:set(slot2)
	end
end

return slot1
