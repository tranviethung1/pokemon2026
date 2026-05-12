slot0 = class("GiftLinkView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "kr_gift_link_view.json"
slot0.RESOURCE_BINDING = {
	btn = {
		binds = {
			clicksafe = true,
			event = "touch",
			methods = {
				ended = bindHelper.self("oneOpenUrl")
			}
		}
	}
}
slot0.RESOURCE_STYLES = {
	full = true
}

function slot0.onCreate(slot0)
	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		title = ""
	})
end

function slot0.oneOpenUrl(slot0)
	cc.Application:getInstance():openURL("https://play.google.com/store/apps/details?id=com.xp.kefu.google")
end

return slot0
