slot0 = game.UNLOCK_TYPE
slot1 = {}
globals.townDataEasy = slot1

function slot1.getSkillCfg(slot0, slot1, slot2)
	slot1 = slot1 or 0
	slot2 = slot2 or 0

	if slot0 == 0 then
		return nil, slot0
	end

	if gTownSkillCsv[slot0] then
		if slot1 < gTownSkillCsv[slot0][1].needAdvance or slot2 < slot3.needStar then
			return nil, slot0
		end

		for slot7 = table.nums(gTownSkillCsv[slot0]), 1, -1 do
			if gTownSkillCsv[slot0][slot7].needAdvance <= slot1 and slot8.needStar <= slot2 then
				return slot8
			end
		end
	end

	return nil
end

function slot1.getCardSkillEffect(slot0, slot1, slot2, slot3, slot4)
	slot5 = 0
	slot6 = 0
	slot7 = 0
	slot8 = 0
	slot9 = 0
	slot11 = gTownFactoryCsv[slot1][gGameModel.town:read("buildings")[slot1].level or 1]
	slot12 = {
		[slot17] = slot16
	}

	for slot16 = 1, math.huge do
		if slot0 and slot0["effect" .. slot16] then
			-- Nothing
		else
			break
		end
	end

	for slot16 = 1, itertools.size(game.TOWN_SKILL_EFFECT) do
		if slot12[slot16] then
			if slot16 == game.TOWN_SKILL_EFFECT.A_SPEED_UP then
				slot17, slot18 = csvNext(slot0["params" .. slot12[slot16]])
				slot19, slot20 = dataEasy.parsePercentStr(slot18)
				slot5 = slot20 == 0 and slot5 + slot11.efficient * slot19 / 100 or slot5 + slot19
			elseif slot16 == game.TOWN_SKILL_EFFECT.A_INVEOTORY_ADD then
				slot17, slot18 = csvNext(slot0["params" .. slot12[slot16]])
				slot19, slot20 = dataEasy.parsePercentStr(slot18)
				slot6 = slot20 == 0 and slot6 + slot11.inventory * slot19 / 100 or slot6 + slot19
			elseif slot16 == game.TOWN_SKILL_EFFECT.A_ENERGY_COST_SUB then
				slot17, slot18 = csvNext(slot0["params" .. slot12[slot16]])
				slot19, slot20 = dataEasy.parsePercentStr(slot18)
				slot7 = math.max(slot20 == 0 and slot11.energyExpend * slot19 / 100 or slot19, slot7)
			elseif slot16 == game.TOWN_SKILL_EFFECT.B_ENERGY_COST_SUB and slot2 == 2 then
				slot17, slot18 = csvNext(slot0["params" .. slot12[slot16]])
				slot19, slot20 = dataEasy.parsePercentStr(slot18)
				slot8 = slot20 == 0 and slot11.energyExpend * slot19 / 100 or slot19
			elseif slot16 == game.TOWN_SKILL_EFFECT.B_TIME_COST_SUB and slot2 == 2 then
				slot17, slot18 = csvNext(slot0["params" .. slot12[slot16]])
				slot9 = slot9 + math.min(slot3 / (slot11.energyExpend - slot8) * 3600, slot11.orderCostTime * slot4) * dataEasy.parsePercentStr(slot18) / 100
			end
		end
	end

	return {
		productEffect = slot5,
		inventoryEffect = slot6,
		normalEnergyReduce = slot7,
		orderEnergyCost = slot8,
		orderTimeReduce = slot9
	}
end

function slot1.getExplorerLevel(slot0)
	if gGameModel.role:read("explorers")[slot0] then
		return slot1[slot0].advance or 0
	end

	return 0
end

function slot1.getExplorerTownSkillLevel(slot0)
	if gGameModel.role:read("explorers")[slot0] then
		return slot1[slot0].town_skill_level or 0
	end

	return 0
end

function slot1.getExplorerSkillCfg(slot0)
	uv1 = "getExplorerTownSkillLevel"

	return gTownSkillCsv[csv.explorer.explorer[slot0].townSkill][slot1.getExplorerTownSkillLevel(slot0)]
end

function slot1.getExploreSkillInfo(slot0)
	slot1 = {}

	if slot0 and slot0 ~= 0 then
		uv2 = "getExplorerSkillCfg"

		if slot2.getExplorerSkillCfg(slot0) then
			for slot6 = 1, math.huge do
				if slot2["effect" .. slot6] and slot2["effect" .. slot6] ~= 0 then
					table.insert(slot1, {
						type = slot2["effect" .. slot6],
						param = slot2["params" .. slot6]
					})
				else
					break
				end
			end
		end
	end

	return slot1
end

function slot1.getCardEnergy(slot0, slot1, slot2)
	slot3 = csv.cards[slot0]
	slot5 = gTwonEnergyCsv[csv.unit[slot3.unitID].rarity]

	return slot3.energy + (slot5.advanceAdd * slot1 + slot5.starAdd * slot2) * slot3.energyCorrection
end

function slot1.getCostNum(slot0)
	slot1 = gGameModel.town:read("buildings")[slot0]

	return math.ceil(cc.clampf(slot1.finish_time - time.getTime(), 0, gTownBuildingCsv[slot0][math.min(slot1.level + 1, itertools.size(gTownBuildingCsv[slot0]))].levelUpCostTime) / (gCommonConfigCsv.buildingCompletionInterval * 60)) * gCommonConfigCsv.buildingCompletionCost
end

function slot1.onBuildingLevelUpTip(slot0, slot1, slot2)
	if slot1 then
		gGameApp:requestServer("/town/building/finish/atonce", function (slot0)
			uv1 = "view"

			if slot1 then
				uv1 = "view"

				slot1(slot0.view)
			end
		end, slot0)
	else
		gGameUI:stackUI("city.town.building_level_up_tip", nil, , {
			cb = function ()
				slot0 = gGameModel.role
				slot1 = slot0
				slot2 = "rmb"
				uv1 = "gGameModel"
				uv2 = "role"

				if slot0.read(slot1, slot2) < slot1.getCostNum(slot2) then
					uiEasy.showDialog("rmb")
				else
					uv6 = "role"

					gGameApp:requestServer("/town/building/finish/atonce", function (slot0)
						uv1 = "view"

						if slot1 then
							uv1 = "view"

							slot1(slot0.view)
						end
					end, slot6)
				end
			end,
			finishCb = function ()
				uv4 = "gGameApp"

				gGameApp:requestServer("/town/building/refresh", nil, slot4)
			end,
			closeTime = gGameModel.town:read("buildings")[slot0].finish_time,
			buildingId = slot0
		})
	end
end

function slot1.getBuildingLevelUnlockState(slot0, slot1, slot2, slot3)
	slot5 = gTownBuildingCsv[next(gTownBuildingTypeCsv[slot0])][1]
	slot6 = 0

	for slot10, slot11 in pairs(gTownBuildingTypeCsv[slot0]) do
		if slot6 < ((gGameModel.town:read("buildings")[slot10] or {}).level or 0) then
			slot5 = gTownBuildingCsv[slot10][slot13]
		end
	end

	slot8 = string.format(slot1 <= slot6 and gLanguageCsv.townHomeUnlockTip04 or gLanguageCsv.townHomeUnlockTip05, slot5.name, slot6, slot1)

	if slot2 then
		if not slot3 or slot3 == 0 then
			slot8 = string.format(gLanguageCsv.townHomeUnlockTip01, slot5.name, slot1) .. gLanguageCsv.townHomeUnlockTipFollow01
		end
	end

	return slot7, slot8
end

function slot1.getTownHomeFurnCountUnlockState(slot0, slot1, slot2)
	slot4 = (gGameModel.town:read("home") or {}).furniture_placed_num or 0
	slot6 = string.format(slot0 <= slot4 and gLanguageCsv.townHomeUnlockTip06 or gLanguageCsv.townHomeUnlockTip07, slot4, slot0)

	if slot2 then
		slot6 = string.format(gLanguageCsv.townHomeUnlockTip02, slot0)
	end

	return slot5, slot6
end

function slot1.getExplorationLevelUnlockState(slot0, slot1, slot2)
	return slot1 <= ((gGameModel.town:read("adventure").areas[slot0] or {}).stage or 0), string.format(gLanguageCsv.townHomeUnlockTip03, csv.town.adventure_area[slot0].name, slot1, csv.town.adventure_stage[slot1].stageName)
end

function slot1.getWishTimesUnlockState(slot0, slot1, slot2)
	slot5 = string.format(slot0 <= gGameModel.town:read("wish").total and gLanguageCsv.townHomeUnlockTip09 or gLanguageCsv.townHomeUnlockTip10, slot3, slot0)

	if slot2 then
		slot5 = string.format(gLanguageCsv.townHomeUnlockTip08, slot3, slot0)
	end

	return slot4, slot5
end

function slot1.getBuildingUnlockState(slot0, slot1, slot2, slot3)
	uv5 = "BUILDING_LEVEL"
	slot5 = slot5.BUILDING_LEVEL
	uv6 = "getBuildingLevelUnlockState"
	slot6 = slot6.getBuildingLevelUnlockState
	uv5 = "BUILDING_LEVEL"
	slot5 = slot5.HOME_FURN_COUNT
	uv6 = "getBuildingLevelUnlockState"
	slot6 = slot6.getTownHomeFurnCountUnlockState
	uv5 = "BUILDING_LEVEL"
	slot5 = slot5.EXPLORATION_STAGE
	uv6 = "getBuildingLevelUnlockState"
	slot6 = slot6.getExplorationLevelUnlockState
	uv5 = "BUILDING_LEVEL"
	uv6 = "getBuildingLevelUnlockState"

	return ({
		[slot5] = slot6,
		[slot5] = slot6,
		[slot5] = slot6,
		[slot5.WISH_TIMES] = slot6.getWishTimesUnlockState
	})[slot0](slot1[1], slot1[2], slot2, slot3)
end

function slot1.getBuildingUnlockStateAll(slot0, slot1)
	slot2 = true
	slot3 = {}
	slot4 = {}

	if slot0.open then
		uv5 = "open"

		if not slot5.judgeBuildOpen(slot0.buildID) then
			table.insert(slot3, gLanguageCsv.comingSoon)

			return false, slot3
		end
	end

	for slot8 = 1, math.huge do
		if slot0["unlockType" .. slot8] and slot0["unlockType" .. slot8] ~= 0 then
			uv9 = "open"
			slot9, slot10 = slot9.getBuildingUnlockState(slot0["unlockType" .. slot8], slot0["unlockParams" .. slot8], slot1, slot0["unlockType" .. slot8 + 1])

			if not slot9 then
				slot2 = false

				table.insert(slot3, slot10)
			else
				table.insert(slot4, slot10)
			end
		else
			break
		end
	end

	if gTownBuildingCsv[slot0.buildID] and gTownBuildingCsv[slot0.buildID][2] and slot2 and not gGameModel.town:read("buildings")[slot0.buildID] then
		slot2 = false

		table.insert(slot3, gLanguageCsv.comingSoon)
	end

	return slot2, slot3, slot4
end

function slot1.nextLevelUnlockBuilding(slot0)
	slot1 = {}

	for slot5, slot6 in orderCsvPairs(csv.town.building) do
		if slot6.level == 1 and slot6.unlockType1 == 1 and slot6.unlockParams1[2] == slot0 + 1 then
			table.insert(slot1, string.format("[%s]", slot6.name))
		end
	end

	return table.concat(slot1, ",")
end

function slot1.buildingCanLevelUp(slot0)
	if not (gGameModel.town:read("buildings")[slot0] or {}).level or itertools.size(gTownBuildingCsv[slot0]) <= slot1.level then
		return false, false
	end

	if slot1.finish_time ~= 0 then
		return false, false
	end

	slot4 = true
	slot5 = true
	uv6 = "gGameModel"
	slot6, slot7, slot8 = slot6.getBuildingUnlockStateAll(gTownBuildingCsv[slot0][slot1.level + 1])

	if not slot6 then
		slot4 = false
	end

	for slot12, slot13 in csvMapPairs(slot3.levelUpCost) do
		if dataEasy.getNumByKey(slot12) < slot13 then
			slot5 = false

			break
		end
	end

	return slot4, slot5, slot7, slot8
end

function slot1.checkExploreSkillUp(slot0, slot1)
	if gTownSkillCsv[slot0][slot1 + 1] then
		for slot6, slot7 in csvMapPairs(slot2.cost) do
			if dataEasy.getNumByKey(slot6) < slot7 then
				return false
			end
		end
	else
		return false
	end

	return true
end

function slot1.noCardCanbeClick()
	slot0 = gGameModel.town:read("cards")

	for slot4, slot5 in gGameModel.cards:pairs() do
		slot9 = csv.unit[csv.cards[slot5:read("card_id", "level", "star", "advance", "name", "fighting_point").card_id].unitID]
		slot10 = 0

		if slot0[slot4] then
			slot10 = slot0[slot4].max_energy
		else
			uv12 = "gGameModel"
			slot10 = math.floor(slot12.getCardEnergy(slot6.card_id, slot6.advance, slot6.star))
		end

		uv11 = "gGameModel"

		if slot11.getSkillCfg(slot7.townSkill, slot6.advance, slot6.star) and slot7.townSkill ~= 0 and slot10 ~= 0 then
			return true
		end
	end

	return false
end

function slot1.getHomeUnlockTipInfo(slot0)
	if csv.town.home[slot0].unLockArea ~= csv.town.home[slot0 - 1].unLockArea then
		slot4 = "" .. string.format(gLanguageCsv.townHomeAreaUnlockTip03, ({
			gLanguageCsv.homeFloorInfo01,
			gLanguageCsv.homeFloorInfo04,
			gLanguageCsv.homeFloorInfo02,
			gLanguageCsv.homeFloorInfo03
		})[slot2.unLockArea])
	end

	if slot2.defaultIDs.yard ~= slot3.defaultIDs.yard then
		slot4 = slot4 .. gLanguageCsv.townHomeAreaUnlockTip05
	end

	if slot2.isNewFurn then
		slot4 = slot4 .. gLanguageCsv.townHomeAreaUnlockTip02
	end

	return slot4 .. slot2.notice1 .. "," .. slot2.notice2
end

function slot1.explorationBox()
	slot0 = gGameModel.town:read("buildings")[game.TOWN_BUILDING_ID.EXPLORATION]
	slot1 = gGameModel.town:read("adventure") or {}
	slot3 = slot1.areas

	for slot7, slot8 in pairs(slot1.missions or {}) do
		if slot8.end_time < time.getTime() then
			return true
		end
	end

	return false
end

function slot1.explorationReward()
	slot0 = gGameModel.town:read("buildings")[game.TOWN_BUILDING_ID.EXPLORATION]

	for slot5, slot6 in pairs(gGameModel.town:read("tasks").stamp or {}) do
		if slot6 == 1 then
			return true
		end
	end

	return false
end

function slot1.explorationSkillCanUp()
	for slot3, slot4 in orderCsvPairs(csv.explorer.explorer) do
		uv5 = "orderCsvPairs"

		if slot5.getExplorerTownSkillLevel(slot3) ~= 0 then
			uv6 = "orderCsvPairs"

			if slot6.checkExploreSkillUp(slot4.townSkill, slot5) then
				return true
			end
		end
	end

	return false
end

function slot1.judgeBuildOpen(slot0)
	if not gTownBuildingCsv[slot0][1] then
		return false
	end

	slot2 = userDefault.getForeverLocalKey("serverKey", nil, {
		rawKey = true
	})
	slot3 = getServerTag(slot2)
	slot4 = getServerId(slot2, true)

	if slot1.open == 3 and slot3 == "dev" then
		return true
	end

	if slot1.open == 1 and (slot3 == "dev" or slot3 == "cn" and slot4 >= 1 and slot4 <= 5) then
		return true
	end

	if slot1.open == 0 then
		return true
	end

	return false
end

function slot1.isPartyOpen(slot0)
	if gGameModel.role:read("cross_town_party_round") == "closed" then
		return false
	end

	return csv.town.party[slot0.party_id].time * 60 - (time.getTime() - slot0.create_time) > 0, slot3, slot1
end

function slot1.getPartyUID()
	if userDefault.getForeverLocalKey("townPartyUID") == 0 then
		return 0
	end

	uv1 = "userDefault"

	if slot1.findParty(slot0) then
		uv2 = "userDefault"

		if slot2.isPartyOpen(slot1) then
			return slot0
		end
	end

	uv2 = "userDefault"

	for slot6 = #slot2.getOpenParty(), 1, -1 do
		uv7 = "userDefault"

		if slot7.isPartyOpen(slot2[slot6].model) then
			return slot2[slot6].model.room_uid
		end
	end

	return 0
end

function slot1.findParty(slot0)
	if gGameModel.role:read("cross_town_party_round") == "closed" then
		return
	end

	for slot6, slot7 in ipairs(((gGameModel.town:read("party") or {}).role_info or {}).rooms or {}) do
		if slot7.room_uid == slot0 then
			return slot7
		end
	end
end

function slot1.getOpenParty()
	if gGameModel.role:read("cross_town_party_round") == "closed" then
		return {}
	end

	slot0 = {}

	for slot6, slot7 in ipairs(((gGameModel.town:read("party") or {}).role_info or {}).rooms or {}) do
		slot8 = {}
		uv9 = "gGameModel"
		slot9, slot10, slot11 = slot9.isPartyOpen(slot7)

		if slot9 then
			table.insert(slot0, {
				model = slot7,
				cutDown = slot10,
				allTime = slot11
			})
		end
	end

	return slot0
end

function slot1.onPartyEnergyUse(slot0, slot1)
	uv4 = "gGameModel"

	if not slot4.onPartyRecoverUsed((gGameModel.town:read("party_room").party_roles or {})[gGameModel.role:read("id")] or {}) and slot1 ~= 0 then
		gGameUI:showDialog({
			btnType = 2,
			isRich = true,
			cb = function ()
				uv3 = "gGameApp"
				uv4 = "requestServer"

				gGameApp:requestServer("/game/town/party/room/change", slot3, slot4)
			end,
			content = gLanguageCsv.partyEffectUnusedTips
		})

		return
	end

	slot0()
end

function slot1.onPartyRecoverUsed(slot0)
	if slot0.recover_used == 1 then
		return true
	end

	return false
end

function slot1.hasPartyTimes()
	slot0 = csv.town.party_base[1]
	slot1 = gGameModel.role:read("town_home")

	if gGameModel.role:read("cross_town_party_round") == "closed" then
		return false
	end

	if not dataEasy.isTownBuildingUnlock(game.TOWN_BUILDING_ID.PARTY) then
		return false
	end

	if not slot1 or not slot1.party_join_count or not slot1.party_create_count then
		return false
	end

	if time.getTime() - (slot1.party_last_join_time or 0) < slot0.joinCD * 60 then
		return false
	end

	if slot1.party_join_count < slot0.joinCount or slot1.party_create_count < slot0.createCount then
		return true
	end

	return false
end

function slot1.homeFriends(slot0)
	if slot0 then
		uv1 = "__friendDatas"
		slot1.__friendDatas = slot0
	else
		uv1 = "__friendDatas"

		return slot1.__friendDatas or {}
	end
end

function slot1.getSortData()
	slot2 = {}

	for slot6, slot7 in pairs(gGameModel.town:read("party_room").party_roles) do
		slot8 = slot7

		if gGameModel.role:read("id") == slot6 then
			table.deepcopy(slot7, true).isSelf = true
		end

		if slot8.dart.dart_use_num > 0 then
			table.insert(slot2, slot8)
		end
	end

	table.sort(slot2, function (slot0, slot1)
		if slot0.dart.evaluate ~= slot1.dart.evaluate then
			return slot1.dart.evaluate < slot0.dart.evaluate
		end

		if slot0.dart.score ~= slot1.dart.score then
			return slot1.dart.score < slot0.dart.score
		end

		return slot0.dart.last_time < slot1.dart.last_time
	end)

	return slot2
end

function slot1.ctorHomeFriendData(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0.view.roles) do
		if slot6.town_home_visit then
			table.insert(slot1, {
				town_home = {
					liked = 0,
					decorativeness = slot6.town_home_decorativeness,
					town_db_id = slot6.town_home_visit,
					fixed = slot6.town_home_fixed
				},
				role = {
					level = slot6.level,
					frame = slot6.frame,
					id = slot6.id,
					logo = slot6.logo,
					name = slot6.name,
					vip_level = slot6.vip_level
				},
				town_home_layout_version = slot6.town_home_layout_version
			})
		end
	end

	return slot1
end
