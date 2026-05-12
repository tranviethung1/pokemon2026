slot1 = class("ActivityBossShowView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "activity_boss_show.json"
slot1.RESOURCE_BINDING = {
	closePanel = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	gGameUI:disableTouchDispatch(0.5)
end

function slot1.onClose(slot0)
	uv1 = "onClose"

	slot1.onClose(slot0)
end

return slot1
