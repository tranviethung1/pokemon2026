slot1 = class("HellRandomTowerBuffFetterView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "hell_random_tower_buff_fetter.json"
slot1.RESOURCE_BINDING = {
	item = "item"
}
slot1.RESOURCE_STYLES = {
	clickClose = true
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0.cb = slot2
	slot3 = csv.hell_random_tower.buffs[slot1]

	slot0.item:get("icon"):texture(slot3.icon)
	slot0.item:get("logo"):hide()

	if slot3.logo ~= "" then
		slot0.item:get("logo"):show():texture(slot3.logo)
	end

	widget.addAnimationByKey(slot0:getResourceNode(), "random_tower/hell/jiesuojiban.skel", "effect", "effect", 5):xy(display.sizeInView.width / 2, 1020):scale(2):addPlay("effect_loop")
	rich.createByStr("#C0xFFFCED##L10#" .. slot3.name, 40):anchorPoint(0.5, 0.5):xy(display.sizeInView.width / 2, 580):addTo(slot0:getResourceNode(), 10, "text1")
	rich.createByStr("#C0xFFFCED##L10#" .. gLanguageCsv.unlockRequire .. slot3.unlockConditionDesc, 40):anchorPoint(0.5, 0.5):xy(display.sizeInView.width / 2, 500):addTo(slot0:getResourceNode(), 10, "text2")
end

function slot1.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

return slot1
