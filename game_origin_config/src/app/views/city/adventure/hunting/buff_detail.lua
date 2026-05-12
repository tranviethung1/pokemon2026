slot0 = class("HuntingBuffDetailView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "hunting_buff_detail.json"
slot0.RESOURCE_BINDING = {
	["baseNode.title"] = "title",
	baseNode = "baseNode"
}

function slot0.onCreate(slot0, slot1)
	slot0.title:text(slot1.name)

	slot2 = rich.createWithWidth("#C0x5B545B#" .. slot1.desc, 40, nil, 600):anchorPoint(0.5, 1):addTo(slot0.baseNode, 10, "textNum")

	slot0.baseNode:height(slot2:height() + 150)
	slot0.title:y(slot2:height() + 90)
	slot2:xy(slot0.baseNode:width() / 2, slot2:height() + 50)
end

return slot0
