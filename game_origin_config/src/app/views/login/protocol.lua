slot0 = {
	info1 = "请你务必审慎阅读、充分理解“服务协议”和“隐私政策”各条款，包括但不限于：为了向你提供即时通讯，内容分享等服务，我们需要收集你的设备信息、操作日志等个人信息。你可以在“设置”中查看、变更、删除个人信息并管理你的授权。",
	info3 = "《隐私政策和用户协议》",
	info6 = "了解详细信息。如你同意，请点击“同意”开始接受我们的服务。",
	info2 = "你可阅读",
	url = "http://page.kuyangsh.cn/site/privacy?key=08a412053778cad3de9a8fcddb7e21582d3cfda0 ",
	title = "服务协议和隐私政策"
}
slot1 = cc.load("mvc").ViewBase
slot2 = class("LoginProtocolView", Dialog)
slot2.RESOURCE_FILENAME = "login_protocol.json"
slot2.RESOURCE_BINDING = {
	labelTitle = "labelTitle",
	btnDel = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnDel")
			}
		}
	},
	["btnDel.text"] = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	btnAgree = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnAgree")
			}
		}
	},
	["btnAgree.text"] = {
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

function slot2.onCreate(slot0)
	uv3 = "labelTitle"

	slot0.labelTitle:text(slot3.title):setFontSize(60)

	uv4 = "labelTitle"
	slot4 = slot4.info1
	uv4 = "labelTitle"
	uv5 = "labelTitle"
	uv6 = "labelTitle"
	uv7 = "labelTitle"

	slot0:getResourceNode():addChild(rich.createWithWidth(table.concat({
		string.format("#C0x5B545B##F50#%s\n", slot4),
		string.format("#C0x5B545B##F50#%s#C0x75C4FF##L00010100##LUL%s#%s#C0x5B545B#%s", slot4.info2, slot5.url, slot6.info3, slot7.info6)
	}), 40, nil, 1150):anchorPoint(cc.p(0, 1)):xy(706 + display.uiOrigin.x, 920), 1, "richText")
	Dialog.onCreate(slot0, {
		clearFast = true,
		clickClose = false
	})
end

function slot2.onBtnDel(slot0)
	display.director:endToLua()
end

function slot2.onBtnAgree(slot0)
	slot0:addCallbackOnExit(slot0.cb)
	userDefault.setForeverLocalKey("protocalStatusSign", true, {
		rawKey = true
	})
	Dialog.onClose(slot0)
end

return slot2
