slot0 = {
	received = 2,
	noReach = 0,
	canReceive = 1
}
slot1 = {
	received = 2,
	noReach = 1,
	canReceive = 0
}
slot2 = {
	sign = 1,
	reunion = 2
}
slot3 = {
	ReunionGift = 1,
	TaskAward = 3,
	BindAward = 2,
	PointAward = 4
}
slot4 = class("ReunionSignView", cc.load("mvc").ViewBase)
slot4.RESOURCE_FILENAME = "reunion_sign.json"
slot4.RESOURCE_BINDING = {
	["topPanel.textPanel"] = "topTextPanel",
	item = "item",
	["topPanel.textPanel.textBg"] = "toptextBg",
	["topPanel.bg.title"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(242, 122, 96, 255)
				},
				shadow = {
					size = 6,
					color = cc.c4b(195, 109, 72, 255),
					offset = cc.size(0, -6)
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
					slot5 = slot1:multiget("list", "receivebtn", "received", "noReceive", "title", "subList", "item")
					slot9 = gLanguageCsv.currDay

					slot5.title:text(string.format(slot9, slot3.cfg.taskParam))

					uv9 = "cfg"

					slot5.receivebtn:visible(slot3.state == slot9.canReceive)

					uv9 = "cfg"

					slot5.received:visible(slot3.state == slot9.received)

					uv9 = "cfg"

					slot5.noReceive:visible(slot3.state == slot9.noReach)
					bind.touch(slot0, slot5.receivebtn, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
					slot5.list:removeAllItems()
					slot5.list:size(cc.size(376, 560))
					slot5.list:setScrollBarEnabled(false)
					slot5.list:setGravity(ccui.ListViewGravity.bottom)

					slot6 = nil
					slot9 = csvSize(slot4.award) == 1 and slot5.item:size().width / 2 or 0

					for slot13, slot14 in ipairs(dataEasy.getItemData(slot4.award)) do
						slot15 = slot14.key
						slot16 = slot14.num

						if (0 + 1) % 2 == 1 then
							slot6 = slot5.subList:clone():show():tag(math.floor(slot7 / 2 + 1))

							slot6:setScrollBarEnabled(false)
							slot6:setTouchEnabled(false)
							slot5.list:pushBackCustomItem(slot6)
						end

						slot17 = slot5.item:clone():show()
						slot18 = slot17:size()

						bind.extend(slot0, slot17, {
							class = "icon_key",
							props = {
								data = {
									key = slot15,
									num = slot16
								},
								onNode = function (slot0)
									uv3 = "xy"
									uv4 = "width"
									uv4 = "xy"

									slot0:xy(slot3.width / 2 + slot4, slot4.height / 2):scale(0.9)
								end
							}
						})
						slot6:pushBackCustomItem(slot17)
					end

					slot5.list:adaptTouchEnabled():setItemAlignCenter()
				end
			},
			handlers = {
				clickCell = bindHelper.self("onReceiveClick")
			}
		}
	}
}

function slot4.onCreate(slot0, slot1)
	slot0.yyID = slot1
	slot2 = csv.yunying.yyhuodong[slot1]

	slot0:initModel()
	slot0.toptextBg:width(rich.createByStr(string.format(gLanguageCsv.reunionSignText, slot0.reunion:read().info.days), 42):anchorPoint(0, 0.5):addTo(slot0.topTextPanel:get("label")):formatText():width() + 20)

	slot0.datas = idlers.new()

	idlereasy.when(slot0.reunion, function (slot0, slot1)
		slot2 = slot1.stamps or {}
		slot3 = {}

		for slot7, slot8 in csvPairs(csv.yunying.reunion_task) do
			uv10 = "stamps"

			if slot8.huodongID == slot10.huodongID then
				uv10 = "csvPairs"

				if slot8.themeType == slot10.sign then
					uv9 = "csv"
					slot9 = slot9.noReach

					if slot2[slot7] then
						uv11 = "yunying"

						if slot2[slot7] == slot11.canReceive then
							uv10 = "csv"
							slot9 = slot10.canReceive
						end
					elseif slot2[slot7] then
						uv11 = "yunying"

						if slot2[slot7] == slot11.received then
							uv10 = "csv"
							slot9 = slot10.received
						end
					end

					table.insert(slot3, {
						csvId = slot7,
						cfg = slot8,
						state = slot9
					})
				end
			end
		end

		slot4 = dataEasy.tryCallFunc
		uv5 = "reunion_task"

		slot4(slot5.list, "updatePreloadCenterIndex")

		uv4 = "reunion_task"

		slot4.datas:update(slot3)
	end)
end

function slot4.initModel(slot0)
	slot0.reunion = gGameModel.role:getIdler("reunion")
end

function slot4.onReceiveClick(slot0, slot1, slot2, slot3)
	uv5 = "state"

	if slot3.state == slot5.canReceive then
		if slot0.reunion:read().info.end_time - time.getTime() < 0 then
			gGameUI:showTip(gLanguageCsv.activityOver)

			return
		end

		uv10 = "canReceive"

		gGameApp:requestServer("/game/yy/reunion/award/get", function (slot0)
			gGameUI:showGainDisplay(slot0)
		end, slot0.yyID, slot3.csvId, slot10.TaskAward)
	else
		uv5 = "state"

		if slot3.state == slot5.noReach then
			gGameUI:showTip(gLanguageCsv.notReachedCannotGet)
		end
	end
end

return slot4
