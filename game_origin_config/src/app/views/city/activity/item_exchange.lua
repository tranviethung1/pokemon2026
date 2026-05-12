slot0 = {
	noReach = 2,
	canExchange = 1,
	exchanged = 3
}
slot1 = class("ActivityItemExchangeView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "activity_item_exchange.json"
slot1.RESOURCE_BINDING = {
	item = "item",
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 5,
				data = bindHelper.self("datas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				dataOrderCmp = function (slot0, slot1)
					if slot0.state ~= slot1.state then
						return slot0.state < slot1.state
					end

					return slot0.csvId < slot1.csvId
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot3.cfg
					slot5 = slot1:multiget("list", "item", "img", "checkPanel", "exchangebtn", "exchanged", "times")

					slot5.list:size(1100, 200)
					uiEasy.createItemsToList(slot0, slot5.list, slot3.costMap, {
						padding = 5
					})

					slot6 = cc.p(100, 100)
					slot7, slot8 = slot5.list:xy()

					slot5.img:x(slot7 + math.min(slot5.list:getInnerItemSize().width, slot5.list:size().width) + 150)

					slot14 = {
						data = {
							key = slot3.key,
							num = slot3.num
						},
						onNode = function (slot0)
							uv3 = "xy"
							uv4 = "x"
							slot4 = slot4.x
							uv4 = "y"
							uv5 = "x"

							slot0:xy(slot3 + 300 + slot4, slot4 + slot5.y):z(5)
						end
					}

					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = slot14
					})

					uv14 = "cfg"
					slot13 = slot3.state ~= slot14.exchanged

					itertools.invoke({
						slot5.checkPanel,
						slot5.exchangebtn,
						slot5.times
					}, "visible", slot13)

					uv13 = "cfg"

					slot5.exchanged:visible(slot3.state == slot13.exchanged)
					slot5.checkPanel:get("checkBox"):setSelectedState(slot3.remind)
					slot5.checkPanel:onClick(functools.partial(slot0.remindClick, slot2, slot3))
					slot5.times:text(string.format(gLanguageCsv.canExchangeTImes, slot4.exchangeTimes - slot3.cnt, slot4.exchangeTimes))

					if matchLanguage({
						"en"
					}) then
						slot5.times:x(slot5.times:x() - 60)
					end

					uv11 = "cfg"

					if slot3.state == slot11.canExchange then
						cache.setShader(slot5.exchangebtn, false, "normal")
						text.addEffect(slot5.exchangebtn:get("label"), {
							color = ui.COLORS.NORMAL.WHITE,
							glow = {
								color = ui.COLORS.GLOW.WHITE
							}
						})
					else
						uv11 = "cfg"

						if slot3.state == slot11.noReach then
							cache.setShader(slot5.exchangebtn, false, "hsl_gray")
							text.deleteAllEffect(slot5.exchangebtn:get("label"))
							text.addEffect(slot5.exchangebtn:get("label"), {
								color = ui.COLORS.DISABLED.WHITE
							})
						end
					end

					bind.touch(slot0, slot5.exchangebtn, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				remindClick = bindHelper.self("onRemindClick"),
				clickCell = bindHelper.self("onExchangeClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.activityId = slot1

	slot0:initModel()

	slot3 = csv.yunying.yyhuodong[slot1].huodongID
	slot0.datas = idlers.new()
	slot0.remind = idler.new(false)

	idlereasy.any({
		slot0.yyhuodongs,
		slot0.remind
	}, function (slot0, slot1)
		slot4 = {}
		uv3 = "userDefault"
		uv4 = "getForeverLocalKey"
		slot3.remindData = userDefault.getForeverLocalKey("activityItemExchange", slot4)[slot4] or {}
		uv3 = "getForeverLocalKey"
		slot5 = {}

		for slot9, slot10 in csvPairs(csv.yunying.itemexchange) do
			uv12 = "activityItemExchange"

			if slot10.huodongID == slot12 then
				uv11 = "remindData"
				slot11 = slot11.noReach
				slot12 = ((slot1[slot3] or {}).stamps or {})[slot9] or 0
				slot13 = true

				for slot18, slot19 in csvMapPairs(slot10.costMap) do
					slot20 = dataEasy.getNumByKey(slot18)

					table.insert({}, {
						key = slot18,
						num = slot20,
						targetNum = slot19
					})

					if slot20 < slot19 then
						slot13 = false
					end
				end

				if slot10.exchangeTimes <= slot12 then
					uv15 = "remindData"
					slot11 = slot15.exchanged
				elseif slot13 then
					uv15 = "remindData"
					slot11 = slot15.canExchange
				end

				slot15, slot16 = csvNext(slot10.items)
				uv20 = "userDefault"

				table.insert(slot5, {
					csvId = slot9,
					cfg = slot10,
					key = slot15,
					num = slot16,
					state = slot11,
					cnt = slot12,
					cost = slot20,
					costMap = slot14,
					remind = slot10.costMap.remindData[slot9] or false
				})
			end
		end

		slot6 = dataEasy.tryCallFunc
		uv7 = "userDefault"

		slot6(slot7.list, "updatePreloadCenterIndex")

		uv6 = "userDefault"

		slot6.datas:update(slot5)
	end)
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
end

function slot1.onRemindClick(slot0, slot1, slot2, slot3)
	slot4 = not slot3.remind
	slot5 = userDefault.getForeverLocalKey("activityItemExchange", {})
	slot0.remindData[slot3.csvId] = slot4
	slot5[slot0.activityId] = slot0.remindData

	gGameModel.forever_dispatch:getIdlerOrigin("activityItemExchange"):set(slot5, true)

	slot0.datas:atproxy(slot2).remind = slot4
end

function slot1.onExchangeClick(slot0, slot1, slot2, slot3)
	uv5 = "state"

	if slot3.state == slot5.canExchange then
		gGameUI:stackUI("common.buy_info", nil, , slot3.cost, {
			id = slot3.key,
			num = slot3.num
		}, {
			flag = "exchange",
			contentType = "num",
			maxNum = slot3.cfg.exchangeTimes - slot3.cnt
		}, slot0:createHandler("getBuyInfoCb", slot3.csvId))
	else
		uv5 = "state"

		if slot3.state == slot5.noReach then
			gGameUI:showTip(gLanguageCsv.exchangeItemNotEnough)
		end
	end
end

function slot1.getBuyInfoCb(slot0, slot1, slot2)
	gGameApp:requestServer("/game/yy/award/get", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityId, slot1, slot2)
end

function slot1.remindUpdata(slot0)
	slot0.remind:set(true, true)
end

return slot1
