slot0 = class("GemDetailsView", cc.load("mvc").ViewBase)
slot1 = require("app.views.city.card.gem.tools")
slot0.RESOURCE_FILENAME = "common_gem_details.json"
slot0.RESOURCE_BINDING = {
	["baseNode.property"] = "property",
	["baseNode.panelLab"] = "panelLab",
	["baseNode.icon"] = "icon",
	["baseNode.txt"] = "txt",
	baseNode = "baseNode",
	["baseNode.item"] = "item",
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
	},
	["baseNode.confirm"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("confirmClick")
			}
		}
	},
	["baseNode.confirm.text"] = {
		varname = "confirmText",
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

function slot0.onCreate(slot0, slot1, slot2)
	slot3, slot4 = nil
	slot5 = gGameModel.gems:find(slot1.dbId)
	slot0.dbid = slot1.dbId
	slot0.dissatisfy = slot1.dissatisfy
	slot3 = slot5:read("gem_id")
	slot0.cb = slot2
	slot6 = {}
	slot7 = dataEasy.getCfgByKey(slot3)

	slot0.item:visible(false)

	slot8 = slot7.quality

	slot0.quality:text(csv.gem.quality[slot5:read("level")]["qualityNum" .. slot8])
	slot0.panelName:text(slot7.name)
	text.addEffect(slot0.panelName, {
		color = ui.COLORS.QUALITY_DARK[slot8]
	})

	if csv.gem.gem[slot3] then
		slot0.property:text(csv.gem.gem[slot3].gemDescribe)
	else
		slot0.property:visible(false)
		slot0.quile:y(slot0.property:y())
		slot0.quality:y(slot0.property:y())
	end

	slot10 = gLanguageCsv.gemPlac
	slot11 = slot1.pos
	slot13 = slot0:getResourceNode():convertToNodeSpace(cc.p(slot11.x, 0)).x + 35
	slot14 = slot11.y - 85

	if slot1.align == "left" then
		slot10 = gLanguageCsv.discharge
		slot14 = slot11.y + 65
	end

	slot0.confirmText:text(slot10)
	slot0.baseNode:xy(slot13, slot14)

	slot0.align = slot1.align
	slot15 = slot0.list

	slot15:setScrollBarEnabled(false)

	slot18 = {
		class = "icon_key",
		props = {
			noListener = true,
			data = {
				key = slot3
			},
			specialKey = {
				leftTopLv = slot4
			},
			onNode = function (slot0)
			end
		}
	}

	bind.extend(slot0, slot0.icon, slot18)

	for slot18 = 1, math.huge do
		if slot7["attrType" .. slot18] and slot7["attrType" .. slot18] ~= 0 and slot7["attrNum" .. slot18] and slot7["attrNum" .. slot18][slot4] then
			slot20 = slot0.txt:clone()

			slot20:get("txt"):text(gLanguageCsv["attr" .. game.ATTRDEF_TABLE[slot7["attrType" .. slot18]]:gsub("^%l", string.upper)])
			slot20:get("number"):text("+" .. dataEasy.getAttrValueString(slot7["attrType" .. slot18], slot7["attrNum" .. slot18][slot4]))
			slot20:get("number"):x(slot20:get("txt"):width() + 10)
			dataEasy.tryCallFunc(slot0.list, "updatePreloadCenterIndex")
			slot0.list:pushBackCustomItem(slot20)
		else
			break
		end
	end

	slot17 = "#C0xB7B09E#"

	if gGemSuitCsv[csv.gem.gem[slot3].suitID] and gGemSuitCsv[slot15][slot8] then
		slot0.list:pushBackCustomItem(slot0.item:clone():show())

		for slot22 = 1, 9 do
			if slot16[slot22] then
				slot28 = gLanguageCsv[ui.QUALITY_COLOR_TEXT[slot8]]
				slot23 = slot16[slot22].suitName .. string.format("%s(%s)%s", string.format(gLanguageCsv.numSuit, slot16[slot22].suitNum), slot28, gLanguageCsv.symbolColon)
				slot24 = nil

				for slot28 = 1, math.huge do
					if slot16[slot22]["attrType" .. slot28] and slot16[slot22]["attrType" .. slot28] ~= 0 then
						if slot24 then
							slot24 = slot24 .. "  " .. gLanguageCsv["attr" .. string.caption(game.ATTRDEF_TABLE[slot16[slot22]["attrType" .. slot28]])] .. "+" .. dataEasy.getAttrValueString(slot16[slot22]["attrType" .. slot28], slot16[slot22]["attrNum" .. slot28])
						else
							slot24 = slot30 .. "+" .. dataEasy.getAttrValueString(slot16[slot22]["attrType" .. slot28], slot16[slot22]["attrNum" .. slot28])
						end
					else
						break
					end
				end

				slot25 = slot0.panelLab:clone():show()
				slot26 = rich.createWithWidth(slot17 .. slot23 .. slot24 .. slot17, 40, cc.size(700, 90), 700, 0):anchorPoint(0, 1)

				slot25:height(slot26:height())
				slot26:addTo(slot25):y(slot25:height()):z(2)
				slot0.list:pushBackCustomItem(slot25)
			end
		end
	end

	slot0.txt:visible(false)
	slot0.panelLab:visible(false)
end

function slot0.confirmClick(slot0)
	if not slot0.dissatisfy then
		gGameUI:showTip(gLanguageCsv.gemUpperLimit)

		return
	end

	if slot0.cb then
		slot0.cb(slot0.dbid, slot0.align)
	end

	slot0:onClose()
end

return slot0
