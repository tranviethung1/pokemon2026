slot0 = ccui.ListView

function slot0.adaptTouchEnabled(slot0)
	slot0:refreshView()
	slot0:setTouchEnabled(slot0:size().width < slot0:getInnerContainerSize().width or slot1.height < slot2.height)

	return slot0
end

function slot0.getInnerItemSize(slot0)
	if slot0:getChildrenCount() == 0 then
		return cc.size(0, 0)
	end

	slot0:refreshView()

	slot2 = slot0:getItem(slot1 - 1)
	slot5 = slot0:getItem(0)

	return cc.size(slot2:x() + (1 - slot2:anchorPoint().x) * slot2:size().width, slot5:y() + (1 - slot5:anchorPoint().y) * slot5:size().height - (slot2:y() - slot2:anchorPoint().y * slot2:size().height))
end

function slot0.setItemAlignCenter(slot0, slot1)
	slot2 = slot0:getInnerItemSize()
	slot3 = slot0:size()

	if slot1 then
		slot0.__originSize = slot1
	elseif not slot0.__originSize then
		slot0.__originSize = slot3
	end

	slot4 = nil
	slot4 = (slot0:getDirection() ~= ccui.ListViewDirection.horizontal or cc.size(math.min(slot0.__originSize.width, slot2.width), slot0.__originSize.height)) and cc.size(slot0.__originSize.width, math.min(slot0.__originSize.height, slot2.height))

	slot0:size(slot4)
	slot0:x(slot0:x() + (slot3.width - slot4.width) / 2 * slot0:scaleX())
	slot0:y(slot0:y() + (slot3.height - slot4.height) / 2 * slot0:scaleY())

	return slot0
end
