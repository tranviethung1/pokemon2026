slot1 = ccs.GUIReader:getInstance()
slot2 = display.director:getTextureCache()

return {
	getWidget = function (slot0)
		uv1 = "widgetFromJsonFile"
		slot1 = slot1:widgetFromJsonFile(slot0)

		translateUI(slot1)
		adaptUI(slot1, slot0)

		return slot1
	end
}
