slot0 = string.caption

function BattleSprite.onViewProxyNotify(slot0, slot1, ...)
	slot3 = slot0.model.id

	log.battle.sprite.snotify(slot3, slot1)

	uv3 = "log"

	if slot0["on" .. slot3(slot1)] then
		slot3(slot0, ...)
	else
		printWarn("BattleSprite no handler for msg, %s", slot2)
	end
end

function BattleSprite.onViewProxyCall(slot0, slot1, ...)
	log.battle.sprite.call(slot0.model.id, slot1)

	if slot0[slot1] then
		return slot3(slot0, ...)
	else
		printWarn("BattleSprite no handler for msg %s", slot2)
	end
end

function BattleSprite.modelOnly(slot0)
	if slot0.sprite then
		slot0.sprite:modelOnly()
	end

	slot0:stopAllActions()
	slot0:unscheduleUpdate()
end
