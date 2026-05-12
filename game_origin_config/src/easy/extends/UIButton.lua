function ccui.Button.text(slot0, slot1)
	if slot1 == nil then
		return slot0:getTitleText()
	else
		slot0:setTitleText(slot1)

		return slot0
	end
end
