function slot0(slot0, slot1, slot2, slot3)
	if slot3 then
		slot0["normal" .. slot1] = slot3:get(battle.ValueType.normal) - slot2:get(battle.ValueType.normal)
		slot0["overFlow" .. slot1] = slot3:get(battle.ValueType.overFlow) - slot2:get(battle.ValueType.overFlow)
		slot0["valid" .. slot1] = slot3:get(battle.ValueType.valid) - slot2:get(battle.ValueType.valid)
	else
		slot0["normal" .. slot1] = slot2:get(battle.ValueType.normal)
		slot0["overFlow" .. slot1] = slot2:get(battle.ValueType.overFlow)
		slot0["valid" .. slot1] = slot2:get(battle.ValueType.valid)
	end
end

__TestDefine.chProtocol = {
	["battlePlay.Gate/newWaveGoon"] = {
		makeEnv = function (slot0, slot1, slot2, ...)
			return {
				play = slot2,
				curWave = slot2.curWave,
				scene = slot2.scene
			}
		end
	},
	["BuffModel/init"] = {
		makeEnv = function (slot0, slot1, slot2, ...)
			return {
				buffID = slot2.cfgId,
				buffType = slot2.csvCfg.easyEffectFunc,
				lifeRound = slot2.lifeRound,
				casterSeat = slot2.caster and slot2.caster.seat or -1,
				holderSeat = slot2.holder.seat,
				buff = slot2
			}
		end,
		protocol = {}
	},
	["BuffModel/over"] = {
		makeEnv = function (slot0, slot1, slot2, ...)
			return {
				buffID = slot2.cfgId,
				buffType = slot2.csvCfg.easyEffectFunc,
				roundTimes = slot2.nowRound - slot2.startRound
			}
		end,
		protocl = {}
	},
	["ObjectModel/beAttack"] = {
		makeEnv = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
			slot7, slot8 = unpack(slot1)

			return {
				strikeCount = 0,
				buffAtkCount = 0,
				blockCount = 0,
				buffID = slot8.buffCfgId or 0,
				skillID = slot8.skillId or 0,
				attackerForce = slot3.force,
				attackerUnitID = slot3.unitID,
				targetSeat = slot2.seat,
				targetUnitID = slot2.unitID,
				damageFromBuff = slot8.from == battle.DamageFrom.buff,
				isblock = slot8.block and 1 or 2,
				isstrike = slot8.strike and 1 or 2,
				normalDamage = slot7:get(battle.ValueType.normal),
				overFlowDamage = slot7:get(battle.ValueType.overFlow),
				validDamage = slot7:get(battle.ValueType.valid)
			}
		end,
		protocl = {}
	},
	["ObjectModel/resumeHp"] = {
		makeEnv = function (slot0, slot1, slot2, slot3, slot4, slot5)
			slot6 = slot1[1]

			return {
				buffID = slot5.fromKey or 0,
				skillID = slot5.skillId or 0,
				casterForce = slot3.force,
				normalResumeHp = slot6:get(battle.ValueType.normal),
				overFlowResumeHp = slot6:get(battle.ValueType.overFlow),
				validResumeHp = slot6:get(battle.ValueType.valid)
			}
		end
	},
	["battleSkill.SkillModel/spellTo"] = {
		makeEnv = function (slot0, slot1, slot2, slot3, slot4)
			slot6 = {
				exAttackCfgId = slot2.owner.exAttackCfgId or 0,
				skillID = slot2.id,
				csvSkill = battleCsv.CsvSkill.newWithCache(slot2),
				csvSelf = battleCsv.CsvObject.newWithCache(slot2.owner),
				csvTarget = battleCsv.CsvObject.newWithCache(slot3)
			}

			for slot11, slot12 in pairs(battle.DamageFrom) do
				uv13 = "preTotalDamage"

				slot13(slot6, slot11 .. "Damage", slot0.preTotalDamage[slot12], slot2.owner.totalDamage[slot12])
			end

			return slot6
		end,
		protocol = {}
	}
}
