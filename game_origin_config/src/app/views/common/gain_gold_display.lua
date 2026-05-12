slot0 = class("GainGoldDisplayView", Dialog)
slot0.RESOURCE_FILENAME = "common_gain_gold_display.json"
slot0.RESOURCE_BINDING = {
	panel10 = "panel10",
	bg = "bg",
	panel1 = "panel1"
}

function slot0.onCreate(slot0, slot1, slot2)
	for slot9, slot10 in pairs(slot1) do
		slot3 = 0 + slot10.multiple - 1
		slot4 = 0 + slot10.gold
		slot5 = 0 + 1
	end

	if slot2 == 1 then
		slot0.panel1:show()

		if slot3 > 0 then
			slot0.panel1:get("title"):text(string.format(gLanguageCsv.gainGoldMultiple, slot3 + 1))
		end

		slot0.panel1:get("gold"):text("+" .. slot4)
	else
		slot0.panel10:show()
		slot0.panel10:get("times"):text(slot5)
		slot0.panel10:get("critTimes"):text(slot3)
		slot0.panel10:get("gold"):text("+" .. slot4)
		adapt.oneLineCenterPos(cc.p(450, 270), {
			slot0.panel10:get("info1"),
			slot0.panel10:get("times"),
			slot0.panel10:get("info2"),
			slot0.panel10:get("critTimes"),
			slot0.panel10:get("info3")
		}, cc.p(5, 0))
	end

	slot0:playEffect()
	Dialog.onCreate(slot0)
end

function slot0.playEffect(slot0)
	audio.playEffectWithWeekBGM("golden.mp3")

	slot1 = slot0.bg:size()
	slot0.goldEffect = widget.addAnimation(slot0:getResourceNode(), "effect/jubao.skel", "effect", slot0.bg:z() - 1):xy(display.center):scale(2)
end

function slot0.onClose(slot0)
	if slot0.goldEffect then
		slot0.goldEffect:removeFromParent()
	end

	Dialog.onClose(slot0)
end

return slot0
