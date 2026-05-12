slot0 = class("RoleDayAwardView", Dialog)
slot0.RESOURCE_FILENAME = "activity_role_day_award.json"
slot0.RESOURCE_BINDING = {
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["panelEnvelope.btnOpen"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onOpenClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.activityID = slot1

	Dialog.onCreate(slot0, {
		blackType = 1
	})
end

function slot0.onOpenClick(slot0)
	slot1 = slot0.activityID

	slot0:addCallbackOnExit(function ()
		uv5 = "gGameUI"

		gGameUI:stackUI("city.activity.role_day_award.open", nil, , slot5)
	end)
	Dialog.onCloseFast(slot0)
end

return slot0
