slot1 = class("GemDetailsView", cc.load("mvc").ViewBase)
slot2 = require("app.views.city.card.gem.tools")
slot3 = 2
slot4 = 6
slot1.RESOURCE_FILENAME = "gem_details.json"
slot1.RESOURCE_BINDING = {
	["panel.list"] = "list",
	["panel.property"] = "property",
	["panel.name"] = "panelName",
	["panel.icon"] = "icon",
	["panel.txt"] = "txt",
	panel = "panel",
	["panel.panelLab"] = "panelLab",
	["panel.quality"] = "quality",
	["panel.item"] = "item",
	["panel.mask"] = "mask",
	["panel.quile"] = "quile",
	["panel.intensify"] = {
		varname = "intensify",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("intensifyFunc")
			}
		}
	},
	["panel.inlay"] = {
		varname = "inlay",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("inlayFunc")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.slotIdx = slot1.slotIdx
	slot2 = slot0.inlay:get("txt")
	slot3 = gLanguageCsv.spaceDischarge
	slot0.cardID = slot1.cardID

	if slot1.dbid then
		slot3 = (not gGameModel.cards:find(slot0.cardID):read("gems")[slot0.slotIdx] or gLanguageCsv.spaceExchange2) and gLanguageCsv.spaceInlay
	end

	slot2:text(slot3)
	slot0.mask:visible(false)

	if slot1.dbid then
		slot0.dbid = slot1.dbid
	else
		slot0.unEquip = true
		slot0.dbid = gGameModel.cards:find(slot0.cardID):read("gems")[slot0.slotIdx]
	end

	slot0.cb = slot1.cb

	idlereasy.when(gGameModel.gems:find(slot0.dbid):getIdler("level"), function (slot0, slot1)
		uv2 = "initPanel"
		uv4 = "initPanel"
		uv5 = "initPanel"

		slot2:initPanel(slot4.panel, slot5.dbid, slot1)
	end)
	slot0.txt:visible(false)
	slot0.panelLab:visible(false)

	slot5 = slot1.pos
	slot7 = nil
	slot8 = slot0.panel:size().width

	slot0.panel:x(slot0:getResourceNode():convertToNodeSpace(cc.p(slot1.align == "left" and slot5.x - slot8 / 2 or slot5.x + slot8 / 2, 0)).x)

	if slot1.dbid and slot1.slotIdx and gGameModel.cards:find(slot0.cardID):read("gems")[slot0.slotIdx] then
		slot0:createSmallPanel(slot1, slot10[slot0.slotIdx], gGameModel.gems:find(slot10[slot0.slotIdx]):read("level"))
	end
end

function slot1.initPanel(slot0, slot1, slot2, slot3)
	slot5 = slot1:multiget("list", "quality", "name", "quile", "property", "icon", "panelLab", "txt", "item")

	slot5.list:removeAllChildren()
	slot5.list:setScrollBarEnabled(false)

	slot6 = {}
	slot7 = gGameModel.gems:find(slot2):read("gem_id")
	slot8 = dataEasy.getCfgByKey(slot7)
	slot9 = slot8.quality

	slot5.quality:text(csv.gem.quality[slot3]["qualityNum" .. slot9])
	slot5.name:text(slot8.name)
	text.addEffect(slot5.name, {
		color = ui.COLORS.QUALITY_DARK[slot9]
	})

	if not csv.gem.gem[slot7] or not csv.gem.gem[slot7].gemDescribe then
		slot5.property:visible(false)
		slot5.quile:y(slot0.property:y())
		slot5.quality:y(slot0.property:y())
	else
		slot5.property:text(csv.gem.gem[slot7].gemDescribe)
	end

	slot14 = {
		class = "icon_key",
		props = {
			noListener = true,
			data = {
				key = slot7
			},
			specialKey = {
				leftTopLv = slot3
			},
			onNode = function (slot0)
			end
		}
	}

	bind.extend(slot0, slot5.icon, slot14)

	for slot14 = 1, math.huge do
		if slot8["attrType" .. slot14] and slot8["attrType" .. slot14] ~= 0 and slot8["attrNum" .. slot14] and slot8["attrNum" .. slot14][slot3] then
			slot16 = slot5.txt:clone():show()

			slot16:get("txt"):text(gLanguageCsv["attr" .. game.ATTRDEF_TABLE[slot8["attrType" .. slot14]]:gsub("^%l", string.upper)])
			slot16:get("number"):text("+" .. dataEasy.getAttrValueString(slot8["attrType" .. slot14], slot8["attrNum" .. slot14][slot3]))
			slot16:get("number"):x(slot16:get("txt"):width() + 10)
			dataEasy.tryCallFunc(slot5.list, "updatePreloadCenterIndex")
			slot5.list:pushBackCustomItem(slot16)
		else
			break
		end
	end

	slot5.item:visible(false)

	slot11 = gGameModel.cards:find(slot0.cardID):read("gems")
	slot12 = false

	if slot8.suitID then
		for slot17, slot18 in pairs(slot11) do
			if slot2 == slot18 then
				slot12 = true
			end
		end

		slot14 = {}

		if slot12 then
			slot15 = {
				[slot19] = 0
			}
			uv16 = "gGameModel"
			uv17 = "gems"

			for slot19 = slot16, slot17 do
			end

			for slot19 = 1, 9 do
				if slot11[slot19] and csv.gem.gem[gGameModel.gems:find(slot20):read("gem_id")].suitID == slot13 then
					uv23 = "gGameModel"

					for slot26 = slot23, slot22.quality do
						slot15[slot26] = slot15[slot26] + 1
					end
				end
			end

			for slot19 = 1, 9 do
				uv20 = "gGameModel"
				uv21 = "gems"

				for slot23 = slot20, slot21 do
					if slot19 <= slot15[slot23] then
						slot14[slot19] = slot23
					end
				end
			end
		end

		slot5.list:pushBackCustomItem(slot5.item:clone():show())

		slot16, slot17 = next(gGemSuitCsv[slot13])

		for slot21 = 1, 9 do
			if slot17[slot21] then
				slot0:showText(slot5, slot21, slot14[slot21], slot8)
			end
		end
	end
end

function slot1.showText(slot0, slot1, slot2, slot3, slot4)
	if gGemSuitCsv[slot4.suitID][slot3 or slot4.quality][slot2] == nil then
		return
	end

	slot7 = "#C0x60C456#"

	if not slot3 then
		slot7 = "#C0xB7B09E#"
	end

	slot13 = gLanguageCsv[ui.QUALITY_COLOR_TEXT[slot5]]
	slot8 = slot6.suitName .. string.format("%s(%s)%s", string.format(gLanguageCsv.numSuit, slot2), slot13, gLanguageCsv.symbolColon)
	slot9 = nil

	for slot13 = 1, math.huge do
		if slot6["attrType" .. slot13] and slot6["attrType" .. slot13] ~= 0 then
			if slot9 then
				slot9 = slot9 .. "  " .. gLanguageCsv["attr" .. string.caption(game.ATTRDEF_TABLE[slot6["attrType" .. slot13]])] .. "+" .. dataEasy.getAttrValueString(slot6["attrType" .. slot13], slot6["attrNum" .. slot13])
			else
				slot9 = slot15 .. "+" .. dataEasy.getAttrValueString(slot6["attrType" .. slot13], slot6["attrNum" .. slot13])
			end
		else
			break
		end
	end

	slot10 = slot1.panelLab:clone():show()
	slot11 = rich.createWithWidth(slot7 .. slot8 .. slot9 .. slot7, 40, cc.size(700, 50), 700, 0):anchorPoint(0, 1)

	slot10:height(slot11:height())
	slot11:addTo(slot10):y(slot11:height()):z(2)
	slot1.list:pushBackCustomItem(slot10)
end

function slot1.createSmallPanel(slot0, slot1, slot2)
	slot3 = slot1.pos
	slot5 = nil
	slot6 = slot0.panel:size().width
	slot8 = slot0.panel:clone():addTo(slot0:getResourceNode(), 100)

	slot8:x(slot0:getResourceNode():convertToNodeSpace(cc.p((slot1.align == "left" and "right" or "left") == "left" and slot3.x - slot6 / 2 or slot3.x + slot6 / 2, 0)).x)
	slot0:initPanel(slot8, slot2, gGameModel.gems:find(slot2):read("level"))
	slot8:get("bg"):height(900)
	slot8:get("intensify"):visible(false)
	slot8:get("inlay"):visible(false)
	ccui.ImageView:create("city/card/helditem/bag/icon_cd.png"):align(cc.p(0.5, 0.5), 30, slot8:size().height - 40):addTo(slot8:get("icon"), 9999, "isEquiped"):xy(150, 150)
end

function slot1.intensifyFunc(slot0, ...)
	gGameUI:stackUI("city.card.gem.strengthen", nil, , slot0.dbid)
end

function slot1.inlayFunc(slot0, ...)
	if slot0.unEquip then
		slot3 = slot0.onClose

		slot3(slot0)

		uv3 = "unEquip"

		slot3.unEquipGem(slot0.cardID, slot0.slotIdx)

		return
	end

	slot0:onClose()

	if gGameModel.cards:find(slot0.cardID):read("gems")[slot0.slotIdx] then
		uv6 = "unEquip"

		slot6.swapGem(slot0.cardID, slot0.slotIdx, slot0.dbid)
	else
		uv6 = "unEquip"

		slot6.equipGem(slot3, slot4, slot5)
	end
end

function slot1.onCleanup(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onCleanup(slot0)
end

return slot1
