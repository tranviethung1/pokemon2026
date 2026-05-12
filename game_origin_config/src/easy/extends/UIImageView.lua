slot0 = ccui.ImageView
slot1 = getmetatable(slot0)
slot3 = getmetatable(cc.Node).getContentSize
slot4 = slot1.loadTexture
slot5 = slot1.create
slot6 = tolua.isnull

function slot0.texture(slot0, ...)
	slot0:loadTexture(...)

	return slot0
end
