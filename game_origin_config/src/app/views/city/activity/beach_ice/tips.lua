slot0 = {
	closed = 1,
	start = 2,
	play = 3
}
slot1 = cc.load("mvc").ViewBase
slot2 = class("BeachIceTipsView", Dialog)
slot2.RESOURCE_FILENAME = "beach_ice_tip.json"
slot2.RESOURCE_BINDING = {
	text = "panelText",
	textNum = "timeText",
	title = "titleLabel",
	content = "contentLabel",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnOK = {
		varname = "btnOK",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClickOK")
			}
		}
	},
	btnCancel = {
		varname = "btnCancel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnOkCenter = {
		varname = "btnOkCenter",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClickOK")
			}
		}
	},
	["btnOkCenter.title"] = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	slot0:enableSchedule()

	slot1 = slot1 or {}
	slot0.params = slot1
	slot0._okcb = slot1.cb
	slot2 = slot1.time
	slot3, slot4 = slot0.btnOK:getPosition()

	if slot1.title then
		slot0.titleLabel:text(slot1.title)
	end

	slot0.btnOK:show()
	slot0.btnCancel:show()

	slot7, slot8 = beauty.textScroll({
		margin = 20,
		isRich = true,
		size = slot0.contentLabel:size(),
		fontSize = slot1.fontSize or 50,
		effect = {
			color = ui.COLORS.NORMAL.DEFAULT
		},
		strs = slot1.content or slot1.strs,
		verticalSpace = slot1.verticalSpace or 10,
		align = slot1.align or "center"
	})
	slot9 = 0

	if slot8 < slot5.height then
		slot9 = -(slot5.height - slot8) / 2
	end

	slot7:addTo(slot0.contentLabel, 10):y(slot9)

	slot10 = slot1.dialogParams or {}
	slot10.clearFast = slot10.clearFast or slot1.clearFast
	slot11 = slot0:enableSchedule()
	slot12 = slot11

	slot11.schedule(slot12, function ()
		uv0 = "timeText"
		slot0 = slot0.timeText
		slot0 = slot0.text
		uv2 = "text"

		slot0(slot0, slot2)

		uv0 = "text"

		if slot0 <= 0 then
			uv0 = "timeText"
			slot0 = slot0.unSchedule

			slot0(slot0, "countdownLess")

			uv0 = "timeText"

			slot0:onClickOK()
		end

		uv0 = "text"
		slot0 = slot0 - 1
		uv1 = 1
	end, 1, 0, "countdownLess")

	uv12 = "enableSchedule"

	if slot1.state == slot12.start then
		slot0:unSchedule("countdownLess")
		slot0.timeText:hide()
		slot0.panelText:hide()
	end

	Dialog.onCreate(slot0, slot10)
end

function slot2.onClickOK(slot0)
	performWithDelay(slot0, function ()
		uv0 = "addCallbackOnExit"
		slot1 = slot0
		uv2 = "addCallbackOnExit"

		slot0.addCallbackOnExit(slot1, slot2._okcb)

		uv1 = "addCallbackOnExit"

		Dialog.onClose(slot1)
	end, 0)
end

function slot2.onClose(slot0)
	Dialog.onClose(slot0)
end

return slot2
