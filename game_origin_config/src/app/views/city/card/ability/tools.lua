slot1 = {
	buffCardHp = 1,
	buffCardMp = 2,
	buffCardDead = 3
}

return {
	setEffect = function (slot0)
		slot1 = slot0.parent
		slot8 = slot1:size()

		if not slot1:get("effect") then
			slot9 = widget.addAnimationByKey(slot1, slot0.spinePath, "effect", slot0.effectName or "effect", slot0.zOrder or 10):xy(slot8.width / 2 + (slot0.offsetX or 0), slot8.height / 2 + (slot0.offsetY or 0)):scale(slot0.scale or 1)
		else
			slot9:show():play(slot7)
		end
	end,
	getConditionStr = function (slot0, slot1)
		slot2 = {}

		if not gGameModel.cards:find(slot0) then
			return {}
		end

		slot4 = slot3:read("abilities")
		slot6 = slot3:read("advance")

		if csv.card_ability[slot1].strengthCod1[1] == 1 and slot3:read("level") < slot8[2] then
			table.insert(slot2, string.format(gLanguageCsv.needSpriteLevelAchieve, slot8[2]))
		end

		if slot8[1] == 2 and slot6 < slot8[2] then
			slot9, slot10 = dataEasy.getQuality(slot8[2])

			table.insert(slot2, string.format(gLanguageCsv.needSpriteAdvanceAchieve, gLanguageCsv[ui.QUALITY_COLOR_TEXT[slot9]] .. slot10))
		end

		for slot13, slot14 in orderCsvPairs(slot7.preAbilityID) do
			if slot7.strengthCod2 <= (slot4[slot14] or 0) then
				break
			end

			if slot13 == csvSize(slot7.preAbilityID) then
				table.insert(slot2, string.format(gLanguageCsv.needPreSkillLevelAchieve, slot9))
			end
		end

		return slot2
	end
}
