slot0 = class("Messages")
slot1 = {
	"all",
	"news",
	"world",
	"union",
	"team",
	"huodong",
	"private",
	"marquee",
	"official"
}
slot2 = {
	[game.MESSAGE_TYPE_DEFS.normal] = {
		"news"
	},
	[game.MESSAGE_TYPE_DEFS.unionJoinUp] = {
		"world",
		function (slot0)
			if slot0 then
				return nil
			end

			return "union"
		end
	},
	[game.MESSAGE_TYPE_DEFS.cloneInvite] = {
		"team"
	},
	[game.MESSAGE_TYPE_DEFS.roleUnion] = {
		"union"
	},
	[game.MESSAGE_TYPE_DEFS.unionPlay] = {
		"union"
	},
	[game.MESSAGE_TYPE_DEFS.breakEgg] = {
		"news"
	},
	[game.MESSAGE_TYPE_DEFS.worldChat] = {
		"world"
	},
	[game.MESSAGE_TYPE_DEFS.unionChat] = {
		"union"
	},
	[game.MESSAGE_TYPE_DEFS.roleChat] = {
		"private"
	},
	[game.MESSAGE_TYPE_DEFS.news] = {
		"news"
	},
	[game.MESSAGE_TYPE_DEFS.battleShare] = {
		"world"
	},
	[game.MESSAGE_TYPE_DEFS.worldCardShare] = {
		"world"
	},
	[game.MESSAGE_TYPE_DEFS.unionCardShare] = {
		"union"
	},
	[game.MESSAGE_TYPE_DEFS.worldCloneInvite] = {
		"world"
	},
	[game.MESSAGE_TYPE_DEFS.unionCloneInvite] = {
		"union"
	},
	[game.MESSAGE_TYPE_DEFS.friendCloneInvite] = {
		"private"
	},
	[game.MESSAGE_TYPE_DEFS.yyHuoDongRedPacketType] = {
		"world"
	},
	[game.MESSAGE_TYPE_DEFS.marqueeType] = {
		"marquee"
	},
	[game.MESSAGE_TYPE_DEFS.worldReunionInvite] = {
		"world"
	},
	[game.MESSAGE_TYPE_DEFS.recommendReunionInvite] = {
		"private"
	},
	[game.MESSAGE_TYPE_DEFS.official] = {
		"official"
	}
}

function slot0.ctor(slot0, slot1)
	slot0.game = slot1
	slot0.msgID = 0
	slot0._stash = {}
	uv4 = "game"

	for slot6, slot7 in ipairs(slot4) do
		-- Nothing
	end

	slot0.__idlers = idlers.newWithMap({
		[slot7] = idlereasy.new({}, slot7)
	}, tostring(slot0))
end

function slot0.getRawIdler_(slot0, slot1)
	if slot1 == nil then
		return slot0.__idlers
	end

	slot2 = slot0.__idlers:at(slot1)

	assert(slot2, "no such idler")

	return slot2
end

function slot0.getIdler(slot0, slot1)
	return idlereasy.assign(slot0:getRawIdler_(slot1))
end

function slot0.read(slot0, slot1)
	return slot0:getRawIdler_(slot1):read()
end

function slot0.addMessage(slot0, slot1)
	if slot0.game.society.__idlers == nil then
		return
	end

	slot3 = arraytools.hash(slot0.game.society:getValue_("black_list"))
	slot4 = slot0.game.role:getValue_("union_db_id") ~= nil
	slot5 = {
		all = {}
	}

	function slot6(slot0)
		slot1 = slot0.type == game.MESSAGE_TYPE_DEFS.marqueeType
		uv3 = "type"

		for slot5, slot6 in ipairs(slot3[slot0.type]) do
			if type(slot6) == "function" then
				uv8 = "game"
				slot6 = slot6(slot8)
			end

			if slot6 then
				slot8 = slot0
				clone(slot8).channel = slot6
				uv8 = "MESSAGE_TYPE_DEFS"

				if slot8[slot6] == nil then
					uv8 = "MESSAGE_TYPE_DEFS"
					slot8[slot6] = {
						slot7
					}
				else
					uv9 = "MESSAGE_TYPE_DEFS"

					table.insert(slot9[slot6], slot7)
				end

				if not slot1 then
					uv9 = "MESSAGE_TYPE_DEFS"

					table.insert(slot9.all, slot7)

					slot1 = true
				end
			end
		end
	end

	slot8 = {
		id = slot0.game.role:getValue_("id"),
		name = slot0.game.role:getValue_("name"),
		logo = slot0.game.role:getValue_("logo"),
		frame = slot0.game.role:getValue_("frame"),
		title = slot0.game.role:getValue_("title_id"),
		level = slot0.game.role:getValue_("level"),
		vip = slot0.game.role:getValue_("vip_level")
	}

	if slot1.msgID then
		slot0.msgID = math.max(slot0.msgID, slot1.msgID)
	end

	slot9 = slot1.msgID == nil

	for slot13, slot14 in ipairs(slot1.msgs) do
		slot16 = false
		slot17, slot18, slot19, slot20, slot21, slot22 = unpack(slot14, 1, 6)

		if not slot0._stash[({
			args = slot22,
			role = slot21,
			type = slot20,
			msg = slot19,
			time = slot18,
			id = slot17
		}).id] then
			if slot15.role then
				slot16 = slot3[slot15.role.id]

				if slot15.role.id == slot7 then
					slot15.isMine = true

					if slot0.game.role:getValue_("vip_hide") then
						slot8.vip = 0
					end

					slot15.role = slot8
				else
					slot15.isMine = false
				end
			end

			if not slot16 then
				slot6(slot15)
			end

			if slot9 then
				slot0._stash[slot15.id] = true
			end
		end
	end

	if not slot9 then
		slot0._stash = {}
	end

	for slot13, slot14 in pairs(slot5) do
		table.sort(slot14, function (slot0, slot1)
			return slot0.time < slot1.time
		end)
	end

	for slot13, slot14 in pairs(slot5) do
		slot0.__idlers:at(slot13):modify(function (slot0)
			uv2 = "ipairs"

			for slot4, slot5 in ipairs(slot2) do
				table.insert(slot0, slot5)
			end

			uv1 = "table"

			for slot5 = 1, #slot0 - (slot1 == "all" and 5 or 50) do
				table.remove(slot0, 1)
			end
		end, true)
	end
end

function slot0.resetChannel(slot0, slot1)
	slot0.__idlers:at(slot1):set({})
end

function slot0.delRoleChatMsg(slot0, slot1)
	slot4 = {}

	for slot8, slot9 in ipairs(slot0.__idlers:at("private"):read()) do
		if slot9.role.id == slot1 then
			-- Nothing
		elseif not slot9.args or slot9.args.id ~= slot1 then
			table.insert(slot4, slot9)
		end
	end

	slot2:set(slot4, true)
end

return slot0
