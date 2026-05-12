slot0 = class("OkamiPay", Dialog)
slot0.RESOURCE_FILENAME = "OkamiPay.json"
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
	title = {
		varname = "title"
	}
}

function slot0.onCreate(slot0)
	Dialog.onCreate(slot0, {
		clickClose = false
	})
	slot0.btnLan_1:get("text"):text("Web Pack 5$")
	slot0.btnLan_2:get("text"):text("Web pack 20$")
	slot0.btnLan_3:get("text"):text("Web pack 50$")
	slot0.btnLan_4:get("text"):text("Web pack 100$")
	slot0.btnLan_5:get("text"):text("Web pack 150$")
	slot0.btnLan_6:get("text"):text("Web pack 200$")
	slot0.title:text("Choose a recharge package")
end

function slot0.onConfirmBtn(slot0)
end

function slot0.onCancelBtn(slot0)
	slot0:onClose()
end

function slot0.OnbtnLan_1(slot0)
	sdk.callPlatformFunc("pay", json.encode({
		skuId = "megamonpack1",
		area = gGameApp.serverInfo.name,
		level = tostring(gGameModel.role:read("level")),
		role_name = gGameModel.role:read("name"),
		vip = tostring(gGameModel.role:read("vip_level")),
		username = gGameModel.account:read("name"),
		serverId = tostring(gGameModel.role:read("area")),
		roleId = tostring(gGameModel.role:read("uid"))
	}), function (slot0)
		print("pay ret = ", slot0)

		if slot0 == "ok" then
			gGameUI:showTip("Ok")
		else
			gGameUI:showTip("Error")
		end
	end)
end

function slot0.OnbtnLan_2(slot0)
	sdk.callPlatformFunc("pay", json.encode({
		skuId = "megamonpack2",
		area = gGameApp.serverInfo.name,
		level = tostring(gGameModel.role:read("level")),
		role_name = gGameModel.role:read("name"),
		vip = tostring(gGameModel.role:read("vip_level")),
		username = gGameModel.account:read("name"),
		serverId = tostring(gGameModel.role:read("area")),
		roleId = tostring(gGameModel.role:read("uid"))
	}), function (slot0)
		print("pay ret = ", slot0)

		if slot0 == "ok" then
			gGameUI:showTip("Ok")
		else
			gGameUI:showTip("Error")
		end
	end)
end

function slot0.OnbtnLan_3(slot0)
	sdk.callPlatformFunc("pay", json.encode({
		skuId = "megamonpack3",
		area = gGameApp.serverInfo.name,
		level = tostring(gGameModel.role:read("level")),
		role_name = gGameModel.role:read("name"),
		vip = tostring(gGameModel.role:read("vip_level")),
		username = gGameModel.account:read("name"),
		serverId = tostring(gGameModel.role:read("area")),
		roleId = tostring(gGameModel.role:read("uid"))
	}), function (slot0)
		print("pay ret = ", slot0)

		if slot0 == "ok" then
			gGameUI:showTip("Ok")
		else
			gGameUI:showTip("Error")
		end
	end)
end

function slot0.OnbtnLan_4(slot0)
	sdk.callPlatformFunc("pay", json.encode({
		skuId = "megamonpack4",
		area = gGameApp.serverInfo.name,
		level = tostring(gGameModel.role:read("level")),
		role_name = gGameModel.role:read("name"),
		vip = tostring(gGameModel.role:read("vip_level")),
		username = gGameModel.account:read("name"),
		serverId = tostring(gGameModel.role:read("area")),
		roleId = tostring(gGameModel.role:read("uid"))
	}), function (slot0)
		print("pay ret = ", slot0)

		if slot0 == "ok" then
			gGameUI:showTip("Ok")
		else
			gGameUI:showTip("Error")
		end
	end)
end

function slot0.OnbtnLan_5(slot0)
	sdk.callPlatformFunc("pay", json.encode({
		skuId = "megamonpack5",
		area = gGameApp.serverInfo.name,
		level = tostring(gGameModel.role:read("level")),
		role_name = gGameModel.role:read("name"),
		vip = tostring(gGameModel.role:read("vip_level")),
		username = gGameModel.account:read("name"),
		serverId = tostring(gGameModel.role:read("area")),
		roleId = tostring(gGameModel.role:read("uid"))
	}), function (slot0)
		print("pay ret = ", slot0)

		if slot0 == "ok" then
			gGameUI:showTip("Ok")
		else
			gGameUI:showTip("Error")
		end
	end)
end

function slot0.OnbtnLan_6(slot0)
	sdk.callPlatformFunc("pay", json.encode({
		skuId = "megamonpack6",
		area = gGameApp.serverInfo.name,
		level = tostring(gGameModel.role:read("level")),
		role_name = gGameModel.role:read("name"),
		vip = tostring(gGameModel.role:read("vip_level")),
		username = gGameModel.account:read("name"),
		serverId = tostring(gGameModel.role:read("area")),
		roleId = tostring(gGameModel.role:read("uid"))
	}), function (slot0)
		print("pay ret = ", slot0)

		if slot0 == "ok" then
			gGameUI:showTip("Ok")
		else
			gGameUI:showTip("Error")
		end
	end)
end

function slot0.OkamiPayClick(slot0, slot1)
	sdk.callPlatformFunc("pay", json.encode({
		skuId = "megamonpack1",
		username = gGameModel.account:read("name"),
		serverId = tostring(gGameModel.role:read("area")),
		roleId = tostring(gGameModel.role:read("uid"))
	}), function (slot0)
		print("pay ret = ", slot0)

		if slot0 == "ok" then
			gGameUI:showTip("Ok")
		else
			gGameUI:showTip("Error")
		end
	end)
end

return slot0
