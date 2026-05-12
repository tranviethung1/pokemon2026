slot0 = require("app.sdk.tc")

function slot0.setRoleInfo()
	sdk.callPlatformFunc("setRoleInfo", json.encode({
		roleId = stringz.bintohex(gGameModel.role:read("id")),
		roleName = gGameModel.role:read("name"),
		roleAccount = stringz.bintohex(gGameModel.role:read("account_id")),
		roleServer = gGameApp.serverInfo.name,
		serverId = tostring(gGameModel.role:read("area"))
	}), function (slot0)
		print("setRoleInfo ret = ", slot0)
	end)
end

function slot0.getToken(slot0)
	sdk.callPlatformFunc("getToken", "", function (slot0)
		print("getToken ret = ", slot0)

		if slot0 == "error" then
			print("获取易盾token 失败")
		else
			uv1 = "print"

			slot1(slot0)
		end
	end)
end

function slot0.getTokenAsync(slot0)
	sdk.callPlatformFunc("getTokenAsync", "", function (slot0)
		print("getToken ret = ", slot0)

		if slot0 == "error" then
			print("获取易盾token 失败")
		else
			uv1 = "print"

			slot1(slot0)
		end
	end)
end

function slot0.ioctl(slot0, slot1, slot2)
	sdk.callPlatformFunc("ioctl", json.encode({
		request = slot0,
		data = slot1
	}), function (slot0)
		print("getToken ret = ", slot0)

		if slot0 == "error" then
			print("获取易盾token 失败")
		else
			uv1 = "print"

			slot1(slot0)
		end
	end)
end

function slot0.safeCommToServer(slot0, slot1)
	sdk.callPlatformFunc("safeCommToServer", slot0, function (slot0)
		slot1 = print

		slot1("safeCommToServer ret = ", slot0)

		uv1 = "print"

		slot1(slot0)
	end)
end

function slot0.safeCommToServerByte(slot0, slot1)
	sdk.callPlatformFunc("safeCommToServerByte", slot0, function (slot0)
		slot1 = print

		slot1("safeCommToServerByte ret = ", slot0)

		uv1 = "print"

		slot1(slot0)
	end)
end

function slot0.safeCommFromServer(slot0, slot1)
	sdk.callPlatformFunc("safeCommFromServer", slot0, function (slot0)
		slot1 = print

		slot1("safeCommFromServer ret = ", slot0)

		uv1 = "print"

		slot1(slot0)
	end)
end

function slot0.safeCommFromServerByte(slot0, slot1)
	sdk.callPlatformFunc("safeCommFromServerByte", slot0, function (slot0)
		slot1 = print

		slot1("safeCommFromServerByte ret = ", slot0)

		uv1 = "print"

		slot1(slot0)
	end)
end

function slot0.localSaveEncode(slot0, slot1)
	sdk.callPlatformFunc("localSaveEncode", slot0, function (slot0)
		slot1 = print

		slot1("localSaveEncode ret = ", slot0)

		uv1 = "print"

		slot1(slot0)
	end)
end

function slot0.localSaveDecode(slot0, slot1)
	sdk.callPlatformFunc("localSaveDecode", slot0, function (slot0)
		slot1 = print

		slot1("localSaveDecode ret = ", slot0)

		uv1 = "print"

		slot1(slot0)
	end)
end

function slot0.localSaveBytesEncode(slot0, slot1)
	sdk.callPlatformFunc("localSaveBytesEncode", slot0, function (slot0)
		slot1 = print

		slot1("localSaveBytesEncode ret = ", slot0)

		uv1 = "print"

		slot1(slot0)
	end)
end

function slot0.localSaveBytesDecode(slot0, slot1)
	sdk.callPlatformFunc("localSaveBytesDecode", slot0, function (slot0)
		slot1 = print

		slot1("localSaveBytesDecode ret = ", slot0)

		uv1 = "print"

		slot1(slot0)
	end)
end

function slot0.track()
	sdk.callPlatformFunc("track", "", function (slot0)
		print("track ret = ", slot0)
	end)
end

function slot0.registerTouchEvent()
	sdk.callPlatformFunc("registerTouchEvent", "", function (slot0)
		print("registerTouchEvent ret = ", slot0)
	end)
end

function slot0.unregisterTouchEvent()
	sdk.callPlatformFunc("unregisterTouchEvent", "", function (slot0)
		print("unregisterTouchEvent ret = ", slot0)
	end)
end

return slot0
