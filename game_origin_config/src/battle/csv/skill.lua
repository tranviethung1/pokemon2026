slot1 = battleCsv.newCsvCls("CsvSkill")
slot1.ignoreModelCheck = {
	owner = true
}
battleCsv.CsvSkill = slot1

function slot1.level(slot0)
	return slot0.model:getLevel()
end

function slot1.getId(slot0)
	return slot0.model.id
end

function slot1.getKilledTargets(slot0)
	return slot0.model.killedTargetsTb or {}
end

function slot1.getDamageStateByTarget(slot0, slot1, slot2)
	return table.get(slot0.model.targetsFinalResult, slot1.model.id, "args", slot2)
end

function slot1.getProcessTargetsCount(slot0, slot1)
	return table.length(slot0.model.allProcessesTargets[slot1])
end

function slot1.checkProcessTargetsState(slot0, slot1, slot2)
	slot3 = {}

	if slot2 == "nodead" then
		function slot3(slot0)
			for slot4, slot5 in ipairs(slot0) do
				if slot5:isAlreadyDead() then
					return false
				end
			end

			return true
		end
	end

	return slot3(slot0.model.allProcessesTargets[slot1])
end

function slot1.getDamageState(slot0, slot1, slot2)
	if not slot0.model then
		return false
	end

	for slot7, slot8 in pairs(slot0.model.targetsFinalResult) do
		if table.get(slot8, "args", slot1) == (slot2 or true) then
			return true
		end
	end
end

function slot1.getTotalDamage(slot0, slot1, slot2)
	if not slot0.model.cfg then
		return 0
	end

	for slot8, slot9 in slot0.model:pairsTargetsFinalResult((slot2 or 0) == 0 and battle.SkillSegType.damage or battle.SkillSegType.resumeHp) do
		slot4 = 0 + slot9.real:get(slot1 or battle.ValueType.normal)
	end

	return slot4
end

function slot1.getTargetTotalDamage(slot0, slot1, slot2, slot3)
	if not slot1.model or not slot0.model:chcekTargetInFinalResult(slot1.model.id) then
		return 0
	end

	if not slot0.model.cfg then
		return 0
	end

	slot5 = nil

	if (slot3 or 0) == 0 and slot0.model:isSameType(battle.SkillFormulaType.damage) then
		slot4 = 0 + slot0.model.targetsFinalResult[slot1.model.id].damage.real:get(slot2 or battle.ValueType.normal)
	end

	if slot3 == 1 and slot0.model:isSameType(battle.SkillFormulaType.resumeHp) then
		slot4 = slot4 + slot0.model.targetsFinalResult[slot1.model.id].resumeHp.real:get(slot2)
	end

	return slot4
end

function slot1.getSkillDamageType(slot0)
	return slot0.model.cfg.skillDamageType
end

function slot1.getNatureType(slot0)
	return slot0.model:getSkillNatureType()
end

function slot1.getSkillType(slot0)
	return slot0.model.cfg.skillType or 0
end

function slot1.getSkillType2(slot0)
	return slot0.model.cfg.skillType2 or 0
end

function slot1.getSkillFormulaType(slot0)
	return slot0.model.skillFormulaType
end

function slot1.owner(slot0)
	if slot0.model and slot0.model.owner then
		return battleCsv.CsvObject.newWithCache(slot0.model.owner)
	end

	return battleCsv.NilObject
end

function slot1.preCalSkillDamageCsvTarget(slot0, slot1, slot2)
	slot4 = slot0.model
	slot6 = false

	if slot1.model and slot4 and slot2.model then
		slot4.allProcessesTargets = {}

		for slot10 = 1, table.length(slot4.processes) do
			slot11 = slot4.processes[slot10]
			slot4.allProcessesTargets[slot11.id] = slot4:onProcess(slot11, slot5).targets

			if slot6 or itertools.include(slot12.targets, function (slot0)
				uv2 = "id"

				return slot0.id == slot2.id
			end) then
				break
			end
		end
	end

	return slot6
end

function slot1.targetType(slot0)
	return slot0.model.cfg.targetChooseType or "other"
end

function slot1.getCdRound(slot0)
	return slot0.model.cfg.cdRound
end

function slot1.getCurCdRound(slot0)
	return slot0.model:getLeftCDRound()
end

function slot1.isSpellTo(slot0)
	return slot0.model.isSpellTo
end

function slot1.specialRatio(slot0)
	return slot0.model.cfg.specialRatio
end

function slot1.skillFlag(slot0, ...)
	for slot5, slot6 in ipairs({
		...
	}) do
		for slot10, slot11 in ipairs(slot0.model.cfg.skillFlag) do
			if slot6 == slot11 then
				return true
			end
		end
	end

	return false
end

battleCsv.exportToCsvCls(slot1, {
	interruptBuffId = 0
})
