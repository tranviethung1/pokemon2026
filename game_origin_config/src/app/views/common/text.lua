slot0 = class("TextView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "common_text.json"
slot0.RESOURCE_BINDING = {
	["baseNode.bg"] = "bg",
	baseNode = "baseNode"
}

function slot0.onCreate(slot0, slot1)
	if not matchLanguage({
		"cn",
		"tw"
	}) then
		slot1.width = (slot1.width or 0) + 160
	else
		slot1.width = (slot1.width or 0) + 135
	end

	slot2 = 30
	slot4 = rich.createWithWidth(slot1.content, slot1.fontSize or 40, nil, slot1.width or 580, 15):addTo(slot0.baseNode, 99):setAnchorPoint(cc.p(0, 1))
	slot6 = math.max(slot4:getContentSize().height, 240) + 30 * 2

	slot4:xy(slot2, slot6 - 40)
	slot0.bg:size(slot4:getContentSize().width + slot2 * 2, slot6)
end

return slot0
