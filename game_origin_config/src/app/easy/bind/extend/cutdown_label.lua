slot0 = require("easy.bind.helper")
slot1 = class("cutDownLabel", cc.load("mvc").ViewBase)
slot1.defaultProps = {
	delay = 0,
	dt = 1,
	str_key = "str"
}

function slot1.initExtend(slot0)
	if slot0.fontSize then
		slot0:setFontSize(slot0.fontSize)
	end

	if slot0.textColor then
		slot0:setTextColor(slot0.textColor)
	end

	slot0:enableSchedule()

	if slot0.onNode then
		slot0:onNode()
	end

	if slot0:setLabel(0) ~= false then
		slot0:schedule(function (slot0)
			uv1 = "setLabel"

			return slot1:setLabel(slot0)
		end, slot0.dt, slot0.dt + slot0.delay, slot0.tag)
	end
end

function slot1.setLabel(slot0, slot1)
	slot2 = 0

	if slot0.time then
		slot0.time = slot0.time - slot1
		slot2 = slot0.time
	elseif slot0.endTime then
		slot2 = slot0.endTime - time.getTime()
	end

	if slot0.strFunc then
		slot0:text(slot0.strFunc(time.getCutDown(math.max(slot2, 0))))
	else
		slot0:text(slot3[slot0.str_key])
	end

	if slot2 <= 0 then
		if slot0.endFunc then
			slot0.endFunc()
		end

		return false
	end

	if slot0.callFunc and slot0.callFunc(slot3) == false then
		return false
	end
end

return slot1
