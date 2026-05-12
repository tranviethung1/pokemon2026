slot0 = class("SettingView", Dialog)
slot1 = {
	RADIO = 1,
	BTN = 2
}
slot0.BTN_TYPE = slot1
slot0.BTN_DATA = {
	[slot1.RADIO] = {
		resNormal = "common/icon/radio_normal.png",
		resSelected = "common/icon/radio_normal.png",
		resBtnImg = "common/icon/radio_selected.png"
	},
	[slot1.BTN] = {
		resNormal = "city/setting/btn_off.png",
		resSelected = "city/setting/btn_on.png",
		resBtnImg = "common/btn/btn_inner_close.png"
	}
}
slot0.RESOURCE_FILENAME = "setting.json"
slot0.RESOURCE_BINDING = {
	titleBg = "titleBg",
	bg = "bg",
	title = "title",
	btnClose = {
		varname = "btnClose",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	normalBtn = {
		varname = "normalBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnClick")
			}
		}
	},
	voiceBtn = {
		varname = "voiceBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnClick")
			}
		}
	}
}

function slot0.onCreate(slot0)
	slot0.btns = {
		[slot0.normalBtn] = {
			name = "city.setting.normal"
		},
		[slot0.voiceBtn] = {
			name = "city.setting.voice"
		}
	}
	slot0.curBtn = idler.new(slot0.voiceBtn)

	slot0.curBtn:addListener(function (slot0, slot1)
		uv3 = "pairs"

		for slot5, slot6 in pairs(slot3.btns) do
			slot7 = slot5 == slot0

			slot5:get("select"):visible(slot7)
			slot5:get("text"):color(slot7 and ui.COLORS.WHITE or cc.c4b(241, 61, 86, 255)):anchorPoint(slot7 and 0.7 or 0.35, 0.5):setFontSize(slot7 and 50 or 40)
			adapt.setAutoText(slot5:get("text"), nil, slot5:size().height - 20)

			if not slot6.view then
				uv15 = "pairs"
				slot6.view = gGameUI:createView(slot6.name, slot15:getResourceNode()):init():x(display.uiOrigin.x)
			end

			slot6.view:visible(slot7)
		end
	end)
	slot0.curBtn:set(slot0.normalBtn)
	Dialog.onCreate(slot0)
end

function slot0.onBtnClick(slot0, slot1, slot2)
	slot0.curBtn:set(slot2.target)
end

return slot0
