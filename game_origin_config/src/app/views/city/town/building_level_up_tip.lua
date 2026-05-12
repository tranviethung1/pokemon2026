slot0 = class("TownBuildingLevelUpTipView", Dialog)
slot1 = 1
slot0.RESOURCE_FILENAME = "town_building_level_up_tip.json"
slot0.RESOURCE_BINDING = {
	title = "titleLabel",
	content = "contentLabel",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnOK = {
		varname = "btnOK",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClickOK")
			}
		}
	},
	btnCancel = {
		varname = "btnCancel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onCancel")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot1 = slot1 or {}
	slot0.params = slot1
	slot0._okcb = slot1.cb
	slot0._closecb = slot1.closeCb
	slot0._cancelcb = slot1.cancelCb
	slot0._finishcb = slot1.finishCb
	slot2 = slot1.buildingId

	if slot1.closeTime then
		slot0:enableSchedule():schedule(function ()
			uv0 = "closeTime"
			slot0 = slot0.closeTime - time.getTime()
			slot1 = time.getCutDown(slot0)

			if slot0 <= 0 then
				uv2 = "time"

				slot2:onFinish()

				return false
			end

			uv3 = "getTime"
			slot2 = townDataEasy.getCostNum(slot3)

			if slot0 <= gCommonConfigCsv.buildingCompletionFree * 60 then
				slot2 = 0
			end

			uv6 = "closeTime"
			slot5 = string.format(gLanguageCsv.buildingsLevelUpTips, gTownBuildingCsv[slot6.buildingId][1].name, slot1.short_date_str, slot2)
			slot4 = rich.createWithWidth(slot5, 50, nil, 1000)
			uv5 = "time"
			slot5 = slot5.contentLabel
			slot5 = slot5.removeAllChildren

			slot5(slot5)

			uv5 = "time"
			slot7 = slot4

			slot5.contentLabel:addChild(slot7)

			uv7 = "time"
			slot7 = slot7.contentLabel:width() / 2

			slot4:x(slot7)

			uv7 = "time"

			slot4:y(slot7.contentLabel:height() / 2)
		end, 1, 0, "closeTime")
	end

	slot3 = slot1.dialogParams or {}
	slot3.clearFast = slot3.clearFast or slot1.clearFast

	Dialog.onCreate(slot0, slot3)
end

function slot0.onClickOK(slot0)
	slot0:addCallbackOnExit(slot0._okcb)
	Dialog.onClose(slot0)

	return slot0
end

function slot0.onCancel(slot0)
	slot0:addCallbackOnExit(slot0._cancelcb)
	slot0:onClose()
end

function slot0.onClose(slot0)
	slot0:addCallbackOnExit(slot0._closecb, true)
	Dialog.onClose(slot0)

	return slot0
end

function slot0.onFinish(slot0)
	slot0:addCallbackOnExit(slot0._finishcb, true)
	Dialog.onClose(slot0)

	return slot0
end

return slot0
