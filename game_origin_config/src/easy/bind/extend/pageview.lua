slot1 = require("easy.bind.helper")
slot2 = class("pageview", require("easy.bind.extend.listview"))
slot2.defaultProps = {}

function slot2.initExtend(slot0)
	slot1 = false
	slot0.backupCached = slot1
	uv1 = "backupCached"

	return slot1.initExtend(slot0)
end

function slot2.insertCustomItem(slot0, slot1, slot2)
	return slot0:insertPage(slot1, slot2)
end

function slot2.pushBackCustomItem(slot0, slot1)
	return slot0:addPage(slot1)
end

function slot2.removeItem(slot0, slot1)
	return slot0:removePageAtIndex(slot1)
end

function slot2.onAfterBuild_(slot0)
	slot0:setRenderHint(0)
	slot0:onAfterBuild()
end

return slot2
