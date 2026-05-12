slot0 = class("Tasks", require("app.models.base"))
slot1 = game.TARGET_TYPE

function slot2(...)
	return 0
end

slot4 = {
	[slot1.Level] = {
		"role",
		"level"
	},
	[slot1.Gate] = {
		"role",
		"gate_star",
		function (slot0, slot1)
			if ((slot0 or {})[slot1] or {}).star and slot3.star > 0 then
				return 1
			end

			return 0
		end
	},
	[slot1.CardsTotal] = {
		"role",
		"cards",
		function (slot0, slot1)
			return itertools.size(slot0)
		end
	},
	[slot1.CardGainTotalTimes] = {
		"role",
		"card_gain_times"
	},
	[slot1.Vip] = {
		"role",
		"vip_level"
	},
	[slot1.EquipAdvanceCount] = {
		"role",
		"equips",
		slot2
	},
	[slot1.CardAdvanceTotalTimes] = {
		"role",
		"card_advance_times"
	},
	[slot1.GateStar] = {
		"role",
		"total_level_stars"
	},
	[slot1.CardAdvanceCount] = {
		"cards",
		[3] = function (slot0, slot1)
			for slot6, slot7 in slot0:pairs() do
				if slot1 <= slot7:read("advance") then
					slot2 = 0 + 1
				end
			end

			return slot2
		end
	},
	[slot1.UnlockPokedex] = {
		"role",
		"pokedex",
		function (slot0, slot1)
			return itertools.size(slot0)
		end
	},
	[slot1.GateChanllenge] = {
		"daily_record",
		"gate_chanllenge"
	},
	[slot1.HeroGateChanllenge] = {
		"daily_record",
		"hero_gate_chanllenge"
	},
	[slot1.HuodongChanllenge] = {
		"daily_record",
		"huodong_chanllenge"
	},
	[slot1.EndlessChallenge] = {
		"daily_record",
		"endless_challenge"
	},
	[slot1.ArenaBattle] = {
		"daily_record",
		"pvp_pw_times"
	},
	[slot1.DrawCard] = {
		"daily_record",
		"draw_card"
	},
	[slot1.WorldBossBattleTimes] = {
		"daily_record",
		"boss_gate"
	},
	[slot1.EquipStrength] = {
		"daily_record",
		"equip_strength"
	},
	[slot1.EquipAdvance] = {
		"daily_record",
		"equip_advance"
	},
	[slot1.CardSkillUp] = {
		"daily_record",
		"skill_up"
	},
	[slot1.LianjinTimes] = {
		"daily_record",
		"lianjin_times"
	},
	[slot1.DrawGem] = {
		"daily_record",
		"draw_gem"
	},
	[slot1.FishingTimes] = {
		"daily_record",
		"fishing_counter"
	},
	[slot1.FishingWinTimes] = {
		"daily_record",
		"fishing_win_counter"
	},
	[slot1.CompleteImmediate] = {
		"role",
		"last_time",
		function (...)
			return 1
		end
	},
	[slot1.CardAdvance] = {
		"daily_record",
		"card_advance_times"
	},
	[slot1.BuyStaminaTimes] = {
		"daily_record",
		"buy_stamina_times"
	},
	[slot1.CostRmb] = {
		"daily_record",
		"consume_rmb_sum"
	},
	[slot1.CardLevelUp] = {
		"daily_record",
		"level_up"
	},
	[slot1.CloneBattleTimes] = {
		"daily_record",
		"clone_times"
	},
	[slot1.NightmareGateChanllenge] = {
		"daily_record",
		"nightmare_gate_chanllenge"
	},
	[slot1.UnionContrib] = {
		"daily_record",
		"union_contrib_times"
	},
	[slot1.YYHuodongOpen] = {
		"role",
		"yyhuodongs",
		slot2
	}
}

function slot0.init(slot0, slot1)
	slot2 = {}

	if slot1._mem then
		for slot6, slot7 in pairs(slot1._mem) do
			for slot12, slot13 in pairs(slot7) do
				if type(slot13) == "table" then
					-- Nothing
				else
					slot8[slot12] = {
						arg = 0,
						id = slot12,
						flag = slot13
					}
				end
			end

			slot2[slot6] = idlereasy.new({
				[slot12] = {
					arg = 0,
					id = slot13[1],
					flag = slot13[2]
				}
			}, slot6)
		end
	end

	slot0.__idlers = idlers.newWithMap(slot2, tostring(slot0))
	slot0._notify = {}

	return slot0
end

function slot0.updSync(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot1) do
		for slot12, slot13 in pairs(slot7) do
			if type(slot13) == "table" then
				-- Nothing
			else
				slot8[slot12] = {
					arg = 0,
					id = slot12,
					flag = slot13
				}
			end
		end

		if itertools.size({
			[slot12] = {
				arg = 0,
				id = slot13[1],
				flag = slot13[2]
			}
		}) > 0 then
			slot0.__idlers:at(slot6):modify(function (slot0)
				uv2 = "pairs"

				for slot4, slot5 in pairs(slot2) do
					slot0[slot4] = slot5
				end

				return true, slot0
			end, false)

			slot0._notify[slot6] = true
		end
	end
end

function slot0.delSync(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot7 = {}

		for slot11, slot12 in pairs(slot6) do
			table.insert(slot7, slot11)
		end

		if #slot7 > 0 then
			slot0.__idlers:at(slot5):modify(function (slot0)
				uv2 = "ipairs"

				for slot4, slot5 in ipairs(slot2) do
					slot0[slot5] = nil
				end

				return true, slot0
			end, false)

			slot0._notify[slot5] = true
		end
	end
end

function slot0.afterSync(slot0, slot1)
	if slot0.__idlers == nil then
		return
	end

	for slot5, slot6 in slot0.__idlers:pairs() do
		slot6:modify(function (slot0)
			for slot4, slot5 in pairs(slot0) do
				if csv.tasks[slot5.id] then
					slot9 = slot7.targetArg
					uv10 = "pairs"

					if slot10[slot7.targetType] then
						uv11 = "pairs"
						slot10, slot11, slot12 = unpack(slot11[slot8], 1, 3)
						uv14 = "id"

						if slot5.arg ~= (slot11 and (slot12 and slot12(slot15, slot9) or slot15) or slot12(slot14.game[slot10], slot9)) then
							slot5.arg = 0
							uv15 = "id"
							uv16 = "csv"
							slot15._notify[slot16] = true
						end
					else
						error("task target " .. slot8 .. " not watched!")
					end
				else
					printWarn("task %d not existed in csv", slot6)
				end
			end

			return true, slot0
		end, false)

		if slot0._notify[slot5] then
			slot0._notify[slot5] = nil

			slot6:notify()
		end
	end
end

return slot0
