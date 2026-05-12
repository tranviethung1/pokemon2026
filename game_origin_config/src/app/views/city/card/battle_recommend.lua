function slot0(slot0)
	slot1 = {}
	slot2 = itertools.size(slot0)

	for slot6, slot7 in orderCsvPairs(slot0) do
		slot1[slot10] = slot1[csv.unit[csv.cards[slot7].unitID].natureType] or 0
		slot1[slot10] = slot1[slot10] + 1
	end

	slot3 = {}

	for slot7, slot8 in pairs(slot1) do
		table.insert(slot3, slot8)
	end

	table.sort(slot3, function (slot0, slot1)
		return slot1 < slot0
	end)

	slot6 = {}
	slot7 = {}

	for slot11, slot12 in csvPairs(csv.battle_card_halo) do
		if slot12.type == 1 then
			if itertools.size(slot12.args) <= #slot3 then
				for slot18 = 1, slot14 do
					if slot3[slot18] < slot13[slot18] then
						break
					end

					if slot18 == slot14 then
						slot20 = slot12.priority

						if not slot6[slot12.group] or slot20 >= slot6[slot19].priority then
							slot6[slot19] = {
								csvId = slot11,
								priority = slot20
							}
						end
					end
				end
			end
		elseif slot12.type == 2 then
			for slot17, slot18 in pairs(slot13) do
				if slot18[2] <= (slot1[slot18[1]] or 0) then
					slot7[slot11] = slot18[1]
				end
			end
		end
	end

	slot8 = "config/embattle/icon_gh.png"

	for slot13, slot14 in pairs(slot6) do
		if -1 < slot13 then
			slot9 = slot13
			slot8 = slot5[slot14.csvId].icon
		end
	end

	return slot8
end

function slot1(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot9 = slot2.bg:size()
	slot10 = cc.Sprite:create(slot1.cardData.icon)
	slot11 = slot10:size()
	slot12 = slot4 * slot1.cardData.scale
	slot13 = cc.p(slot1.cardData.posOffset.x / slot12 - slot5, -slot1.cardData.posOffset.y / slot12 + slot6)
	slot14 = cc.size(slot9.width / slot12, slot9.height / slot12)

	slot10:alignCenter(slot9):scale(slot12):setTextureRect(cc.rect((slot11.width - slot14.width) / 2 - slot13.x, (slot11.height - slot14.height) / 2 - slot13.y, slot14.width, slot14.height))

	if slot7 == "clippingBg" then
		cache.setShader(slot10, false, "hsl_gray_white")
		slot10:opacity(36)
	end

	slot0:removeChildByName(slot7)
	cc.ClippingNode:create(slot3):setAlphaThreshold(0.1):size(slot9):alignCenter(slot0:size()):add(slot10):addTo(slot0, slot8 and 1 or 2, slot7)
end

slot2 = cc.load("mvc").ViewBase
slot3 = class("CardBattleRecommendView", Dialog)
slot3.RESOURCE_FILENAME = "card_battle_recommend.json"
slot3.RESOURCE_BINDING = {
	subList = "subList",
	item = "item",
	btnClose = {
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
				data = bindHelper.self("battleDatas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("iconCard", "iconCardBg", "imgSpecialMark", "textSpecial", "bg", "iconAttr", "textAttr", "textDesc", "recommendPanel")

					slot4.textAttr:text(slot3.name)
					text.addEffect(slot4.textAttr, {
						outline = {
							color = ui.COLORS.NORMAL.WHITE
						}
					})
					slot4.textDesc:text(slot3.desc)
					slot4.iconAttr:texture(slot3.attrIcon)
					slot4.imgSpecialMark:texture(slot3.specialMarkBg):visible(slot3.specialMarkBg ~= "")
					adapt.setTextScaleWithWidth(slot4.textSpecial, slot3.specialMarkTitle, 110)
					slot4.recommendPanel:visible(slot3.isRecommend)

					slot5 = slot4.bg:size()
					slot6 = ccui.Scale9Sprite:create()
					slot7 = dataEasy.getCardIdAndStar(slot3.cardData.cardId)

					slot6:initWithFile(cc.rect(60, 60, 1, 1), "common/box/mask_panel_exercise.png")

					slot8 = slot6:size(slot5.width - 20, slot5.height - 20)
					slot8 = slot8.alignCenter

					slot8(slot8, slot5)

					uv8 = "multiget"

					slot8(slot1, slot3, slot4, slot6, 1, 92, 10, "clipping")

					uv8 = "multiget"

					slot8(slot1, slot3, slot4, slot6, 1.2, 20, 5, "clippingBg")
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.itemClick, slot1, slot0:getIdx(slot2), slot3)
						}
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	}
}

function slot3.onCreate(slot0, slot1)
	slot0.item:hide()
	slot0:initModel()

	slot0.battleDatas = idlertable.new({})
	slot3 = {}

	for slot7, slot8 in ipairs(slot0.cards:read()) do
		slot11 = csv.cards[gGameModel.cards:find(slot8):read("card_id", "name", "fighting_point", "level", "star", "advance").card_id]
		slot3[slot11.cardMarkID] = slot3[slot11.cardMarkID] or {}

		if not slot3[slot11.cardMarkID][slot11.branch] or slot13.fight < slot10.fighting_point then
			slot3[slot11.cardMarkID][slot11.branch] = {
				cardId = slot10.card_id,
				name = slot10.name ~= "" and slot10.name or slot11.name,
				rarity = csv.unit[slot11.unitID].rarity,
				fight = slot10.fighting_point,
				level = slot10.level,
				star = slot10.star,
				dbid = slot8,
				advance = slot10.advance
			}
		end
	end

	slot0.cardDatas = slot3
	slot4 = {}
	slot5 = {}

	for slot9, slot10 in orderCsvPairs(csv.card_battle_recommend) do
		for slot14, slot15 in orderCsvPairs(slot10.cards) do
			slot17 = csv.cards[slot15].cardMarkID

			if slot10.coreMark[slot14] == 1 then
				slot18 = slot3[slot17] and (slot3[slot17][slot16.branch] or slot3[slot17][0]) or {}
				slot19 = slot18.cardId or slot15
				slot21 = csv.unit[csv.cards[slot19].unitID]
				slot5 = {
					cardId = slot19,
					name = not slot18.name and slot20.name or slot18.name,
					advance = slot18.advance,
					rarity = slot21.rarity,
					fight = slot18.fighting_point or 0,
					icon = slot21.cardShow,
					scale = slot21.cardShowScale,
					posOffset = slot21.cardShowPosC
				}
			end
		end

		slot12 = table.insert
		slot13 = slot4
		slot14 = {
			csvId = slot9,
			cardData = slot5,
			name = slot10.name,
			desc = slot10.desc,
			specialMarkBg = slot10.specialMarkBg,
			specialMarkTitle = slot10.specialMarkTitle,
			sort = slot10.sort
		}

		if not csv.battle_card_halo[slot10.haloId] then
			uv15 = "item"

			if not slot15(slot10.cards) then
				slot15 = slot11.icon
			end
		end

		slot14.attrIcon = slot15
		slot14.isRecommend = slot10.isRecommend

		slot12(slot13, slot14)
	end

	table.sort(slot4, function (slot0, slot1)
		return slot1.sort < slot0.sort
	end)
	slot0.battleDatas:set(slot4)
	Dialog.onCreate(slot0)
end

function slot3.initModel(slot0)
	slot0.cards = gGameModel.role:getIdler("cards")
	slot0.battleCards = gGameModel.role:getIdler("battle_cards")
	slot0.vipLevel = gGameModel.role:getIdler("vip_level")
	slot0.roleLv = gGameModel.role:getIdler("level")
end

function slot3.onItemClick(slot0, slot1, slot2, slot3, slot4)
	gGameUI:stackUI("city.card.battle_detail", nil, {
		dialog = true
	}, slot0.battleDatas:read(), slot3.k, slot0.cardDatas)
end

return slot3
