slot0 = class("ElementRankRewardView", Dialog)
slot0.RESOURCE_FILENAME = "eliminate_rank_reward.json"
slot0.RESOURCE_BINDING = {
	textRank = "textRank",
	textNote = "textNote",
	item = "item",
	["title.textTitle2"] = "textTitle2",
	["title.textTitle1"] = "textTitle1",
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
				margin = 12,
				asyncPreload = 4,
				data = bindHelper.self("rankDatas"),
				item = bindHelper.self("item"),
				dataOrderCmpGen = bindHelper.self("onSortCards", true),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:multiget("textRank", "textCost", "btnGet", "imgIcon", "list").textRank:text(slot3.rank)

					if next(slot3.award) ~= nil then
						uiEasy.createItemsToList(slot0, slot4.list, slot3.award, {
							scale = 0.9
						})
					end

					slot5 = slot3.canReceive == 1

					slot4.btnGet:setTouchEnabled(slot5)
					uiEasy.setBtnShader(slot4.btnGet, slot4.btnGet:get("textNote"), slot5 and 1 or 2)
					slot4.btnGet:visible(slot3.canReceive ~= 0)
					slot4.imgIcon:visible(slot3.canReceive == 0)
					bind.touch(slot0, slot4.btnGet, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onitemClick")
			}
		}
	},
	oneKeyBtn = {
		varname = "oneKeyBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("oneKeyBtnAward")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.activityId = slot1

	slot0:initModel()

	slot2 = csv.yunying.yyhuodong[slot1].huodongID
	slot0.rankDatas = idlers.new()

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "stamps"
		slot2 = slot1[slot2].stamps
		slot3 = {}
		slot4 = false

		for slot8, slot9 in orderCsvPairs(csv.yunying.element_crush_tasks) do
			uv10 = "orderCsvPairs"

			if slot10 == slot9.huodongID then
				table.insert(slot3, {
					id = slot8,
					award = slot9.award,
					rank = slot9.targetArg,
					canReceive = slot2[slot8] or 0.5
				})

				if slot2[slot8] == 1 then
					slot4 = true
				end
			end
		end

		slot5 = uiEasy.setBtnShader
		uv6 = "csv"
		uv7 = "csv"

		slot5(slot6.oneKeyBtn, slot7.oneKeyBtn:get("textNote"), slot4 and 1 or 2)

		uv5 = "csv"
		slot5 = slot5.oneKeyBtn
		slot6 = slot5

		slot5.setTouchEnabled(slot6, slot4)

		slot5 = dataEasy.tryCallFunc
		uv6 = "csv"

		slot5(slot6.list, "updatePreloadCenterIndex")

		uv5 = "csv"

		slot5.rankDatas:update(slot3)
	end)
	adapt.oneLinePos(slot0.textTitle1, slot0.textTitle2, cc.p(10, 0), "left")
	Dialog.onCreate(slot0)
end

function slot0.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
end

function slot0.onSortCards(slot0, slot1)
	return function (slot0, slot1)
		if slot0.canReceive ~= slot1.canReceive then
			return slot1.canReceive < slot0.canReceive
		end

		return slot0.rank < slot1.rank
	end
end

function slot0.oneKeyBtnAward(slot0)
	gGameApp:requestServer("/game/yy/award/get/onekey", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityId)
end

function slot0.onitemClick(slot0, slot1, slot2)
	gGameApp:requestServer("/game/yy/award/get", function (slot0)
		uv3 = "csvMapPairs"

		for slot5, slot6 in csvMapPairs(slot3.award) do
			-- Nothing
		end

		gGameUI:showGainDisplay({
			[slot5] = slot6
		})
	end, slot0.activityId, slot2.id)
end

return slot0
