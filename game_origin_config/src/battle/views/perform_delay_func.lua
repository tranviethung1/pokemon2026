require("battle.views.manage_cd")

slot0 = class("PerformDelayFunc")
globals.PerformDelayFunc = slot0

function slot0.ctor(slot0, slot1, slot2, slot3)
	slot0.startCd = CManageCd.new(slot1)
	slot0.func = slot2
	slot0.args = slot3
	slot0.processOver = false
end

function slot0.isOver(slot0)
	if slot0.processOver then
		return true
	end

	return false
end

function slot0.update(slot0, slot1)
	slot0.startCd:update(slot1)

	if slot0.startCd:isCdOk() then
		slot0.processOver = true

		if slot0.args then
			slot0.func(unpack(slot0.args))
		else
			slot0.func()
		end
	end
end
