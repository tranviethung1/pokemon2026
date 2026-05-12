function slot0(slot0, slot1)
	slot2 = ccui.Scale9Sprite:create()

	slot2:initWithFile(cc.rect(60, 60, 1, 1), "common/box/mask_panel_exercise.png")
	slot2:size(slot1.width - 20, slot1.height - 20):alignCenter(slot0:size())

	return slot2
end

slot1 = class("GemSelectSpriteView", Dialog)
slot2 = require("app.views.city.card.gem.tools")
slot1.RESOURCE_FILENAME = "gem_select_sprite.json"
slot1.RESOURCE_BINDING = {
	panel404 = "panel404",
	title = "title",
	item = "item",
	lineList = "lineList",
	num = "num",
	closeBtn = {
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
				asyncPreload = 9,
				columnSize = 3,
				topPadding = 10,
				leftPadding = 10,
				data = bindHelper.self("data"),
				item = bindHelper.self("lineList"),
				cell = bindHelper.self("item"),
				dataOrderCmpGen = bindHelper.self("onSortCards", true),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1:get("item"), {
						class = "card_icon",
						props = {
							unitId = slot3.unitId,
							advance = slot3.advance,
							rarity = slot3.rarity,
							star = slot3.star,
							levelProps = {
								data = slot3.level
							},
							onNode = function (slot0)
							end
						}
					})
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot1, slot2, slot3)
						}
					})

					slot4 = gGameModel.cards:find(slot3.dbid)
					slot6 = slot1:get("bg")
					slot7 = slot6
					slot6 = slot6.getContentSize(slot7)
					uv7 = "bind"
					slot8 = cc.Sprite:create(csv.unit[slot3.unitId].cardShow):setOpacity(36)
					slot9 = slot8:size()
					slot10 = cc.p(-80, 0)
					slot11 = slot6

					slot8:alignCenter(slot6):setTextureRect(cc.rect((slot9.width - slot11.width) / 2 - slot10.x, (slot9.height - slot11.height) / 2 - slot10.y, slot11.width, slot11.height))
					cc.ClippingNode:create(slot7(slot1, slot6)):setAlphaThreshold(0.1):size(slot6):alignCenter({
						width = slot1:size().width - 20,
						height = slot1:size().height - 14
					}):add(slot8):addTo(slot1, 2)

					if slot3.isCur then
						uv17 = "bind"

						slot1:add(slot17(slot1, slot6), 90)
					end

					slot1:get("isCur"):visible(slot3.isCur)

					slot15 = slot4:read("gems")

					for slot19 = 1, 9 do
						uv20 = "extend"
						slot20, slot21 = slot20.isSlotLocked(slot3.dbid, slot19)

						if slot20 then
							slot1:get("icon" .. slot19):texture("city/card/gem/btn_lock2.png"):scale(0.6)
						elseif slot15[slot19] then
							slot1:get("icon" .. slot19):texture(dataEasy.getCfgByKey(gGameModel.gems:find(slot15[slot19]):read("gem_id")).icon)
						else
							slot1:get("icon" .. slot19):visible(false)
						end
					end

					slot1:get("num"):setString(slot3.qualityNum)
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0.cb = slot2

	slot0.item:visible(false)

	slot3 = {}
	slot4 = true

	for slot9, slot10 in ipairs(gGameModel.role:read("cards")) do
		slot11 = gGameModel.cards:find(slot10)
		slot13 = gGameModel.cards:find(slot10):read("card_id")
		slot4 = false
		slot15 = csv.unit[csv.cards[slot11:read("card_id", "skin_id", "fighting_point", "level", "star", "advance").card_id].unitID]
		slot16 = slot11:read("gems")

		for slot21 = 1, 9 do
			if slot16[slot21] then
				slot22 = gGameModel.gems:find(slot16[slot21])
				slot17 = csv.gem.quality[slot22:read("level")]["qualityNum" .. csv.gem.gem[slot22:read("gem_id")].quality] + 0
			end
		end

		slot3[slot10] = {
			id = slot12.card_id,
			unitId = dataEasy.getUnitId(slot12.card_id, slot12.skin_id),
			rarity = slot15.rarity,
			attr1 = slot15.natureType,
			attr2 = slot15.natureType2,
			fight = slot12.fighting_point,
			level = slot12.level,
			star = slot12.star,
			dbid = slot10,
			advance = slot12.advance,
			isCur = slot1 == slot10,
			qualityNum = slot17
		}
	end

	slot0.cardid = slot1
	slot0.data = idlers.newWithMap(slot3)

	slot0.panel404:visible(slot4)
	Dialog.onCreate(slot0)
end

function slot1.onSortCards(slot0, slot1)
	return function (slot0, slot1)
		if slot0.qualityNum ~= slot1.qualityNum then
			return slot1.qualityNum < slot0.qualityNum
		end

		return slot1.fight < slot0.fight
	end
end

function slot1.onItemClick(slot0, slot1, slot2, slot3, slot4)
	if slot0.cardid == slot4.dbid then
		return
	end

	slot0.cardid = slot4.dbid

	slot0:onClose()
end

function slot1.onClose(slot0)
	if slot0.cb then
		slot0.cb(slot0.cardid)
	end

	Dialog.onClose(slot0)
end

return slot1
