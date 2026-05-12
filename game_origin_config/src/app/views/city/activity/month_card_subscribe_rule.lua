slot0 = require("app.views.common.rule")
slot1 = class("ActivityMonthCardSubscribeRuleView", slot0)
slot1.RESOURCE_FILENAME = "activity_month_card_subscribe_rule.json"
slot1.RESOURCE_BINDING = clone(rawget(slot0, "RESOURCE_BINDING"))
slot1.RESOURCE_BINDING.btnOK = "btnOK"
slot1.RESOURCE_BINDING.btnCheckBox = "btnCheckBox"

function slot1.onCreate(slot0, slot1, slot2)
	uv3 = "onCreate"

	slot3.onCreate(slot0, slot1, slot2 or {})

	slot0.checkBoxSelect = idler.new(false)

	idlereasy.when(slot0.checkBoxSelect, function (slot0, slot1)
		slot2 = uiEasy.setBtnShader
		uv3 = "uiEasy"
		uv4 = "uiEasy"

		slot2(slot3.btnOK, slot4.btnOK:get("txt"), slot1 and 1 or 3)

		uv2 = "uiEasy"

		slot2.btnCheckBox:get("icon"):texture(slot1 and "common/icon/radio_selected.png" or "common/icon/radio_normal.png")
	end)
	bind.touch(slot0, slot0.btnCheckBox, {
		methods = {
			ended = function ()
				uv0 = "checkBoxSelect"

				slot0.checkBoxSelect:modify(function (slot0)
					return true, not slot0
				end)
			end
		}
	})
	bind.touch(slot0, slot0.btnOK, {
		methods = {
			ended = function ()
				uv0 = "checkBoxSelect"

				if not slot0.checkBoxSelect:read() then
					gGameUI:showTip(gLanguageCsv.monthCardSubscribeRule)

					return
				end

				uv1 = "checkBoxSelect"
				slot1 = slot1.addCallbackOnExit
				uv3 = "read"

				slot1(slot1, slot3.cb)

				uv1 = "checkBoxSelect"

				slot1:onClose()
			end
		}
	})
end

return slot1
