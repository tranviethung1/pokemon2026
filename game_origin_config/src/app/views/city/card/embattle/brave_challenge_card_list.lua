slot0 = require("app.views.city.card.embattle.embattle_card_list")
slot1 = class("EmbattleCardList", slot0)
slot1.RESOURCE_FILENAME = "common_battle_card_list.json"
slot1.RESOURCE_BINDING = clone(rawget(slot0, "RESOURCE_BINDING"))
slot1.RESOURCE_BINDING.btnPanel = "btnPanel"

function slot1.initItem(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot2:size()

	bind.extend(slot1, slot2, {
		class = "card_icon",
		props = {
			unitId = slot4.unit_id,
			advance = slot4.advance,
			rarity = slot4.rarity,
			star = slot4.star,
			isNew = slot4.isNew,
			grayState = slot4.battle == 1 and 1 or 0,
			levelProps = {
				data = slot4.level
			},
			onNode = function (slot0)
				slot0:xy(-4, -4)
			end
		}
	})

	slot6 = slot2:get("textNote")

	slot6:visible(slot4.battle == 1)
	uiEasy.addTextEffect1(slot6)
	slot2:get("hpBar"):show():get("bar"):setPercent(slot4.states[1] * 100)
	slot2:get("mpBar"):show():get("bar"):setPercent(slot4.states[2] * 100)

	if slot4.states[1] > 0 then
		slot2:onTouch(functools.partial(slot1.clickCell, slot4))
	else
		slot2:get("deadMask"):show()
	end
end

function slot1.onSortCards(slot0, slot1)
	slot2 = slot0.seletSortKey
	slot2 = slot2.set

	slot2(slot2, 3)

	uv2 = "seletSortKey"
	slot2 = slot2.onSortCards(slot0, slot1)

	return function (slot0, slot1)
		slot3 = slot1.states

		if slot0.states[1] <= 0 then
			return false
		end

		if slot3[1] <= 0 then
			return true
		end

		uv4 = "states"

		return slot4(slot0, slot1)
	end
end

function slot1.initFilterBtn(slot0)
	slot0.filterCondition = idlertable.new()
	slot0.tabOrder = idler.new(true)
	slot0.seletSortKey = idler.new(1)

	idlereasy.any({
		slot0.filterCondition,
		slot0.seletSortKey,
		slot0.tabOrder
	}, function ()
		uv1 = "dataEasy"

		dataEasy.tryCallFunc(slot1.cardList, "filterSortItems", false)
	end)
end

function slot1.initAllCards(slot0)
end

function slot1.onCardItemTouch(slot0, slot1, slot2, slot3)
	if slot3.name == "began" then
		slot0.moved = false
		slot0.touchBeganPos = slot3

		slot0.deleteMovingItem()
	elseif slot3.name == "moved" then
		slot4 = math.abs(slot3.x - slot0.touchBeganPos.x)
		slot5 = math.abs(slot3.y - slot0.touchBeganPos.y)

		if not slot0.moved and not slot0.isMovePanelExist() and (ui.TOUCH_MOVED_THRESHOLD <= slot4 or ui.TOUCH_MOVED_THRESHOLD <= slot5) then
			if slot5 > slot4 * 0.7 then
				slot0.createMovePanel(slot0.allCardDatas:atproxy(slot2.csvID))
			end

			slot0.moved = true
		end

		slot0.cardList:setTouchEnabled(not slot0.isMovePanelExist())
		slot0.moveMovePanel(slot3)
	elseif slot3.name == "ended" or slot3.name == "cancelled" then
		if slot0.isMovePanelExist() == false and slot0.moved == false then
			slot0.onCardClick(slot2, true)

			return
		end

		slot0.moveEndMovePanel(slot2)
	end
end

return slot1
