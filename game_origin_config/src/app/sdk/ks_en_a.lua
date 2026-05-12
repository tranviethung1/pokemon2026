slot1 = {
	"SUBMIT_TYPE_ENTER",
	"SUBMIT_TYPE_UPGRADE",
	nil,
	"SUBMIT_TYPE_CREATE",
	nil,
	nil,
	nil,
	"SUBMIT_TYPE_UPDATE"
}
slot2 = {
	FINISHED_LOADING = "EVENTS_FINISHED_LOADING",
	START_LOADING = "EVENTS_START_LOADING"
}
slot3 = {
	"com.rise.google",
	1384
}
slot4 = {
	com_rise_google = {
		"com.rise.google",
		1384
	},
	com_songs_google = {
		"com.songs.google",
		1449
	},
	com_adventure_google = {
		"com.adventure.google",
		1488
	},
	com_story_google = {
		"com.story.google",
		1549
	},
	com_elftrainer_google = {
		"com.elftrainer.google",
		1592
	},
	com_eas_google = {
		"com.eas.google",
		1621
	},
	com_battle_google = {
		"com.battle.google",
		1683
	},
	mec_crush_google = {
		"mec.crush.google",
		1811
	},
	bts_beast_old = {
		"bts.beast.old",
		1798
	},
	bc_chapter_google = {
		"bc.chapter.google",
		1837
	},
	sla_awaken_google = {
		"sla.awaken.google",
		1824
	},
	elfa_battle_google = {
		"elfa.battle.google",
		1864
	},
	ea_elves_google = {
		"ea.elves.google",
		1877
	},
	com_mirof_google = {
		"com.mirof.google",
		1916
	},
	myea_wlktao_google = {
		"myea.wlktao.google",
		1890
	},
	com_fight_google = {
		"com.fight.google",
		1903
	},
	com_roeaw_google = {
		"com.roeaw.google",
		1990
	},
	com_leagueof_google = {
		"com.leagueof.google",
		2211
	},
	com_realmof_google = {
		"com.realmof.google",
		2172
	},
	com_elvestw_google = {
		"com.elvestw.google",
		2224
	},
	com_battleoc_google = {
		"com.battleoc.google",
		2185
	},
	com_eest_google = {
		"com.eest.google",
		2356
	},
	com_elflg_google = {
		"com.elflg.google",
		2369
	},
	com_elfas_google = {
		"com.elfas.google",
		2395
	},
	com_elvcon_google = {
		"com.elvcon.google",
		2421
	},
	com_fies_google = {
		"com.fies.google",
		2436
	},
	com_sss_google = {
		"com.sss.google",
		2462
	},
	com_cfttt_google = {
		"com.cfttt.google",
		2523
	},
	com_elfma_google = {
		"com.elfma.google",
		2609
	},
	com_jnedm_google = {
		"com.jnedm.google",
		2622
	},
	com_pbec_google = {
		"com.pbec.google",
		2716
	},
	com_adva_google = {
		"com.adva.google",
		2826
	},
	com_sbesh_google = {
		"com.sbesh.google",
		2839
	},
	com_riseoe_huawei = {
		"com.riseoe.huawei",
		3291
	},
	com_selfw_google = {
		"com.selfw.google",
		3525
	},
	com_elfbg_google = {
		"com.elfbg.google",
		3641
	},
	com_elbm_google = {
		"com.elbm.google",
		3627
	},
	com_elfba_google = {
		"com.elfba.google",
		3654
	},
	com_elbna_google = {
		"com.elbna.google",
		3602
	},
	com_elbev_google = {
		"com.elbev.google",
		3964
	},
	com_efat_google = {
		"com.efat.google",
		4075
	},
	com_elfqlr_google = {
		"com.elfqlr.google",
		4115
	},
	com_emex_google = {
		"com.emex.google",
		4163
	},
	com_petle_google = {
		"com.petle.google",
		4263
	},
	com_efdu_google = {
		"com.efdu.google",
		4289
	},
	com_efod_google = {
		"com.efod.google",
		4317
	},
	com_elpc_google = {
		"com.elpc.google",
		4428
	},
	com_fame_google = {
		"com.fame.google",
		4456
	},
	com_enea_google = {
		"com.enea.google",
		4496
	},
	com_myea_google = {
		"com.myea.google",
		4632
	},
	com_efdu_google_yidun = {
		"com.efdu.google",
		4289
	},
	com_elfsaga_google_yidun = {
		"com.elfsaga.google",
		4778
	},
	com_myvo_google_yidun = {
		"com.myvo.google",
		4868
	},
	com_gamon_google_yidun = {
		"com.gamon.google",
		4855
	},
	com_stqu_google_yidun = {
		"com.stqu.google",
		5082
	},
	com_trma_google_yidun = {
		"com.trma.google",
		5225
	},
	com_mtnw_google_yidun = {
		"com.mtnw.google",
		5415
	},
	com_mocac_google_yidun = {
		"com.mocac.google",
		5415
	},
	com_riseoe_amz_yidun = {
		"com.riseoe.amz",
		5633
	},
	com_riseoe_samsung_yidun = {
		"com.riseoe.samsung",
		5646
	},
	com_bane_google_yidun = {
		"com.bane.google",
		5686
	},
	com_riseoe_huawei_yidun = {
		"com.riseoe.huawei",
		3291
	},
	com_pokemon_google_yidun = {
		"com.pokemon.google",
		4996
	}
}

return {
	login = function (slot0)
		print("Lua ks_en_a.login")
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
		print("Lua ks_en_a.commitRoleInfo")

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

		slot2("Lua ks_en_a.trackEvent")

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
		print("Lua ks_en_a.logout")
		sdk.callPlatformFunc("logout", "game", function (slot0)
			slot1 = print

			slot1("logout ret = ", slot0)

			uv1 = "print"

			slot1(0, "ok")
		end)
	end,
	pay = function (slot0, slot1, slot2, slot3, slot4, slot5)
		print("Lua ks_en_a.pay")

		slot6 = gGameModel.role
		slot7 = nil
		slot8 = csv.recharges[slot3]
		slot9 = unpack
		uv10 = "print"

		if not slot10[APP_TAG] then
			uv10 = "Lua ks_en_a.pay"
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
			productID = slot3 >= 2100 and slot3 - 2100 + slot10 or slot3 >= 108 and slot3 - 100 + slot10 or slot3 > 100 and slot3 - 101 + slot10 or slot3 * 2 + 3 + slot10
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
