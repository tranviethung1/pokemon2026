slot1 = {
	"EnterServer",
	"LevelUp",
	"ExitGame",
	"CreateRole",
	nil,
	"NewbieGuideEnd",
	nil,
	"ChangeName"
}
slot2 = {
	FINISHED_LOADING = "EVENTS_FINISHED_LOADING",
	START_LOADING = "EVENTS_START_LOADING",
	CDN_60 = "CDN_60",
	PULL_VERSION = "PULL_VERSION",
	NOTNETWORK_CLICK = "NOTNETWORK_CLICK",
	CDN_30 = "CDN_30",
	CDN_FINISH = "CDN_FINISH",
	START_CDN = "START_CDN",
	START_LOGIN = "START_LOGIN",
	CDN_5 = "CDN_5",
	PULL_GAMESHOW = "PULL_GAMESHOW",
	START_GAME = "START_GAME",
	CLICK_OK = "CLICK_OK"
}
slot4 = {
	com_mccjh_mccjh_1 = {
		"jxkrfc_money_",
		1
	},
	lp_kr = {
		"jxkrfc_money_",
		1
	},
	com_jka_jxkr_first = {
		"com.jka.jxkr.first_",
		1
	},
	com_ptjx_krmp_two = {
		"com.ptjx.krmp.two_",
		1
	},
	as_ptjx_krmp_two = {
		"com.ptjx.krmp.two_",
		1
	},
	as_ptjx_dev_two = {
		"com.ptjx.krmp.two_",
		1
	},
	as_jka_jxkr_first = {
		"com.jka.jxkr.first_",
		1
	},
	as_0323_krmp_two = {
		"com.ptjx.krmp.two_",
		1
	},
	as_jxry_krlt_hree = {
		"com.jxry.krlt.hree_",
		1
	},
	as_jxry_krlt_four = {
		"com.jxry.krlt.four_",
		1
	},
	as_jxtrkr_bzvxwu = {
		"com.jxtrkr.bzvxwu_",
		1
	},
	as_jxqy_six = {
		"com.jxqy.krtq.six_",
		1
	},
	as_monster = {
		"monster_",
		1
	},
	as_emaster = {
		"emaster_",
		1
	},
	as_naikr = {
		"naikr_",
		1
	},
	as_tenkr = {
		"tenkr_",
		1
	},
	as_elevenkr = {
		"elevenkr_",
		1
	},
	as_twelvekr = {
		"twelvekr_",
		1
	},
	as_thirteenkr = {
		"thirteenkr_",
		1
	},
	as_fourteenkr = {
		"fourteenkr_",
		1
	},
	as_fifteenkr = {
		"fifteenkr_",
		1
	},
	as_sixteenkr = {
		"sixteenkr_",
		1
	},
	as_seventeenkr = {
		"seventeenkr_",
		1
	},
	as_eighteenkr_yidun = {
		"eighteenkr_",
		1
	},
	as_nineteenkr_yidun = {
		"nineteenkr_",
		1
	},
	as_com_xdft_hjnm_oijk_yidun = {
		"jxkrfc_money_",
		1
	},
	as_pkmatkr_yidun = {
		"pkmatkr_",
		1
	},
	as_pmgmpd_yidun = {
		"pmgmpd_",
		1
	},
	as_ghjnadvt_yidun = {
		"ghjnadvt_",
		1
	},
	as_jsdnfjitem_yidun = {
		"jsdnfjitem_",
		1
	},
	as_com_may_ioskr = {
		"com.may.ioskr_",
		1
	},
	as_com_poture_ioskr = {
		"com.poture.ioskr_",
		1
	},
	as_com_apthreekr_ioskr = {
		"apthreekr_",
		1
	},
	as_com_apfourkr_ioskr = {
		"apfourkr_",
		1
	},
	as_pocketfight_ioskr_yidun = {
		"pocketfight_",
		1
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
	switch = function (slot0)
		print("Lua lp_kr.switchAccount")
		sdk.callPlatformFunc("switchAccount", "", function (slot0)
			slot1 = print

			slot1("logout ret = ", slot0)

			uv1 = "print"

			slot1(0, "ok")
		end)
	end,
	commitRoleInfo = function (slot0, slot1)
		print("Lua lp.commitRoleInfo")

		slot2 = {}

		if slot0 < 50 then
			slot4 = tostring(gGameModel.role:read("created_time"))
			uv4 = "print"

			if ({
				ctype = slot0,
				area = gGameApp.serverInfo.name,
				level = tostring(gGameModel.role:read("level")),
				area_id = tostring(gGameModel.role:read("area")),
				user_name = gGameModel.role:read("name"),
				user_id = tostring(gGameModel.role:read("uid")),
				role_id = stringz.bintohex(gGameModel.role:read("id")),
				vip = tostring(gGameModel.role:read("vip_level")),
				created_time = slot4,
				upload_type = slot4[slot0]
			}).upload_type == nil then
				return slot1(0, "ok")
			end
		else
			slot2 = {
				ctype = slot0
			}
		end

		sdk.callPlatformFunc("commitRoleInfo", json.encode(slot2), function (slot0)
			slot1 = print

			slot1("commitRoleInfo ret = ", slot0)

			uv1 = "print"

			slot1(0, "ok")
		end)
	end,
	openCustomerService = function (slot0)
		print("openCustomerService:", slot0)

		if device.platform == "android" then
			sdk.callPlatformFunc("openCustomerService", json.encode({
				created_time = "",
				area = "",
				role_id = "",
				user_id = "",
				area_id = "",
				user_name = "",
				level = "",
				vip = slot0
			}), function (slot0)
				print("openCustomerService ret = ", slot0)
			end)
		else
			sdk.callPlatformFunc("openSupport", json.encode(slot1), function (slot0)
				print("openCustomerService ret = ", slot0)
			end)
		end
	end,
	trackEvent = function (slot0, slot1)
		slot2 = print

		slot2("Lua lp_kr.trackEvent")

		uv2 = "print"

		if slot2[slot0] == nil then
			return
		end

		if slot0 == 2 or slot0 == 1 then
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
		slot7 = slot3 >= 4100 and slot8 .. slot3 - 4100 or slot3 >= 108 and slot8 .. slot3 - 100 or slot3 > 100 and slot8 .. slot3 - 101 or slot3 >= 3 and slot8 .. slot9 + 9 - slot3 or slot8 .. 2 * slot3 + 3
		slot10 = tostring(slot6:read("level"))

		if APP_TAG == "as_pkmatkr_yidun" then
			slot10 = slot1
		end

		sdk.callPlatformFunc("pay", json.encode({
			count = 1,
			currency = "₩",
			roleId = stringz.bintohex(slot6:read("id")),
			roleName = slot6:read("name"),
			roleLevel = slot10,
			area = gGameApp.serverInfo.name,
			area_id = tostring(slot6:read("area")),
			rmb = slot2,
			amount = slot2 / 10,
			extInfo = slot1,
			productDesc = slot4,
			productName = slot4,
			productID = slot7
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
