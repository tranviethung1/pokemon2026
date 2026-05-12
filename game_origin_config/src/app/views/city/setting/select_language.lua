slot0 = class("LanguageView", Dialog)
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
	}
}

function slot0.onCreate(slot0)
	Dialog.onCreate(slot0, {
		clickClose = false
	})
	slot0.btnLan_1:get("text"):text("English")
	slot0.btnLan_2:get("text"):text("ภาษาไทย")
	slot0.btnLan_3:get("text"):text("Português")
	slot0.btnLan_4:get("text"):text("Bahasa")
	slot0.btnLan_5:get("text"):text("한국어")
	slot0.btnLan_6:get("text"):text("Spanish")
	slot0.btnLan_7:hide()
end

function slot0.onConfirmBtn(slot0)
	gGameUI:showDialog({
		clearFast = true,
		btnType = 2,
		title = "Notice",
		content = "Exit the application and restart the application to change the selected language.",
		cb = function ()
			gGameApp:onBackLogin()
			cc.Director:getInstance():getScheduler():scheduleScriptFunc(function ()
				if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_IPHONE or slot0 == cc.PLATFORM_OS_IPAD then
					os.exit()
				else
					cc.Director:getInstance():endToLua()
				end
			end, 2, false)
		end,
		dialogParams = {
			clickClose = false
		}
	}, styles)
end

function slot0.onCancelBtn(slot0)
	slot0:onClose()
end

function slot0.OnbtnLan_1(slot0)
	gGameUI:showTip("Select language English")
	userDefault.setForeverLocalKey("OkamiLan", "en", {
		rawKey = true
	})
	gGameUI:showDialog({
		clearFast = true,
		btnType = 2,
		title = "Notice",
		content = "Exit the application and restart the application to change the selected language.",
		cb = function ()
			userDefault.setForeverLocalKey("OkamiLan", "en", {
				rawKey = true
			})
			userDefault.setForeverLocalKey("OkamiLan", "en", {
				rawKey = true
			})
			userDefault.setForeverLocalKey("OkamiLan", "en", {
				rawKey = true
			})
			userDefault.setForeverLocalKey("OkamiLan", "en", {
				rawKey = true
			})
			gGameApp:onBackLogin()
			cc.Director:getInstance():getScheduler():scheduleScriptFunc(function ()
				if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_IPHONE or slot0 == cc.PLATFORM_OS_IPAD then
					os.exit()
				else
					cc.Director:getInstance():endToLua()
				end
			end, 2, false)
		end,
		dialogParams = {
			clickClose = false
		}
	}, styles)
end

function slot0.OnbtnLan_2(slot0)
	gGameUI:showTip("เลือกภาษาไทย")
	userDefault.setForeverLocalKey("OkamiLan", "th", {
		rawKey = true
	})
	gGameUI:showDialog({
		clearFast = true,
		btnType = 2,
		title = "ความสนใจ",
		content = "ออกและเปิดแอปพลิเคชันอีกครั้งเพื่อเปลี่ยนภาษา.",
		cb = function ()
			userDefault.setForeverLocalKey("OkamiLan", "th", {
				rawKey = true
			})
			userDefault.setForeverLocalKey("OkamiLan", "th", {
				rawKey = true
			})
			userDefault.setForeverLocalKey("OkamiLan", "th", {
				rawKey = true
			})
			userDefault.setForeverLocalKey("OkamiLan", "th", {
				rawKey = true
			})
			gGameApp:onBackLogin()
			cc.Director:getInstance():getScheduler():scheduleScriptFunc(function ()
				if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_IPHONE or slot0 == cc.PLATFORM_OS_IPAD then
					os.exit()
				else
					cc.Director:getInstance():endToLua()
				end
			end, 2, false)
		end,
		dialogParams = {
			clickClose = false
		}
	}, styles)
end

function slot0.OnbtnLan_3(slot0)
	gGameUI:showTip("Português")
	userDefault.setForeverLocalKey("OkamiLan", "vn", {
		rawKey = true
	})
	gGameUI:showDialog({
		clearFast = true,
		btnType = 2,
		title = "Atenção",
		content = "Saia e reinicie o aplicativo para alterar o idioma",
		cb = function ()
			userDefault.setForeverLocalKey("OkamiLan", "vn", {
				rawKey = true
			})
			userDefault.setForeverLocalKey("OkamiLan", "vn", {
				rawKey = true
			})
			userDefault.setForeverLocalKey("OkamiLan", "vn", {
				rawKey = true
			})
			userDefault.setForeverLocalKey("OkamiLan", "vn", {
				rawKey = true
			})
			gGameApp:onBackLogin()
			cc.Director:getInstance():getScheduler():scheduleScriptFunc(function ()
				if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_IPHONE or slot0 == cc.PLATFORM_OS_IPAD then
					os.exit()
				else
					cc.Director:getInstance():endToLua()
				end
			end, 2, false)
		end,
		dialogParams = {
			clickClose = false
		}
	}, styles)
end

function slot0.OnbtnLan_4(slot0)
	gGameUI:showTip("Bahasa")
	userDefault.setForeverLocalKey("OkamiLan", "id", {
		rawKey = true
	})
	gGameUI:showDialog({
		clearFast = true,
		btnType = 2,
		title = "Perhatian",
		content = "Keluar dan luncurkan kembali aplikasi untuk mengubah bahasa",
		cb = function ()
			userDefault.setForeverLocalKey("OkamiLan", "id", {
				rawKey = true
			})
			userDefault.setForeverLocalKey("OkamiLan", "id", {
				rawKey = true
			})
			userDefault.setForeverLocalKey("OkamiLan", "id", {
				rawKey = true
			})
			userDefault.setForeverLocalKey("OkamiLan", "id", {
				rawKey = true
			})
			gGameApp:onBackLogin()
			cc.Director:getInstance():getScheduler():scheduleScriptFunc(function ()
				if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_IPHONE or slot0 == cc.PLATFORM_OS_IPAD then
					os.exit()
				else
					cc.Director:getInstance():endToLua()
				end
			end, 2, false)
		end,
		dialogParams = {
			clickClose = false
		}
	}, styles)
end

function slot0.OnbtnLan_5(slot0)
	gGameUI:showTip("한국어")
	userDefault.setForeverLocalKey("OkamiLan", "kr", {
		rawKey = true
	})
	gGameUI:showDialog({
		clearFast = true,
		btnType = 2,
		title = "통지",
		content = "선택한 언어를 변경하려면 애플리케이션을 종료하고 애플리케이션을 다시 시작하세요.",
		cb = function ()
			userDefault.setForeverLocalKey("OkamiLan", "kr", {
				rawKey = true
			})
			userDefault.setForeverLocalKey("OkamiLan", "kr", {
				rawKey = true
			})
			userDefault.setForeverLocalKey("OkamiLan", "kr", {
				rawKey = true
			})
			userDefault.setForeverLocalKey("OkamiLan", "kr", {
				rawKey = true
			})
			gGameApp:onBackLogin()
			cc.Director:getInstance():getScheduler():scheduleScriptFunc(function ()
				if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_IPHONE or slot0 == cc.PLATFORM_OS_IPAD then
					os.exit()
				else
					cc.Director:getInstance():endToLua()
				end
			end, 2, false)
		end,
		dialogParams = {
			clickClose = false
		}
	}, styles)
end

function slot0.OnbtnLan_6(slot0)
	gGameUI:showTip("Spanish")
	userDefault.setForeverLocalKey("OkamiLan", "es", {
		rawKey = true
	})
	gGameUI:showDialog({
		clearFast = true,
		btnType = 2,
		title = "Spanish",
		content = "Salga de la aplicación y reiníciela para cambiar el idioma seleccionado.",
		cb = function ()
			userDefault.setForeverLocalKey("OkamiLan", "es", {
				rawKey = true
			})
			userDefault.setForeverLocalKey("OkamiLan", "es", {
				rawKey = true
			})
			userDefault.setForeverLocalKey("OkamiLan", "es", {
				rawKey = true
			})
			userDefault.setForeverLocalKey("OkamiLan", "es", {
				rawKey = true
			})
			gGameApp:onBackLogin()
			cc.Director:getInstance():getScheduler():scheduleScriptFunc(function ()
				if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_IPHONE or slot0 == cc.PLATFORM_OS_IPAD then
					os.exit()
				else
					cc.Director:getInstance():endToLua()
				end
			end, 2, false)
		end,
		dialogParams = {
			clickClose = false
		}
	}, styles)
end

function slot0.OnbtnLan_7(slot0)
	gGameUI:showTip("한국어")
	userDefault.setForeverLocalKey("OkamiLan", "kr", {
		rawKey = true
	})
	gGameUI:showDialog({
		clearFast = true,
		btnType = 2,
		title = "통지",
		content = "선택한 언어를 변경하려면 애플리케이션을 종료하고 애플리케이션을 다시 시작하세요.",
		cb = function ()
			userDefault.setForeverLocalKey("OkamiLan", "kr", {
				rawKey = true
			})
			userDefault.setForeverLocalKey("OkamiLan", "kr", {
				rawKey = true
			})
			userDefault.setForeverLocalKey("OkamiLan", "kr", {
				rawKey = true
			})
			userDefault.setForeverLocalKey("OkamiLan", "kr", {
				rawKey = true
			})
			gGameApp:onBackLogin()
			cc.Director:getInstance():getScheduler():scheduleScriptFunc(function ()
				if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_IPHONE or slot0 == cc.PLATFORM_OS_IPAD then
					os.exit()
				else
					cc.Director:getInstance():endToLua()
				end
			end, 2, false)
		end,
		dialogParams = {
			clickClose = false
		}
	}, styles)
end

function slot0.quit(slot0)
	slot1 = cc.Application:getInstance():getTargetPlatform()

	cc.Director:getInstance():endToLua()
end

return slot0
