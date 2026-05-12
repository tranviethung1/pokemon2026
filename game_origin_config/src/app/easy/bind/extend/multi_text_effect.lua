slot0 = require("easy.bind.helper")
slot1 = class("multiTextEffect", cc.load("mvc").ViewBase)
slot1.defaultProps = {}

function slot1.initExtend(slot0)
	if slot0.panel then
		slot0.panel:removeFromParent()
	end

	slot1 = ccui.Layout:create():size(cc.size(0, 0)):addTo(slot0, 1)

	slot1:setTouchEnabled(false)

	slot0.panel = slot1

	for slot6 = 1, slot0.effects and #slot0.effects or 1 do
		slot7 = label.create(" ", slot0.labelParams)
		slot8 = slot7
		slot7 = slot7.addTo(slot8, slot1, 100 - slot6, slot6)
		uv8 = "panel"

		slot8.callOrWhen(slot0.data, functools.partial(slot7.text, slot7))

		if slot0.effects then
			bind.effect(slot0, slot7, {
				data = slot0.effects[slot6]
			})
		else
			text.deleteEffect(slot7, "all")
		end
	end

	if slot0.onNode then
		slot0.onNode(slot1)
	end

	return slot0
end

return slot1
