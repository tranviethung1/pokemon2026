slot0 = class("CaptureTips", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "common_capture_tips.json"
slot0.RESOURCE_BINDING = {
	imgBG = {
		varname = "bg",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onEnterCaptureClick")
			}
		}
	}
}

function slot0.onEnterCaptureClick(slot0)
	slot0:removeSelf()
	gGameUI:stackUI("city.capture.capture_limit", nil, {
		full = true
	})
end

function slot0.onEnter(slot0)
	slot1 = cc.p(slot0.bg:xy())

	slot0.bg:runAction(cc.Sequence:create(cc.Place:create(cc.p(slot1.x - 500, slot1.y)), cc.EaseBackOut:create(cc.MoveTo:create(0.5, slot1))))
end

return slot0
