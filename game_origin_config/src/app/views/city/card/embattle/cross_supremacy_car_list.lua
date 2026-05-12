slot2 = class("CrossSupremacyEmbattleCardList", require("app.views.city.card.embattle.embattle_card_list"))
slot2.RESOURCE_FILENAME = "common_battle_card_list.json"
slot2.RESOURCE_BINDING = {
	textNotRole = "emptyTxt",
	item = "item",
	list = {
		varname = "cardList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				padding = 4,
				data = bindHelper.self("allCardDatas"),
				item = bindHelper.self("item"),
				emptyTxt = bindHelper.self("emptyTxt"),
				dataFilterGen = bindHelper.self("onFilterCards", true),
				dataOrderCmpGen = bindHelper.self("onSortCards", true),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "card_icon",
						props = {
							unitId = slot3.unit_id,
							advance = slot3.advance,
							rarity = slot3.rarity,
							star = slot3.star,
							grayState = slot3.battle > 0 and 1 or 0,
							levelProps = {
								data = slot3.level
							},
							onNode = function (slot0)
								slot0:xy(-2, -2)
							end
						}
					})

					if slot3.battle == 1 then
						slot1:get("textNote"):show()
						slot1:get("textNote"):text(gLanguageCsv.firstTeam)
					elseif slot3.battle == 2 then
						slot1:get("textNote"):show()
						slot1:get("textNote"):text(gLanguageCsv.secondTeam)
					elseif slot3.battle >= 3 then
						slot1:get("textNote"):show()
						slot1:get("textNote"):text(gLanguageCsv.thirdTeam)
					else
						slot1:get("textNote"):hide()
					end

					uiEasy.addTextEffect1(slot1:get("textNote"))
					slot1:onTouch(functools.partial(slot0.clickCell, slot3))
				end,
				onBeforeBuild = function (slot0)
					slot0.emptyTxt:hide()
				end,
				onAfterBuild = function (slot0)
					if #itertools.values(slot0.data) == 0 then
						slot0.emptyTxt:show()
					else
						slot0.emptyTxt:hide()
					end
				end,
				asyncPreload = 13
			},
			handlers = {
				clickCell = bindHelper.self("onCardItemTouch", true),
				initItem = bindHelper.self("initItem", true)
			}
		}
	},
	btnPanel = {
		varname = "btnPanel",
		binds = {
			event = "extend",
			class = "sort_menus",
			props = {
				expandUp = true,
				data = bindHelper.self("sortDatas"),
				btnClick = bindHelper.self("onSortMenusBtnClick", true),
				onNode = function (slot0)
					slot0:xy(-930, -480):z(18)
				end
			}
		}
	}
}

function slot2.onSortCards(slot0, slot1)
	uv2 = "onSortCards"
	slot2 = slot2.onSortCards(slot0, slot1)

	return function (slot0, slot1)
		if slot0.battle ~= slot1.battle then
			if slot0.battle ~= 0 and slot1.battle ~= 0 then
				return slot0.battle < slot1.battle
			end

			return slot1.battle <= slot0.battle
		end

		uv2 = "battle"

		return slot2(slot0, slot1)
	end
end

function slot2.getBattle(slot0, slot1)
	if slot1 and slot1 ~= 0 then
		return slot1 <= 6 and 1 or 2
	else
		return 0
	end
end

function slot2.initAllCards(slot0)
	idlereasy.any({
		slot0.cards
	}, function (slot0, slot1)
		slot3 = nil

		for slot7, slot8 in ipairs(slot1) do
			slot9 = gGameModel.cards:find(slot8)
			slot11 = slot9
			slot10 = slot9.read(slot11, "card_id", "skin_id", "fighting_point", "level", "star", "advance", "created_time")
			uv11 = "ipairs"
			slot12 = slot8
			uv12 = "ipairs"

			dataEasy.tryCallFunc(slot12.cardList, "updatePreloadCenterIndex")

			if slot7 == #slot1 then
				uv11 = "ipairs"

				slot11.allCardDatas:update({
					[slot8] = slot11.limtFunc(slot12, slot10.card_id, slot10.skin_id, slot10.fighting_point, slot10.level, slot10.star, slot10.advance, slot10.created_time, 0)
				})
			end
		end
	end)
	idlereasy.any({
		slot0.battleCardsData
	}, function (slot0, slot1)
		slot2 = {
			{},
			{},
			{}
		}
		slot3 = {}

		for slot7, slot8 in pairs(slot1) do
			for slot12, slot13 in pairs(slot8) do
				slot14 = gGameModel.cards:find(slot13)
				slot2[slot7] = slot2[slot7] or {}
				slot2[slot7][slot12] = slot13
				slot3[slot13] = slot7
			end
		end

		uv4 = "pairs"

		for slot7, slot8 in slot4.allCardDatas:pairs() do
			slot8:proxy().battle = 0
		end

		for slot7, slot8 in ipairs(slot1) do
			for slot12, slot13 in pairs(slot8) do
				uv14 = "pairs"
				slot14.allCardDatas:atproxy(slot13).battle = slot7
			end
		end

		uv4 = "pairs"

		slot4.clientBattleCards:set(slot2, true)
	end)
end

return slot2
