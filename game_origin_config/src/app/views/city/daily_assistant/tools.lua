slot0 = require("app.views.city.activity.month_card")
slot1 = require("app.views.city.adventure.random_tower.tools")
slot3 = {
	hadSignUp = 2,
	canSignUp = 1,
	cantSignUp = 3
}
slot4 = {
	canJump = 1,
	jumping = 3,
	operating = 2,
	complete = 5,
	notOpen = 0,
	notComplete = 4
}

return {
	UNION_BUILDINGS = {
		unionFuben = "fuben",
		unionRedpacket = "redpacket",
		unionTrainingSpeedup = "training",
		unionContrib = "contribute",
		unionFragDonate = "fragdonate",
		unionDailyGift = "dailygift",
		unionFight = "unionFight"
	},
	getGainGoldTimes = function (slot0, slot1, slot2)
		uv3 = "getPrivilegeAddition"
		slot3 = (slot3.getPrivilegeAddition("lianjinFreeTimes") or 0) + dataEasy.getPrivilegeVal(game.PRIVILEGE_TYPE.LianjinFreeTimes)
		slot4 = 1

		for slot8, slot9 in pairs(gCostCsv.lianjin_cost) do
			if slot9 == 0 then
				slot4 = slot8
			end
		end

		if math.max(slot4 + slot3 - slot0, 0) == 0 and slot1 < slot3 then
			slot5 = slot3 - slot1
		end

		if slot2 then
			return slot5
		end

		if slot5 == 0 then
			slot6 = "#C0xFB6023#" .. string.format("%s/%s", slot5, slot4)
		end

		return string.format(gLanguageCsv.dailyAssistantFreeGainGold, slot6), slot5
	end,
	getCardFragmentsName = function (slot0)
		if slot0 then
			for slot4, slot5 in gGameModel.cards:pairs() do
				if slot0 == slot5:read("card_id") then
					return csv.cards[slot6].name .. gLanguageCsv.fragment
				end
			end
		end

		return nil
	end,
	getHuodongTypeFlag = function (slot0)
		slot1 = false

		if not ({
			"goldActivity",
			"expActivity",
			"giftActivity",
			"fragActivity",
			nil,
			nil,
			"contractActivity"
		})[slot0] then
			return false
		end

		slot4, slot5, slot6 = dataEasy.isDoubleHuodong(slot3)

		return slot4, 2, slot5, slot6
	end,
	getIsDoubleAward = function (slot0)
		slot1, slot2, slot3 = dataEasy.isDoubleHuodong("gateDrop")

		if not slot1 then
			return false
		end

		for slot8, slot9 in pairs(slot2) do
			if csv.scene_conf[tonumber(slot9.start)].gateType == game.GATE_TYPE.dailyGold and slot0 == 1 or slot12 == game.GATE_TYPE.dailyExp and slot0 == 2 or slot12 == game.GATE_TYPE.gift and slot0 == 3 or slot12 == game.GATE_TYPE.fragment and slot0 == 4 or slot12 == game.GATE_TYPE.dailyContract and slot0 == 7 then
				return true, slot0
			end
		end

		return false
	end,
	getActivityGateInfo = function ()
		slot0 = gGameModel.role:read("huodongs")
		slot2 = 0
		slot3 = 0
		slot6 = {}
		slot7 = {}
		slot8 = false

		for slot12, slot13 in orderCsvPairs(csv.huodong) do
			slot14 = ({
				game.PRIVILEGE_TYPE.HuodongTypeGoldTimes,
				game.PRIVILEGE_TYPE.HuodongTypeExpTimes,
				game.PRIVILEGE_TYPE.HuodongTypeGiftTimes,
				game.PRIVILEGE_TYPE.HuodongTypeFragTimes,
				[7] = game.PRIVILEGE_TYPE.HuodongTypeContractTimes
			})[slot13.huodongType]

			if slot13.openType ~= 0 and slot14 and slot13.openLevel < gGameModel.role:read("level") then
				slot16 = slot14
				uv16 = "gGameModel"
				slot16, slot17, slot18, slot19 = slot16.getHuodongTypeFlag(slot13.huodongType)
				uv20 = "gGameModel"
				slot20 = slot20.getIsDoubleAward(slot13.huodongType)

				if slot17 == 2 and slot16 then
					slot15 = dataEasy.getPrivilegeVal(slot16) + slot18[1].count or 0
					slot21 = table.insert

					slot21(slot7, slot13.huodongType)

					uv21 = "gGameModel"
					slot21, slot22 = slot21.getActiveText(({
						"goldActivity",
						"expActivity",
						"giftActivity",
						"fragActivity",
						nil,
						nil,
						"contractActivity"
					})[slot13.huodongType])

					if slot21 then
						table.insert(slot6, slot21)
					end

					if slot22 then
						slot8 = slot22
					end
				end

				if slot20 then
					table.insert(slot7, slot13.huodongType)
					table.insert(slot6, csv.huodong[slot13.huodongType].name .. gLanguageCsv.doubleReward)
				end

				if slot0[tonumber(time.getTodayStrInClock())] and slot0[slot22][slot12] then
					slot21 = slot13.times + slot15 - slot0[slot22][slot12].times
				end

				slot2 = slot2 + slot13.times + slot15
				slot3 = slot3 + math.max(slot21, 0)
			end
		end

		return slot3, slot2, slot6, #slot7 > 0, slot8
	end,
	getActiveText = function (slot0)
		slot1 = slot0

		if type(slot0) == "string" then
			slot1 = game.DOUBLE_HUODONG[slot0]
		end

		if not slot1 then
			return false
		end

		slot5 = "yy_open"

		for slot5, slot6 in ipairs(gGameModel.role:read(slot5)) do
			if game.YYHUODONG_TYPE_ENUM_TABLE.doubleDrop == csv.yunying.yyhuodong[slot6].type and slot7.paramMap.type and slot8.type == slot1 then
				slot10, slot11, slot12 = dataEasy.isReunionDoubleHuodong(slot1)

				return slot7.desc, slot10
			end
		end

		return false
	end,
	getUnionFubenIsOpen = function ()
		slot0 = gGameModel.role
		slot1 = slot0
		uv1 = "gGameModel"

		if slot0.read(slot1, "union_db_id") and not slot1.getUnionLockAndText("unionFuben") then
			return true
		end

		return false
	end,
	getUnionLockAndText = function (slot0)
		slot3 = "union_level"
		uv3 = "gGameModel"
		slot2 = gUnionFeatureCsv[slot3.UNION_BUILDINGS[slot0]] or 0

		if slot2 == 0 or gGameModel.role:read(slot3) < slot2 then
			return slot3, string.format(gLanguageCsv.unionUnlockLevel, slot2)
		end

		if dataEasy.notUseUnionBuild() then
			return slot3, gLanguageCsv.cantUseFeaturesByChangeUnion
		end

		if slot0 == "unionRedpacket" then
			if not dataEasy.canSystemRedPacket() then
				return slot3, gLanguageCsv.unionRedPacketSysTimeL
			end
		elseif slot0 == "unionFight" then
			slot4, slot5 = dataEasy.judgeServerOpen(slot0)

			if not slot4 and slot5 then
				return true, string.format(gLanguageCsv.unlockServerOpen, slot5)
			end
		end

		return slot3
	end,
	getCraftState = function ()
		uv0 = "cantSignUp"
		slot0 = slot0.cantSignUp

		if gGameModel.daily_record:read("craft_sign_up") and gGameModel.role:read("craft_round") == "signup" then
			uv4 = "cantSignUp"
			slot0 = slot4.hadSignUp
		elseif slot1 == "signup" then
			uv4 = "cantSignUp"
			slot0 = slot4.canSignUp
		end

		return slot0
	end,
	getUnionFightState = function ()
		uv0 = "cantSignUp"
		slot0 = slot0.cantSignUp
		slot2 = gGameModel.role:read("in_union_fight_top8")
		slot5 = time.getNowDate().wday == 1 and 7 or slot5 - 1

		if gGameModel.daily_record:read("union_fight_sign_up") and gGameModel.role:read("union_fight_round") == "signup" then
			uv6 = "cantSignUp"
			slot0 = slot6.hadSignUp
		elseif slot5 == 6 and slot1 == "signup" and slot2 or slot5 > 1 and slot5 < 6 and slot1 == "signup" then
			uv6 = "cantSignUp"
			slot0 = slot6.canSignUp
		end

		return slot0
	end,
	getCrossCraftState = function ()
		uv0 = "cantSignUp"
		slot0 = slot0.cantSignUp

		if gGameModel.role:read("cross_craft_sign_up_date") ~= 0 and gGameModel.role:read("cross_craft_round") == "signup" then
			uv4 = "cantSignUp"
			slot0 = slot4.hadSignUp
		elseif slot2 == "signup" then
			uv4 = "cantSignUp"
			slot0 = slot4.canSignUp
		end

		return slot0
	end,
	getEndlessLeftTimes = function (slot0)
		slot4 = math.max(gVipCsv[gGameModel.role:read("vip_level")].endlessTowerResetTimes - gGameModel.daily_record:read("endless_tower_reset_times"), 0)

		if slot0 then
			return slot4
		end

		return string.format("%s %s/%s", gLanguageCsv.reset, slot4, slot3), slot4, slot3
	end,
	getFishingText = function (slot0)
		if slot0 then
			return gCommonConfigCsv.fishingDailyTimes - gGameModel.daily_record:read("fishing_counter")
		end

		slot7 = gGameModel.fishing:read("select_rod")
		slot8 = csv.fishing.scene[gGameModel.fishing:read("select_scene") == 0 and 1 or slot3].name
		slot9 = nil

		for slot13, slot14 in csvPairs(csv.fishing.bait) do
			if itertools.map(csv.fishing.bait[slot13].scene, function (slot0, slot1)
				return slot1, true
			end)[slot4] and gGameModel.fishing:read("select_bait") == slot13 then
				slot9 = gGameModel.role:read("items")[slot14.itemId]

				break
			end
		end

		slot11 = math.min(slot2, slot9 or 0)
		slot12 = slot11

		if slot11 == 0 then
			slot12 = "#C0xFB6023#" .. slot11
		end

		slot13 = slot2

		if slot2 == 0 then
			slot13 = "#C0xFB6023#" .. slot2
		end

		slot14 = string.format(gLanguageCsv.dailyAssistantFishingText, slot8, slot12, slot13)

		if slot7 == 0 then
			slot14 = string.format(gLanguageCsv.dailyAssistantFishingText1, slot8)
		end

		return slot14, slot2, slot11
	end,
	getRandomTowerJumpOpen = function ()
		if not dataEasy.isUnlock(gUnlockCsv.randomTowerJump) or not gDailyAssistantCsv.randomTowerJump then
			return false
		end

		uv0 = "dataEasy"

		if slot0.getCanJumpMaxRoom() <= 1 then
			return false, 0
		end

		slot1 = csv.random_tower.tower[slot0]

		return true, slot1.floor, slot1.roomIdx
	end,
	getRandomTowerJumpState = function (slot0)
		uv1 = "getRandomTowerJumpOpen"

		if not slot1.getRandomTowerJumpOpen() then
			uv2 = "notOpen"

			return slot2.notOpen
		end

		slot4 = csv.random_tower.tower[gGameModel.random_tower:read("room")].roomIdx
		slot5 = gGameModel.random_tower:read("jump_step")

		if gGameModel.random_tower:read("room_info").pass then
			uv6 = "notOpen"

			return slot6.complete
		end

		if slot4 == 0 then
			if slot2 == 1 and slot5 == game.RANDOM_TOWER_JUMP_STATE.BEGIN then
				uv6 = "notOpen"

				return slot6.canJump
			elseif game.RANDOM_TOWER_JUMP_STATE.BEGIN < slot5 and slot5 < game.RANDOM_TOWER_JUMP_STATE.OVER then
				uv6 = "notOpen"

				return slot6.jumping
			end
		end

		if slot5 == game.RANDOM_TOWER_JUMP_STATE.OVER then
			uv6 = "notOpen"

			return slot6.notComplete
		end

		uv6 = "notOpen"

		return slot6.operating
	end,
	getRandomTowerJumpText = function (slot0)
		uv1 = "getRandomTowerJumpState"
		uv2 = "getRandomTowerJumpState"
		slot2, slot3, slot4 = slot2.getRandomTowerJumpOpen()
		uv5 = "getRandomTowerJumpOpen"

		if slot1.getRandomTowerJumpState() == slot5.canJump then
			return string.format(gLanguageCsv.dailyAssistantRDcanJump, slot3, slot4)
		else
			uv5 = "getRandomTowerJumpOpen"

			if slot1 == slot5.operating then
				return string.format(gLanguageCsv.dailyAssistantRDOperating, slot3, slot4)
			else
				uv5 = "getRandomTowerJumpOpen"

				if slot1 == slot5.jumping then
					return string.format(gLanguageCsv.dailyAssistantRDJumping, slot3, slot4)
				else
					uv5 = "getRandomTowerJumpOpen"

					if slot1 == slot5.notComplete then
						return string.format(gLanguageCsv.dailyAssistantRDjumpOver, slot3, slot4)
					else
						uv5 = "getRandomTowerJumpOpen"

						if slot1 == slot5.complete then
							return string.format(gLanguageCsv.dailyAssistantRDComplete, slot3, slot4)
						else
							return gLanguageCsv.dailyAssistantRNotOpen
						end
					end
				end
			end
		end
	end,
	getUnionContribText = function (slot0)
		slot4 = csv.union.union_level[gGameModel.role:read("union_level")].ContribMax - gGameModel.daily_record:read("union_contrib_times")

		if slot0 then
			return slot4
		end

		slot6 = gLanguageCsv[csv.union.contrib[gGameModel.role:read("daily_assistant").union_contrib or 1].title]

		if slot4 == 0 then
			slot7 = "#C0xFB6023#" .. slot4
		end

		return string.format(gLanguageCsv.dailyAssistantUnionContribText, slot7, slot6), slot4
	end,
	getUnionFragDonateText = function (slot0)
		slot2 = math.max(1 - gGameModel.daily_record:read("union_frag_donate_start_times"), 0)

		if slot0 then
			return slot2
		end

		if slot2 == 0 then
			slot3 = "#C0xFB6023#" .. slot2
		end

		slot4 = string.format(gLanguageCsv.dailyAssistantUnionFragDonateText1, slot3)
		slot5 = gGameModel.role
		slot6 = slot5
		uv6 = "gGameModel"

		if slot6.getCardFragmentsName(slot5.read(slot6, "daily_assistant").union_frag_donate_card_id) then
			slot4 = string.format(gLanguageCsv.dailyAssistantUnionFragDonateText, slot3, slot6)
		end

		return slot4, slot2
	end,
	getUnionFubenTimes = function (slot0)
		slot2 = math.max(3 - gGameModel.daily_record:read("union_fb_times"), 0)

		if slot0 then
			return slot2
		end

		return string.format("%s/3", slot2), slot2
	end,
	isUnlock = function (slot0)
		if dataEasy.isShow(slot0) and dataEasy.isUnlock(slot0) then
			return true
		end

		return false
	end,
	getEndlessTowerRedHintState = function ()
		uv0 = "isUnlock"

		if not slot0.isUnlock("endlessTower") then
			return false
		end

		slot1 = gGameModel.role:read("endless_tower_current")
		slot2 = gGameModel.role
		slot3 = slot2
		slot2 = slot2.read(slot3, "endless_tower_max_gate")
		uv3 = "isUnlock"

		if gGameModel.role:read("daily_assistant").endless_buy_reset == 0 and slot1 < slot2 or slot0 == 1 and (slot3.getEndlessLeftTimes(true) > 0 or slot1 < slot2) then
			return true
		end

		return false
	end,
	getFishingRedHintState = function ()
		uv0 = "isUnlock"

		if slot0.isUnlock("fishing") then
			uv0 = "isUnlock"

			if not slot0.isUnlock("catch") then
				return false
			end
		end

		slot0 = gGameModel.role
		slot1 = slot0
		uv1 = "isUnlock"

		if slot0.read(slot1, "daily_assistant").fishing_skip == 1 and slot1.getFishingText(true) > 0 then
			return true
		end

		return false
	end
}
