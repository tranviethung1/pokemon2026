slot0 = class("VSInfo", battleModule.CBase)

function slot0.ctor(slot0, slot1)
	battleModule.CBase.ctor(slot0, slot1)

	slot0.widgetLeft = slot0.parent.UIWidgetLeft:get("Image_8")
	slot0.widgetRight = slot0.parent.UIWidgetRight:get("Image_11")
end

function slot0.onNewBattleRound(slot0, slot1)
end

function slot0.onClose(slot0)
end

return slot0
