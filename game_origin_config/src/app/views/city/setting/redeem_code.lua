slot0 = class("SettingRedeemCodeView", Dialog)
slot0.RESOURCE_FILENAME = "setting_redeem_code.json"
slot0.RESOURCE_BINDING = {
	textField = "textField",
	btnClose = {
		varname = "btnClose",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnCancel = {
		varname = "btnCancel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onCancelBtn")
			}
		}
	},
	btnComfirm = {
		varname = "btnComfirm",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onConfirmBtn")
			}
		}
	}
}

function slot1(slot0)
	return slot0 >= 48 and slot0 <= 57
end

function slot2(slot0)
	return slot0 >= 65 and slot0 <= 90
end

function slot3(slot0)
	return slot0 >= 97 and slot0 <= 122
end

function slot4(slot0)
	slot1 = false
	slot2 = 1

	while slot2 <= #slot0 do
		for slot9 = 1, string.utf8charlen(string.byte(slot0, slot2)) do
			slot5 = "" .. string.format("%x", string.byte(slot0, slot2 + slot9 - 1, slot2 + slot9 - 1))
		end

		slot7 = slot5
		uv7 = "string"

		if not slot7(tonumber(slot7, 16)) then
			uv7 = "byte"

			if not slot7(slot6) then
				uv7 = "utf8charlen"
				slot7 = slot7(slot6)
			end
		end

		if not slot7 then
			return true, {
				slot2
			}
		end

		slot2 = slot2 + slot4
	end

	return false
end

function slot5(slot0)
	slot1 = ""
	uv2 = ""
	slot2, slot3 = slot2(slot0)

	if slot2 then
		table.sort(slot3, function (slot0, slot1)
			return slot1 < slot0
		end)

		for slot7, slot8 in ipairs(slot3) do
			slot0 = string.sub(slot0, 1, slot8 - 1) .. slot1 .. string.sub(slot0, slot8 + string.utf8charlen(string.byte(slot0, slot8)))
		end
	end

	return slot0
end

function slot0.onCreate(slot0)
	slot0.textField:addEventListener(function (slot0, slot1)
		if slot1 == ccui.TextFiledEventType.insert_text then
			uv2 = "ccui"
			uv4 = "TextFiledEventType"
			uv5 = "ccui"

			slot2:setText(slot4(slot5:text()))
		end
	end)
	slot0.textField:setPlaceHolderColor(ui.COLORS.DISABLED.GRAY)
	slot0.textField:setTextColor(ui.COLORS.NORMAL.DEFAULT)
	slot0.textField:setTextHorizontalAlignment(cc.TEXT_ALIGNMENT_CENTER)
	Dialog.onCreate(slot0, {
		clickClose = false
	})
end

function slot0.onConfirmBtn(slot0)
	gGameApp:requestServer("/game/gift", function (slot0)
		gGameUI:showGainDisplay(slot0.view.award)
	end, slot0.textField:getStringValue())
end

function slot0.onCancelBtn(slot0)
	slot0:onClose()
end

return slot0
