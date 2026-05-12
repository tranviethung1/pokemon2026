slot0 = battleCsv.newCsvCls("CsvBuff")
battleCsv.CsvBuff = slot0

function slot0.getDispleState(slot0)
	return slot0.model:getEventByKey(battle.ExRecordEvent.dispelSuccess) or false
end

function slot0.getValue(slot0)
	return slot0.model.value
end

function slot0.getGroup(slot0)
	return slot0.model.csvCfg.group
end

function slot0.hasFlag(slot0, ...)
	for slot6, slot7 in ipairs({
		...
	}) do
		if itertools.include(slot0.model.csvCfg.buffFlag, slot7) then
			return true
		end
	end

	return false
end

function slot0.getCfgId(slot0)
	return slot0.model.cfgId
end

function slot0.getEasyEffectFunc(slot0)
	return slot0.model.csvCfg.easyEffectFunc
end

function slot0.getRecordDataTab(slot0, slot1, ...)
	for slot6, slot7 in ipairs({
		...
	}) do
		if type(slot7) ~= "string" and slot8 ~= "number" then
			slot2[slot6] = slot7.model and slot7.model.id or slot7.id or 0
		end
	end

	return slot0.model:getEventByKey(battle.ExRecordEvent[slot1], table.unpack(slot2)) or 0
end

function slot0.getValueIdx(slot0, slot1)
	return slot0.model.value[slot1]
end

function slot0.getLifeRound(slot0)
	return slot0.model.args.lifeRound
end

function slot0.getFinalLifeRound(slot0)
	return slot0.model:getLifeRound()
end

function slot0.getOverLayCount(slot0)
	return slot0.model:getOverLayCount()
end

function slot0.getCopyBuffState(slot0)
	return slot0.model:getEventByKey(battle.ExRecordEvent.copyState) or false
end

function slot0.getTransferBuffState(slot0)
	return slot0.model:getEventByKey(battle.ExRecordEvent.transferState) or false
end

function slot0.getOriginPriority(slot0)
	return slot0.model.args.originPriority or 1
end

function slot0.getCaster(slot0)
	return battleCsv.CsvObject.newWithCache(slot0.model.caster)
end

function slot0.getHolder(slot0)
	return battleCsv.CsvObject.newWithCache(slot0.model.holder)
end
