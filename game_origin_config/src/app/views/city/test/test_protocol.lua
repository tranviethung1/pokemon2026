require("battle.models.scene")
require("app.views.city.test.test_ch_protocol")

slot0 = __TestDefine.historyBattleInfo
slot1 = true
slot2 = {
	["battlePlay.Gate"] = {
		newWaveGoon = slot1,
		addCardRole = slot1,
		onNewRound = slot1,
		getObjectBaseSpeedRankSortKey = slot1,
		runGameEnd = slot1
	},
	ObjectModel = {
		beAttack = slot1,
		processRealDeath = slot1,
		toAttack = slot1,
		resumeHp = slot1,
		setDead = slot1,
		doFrontStage = slot1
	},
	BuffModel = {
		init = slot1,
		over = slot1,
		doEffect = slot1
	},
	["battleSkill.SkillModel"] = {
		spellTo = slot1
	},
	_Globals = {
		addBuffToHero = slot1
	},
	ymrand = {
		random = slot1,
		randomseed = slot1
	},
	battleEasy = {
		runDamageProcess = slot1
	},
	["battleEasy.DamageProcessFuncs.damageHit"] = {
		result = slot1
	},
	["battleEasy.DamageProcessFuncs.nature"] = {
		result = slot1
	},
	["battleEasy.DamageProcessFuncs.damageAdd"] = {
		result = slot1
	},
	["battleEasy.DamageProcessFuncs.damageDeepen"] = {
		result = slot1
	},
	["battleEasy.DamageProcessFuncs.dmgDelta"] = {
		result = slot1
	},
	["battleEasy.DamageProcessFuncs.natureDelta"] = {
		result = slot1
	},
	["battleEasy.DamageProcessFuncs.gateDelta"] = {
		result = slot1
	},
	["battleEasy.DamageProcessFuncs.reduce"] = {
		result = slot1
	},
	["battleEasy.DamageProcessFuncs.strikeBlock"] = {
		result = slot1
	},
	["battleEasy.DamageProcessFuncs.strike"] = {
		result = slot1
	},
	["battleEasy.DamageProcessFuncs.block"] = {
		result = slot1
	},
	["battleEasy.DamageProcessFuncs.extraAdd"] = {
		result = slot1
	},
	["battleEasy.DamageProcessFuncs.fatal"] = {
		result = slot1
	},
	["battleEasy.DamageProcessFuncs.behead"] = {
		result = slot1
	},
	["battleEasy.DamageProcessFuncs.damageByHpRate"] = {
		result = slot1
	},
	["battleEasy.DamageProcessFuncs.finalSkillAdd"] = {
		result = slot1
	},
	["battleEasy.DamageProcessFuncs.ultimateAdd"] = {
		result = slot1
	},
	["battleEasy.DamageProcessFuncs.skillPower"] = {
		result = slot1
	},
	["battleEasy.DamageProcessFuncs.buffAdd"] = {
		result = slot1
	},
	["battleEasy.DamageProcessFuncs.randFix"] = {
		result = slot1
	}
}
globals.__TestProtocol = {}
slot3 = {
	[3623] = {
		[3622.0] = true,
		[3621.0] = true
	}
}

function slot4(slot0)
	uv2 = "pairs"

	for slot4, slot5 in pairs(slot2) do
		if slot5[slot0] then
			return slot4
		end
	end

	return false
end

function slot5(slot0)
	uv1 = "__scene"
	uv3 = "__scene"

	if not slot3.objs[slot1.__scene.play.curWave] then
		uv3 = "__scene"
		slot3.objs[slot2] = {}
	end

	uv3 = "__scene"

	if not slot3.objs[slot2][slot0] then
		if not slot1:getFieldObject(slot0) then
			return
		end

		uv4 = "__scene"
		slot4 = slot4.objs[slot2]
		slot4[slot0] = __TestEasy.toObject(slot3)
		uv4 = "__scene"
		slot4 = slot4.objs[slot2][slot0]
		slot4.totalDamage = slot3.totalDamage
		uv4 = "__scene"
		slot4 = slot4.objs[slot2][slot0]
		slot4.totalResumeHp = slot3.totalResumeHp
		uv4 = "__scene"
		slot4 = slot4.objs[slot2][slot0]
		slot4.totalTakeDamage = slot3.totalTakeDamage
		uv4 = "__scene"
		slot4 = slot4.objs[slot2][slot0]
		slot4.specialExtraDamage = {}
		uv4 = "__scene"
		slot4.objs[slot2][slot0].specialExtraTake = {}
	end

	uv3 = "__scene"

	return slot3.objs[slot2][slot0]
end

function slot6(slot0, slot1, slot2, slot3, slot4, slot5)
	uv6 = "damageProcess"

	if not slot6.damageProcess[slot0] then
		uv6 = "damageProcess"
		slot6.damageProcess[slot0] = {}
	end

	uv7 = "damageProcess"

	if not slot7.damageProcess[slot0][slot2.args.damageId] then
		uv7 = "damageProcess"
		slot7.damageProcess[slot0][slot6] = {}
		slot7 = ""

		if slot2.args.buffCfgId ~= nil then
			slot7 = "fromBuff:" .. slot2.args.buffCfgId
		elseif slot2.args.skillId ~= nil then
			slot7 = "fromSkill:" .. slot2.args.skillId
		end

		uv9 = "damageProcess"

		table.insert(slot9.damageProcess[slot0][slot6], {
			attacker = __TestEasy.toObject(slot3),
			target = __TestEasy.toObject(slot4),
			origin = {
				id = slot7
			}
		})
	end

	slot7 = {
		name = slot1,
		sign = slot5
	}
	uv9 = "damageProcess"

	table.insert(slot9.damageProcess[slot0][slot6], slot7)

	return slot7
end

__TestProtocol["battlePlay.Gate/newWaveGoon"] = function ()
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
end

__TestProtocol["battlePlay.Gate/onNewRound"] = function (slot0, slot1, slot2, ...)
	slot3 = {
		...
	}

	if slot1 == __TestDefine.CallState.enter then
		-- Nothing
	elseif slot1 == __TestDefine.CallState.exit then
		-- Nothing
	end
end

__TestProtocol["battlePlay.Gate/runGameEnd"] = function (slot0, slot1, slot2, ...)
	slot3 = {
		...
	}

	if slot1 == __TestDefine.CallState.enter then
		uv4 = "__TestDefine"
		slot4.randCount = ymrand.randCount
		uv4 = "__TestDefine"
		slot4.frame = slot2.scene.framesInScene
	elseif slot1 == __TestDefine.CallState.exit then
		slot4 = {}
		slot5, slot6 = nil
		uv9 = "__TestDefine"

		for slot11, slot12 in pairs(slot9) do
			if string.sub(slot11, 1, 2) ~= "__" then
				if slot11 == "objs" then
					uv14 = "__TestDefine"

					for slot16 = 1, #slot14.wave do
						uv17 = "__TestDefine"
						slot18 = {}
						slot19 = {}
						slot20 = {}

						for slot24, slot25 in pairs(slot17.objs[slot16]) do
							slot4 = clone(slot25)
							slot26 = battleEasy.valueTypeTable()

							for slot30, slot31 in pairs(battle.DamageFrom) do
								slot26:add(slot25.totalDamage[slot31])
							end

							slot4._totalDamage = slot26
							slot27 = battleEasy.valueTypeTable()

							for slot31, slot32 in pairs(battle.ResumeHpFrom) do
								slot27:add(slot25.totalResumeHp[slot32])
							end

							slot27:add(slot4.resumeSpecialHp or 0)

							slot4._totalResumeHp = slot27
							slot28 = slot2.curRound
							slot4.totalRound = slot28
							uv28 = "CallState"

							if not slot28(slot4.unitId) then
								table.insert(slot19, slot24)

								slot20[slot24] = slot4
							end
						end

						table.sort(slot19)

						for slot24, slot25 in ipairs(slot19) do
							if slot20[slot25] then
								slot18[slot25] = slot20[slot25]
							end
						end

						slot7.objs[slot16] = slot18
					end

					uv13 = "__TestDefine"
					slot13.wave[slot2.curWave].result = slot2.result
				else
					slot7[slot11] = slot12
				end
			end
		end

		__TestDefine.historyBattleInfo = {
			objs = {}
		}
	end
end

__TestProtocol["battlePlay.Gate/getObjectBaseSpeedRankSortKey"] = function (slot0, slot1, slot2, ...)
	if slot1 == __TestDefine.CallState.enter then
		slot4 = ({
			...
		})[1]

		if slot2.scene.data.same_speed_rand == true then
			if not slot2.__sortOrderTb then
				slot2.__sortOrderTb = {
					1,
					2,
					3,
					4,
					5,
					6,
					7,
					8,
					9,
					10,
					11,
					12
				}
				slot5, slot6 = table.length(slot2.__sortOrderTb)

				for slot10 = 1, table.length(slot2.__sortOrderTb) do
					table.swapvalue(slot2.__sortOrderTb, slot5 - slot10 + 1, ymrand.random(1, slot5 - slot10 + 1))
				end
			end

			slot0.returnArgs = {}

			table.insert(slot0.returnArgs, slot2.__sortOrderTb[slot4.seat] or slot4.id)
		end
	elseif slot1 == __TestDefine.CallState.exit then
		-- Nothing
	end
end

__TestProtocol["battlePlay.Gate/addCardRole"] = function (slot0, slot1, slot2, ...)
	slot3 = {
		...
	}

	if slot1 == __TestDefine.CallState.enter then
		-- Nothing
	elseif slot1 == __TestDefine.CallState.exit and slot3[1] and slot4.type == battle.ObjectType.Normal then
		uv5 = "__TestDefine"

		slot5(slot4.id)
	end
end

__TestProtocol["ObjectModel/processRealDeath"] = function (slot0, slot1, slot2, ...)
	slot3 = {
		...
	}

	if slot1 == __TestDefine.CallState.enter then
		uv4 = "__TestDefine"

		if slot4.initObjs[slot2.scene.play.curWave][slot2.force][slot2.id] then
			uv4 = "__TestDefine"
			slot4.initObjs[slot2.scene.play.curWave][slot2.force][slot2.id] = false
		end

		__TestEasy.log("[OBJECT DEAD] self.id=%s attacker.id=%s", slot2.seat, slot2.attackMeDeadObj and slot2.attackMeDeadObj.seat)

		if slot2.attackMeDeadObj then
			uv4 = "CallState"

			if not slot4(slot2.attackMeDeadObj.id) then
				return
			end

			slot4.kill = slot4.kill or 0
			slot4.kill = slot4.kill + 1
		end
	elseif slot1 == __TestDefine.CallState.exit then
		-- Nothing
	end
end

__TestProtocol["ObjectModel/beAttack"] = function (slot0, slot1, slot2, ...)
	slot3 = {
		...
	}

	if slot1 == __TestDefine.CallState.enter then
		slot5 = slot3[4]
		slot0.objState = slot2:isDeath()
		slot0.preHp = slot2:hp()

		if slot3[1] and slot5.from == battle.DamageFrom.skill then
			uv6 = "__TestDefine"

			if slot6(slot2.id) then
				slot6.beAttack = slot6.beAttack or 0
				slot6.beAttackStrike = slot6.beAttackStrike or 0
				slot6.beAttackBlock = slot6.beAttackBlock or 0
				slot6.beAttack = slot6.beAttack + 1

				if slot5.strike then
					slot6.beAttackStrike = slot6.beAttackStrike + 1
				elseif slot5.block then
					slot6.beAttackBlock = slot6.beAttackBlock + 1
				end
			end
		end
	elseif slot1 == __TestDefine.CallState.exit then
		slot4 = slot2.scene.play

		if slot3[2].from == battle.DamageFrom.skill then
			-- Nothing
		end

		uv7 = "CallState"

		table.insert(slot7.process, {
			fromSkill = false,
			isDamage = true,
			wave = slot4.curWave,
			curRound = slot4.curRound,
			target = slot2.id,
			damage = battleEasy.valueTypeTable():addTable(slot3[1]),
			preHp = slot0.preHp,
			curHp = slot2:hp(),
			attacker = slot2.curAttackMeObj.id,
			fromSkill = true,
			skillId = slot2.curAttackMeObj.curSkill and slot2.curAttackMeObj.curSkill.id or 0
		})

		slot6 = slot3[1]:get(battle.ValueType.normal)

		if slot2.type ~= battle.ObjectType.Normal then
			uv7 = "enter"

			if slot7(slot2.unitID) then
				for slot11, slot12 in slot2.scene:ipairsAllHeros() do
					if slot12.unitID == slot7 then
						uv13 = "__TestDefine"

						if slot13(slot12.id) then
							slot13.specialExtraTake[slot2.unitID] = slot13.specialExtraTake[slot2.unitID] or 0
							slot13.specialExtraTake[slot2.unitID] = slot13.specialExtraTake[slot2.unitID] + math.ceil(slot6)
						end

						break
					end
				end
			end
		end

		if slot2.curAttackMeObj then
			uv8 = "__TestDefine"
			slot8 = slot8(slot7.id)
			slot9 = slot3[2].from

			if slot7.type ~= battle.ObjectType.Normal then
				uv10 = "enter"

				if slot10(slot7.unitID) then
					for slot14, slot15 in slot2.scene:ipairsAllHeros() do
						if slot15.unitID == slot10 then
							uv16 = "__TestDefine"

							if slot16(slot15.id) then
								slot16.specialExtraDamage[slot7.unitID] = slot16.specialExtraDamage[slot7.unitID] or 0
								slot16.specialExtraDamage[slot7.unitID] = slot16.specialExtraDamage[slot7.unitID] + math.ceil(slot6)
							end

							break
						end
					end
				elseif slot8 then
					slot8.extraHerosDamage = slot8.extraHerosDamage or 0
					slot8.extraHerosDamage = slot8.extraHerosDamage + math.ceil(slot6)
				end

				return
			end

			if slot8 then
				slot8.onceMaxDamage = slot8.onceMaxDamage or 0
				slot8.onceMaxDamage = math.max(slot6, slot8.onceMaxDamage)
				slot8.totalDamage[battle.DamageFromExtra.allocate] = slot8.totalDamage[battle.DamageFromExtra.allocate] or battleEasy.valueTypeTable()
				slot8.totalDamage[battle.DamageFromExtra.link] = slot8.totalDamage[battle.DamageFromExtra.link] or battleEasy.valueTypeTable()

				slot8.totalDamage[battle.DamageFromExtra.allocate]:add(slot3[2].fromExtra and slot3[2].fromExtra[battle.DamageFromExtra.allocate] and slot3[1]:get(battle.ValueType.normal) or 0)
				slot8.totalDamage[battle.DamageFromExtra.link]:add(slot3[2].fromExtra and slot3[2].fromExtra[battle.DamageFromExtra.link] and slot3[1]:get(battle.ValueType.normal) or 0)
			end
		end

		if slot2:isDeath() ~= slot0.objState and not slot2.killDamageFrom then
			slot2.killDamageFrom = slot3[2].from
		end
	end
end

__TestProtocol["ObjectModel/toAttack"] = function (slot0, slot1, slot2, ...)
	slot3 = {
		...
	}

	if slot1 == __TestDefine.CallState.enter then
		-- Nothing
	elseif slot1 == __TestDefine.CallState.exit then
		-- Nothing
	end
end

__TestProtocol["ObjectModel/resumeHp"] = function (slot0, slot1, slot2, ...)
	slot3 = {
		...
	}
	slot4 = slot2.scene.play

	if slot1 == __TestDefine.CallState.enter then
		slot0.preHp = slot2:hp()
		slot0.caster = slot3[1]

		if slot3[3].from == battle.ResumeHpFrom.skill then
			-- Nothing
		end

		slot0.damageInfo = {
			fromSkill = false,
			isDamage = false,
			wave = slot4.curWave,
			curRound = slot4.curRound,
			target = slot2.id,
			preHp = slot0.preHp,
			attacker = slot0.caster,
			fromSkill = true,
			skillId = slot0.caster.curSkill and slot0.caster.curSkill.id or 0
		}
	elseif slot1 == __TestDefine.CallState.exit then
		slot0.damageInfo.damage = battleEasy.valueTypeTable():addTable(slot3[1])
		slot6 = slot2:hp()
		slot0.damageInfo.curHp = slot6
		uv6 = "scene"

		table.insert(slot6.process, slot0.damageInfo)
	end
end

__TestProtocol["BuffModel/over"] = function (slot0, slot1, slot2, ...)
	slot3 = {
		...
	}

	if slot1 == __TestDefine.CallState.enter then
		slot4 = debug.getinfo(3)
		slot5 = string.format("%s [Line:%s]", slot4.source, slot4.currentline)
		slot6 = debug.getinfo(4)
		slot7 = string.format("%s [Line:%s]", slot6.source, slot6.currentline)
	elseif slot1 == __TestDefine.CallState.exit then
		-- Nothing
	end
end

__TestProtocol["BuffModel/init"] = function (slot0, slot1, slot2, ...)
	slot3 = {
		...
	}

	if slot1 == __TestDefine.CallState.enter then
		-- Nothing
	elseif slot1 == __TestDefine.CallState.exit then
		-- Nothing
	end
end

__TestProtocol["BuffModel/doEffect"] = function (slot0, slot1, slot2, ...)
	slot3 = {
		...
	}

	if slot1 == __TestDefine.CallState.enter then
		if itertools.include(__TestDefine.buffId, tostring(slot2.cfgId)) then
			uv4 = "__TestDefine"

			if slot4(slot2.holder.id) then
				slot4.buffTakeEffect = slot4.buffTakeEffect or {}
				slot4.buffTakeEffect[slot2.cfgId] = slot4.buffTakeEffect[slot2.cfgId] or 0
				slot4.buffTakeEffect[slot2.cfgId] = slot4.buffTakeEffect[slot2.cfgId] + 1
			end
		end

		if slot3[1] == "setHpPer" then
			uv4 = "__TestDefine"

			if slot4(slot2.caster.id) then
				slot4.resumeSpecialHp = slot4.resumeSpecialHp or 0
				slot4.resumeSpecialHp = math.ceil(slot4.resumeSpecialHp + slot2.holder:hpMax() * slot3[2] - slot2.holder:hp())
			end
		end
	elseif slot1 == __TestDefine.CallState.exit then
		-- Nothing
	end
end

__TestProtocol["battleSkill.SkillModel/spellTo"] = function (slot0, slot1, slot2, ...)
	slot3 = {
		...
	}

	if slot1 == __TestDefine.CallState.enter then
		slot4 = slot2.owner
		slot5 = slot4.scene.play
		uv6 = "__TestDefine"
		slot6 = slot6(slot4.id)
		slot0.preTotalDamage = {}

		for slot10, slot11 in pairs(slot4.totalDamage) do
			slot0.preTotalDamage[slot10] = battleEasy.valueTypeTable()

			slot0.preTotalDamage[slot10]:addTable(slot11)
		end

		if slot2.cfg.skillType2 == battle.MainSkillType.BigSkill and not slot6.firstBigSkillRound then
			slot6.firstBigSkillRound = slot5.totalRound
		end

		slot7 = slot2.cfg.skillType2

		if not slot6 then
			return
		end

		if not slot6.skillTime[slot7] then
			slot6.skillTime[slot7] = 0
		end

		slot6.skillTime[slot7] = slot6.skillTime[slot7] + 1

		if not slot6.skillTimeById[slot2.id] then
			slot6.skillTimeById[slot8] = 0
		end

		slot6.skillTimeById[slot8] = slot6.skillTimeById[slot8] + 1
	elseif slot1 == __TestDefine.CallState.exit then
		-- Nothing
	end
end

__TestProtocol["ObjectModel/setDead"] = function (slot0, slot1, slot2, ...)
	slot3 = {
		...
	}

	if slot1 == __TestDefine.CallState.enter then
		slot4 = slot2.scene.play

		if slot3[1] then
			uv5 = "__TestDefine"

			if not slot5(slot3[1].id) then
				return
			end

			if not slot5.firstKill then
				slot5.firstKill = slot4.totalRound
			end
		end
	elseif slot1 == __TestDefine.CallState.exit and slot2.state == battle.ObjectState.realDead then
		slot4 = slot2.scene.play
		uv5 = "__TestDefine"

		if not slot5(slot2.id) then
			return
		end

		slot5.deadBigRound = slot4.totalRound
	end
end

__TestProtocol["ObjectModel/doFrontStage"] = function (slot0, slot1, slot2, ...)
	slot3 = {
		...
	}

	if slot1 == __TestDefine.CallState.enter then
		slot4 = slot2
		slot5 = slot4:getEventByKey(battle.ExRecordEvent.frontStage)

		if slot4 and slot4.type ~= battle.ObjectType.Normal and slot5 then
			uv6 = "__TestDefine"

			if not slot6(slot2.id) then
				return
			end

			slot6.seat = slot5.frontStageTarget
		end
	elseif slot1 == __TestDefine.CallState.exit then
		-- Nothing
	end
end

__TestProtocol["ymrand/random"] = function (slot0, slot1, slot2, ...)
	slot3 = {
		...
	}

	if slot1 == __TestDefine.CallState.enter then
		-- Nothing
	elseif slot1 == __TestDefine.CallState.exit then
		-- Nothing
	end
end

__TestProtocol["ymrand/randomseed"] = function (slot0, slot1, slot2, ...)
	if slot1 == __TestDefine.CallState.exit then
		slot0.__func(slot2)
	end
end

printDebug(json.encode(battleEasy))

for slot10, slot11 in pairs(battleEasy.DamageProcessFuncs) do
	__TestProtocol["battleEasy.DamageProcessFuncs." .. slot10 .. "/result"] = function (slot0, slot1, slot2, ...)
		slot3 = {
			...
		}

		if slot1 == __TestDefine.CallState.enter then
			slot5 = slot3[1]
			uv8 = "__TestDefine"
			uv10 = "CallState"
			slot0.processItem = slot8(slot5.scene.play.curWave, slot10, slot2, slot5, slot3[2], slot3[3])
		elseif slot1 == __TestDefine.CallState.exit then
			slot4 = slot3[1]
			slot0.processItem.rate = slot3[2] or "nil"
		end
	end
end

__TestProtocol["battleEasy/runDamageProcess"] = function (slot0, slot1, slot2, ...)
	slot3 = {
		...
	}

	if slot1 == __TestDefine.CallState.enter then
		slot4 = slot2
		slot6 = slot3[2]
		slot7 = slot3[3]
		slot8 = slot3[4]
		slot0.wave = slot3[1].scene.play.curWave
	elseif slot1 == __TestDefine.CallState.exit then
		slot4 = slot3[1]
		slot6 = slot3[2].damageId
		uv7 = "__TestDefine"

		if slot7.damageProcess[slot0.wave] and slot7[slot6] then
			slot8 = {
				rate = 0,
				name = "sum2"
			}

			for slot12 = 2, #slot7[slot6] do
				if slot7[slot6][slot12].sign:find("sum2") and slot7[slot6][slot12].rate ~= "nil" then
					slot8.rate = slot8.rate + slot7[slot6][slot12].rate
				end
			end

			slot8.rate = math.max(slot8.rate + 1, 0.05)

			table.insert(slot7[slot6], slot8)
		end
	end
end

__TestProtocol["_Globals/addBuffToHero"] = function (slot0, slot1, slot2, ...)
	slot3 = {
		...
	}

	if slot1 == __TestDefine.CallState.enter then
		-- Nothing
	elseif slot1 == __TestDefine.CallState.exit then
		-- Nothing
	end
end

function slot7(slot0)
	if slot0 == "_Globals" then
		return _G
	end

	slot2 = _G

	for slot6 = 1, #string.split(slot0, ".") do
		if slot6 == #slot1 then
			return slot2[slot1[slot6]]
		end

		slot2 = slot2[slot1[slot6]]
	end
end

function ()
	uv1 = "pairs"

	for slot3, slot4 in pairs(slot1) do
		uv5 = "__TestEasy"

		if slot5(slot3) then
			for slot9, slot10 in pairs(slot4) do
				if slot10 then
					__TestEasy.addFuncListener(slot9, slot5, slot3 .. "/" .. slot9)
				end
			end
		end
	end
end()

return __TestProtocol
