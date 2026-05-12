slot0 = {}
slot1 = {
	16,
	15,
	14,
	13,
	12,
	11
}
slot2 = {
	2103,
	2102,
	2101
}
slot3 = 12
slot4 = {}

for slot8, slot9 in orderCsvPairs(csv.rebirth_rmb_cost) do
	if not slot4[slot9.type] then
		slot4[slot9.type] = {}
	end

	table.insert(slot4[slot9.type], {
		rmbPoint = slot9.rmbPoint,
		rmbRate = slot9.rmbRate
	})
end

slot5 = {
	function (slot0)
		slot2 = {}
		slot3 = gGameModel.cards:find(slot0):read("sum_exp")

		for slot9 = table.length(gCardExpItemCsv), 1, -1 do
			slot11 = gCardExpItemCsv[slot9].specialArgsMap.exp
			slot12 = math.floor(slot3 / slot11)
			slot3 = slot3 - slot12 * slot11

			if slot12 > 0 then
				-- Nothing
			end
		end

		return {
			[gCardExpItemCsv[slot9].id] = slot12
		}
	end,
	function (slot0)
		slot1 = gGameModel.cards:find(slot0)
		slot4 = 0
		slot5 = {}

		for slot10, slot11 in ipairs(gCardAdvanceCsv[csv.cards[slot1:read("card_id")].advanceTypeID]) do
			if slot10 == slot1:read("advance") then
				break
			end

			for slot15, slot16 in csvMapPairs(slot11.itemMap) do
				slot5[slot15] = (slot5[slot15] or 0) + slot16
			end

			slot4 = slot4 + slot11.gold
		end

		return slot5, {
			gold = slot4
		}
	end,
	function (slot0)
		slot1 = gGameModel.cards:find(slot0)
		slot5 = csv.base_attribute.skill_level
		slot6 = 0
		slot7 = 0
		slot11 = slot1:read("skin_id")

		for slot11, slot12 in csvPairs(dataEasy.getCardSkillList(slot1:read("card_id"), slot11)) do
			slot13 = slot1:read("skills")[slot12] or 1

			for slot17, slot18 in orderCsvPairs(slot5) do
				if slot17 == slot13 then
					break
				end

				slot7 = slot7 + slot18["gold" .. csv.skill[slot12].costID]
			end

			slot6 = slot6 + slot13 - 1
		end

		if math.ceil(slot6 * gCommonConfigCsv.rebirthRetrunProportion5) > 0 then
			-- Nothing
		end

		return {
			skill_point = slot6
		}, {
			gold = slot7
		}
	end,
	function (slot0)
		slot1 = gGameModel.cards:find(slot0)
		slot5 = {}
		slot6 = 0

		for slot10, slot11 in pairs(slot1:read("abilities")) do
			slot12 = gCardAbilityCsv[csv.cards[slot1:read("card_id")].abilitySeqID][slot10]
			slot13 = {}

			for slot17 = 1, slot11 do
				for slot22, slot23 in csvMapPairs(csv.card_ability_cost[slot17]["costItemMap" .. slot12.strengthSeqID]) do
					if slot22 == "gold" then
						slot6 = slot6 + slot23
					else
						slot5[slot22] = (slot5[slot22] or 0) + slot23
					end
				end
			end
		end

		return slot5, {
			gold = slot6
		}
	end,
	function (slot0)
		slot1 = gGameModel.cards:find(slot0)
		slot5 = {}
		slot6 = 0
		slot7 = gCardAbilityExtraCsv[csv.cards[slot1:read("card_id")].abilitySeqID].strengthSeqID

		if itertools.size(slot1:read("abilities_extra")) > 0 then
			for slot11 = 1, slot2.level do
				for slot16, slot17 in csvMapPairs(csv.card_ability_extra_cost[slot11]["costItemMap" .. slot7]) do
					if slot16 == "gold" then
						slot6 = slot6 + slot17
					else
						slot5[slot16] = (slot5[slot16] or 0) + slot17
					end
				end
			end
		end

		return slot5, {
			gold = slot6
		}
	end
}

function slot6(slot0)
	for slot5, slot6 in pairs(gGameModel.role:read("card_deployment").union_training.cards or {}) do
		if slot6 == slot0 then
			return true
		end
	end

	return false
end

function slot7(slot0, slot1, slot2, slot3, slot4)
	for slot8, slot9 in orderCsvPairs(slot0) do
		if slot8 == slot2 then
			break
		end

		if slot1 then
			for slot13, slot14 in csvMapPairs(slot9["costItemMap" .. slot1]) do
				slot3[slot13] = (slot3[slot13] or 0) + slot14
			end
		end

		if slot4 then
			slot3.gold = (slot3.gold or 0) + slot9["costGold" .. slot4]
		end
	end
end

function slot8(slot0, slot1, slot2, slot3, slot4)
	for slot8, slot9 in ipairs(slot0) do
		if slot8 == slot2 then
			break
		end

		if slot1 then
			for slot13, slot14 in csvMapPairs(slot9["costItemMap" .. slot1]) do
				slot3[slot13] = (slot3[slot13] or 0) + slot14
			end
		end

		if slot4 then
			slot3.gold = (slot3.gold or 0) + slot9["costGold" .. slot4]
		end
	end
end

function slot0.computeCost(slot0, slot1)
	for slot6, slot7 in ipairs(slot0) do
		if slot7.key == "gold" then
			slot2 = 0 + math.ceil(slot7.val / gCommonConfigCsv.rebirthRMBCostByGold)
		elseif type(slot7.key) == "number" then
			slot8.rebirthRMB = dataEasy.getCfgByKey(slot7.key).rebirthRMB or 0
			slot2 = slot2 + slot7.val * slot8.rebirthRMB
		end
	end

	uv4 = "ipairs"
	slot6 = nil

	for slot10, slot11 in ipairs(slot4[slot1]) do
		if slot2 <= slot11.rmbPoint then
			slot5 = 0 + slot2 * slot11.rmbRate

			break
		end

		slot12 = slot11.rmbPoint

		if slot6 then
			slot12 = slot11.rmbPoint - slot6
		end

		slot5 = slot5 + slot12 * slot11.rmbRate
		slot2 = slot2 - slot12
		slot6 = slot11.rmbPoint
	end

	slot7 = gCommonConfigCsv.heldItemRebirthRMBCostLimit
	slot8 = gCommonConfigCsv.heldItemRebirthRMBCostMin

	if slot1 == 1 then
		slot8 = gCommonConfigCsv.cardRebirthRMBCostMin
		slot7 = gCommonConfigCsv.rebirthRMBCostLimit
	elseif slot1 == 3 then
		slot8 = gCommonConfigCsv.gemRebirthRMBCostMin
		slot7 = gCommonConfigCsv.gemRebirthRMBCostLimit
	elseif slot1 == 4 then
		slot8 = gCommonConfigCsv.chipRebirthRMBCostMin
		slot7 = gCommonConfigCsv.chipRebirthRMBCostLimit
	elseif slot1 == 5 then
		slot8 = gCommonConfigCsv.contractRebirthRMBCostMin
		slot7 = gCommonConfigCsv.contractRebirthRMBCostLimit
	end

	return cc.clampf(math.ceil(slot5), slot8, slot7)
end

function slot0.computeCardReturnItem(slot0)
	slot1 = 0
	slot2 = {}
	uv4 = "ipairs"

	for slot6, slot7 in ipairs(slot4) do
		slot8, slot9 = slot7(slot0)

		for slot13, slot14 in pairs(slot8) do
			slot2[slot13] = (slot2[slot13] or 0) + slot14
		end

		if slot9 then
			slot1 = slot1 + (slot9.gold or 0)
		end
	end

	if math.ceil(slot1 * gCommonConfigCsv.rebirthRetrunProportion1) > 0 then
		slot2.gold = (slot2.gold or 0) + slot1
	end

	return slot2
end

function slot0.computeEquipReturnItem(slot0)
	slot1 = csv.equips
	slot2 = csv.base_attribute.equip_strength
	slot4 = gGameModel.cards:find(slot0):read("equips")
	slot5 = {}
	slot6 = {
		[slot11.advanceIndex] = slot11
	}

	for slot10, slot11 in orderCsvPairs(csv.base_attribute.equip_signet_advance) do
		-- Nothing
	end

	for slot10, slot11 in ipairs(slot4) do
		slot12 = slot1[slot11.equip_id]
		uv13 = "csv"

		slot13(slot2, nil, slot11.level, slot5, slot12.strengthSeqID)

		uv13 = "equips"

		slot13(gEquipAdvanceCsv[slot11.equip_id], "", slot11.advance, slot5, "")

		uv13 = "csv"

		slot13(csv.base_attribute.equip_star, slot12.starSeqID, slot11.star, slot5)

		uv13 = "csv"

		slot13(csv.base_attribute.equip_ability, slot12.abilitySeqID, slot11.ability, slot5)

		uv13 = "csv"

		slot13(csv.base_attribute.equip_awake, slot12.awakeSeqID, slot11.awake, slot5)

		uv13 = "csv"

		slot13(csv.base_attribute.equip_awake_ability, slot12.awakeAbilitySeqID, slot11.awake_ability, slot5)

		uv13 = "csv"

		slot13(csv.base_attribute.equip_signet, slot12.signetStrengthSeqID, slot11.signet, slot5)

		uv13 = "csv"

		slot13(csv.base_attribute.equip_signet_advance_cost, slot6[slot12.advanceIndex].advanceSeqID, slot11.signet_advance, slot5)
	end

	if slot5.gold and slot5.gold > 0 then
		slot5.gold = math.ceil(slot5.gold * gCommonConfigCsv.rebirthRetrunProportion1)
	end

	return slot5
end

function slot0.computeStarSkillPoints(slot0)
	if not gGameModel.cards:find(slot0) then
		return {}
	end

	slot3 = slot1:read("card_id")
	slot4 = csv.cards[slot3].cardMarkID
	slot5 = 0

	for slot14, slot15 in ipairs(csv.card_star_skill[csv.cards[csv.cards[slot3].cardMarkID].starSkillSeqID].starSkillList) do
		for slot21 = 1, slot1:read("skills")[slot15] or 0 do
			if csv.base_attribute.skill_level[slot21 - 1] then
				slot5 = slot5 + csv.base_attribute.skill_level[slot21 - 1]["itemNum" .. csv.skill[slot15].costID]
			end
		end
	end

	if math.ceil(slot5 * gCommonConfigCsv.rebirthRetrunProportion4) > 0 then
		slot2["star_skill_points_" .. slot4] = (slot2["star_skill_points_" .. slot4] or 0) + slot5
	end

	return slot2
end

function slot0.getReturnItems(slot0)
	uv1 = "computeCardReturnItem"
	uv2 = "computeCardReturnItem"
	slot2 = slot0:computeEquipReturnItem()
	slot3 = {}

	for slot7, slot8 in pairs(slot1.computeCardReturnItem(slot2)) do
		slot3[slot7] = (slot3[slot7] or 0) + slot8
	end

	for slot7, slot8 in pairs(slot2) do
		slot3[slot7] = (slot3[slot7] or 0) + slot8
	end

	uv4 = "computeCardReturnItem"
	slot4 = slot4.sortItems(slot3)
	uv6 = "computeCardReturnItem"

	return slot4, slot6.computeCost(slot4, 1)
end

function slot0.isExpItem(slot0)
	if tonumber(slot0) and slot0 >= 11 and slot0 <= 16 then
		return true
	end

	return false
end

function slot0.sortItems(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0) do
		slot7 = slot6
		uv9 = "pairs"

		for slot11 = 1, slot9 do
			if slot5 ~= "coin" .. slot11 then
				slot7 = math.ceil(slot6 * gCommonConfigCsv.rebirthRetrunProportion1)
			end
		end

		if slot5 ~= "gold" and slot5 ~= "skill_point" and slot5 ~= "star_skill_points+" then
			slot7 = math.ceil(slot6 * gCommonConfigCsv.rebirthRetrunProportion1)
		end

		table.insert(slot1, {
			key = slot5,
			val = slot7
		})
	end

	slot2 = {
		gold = 1,
		skill_point = 3,
		star_skill_points = 4
	}

	table.sort(slot1, function (slot0, slot1)
		if dataEasy.isFragmentCard(slot0.key) ~= dataEasy.isFragmentCard(slot1.key) then
			return slot2
		elseif slot2 then
			return csv.unit[csv.cards[dataEasy.getCfgByKey(slot0.key).combID].unitID].rarity < csv.unit[csv.cards[dataEasy.getCfgByKey(slot0.key).combID].unitID].rarity
		end

		uv4 = "dataEasy"
		slot5 = slot0.key
		slot4 = slot4[slot5]
		uv5 = "dataEasy"
		slot5 = slot5[slot1.key]
		uv7 = "isFragmentCard"

		for slot9 = 1, slot7 do
			if slot0.key == "coin" .. slot9 then
				slot4 = 2
			end

			if slot1.key == "coin" .. slot9 then
				slot5 = 2
			end
		end

		if slot4 == nil and string.find(slot0.key, "star_skill_points_%d+") then
			uv6 = "dataEasy"
			slot4 = slot6.star_skill_points
		end

		if slot5 == nil and string.find(slot1.key, "star_skill_points_%d+") then
			uv6 = "dataEasy"
			slot5 = slot6.star_skill_points
		end

		if slot4 and slot5 then
			return slot4 < slot5
		elseif slot4 then
			return true
		elseif slot5 then
			return false
		end

		uv6 = "key"
		slot7 = slot0.key
		uv7 = "key"

		if slot6.isExpItem(slot7) ~= slot7.isExpItem(slot1.key) then
			return slot6
		elseif slot6 then
			return csv.items[slot1.key].quality < csv.items[slot0.key].quality
		end

		return slot1.key < slot0.key
	end)

	return slot1
end

function slot0.computeDecomposeItems(slot0)
	slot1 = csv.cards
	slot2 = {}
	slot3 = {}
	slot5 = 0

	for slot9, slot10 in pairs(slot0 or {}) do
		uv12 = "csv"

		if not slot12.isCardRebirthed(slot10.dbid) then
			uv12 = "csv"
			slot12, slot13 = slot12.getReturnItems(slot11)
			slot4 = 0 + slot13

			for slot17, slot18 in ipairs(slot12) do
				slot2[slot18.key] = (slot2[slot18.key] or 0) + slot18.val
			end
		end

		slot12 = gGameModel.cards:find(slot11)
		slot13 = slot12:read("getstar")
		slot14 = slot12:read("card_id")

		for slot20, slot21 in pairs(slot12:read("cost_universal_cards") or {}) do
			slot16 = 0 + slot21
		end

		slot17 = slot1[slot10.id]
		slot18 = 0

		for slot22 = slot13, slot10.star - 1 do
			slot23 = gStarCsv[slot17.starTypeID][slot22]
			slot5 = slot5 + slot23.gold

			for slot27, slot28 in csvMapPairs(slot23.costItems) do
				slot3[slot27] = (slot3[slot27] or 0) + slot28
			end

			slot18 = slot18 + slot23.costCardNum
		end

		slot20 = gStar2FragCsv[slot17.fragNumType]
		slot3[slot17.fragID] = (slot3[slot17.fragID] or 0) + ((slot18 - slot16) * slot20[1].baseFragNum + slot20[slot13].baseFragNum) * gCommonConfigCsv.rebirthRetrunProportion2
		uv23 = "csv"

		for slot27, slot28 in pairs(slot23.computeStarSkillPoints(slot11)) do
			slot3[slot27] = (slot3[slot27] or 0) + slot28
		end
	end

	if slot5 > 0 then
		slot3.gold = math.ceil(slot5 * gCommonConfigCsv.rebirthRetrunProportion2)
	end

	for slot9, slot10 in pairs(slot2) do
		slot3[slot9] = (slot3[slot9] or 0) + slot10
	end

	slot6 = {}

	for slot10, slot11 in pairs(slot3) do
		if csv.fragments[slot10] then
			for slot16, slot17 in csvMapPairs(csv.fragments[slot10].decomposeGain) do
				slot6[slot16] = (slot6[slot16] or 0) + slot17 * slot11
			end
		else
			slot6[slot10] = (slot6[slot10] or 0) + slot11
		end
	end

	uv7 = "csv"

	return slot7.sortItems(slot6), slot4
end

function slot0.computeHeldItemReturn(slot0)
	slot1 = gGameModel.held_items:find(slot0)
	slot2 = slot1:read("advance")
	slot4 = slot1:read("level")
	slot6 = slot1:read("cost_universal_items")
	slot7 = csv.held_item.level
	slot8 = csv.held_item.items[slot1:read("held_item_id")]
	slot9 = csv.items
	slot10 = {}
	slot11 = 0

	if slot1:read("sum_exp") > 0 then
		slot11 = slot5 * gCommonConfigCsv.heldItemExpNeedGold
		uv13 = "gGameModel"

		for slot15, slot16 in ipairs(slot13) do
			slot18 = slot9[slot16].specialArgsMap.heldItemExp
			slot19 = math.floor(slot5 / slot18)
			slot5 = slot5 - slot19 * slot18

			if slot19 > 0 then
				slot10[slot16] = slot19
			end
		end
	end

	slot12 = {}

	if slot2 > 0 then
		for slot16, slot17 in orderCsvPairs(csv.held_item.advance) do
			if slot16 == slot2 then
				break
			end

			for slot21, slot22 in csvMapPairs(slot17["costItemMap" .. slot8.advanceSeqID]) do
				slot12[slot21] = (slot12[slot21] or 0) + slot22
			end
		end
	end

	slot13 = {
		[slot17] = math.ceil(slot18 * gCommonConfigCsv.rebirthRetrunProportion3)
	}

	for slot17, slot18 in pairs(slot10) do
		-- Nothing
	end

	for slot18, slot19 in pairs(slot6) do
		slot14 = 0 + slot19

		if math.ceil(slot19 * gCommonConfigCsv.rebirthRetrunProportion4) > 0 then
			slot13[slot18] = slot20
		end
	end

	for slot18, slot19 in pairs(slot12) do
		slot20 = slot19

		if slot18 <= game.HELD_ITEM_CSVID_LIMIT and game.FRAGMENT_CSVID_LIMIT < slot18 then
			slot20 = slot19 - slot14
		end

		if math.ceil(slot20 * gCommonConfigCsv.rebirthRetrunProportion3) > 0 then
			slot13[slot18] = slot21
		end
	end

	if slot11 > 0 then
		slot13.gold = math.ceil(slot11 * gCommonConfigCsv.rebirthRetrunProportion3)
	end

	uv15 = "held_items"
	slot15 = slot15.sortItems(slot13)
	uv17 = "held_items"

	return slot15, slot17.computeCost(slot15, 2)
end

function slot0.isCardRebirthed(slot0)
	if not slot0 then
		return true
	end

	if not gGameModel.cards:find(slot0) then
		return true
	end

	slot3 = slot1:read("level")
	slot4 = slot1:read("equips")
	slot5 = slot1:read("advance")
	slot7 = slot1:read("abilities")
	slot8 = true

	for slot12, slot13 in csvPairs(csv.cards[slot1:read("card_id")].skillList) do
		if (slot1:read("skills")[slot13] or 1) > 1 then
			slot8 = false

			break
		end
	end

	if not slot8 then
		return slot8
	end

	if slot3 > 1 or slot5 > 1 then
		return false
	end

	for slot12, slot13 in ipairs(slot4) do
		if slot13.level > 1 or slot13.advance > 1 or slot13.star > 0 or slot13.awake > 0 or slot13.awake_ability > 0 or slot13.signet > 0 or slot13.signet_advance > 0 or slot13.ability > 0 then
			slot8 = false

			break
		end
	end

	for slot12, slot13 in pairs(slot7) do
		if slot13 >= 1 then
			return false
		end
	end

	return slot8
end

function slot0.isHeldItemRebirthed(slot0)
	if not slot0 then
		return true
	end

	slot1 = gGameModel.held_items:find(slot0)

	if slot1:read("sum_exp") > 0 or slot1:read("advance") > 0 then
		return false
	end

	return true
end

function slot0.getSelectCard(slot0, slot1)
	slot2 = {}
	slot5 = dataEasy.inUsingCardsHash()

	for slot10, slot11 in ipairs(gGameModel.role:read("cards")) do
		if slot0 ~= 2 and slot0 == 1 then
			uv12 = "csv"

			if not slot12.isCardRebirthed(slot11) then
				slot12 = gGameModel.cards:find(slot11)
				slot13 = slot12:read("card_id")
				slot19 = slot5[slot11]
				uv19 = "cards"

				table.insert(slot2, {
					id = slot13,
					unitId = dataEasy.getUnitId(slot13, slot12:read("skin_id")),
					rarity = csv.unit[csv.cards[slot13].unitID].rarity,
					fight = slot12:read("fighting_point"),
					level = slot12:read("level"),
					star = slot12:read("star"),
					advance = slot12:read("advance"),
					dbid = slot11,
					lock = slot12:read("locked"),
					battle = slot5[slot11] and 1 or 2,
					battleType = slot19,
					isUnion = slot19(slot11),
					isSel = itertools.include(slot1 or {}, slot11),
					markId = slot15.cardMarkID,
					cardType = slot15.cardType
				})
			end
		end
	end

	return slot2
end

function slot0.isSingleInEvoLine(slot0, slot1)
	slot4 = csv.cards[gGameModel.cards:find(slot0):read("card_id")].cardMarkID
	slot5 = {}

	for slot9, slot10 in pairs(slot1 or {}) do
		if not slot5[slot2[gGameModel.cards:find(slot10):read("card_id")].cardMarkID] then
			slot5[slot12] = {}
		end

		slot5[slot12][slot11] = (slot5[slot12][slot11] or 0) + 1
	end

	slot6 = {}

	for slot11, slot12 in ipairs(gGameModel.role:read("cards")) do
		if slot2[gGameModel.cards:find(slot12):read("card_id")].cardMarkID == slot4 then
			if not slot6[slot14] then
				slot6[slot14] = {}
			end

			slot6[slot14][slot13] = (slot6[slot14][slot13] or 0) + 1
		end
	end

	for slot11, slot12 in pairs(slot5[slot4] or {}) do
		slot6[slot4][slot11] = slot6[slot4][slot11] - slot12
	end

	slot6[slot4][slot3] = slot6[slot4][slot3] - 1
	slot8 = true

	for slot12, slot13 in pairs(slot6[slot4]) do
		if slot13 > 0 then
			slot8 = false

			break
		end
	end

	return slot8
end

function slot0.getReturnItemsGem(slot0)
	slot1 = {}
	slot2 = {}
	slot3 = 0
	slot4 = {}
	slot5 = {}

	for slot9, slot10 in pairs(slot0) do
		slot11 = gGameModel.gems:find(slot10)
		slot4 = {}
		slot5 = {}

		for slot18 = 1, slot11:read("level") - 1 do
			slot22 = dataEasy.getCfgByKey(slot11:read("gem_id")).strengthCostSeq

			for slot22, slot23 in csvMapPairs(csv.gem.cost[slot18]["costItemMap" .. slot22]) do
				if slot2[slot22] then
					slot24 = slot1[slot2[slot22]]
					slot24.val = slot24.val + slot23
				else
					table.insert(slot1, {
						key = slot22,
						val = slot23
					})

					slot2[slot22] = #slot1
				end

				if slot5[slot22] then
					slot24 = slot4[slot5[slot22]]
					slot24.val = slot24.val + slot23
				else
					table.insert(slot4, {
						key = slot22,
						val = slot23
					})

					slot5[slot22] = #slot4
				end
			end
		end

		uv15 = "pairs"
		slot3 = slot3 + slot15.computeCost(slot4, 3)
	end

	table.sort(slot1, function (slot0, slot1)
		if slot0.key == "gold" then
			return true
		elseif slot1.key == "gold" then
			return false
		else
			return dataEasy.getCfgByKey(slot1.key).quality <= dataEasy.getCfgByKey(slot0.key).quality
		end
	end)

	return slot1, slot3
end

function slot0.getReturnItemsChip(slot0)
	slot1 = 0
	slot2 = {}
	slot3 = 0
	slot4 = {}
	slot5 = {}
	slot6 = {}

	for slot10, slot11 in pairs(gChipExpCsv) do
		table.insert(slot6, {
			id = slot11.id,
			num = slot11.specialArgsMap.chipExp
		})
	end

	table.sort(slot6, function (slot0, slot1)
		return slot1.num < slot0.num
	end)

	for slot11, slot12 in pairs(slot0) do
		slot15 = math.floor(gGameModel.chips:find(slot12):read("chip_id", "level", "sum_exp").sum_exp * gCommonConfigCsv.chipRebirthRetrunProportion)
		slot16 = function (slot0)
			slot1 = {}
			uv3 = "ipairs"

			for slot5, slot6 in ipairs(slot3) do
				table.insert(slot1, {
					key = slot6.id,
					val = math.floor(slot0 % slot6.num / slot6.num)
				})
			end

			return slot1
		end(slot15)
		slot20 = slot15 * gCommonConfigCsv.chipExpNeedGold

		table.insert(slot16, {
			key = "gold",
			val = slot20
		})

		for slot20, slot21 in pairs(slot16) do
			slot5[slot21.key] = (slot5[slot21.key] or 0) + slot21.val
		end

		uv17 = "pairs"
		slot1 = slot1 + slot17.computeCost(slot16, 4)
	end

	for slot11, slot12 in pairs(slot5) do
		if slot12 > 0 then
			table.insert(slot4, {
				key = slot11,
				val = slot12
			})
		end
	end

	table.sort(slot4, function (slot0, slot1)
		if slot0.key == "gold" then
			return true
		elseif slot1.key == "gold" then
			return false
		else
			return dataEasy.getCfgByKey(slot1.key).quality <= dataEasy.getCfgByKey(slot0.key).quality
		end
	end)

	return slot4, slot1
end

function slot0.isContractRebirthed(slot0)
	if not slot0 then
		return true
	end

	slot1 = gGameModel.contracts:find(slot0)

	if slot1:read("sum_exp") > 0 or slot1:read("advance") > 0 then
		return false
	end

	return true
end

function slot0.getReturnItemsContract(slot0)
	slot1 = 0
	slot2 = 0
	slot3 = {}
	slot4 = {}
	slot5 = {}

	for slot10, slot11 in pairs(slot0) do
		slot13 = gGameModel.contracts:find(slot11):read("level", "sum_exp", "advance_cost_contracts", "contract_id", "advance")

		function ()
			error("Decompilation failed")
			-- Exception in function building!
			-- Traceback (most recent call last):
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
			--     return _build_function_definition(prototype, state.header)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
			--     node.statements.contents = _build_function_blocks(state, instructions)
			--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
			--     statement, line_marked_elements = _build_statement(state, addr, instruction)
			--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
			--     return _build_var_assignment(state, addr, instruction)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
			--     assn = func(*args, **kwargs)
			--            ^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
			--     expression = _build_const_expression(state, addr, instruction)
			--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 834, in _build_const_expression
			--     return _build_numeric_constant(state, instruction.CD)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1027, in _build_numeric_constant
			--     number = state.constants.numeric_constants[index]
			--              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
			-- IndexError: list index out of range
		end(math.floor(slot13.sum_exp * gCommonConfigCsv.contractRebirthRetrunProportion), slot13.contract_id, slot13.advance, slot13.advance_cost_contracts)
	end

	for slot10, slot11 in pairs(slot4) do
		if slot11 > 0 then
			table.insert(slot3, {
				key = slot10,
				val = slot11
			})
		end
	end

	table.sort(slot3, function (slot0, slot1)
		if slot0.key == "gold" then
			return true
		elseif slot1.key == "gold" then
			return false
		else
			return dataEasy.getCfgByKey(slot1.key).quality < dataEasy.getCfgByKey(slot0.key).quality
		end
	end)

	return slot3, slot1
end

return slot0
