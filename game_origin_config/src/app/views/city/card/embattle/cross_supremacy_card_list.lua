slot0 = 13
slot1 = require("app.views.city.card.embattle.embattle_card_list")
slot2 = class("CrossSupremacyEmbattleCardList", slot1)
slot2.RESOURCE_FILENAME = "common_battle_card_list.json"
slot2.RESOURCE_BINDING = clone(rawget(slot1, "RESOURCE_BINDING"))

function slot2.initItem(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot4.battle > 0 and 1 or 0

	if slot4.inMeteor then
		slot5 = 1
	end

	bind.extend(slot1, slot2, {
		class = "card_icon",
		props = {
			unitId = slot4.unit_id,
			advance = slot4.advance,
			rarity = slot4.rarity,
			dbid = slot4.dbid,
			star = slot4.star,
			grayState = slot5,
			levelProps = {
				data = slot4.level
			},
			onNode = function (slot0)
				slot0:xy(-2, -2)
			end
		}
	})

	if slot4.battle == 1 then
		slot2:get("textNote"):show()
		slot2:get("textNote"):text(gLanguageCsv.firstTeam)
	elseif slot4.battle == 2 then
		slot2:get("textNote"):show()
		slot2:get("textNote"):text(gLanguageCsv.secondTeam)
	elseif slot4.battle >= 3 then
		slot2:get("textNote"):show()
		slot2:get("textNote"):text(gLanguageCsv.thirdTeam)
	elseif slot4.inMeteor then
		slot2:get("textNote"):show()
		slot2:get("textNote"):text(gLanguageCsv.inMeteorites)
	else
		slot2:get("textNote"):hide()
	end

	if slot4.elite == 1 then
		(slot2:get("imgElite") or ccui.ImageView:create("city/pvp/cross_supremacy/logo_jy.png"):addTo(slot2, 1, "imgElite"):xy(150, 155):z(10)):show()
	elseif slot6 then
		slot6:hide()
	end

	uiEasy.addTextEffect1(slot2:get("textNote"))
	slot2:onTouch(functools.partial(slot1.clickCell, slot4))
end

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

		if (slot0.elite or 0) ~= (slot1.elite or 0) then
			return slot3 <= slot2
		end

		uv4 = "battle"

		return slot4(slot0, slot1)
	end
end

function slot2.getBattle(slot0, slot1)
	if slot1 and slot1 ~= 0 then
		return math.ceil(slot1 / 6)
	else
		return 0
	end
end

function slot2.onFilterCards(slot0, slot1)
	slot3 = {}

	if not itertools.isempty(slot0.filterCondition:read()) then
		slot3 = {
			{
				"rarity",
				slot2.rarity < ui.RARITY_LAST_VAL and slot2.rarity or nil
			},
			{
				"attr2",
				slot2.attr2 < ui.ATTR_MAX and slot2.attr2 or nil
			},
			{
				"attr1",
				slot2.attr1 < ui.ATTR_MAX and slot2.attr1 or nil
			},
			{
				"atkType",
				slot2.atkType
			}
		}
	end

	function slot4(slot0, slot1, slot2)
		if slot0[slot1] == nil and (slot1 ~= "attr2" or slot0.attr1 == slot2) then
			return true
		end

		if slot1 == "atkType" then
			for slot6, slot7 in ipairs(slot0.atkType) do
				if slot2[slot7] then
					return true
				end
			end

			return false
		end

		if slot0[slot1] == slot2 then
			return true
		end

		return false
	end

	return function (slot0, slot1)
		if slot1.elite == 1 then
			return false
		end

		uv3 = "elite"

		for slot5 = 1, #slot3 do
			uv6 = "elite"

			if slot6[slot5][2] then
				uv7 = "elite"

				if not slot7(slot1, slot6[1], slot6[2]) then
					return false
				end
			end
		end

		return true, slot0
	end
end

return slot2
