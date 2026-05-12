function ccui.LoadingBar.percent(slot0, slot1)
	if slot1 == nil then
		return slot0:getPercent()
	else
		slot0:setPercent(slot1)

		return slot0
	end
end
