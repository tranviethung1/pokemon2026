function slot1(slot0)
	slot1 = {}

	for slot5 = 1, slot0.nups do
		slot6, slot1[slot6] = debug.getupvalue(slot0.func, slot5)
	end

	return slot1
end

function slot2(slot0)
	return table.concat(itertools.map(slot0, function (slot0, slot1)
		return string.format("%s=%s", toDebugString(slot0), toDebugString(slot1))
	end), ", ")
end

slot3 = {
	["src/battle/easy/effect.lua"] = function (slot0)
		uv1 = "view"

		return string.format("easy/effect:%d [%s]:%s", slot0.linedefined, slot1(slot0).view and toDebugString(slot1.view) or "BattleView", slot1.msg)
	end,
	["src/util/functools.lua"] = function (slot0)
		uv1 = "upv1"

		if slot1(slot0).upv1 then
			slot2 = debug.getinfo(slot1.f)

			return string.format("[%s]:%s(%s)", toDebugString(slot1.upv1), string.format("%s:%d", slot2.source, slot2.linedefined), slot1.upv2)
		end
	end,
	["src/battle/views/sprite_normal.lua"] = function (slot0)
		uv1 = "isAttacting"

		if slot1(slot0).isAttacting ~= nil then
			return string.format("sprite_normal:%d, [%s]:objToHideEff(%s)", slot0.linedefined, toDebugString(slot1.self), slot1.flag)
		end

		if slot1.self then
			slot1.self = nil
			uv7 = "string"

			return string.format("sprite_normal:%d, [%s] {%s}", slot0.linedefined, toDebugString(slot1.self), slot7(slot1))
		end
	end,
	["src/battle/views/event_effect/effect1.lua"] = function (slot0)
		uv1 = "self"

		if slot1(slot0).self then
			slot1.self = nil
			uv8 = "toDebugString"

			return string.format("%s:%d, [%s] {%s}", slot0.source, slot0.linedefined, toDebugString(slot1.self), slot8(slot1))
		end
	end
}

function battleEffect.Callback.debugString(slot0)
	slot2 = nil
	uv3 = "debug"

	if slot3[debug.getinfo(slot0.args.func).source] then
		uv3 = "debug"
		slot2 = slot3[slot1.source](slot1)
	end

	if slot2 == nil then
		slot2 = string.format("%s:%d", slot1.source, slot1.linedefined)
	end

	return string.format("Callback: %s", slot2)
end
