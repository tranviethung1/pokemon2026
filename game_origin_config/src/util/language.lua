slot0 = string.format

function globals.getBaseLanguage(slot0)
	if string.find(slot0 or LOCAL_LANGUAGE, "_") then
		return string.sub(slot0, 1, slot1 - 1)
	end

	return nil
end

function globals.getL10nField(slot0)
	if LOCAL_LANGUAGE == "cn" then
		return slot0
	else
		return string.format("%s_%s", slot0, OkamiLan or "")
	end
end

function globals.getL10nStr(slot0, slot1)
	if LOCAL_LANGUAGE == "cn" then
		return slot0[slot1]
	else
		return slot0[string.format("%s_%s", slot1, OkamiLan or "")]
	end
end

function globals.checkLanguage(slot0)
	return matchLanguage({
		slot0 or "cn"
	})
end

function globals.matchLanguageForce(slot0)
	for slot4, slot5 in pairs(slot0 or {}) do
		if slot5 == LOCAL_LANGUAGE then
			return true
		end
	end

	return false
end

function globals.matchLanguage(slot0)
	for slot5, slot6 in pairs(slot0 or {}) do
		if slot6 == LOCAL_LANGUAGE or slot6 == getBaseLanguage() then
			return true
		end
	end

	return false
end

function globals.getServerTag(slot0)
	if slot0 then
		return string.split(slot0, ".")[2]
	end
end

function globals.getServerId(slot0, slot1)
	if gDestServer[slot0] then
		return gDestServer[slot0].id
	end

	if not slot1 and gServersMergeID[slot0] then
		return csv.server.merge[gServersMergeID[slot0]].serverID
	end

	return tonumber(string.split(slot0, ".")[3])
end

function globals.getServerArea(slot0, slot1, slot2)
	slot4 = getServerId(slot0, slot2)
	slot5 = SERVER_MAP[getServerTag(slot0)] and SERVER_MAP[slot3].name or ""

	if slot1 then
		if slot5 ~= "" then
			slot6 = string.format("%s.%s", slot5, "S" .. slot4)
		end

		return slot6
	end

	return string.format("%s %s.%d", gLanguageCsv.serverArea, slot5, slot4)
end

function globals.getServerName(slot0, slot1)
	if not SERVERS_INFO[string.format("game.%s.%s", getServerTag(slot0), getServerId(slot0, slot1))] then
		return ""
	end

	return SERVERS_INFO[slot4].name
end

function globals.getShortMergeRoleName(slot0)
	if gServersMergeID[userDefault.getForeverLocalKey("serverKey", nil, {
		rawKey = true
	})] and string.find(slot0, string.format(".s%d$", getServerId(slot1))) then
		return string.sub(slot0, 1, slot3 - 1)
	end

	return slot0
end

function globals.isCurServerContainMerge(slot0)
	slot1 = userDefault.getForeverLocalKey("serverKey", nil, {
		rawKey = true
	})

	if gDestServer[slot0] then
		return itertools.include(gDestServer[slot0].servers, slot1)
	end

	return slot0 == slot1
end

function globals.getVersionContainMerge(slot0)
	return gServersMergeID[userDefault.getForeverLocalKey("serverKey", nil, {
		rawKey = true
	})] and csv.server.merge[slot2][slot0] or 0
end

function globals.getMergeServers(slot0)
	slot1 = {}
	slot2 = {}

	for slot6, slot7 in ipairs(slot0) do
		if not slot1[string.format("game.%s.%s", getServerTag(slot7), getServerId(slot7))] then
			slot1[slot10] = true

			table.insert(slot2, slot10)
		end
	end

	return slot2
end

function globals.isServerTagInCross(slot0)
	if getServerTag(userDefault.getForeverLocalKey("serverKey", nil, {
		rawKey = true
	})) == "cn_huawei" then
		slot2 = "cn_qd"
	end

	return slot2 == slot0
end
