slot0 = class("NapView", Dialog)
slot2 = cc.FileUtils:getInstance():getValueMapFromFile("res/version.plist")
slot0.RESOURCE_FILENAME = "setting_language.json"
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
	},
	btnLan_1 = {
		varname = "btnLan_1",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("OnbtnLan_1")
			}
		}
	},
	btnLan_2 = {
		varname = "btnLan_2",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("OnbtnLan_2")
			}
		}
	},
	btnLan_3 = {
		varname = "btnLan_3",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("OnbtnLan_3")
			}
		}
	},
	btnLan_4 = {
		varname = "btnLan_4",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("OnbtnLan_4")
			}
		}
	},
	btnLan_5 = {
		varname = "btnLan_5",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("OnbtnLan_5")
			}
		}
	},
	btnLan_6 = {
		varname = "btnLan_6",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("OnbtnLan_6")
			}
		}
	},
	btnLan_7 = {
		varname = "btnLan_7",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("OnbtnLan_7")
			}
		}
	},
	title = {
		varname = "title"
	}
}

function slot0.onCreate(slot0)
	Dialog.onCreate(slot0, {
		clickClose = false
	})
	slot0.btnLan_1:get("text"):text("Google Pay")
	slot0.btnLan_2:hide()
	slot0.btnLan_4:hide()
	slot0.btnLan_5:hide()
	slot0.btnLan_6:hide()
	slot0.btnLan_7:hide()
	slot0.btnLan_3:get("text"):text("Other")
	slot0.title:text("Select a payment method")
end

function slot0.onConfirmBtn(slot0)
end

function slot0.onCancelBtn(slot0)
	slot0:onClose()
end

function slot0.OnbtnLan_1(slot0)
	gGameUI:showTip("Feature is being tested.")
	gGameUI:stackUI("okami_dev.OkamiPay", nil)
end

function slot0.OnbtnLan_2(slot0)
end

function slot0.OnbtnLan_3(slot0)
	slot1 = gGameModel.account:read("name")

	cc.Application:getInstance():openURL(string.format("%s/quicklogin.php?data=%s&username=%s", APILINK, md5(777654645654.0 .. slot1), slot1))
end

return slot0
