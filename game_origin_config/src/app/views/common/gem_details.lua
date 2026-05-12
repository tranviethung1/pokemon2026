slot0 = class("GemDetailsView", cc.load("mvc").ViewBase)
slot1 = require("app.views.city.card.gem.tools")
slot0.RESOURCE_FILENAME = "common_details.json"
slot0.RESOURCE_BINDING = {
	["baseNode.item"] = "item",
	["baseNode.panelLab"] = "panelLab",
	["baseNode.bg2"] = "bg2",
	["baseNode.icon"] = "icon",
	["baseNode.txt"] = "txt",
	baseNode = "baseNode",
	["baseNode.property"] = "property",
	["baseNode.list"] = "list",
	["baseNode.quality"] = "quality",
	["baseNode.name"] = "panelName",
	["baseNode.quile"] = "quile",
	["baseNode.inlay"] = {
		varname = "inlay",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("inlayFunc")
			}
		}
	},
	["baseNode.bg"] = {
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
		slot4 = gGameModel.gems:find(slot1.dbId)
		slot2 = slot4:read("gem_id")
		slot3 = slot4:read("level")
	else
		slot2 = slot1.key
		slot3 = 1
	end

	slot4 = {}
	slot5 = dataEasy.getCfgByKey(slot2)

	slot0.item:visible(false)

	slot6 = slot5.quality

	slot0.quality:text(csv.gem.quality[slot3]["qualityNum" .. slot6])
	slot0.panelName:text(slot5.name)
	text.addEffect(slot0.panelName, {
		color = ui.COLORS.QUALITY_DARK[slot6]
	})

	if csv.gem.gem[slot2] then
		slot0.property:text(csv.gem.gem[slot2].gemDescribe)
	else
		slot0.property:visible(false)
		slot0.quile:y(slot0.property:y())
		slot0.quality:y(slot0.property:y())
	end

	slot0.list:setScrollBarEnabled(false)

	function slot13(slot0)
	end

	bind.extend(slot0, slot0.icon, {
		class = "icon_key",
		props = {
			noListener = true,
			data = {
				key = slot2
			},
			specialKey = {
				leftTopLv = slot3
			},
			onNode = slot13
		}
	})

	slot9 = 0

	for slot13 = 1, math.huge do
		if slot5["attrType" .. slot13] and slot5["attrType" .. slot13] ~= 0 and slot5["attrNum" .. slot13] and slot5["attrNum" .. slot13][slot3] then
			slot15 = slot0.txt:clone()

			slot15:get("txt"):text(gLanguageCsv["attr" .. game.ATTRDEF_TABLE[slot5["attrType" .. slot13]]:gsub("^%l", string.upper)])
			slot15:get("number"):text("+" .. dataEasy.getAttrValueString(slot5["attrType" .. slot13], slot5["attrNum" .. slot13][slot3]))
			slot15:get("number"):x(slot15:get("txt"):width() + 10)
			dataEasy.tryCallFunc(slot0.list, "updatePreloadCenterIndex")

			slot8 = 0 + slot0.txt:height()

			slot0.list:pushBackCustomItem(slot15)
		else
			break
		end
	end

	slot12 = "#C0xB7B09E#"

	if gGemSuitCsv[csv.gem.gem[slot2].suitID] and gGemSuitCsv[slot10][slot6] then
		slot0.list:pushBackCustomItem(slot0.item:clone():show())

		for slot17 = 1, 9 do
			if slot11[slot17] then
				slot23 = gLanguageCsv[ui.QUALITY_COLOR_TEXT[slot6]]
				slot18 = slot11[slot17].suitName .. string.format("%s(%s)%s", string.format(gLanguageCsv.numSuit, slot11[slot17].suitNum), slot23, gLanguageCsv.symbolColon)
				slot19 = nil

				for slot23 = 1, math.huge do
					if slot11[slot17]["attrType" .. slot23] and slot11[slot17]["attrType" .. slot23] ~= 0 then
						if slot19 then
							slot19 = slot19 .. "  " .. gLanguageCsv["attr" .. string.caption(game.ATTRDEF_TABLE[slot11[slot17]["attrType" .. slot23]])] .. "+" .. dataEasy.getAttrValueString(slot11[slot17]["attrType" .. slot23], slot11[slot17]["attrNum" .. slot23])
						else
							slot19 = slot25 .. "+" .. dataEasy.getAttrValueString(slot11[slot17]["attrType" .. slot23], slot11[slot17]["attrNum" .. slot23])
						end
					else
						break
					end
				end

				slot20 = slot0.panelLab:clone():show()
				slot21 = rich.createWithWidth(slot12 .. slot18 .. slot19 .. slot12, 40, cc.size(700, 90), 700, 0):anchorPoint(0, 1)

				slot20:height(slot21:height())
				slot21:addTo(slot20):y(slot20:height()):z(2)

				slot9 = slot9 + slot21:height()

				slot0.list:pushBackCustomItem(slot20)
			end
		end
	end

	if slot0.list:height() < slot8 + slot9 + 50 then
		slot14 = slot13 - slot0.list:height()

		slot0.list:height(slot13 + 10)
		slot0.list:y(slot0.list:y() - slot14)
		slot0.bg:height(slot0.bg:height() + slot14 + 20)
		slot0.baseNode:height(slot0.baseNode:height() + slot14 + 10)
		slot0.bg2:height(slot13 + 20)
		slot0.bg2:y(slot0.list:y() + slot13 + 10)
	end

	slot0.txt:visible(false)
	slot0.panelLab:visible(false)
end

return slot0
