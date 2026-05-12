slot1 = {
	buffCardHp = 1,
	buffCardMp = 2,
	buffCardDead = 3
}

return {
	reachConditionEx = function (slot0, slot1)
		uv2 = "buffCardHp"

		if slot0 == slot2.buffCardHp then
			return slot1 and slot1[1] > 0 and slot1[1] < 1
		end

		uv2 = "buffCardHp"

		if slot0 == slot2.buffCardMp then
			return not slot1 or slot1 and slot1[2] < 1 and slot1[1] > 0
		end

		uv2 = "buffCardHp"

		if slot0 == slot2.buffCardDead then
			return slot1 and slot1[1] <= 0
		end

		return true
	end,
	reachCondition = function (slot0, slot1, slot2)
		if gGameModel.cards:find(slot2):read("level") < 10 then
			return false
		end

		uv4 = "gGameModel"

		return slot4.reachConditionEx(slot0, slot1)
	end,
	getCards = function (slot0)
		slot1 = gGameModel.role:read("cards")

		if slot0 == 2 then
			slot1 = table.deepcopy(gGameModel.role:read("huodong_cards")[game.EMBATTLE_HOUDONG_ID.randomTower], true) or {}
		end

		return slot1
	end,
	setEffect = function (slot0, slot1, slot2, slot3)
		if not slot0:get("effect") then
			widget.addAnimationByKey(slot0, not slot2 and "random_tower/baoxiang.skel" or slot2, "effect", slot1, 0):xy(slot0:width() / 2, slot0:height() / 2 - (slot3 or 0)):scale(2)
		else
			slot6:play(slot1)
		end
	end,
	calcFightingPointFunc = function ()
		slot0 = {}
		slot4 = "buffs"

		for slot4, slot5 in ipairs(gGameModel.random_tower:read(slot4)) do
			if csv.random_tower.buffs[slot5].buffType == 1 then
				for slot10 = 1, 99 do
					if slot6["attrType" .. slot10] == nil or slot11 == 0 then
						break
					end

					slot13, slot14 = dataEasy.parsePercentStr(slot6["attrNum" .. slot10])

					if slot0[game.ATTRDEF_TABLE[slot11]] == nil then
						slot0[slot12] = {
							0,
							0
						}
					end

					if slot14 == game.NUM_TYPE.number then
						slot0[slot12][1] = slot0[slot12][1] + slot13
					else
						slot0[slot12][2] = slot0[slot12][2] + slot13
					end
				end
			end
		end

		return function (slot0)
			slot7 = "attrs2"
			slot1 = gGameModel.cards:find(slot0):read("card_id", "level", "skills", "attrs", slot7)
			slot2 = csv.cards[slot1.card_id]
			slot5 = slot1.attrs2
			slot3 = maptools.extend({
				slot1.attrs,
				slot5
			})
			uv5 = "gGameModel"

			for slot7, slot8 in pairs(slot5) do
				slot11 = slot8[2]

				if slot8[1] > 0 then
					slot9 = slot3[slot7] + slot10
				end

				if slot11 > 0 then
					slot9 = slot9 * (1 + slot11 / 100)
				end

				slot3[slot7] = slot9
			end

			return dataEasy.calcFightingPoint(slot1.card_id, slot1.level, slot3, slot1.skills)
		end
	end,
	getCanPassMaxRoom = function ()
		slot3 = gGameModel.random_tower:read("history_room")
		slot4 = gGameModel.random_tower:read("last_room") > 0 and csv.random_tower.tower[slot2].canPass or 0
		slot5 = slot3 > 0 and csv.random_tower.tower[slot3].canPass or 0

		for slot10, slot11 in orderCsvPairs(csv.random_tower.can_pass) do
			if slot11.level <= gGameModel.role:read("level") and slot11.vip <= gGameModel.role:read("vip_level") then
				slot6 = math.max(0, slot11.canPass)
			end
		end

		return math.max(math.min(slot6, slot5), slot4)
	end,
	getCanPassMaxRoomHell = function ()
		slot3 = gGameModel.hell_random_tower:read("history_room")
		slot4 = gGameModel.hell_random_tower:read("last_room") > 0 and csv.hell_random_tower.tower[slot2].canPass or 0
		slot5 = slot3 > 0 and csv.hell_random_tower.tower[slot3].canPass or 0

		for slot10, slot11 in orderCsvPairs(csv.hell_random_tower.can_pass) do
			if slot11.level <= gGameModel.role:read("level") and slot11.vip <= gGameModel.role:read("vip_level") then
				slot6 = math.max(0, slot11.canPass)
			end
		end

		return math.max(math.min(slot6, slot5), slot4)
	end,
	getCanJumpMaxRoom = function ()
		for slot6, slot7 in orderCsvPairs(csv.random_tower.can_jump) do
			if slot7.level <= gGameModel.role:read("level") and slot7.vip <= gGameModel.role:read("vip_level") then
				slot2 = math.max(0, slot7.canJump)
			end
		end

		return slot2
	end
}
