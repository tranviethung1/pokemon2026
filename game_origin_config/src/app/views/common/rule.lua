slot0 = class("RuleView", Dialog)
slot0.RESOURCE_FILENAME = "common_rule.json"
slot0.RESOURCE_BINDING = {
	panelChip = "panelChip",
	list = "list",
	bg = "bg",
	title = "title",
	rateTips = "rateTips",
	awardItem = "awardItem"
}

function slot0.onCreate(slot0, slot1, slot2)
	Dialog.onCreate(slot0)
	slot0.list:setScrollBarEnabled(false)

	if (slot2 or {}).width then
		slot3 = slot0.bg:width() - slot2.width

		slot0.bg:width(slot2.width)
		slot0.list:width(slot0.list:width() - slot3):x(slot0.list:x() + slot3 / 2)
		setContentSizeOfAnchor(slot0.title, cc.size(slot0.title:width() - slot3, slot0.title:height()))
	end

	adaptContext.setToList(slot0, slot0.list, slot1(slot0), 16, nil, function ()
		uv0 = "list"
		slot0 = slot0.list
		slot1 = slot0

		slot0.refreshView(slot1)

		slot0 = cc.clampf
		uv1 = "refreshView"

		if not slot1.height then
			uv1 = "list"
			slot1 = slot1.list:getInnerItemSize().height
		end

		uv3 = "list"
		slot3 = slot3.list
		slot4 = slot3
		uv1 = "list"
		slot1 = slot1.list
		slot2 = slot1
		slot1 = slot1.height(slot2) - slot0(slot1, 400, slot3.height(slot4))
		uv2 = "list"
		slot2 = slot2.bg
		slot2 = slot2.height
		uv4 = "list"
		slot4 = slot4.bg:height() - slot1

		slot2(slot2, slot4)

		uv2 = "list"
		uv4 = "list"
		slot4 = slot4.list:height() - slot1
		uv4 = "list"

		slot2.list:height(slot4):y(slot4.list:y() + slot1 / 2)
	end)
	slot0:quickFor()
end

return slot0
