slot0 = class("BraveChallengeTipView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "activity_brave_challenge_tip.json"
slot0.RESOURCE_BINDING = {
	["baseNode.btn"] = "btn",
	baseNode = "baseNode",
	["baseNode.img"] = "imgBg",
	["baseNode.list"] = "list"
}

function slot0.onCreate(slot0, slot1)
	slot2 = beauty.textScroll({
		isRich = true,
		fontSize = 40,
		list = slot0.list,
		strs = slot1.strs
	})

	if slot0.list:getInnerContainerSize().height - slot0.list:size().height > 0 then
		slot0.list:size(slot3)

		slot6 = slot0.imgBg:size()

		slot0.imgBg:size(cc.size(slot6.width, slot6.height + slot5))
	end

	slot0.baseNode:xy(slot1.pos)
end

return slot0
