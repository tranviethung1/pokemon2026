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
slot1.RESOURCE_FILENAME = "horse_race_point_reward.json"
slot1.RESOURCE_BINDING = {
	item = "item",
	["down.textNote"] = "downTextNote",
	["title.textTitle1"] = "textTitle1",
	["down.textPoint"] = "textPoint",
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
	},
	["down.textScore"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("resultPoint")
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.activityId = slot1

	slot0:initModel()

	slot0.pointDatas = idlers.new()

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "horse_race"
		slot3 = slot1[slot2].horse_race.point_award or {}
		slot4 = slot2.horse_race.point or 0
		slot5 = {}
		slot6 = false

		for slot10, slot11 in csvPairs(csv.yunying.horse_race_point_award) do
			if slot3[slot10] == 1 then
				slot6 = true
			end

			slot5[slot10] = {
				id = slot10,
				award = slot11.award,
				point = slot11.point,
				canReceive = slot3[slot10] or 0.5
			}
		end

		slot7 = dataEasy.tryCallFunc
		uv8 = "point_award"

		slot7(slot8.list, "updatePreloadCenterIndex")

		uv7 = "point_award"
		slot7 = slot7.pointDatas
		slot7 = slot7.update

		slot7(slot7, slot5)

		uv7 = "point_award"

		slot7.textPoint:text(string.format(gLanguageCsv.horseRacePoint, slot4))
	end)
	adapt.oneLinePos(slot0.textTitle1, slot0.textTitle2, nil, "left")
	Dialog.onCreate(slot0)
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
end

function slot1.onitemClick(slot0, slot1, slot2, slot3)
	slot0:onGetBtn(slot3.id)
end

function slot1.onGetBtn(slot0, slot1)
	gGameApp:requestServer("/game/yy/horse/race/point/award", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityId, slot1)
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
