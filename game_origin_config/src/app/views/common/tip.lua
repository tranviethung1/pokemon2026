slot0 = class("TipView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "common_tip.json"
slot0.RESOURCE_BINDING = {
	panel = "panel",
	["panel.text"] = "panelText",
	["panel.bg"] = "bg"
}

function slot0.onCreate(slot0, slot1)
	slot0.content = slot1

	slot0.panelText:text("")

	slot2 = rich.createByStr("#C0x5b545b#" .. slot1, 40):anchorPoint(0.5, 0.5):xy(slot0.panelText:x(), slot0.panelText:y()):addTo(slot0.panel, 2000)

	slot2:formatText()
	slot0.bg:size(math.max(slot2:size().width + 100, 1024), slot0.bg:size().height)
	slot0.panel:anchorPoint(0.5, 0):scale(3, 0)

	if gGameUI.getTimeScale then
		slot4 = 0.2 * gGameUI:getTimeScale(true)
		slot5 = 2.5 * gGameUI:getTimeScale(true)
	end

	transition.executeSequence(slot0.panel):scaleTo(slot4, 1, 1):delay(slot5):scaleTo(slot4, 0, 1):func(functools.partial(slot0.onClose, slot0)):done()
end

function slot0.onClose(slot0)
	slot0.panel:stopAllActions()
	slot0:removeSelf()
end

function slot0.onMoveUp(slot0)
	slot1, slot2 = slot0.panel:xy()

	if gGameUI.getTimeScale then
		slot3 = 0.1 * gGameUI:getTimeScale(true)
	end

	transition.executeSequence(slot0.panel):moveTo(slot3, slot1, slot2 + slot0.panel:height()):done()
end

return slot0
