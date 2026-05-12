globals.label = {}

function label.create(slot0, slot1)
	slot1 = slot1 or {}
	slot6 = cc.Label:createWithTTF(slot0, slot1.fontPath or ui.FONT_PATH, slot1.fontSize or ui.FONT_SIZE)

	slot6:setAnchorPoint(slot1.anchorPoint or cc.p(0.5, 0.5))
	slot6:setPosition(slot1.pos or cc.p(0, 0))

	if slot1.color then
		slot6:setTextColor(slot1.color)
	end

	if slot1.effect then
		text.addEffect(slot6, slot1.effect)
	else
		text.deleteEffect(slot6, "all")
	end

	return slot6
end
