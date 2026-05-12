return {
	setRoleInfo = function ()
		sdk.callPlatformFunc("setRoleInfoYD", json.encode({
			roleId = stringz.bintohex(gGameModel.role:read("id")),
			roleName = gGameModel.role:read("name"),
			roleAccount = stringz.bintohex(gGameModel.role:read("account_id")),
			roleServer = gGameApp.serverInfo.name,
			serverId = tostring(gGameModel.role:read("area"))
		}), function (slot0)
			print("yidun.setRoleInfoYD ret = ", slot0)
		end)
	end,
	getToken = function (slot0)
		sdk.callPlatformFunc("getTokenYD", "", function (slot0)
			uv1 = "token"
			slot1.token = slot0

			if slot0 == "error" then
				uv1 = "error"

				slot1("")
			else
				uv1 = "error"

				slot1(slot0)
			end
		end)
	end,
	getTokenAsync = function (slot0)
		sdk.callPlatformFunc("getTokenAsyncYD", "", function (slot0)
			print("yidun.getTokenAsyncYD ret = ", slot0)

			if slot0 == "error" then
				uv1 = "print"

				slot1("")
			else
				uv1 = "print"

				slot1(slot0)
			end
		end)
	end,
	ioctl = function (slot0, slot1, slot2)
		sdk.callPlatformFunc("ioctlYD", json.encode({
			request = slot0,
			data = slot1
		}), function (slot0)
			print("yidun.ioctlYD ret = ", slot0)

			if slot0 == "error" then
				print("查询失败")
			else
				uv1 = "print"

				slot1(slot0)
			end
		end)
	end,
	safeCommToServer = function (slot0, slot1)
		sdk.callPlatformFunc("safeCommToServerYD", slot0, function (slot0)
			slot1 = print

			slot1("yidun.safeCommToServerYD ret = ", slot0)

			uv1 = "print"

			slot1(slot0)
		end)
	end,
	safeCommToServerByte = function (slot0, slot1)
		sdk.callPlatformFunc("safeCommToServerByteYD", slot0, function (slot0)
			slot1 = print

			slot1("yidun.safeCommToServerByteYD ret = ", slot0)

			uv1 = "print"

			slot1(slot0)
		end)
	end,
	safeCommFromServer = function (slot0, slot1)
		sdk.callPlatformFunc("safeCommFromServerYD", slot0, function (slot0)
			slot1 = print

			slot1("yidun.safeCommFromServerYD ret = ", slot0)

			uv1 = "print"

			slot1(slot0)
		end)
	end,
	safeCommFromServerByte = function (slot0, slot1)
		sdk.callPlatformFunc("safeCommFromServerByteYD", slot0, function (slot0)
			slot1 = print

			slot1("yidun.safeCommFromServerByteYD ret = ", slot0)

			uv1 = "print"

			slot1(slot0)
		end)
	end,
	localSaveEncode = function (slot0, slot1)
		sdk.callPlatformFunc("localSaveEncodeYD", slot0, function (slot0)
			slot1 = print

			slot1("yidun.localSaveEncodeYD ret = ", slot0)

			uv1 = "print"

			slot1(slot0)
		end)
	end,
	localSaveDecode = function (slot0, slot1)
		sdk.callPlatformFunc("localSaveDecodeYD", slot0, function (slot0)
			slot1 = print

			slot1("yidun.localSaveDecodeYD ret = ", slot0)

			uv1 = "print"

			slot1(slot0)
		end)
	end,
	localSaveBytesEncode = function (slot0, slot1)
		sdk.callPlatformFunc("localSaveBytesEncodeYD", slot0, function (slot0)
			slot1 = print

			slot1("yidun.localSaveBytesEncodeYD ret = ", slot0)

			uv1 = "print"

			slot1(slot0)
		end)
	end,
	localSaveBytesDecode = function (slot0, slot1)
		sdk.callPlatformFunc("localSaveBytesDecodeYD", slot0, function (slot0)
			slot1 = print

			slot1("yidun.localSaveBytesDecodeYD ret = ", slot0)

			uv1 = "print"

			slot1(slot0)
		end)
	end,
	track = function ()
		sdk.callPlatformFunc("trackYD", "", function (slot0)
			print("yidun.trackYD ret = ", slot0)
		end)
	end,
	registerTouchEvent = function ()
		sdk.callPlatformFunc("registerTouchEventYD", "", function (slot0)
			print("yidun.registerTouchEventYD ret = ", slot0)
		end)
	end,
	unregisterTouchEvent = function ()
		sdk.callPlatformFunc("unregisterTouchEventYD", "", function (slot0)
			print("yidun.unregisterTouchEventYD ret = ", slot0)
		end)
	end
}
