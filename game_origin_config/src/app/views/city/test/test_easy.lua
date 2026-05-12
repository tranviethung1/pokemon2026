slot0 = unpack
slot2 = require("3rd.msgpack").pack
globals.__TestEasy = {}
slot3 = {
	specialDefence = 3000,
	strikeResistance = 1,
	mp1Recover = 1,
	natureRestraint = 1,
	mp2 = 1,
	damageDeepen = 1,
	hpRecover = 1,
	level = 1,
	classify = 0,
	specialDefenceIgnore = 1,
	mp2Recover = 1,
	mp1 = 1000,
	star = 5,
	rebound = 0,
	defence = 3000,
	controlPer = 0,
	damage = 10000,
	block = 1,
	strike = 1,
	speed = 14,
	hp = 100000,
	immuneGate = 1,
	fightPoint = 0,
	suckBlood = 0,
	breakBlock = 1,
	damageReduce = 1,
	defenceIgnore = 1,
	ultimateAdd = 0,
	ultimateSub = 0,
	dodge = 1,
	specialDamage = 10000,
	damageSub = 1,
	hit = 10000,
	damageAdd = 1,
	gatePer = 1,
	blockPower = 1,
	strikeDamage = 15000,
	cure = 1,
	skills = {},
	passive_skills = {}
}

function __TestEasy.addFuncListener(slot0, slot1, slot2)
	if slot1[slot0] and __TestProtocol[slot2] then
		slot1[slot0] = function (...)
			if not __TestDefine.Monitor then
				if __TestDefine.changeMonitor then
					uv0 = "__TestDefine"

					if slot0 ~= "battlePlay.Gate/runGameEnd" then
						uv0 = "Monitor"

						return slot0(...)
					end
				end
			end

			slot0 = {
				__func = slot1
			}
			uv1 = "Monitor"
			uv2 = "__TestDefine"

			__TestProtocol[slot2](slot0, __TestDefine.CallState.enter, ...)

			slot1 = nil

			if slot0.returnArgs ~= nil then
				slot1 = slot0.returnArgs
			else
				uv3 = "Monitor"
				slot1 = {
					slot3(...)
				}
			end

			uv3 = "__TestDefine"
			slot3 = slot0
			uv6 = "changeMonitor"

			__TestProtocol[slot3](slot3, __TestDefine.CallState.exit, ({
				...
			})[1], slot6(slot1))

			slot2 = __TestEasy.excuteCHProtocol
			uv3 = "__TestDefine"

			slot2(slot3, slot0, slot1, ...)

			uv2 = "changeMonitor"

			return slot2(slot1)
		end

		__TestDefine.MonitorFunc[slot2] = __TestDefine.MonitorFunc[slot2] or slot1[slot0]
	end
end

function __TestEasy.log(...)
end

function __TestEasy.toObject(slot0)
	return {
		hp = slot0:hp(),
		hpMax = slot0:hpMax(),
		mp = slot0:mp1(),
		mpMax = slot0:mp1Max(),
		name = slot0.unitCfg.name,
		id = slot0.id,
		seat = slot0.seat,
		force = slot0.force,
		unitId = slot0.unitID,
		skillTime = {},
		skillTimeById = {}
	}
end

function __TestEasy.toBuff(slot0)
	return {
		from = "",
		state = -1,
		cfgId = slot0.cfgId,
		casterId = slot0.caster and slot0.caster.id or 999,
		holderId = slot0.holder.id,
		lifeRound = slot0.lifeRound,
		easyEffectFunc = slot0.csvCfg.easyEffectFunc,
		value = slot0.isNumberType and slot0.buffValue or tostring(slot0.buffValue)
	}
end

function __TestEasy.toValueType(slot0)
	slot1 = nil

	for slot5, slot6 in pairs(battle.ValueType) do
		slot7 = tonumber(slot0:get(slot6))
		slot1 = slot1 and slot1 .. "|" .. slot7 or slot7
	end

	return slot1
end

function __TestEasy.pushCHProtocol(slot0, slot1)
	__TestDefine.chProtocol[slot0].protocol = __TestDefine.chProtocol[slot0].protocol or {}

	table.insert(__TestDefine.chProtocol[slot0].protocol, slot1)
end

function __TestEasy.clearCHProtocol(slot0, slot1)
	__TestDefine.chProtocol[slot0].protocol = {}
end

slot4 = {
	counter = function (slot0)
		if not slot0 then
			return 0
		end

		return slot0 + 1
	end,
	sum = function (slot0, slot1)
		if not slot0 then
			return 0
		end

		if type(slot1) == "table" then
			return "val_sum_with_table"
		end

		return slot0 + (slot1 or 0)
	end,
	array = function (slot0, slot1)
		if not slot0 then
			return {}
		end

		if type(slot1) == "table" then
			table.insert(slot0, dumps(slot1))
		else
			table.insert(slot0, slot1)
		end

		return slot0
	end
}

function __TestEasy.excuteCHProtocol(slot0, ...)
	if __TestDefine.chProtocol[slot0] and slot1.changeArgs then
		slot1.changeArgs(...)
	end

	if slot1 and slot1.protocol and table.length(slot1.protocol) > 0 then
		slot2 = slot1.makeEnv(...)
		slot3 = __TestDefine.historyBattleInfo.extraData or {}
		slot4 = nil

		for slot8, slot9 in ipairs(slot1.protocol) do
			uv10 = "__TestDefine"

			if slot3[slot9.output[1]] == nil then
				slot4 = slot10[slot9.type]()
			end

			if eval.doFormula(slot9.condition, slot2) then
				slot4 = (not slot9.output[2] or slot10(slot4, eval.doFormula(slot9.output[2], slot2))) and slot10(slot4)
			end

			slot3[slot9.output[1]] = slot4
		end

		__TestDefine.historyBattleInfo.extraData = slot3
	end
end

function __TestEasy.gainBattleRecord(slot0)
	slot1 = nil
	slot2 = game.GATE_TYPE.test

	if slot0.sceneID >= 1000 then
		slot1 = require("app.views.city.test.gate.pve_gate")
		slot2 = csv.scene_conf[slot0.sceneID].gateType
	else
		slot1 = (slot0.sceneID ~= game.GATE_TYPE.crossArena or require("app.views.city.test.gate.cross_arena_gate")) and require("app.views.city.test.gate.normal_gate")
	end

	slot3 = {
		gateFirst = true,
		moduleType = 1,
		roleLevel = 1,
		sceneID = slot0.sceneID,
		randSeed = math.random(1, 1000000),
		talents = {
			{},
			{}
		},
		fightgoVal = slot4,
		gateType = slot2
	}
	uv4 = "game"
	slot0.DefaultAttr = {
		0,
		0
	}
	slot4, slot5 = slot1:getFightRoleData(slot0)

	if #slot4 == 0 then
		return
	end

	slot3.gateType = slot5 or slot3.gateType
	slot3.roleOut = slot4[1]
	slot6 = slot4[1]
	slot3.roleOut2 = slot6
	uv6 = "GATE_TYPE"

	return slot6(slot3)
end

return __TestEasy
