slot0 = class("BuffEfffectBase")
AutoChessBattle.BuffEfffectBase = slot0

function slot0.ctor(slot0, slot1)
end

function slot0.init(slot0, slot1, slot2)
	slot0.cfgId = slot1.cfgId
	slot0.id = slot1.id
	slot0.group = slot1:group()
	slot0.buffRef = slot1.isNumberType and slot1 or slot1:getValue()
	slot0.buffData = slot2
end

function slot0.setG(slot0, slot1, slot2)
	slot0.buffData.__globals[slot1] = slot2
end

function slot0.getG(slot0, slot1)
	return slot0.buffData.__globals[slot1]
end

slot1 = class("BuffQuickStrike", slot0)
AutoChessBattle.BuffQuickStrike = slot1

function slot1.checkCondition(slot0, slot1)
	slot2 = false

	if not slot0.buff.csvCfg.specialVal then
		slot2 = true
	else
		slot3.protectedEnv = AutoChessCsv.fillFuncEnv(slot3.protectedEnv, {
			beAttacked = slot1
		})
		slot2 = slot3:cfg2Value(slot3.csvCfg.specialVal[1])

		slot3.protectedEnv:resetEnv()
	end

	return slot2
end

slot2 = class("BuffKill", slot0)
AutoChessBattle.BuffKill = slot2

function slot2.checkCondition(slot0, slot1)
	slot2 = false

	if not slot0.buff.csvCfg.specialVal then
		slot2 = true
	else
		slot3.protectedEnv = AutoChessCsv.fillFuncEnv(slot3.protectedEnv, {
			attackTarget = slot1
		})
		slot2 = slot3:cfg2Value(slot3.csvCfg.specialVal[1])

		slot3.protectedEnv:resetEnv()
	end

	return slot2
end
