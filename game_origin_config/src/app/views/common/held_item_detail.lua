slot0 = require("app.views.city.card.helditem.tools")
slot1 = class("HeldItemDetailView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "common_helditem_detail.json"
slot1.RESOURCE_BINDING = {
	innerList = "innerList",
	item = "item",
	["baseNode.imgBg"] = "bgImg",
	baseNode = "baseNode",
	["baseNode.center"] = "center",
	["baseNode.center.list"] = "centerList",
	item1 = "item1",
	["baseNode.item"] = {
		binds = {
			event = "extend",
			class = "icon_key",
			props = {
				noListener = true,
				data = bindHelper.self("data")
			}
		}
	},
	["baseNode.textName"] = {
		varname = "textName",
		binds = {
			event = "text",
			idler = bindHelper.self("nameStr")
		}
	},
	["baseNode.textLv"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("level")
		}
	},
	["baseNode.down"] = {
		binds = {
			event = "visible",
			idler = bindHelper.self("hasShowCards")
		}
	},
	["baseNode.top.list"] = {
		varname = "attrList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				data = bindHelper.self("attrs"),
				item = bindHelper.self("innerList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = game.ATTRDEF_TABLE[slot3.attr]

					slot1:get("imgIcon"):texture(ui.ATTR_LOGO[slot4])
					slot1:get("textName"):text(gLanguageCsv["attr" .. string.caption(slot4)] .. ": ")
					slot1:get("textVal"):text("+" .. slot3.val)
					adapt.oneLinePos(slot1:get("textName"), slot1:get("textVal"), cc.p(10, 0), "left")
				end
			}
		}
	},
	["baseNode.down.list"] = {
		varname = "downlist",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("tabCards"),
				item = bindHelper.self("item1"),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "card_icon",
						props = {
							rarity = slot3.rarity,
							cardId = slot3.card.id,
							onNode = function (slot0)
								slot3 = 0.9

								slot0:scale(slot3)

								uv3 = "scale"

								slot0:alignCenter(slot3:size())
							end
						}
					})
				end
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0:getResourceNode():setTouchEnabled(false)

	slot3 = slot1.num
	slot0.data = {
		key = slot1.key,
		dbId = slot1.dbId
	}
	slot5 = slot1.level or 1
	slot6 = slot1.advance or 0

	if slot4 then
		slot7 = gGameModel.held_items:find(slot4)
		slot5 = slot7:read("level")
		slot6 = slot7:read("advance")
	end

	if slot6 > 0 then
		slot8 = csv.held_item.items[slot2].name .. " +" .. slot6
	end

	slot0.nameStr = idler.new(slot8)

	text.addEffect(slot0.textName, {
		color = ui.COLORS.QUALITY[slot7.quality]
	})

	slot0.level = idler.new(gLanguageCsv.textLv .. slot5)
	slot0.attrs = idlers.newWithMap({})
	slot0.tabCards = idlers.newWithMap({})
	slot11 = csv.held_item.advance_attrs[slot6]
	slot15 = {}

	for slot19, slot20 in ipairs(slot7.attrTypes) do
		table.insert(slot15, {
			attr = slot20,
			val = math.floor(slot7.attrNumRates[slot19] * slot11["attrRate" .. slot7.advanceAttrSeq][slot19] * (csv.held_item.level_attrs[slot5]["attrNum" .. slot7.strengthAttrSeq][slot19] + slot11["attrNum" .. slot7.advanceAttrSeq][slot19]))
		})
	end

	slot0.attrs:update(slot15)

	slot17 = {}

	for slot21, slot22 in csvMapPairs(csv.held_item.effect[slot7.effect1].exclusiveCards) do
		for slot26, slot27 in pairs(gCardsCsv[slot22]) do
			for slot31, slot32 in pairs(slot27) do
				table.insert(slot17, {
					card = slot32,
					rarity = csv.unit[slot32.unitID].rarity
				})
			end
		end
	end

	slot0.tabCards:update(slot17)

	slot0.hasShowCards = idler.new(#slot17 > 0)
	slot19 = {}

	for slot23 = 1, 100 do
		slot24 = slot7[string.format("effect%dLevelAdvSeq", slot23)]

		if not slot7["effect" .. slot23] or slot7["effect" .. slot23] == 0 or not slot24 or slot6 < slot24[1] then
			break
		end

		uv26 = "getResourceNode"

		table.insert(slot19, slot26.getStrinigByData(slot23, {
			cfg = slot7,
			advance = slot6,
			csvId = slot2
		}))
	end

	slot0.descList = beauty.textScroll({
		fontSize = 40,
		isRich = true,
		list = slot0.centerList,
		strs = "#C0x5B545B#" .. table.concat(slot19, "\n")
	})
	slot22 = slot0.baseNode:size()
	slot23 = slot0.bgImg:size()
	slot24 = slot0.baseNode:getChildren()

	if not slot18 then
		for slot29, slot30 in ipairs(slot0.centerList:getChildren()) do
			slot25 = 0 + slot30:size().height
		end

		slot26 = 275

		if slot25 < slot0.centerList:size().height then
			slot26 = 275 + slot27 - slot25
		end

		slot0.bgImg:size(slot23.width, slot23.height - slot26)

		slot31 = slot22.height - slot26

		slot0.baseNode:size(slot22.width, slot31)

		for slot31, slot32 in ipairs(slot24) do
			slot32:y(slot32:y() - slot26)
		end

		slot0.bgImg:y(slot0.bgImg:y() + slot26 / 2)
	end
end

function slot1.hitTestPanel(slot0, slot1)
	if slot0.descList:isTouchEnabled() then
		slot2 = slot0.baseNode
		slot3 = slot2:box()
		slot4 = slot2:parent():convertToWorldSpace(cc.p(slot3.x, slot3.y))
		slot3.x = slot4.x
		slot3.y = slot4.y

		return cc.rectContainsPoint(slot3, slot1)
	end

	return false
end

return slot1
