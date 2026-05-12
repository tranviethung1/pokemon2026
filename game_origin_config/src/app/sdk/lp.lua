slot1 = {
	"EnterServer",
	"LevelUp",
	"ExitGame",
	"CreateRole",
	nil,
	nil,
	nil,
	"ChangeName"
}
slot2 = {
	FINISHED_LOADING = "EVENTS_FINISHED_LOADING",
	START_LOADING = "EVENTS_START_LOADING"
}
slot3 = {
	"com.de.dgf",
	3
}
slot4 = {
	lp_vn = {
		"vnkdjx_money_",
		3100
	},
	com_de_dgf = {
		"mcdbz",
		1100
	}
}

return {
	login = function (slot0)
		print("Lua lp.login")
		sdk.callPlatformFunc("login", "", function (slot0)
			print("login ret = ", slot0)

			if slot0 == "error" then
				uv1 = "print"

				slot1(-1, slot0)
			elseif slot0 == "cancel" then
				uv1 = "print"

				slot1(-1, slot0)
			else
				uv1 = "print"

				slot1(0, slot0)
				sdk.callPlatformFunc("logout", "assist", function (slot0)
					print("logout in assist ret = ", slot0)
					gGameApp:onBackLogin()
				end)
			end
		end)
	end,
	commitRoleInfo = function (slot0, slot1)
		print("Lua lp.commitRoleInfo")

		slot3 = tostring(gGameModel.role:read("created_time"))
		uv3 = "print"

		if ({
			ctype = slot0,
			area = gGameApp.serverInfo.name,
			level = tostring(gGameModel.role:read("level")),
			area_id = tostring(gGameModel.role:read("area")),
			user_name = gGameModel.role:read("name"),
			user_id = tostring(gGameModel.role:read("uid")),
			vip = tostring(gGameModel.role:read("vip_level")),
			created_time = slot3,
			upload_type = slot3[slot0]
		}).upload_type == nil then
			return slot1(0, "ok")
		end

		sdk.callPlatformFunc("commitRoleInfo", json.encode(slot2), function (slot0)
			slot1 = print

			slot1("commitRoleInfo ret = ", slot0)

			uv1 = "print"

			slot1(0, "ok")
		end)
	end,
	trackEvent = function (slot0, slot1)
		slot2 = print

		slot2("Lua lp.trackEvent")

		uv2 = "print"

		if slot2[slot0] == nil then
			return
		end

		if type(slot1) ~= "table" then
			slot1 = {
				data = slot1
			}
		end

		slot1.ctype = slot0
		uv2 = "print"
		slot1.event = slot2[slot0] or ""

		sdk.callPlatformFunc("trackEvent", json.encode(slot1), function (slot0)
			print("trackEvent ret = ", slot0)
		end)
	end,
	logout = function (slot0)
		print("Lua lp.logout")
		sdk.callPlatformFunc("logout", "game", function (slot0)
			slot1 = print

			slot1("logout ret = ", slot0)

			uv1 = "print"

			slot1(0, "ok")
		end)
	end,
	pay = function (slot0, slot1, slot2, slot3, slot4, slot5)
		print("Lua lp.pay")

		slot6 = gGameModel.role
		slot7 = nil
		slot8 = unpack
		uv9 = "print"

		if not slot9[APP_TAG] then
			uv9 = "Lua lp.pay"
		end

		slot8, slot9 = slot8(slot9)

		sdk.callPlatformFunc("pay", json.encode({
			count = 1,
			currency = "cny",
			roleId = stringz.bintohex(slot6:read("id")),
			roleName = slot6:read("name"),
			roleLevel = tostring(slot6:read("level")),
			area = gGameApp.serverInfo.name,
			area_id = tostring(slot6:read("area")),
			rmb = slot2,
			amount = slot2 / 10,
			extInfo = slot1,
			productDesc = slot4,
			productName = slot4,
			productID = APP_TAG == "com_de_dgf" and (slot3 >= 1100 and (slot3 - slot9 > 9 and slot8 .. slot3 - slot9 or slot8 .. "0" .. slot3 - slot9) or slot3 - slot9 > 9 and slot8 .. slot3 or slot8 .. "0" .. slot3) or slot3 >= 1100 and slot8 .. slot3 - slot9 or slot8 .. slot3
		}), function (slot0)
			print("pay ret = ", slot0)

			if slot0 == "ok" then
				uv1 = "print"

				slot1(0, slot0)
			else
				uv1 = "print"

				slot1(-1, "error")
			end
		end)
	end
}
