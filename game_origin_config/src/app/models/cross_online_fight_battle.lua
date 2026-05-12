slot1 = class("BattleModel", require("app.models.battle"))
slot1.DefaultGateID = game.GATE_TYPE.crossOnlineFight
slot2 = game.SYNC_SCENE_STATE

function slot1.getData(slot0)
	uv1 = "getData"
	slot1 = slot1.getData(slot0)

	if slot0.limited_card_deck == nil then
		return slot1
	end

	initOnlineFightTalent()

	for slot5, slot6 in pairs(slot1.roleOut) do
		slot7 = csv.unit[slot6.roleId].natureType
		slot8 = game.TALENT_TYPE.battleFront

		if slot5 > 3 and slot5 < 7 or slot5 > 9 and slot5 < 13 then
			slot8 = game.TALENT_TYPE.battleBack
		end

		for slot12, slot13 in pairs(gOnlineFightTalentAttrs) do
			if slot6[game.ATTRDEF_TABLE[slot12]] ~= nil then
				if gOnlineFightTalentPositions[slot8][slot12] ~= nil then
					slot15 = 0 + gOnlineFightTalentPositions[slot8][slot12][1]
					slot16 = 0 + gOnlineFightTalentPositions[slot8][slot12][2]
				end

				if gOnlineFightTalentNatures[slot7][slot12] ~= nil then
					slot15 = slot15 + gOnlineFightTalentNatures[slot7][slot12][1]
					slot16 = slot16 + gOnlineFightTalentNatures[slot7][slot12][2]
				end

				if slot16 > 0 then
					slot6[slot14] = slot6[slot14] * (1 + slot16 / 100)
				end

				if slot15 > 0 then
					slot6[slot14] = slot6[slot14] + slot15
				end
			end
		end
	end

	return slot1
end

function slot1.getPreDataForEnd(slot0, slot1)
	return {}
end

slot3 = class("CrossOnlineFightBattleModel")

function slot3.ctor(slot0, slot1)
	uv2 = "battle"
	slot0.battle = slot2.new(slot1)
	slot0.battle.operateForceSwitch = true
	slot0.roles = {}
	slot0.doCallbacks = {}
	slot0.scene = nil

	if slot1.battle then
		slot0.state = slot1.battle.state or idler.new(0)
		slot0.error = slot1.battle.error or idler.new("")
	else
		slot0.state = idler.new(0)
		slot0.error = idler.new("")
	end

	slot0.inputs = {}
	slot0.locals = {
		frame_id = 0,
		who = 0,
		state = 0
	}
	slot0.remote = {
		frame_id = 0,
		time = 0,
		state = 0,
		countdown_timestamp = 0,
		countdown = 0,
		who = 0,
		offline = {},
		frames = {},
		hero_status = {}
	}
	slot0.rand_counts = {}
end

function slot3.init(slot0, slot1)
	slot0.battle:init(slot1)

	slot0.cheat = {
		tb = slot1
	}

	return slot0
end

function slot3.getData(slot0)
	slot1 = slot0.battle:getData()
	slot1.role_key = slot0.battle.role_key
	slot1.defence_role_key = slot0.battle.defence_role_key
	slot1.role_frames = {
		slot0.battle.frame,
		slot0.battle.defence_frame
	}
	slot1.game_keys = {
		slot0.battle.role_key[1],
		slot0.battle.defence_role_key[1]
	}

	if slot1.operateForce == 2 then
		slot1.defence_role_key = slot1.role_key
		slot1.role_key = slot1.defence_role_key

		table.swapvalue(slot1.role_frames, 1, 2)
		table.swapvalue(slot1.game_keys, 1, 2)
	end

	slot1.frames = slot0.battle.attack_frames
	slot1.result = slot0.battle.results[slot1.operateForce]
	slot1.limited_card_deck = slot0.battle.limited_card_deck
	slot1.banpick_input_steps = slot0.battle.banpick_input_steps
	slot1.play_record_id = slot0.play_record_id
	slot1.cross_key = slot0.cross_key
	slot1.record_url = slot0.record_url

	return slot1
end

function slot3.setRoles(slot0, slot1, slot2)
	slot0.roles = {
		slot1,
		slot2
	}
end

function slot3.setSceneModel(slot0, slot1)
	slot0.scene = slot1
end

function slot3.fromServer(slot0, slot1, slot2)
	printDebug(" ***************************** CrossOnlineFightBattleModel.fromServer(d) !!!! ")
	printDebug(" --- who =%s, state= %s, frame_id=%s", slot1.who, slot1.state, slot1.frame_id, slot1.countdown, slot1.countdown_timestamp, slot1.time)
	printDebug("%s,%s", slot1.offline[1], slot1.offline[2])

	if slot2 then
		printDebug("%s,%s", slot2[1], slot2[2])
	end

	slot0.remote.frame_id = slot1.frame_id
	slot0.remote.who = slot1.who
	slot0.remote.state = slot1.state

	slot0.state:set(slot1.state)

	slot0.remote.time = slot1.time
	slot0.remote.offline = slot1.offline
	slot0.remote.countdown = slot1.countdown
	slot0.remote.countdown_timestamp = slot1.countdown_timestamp
	slot0.rand_counts = slot2
	slot3 = 0

	if slot0.remote.frames[#slot0.remote.frames] then
		slot3 = slot4.input[1]
	end

	for slot8, slot9 in ipairs(slot1.frames) do
		if slot3 < slot9.input[1] then
			table.insert(slot0.remote.frames, slot9)

			slot3 = slot3 + 1
		end
	end

	if slot1.hero_status then
		slot0.remote.hero_status[slot1.frame_id] = slot1.hero_status
	end

	if slot0:isRegistered(slot0.remote.state) then
		slot0.doCallbacks[slot0.remote.state]()
	end
end

function slot3.ready(slot0)
	slot0:sendPacket("/onlinefight/input", {
		ready = true
	})
end

function slot3.giveup(slot0)
	slot0:sendPacket("/onlinefight/input", {
		giveup = true
	})
end

function slot3.flee(slot0)
	if #userDefault.getForeverLocalKey("onlineFightFleeTime", {}) >= 3 then
		for slot5 = 1, 2 do
			slot1[slot5] = slot1[slot5 + 1]
		end

		slot1[3] = time.getTime()
	else
		slot1[#slot1 + 1] = time.getTime()
	end

	userDefault.setForeverLocalKey("onlineFightFleeTime", slot1)
	slot0:sendPacket("/onlinefight/input", {
		flee = true
	})
end

function slot3.attack(slot0, slot1, slot2, slot3, slot4)
	slot0.locals.frame_id = slot1
	slot0.locals.who = slot2

	table.insert(slot0.inputs, {
		slot1,
		slot2,
		slot3,
		slot4
	})
	slot0:toServer()
end

function slot3.toServer(slot0)
	slot0.inputs = {}

	slot0:sendPacket("/onlinefight/attack", {
		inputs = slot0.inputs,
		locals = slot0.locals,
		rand_count = ymrand.randCount
	})
end

slot4 = {
	["no battle"] = true,
	["no session"] = true
}

function slot3.sendPacket(slot0, slot1, slot2)
	gGameApp:requestPacket(slot1, function (slot0, slot1)
		if slot1 then
			uv2 = "err"

			if slot2[slot1.err] then
				gGameUI:showDialog({
					btnType = 1,
					clearFast = true,
					content = gLanguageCsv.curBattleOver,
					cb = function ()
						gGameUI:switchUI("city.view")
					end
				})
			else
				errorInWindows("CrossOnlineFightBattleModel %s", slot1.err)
			end
		end
	end, slot2)
end

function slot3.sendRandomCount(slot0)
	slot0:sendPacket("/onlinefight/input", {
		rand_count = ymrand.randCount
	})
end

function slot3.register(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		slot0.doCallbacks[slot5] = slot6
	end
end

function slot3.isRegistered(slot0, slot1)
	return slot0.doCallbacks[slot1] ~= nil
end

function slot3.isLocalSlow(slot0, slot1)
	if slot0.remote.frame_id == 0 then
		return
	end

	if slot0.remote.frame_id - slot1 > 3 then
		return slot0.remote.frame_id - slot1
	end
end

function slot3.getFrameInRemote(slot0, slot1)
	if slot0.remote.frames[slot1] then
		slot2 = slot2.input

		return {
			frame_id = slot2[1],
			who = slot2[2],
			target = slot2[3],
			skill = slot2[4],
			hero_status = slot0.remote.hero_status[slot1 + 1]
		}
	end
end

function slot3.checkCheat(slot0)
	return slot0.battle:checkCheat()
end

function slot3.nextWho(slot0)
	return slot0.remote.who
end

function slot3.serverFrameID(slot0)
	return slot0.remote.frame_id
end

return slot3
