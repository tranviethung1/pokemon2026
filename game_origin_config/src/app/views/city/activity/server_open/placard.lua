slot0 = {
	vacation = {
		bg = "activity/server_open/summer_vacation/img_sqqtl_hb.png",
		title = "activity/server_open/summer_vacation/txt_sqqtl_1.png",
		icon = "activity/server_open/summer_vacation/icon_sqqtl_2.png"
	}
}
slot1 = class("ServerOpenPlacardView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "activity_server_open_placard.json"
slot1.RESOURCE_BINDING = {
	num = "num",
	barBg = "barBg",
	placard = "placard",
	desc = "desc",
	bar = {
		varname = "bar",
		binds = {
			event = "extend",
			class = "loadingbar",
			props = {
				maskImg = "activity/server_open/bar_red.png",
				data = bindHelper.self("barPoint")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.activityId = slot1
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.barPoint = idler.new(0)

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "activityId"
		slot3 = (slot1[slot2.activityId] or {}).targets or {}
		slot4 = slot3.cur or 0
		uv5 = "activityId"
		slot5 = slot5.num
		slot5 = slot5.text

		slot5(slot5, slot4 .. "/" .. slot3.all)

		uv5 = "activityId"

		slot5.barPoint:set(slot4 / slot3.all * 100)
	end)
	slot0.desc:text(gLanguageCsv.carnivalItemDesc)

	if csv.yunying.yyhuodong[slot0.activityId].clientParam.type then
		slot0.clientType = slot2.clientParam.type
	end

	if slot0.clientType == "springFestival" and slot0.clientType == "mayDay" then
		bind.extend(slot0, slot0.num, {
			class = "icon_key",
			props = {
				simpleShow = true,
				data = {
					key = slot2.paramMap.itemId
				},
				onNode = function (slot0)
					slot0:setTouchEnabled(false)
					slot0:scale(0.8):x(-300)
				end
			}
		})
	end

	slot4 = slot0

	slot0.updateData(slot4, slot1)

	uv4 = "activityId"

	for slot6, slot7 in pairs(slot4) do
		if slot0.clientType == slot6 then
			slot0.placard:texture(slot7.bg)

			slot8 = CSprite.new(slot7.title)
			slot9 = slot0:getResourceNode()

			slot8:addTo(slot9, 10)
			slot8:setAnchorPoint(cc.p(0.5, 0.5))
			slot8:xy(slot0.desc:x() - 60, slot0.desc:y())
			slot0.desc:hide()

			slot12 = CSprite.new(slot7.icon)

			slot12:addTo(slot9, 11)
			slot12:setAnchorPoint(cc.p(0.5, 0.5))
			slot12:xy(slot0.num:x() - 440, slot0.num:y())
			slot12:scale(0.8)
			slot0.bar:x(slot0.bar:x() - 60)
			slot0.barBg:x(slot0.barBg:x() - 60)
			slot0.num:x(slot0.num:x() - 60)
		end
	end

	if slot0.clientType == "springFestival" then
		text.addEffect(slot0.num, {
			outline = {
				size = 3,
				color = ui.COLORS.BLACK
			}
		})
		text.addEffect(slot0.desc, {
			outline = {
				size = 3,
				color = cc.c4b(244, 77, 87, 255)
			}
		})
		slot0.desc:hide()
	end

	if slot0.clientType == "mayDay" or slot0.clientType == "vacation" then
		text.addEffect(slot0.num, {
			outline = {
				size = 3,
				color = ui.COLORS.BLACK
			}
		})
		text.addEffect(slot0:getResourceNode():get("desc"), {
			outline = {
				color = cc.c4b(243, 110, 80, 255)
			}
		})
	end

	if slot0.clientType == "national" then
		text.addEffect(slot0.num, {
			outline = {
				size = 3,
				color = ui.COLORS.BLACK
			}
		})
		text.addEffect(slot0:getResourceNode():get("desc"), {
			outline = {
				color = cc.c4b(244, 77, 87, 255)
			}
		})
	end

	if slot0.clientType == "doubleYearsDay" then
		text.addEffect(slot0.num, {
			outline = {
				size = 3,
				color = ui.COLORS.BLACK
			}
		})
		text.addEffect(slot0:getResourceNode():get("desc"), {
			outline = {
				color = cc.c4b(114, 188, 62, 255)
			}
		})
	end

	if slot0.clientType == "anniversary" then
		text.addEffect(slot0.num, {
			outline = {
				size = 3,
				color = ui.COLORS.BLACK
			}
		})
		text.addEffect(slot0:getResourceNode():get("desc"), {
			outline = {
				color = cc.c4b(255, 252, 237, 255)
			}
		})
	end

	if slot0.clientType == "springEventWeek" then
		text.addEffect(slot0.num, {
			outline = {
				size = 3,
				color = ui.COLORS.WHITE
			}
		})
		text.addEffect(slot0:getResourceNode():get("desc"), {
			outline = {
				color = cc.c4b(74, 179, 54, 255)
			}
		})
	end
end

function slot1.updateData(slot0, slot1)
	slot0.activityId = slot1
end

return slot1
