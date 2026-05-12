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

slot1 = class("ArenaPointRewardView", Dialog)
slot1.RESOURCE_FILENAME = "activity_duanwu_proficiency.json"
slot1.RESOURCE_BINDING = {
	item1 = "item1",
	item = "item",
	["title.textTitle1"] = "textTitle1",
	down = "down",
	["title.textTitle2"] = "textTitle2",
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
				ended = bindHelper.defer(function (slot0)
					return slot0:onGetBtn()
				end)
			}
		}
	},
	["down.btnGet.textNote"] = {
		varname = "textNote",
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
					slot1:multiget("textScore", "btnGet", "icon", "list").textScore:text(slot3.point)

					if next(slot3.award) ~= nil then
						uiEasy.createItemsToList(slot0, slot4.list, slot3.award, {
							scale = 0.9
						})
					end

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
	slot0.activityID = slot1

	slot0.item:visible(false)
	slot0.item1:visible(false)
	slot0:initModel()

	slot0.pointDatas = idlers.newWithMap({})
	slot2 = csv.yunying.yyhuodong[slot1].huodongID

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		slot2 = {}
		slot3 = false
		slot4 = 0.5
		slot5 = 0
		uv6 = "info"

		if slot1[slot6] then
			uv6 = "info"

			if slot1[slot6].info then
				uv6 = "info"
				slot5 = slot1[slot6].info.counter
			end
		end

		uv6 = "counter"

		slot6.down:get("num"):text(slot5)

		for slot9, slot10 in orderCsvPairs(csv.yunying.bao_zongzi_task) do
			uv12 = "down"

			if slot10.huodongID == slot12 then
				slot4 = 0.5
				uv11 = "info"

				if slot1[slot11] then
					uv11 = "info"

					if slot1[slot11].stamps then
						uv11 = "info"

						if slot1[slot11].stamps[slot9] == 1 then
							slot3 = true
						end

						uv11 = "info"

						if slot1[slot11].stamps[slot9] ~= 0 and slot4 ~= 1 then
							slot4 = 0.5
						end
					end
				end

				slot12 = slot10.taskParam
				slot2[slot9] = {
					id = slot9,
					award = slot10.award,
					point = slot12,
					canReceive = slot4
				}
				slot11 = dataEasy.tryCallFunc
				uv12 = "counter"
				slot12 = slot12.list

				slot11(slot12, "updatePreloadCenterIndex")

				uv11 = "get"
				uv12 = "counter"

				slot11(slot12.getBtn, slot3)
			end
		end

		uv6 = "counter"

		slot6.pointDatas:update(slot2)
	end)
	adapt.oneLinePos(slot0.textTitle1, slot0.textTitle2, nil, "left")
	Dialog.onCreate(slot0)
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
end

function slot1.onitemClick(slot0, slot1, slot2, slot3)
	gGameApp:requestServer("/game/yy/award/get", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityID, slot3.id)
end

function slot1.onGetBtn(slot0)
	gGameApp:requestServer("/game/yy/award/get/onekey", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityID)
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
