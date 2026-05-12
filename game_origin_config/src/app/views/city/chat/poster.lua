slot0 = cc.load("mvc").ViewBase
slot1 = class("ChatPoster", Dialog)
slot1.RESOURCE_FILENAME = "chat_poster.json"
slot1.RESOURCE_BINDING = {
	pos0 = "pos0",
	pos1 = "pos1",
	pos2 = "pos2",
	btnClose = {
		varname = "btnClose",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot1.onCreate(slot0)
	Dialog.onCreate(slot0, {
		blackType = 1
	})

	slot1 = rich.createByStr("#C0x000000#" .. gLanguageCsv.preventFraudPosterTitle, 70)

	slot1:setAnchorPoint(0.5, 0.5)
	slot1:formatText()
	slot1:addTo(slot0:getResourceNode(), 10):xy(slot0.pos0:xy())

	slot4 = rich.createWithWidth("#C0x5b545b#" .. gLanguageCsv.preventFraudPosterDes1, matchLanguage({
		"tw"
	}) and 38 or 50, nil, 600)

	slot4:setAnchorPoint(matchLanguage({
		"tw"
	}) and 0.02 or 0, 0.5)
	slot4:formatText()
	slot4:addTo(slot0:getResourceNode(), 10):xy(slot0.pos1:xy())

	slot6 = rich.createWithWidth("#C0x5b545b#" .. gLanguageCsv.preventFraudPosterDes2, 50, nil, 600)

	slot6:formatText()
	slot6:setAnchorPoint(matchLanguage({
		"tw"
	}) and 0.06 or 0, 0.5)
	slot6:addTo(slot0:getResourceNode(), 10):xy(slot0.pos2:xy())
end

return slot1
