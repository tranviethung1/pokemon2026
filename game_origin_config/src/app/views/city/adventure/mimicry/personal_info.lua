slot0 = {
	"lv",
	"lan",
	"zi",
	"cheng"
}
slot1 = class("MimicryPersonalInfoView", Dialog)
slot1.RESOURCE_FILENAME = "mimicry_personal_info.json"
slot1.RESOURCE_BINDING = {
	["rightPanel.list2"] = "subList",
	battleNum = "battleNum",
	title = "title",
	["rightPanel.noBuff"] = "noBuff",
	["rightPanel.item"] = "item",
	roleName = "roleName",
	leftPanel = "leftPanel",
	levelNode = "levelNode",
	lv = "lv",
	rightPanel = "rightPanel",
	icon = {
		binds = {
			event = "extend",
			class = "role_logo",
			props = {
				vip = false,
				level = false,
				logoId = bindHelper.self("logoId"),
				frameId = bindHelper.self("frameId"),
				onNode = function (slot0)
					slot0:scale(1)
				end
			}
		}
	},
	["rightPanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 5,
				data = bindHelper.self("buffDate"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot3
					uv9 = "get"

					slot1:get("bg"):texture(string.format("city/adventure/mimicry/icon_ntdz_%s.png", slot9[slot4.quality]))
					slot1:get("icon"):texture(slot4.icon1)
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.logoId = idler.new(slot1.logo)
	slot0.frameId = idler.new(slot1.frame)
	slot0.buffDate = idlers.new({})

	if not slot1.buff_ids or #slot1.buff_ids == 0 then
		slot0.noBuff:show()
	end

	slot2 = {}

	for slot7, slot8 in ipairs(slot1.buff_ids or {}) do
		table.insert(slot2, csv.mimicry.buffs[slot8])
	end

	table.sort(slot2, function (slot0, slot1)
		if slot0.quality ~= slot1.quality then
			return slot1.quality < slot0.quality
		end

		return slot1.level < slot0.level
	end)
	slot0.buffDate:update(slot2)
	slot0.roleName:text(slot1.name)
	slot0.lv:text(slot1.level)

	slot8 = 3

	adapt.oneLinePos(slot0.roleName, {
		slot0.levelNode,
		slot0.lv
	}, cc.p(slot8, 0))

	for slot8 = 1, 6 do
		slot0.leftPanel:get("icon" .. slot8):visible(true)

		if slot1 and slot1.battle_cards and slot1.battle_cards[slot8] then
			slot10 = slot1.battle_cards[slot8]
			slot4 = 0 + slot10.fighting_point
			slot11 = csv.mimicry.cards[slot10.card_csv_id]
			slot12 = dataEasy.getUnitId(slot11.cardID, slot10.skin_id)

			slot9:removeAllChildren()
			bind.extend(slot0, slot9, {
				class = "card_icon",
				props = {
					showAttribute = false,
					unitId = slot12,
					advance = slot11.advance,
					levelProps = {
						data = slot11.level
					},
					star = slot10.star,
					rarity = csv.unit[slot12].rarity,
					onNode = function (slot0)
						slot0:scale(0.8)
					end
				}
			})
		end
	end

	slot0.battleNum:text(slot4)
	adapt.oneLinePos(slot0.title, slot0.battleNum, cc.p(3, 0))
	Dialog.onCreate(slot0)
end

return slot1
