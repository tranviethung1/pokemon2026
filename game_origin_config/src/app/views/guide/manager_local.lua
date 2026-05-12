slot0 = table.insert
slot1 = require("app.views.guide.manager")
slot2 = class("GuideManagerLocal", slot1)
slot3 = slot1.NextGuideActionTag

function slot2.ctor(slot0)
	slot0.curGuideId = nil
	slot0.inGuiding = false
	slot0.guidePanel = nil
	slot0.ignoreGuide = false
	slot0.choicesFunc = nil
	slot1 = {}

	for slot6, slot7 in orderCsvPairs(csv.new_guide_local) do
		if nil ~= slot7.stage and not slot1[slot7.stage] then
			slot2 = slot7.stage
			slot1[slot7.stage] = {
				begin = slot6,
				specialName = slot7.specialName
			}
		end
	end

	slot0.guideCsv = csv.new_guide_local
	slot0.stageCsv = slot1
end

function slot2.checkFinished(slot0, slot1)
	for slot6, slot7 in ipairs(userDefault.getForeverLocalKey("guideLocal", {})) do
		if slot1 == slot7 then
			return true
		end
	end

	return false
end

function slot2.onSaveStage(slot0, slot1, slot2)
	if not arraytools.hash(userDefault.getForeverLocalKey("guideLocal", {}))[slot2] then
		uv5 = "userDefault"

		slot5(slot3, slot2)
		userDefault.setForeverLocalKey("guideLocal", slot3, {
			new = true
		})
		printInfo("save guide local stage: " .. slot2)

		if slot1 then
			slot1()
		end
	else
		gGameUI:showTip("guideID error")
	end
end

function slot2.checkGuide(slot0, slot1)
	slot1 = slot1 or {}

	log.guide("local check name:", slot1.name, "specialName:", slot1.specialName, "isInGuiding:", slot0:isInGuiding(), slot0.ignoreGuide, slot0.continueLastGuide)

	if dev.GUIDE_CLOSED or FOR_SHENHE or slot0.ignoreGuide then
		return
	end

	if gGameUI.rootViewName == "login.view" then
		return
	end

	slot2 = userDefault.getForeverLocalKey("guideLocal", {})

	if slot0:isInGuiding() then
		return
	end

	if slot0.continueLastGuide then
		slot0.curGuideId = slot0.continueLastGuide
		slot0.continueLastGuide = nil
		slot0.inGuiding = true

		slot0:nextGuide()

		return true
	end

	slot0.curGuideId = nil

	if not slot0.orderStageCsv then
		slot0.orderStageCsv = {}

		for slot7, slot8 in pairs(slot0.stageCsv) do
			if not arraytools.hash(slot2)[slot7] then
				uv9 = "log"

				slot9(slot0.orderStageCsv, slot0.guideCsv[slot8.begin])
			end
		end

		table.sort(slot0.orderStageCsv, function (slot0, slot1)
			if slot0.order ~= slot1.order then
				return slot0.order < slot1.order
			end

			return slot0.stage < slot1.stage
		end)
	end

	for slot6, slot7 in ipairs(slot0.orderStageCsv) do
		if slot0:canTriggerGuide(slot7, slot1) then
			table.remove(slot0.orderStageCsv, slot6)
			slot0:triggerGuide(slot7.id, slot1)

			return true
		end
	end
end

function slot2.triggerGuide(slot0, slot1, slot2)
	slot3 = "local trigger:"
	slot2.log = slot3
	uv3 = "log"

	slot3.triggerGuide(slot0, slot1, slot2)
end

function slot2.quiteGiveAward(slot0, slot1, slot2, slot3)
	printWarn("local guide no award")
	slot0:nextGuide(slot3)
end

function slot2.onDeleteStage(slot0, slot1)
	if dev.GUIDE_CLOSED or FOR_SHENHE or slot0.ignoreGuide or not slot1 then
		return false
	end

	for slot6, slot7 in ipairs(userDefault.getForeverLocalKey("guideLocal", {})) do
		if slot1 == slot7 then
			table.remove(slot2, slot6)

			slot8 = userDefault.setForeverLocalKey

			slot8("guideLocal", slot2, {
				new = true
			})

			uv8 = "dev"

			slot8(slot0.orderStageCsv, slot0.guideCsv[slot0.stageCsv[slot1].begin])
			printInfo("del guide local stage: " .. slot1)

			return true
		end
	end

	return false
end

return slot2
