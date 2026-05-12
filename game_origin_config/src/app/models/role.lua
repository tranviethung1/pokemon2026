slot0 = game.YYHUODONG_TYPE_ENUM_TABLE

class("Role", require("app.models.base")).init = function (slot0, slot1)
	uv2 = "init"

	slot2.init(slot0, slot1)

	slot0.yyhuodong_tasks = {}

	slot0.__idlers:add("yy_endtime", idlereasy.new({}, "yy_endtime"))
	slot0:refreshYYEndTime()
	slot0.__idlers:add("active_logos", idlereasy.new({}, "active_logos"))
	slot0:refreshActiveLogos()
	slot0:filterYYHuodongs()
	slot0.__idlers:add("buy_recharge", idlereasy.new({}, "buy_recharge"))

	return slot0
end

slot3 = game.TARGET_TYPE
slot5 = {}

for slot9, slot10 in pairs({
	[slot3.Level] = {
		"role",
		"level"
	},
	[slot3.Gate] = {
		"role",
		"gate_star",
		function (slot0, slot1, slot2, slot3)
			slot4 = 0

			if slot0[slot1] and slot0[slot1].star > 0 then
				slot4 = 1
			end

			return {
				slot4,
				1
			}
		end
	},
	[slot3.CardsTotal] = {
		"role",
		"cards",
		function (slot0, slot1, slot2, slot3)
			slot3.CardsTotal = slot3.CardsTotal or itertools.size(slot0)

			return {
				slot3.CardsTotal,
				slot1
			}
		end
	},
	[slot3.Vip] = {
		"role",
		"vip_level"
	},
	[slot3.FightingPoint] = {
		"role",
		"battle_fighting_point"
	},
	[slot3.CardAdvanceTotalTimes] = {
		"role",
		"card_advance_times"
	},
	[slot3.GateStar] = {
		"role",
		"total_level_stars"
	},
	[slot3.CardAdvanceCount] = {
		"cards",
		[3] = function (slot0, slot1, slot2, slot3)
			slot4, slot5 = csvNext(slot2)

			return {
				slot0:getStat().advance_sum:sumRange(slot5),
				slot4
			}
		end
	},
	[slot3.CardStarCount] = {
		"cards",
		[3] = function (slot0, slot1, slot2, slot3)
			slot4, slot5 = csvNext(slot2)

			return {
				slot0:getStat().star_sum:sumRange(slot5),
				slot4
			}
		end
	},
	[slot3.EquipAdvanceCount] = {
		"cards",
		[3] = function (slot0, slot1, slot2, slot3)
			slot4, slot5 = csvNext(slot2)

			return {
				slot0:getStat().equip_advance_sum:sumRange(slot5),
				slot4
			}
		end
	},
	[slot3.EquipStarCount] = {
		"cards",
		[3] = function (slot0, slot1, slot2, slot3)
			slot4, slot5 = csvNext(slot2)

			return {
				slot0:getStat().equip_star_sum:sumRange(slot5),
				slot4
			}
		end
	},
	[slot3.HadCard] = {
		"cards",
		[3] = function (slot0, slot1, slot2, slot3)
			return {
				slot0:getStat().card_id[slot1] and 1 or 0,
				1
			}
		end
	},
	[slot3.GainCardTimes] = {},
	[slot3.CompleteImmediate] = {
		[3] = function (...)
			return {
				1,
				1
			}
		end
	},
	[slot3.OnlineDuration] = {},
	[slot3.LoginDays] = {},
	[slot3.LianjinTimes] = {},
	[slot3.GainGold] = {},
	[slot3.CostGold] = {},
	[slot3.CostRmb] = {},
	[slot3.RechargeRmb] = {},
	[slot3.ShareTimes] = {},
	[slot3.SigninTimes] = {},
	[slot3.BuyStaminaTimes] = {},
	[slot3.GiveStaminaTimes] = {},
	[slot3.CostStamina] = {},
	[slot3.GateChanllenge] = {},
	[slot3.HeroGateChanllenge] = {},
	[slot3.NightmareGateChanllenge] = {},
	[slot3.HuodongChanllenge] = {},
	[slot3.GateSum] = {},
	[slot3.CardSkillUp] = {},
	[slot3.CardAdvance] = {},
	[slot3.CardLevelUp] = {},
	[slot3.CardStar] = {},
	[slot3.EquipStrength] = {},
	[slot3.EquipAdvance] = {},
	[slot3.EquipStar] = {},
	[slot3.ArenaBattle] = {},
	[slot3.ArenaBattleWin] = {},
	[slot3.ArenaPoint] = {},
	[slot3.ArenaRank] = {
		"role",
		"pw_rank"
	},
	[slot3.DrawCard] = {},
	[slot3.DrawCardRMB10] = {},
	[slot3.DrawCardRMB1] = {},
	[slot3.DrawCardGold10] = {},
	[slot3.DrawCardGold1] = {},
	[slot3.DrawCardRMB] = {},
	[slot3.DrawCardGold] = {},
	[slot3.DrawEquip] = {},
	[slot3.DrawEquipRMB10] = {},
	[slot3.DrawEquipRMB1] = {},
	[slot3.UnionContrib] = {},
	[slot3.UnionSpeedup] = {},
	[slot3.UnionSendPacket] = {},
	[slot3.UnionRobPacket] = {},
	[slot3.UnionFuben] = {},
	[slot3.RandomTowerTimes] = {},
	[slot3.RandomTowerBoxOpen] = {},
	[slot3.RandomTowerPointDaily] = {
		"random_tower",
		"day_point"
	},
	[slot3.RandomTowerPoint] = {},
	[slot3.RandomTowerFloorTimes] = {},
	[slot3.WorldBossBattleTimes] = {},
	[slot3.CloneBattleTimes] = {},
	[slot3.RandomTowerFloorMax] = {},
	[slot3.DailyTaskFinish] = {},
	[slot3.DailyTaskAchieve] = {},
	[slot3.ItemBuy] = {},
	[slot3.YYHuodongOpen] = {},
	[slot3.UnlockPokedex] = {
		"role",
		"pokedex",
		function (slot0, slot1, slot2, slot3)
			slot3.UnlockPokedex = slot3.UnlockPokedex or itertools.size(slot0)

			return {
				slot3.UnlockPokedex,
				slot1
			}
		end
	},
	[slot3.EndlessPassed] = {
		"role",
		"endless_tower_max_gate",
		function (slot0, slot1, slot2, slot3)
			return {
				slot1 <= slot0 and 1 or 0,
				1
			}
		end
	},
	[slot3.Friends] = {
		"society",
		"friends",
		function (slot0, slot1, slot2, slot3)
			slot3.Friends = slot3.Friends or itertools.size(slot0)

			return {
				slot3.Friends,
				slot1
			}
		end
	},
	[slot3.TrainerLevel] = {
		"role",
		"trainer_level"
	},
	[slot3.CaptureLevel] = {
		"capture",
		"level"
	},
	[slot3.CaptureSuccessSum] = {
		"capture",
		"success_sum"
	},
	[slot3.Explorer] = {
		"role",
		"explorers",
		function (slot0, slot1, slot2, slot3)
			slot3.Explorer = slot3.Explorer or itertools.count(slot0, function (slot0, slot1)
				return slot1.advance > 0
			end)

			return {
				slot3.Explorer,
				slot1
			}
		end
	},
	[slot3.ExplorerComponentStrength] = {},
	[slot3.ExplorerAdvance] = {},
	[slot3.DispatchTaskDone] = {},
	[slot3.DispatchTaskQualityDone] = {
		[3] = function (slot0, slot1, slot2, slot3)
			slot4, slot5 = csvNext(slot2)

			return {
				slot0,
				slot4
			}
		end
	},
	[slot3.HeldItemStrength] = {},
	[slot3.HeldItemAdvance] = {},
	[slot3.EffortTrainTimes] = {},
	[slot3.EffortGeneralTrainTimes] = {},
	[slot3.EffortSeniorTrainTimes] = {},
	[slot3.CardAbilityStrength] = {},
	[slot3.DrawItem] = {},
	[slot3.DrawCardUp] = {},
	[slot3.DrawCardUpAndRMB] = {},
	[slot3.UnionFragDonate] = {},
	[slot3.DrawGemRMB] = {},
	[slot3.DrawGemGold] = {},
	[slot3.DrawGem] = {},
	[slot3.DrawGemUp] = {},
	[slot3.DrawGemUpAndRMB] = {},
	[slot3.FishingTimes] = {},
	[slot3.FishingWinTimes] = {},
	[slot3.RandomTowerFloorSum] = {},
	[slot3.DrawChipRMB] = {},
	[slot3.DrawChipItem] = {},
	[slot3.DrawChip] = {},
	[slot3.DrawTotem] = {},
	[slot3.AutoChess] = {},
	[slot3.DailyLivenessPoint] = {},
	[slot3.DailyAllOnlineGift] = {}
}) do
	slot11, slot12, slot13 = unpack(slot10, 1, 3)

	if slot11 ~= nil then
		if slot12 then
			if slot5[slot11] == nil then
				slot5[slot11] = {}
			end

			slot5[slot11][slot12] = true
		else
			slot5[slot11] = true
		end
	end
end

slot6 = {
	[slot0.generalTask] = true,
	[slot0.serverOpen] = true,
	[slot0.livenessWheel] = true,
	[slot0.flipCard] = true,
	[slot0.flipNewYear] = true
}
slot7 = {
	[slot0.generalTask] = function ()
		return csv.yunying.generaltask
	end,
	[slot0.serverOpen] = function ()
		return csv.yunying.serveropen
	end,
	[slot0.livenessWheel] = function ()
		return csv.yunying.generaltask
	end,
	[slot0.flipCard] = function ()
		return csv.yunying.flop_task
	end,
	[slot0.flipNewYear] = function ()
		return csv.yunying.jifu_task
	end
}

function slot8(slot0)
	if slot0.yyhuodongs then
		for slot4, slot5 in pairs(slot0.yyhuodongs) do
			if csv.yunying.yyhuodong[slot4] then
				uv7 = "yyhuodongs"

				if slot7[slot6.type] then
					return true
				end
			end
		end
	end

	return false
end

function slot9(slot0)
	uv2 = "pairs"

	for slot4, slot5 in pairs(slot2) do
		if slot0[slot4] ~= nil and slot0[slot4]._db ~= nil then
			if type(slot5) == "table" then
				for slot9, slot10 in pairs(slot5) do
					if slot0[slot4]._db[slot9] ~= nil then
						return true
					end
				end
			else
				return true
			end
		end
	end

	return false
end

function slot10(slot0, slot1, slot2, slot3, slot4)
	slot4 = slot4 or {}
	uv6 = "unpack"
	slot5, slot6, slot7 = unpack(slot6[slot0], 1, 3)

	if slot5 ~= nil then
		if slot6 then
			if gGameModel[slot5]:getValue_(slot6) == nil then
				return slot7 and slot7(0, slot2, slot3, slot4) or {
					0,
					slot2
				}
			end

			return slot7 and slot7(slot9, slot2, slot3, slot4) or {
				slot9,
				slot2
			}
		else
			return slot7(slot8, slot2, slot3, slot4)
		end
	else
		return slot7 and slot7(slot1, slot2, slot3, slot4) or {
			slot1,
			slot2
		}
	end
end

function slot2.checkTargetChanged(slot0, slot1)
	if slot1 then
		uv2 = "cleanYYHuoDongTasksProgress"

		if slot2(slot1) then
			slot0:cleanYYHuoDongTasksProgress()
		end
	end
end

function slot2.getYYHuoDongTasksProgress(slot0, slot1)
	if slot0.yyhuodong_tasks[slot1] == nil then
		slot0:_syncYYHuoDongTasksProgress(slot1, slot0:read("yyhuodongs")[slot1])
	end

	return slot0.yyhuodong_tasks[slot1]
end

function slot2._syncYYHuoDongTasksProgress(slot0, slot1, slot2)
	if slot2 == nil then
		return
	end

	if csv.yunying.yyhuodong[slot1] then
		uv4 = "csv"

		if not slot4[slot3.type] then
			return
		end
	end

	slot0.yyhuodong_tasks[slot1] = {}
	uv6 = "yunying"

	for slot10, slot11 in csvPairs(slot6[slot3.type]()) do
		if slot11.huodongID == slot3.huodongID then
			uv12 = "yyhuodong"

			if slot12[slot11.taskType] then
				uv13 = "type"
				slot4[slot10] = slot13(slot11.taskType, slot2.valsums and slot2.valsums[slot10] or 0, slot11.taskParam, slot11.taskSpecialParam, slot0._taskProgressCache)
			else
				error("yy genernal task target " .. slot11.taskType .. " not watched!")
			end
		end
	end
end

function slot2.updSync(slot0, slot1, slot2)
	if slot1.titles then
		slot0.title_queue = {}

		for slot6, slot7 in pairs(slot1.titles) do
			slot0.title_queue[slot6] = true
		end
	end

	if slot1.achievement_tasks then
		slot0.achievement_queue = {}

		for slot6, slot7 in pairs(slot1.achievement_tasks) do
			if slot7[1] == 1 then
				slot0.achievement_queue[slot6] = true
			end
		end
	end

	if slot1.medal_task then
		slot0.medal_task = {}

		for slot6, slot7 in pairs(slot1.medal_task) do
			if slot7 == 1 then
				slot0.medal_task[slot6] = true
			end
		end
	end

	uv3 = "titles"

	slot3.updSync(slot0, slot1, slot2)
end

function slot2.cleanYYHuoDongTasksProgress(slot0)
	slot0._taskProgressCache = {}
	slot0.yyhuodong_tasks = {}
end

function slot2.afterSync(slot0, slot1)
	if slot0.__idlers == nil then
		return
	end

	slot0.achievementCache = {}
	slot0.medalCache = {}

	if slot1 and slot1._db then
		if slot1._db.explorers then
			slot0.explorersCache = {}
		end

		if slot1._db.gate_star then
			slot0.gateStarCache = {}
		end

		uv2 = "__idlers"

		if slot2(slot1._db) then
			slot0:cleanYYHuoDongTasksProgress()
		end

		if slot1._db.skins or slot1._db.figures or slot1._db.pokedex or slot1._db.logos then
			slot0:refreshActiveLogos()
		end

		if slot1._db.last_time then
			slot0.sync_last_time = slot0.sync_last_time or 0

			if math.abs(slot0.sync_last_time - slot2) > 3 and math.abs(time.getTime() - slot2) > 3 then
				slot0.sync_last_time = slot2

				gGameApp:slientRequestServer("/game/sync")
			end
		end
	end

	if slot1 and slot1._mem and slot1._mem.yy_open then
		slot3 = {}
		slot4 = slot0:genFilterXXV2()

		for slot8, slot9 in ipairs(slot0:read("yy_open")) do
			slot10 = csv.yunying.yyhuodong[slot9]

			if not sdk.supportSubscribe then
				uv12 = "achievementCache"

				if slot10.type == slot12.clientShow and slot10.clientParam.mouthCardSub then
					slot0._disableYYIDs[slot9] = true
				end
			end

			if not slot4(slot9, slot10) then
				slot0._disableYYIDs[slot9] = true
			end

			if not slot0._disableYYIDs[slot9] then
				table.insert(slot3, slot9)
			end
		end

		if ((slot0:read("reunion").info or {}).yyID or 0) ~= 0 and not itertools.include(slot3, slot7) and slot6.end_time - time.getTime() > 0 then
			table.insert(slot3, slot7)
		end

		slot0:getOrNewRawIdler_("yy_open"):set(slot3)
	end
end

function slot2.afterDelSync(slot0, slot1)
	if slot0.__idlers == nil then
		return
	end

	if slot1 and slot1._db and slot1._db.skins then
		slot0:refreshActiveLogos()
	end
end

function slot2.refreshActiveLogos(slot0)
	slot4 = slot0:read("skins")

	for slot9, slot10 in pairs(gRoleLogoCsv) do
		if slot10.cardID and slot0:read("pokedex")[slot10.cardID] or slot10.itemID and slot0:read("logos")[slot9] or slot10.roleID and slot0:read("figures")[slot10.roleID] then
			-- Nothing
		elseif slot10.skinID and slot4[slot10.skinID] then
			slot5[slot9] = slot4[slot10.skinID]
		end
	end

	slot0:getOrNewRawIdler_("active_logos"):set({
		[slot9] = 0
	})
end

function slot11(slot0, slot1, slot2, slot3)
	for slot8, slot9 in orderCsvPairs(slot2) do
		if slot9.huodongID == csv.yunying.yyhuodong[slot0].huodongID then
			if slot1[slot8] ~= 0 then
				return false
			end

			if slot3 and slot3(slot8, slot9) then
				return false
			end
		end
	end

	return true
end

function slot2.genFilterXXV2(slot0)
	function slot1(slot0, slot1)
		if slot1.xxv == 2 then
			return false
		end

		return true
	end

	if sdk.loginInfo and json.decode(sdk.loginInfo) and slot2.channelId then
		function slot1(slot0, slot1)
			return true
		end
	end

	return slot1
end

function slot2.filterYYHuodongs(slot0)
	slot0._disableYYIDs = {}
	slot2 = slot0:genFilterXXV2()

	for slot6, slot7 in pairs(slot0:read("yyhuodongs")) do
		if csv.yunying.yyhuodong[slot6] then
			uv10 = "read"

			if slot8.type == slot10.levelFund then
				slot9 = slot7.stamps1 or {}
				uv10 = "yyhuodongs"

				if slot10(slot6, slot7.stamps or {}, csv.yunying.levelfund, function (slot0, slot1)
				end) then
					slot0._disableYYIDs[slot6] = true
				end
			end

			uv10 = "read"

			if slot8.type == slot10.generalTask and slot8.clientParam.generalTaskDisappear then
				uv9 = "yyhuodongs"

				if slot9(slot6, slot7.stamps or {}, csv.yunying.generaltask) then
					slot0._disableYYIDs[slot6] = true
				end
			end

			if not slot2(slot6, slot8) then
				slot0._disableYYIDs[slot6] = true
			end
		end
	end
end

function slot2.getYYCoin(slot0, slot1)
	if csv.yunying.yyhuodong[slot1] == nil or slot0.yycoins[slot2.type] == nil or slot0.yycoins[slot2.type][1] ~= slot1 then
		return 0
	end

	return slot0.yycoins[slot2.type][2]
end

function slot2.setYYCoin(slot0, slot1)
	slot0.yycoinYYID = slot1

	slot0:_updYYCoin()
end

function slot2._updYYCoin(slot0)
	if slot0.yycoinYYID then
		slot0.yycoin = slot0:getYYCoin(slot0.yycoinYYID)
	end
end

function slot2.getTitleProgress(slot0, slot1, slot2, slot3)
	uv4 = "game"

	if slot4[slot1] then
		slot4 = 0
		uv5 = "TARGET_TYPE"

		return slot5(slot1, (slot1 ~= game.TARGET_TYPE.CostRmb or slot0:read("rmb_consume")) and (slot1 ~= game.TARGET_TYPE.SigninTimes or slot0:read("sign_in_count")) and (slot0:read("title_counter")[slot1] or 0), slot2, slot3)
	else
		error("title target" .. slot1 .. "not watched!")
	end
end

function slot2.pushBuyRecharge(slot0, slot1)
	gGameApp:slientRequestServer("/game/sync")
	slot0:getOrNewRawIdler_("buy_recharge"):modify(function (slot0)
		uv3 = "table"

		table.insert(slot0, slot3)
	end, true)
end

slot12 = {
	ArenaBattle = 46,
	HuntingPass = 93,
	GiftHuodongPassCount = 34,
	FightingPoint = 9,
	FigureCount = 65,
	FishingLevel = 80,
	CraftBattle = 49,
	UnionFragDonate = 83,
	TrainerLevel = 2,
	WorldChatCount = 71,
	HeroGateStarCount = 30,
	LogoCount = 67,
	CardAdvanceCount = 17,
	EffortSeniorTrainTimes = 20,
	GiftHuodongPassType = 38,
	FriendStaminaSend = 52,
	FriendStaminaRecv = 53,
	UnionGetRedPacketCoin3 = 58,
	TitleCount = 64,
	UnionContribGold = 54,
	FriendCount = 51,
	ExplorerLevel = 8,
	FragHuodongPassCount = 35,
	MailCount = 69,
	HorseBetRightTimes = 90,
	TalentOne = 4,
	UnionContribRmb = 55,
	DispatchTaskACount = 43,
	CostGoldCount = 11,
	HeroGateChallenge = 29,
	DispatchTaskCCount = 41,
	StaminaCount = 68,
	EndlessTowerPass = 40,
	DrawGemGold = 77,
	DispatchTaskSCount = 44,
	FragHuodongPassType = 39,
	CardGemQualitySum = 88,
	FeelLevelCount = 25,
	ExplorerActive = 7,
	GateStarCount = 27,
	ArenaRank = 48,
	GoldCount = 10,
	GatePass = 28,
	ContractHuodongPassCount = 102,
	CardCount = 14,
	ExplorerActiveCount = 6,
	ExpHuodongPassType = 37,
	CitySpriteCount = 72,
	HeroGatePass = 31,
	RedQualityGem = 87,
	GoldHuodongPassType = 36,
	TalentAll = 5,
	Level = 1,
	UnionGetRedPacketGold = 56,
	EffortGeneralTrainTimes = 19,
	DispatchTaskBCount = 42,
	ShopRefresh = 62,
	CardLevelCount = 16,
	FishCount = 78,
	CostRmbCount = 13,
	HeldItemQualityCount = 24,
	RmbCount = 12,
	DrawSCard2 = 73,
	UnionGetRedPacketRmb = 57,
	BaiBianActive = 86,
	MiniQActive = 70,
	GateChallenge = 26,
	DrawItem5 = 61,
	ArenaCoin1Count = 47,
	DrawCardGold10 = 63,
	GoldHuodongPassCount = 32,
	DrawSCard3 = 74,
	FishTypeCount = 79,
	ContractHuodongPassType = 103,
	MysteryShopRefresh = 85,
	SignInDays = 81,
	FixShopRefresh = 84,
	DrawGemRMB = 76,
	DispatchTaskS2Count = 45,
	HuntingSpecialPass = 94,
	FrameCount = 66,
	CardStarCount = 18,
	CardMarkIDStar = 92,
	CardCsvIDCount = 91,
	CraftTop8Count = 50,
	HeldItemLevelCount = 23,
	EquipAwakeCount = 22,
	LivePoint = 75,
	EquipAdvanceCount = 21,
	DrawChipRMB = 95,
	CardNatureCount = 15,
	DrawChipItem = 96,
	CardNvalueCount = 82,
	OnlineHours = 60,
	GymGateAllPassTimes = 89,
	ExpHuodongPassCount = 33,
	DrawCardRMB10 = 59,
	TrainerPrivilege = 3
}
slot13 = {
	[slot12.Level] = function (slot0)
		return slot0:read("level")
	end,
	[slot12.TrainerLevel] = function (slot0)
		return slot0:read("trainer_level")
	end,
	[slot12.TrainerPrivilege] = function (slot0)
		slot1.TrainerPrivilege = slot0.achievementCache.TrainerPrivilege or itertools.sum(slot0:read("trainer_attr_skills"))

		return slot1.TrainerPrivilege
	end,
	[slot12.TalentOne] = function (slot0, slot1, slot2)
		return slot0:read("talent_trees")[slot2] and slot3.cost or 0
	end,
	[slot12.TalentAll] = function (slot0)
		slot1.TalentAll = slot0.achievementCache.TalentAll or itertools.sum(slot0:read("talent_trees"), function (slot0, slot1)
			return slot1.cost
		end)

		return slot1.TalentAll
	end,
	[slot12.ExplorerActiveCount] = function (slot0)
		slot1.ExplorerActiveCount = slot0.explorersCache.ExplorerActiveCount or itertools.count(slot0:read("explorers"), function (slot0, slot1)
			return slot1.advance >= 1
		end)

		return slot1.ExplorerActiveCount
	end,
	[slot12.ExplorerActive] = function (slot0, slot1, slot2)
		if slot0:read("explorers")[slot2] and slot3.advance >= 1 then
			return 1
		end

		return 0
	end,
	[slot12.ExplorerLevel] = function (slot0)
		slot1.ExplorerLevel = slot0.explorersCache.ExplorerLevel or itertools.max(slot0:read("explorers"), function (slot0, slot1)
			return slot1.advance
		end) or 0

		return slot1.ExplorerLevel
	end,
	[slot12.FightingPoint] = function (slot0)
		return slot0:read("top6_fighting_point")
	end,
	[slot12.CostRmbCount] = function (slot0)
		return slot0:read("rmb_consume")
	end,
	[slot12.CardCount] = function (slot0)
		slot1.CardCount = slot0.achievementCache.CardCount or itertools.size(slot0:read("pokedex"))

		return slot1.CardCount
	end,
	[slot12.CardNatureCount] = function (slot0, slot1, slot2)
		if slot0.achievementCache.CardNatureCount == nil then
			slot4 = {}
			slot8 = "pokedex"

			for slot8, slot9 in pairs(slot0:read(slot8)) do
				slot11 = csv.unit[csv.cards[slot8].unitID]
				slot4[slot11.natureType] = (slot4[slot11.natureType] or 0) + 1

				if slot11.natureType2 then
					slot4[slot11.natureType2] = (slot4[slot11.natureType2] or 0) + 1
				end
			end

			slot3.CardNatureCount = slot4
		end

		return slot3.CardNatureCount[slot2] or 0
	end,
	[slot12.CardCsvIDCount] = function (slot0, slot1, slot2)
		return slot0:read("pokedex")[slot2] and 1 or 0
	end,
	[slot12.FeelLevelCount] = function (slot0, slot1, slot2)
		if slot0.achievementCache.FeelLevelCount == nil then
			slot4 = {}
			slot8 = "card_feels"

			for slot8, slot9 in pairs(slot0:read(slot8)) do
				slot4[slot9.level] = (slot4[slot9.level] or 0) + 1
			end

			slot3.FeelLevelCount = stat.summator.new(slot4)
		end

		return slot3.FeelLevelCount:sumRange(slot2)
	end,
	[slot12.EndlessTowerPass] = function (slot0, slot1, slot2)
		if slot2 <= slot0:read("endless_tower_max_gate") then
			return 1
		end

		return 0
	end,
	[slot12.FriendCount] = function (slot0)
		if slot0.achievementCache.FriendCount == nil then
			slot1.FriendCount = itertools.size(gGameModel.society:read("friends"))
		end

		return slot1.FriendCount
	end,
	[slot12.CardLevelCount] = function (slot0, slot1, slot2)
		return gGameModel.cards:getStat().level_sum:sumRange(slot2)
	end,
	[slot12.CardAdvanceCount] = function (slot0, slot1, slot2)
		return gGameModel.cards:getStat().advance_sum:sumRange(slot2)
	end,
	[slot12.CardStarCount] = function (slot0, slot1, slot2)
		return gGameModel.cards:getStat().star_sum:sumRange(slot2)
	end,
	[slot12.EquipAdvanceCount] = function (slot0, slot1, slot2)
		return gGameModel.cards:getStat().equip_advance_sum:sumRange(slot2)
	end,
	[slot12.EquipAwakeCount] = function (slot0, slot1, slot2)
		return gGameModel.cards:getStat().equip_awake_sum:sumRange(slot2)
	end,
	[slot12.HeldItemLevelCount] = function (slot0, slot1, slot2)
		if slot0.achievementCache.HeldItemLevelCount == nil then
			slot4 = {}

			for slot8, slot9 in gGameModel.held_items:pairs() do
				if slot9:read("exist_flag") then
					slot4[slot10] = (slot4[slot9:read("level")] or 0) + 1
				end
			end

			slot3.HeldItemLevelCount = stat.summator.new(slot4)
		end

		return slot3.HeldItemLevelCount:sumRange(slot2)
	end,
	[slot12.HeldItemQualityCount] = function (slot0, slot1, slot2)
		if slot0.achievementCache.HeldItemQualityCount == nil then
			slot4 = {}

			for slot8, slot9 in gGameModel.held_items:pairs() do
				if slot9:read("exist_flag") then
					slot10 = csv.held_item.items[slot9:read("held_item_id")]
					slot4[slot10.quality] = (slot4[slot10.quality] or 0) + 1
				end
			end

			slot3.HeldItemQualityCount = slot4
		end

		return slot3.HeldItemQualityCount[slot2] or 0
	end,
	[slot12.GatePass] = function (slot0, slot1, slot2)
		if slot0:read("gate_star")[slot2] and slot3.star >= 1 then
			return 1
		end

		return 0
	end,
	[slot12.HeroGatePass] = function (slot0, slot1, slot2)
		if slot0:read("gate_star")[slot2] and slot3.star >= 1 then
			return 1
		end

		return 0
	end,
	[slot12.ArenaRank] = function (slot0)
		return slot0:read("pw_rank")
	end,
	[slot12.GateStarCount] = function (slot0, slot1, slot2)
		if slot0.gateStarCache.GateStarCount == nil then
			slot4 = {}
			slot8 = "gate_star"

			for slot8, slot9 in pairs(slot0:read(slot8)) do
				if csv.scene_conf[slot8].sceneType == 4 then
					slot4[slot9.star] = (slot4[slot9.star] or 0) + 1
				end
			end

			slot3.GateStarCount = stat.summator.new(slot4)
		end

		return slot3.GateStarCount:sumRange(slot2)
	end,
	[slot12.HeroGateStarCount] = function (slot0, slot1, slot2)
		if slot0.gateStarCache.HeroGateStarCount == nil then
			slot4 = {}
			slot8 = "gate_star"

			for slot8, slot9 in pairs(slot0:read(slot8)) do
				if csv.scene_conf[slot8].sceneType == 5 then
					slot4[slot9.star] = (slot4[slot9.star] or 0) + 1
				end
			end

			slot3.HeroGateStarCount = stat.summator.new(slot4)
		end

		return slot3.HeroGateStarCount:sumRange(slot2)
	end,
	[slot12.GoldHuodongPassType] = function (slot0, slot1, slot2)
		if slot0:read("huodongs_index")[1] ~= nil and slot2 <= slot3 + 1 then
			return 1
		end

		return 0
	end,
	[slot12.ExpHuodongPassType] = function (slot0, slot1, slot2)
		if slot0:read("huodongs_index")[2] ~= nil and slot2 <= slot3 + 1 then
			return 1
		end

		return 0
	end,
	[slot12.GiftHuodongPassType] = function (slot0, slot1, slot2)
		if slot0:read("huodongs_index")[3] ~= nil and slot2 <= slot3 + 1 then
			return 1
		end

		return 0
	end,
	[slot12.FragHuodongPassType] = function (slot0, slot1, slot2)
		if slot0:read("huodongs_index")[4] ~= nil and slot2 <= slot3 + 1 then
			return 1
		end

		return 0
	end,
	[slot12.TitleCount] = function (slot0)
		if slot0.achievementCache.TitleCount == nil then
			slot1.TitleCount = itertools.size(gGameModel.role:read("titles"))
		end

		return slot1.TitleCount
	end,
	[slot12.FigureCount] = function (slot0)
		if slot0.achievementCache.FigureCount == nil then
			slot1.FigureCount = itertools.size(gGameModel.role:read("figures"))
		end

		return slot1.FigureCount
	end,
	[slot12.FrameCount] = function (slot0)
		if slot0.achievementCache.FrameCount == nil then
			slot1.FrameCount = itertools.size(gGameModel.role:read("frames"))
		end

		return slot1.FrameCount
	end,
	[slot12.LogoCount] = function (slot0)
		if slot0.achievementCache.LogoCount == nil then
			slot1.LogoCount = itertools.size(slot0:read("active_logos"))
		end

		return slot1.LogoCount
	end,
	[slot12.StaminaCount] = function (slot0)
		return slot0:read("stamina")
	end,
	[slot12.MailCount] = function (slot0)
		if slot0.achievementCache.MailCount == nil then
			slot1.MailCount = itertools.size(slot0:read("mailbox")) + itertools.size(slot0:read("read_mailbox"))
		end

		return slot1.MailCount
	end,
	[slot12.FishCount] = function (slot0, slot1, slot2)
		if slot0.achievementCache.FishCount == nil then
			slot4 = {}

			for slot9, slot10 in pairs(gGameModel.fishing:read("fish")) do
				slot4[slot9] = (slot4[slot9] or 0) + slot10.counter
			end

			slot3.FishCount = slot4
		end

		return slot3.FishCount[slot2] or 0
	end,
	[slot12.FishTypeCount] = function (slot0, slot1, slot2)
		if slot0.achievementCache.FishTypeCount == nil then
			slot4 = {}

			for slot9, slot10 in pairs(gGameModel.fishing:read("fish")) do
				slot11 = csv.fishing.fish[slot9]
				slot4[slot11.type] = (slot4[slot11.type] or 0) + slot10.counter
				slot4.allType = (slot4.allType or 0) + slot10.counter
			end

			slot3.FishTypeCount = slot4
		end

		if slot2 then
			return slot3.FishTypeCount[slot2] or 0
		else
			return slot3.FishTypeCount.allType or 0
		end
	end,
	[slot12.FishingLevel] = function (slot0)
		return gGameModel.fishing:read("level")
	end,
	[slot12.SignInDays] = function (slot0)
		return slot0:read("sign_in_days")
	end,
	[slot12.CardNvalueCount] = function (slot0, slot1, slot2)
		slot4 = 0
		slot3.PerfectNvalueCount = slot0.achievementCache.PerfectNvalueCount or itertools.count(gGameModel.cards, function (slot0, slot1)
			if slot1:read("exist_flag") then
				for slot6, slot7 in pairs(slot1:read("nvalue")) do
					uv8 = "read"

					if slot7 < slot8 then
						return false
					end
				end

				return true
			else
				return false
			end
		end) or 0

		return slot3.PerfectNvalueCount
	end,
	[slot12.CardGemQualitySum] = function (slot0, slot1, slot2)
		if slot0.achievementCache.CardGemQualitySum == nil then
			slot4 = {}
			slot5 = csv.gem.quality
			slot6 = csv.gem.gem

			for slot10, slot11 in gGameModel.cards:pairs() do
				for slot17, slot18 in pairs(slot11:read("gems")) do
					slot19 = gGameModel.gems:find(slot18)
					slot13 = slot5[slot19:read("level")]["qualityNum" .. slot6[slot19:read("gem_id")].quality] + 0
				end

				if slot2 <= slot13 then
					slot4[slot2] = (slot4[slot2] or 0) + 1
				end
			end

			slot3.CardGemQualitySum = slot4
		end

		return slot3.CardGemQualitySum[slot2] or 0
	end,
	[slot12.CardMarkIDStar] = function (slot0, slot1, slot2)
		return gGameModel.cards:getStat().markID_star[slot2] or 0
	end,
	[slot12.ContractHuodongPassType] = function (slot0, slot1, slot2)
		if slot0:read("huodongs_index")[7] ~= nil and slot2 <= slot3 + 1 then
			return 1
		end

		return 0
	end
}

function slot2.getAchievement(slot0, slot1)
	slot2 = csv.achievement.achievement_task[slot1]
	slot5 = slot2.targetArg2
	slot6 = 0
	uv8 = "csv"

	if slot2.targetType == slot8.ArenaRank and (slot0:read("achievement_tasks") or {})[slot1] then
		return slot2.targetArg
	end

	uv8 = "achievement"

	if slot8[slot3] then
		if slot7[slot1] and slot8(slot0, slot4, slot5) < slot4 then
			slot6 = slot4
		end
	elseif slot2.yyID then
		uv10 = "csv"

		if slot3 == slot10.HorseBetRightTimes then
			slot6 = (((slot0:read("yyhuodongs")[slot2.yyID] or {}).horse_race or {}).achievement_counter or {})[slot5] or 0
		end
	else
		slot6 = (slot0:read("achievement_counter") or {})[slot3] or 0
	end

	return slot6
end

function slot2.refreshYYEndTime(slot0)
	slot3 = {
		[slot7] = slot8 + time.getTime()
	}

	for slot7, slot8 in pairs(slot0:read("yy_delta")) do
		slot9 = time.getDate(slot3[slot7])

		if slot9.hour * 100 + slot9.min > 2359 then
			slot9.min = slot9.min + 1
			slot9.sec = 0
			slot3[slot7] = time.getTimestamp(slot9)
		end
	end

	slot0:getOrNewRawIdler_("yy_endtime"):set(slot3)
end

slot14 = {
	DrawGemRMB = 4,
	UnionSkillLevel = 15,
	AutoChessRank = 45,
	MegaCardsCount = 33,
	FigureCount = 35,
	TitleCount = 34,
	BagCapacity = 8,
	DrawDailyLimitCount = 7,
	CrossFishingRank = 20,
	HuntingSpecialRoutePassUndead = 42,
	ReunionBind = 14,
	DartMaxEvaluateCount = 43,
	OnlineFightWinStreak = 27,
	CaptureSSprite = 9,
	RandomTowerHardBeatCount = 10,
	BuildingCenterLevel = 16,
	BuildingHomeDecorative = 17,
	FrameCount = 36,
	AssignCardBattleWin = 37,
	CrossMineBuffCost = 26,
	CrossMineKillBossCount = 29,
	DailyAssistantCount = 3,
	OnlineFightLimitedWin = 28,
	HuntingPassUndead = 40,
	SignInDays = 2,
	AutoChessSignInDays = 46,
	CrossMineRank = 23,
	CrossCraftRank = 21,
	TownSocietyHomeVisitCount = 11,
	PartyQifenCount = 12,
	CrossSupremacyRank = 24,
	MegaCardsPVPWinCount = 38,
	CardMarkIdCount = 32,
	OnlineFightRank = 22,
	AutoChessNormalWinStreak = 44,
	LivePoint = 1,
	DrawChipRMB = 6,
	Fetters = 31,
	StarLevel = 41,
	DrawTotem = 5,
	CardFeelCount = 18,
	CrossMineRodLosingStreak = 30,
	MegaCardsCrossArenaWin = 39,
	UnionQARank = 19,
	UnionWishingCount = 13,
	CrossArenaRank = 25
}
slot15 = {
	[slot14.SignInDays] = function (slot0)
		return slot0:read("sign_in_count")
	end,
	[slot14.DailyAssistantCount] = function (slot0)
		return slot0:read("daily_assistant_in_days")
	end,
	[slot14.DrawGemRMB] = function (slot0)
		return gGameModel.lottery_record:read("gem_rmb_dc1_counter") + gGameModel.lottery_record:read("gem_rmb_dc10_counter") * 10
	end,
	[slot14.DrawTotem] = function (slot0)
		return gGameModel.lottery_record:read("totem_rmb_dc1_counter") + gGameModel.lottery_record:read("totem_rmb_dc6_counter") * 6
	end,
	[slot14.DrawChipRMB] = function (slot0)
		return gGameModel.lottery_record:read("chip_rmb_dc1_counter") + gGameModel.lottery_record:read("chip_rmb_dc10_counter") * 10
	end,
	[slot14.BagCapacity] = function (slot0)
		return slot0:read("card_capacity")
	end,
	[slot14.BuildingCenterLevel] = function (slot0, slot1, slot2)
		slot3.BuildingCenterLevel = slot0.medalCache.BuildingCenterLevel or slot0:read("town_building_level")

		return slot3.BuildingCenterLevel[slot2.buildingID] or 0
	end,
	[slot14.BuildingHomeDecorative] = function (slot0)
		return slot0:read("town_home_decorativeness")
	end,
	[slot14.UnionWishingCount] = function (slot0)
		return slot0:read("frag_donate_start_count")
	end,
	[slot14.CardFeelCount] = function (slot0, slot1, slot2)
		if slot0.medalCache.CardFeelCount == nil then
			slot3.CardFeelCount = {}
		end

		if slot3.CardFeelCount[slot2.feelLevel] == nil then
			slot9 = "card_feels"

			for slot9, slot10 in pairs(slot0:read(slot9)) do
				if slot4 <= slot10.level then
					slot5 = 0 + 1
				end
			end

			slot3.CardFeelCount[slot4] = slot5
		end

		return slot3.CardFeelCount[slot4]
	end,
	[slot14.MegaCardsCount] = function (slot0, slot1, slot2)
		slot3.MegaCardsCount = slot0.medalCache.MegaCardsCount or itertools.count(gGameModel.cards, function (slot0, slot1)
			if csv.cards[slot1:read("card_id")].megaIndex > 0 then
				return true
			else
				return false
			end
		end) or 0

		return slot3.MegaCardsCount
	end,
	[slot14.TitleCount] = function (slot0)
		if slot0.medalCache.TitleCount == nil then
			slot1.TitleCount = itertools.size(slot0:read("titles"))
		end

		return slot1.TitleCount
	end,
	[slot14.FigureCount] = function (slot0)
		if slot0.medalCache.FigureCount == nil then
			slot1.FigureCount = itertools.size(slot0:read("figures"))
		end

		return slot1.FigureCount
	end,
	[slot14.FrameCount] = function (slot0)
		if slot0.medalCache.FrameCount == nil then
			slot1.FrameCount = itertools.size(slot0:read("frames"))
		end

		return slot1.FrameCount
	end,
	[slot14.UnionSkillLevel] = function (slot0, slot1, slot2)
		if slot0.medalCache.UnionSkillLevel == nil then
			slot3.UnionSkillLevel = {}
		end

		if slot3.UnionSkillLevel[slot2.skillLevel] == nil then
			slot9 = "union_skills"

			for slot9, slot10 in pairs(slot0:read(slot9)) do
				if slot4 <= slot10 then
					slot5 = 0 + 1
				end
			end

			slot3.UnionSkillLevel[slot4] = slot5
		end

		return slot3.UnionSkillLevel[slot4]
	end,
	[slot14.CrossMineBuffCost] = function (slot0)
		return slot0:read("cross_mine_buff_feed_cost")
	end,
	[slot14.RandomTowerHardBeatCount] = function (slot0)
		return gGameModel.role:read("random_tower_hard_beat_count")
	end,
	[slot14.CrossMineRodLosingStreak] = function (slot0)
		return slot0:read("cross_mine_rob_fail_streak")
	end,
	[slot14.Fetters] = function (slot0, slot1, slot2)
		slot3 = 0
		slot4 = gGameModel.cards:getStat()

		for slot8, slot9 in csvMapPairs(slot2.cardMarkIDs) do
			slot10 = 0
			slot11 = csv.cards[slot9].cardMarkID

			for slot15, slot16 in csvMapPairs(csv.cards[slot9].fetterList) do
				slot17 = true

				for slot21, slot22 in csvMapPairs(csv.fetter[slot16].cards) do
					if not slot4.markID_star[slot11] then
						slot17 = false
					end
				end

				if slot17 then
					slot10 = slot10 + 1
				end
			end

			if slot10 == itertools.size(csv.cards[slot9].fetterList) then
				slot3 = slot3 + 1
			end
		end

		return slot3
	end,
	[slot14.CardMarkIdCount] = function (slot0, slot1, slot2)
		for slot8, slot9 in csvMapPairs(slot2.cardMarkIDs) do
			if gGameModel.cards:getStat().markID_star[csv.cards[slot9].cardMarkID] then
				slot3 = 0 + 1
			end
		end

		return slot3
	end,
	[slot14.OnlineFightWinStreak] = function (slot0)
		return slot0:read("cross_online_fight_win_streak")
	end,
	[slot14.StarLevel] = function (slot0, slot1, slot2)
		slot4 = gGameModel.cards:getStat()

		for slot8, slot9 in csvMapPairs(slot2.cardMarkIDs) do
			if slot4.markID_star[csv.cards[slot9].cardMarkID] and slot1 <= slot4.markID_star[slot10] then
				slot3 = 0 + 1
			end
		end

		return slot3
	end,
	[slot14.DartMaxEvaluateCount] = function (slot0)
		return slot0:read("town_home_party_dart_max_evaluate_counter")
	end,
	[slot14.AutoChessNormalWinStreak] = function (slot0)
		return slot0:read("auto_chess_normal_type_win_streak")
	end,
	[slot14.AutoChessSignInDays] = function (slot0)
		return slot0:read("auto_chess_sign_in_days")
	end
}

function slot2.getMedal(slot0, slot1)
	slot2 = csv.medal[slot1]
	slot4 = slot2.targetArg
	slot6 = 0
	uv8 = "csv"

	if slot8[slot2.targetType] then
		if not itertools.isempty((slot0:read("medal_task") or {})[slot1]) and (slot8(slot0, slot4, slot2.targetArgSpecial) or 0) < slot4 then
			slot6 = slot4
		end
	else
		slot6 = (slot0:read("medal_counter") or {})[slot1] or 0
	end

	return slot6
end

slot16 = {
	[slot3.ArenaBattle] = function (slot0, slot1, slot2)
		slot4 = slot0
		uv4 = "read"

		return {
			slot0.read(slot4, "contract_counter")[slot4.ArenaBattle] or 0,
			slot1
		}
	end,
	[slot3.ArenaBattleWin] = function (slot0, slot1, slot2)
		slot4 = slot0
		uv4 = "read"

		return {
			slot0.read(slot4, "contract_counter")[slot4.ArenaBattleWin] or 0,
			slot1
		}
	end,
	[slot3.UnionContrib] = function (slot0, slot1, slot2)
		slot4 = slot0
		uv4 = "read"

		return {
			slot0.read(slot4, "contract_counter")[slot4.UnionContrib] or 0,
			slot1
		}
	end,
	[slot3.RandomTowerBattleWin] = function (slot0, slot1, slot2)
		slot4 = slot0
		uv4 = "read"

		return {
			slot0.read(slot4, "contract_counter")[slot4.RandomTowerBattleWin] or 0,
			slot1
		}
	end,
	[slot3.RandomTowerBattle] = function (slot0, slot1, slot2)
		slot4 = slot0
		uv4 = "read"

		return {
			slot0.read(slot4, "contract_counter")[slot4.RandomTowerBattle] or 0,
			slot1
		}
	end,
	[slot3.MarkCardStarCount] = function (slot0, slot1, slot2)
		slot4 = gGameModel.cards:getStat()
		slot5, slot6 = csvNext(slot2)

		for slot10, slot11 in csvMapPairs(slot6) do
			if slot4.markID_star[csv.cards[slot11].cardMarkID] and slot5 <= slot4.markID_star[slot12] then
				slot3 = 0 + 1
			end
		end

		return {
			slot3,
			csvSize(slot6)
		}
	end,
	[slot3.MarkCardAdvanceCount] = function (slot0, slot1, slot2)
		slot4 = gGameModel.cards:getStat()
		slot5, slot6 = csvNext(slot2)

		for slot10, slot11 in csvMapPairs(slot6) do
			if slot4.markID_advance[csv.cards[slot11].cardMarkID] and slot5 <= slot4.markID_advance[slot12] then
				slot3 = 0 + 1
			end
		end

		return {
			slot3,
			csvSize(slot6)
		}
	end,
	[slot3.RandomTowerBattleClearance] = function (slot0, slot1, slot2)
		slot4 = slot0
		uv4 = "read"

		return {
			slot0.read(slot4, "contract_counter")[slot4.RandomTowerBattleClearance] or 0,
			slot1
		}
	end
}

function slot2.getContractTaskProgress(slot0, slot1, slot2, slot3)
	uv4 = "error"

	if slot4[slot1] then
		uv4 = "error"

		return slot4[slot1](slot0, slot2, slot3)
	end

	uv4 = "title target"

	if not slot4[slot1] then
		error("title target" .. slot1 .. "not watched!")
	end

	uv4 = "not watched!"

	return slot4(slot1, 0, slot2, slot3)
end

return slot2
