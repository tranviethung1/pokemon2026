slot0 = {
	mimicry = "mimicry",
	fishing_shop = "shop",
	explorer_shop = "shop",
	fix_shop = "shop",
	town_shop = "shop",
	society = "society",
	union_shop = "shop",
	weekly_record = "record",
	equip_shop = "shop",
	monthly_record = "record",
	cards = "cards",
	held_items = "held_items",
	fishing = "fishing",
	reunion_record = "reunion_record",
	random_tower_shop = "shop",
	union = "union",
	lottery_record = "record",
	totem = "totem",
	chips = "chips",
	daily_record = "record",
	gems = "gems",
	mystery_shop = "shop",
	frag_shop = "shop",
	tasks = "tasks",
	contracts = "contracts",
	hell_random_tower = "hell_random_tower",
	random_tower = "random_tower",
	game_record = "game_record",
	totem_shop = "shop",
	capture = "capture"
}
slot1 = {
	"battle",
	"arena_battle",
	"qiecuo",
	"endless_battle",
	"random_tower_battle",
	"union_fuben_battle",
	"clone_battle",
	"hunting_battle",
	"cross_arena_battle",
	"cross_mine_battle",
	"cross_mine_boss_battle",
	"cross_supremacy_battle",
	"world_boss_battle",
	"huodongboss_battle",
	"brave_challenge_battle",
	"cross_online_fight_battle",
	"gym_battle",
	"gym_leader_battle",
	"cross_gym_battle",
	"summer_challenge_battle",
	"chess_play",
	"mimicry_battle",
	"cross_union_adventure_battle",
	"hell_random_tower_battle"
}
slot2 = {
	"arena",
	"union_fuben",
	"clone_room",
	"brave_challenge",
	"hunting",
	"union_training",
	"craft",
	"union_fight",
	"cross_craft",
	"cross_arena",
	"cross_mine",
	"cross_supremacy",
	"cross_online_fight",
	"gym",
	"town",
	"cross_union_fight",
	"auto_chess",
	"cross_union_adventure"
}
slot3 = {
	endless_playrecords = "endless_battle",
	cross_arena_playrecords = "cross_arena_battle",
	cross_union_adventure_playrecords = "cross_union_adventure_battle",
	cross_union_fight_playrecords = "cross_union_fight_battle",
	arena_playrecords = "arena_battle",
	battlebet_playrecords = "battle_bet_battle",
	gym_playrecords = "gym_leader_battle",
	union_fight_playrecords = "union_fight_battle",
	cross_mine_playrecords = "cross_mine_battle",
	cross_online_fight_playrecords = "cross_online_fight_battle",
	craft_playrecords = "craft_battle",
	cross_supremacy_playrecords = "cross_supremacy_battle",
	cross_craft_playrecords = "cross_craft_battle"
}
slot4 = {
	["/game/cross/mine/playrecord/get"] = "cross_mine_playrecords",
	["/game/yy/battlebet/playback"] = "battlebet_playrecords",
	["/game/endless/play/detail"] = "endless_playrecords",
	["/game/cross/arena/playrecord/get"] = "cross_arena_playrecords",
	["/game/pw/playrecord/get"] = "arena_playrecords",
	["/game/craft/playrecord/get"] = "craft_playrecords",
	["/game/yy/contestbet/playback"] = "battlebet_playrecords",
	["/game/cross/supremacy/playrecord/get"] = "cross_supremacy_playrecords",
	["/game/cross/online/playrecord/get"] = "cross_online_fight_playrecords",
	["/game/cross/union/fight/playrecord/get"] = "cross_union_fight_playrecords",
	["/game/union/fight/playrecord/get"] = "union_fight_playrecords",
	["/game/cross/union/adventure/playrecord/get"] = "cross_union_adventure_playrecords",
	["/game/gym/playrecord/get"] = "gym_playrecords",
	["/game/cross/craft/playrecord/get"] = "cross_craft_playrecords"
}
slot5 = class("GameModel")

function slot5.ctor(slot0)
	globals.gGameModel = slot0
	slot0.delaySyncCallback = nil
	slot0.account = require("app.models.account").new(slot0)
	slot0.role = require("app.models.role").new(slot0)
	slot0.messages = require("app.models.message").new(slot0)
	slot2 = slot0
	slot0.handbook = require("app.models.handbook").new(slot2)
	uv2 = "globals"

	for slot4, slot5 in pairs(slot2) do
		slot0[slot4] = require("app.models." .. slot5).new(slot0)
	end

	slot0.currday_dispatch = require("app.models.currday_dispatch").new(slot0)
	slot0.forever_dispatch = require("app.models.forever_dispatch").new(slot0)
	slot2 = slot0
	slot0.currlogin_dispatch = require("app.models.currlogin_dispatch").new(slot2)
	slot0.battle = nil
	uv2 = "gGameModel"

	for slot4, slot5 in pairs(slot2) do
		slot0[slot4] = CMap.new()
	end

	slot0.csvVersion = 0
	slot0.syncVersion = 0
	slot0.globalRecordLastTime = 0
	slot0.global_record = require("app.models.global_record").new(slot0)
	slot0.guideID = 0
	slot0._sync = {}
end

function slot5.setNewGuideID(slot0, slot1)
	if slot1 ~= slot0.guideID then
		slot0.guideID = slot1

		if slot0._sync.role == nil then
			slot0._sync.role = {}
		end

		slot0._sync.role.guideID = slot1
	end
end

function slot5.syncData(slot0)
	slot1 = slot0._sync
	slot1.csv = slot0.csvVersion
	slot1.sync = slot0.syncVersion
	slot1.msg = slot0.messages.msgID
	slot1.global_record_last_time = slot0.globalRecordLastTime
	slot0._sync = {}

	return slot1
end

function slot5.delaySyncOnce(slot0)
	function slot0.delaySyncCallback()
		uv0 = "delaySyncCallback"
		slot0.delaySyncCallback = nil

		idlersystem.endIntercept()
	end

	return slot0.delaySyncCallback
end

function slot5.destroy(slot0)
	for slot4, slot5 in pairs(slot0) do
		slot0[slot4] = nil
	end
end

function slot5.syncFromServer(slot0, slot1)
	idlersystem.beginIntercept()

	if slot1.server_time then
		time.registerTime(time.SERVER_TIMEKEY, 1, slot1.server_time)

		slot1.server_time = nil
	end

	if slot1.server_openTime then
		game.SERVER_OPENTIME = slot1.server_openTime
		slot1.server_openTime = nil
	end

	if slot1.csv then
		slot0:initCSV(slot1.csv)

		slot1.csv = nil
	end

	if slot1.model then
		if slot1.model.account then
			slot0.account:init(slot1.model.account)
		end

		if slot1.model.role then
			slot0.role:init(slot1.model.role)
			slot0.handbook:init(slot1.model.role)
			slot0.currday_dispatch:init({
				newNewWorld2Click = false,
				sendedRedPacket = false,
				starExchangeDailyClick = false,
				passport = false,
				crossUnionAdventureClick = false,
				townExplorationFlag = false,
				autoChessTrainerDailyClick = false,
				goldLuckyCat = false,
				vipGift = false,
				homeShopClick = false,
				intoTownDaily = false,
				randomTower = false,
				activityDirectBuyGift = false,
				firstRecharge = false,
				newPlayerWeffare = false,
				starAidDailyClick = false,
				crossUnionFightBetClick = false,
				townWishClick = false,
				luckyCat = false,
				serverOpenItemBuy = {},
				firstRechargeDaily = {}
			})
			slot0.forever_dispatch:init({
				chatPrivatalyLastId = 0,
				crossUnionFightTime = 0,
				explorerAdvanceCoreFirst = false,
				armClick = false,
				townExplorationTime = 0,
				customizeGiftClick = false,
				mimicryClick = false,
				hellRandomTowerClick = 0,
				cloneBattleLookRobot = false,
				preferentialGoodsClick = false,
				townHomeVisitClick = false,
				dispatchTasksRedHintRefrseh = false,
				reunionBindPlayer = 0,
				cloneBattleLookHistory = 0,
				exclusiveLimitDatas = false,
				braveChallengeEachClick = 0,
				battleManualDatas = false,
				dispatchTasksNextAutoTime = 0,
				activityItemExchange = {},
				worldcupItemBetClick = {},
				armRedHintTag = {},
				newContract = {},
				vipGift2Click = {}
			})
			slot0.currlogin_dispatch:init({
				rechargeWheelSkip = false,
				livenessWheelSkip = false
			})
		end

		uv3 = "idlersystem"

		for slot5, slot6 in pairs(slot3) do
			if slot1.model[slot5] then
				slot0[slot5]:init(slot1.model[slot5])
			end
		end

		if slot1.model.cards then
			slot0.cards:initNewFlag()
		end

		uv3 = "beginIntercept"

		for slot5, slot6 in ipairs(slot3) do
			if slot1.model[slot6] then
				slot0.battle = require("app.models." .. slot6).new(slot0):init(slot1.model[slot6])
			end
		end

		uv3 = "server_time"

		for slot5, slot6 in ipairs(slot3) do
			if slot1.model[slot6] then
				if slot0[slot6] == nil then
					slot0[slot6] = require("app.models." .. slot6).new(slot0)
				end

				slot0[slot6]:syncFrom(slot1.model[slot6], true)
			end
		end

		uv3 = "time"

		for slot5, slot6 in pairs(slot3) do
			if slot1.model[slot5] then
				for slot10, slot11 in pairs(slot1.model[slot5]) do
					slot0[slot5]:insert(slot10, require("app.models." .. slot6).new(slot0):init(slot11))
				end
			end
		end

		if slot1.model.cross_online_fight_banpick then
			slot0.cross_online_fight_banpick = require("app.models.cross_online_fight_banpick").new(slot0):init(slot1.model.cross_online_fight_banpick)
		end

		slot0:afterSync(slot1.model)

		slot1.model = nil
	end

	if slot1.sync then
		slot0:doSync(slot1.sync)

		slot1.sync = nil
	end

	if slot1.msg then
		slot0.messages:addMessage(slot1.msg)

		slot1.msg = nil
	end

	if slot1.global_record then
		slot0.global_record:syncFrom(slot1.global_record, true)

		slot0.globalRecordLastTime = slot1.global_record.last_time
		slot1.global_record = nil
	end

	if not slot0.delaySyncCallback then
		idlersystem.endIntercept()
	end

	return slot1
end

function slot5.doSync(slot0, slot1)
	if slot1.version then
		slot0.syncVersion = slot1.version
	end

	if slot1.upd then
		slot3 = slot1.new or {}

		for slot7, slot8 in pairs(slot1.upd) do
			if slot7 == "role" then
				slot0.handbook:syncFrom(slot8, slot3[slot7])

				if slot8._db and slot8._db.union_db_id ~= nil then
					slot0.messages:resetChannel("union")
				end
			end

			slot0[slot7]:syncFrom(slot8, slot3[slot7])
		end
	end

	if slot1.del then
		for slot5, slot6 in pairs(slot1.del) do
			if slot5 == "role" then
				slot0.handbook:syncDel(slot6)

				if slot6._db and slot6._db.union_db_id ~= nil then
					slot0.messages:resetChannel("union")
				end
			end

			slot0[slot5]:syncDel(slot6)
		end
	end

	if slot1.upd then
		slot0:afterSync(slot1.upd)
	end

	if slot1.del then
		slot0.role:afterDelSync(slot1.del.role)
	end
end

function slot5.afterSync(slot0, slot1)
	slot0.tasks:afterSync(slot1.tasks)
	slot0.role:afterSync(slot1.role)
	slot0.role:checkTargetChanged(slot1)
end

function slot5.initCSV(slot0, slot1)
	if slot1.version <= slot0.csvVersion then
		return
	end

	printDebug("csv sync version %s %s", slot0.csvVersion, slot1.version)

	slot0.csvVersion = slot1.version

	if LOCAL_LANGUAGE ~= "cn" then
		-- Nothing
	end

	csv.yunying = slot1.data.yunying
end

function slot5.getEndlessPlayRecord(slot0, slot1)
	return slot0.endless_playrecords:find(slot1)
end

function slot5.playRecordBattle(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	uv9 = "find"

	if not slot0[slot9[slot3]]:find(slot1) then
		gGameApp:requestServer(slot3, function ()
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
		end, slot1, slot2, slot6)

		return
	end

	slot10.play_record_id = slot1
	slot10.cross_key = slot2
	slot10.record_url = slot3

	if slot10:getData().limited_card_deck and slot11.banpick_input_steps then
		gGameUI:stackUI("city.pvp.online_fight.ban_embattle", nil, {
			full = true
		}, {
			recordData = slot11,
			startFighting = functools.partial(slot0.onPlayRecord, slot0, slot10)
		})

		return
	end

	slot0:onPlayRecord(slot10, slot7, slot8)
end

function slot5.onPlayRecord(slot0, slot1, slot2, slot3)
	slot4 = slot1:getData()
	slot4.uiBack = slot2

	battleEntrance.battleRecord(slot4, slot1.result or slot4.result, {
		noShowEndRewards = true
	}):preCheck(nil, function ()
		gGameUI:showTip(gLanguageCsv.crossCraftPlayNotExisted)
	end):onStartOK(slot3):show()
end

function slot5.playRecordDeployInfo(slot0, slot1, slot2, slot3, slot4)
	uv5 = "find"

	if not slot0[slot5[slot3]]:find(slot1) then
		gGameApp:requestServer(slot3, function ()
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
		end, slot1, slot2)

		return
	end

	slot4(slot6.cheat.tb)
end

return slot5
