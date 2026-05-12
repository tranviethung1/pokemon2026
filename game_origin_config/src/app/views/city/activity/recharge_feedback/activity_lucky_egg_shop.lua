slot0 = {
	head = 4,
	vip = 1,
	handbook = 3,
	skin = 5,
	level = 2
}
slot1 = {
	gLanguageCsv.luckyEggShopVipNotEnough,
	gLanguageCsv.luckyEggShopLevelNotEnough,
	gLanguageCsv.luckyEggShopNoCard,
	gLanguageCsv.luckyEggShopVipNotEnough,
	gLanguageCsv.luckyEggShopNoCard
}
slot2 = class("LuckyEggShopView", cc.load("mvc").ViewBase)
slot2.RESOURCE_FILENAME = "activity_lucky_egg_shop.json"
slot2.RESOURCE_BINDING = {
	subList = "subList",
	item = "item",
	["scorePanel.text"] = "scoreText",
	btnClose = {
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
			class = "tableview",
			props = {
				leftPadding = 1,
				xMargin = 67,
				columnSize = 3,
				data = bindHelper.self("datas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot0:getIdx(slot2)

					bind.extend(slot0, slot1:get("baseNode"):multiget("text", "icon", "text2", "text3", "costPanel", "emptyPanel", "num").icon, {
						class = "icon_key",
						props = {
							noListener = true,
							data = {
								key = slot3.item.key,
								num = slot3.item.key == "card" and slot3.item.num or nil
							}
						}
					})
					slot5.icon:get("_icon_"):setTouchEnabled(false)
					slot5.text:text(slot3.name)

					if matchLanguage({
						"en",
						"us"
					}) then
						adapt.setTextAdaptWithSize(slot5.text, {
							margin = -8,
							vertical = "center",
							maxLine = 2,
							horizontal = "center",
							size = cc.size(350, 100)
						})
					else
						adapt.setTextScaleWithWidth(slot5.text, nil, 400)
					end

					slot5.num:text("x" .. mathEasy.getShortNumber(slot3.item.key == "card" and 1 or slot3.item.num, 2))
					slot5.text3:text(string.format("%s/%s", slot3.maxTime - slot3.step, slot3.maxTime))
					slot5.costPanel:get("img"):texture(dataEasy.getIconResByKey(slot3.cost.key))
					slot5.costPanel:get("text"):text(slot3.cost.num)
					adapt.oneLineCenterPos(cc.p(136, 40), {
						slot5.costPanel:get("img"),
						slot5.costPanel:get("text")
					}, cc.p(15, 0))

					if slot3.color then
						text.addEffect(slot5.costPanel:get("text"), {
							color = slot3.color
						})
					end

					if slot3.maxTime - slot3.step <= 0 then
						slot5.emptyPanel:get("tip"):hide()
						slot5.emptyPanel:show()
					elseif slot3.canBuy then
						slot5.emptyPanel:hide()
						bind.touch(slot0, slot1:get("baseNode"), {
							methods = {
								ended = functools.partial(slot0.clickCell, slot4, slot3)
							}
						})
						bind.touch(slot0, slot5.icon, {
							methods = {
								ended = functools.partial(slot0.clickCell, slot4, slot3)
							}
						})
					elseif slot3.isHas then
						slot5.emptyPanel:show()
						slot5.emptyPanel:get("text"):text(gLanguageCsv.alreadyHas)
						slot5.emptyPanel:get("tip"):hide()
					else
						slot5.emptyPanel:show()

						slot7 = slot5.emptyPanel:get("text")
						slot8 = slot7

						slot7.text(slot8, gLanguageCsv.notUnlock)

						uv8 = "getIdx"

						if slot3.limitKey ~= slot8[1] then
							uv8 = "getIdx"

							if slot3.limitKey == slot8[2] then
								uv10 = "get"

								slot5.emptyPanel:get("tip"):text(string.format(slot10[slot3.limitKey], slot3.limitID)):show()
							else
								slot9 = "tip"
								uv9 = "get"

								slot5.emptyPanel:get(slot9):text(slot9[slot3.limitKey]):show()
							end
						end

						slot5.costPanel:hide()
						slot5.text3:hide()
						slot5.text2:hide()
					end
				end,
				onAfterBuild = function (slot0)
					slot0.afterBuild()
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick"),
				afterBuild = bindHelper.self("afterBuild")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1, slot2)
	slot0.activityId = slot1
	slot0.huodongId = slot2
	slot0.items = gGameModel.role:getIdler("items")

	idlereasy.when(slot0.items, function (slot0, slot1)
		uv2 = "scoreNum"
		slot2.scoreNum = slot1[game.ITEM_TICKET.luckyEggScore] or 0
		uv2 = "scoreNum"
		uv4 = "scoreNum"

		slot2.scoreText:text(slot4.scoreNum)
	end)

	slot0.datas = idlers.new({})

	idlereasy.when(gGameModel.role:getIdler("yyhuodongs"), function (slot0, slot1)
		uv2 = "stamps"
		slot3 = (slot1[slot2] or {}).stamps or {}
		slot4 = {}

		for slot8, slot9 in orderCsvPairs(csv.yunying.itemexchange) do
			uv11 = "orderCsvPairs"

			if slot9.huodongID == slot11 then
				slot10, slot11 = csvNext(slot9.items)
				slot12, slot13 = csvNext(slot9.costMap)
				uv14 = "csv"
				slot14 = slot13 <= slot14.scoreNum
				slot15, slot16 = csvNext(slot9.limit)
				slot17 = true
				slot18 = false
				uv19 = "yunying"

				if slot15 == slot19.vip then
					slot17 = slot16 < gGameModel.role:read("vip_level")
				else
					uv19 = "yunying"

					if slot15 == slot19.level then
						slot17 = slot16 < gGameModel.role:read("level")
					else
						uv19 = "yunying"

						if slot15 == slot19.handbook and not gGameModel.role:read("pokedex")[csv.fragments[slot10].combID] then
							slot17 = false
						end
					end
				end

				slot19 = slot9.desc

				table.insert(slot4, {
					csvId = slot8,
					name = (slot10 ~= "card" or csv.cards[slot11.id].name) and dataEasy.getCfgByKey(slot10).name,
					item = {
						key = slot10,
						num = slot11
					},
					cost = {
						key = slot12,
						num = slot13
					},
					maxTime = slot9.exchangeTimes,
					limitKey = slot15,
					limitID = slot16,
					canBuy = slot17,
					isHas = slot18,
					step = slot3[slot8] or 0,
					color = slot14 and ui.COLORS.NORMAL.DEFAULT or nil
				})
			end
		end

		uv5 = "csv"

		slot5.datas:update(slot4)
	end)
end

function slot2.onItemClick(slot0, slot1, slot2, slot3)
	gGameUI:stackUI("common.buy_info", nil, , {
		[slot3.cost.key] = slot3.cost.num
	}, {
		id = slot3.item.key,
		num = slot3.item.num
	}, {
		flag = "exchange",
		contentType = "num",
		maxNum = slot3.maxTime - slot3.step
	}, slot0:createHandler("itemBuy", slot2, slot3.csvId, slot3.cost.num))
end

function slot2.itemBuy(slot0, slot1, slot2, slot3, slot4)
	if slot0.scoreNum < slot3 then
		gGameUI:showTip(gLanguageCsv.luckyEggTip)

		return
	end

	slot0.clickedItemRow = slot1.row

	gGameApp:requestServer("/game/yy/award/get", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityId, slot2, slot4)
end

function slot2.afterBuild(slot0)
	if slot0.clickedItemRow then
		slot0.list:jumpToItem(slot0.clickedItemRow - 1, cc.p(0, 0.5), cc.p(0, 0.5))
	end
end

return slot2
