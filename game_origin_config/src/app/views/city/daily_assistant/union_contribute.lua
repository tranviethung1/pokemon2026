slot0 = class("UnionContribInfoView", Dialog)
slot0.RESOURCE_FILENAME = "daily_assistant_union_contribute.json"
slot0.RESOURCE_BINDING = {
	item = "item",
	imgBG = "imgBg",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("itemDatas"),
				item = bindHelper.self("item"),
				vip = bindHelper.self("vip"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("textTitle", "info1", "info2", "cost", "btnOk")

					slot4.textTitle:text(gLanguageCsv[slot3.cfg.title])
					slot4.info1:get("textAddNum"):text("+" .. slot3.cfg.contrib)

					slot5, slot6 = csvNext(slot3.cfg.award)

					slot4.info2:get("textAddNum"):text("+" .. slot6)

					slot7, slot8 = csvNext(slot3.cfg.cost)

					slot4.cost:get("textNum"):text(slot8)

					slot10 = dataEasy.getNumByKey(slot7)
					slot11 = ui.COLORS.NORMAL.DEFAULT

					if not slot3.isEnough then
						slot11 = ui.COLORS.NORMAL.RED
					end

					text.addEffect(slot9, {
						color = slot11
					})

					slot12 = slot4.cost:get("imgIcon")

					slot12:texture(dataEasy.getIconResByKey(slot7))
					adapt.oneLineCenterPos(cc.p(150, 35), {
						slot4.cost:get("textNote"),
						slot9,
						slot12
					}, cc.p(6, 0))

					if not (slot3.cfg.vipNeed <= slot0.vip:read()) then
						slot4.btnOk:get("textNote"):text(string.format(gLanguageCsv.vipCanUse, uiEasy.getVipStr(slot3.cfg.vipNeed).str))

						if matchLanguage({
							"kr"
						}) then
							slot4.btnOk:get("textNote"):setFontSize(38)
						end

						if matchLanguage({
							"en"
						}) then
							adapt.setTextScaleWithWidth(slot4.btnOk:get("textNote"), nil, 260)
						end
					else
						slot4.btnOk:get("textNote"):text(gLanguageCsv.qualityExchangeFragmentTitle3)
					end

					cache.setShader(slot4.btnOk, false, slot3.canContrubute and slot13 and "normal" or "hsl_gray")

					if slot3.canContrubute and slot13 then
						text.addEffect(slot4.btnOk:get("textNote"), {
							glow = {
								color = ui.COLORS.GLOW.WHITE
							}
						})
					else
						text.deleteAllEffect(slot4.btnOk:get("textNote"))
						text.addEffect(slot4.btnOk:get("textNote"), {
							color = ui.COLORS.DISABLED.WHITE
						})
					end

					bind.touch(slot0, slot4.btnOk, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.callBack = slot1.callBack

	slot0.list:setName("contribInfoList")
	slot0:initModel()

	slot0.unionExpPro = idler.new(0)
	slot0.todayExpPro = idler.new(0)
	slot0.todayExp = idler.new("")
	slot0.unionCurLvExp = idler.new("")
	slot0.leftCount = idler.new("")
	slot2 = {}

	for slot6, slot7 in orderCsvPairs(csv.union.contrib) do
		slot9, slot10 = csvNext(({
			cfg = slot7,
			csvId = slot6,
			canContrubute = true
		}).cfg.cost)

		if slot9 == "gold" then
			slot8.isEnough = slot10 <= dataEasy.getNumByKey(slot9)
		elseif slot9 == "rmb" then
			slot8.isEnough = slot10 <= slot11
		end

		table.insert(slot2, slot8)
	end

	slot0.itemDatas = idlers.newWithMap(slot2)

	idlereasy.any({
		slot0.gold,
		slot0.rmb
	}, function (slot0, slot1, slot2)
		uv4 = "ipairs"

		for slot6, slot7 in ipairs(slot4) do
			slot8, slot9 = csvNext(slot7.cfg.cost)

			if slot8 == "gold" then
				uv10 = "csvNext"
				slot10.itemDatas:atproxy(slot6).isEnough = slot9 <= slot1
			elseif slot8 == "rmb" then
				uv10 = "csvNext"
				slot10.itemDatas:atproxy(slot6).isEnough = slot9 <= slot2
			end
		end
	end)

	if slot0.imgBg:get("privilege") then
		slot0.imgBg:get("privilege"):removeSelf()
	end

	Dialog.onCreate(slot0)
end

function slot0.initModel(slot0)
	slot1 = gGameModel.union
	slot0.vip = gGameModel.role:getIdler("vip_level")
	slot0.unionLv = slot1:getIdler("level")
	slot0.unionDayExp = slot1:getIdler("day_contrib")
	slot0.unionExp = slot1:getIdler("contrib")
	slot0.contribCount = gGameModel.daily_record:getIdler("union_contrib_times")
	slot0.gold = gGameModel.role:getIdler("gold")
	slot0.rmb = gGameModel.role:getIdler("rmb")
end

function slot0.onItemClick(slot0, slot1, slot2, slot3)
	if slot0.vip:read() < slot3.cfg.vipNeed then
		return
	end

	slot0.callBack(slot3.csvId, function ()
		uv0 = "onClose"

		slot0:onClose()
	end)
end

return slot0
