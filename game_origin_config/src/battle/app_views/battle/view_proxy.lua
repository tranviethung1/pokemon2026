function BattleView.onViewProxyNotify(slot0, slot1, ...)
	return slot0.subModuleNotify:notify(slot1, ...)
end

function BattleView.onViewProxyCall(slot0, slot1, ...)
	return slot0.subModuleNotify:call(slot1, ...)
end

function BattleView.onViewBeProxy(slot0, slot1, slot2)
	return slot0.subModuleNotify:notify("ViewBeProxy", slot1, slot2)
end

function BattleView.addSpecModule(slot0, slot1)
	slot0.subModuleNotify:addSpec(slot1)
end
