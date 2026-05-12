function slot0(slot0, slot1)
	slot0:setTouchEnabled(slot1)
	cache.setShader(slot0, false, slot1 and "normal" or "hsl_gray")

	if slot1 then
		text.addEffect(slot0:get("textNote"), {
			glow = {
				color = ui.COLORS.GLOW.WHITE
			}
		})
	else
		text.deleteAllEffect(slot0:get("textNote"))
		text.addEffect(slot0:get("textNote"), {
			color = ui.COLORS.DISABLED.WHITE
		})
	end
end

slot1 = class("ActivitySnowmanRewardView", Dialog)
slot1.RESOURCE_FILENAME = "activity_snowman_reward.json"
slot1.RESOURCE_BINDING = {
	item = "item",
	["title.textTitle1"] = "textTitle1",
	down = "down",
	["title.textTitle2"] = "textTitle2",
	item1 = "item1",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["down.btnGet"] = {
		varname = "getBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onOneKey")
			}
		}
	},
	["down.btnGet.textNote"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 4,
				data = bindHelper.self("pointDatas"),
				item = bindHelper.self("item"),
				dataOrderCmpGen = bindHelper.self("onSortCards", true),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("textScore", "btnGet", "icon", "list")

					slot4.textScore:text(slot3.level)
					uiEasy.createItemsToList(slot0, slot4.list, slot3.award, {
						scale = 0.9
					})
					bind.touch(slot0, slot4.btnGet, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})

					slot5 = slot4.btnGet:get("textNote")
					slot5 = slot5.text

					slot5(slot5, slot3.canReceive == 0 and gLanguageCsv.received or gLanguageCsv.spaceReceive)

					uv5 = "multiget"

					slot5(slot4.btnGet, slot3.canReceive == 1)
				end
			},
			handlers = {
				clickCell = bindHelper.self("onitemClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0:initModel()

	slot0.activityId = slot1
	slot3 = csv.yunying.yyhuodong[slot1].huodongID
	slot4 = {}

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "yyhuodongs"
		slot2 = slot2.yyhuodongs
		slot3 = slot2
		uv3 = "read"
		slot2 = slot2.read(slot3)[slot3] or {}
		uv3 = "yyhuodongs"
		slot3.yyData = slot2
		uv4 = "yyhuodongs"
		slot4.param = slot2.stamps
		slot4 = false

		for slot8, slot9 in orderCsvPairs(csv.yunying.huodongcloth_level) do
			uv11 = "yyData"

			if slot9.huodongID == slot11 and next(slot9.award) ~= nil then
				if slot3[slot8] == 1 then
					slot4 = true
				end

				uv10 = "stamps"
				slot10[slot8] = {
					id = slot8,
					award = slot9.award,
					level = slot9.level,
					canReceive = slot3[slot8] or 0.5
				}
			end
		end

		slot5 = dataEasy.tryCallFunc
		uv6 = "yyhuodongs"
		slot7 = "updatePreloadCenterIndex"

		slot5(slot6.list, slot7)

		uv5 = "yyhuodongs"
		slot5 = slot5.pointDatas
		slot6 = slot5
		slot5 = slot5.update
		uv7 = "stamps"

		slot5(slot6, slot7)

		uv5 = "param"
		uv6 = "yyhuodongs"
		slot6 = slot6.getBtn
		slot7 = slot4

		slot5(slot6, slot7)

		uv6 = "yyhuodongs"
		uv7 = "yyhuodongs"

		adapt.oneLinePos(slot6.textTitle1, slot7.textTitle2, nil, "left")
	end)
	Dialog.onCreate(slot0)
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.pointDatas = idlers.new()
end

function slot1.onitemClick(slot0, slot1, slot2, slot3)
	slot0:onGetBtn(slot3.id)
end

function slot1.onGetBtn(slot0, slot1)
	gGameApp:requestServer("/game/yy/award/get", function (slot0)
		uv1 = "pointDatas"
		uv3 = "atproxy"
		slot1.pointDatas:atproxy(slot3).canReceive = 0

		gGameUI:showGainDisplay(slot0)
	end, slot0.activityId, slot1)
end

function slot1.onOneKey(slot0)
	gGameApp:requestServer("/game/yy/award/get/onekey", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityId)
end

function slot1.onSortCards(slot0, slot1)
	return function (slot0, slot1)
		if slot0.canReceive ~= slot1.canReceive then
			return slot1.canReceive < slot0.canReceive
		end

		return slot0.id < slot1.id
	end
end

return slot1
