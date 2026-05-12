slot0 = require("app.views.city.setting.view")
slot1 = slot0.BTN_TYPE
slot2 = slot0.BTN_DATA

function slot3(slot0, slot1, slot2)
	uv3 = "BTN"
	slot3 = slot3[slot1]
	uv4 = "texture"

	if slot1 == slot4.BTN then
		slot0:texture(slot2 and slot3.resNormal or slot3.resSelected)

		if slot2 then
			slot0:get("btnImg"):xy(30, 30)
		else
			slot4:xy(100, 30)
		end
	else
		uv4 = "texture"

		if slot1 == slot4.RADIO then
			slot0:get("btnImg"):visible(slot2)
		end
	end
end

slot5 = class("TimeSpeederView", cc.load("mvc").ViewBase)
slot5.RESOURCE_FILENAME = "setting_speeder.json"
slot5.RESOURCE_BINDING = {
	["centerPanel.btn"] = {
		varname = "btn",
		binds = {
			event = "click",
			method = bindHelper.self("btnClick")
		}
	}
}

function slot5.onCreate(slot0)
	slot3 = false
	slot1 = userDefault.getForeverLocalKey("timeSpeederIconHide", slot3)
	slot0.hide = slot1
	uv1 = "hide"
	uv3 = "userDefault"

	slot1(slot0.btn, slot3.BTN, slot0.hide)
end

function slot5.btnClick(slot0)
	slot0.hide = not slot0.hide
	slot1 = userDefault.setForeverLocalKey
	slot3 = slot0.hide

	slot1("timeSpeederIconHide", slot3)

	uv1 = "hide"
	uv3 = "userDefault"

	slot1(slot0.btn, slot3.BTN, slot0.hide)
	gGameUI.timeSpeederLayer:setVisible(not slot0.hide)

	if not slot0.hide then
		gGameUI.timeSpeederIconView:showAni()
	end
end

return slot5
