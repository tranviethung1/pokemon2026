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

slot1 = class("HellRandomTowerPointRewardView", Dialog)
slot1.RESOURCE_FILENAME = "random_tower_point_reward.json"
slot1.RESOURCE_BINDING = {
	["title.textTitle1"] = "textTitle1",
	item = "item",
	["down.list"] = "downList",
	["down.textNote"] = "textNote",
	["down.textScore"] = "textScore",
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
				ended = bindHelper.defer(function (slot0)
					return slot0:onGetBtn(-1)
				end)
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
					slot1:multiget("textScore", "btnGet", "icon", "list", "imgReceived").textScore:text(slot3.point)

					if next(slot3.award) ~= nil then
						uiEasy.createItemsToList(slot0, slot4.list, slot3.award, {
							scale = 1
						})
					end

					slot4.imgReceived:visible(slot3.canReceive == 0)
					slot4.btnGet:visible(slot3.canReceive ~= 0)
					bind.touch(slot0, slot4.btnGet, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})

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

function slot1.onCreate(slot0)
	slot0:initModel()

	slot0.pointDatas = idlers.new()
	slot2 = csv.hell_random_tower.theme[gGameModel.hell_random_tower:read("theme")].awardVersion

	idlereasy.any({
		slot0.resultPointAward
	}, function (slot0, slot1)
		slot2 = {}
		slot3 = false

		for slot7, slot8 in orderCsvPairs(csv.hell_random_tower.point_award) do
			uv10 = "orderCsvPairs"

			if slot8.version == slot10 then
				if slot1[slot7] == 1 then
					slot3 = true
				end

				slot9.canReceive = slot1[slot7] or 0.5
				slot2[slot7] = {
					id = slot7,
					award = slot8.award,
					point = slot8.needPoint
				}
			end
		end

		uv4 = "csv"
		slot4 = slot4.getBtn
		slot4 = slot4.visible

		slot4(slot4, slot3)

		uv4 = "csv"

		slot4.pointDatas:update(slot2)
	end)
	adapt.oneLinePos(slot0.textTitle1, slot0.textTitle2, nil, "left")
	nodetools.invoke(slot0.down, {
		"textTodayNote",
		"textScore",
		"textNote",
		"list"
	}, "hide")

	slot3 = slot0.down:get("textAwardNote")

	slot3:text(gLanguageCsv.hellRandomPointRewardTip):y(60):setFontName("font/youmi1.ttf")
	text.addEffect(slot3, {
		color = cc.c4b(255, 143, 60, 255)
	})
	slot0.list:y(slot0.list:y() - 60)
	slot0.list:height(slot0.list:height() + 60)
	Dialog.onCreate(slot0)
end

function slot1.initModel(slot0)
	slot0.resultPointAward = gGameModel.hell_random_tower:getIdler("point_award")
end

function slot1.onitemClick(slot0, slot1, slot2, slot3)
	slot0:onGetBtn(slot3.id)
end

function slot1.onGetBtn(slot0, slot1)
	gGameApp:requestServerCustom("/game/hell_random_tower/point/award"):params(slot1):doit(function (slot0)
		gGameUI:showGainDisplay(slot0)
	end)
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
