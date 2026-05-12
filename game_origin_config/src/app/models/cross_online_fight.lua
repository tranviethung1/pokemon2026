slot1 = class("CrossOnlineFight", require("app.models.base"))

function slot1.init(slot0, slot1)
	uv2 = "init"

	slot2.init(slot0, slot1)
	slot0.__idlers:add("match_result", idlereasy.new("", "match_result"))

	return slot0
end

function slot1.pushMatchResult(slot0, slot1)
	slot0.__idlers:at("match_result"):set(slot1.match_result)
end

return slot1
