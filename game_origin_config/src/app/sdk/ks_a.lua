slot1 = {
	"SUBMIT_TYPE_ENTER",
	"SUBMIT_TYPE_UPGRADE",
	"SUBMIT_TYPE_EXIT_GAME",
	"SUBMIT_TYPE_CREATE",
	nil,
	nil,
	nil,
	"SUBMIT_TYPE_UPDATE"
}
slot2 = {
	FINISHED_LOADING = "SUBMIT_TYPE_RES_COMPLETED",
	START_LOADING = "EVENTS_START_LOADING"
}
slot3 = {
	"com.jljxm.google",
	538
}
slot4 = {
	com_jljxm_google = {
		"com.jljxm.google",
		538
	},
	com_sbhx_google = {
		"com.sbhx.google",
		700
	},
	com_mcdzz_google = {
		"com.mcdzz.google",
		713
	},
	com_mbdmx_google = {
		"com.mbdmx.google",
		823
	},
	com_magiclk_google = {
		"com.magiclk.google",
		853
	},
	com_ssjxsmash_google = {
		"com.ssjxsmash.google",
		866
	},
	com_sbxxs_google = {
		"com.sbxxs.google",
		879
	},
	com_ssqyjb_google = {
		"com.ssqyjb.google",
		905
	},
	com_sbcnd_google = {
		"com.sbcnd.google",
		918
	},
	com_sbdljx_google = {
		"com.sbdljx.google",
		947
	},
	com_ssdsstorm_google = {
		"com.ssdsstorm.google",
		961
	},
	com_ssjfz_google = {
		"com.ssjfz.google",
		1021
	},
	com_ssj_google = {
		"com.ssjfz.google",
		1021
	},
	com_ssj11_google = {
		"com.ssjfz.google",
		1021
	},
	com_sbqsl_google = {
		"com.sbqsl.google",
		1073
	},
	com_sbq_google = {
		"com.sbqsl.google",
		1073
	},
	com_ssayqj_google = {
		"com.ssayqj.google",
		1099
	},
	com_scmyj_google = {
		"com.scmyj.google",
		1113
	},
	com_scmyj_google_a = {
		"com.scmyj.google",
		1113
	},
	com_hxlegend_google = {
		"com.hxlegend.google",
		1257
	},
	com_skdj_google = {
		"com.skdj.google",
		1257
	},
	com_sblmwlzz_google = {
		"com.sblmwlzz.google",
		1371
	},
	com_ssjjskdj_google = {
		"com.ssjjskdj.google",
		1397
	},
	com_stwguanjun_google = {
		"com.stwguanjun.google",
		2198
	},
	com_stwguanjun_google_two = {
		"com.stwguanjun.google",
		2198
	},
	com_sczj_google = {
		"com.sczj.google",
		2250
	},
	com_ylslcs_google = {
		"com.ylslcs.google",
		2382
	},
	com_mydsldj_google = {
		"com.mydsldj.google",
		2449
	},
	com_chaoneng_google = {
		"com.chaoneng.google",
		2635
	},
	com_mengcjh_google = {
		"com.mengcjh.google",
		2865
	},
	com_mocchuans_google = {
		"com.mocchuans.google",
		3278
	},
	com_yjguodus_google = {
		"com.yjguodus.google",
		3669
	},
	com_qmcw_google = {
		"com.qmcw.google",
		3589
	},
	com_mxcsqc_google = {
		"com.mxcsqc.google",
		3785
	},
	com_sbmxt_google = {
		"com.sbmxt.google",
		3831
	},
	com_sblmwlzz_google_two = {
		"com.sblmwlzz.google",
		1371
	},
	com_sblmwlzz_google_two_yidun = {
		"com.sblmwlzz.google",
		1371
	},
	com_shenbird_google_yidun = {
		"com.shenbird.google",
		5112
	},
	com_sncs_google_yidun = {
		"com.sncs.google",
		5175
	},
	com_hslcheng_google_yidun = {
		"com.hslcheng.google",
		5290
	},
	com_lzjuexing_google_yidun = {
		"com.lzjuexing.google",
		4907
	},
	com_mcjizhanpx_google_yidun = {
		"com.mcjizhanpx.google",
		5620
	},
	com_sbwjb_google_yidun = {
		"com.sbwjb.google",
		5818
	},
	com_mhyyxk_google_yidun = {
		"com.mhyyxk.google",
		5786
	}
}

return {
	login = function (slot0)
		print("Lua ks_a.login")
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
		print("Lua ks_a.commitRoleInfo  ctype:" .. slot0)

		slot3 = tostring(gGameModel.role:read("created_time"))
		uv3 = "print"

		if ({
			ctype = slot0,
			area = gGameApp.serverInfo.name,
			level = tostring(gGameModel.role:read("level")),
			area_id = tostring(gGameModel.role:read("area")),
			role_id = stringz.bintohex(gGameModel.role:read("id")),
			role_name = gGameModel.role:read("name"),
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

		slot2("Lua ks_a.trackEvent  ctype:", tostring(slot0))

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
		print("Lua ks_a.logout")
		sdk.callPlatformFunc("logout", "game", function (slot0)
			slot1 = print

			slot1("logout ret = ", slot0)

			uv1 = "print"

			slot1(0, "ok")
		end)
	end,
	pay = function (slot0, slot1, slot2, slot3, slot4, slot5)
		print("Lua ks_a.pay")

		slot6 = gGameModel.role
		slot7 = nil
		slot8 = csv.recharges[slot3]
		slot9 = unpack
		uv10 = "print"

		if not slot10[APP_TAG] then
			uv10 = "Lua ks_a.pay"
		end

		slot9, slot10 = slot9(slot10)

		sdk.callPlatformFunc("pay", json.encode({
			count = 1,
			currency = "cny",
			roleId = stringz.bintohex(slot6:read("id")),
			roleName = slot6:read("name"),
			roleLevel = tostring(slot6:read("level")),
			area = gGameApp.serverInfo.name,
			area_id = tostring(slot6:read("area")),
			rmb = slot2,
			rmbDisplay = slot8.rmbDisplay,
			amount = slot2 / 10,
			extInfo = slot1,
			productDesc = slot4,
			productName = slot4,
			productID = slot3 >= 1100 and slot3 - 1100 + slot10 or slot3 >= 108 and slot3 - 100 + slot10 or slot3 > 100 and slot3 - 101 + slot10 or slot3 * 2 + 3 + slot10
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
