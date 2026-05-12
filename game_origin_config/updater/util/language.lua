slot0 = string.format

function globals.getL10nField(slot0)
	if LOCAL_LANGUAGE == "cn" then
		return slot0
	else
		uv1 = "LOCAL_LANGUAGE"

		return slot1("%s_%s", slot0, LOCAL_LANGUAGE)
	end
end

function globals.getL10nStr(slot0, slot1)
	if LOCAL_LANGUAGE == "cn" then
		return slot0[slot1]
	else
		uv2 = "LOCAL_LANGUAGE"

		return slot0[slot2("%s_%s", slot1, LOCAL_LANGUAGE)]
	end
end

function globals.checkLanguage(slot0)
	return LOCAL_LANGUAGE == (slot0 or "cn")
end

function globals.matchLanguage(slot0)
	for slot4, slot5 in pairs(slot0 or {}) do
		if slot5 == LOCAL_LANGUAGE then
			return true
		end
	end

	return false
end
