function slot0(slot0, slot1)
	slot2 = ccui.Scale9Sprite:create()

	slot2:initWithFile(cc.rect(60, 60, 1, 1), "common/box/mask_panel_exercise.png")
	slot2:size(slot1.width - 20, slot1.height - 20):alignCenter(slot0:size())

	return slot2
end

slot1 = class("ChipSelectSpriteView", Dialog)
slot1.RESOURCE_FILENAME = "chip_select_sprite.json"
slot1.RESOURCE_BINDING = {
	panel404 = "panel404",
	subList = "subList",
	item = "item",
	num = "num",
	title = "title",
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
				columnSize = 3,
				asyncPreload = 9,
				data = bindHelper.self("data"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				dataOrderCmp = function (slot0, slot1)
					if slot0.chipNum ~= slot1.chipNum then
						return slot1.chipNum < slot0.chipNum
					end

					return slot1.fight < slot0.fight
				end,
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
							dbid = slot3.dbId,
							levelProps = {
								data = slot3.level
							},
							onNode = function (slot0)
								slot0:scale(1.2):alignCenter(slot0:size())
							end
						}
					})
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot1, slot2, slot3)
						}
					})
					slot1:get("isCur"):visible(slot3.isCur)

					if slot3.isCur then
						uv7 = "bind"

						slot1:add(slot7(slot1, slot1:get("bg"):getContentSize()), 90)
					end

					bind.extend(slot0, slot1:get("chipPanel"), {
						class = "chips_panel",
						props = {
							panelIdx = 1,
							noIdlerListener = true,
							data = slot3.dbId,
							onItem = function (slot0, slot1, slot2, slot3)
								if slot3 then
									slot1:get("defaultLv"):y(0)
								end

								slot1:get("effect_line"):hide()
							end
						}
					})
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

	for slot8, slot9 in ipairs(gGameModel.role:read("cards")) do
		slot10 = gGameModel.cards:find(slot9)
		slot13 = csv.unit[csv.cards[slot10:read("card_id", "skin_id", "fighting_point", "level", "star", "advance").card_id].unitID]

		for slot19 = 1, 6 do
			if slot10:read("chip")[slot19] then
				slot15 = 0 + 1
			end
		end

		slot3[slot9] = {
			dbId = slot9,
			cardId = slot11.card_id,
			unitId = dataEasy.getUnitId(slot11.card_id, slot11.skin_id),
			rarity = slot13.rarity,
			attr1 = slot13.natureType,
			attr2 = slot13.natureType2,
			fight = slot11.fighting_point,
			level = slot11.level,
			star = slot11.star,
			advance = slot11.advance,
			isCur = slot1 == slot9,
			chipNum = slot15
		}
	end

	slot0.cardDBID = slot1
	slot0.data = slot3

	slot0.panel404:visible(itertools.size(slot3) == 0)
	Dialog.onCreate(slot0)
end

function slot1.onItemClick(slot0, slot1, slot2, slot3, slot4)
	if slot0.cardDBID == slot4.dbId then
		return
	end

	if slot0.cb then
		slot0.cb(slot4.dbId)
	end

	slot0:onClose()
end

return slot1
