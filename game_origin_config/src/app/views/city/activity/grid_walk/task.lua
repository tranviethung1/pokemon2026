slot0 = {
	CAN_NOT_GOTTEN = 2,
	CAN_GOTTEN = 1,
	GOTTEN = 0
}

function slot1(slot0, slot1)
	slot0:setTouchEnabled(slot1)
	cache.setShader(slot0, false, slot1 and "normal" or "hsl_gray")

	if slot1 then
		text.addEffect(slot0:get("txt"), {
			glow = {
				color = ui.COLORS.GLOW.WHITE
			}
		})
	else
		text.deleteAllEffect(slot0:get("txt"))
	end
end

slot2 = class("GridWalkTask", Dialog)
slot2.RESOURCE_FILENAME = "grid_walk_task.json"
slot2.RESOURCE_BINDING = {
	tabItem = "tabItem",
	item = "item",
	label = "label",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	tabList = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("tabDatas"),
				item = bindHelper.self("tabItem"),
				showTab = bindHelper.self("showTab"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("normal", "selected", "txt")

					slot4.txt:text(slot3.name)
					slot4.normal:visible(not slot3.selected)
					slot4.selected:visible(slot3.selected)
					slot1:setTouchEnabled(not slot3.selected)
					text.deleteAllEffect(slot4.txt)

					if slot3.selected then
						text.addEffect(slot4.txt, {
							color = ui.COLORS.NORMAL.WHITE,
							glow = {
								color = ui.COLORS.GLOW.WHITE
							}
						})
					else
						text.addEffect(slot4.txt, {
							color = ui.COLORS.NORMAL.RED
						})
					end

					if slot3.redHint then
						bind.extend(slot0, slot1, {
							class = "red_hint",
							props = {
								state = slot0.showTab:read() ~= slot2,
								specialTag = slot3.redHint,
								onNode = function (slot0)
									uv3 = "xy"
									slot4 = slot3
									uv4 = "xy"

									slot0:xy(slot3.width(slot4), slot4:height())
								end
							}
						})
					end

					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onTabClick")
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
				padding = 4,
				data = bindHelper.self("taskData"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				dataOrderCmpGen = bindHelper.self("onSortCards", true),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("desc", "imgReceived", "num", "btnReceive", "itemsList", "btnGoto")

					if next(slot3.award) ~= nil then
						uiEasy.createItemsToList(slot0, slot4.itemsList, slot3.award, {
							scale = 0.7,
							margin = 20
						})
					end

					slot4.desc:text(slot3.desc)
					adapt.setTextAdaptWithSize(slot4.desc, {
						maxLine = 2,
						vertical = "center",
						horizontal = "center",
						size = cc.size(530, 100)
					})
					slot4.num:text((slot3.val or 0) .. "/" .. slot3.taskParam)

					if slot3.goTo == "" then
						uv7 = "multiget"

						if slot3.get ~= slot7.CAN_GOTTEN then
							slot4.num:y(slot1:height() / 2)
						end
					end

					uv9 = "multiget"

					slot4.num:visible(slot3.get ~= slot9.GOTTEN)

					slot6 = slot4.btnGoto
					slot7 = slot6
					slot6 = slot6.visible

					if slot3.get then
						uv9 = "multiget"

						if slot3.get ~= slot9.CAN_NOT_GOTTEN or slot3.goTo == "" then
							slot8 = false
						else
							slot8 = true
						end
					end

					slot6(slot7, slot8)

					uv9 = "multiget"

					slot4.btnReceive:visible(slot3.get == slot9.CAN_GOTTEN)

					uv9 = "multiget"

					slot4.imgReceived:visible(slot3.get == slot9.GOTTEN)
					text.addEffect(slot4.num, {
						color = slot3.taskParam <= slot5 and ui.COLORS.NORMAL.FRIEND_GREEN or ui.COLORS.NORMAL.ALERT_ORANGE
					})
					text.addEffect(slot4.btnReceive:get("txt"), {
						glow = {
							color = ui.COLORS.GLOW.WHITE
						}
					})
					text.addEffect(slot4.btnGoto:get("txt"), {
						glow = {
							color = ui.COLORS.GLOW.WHITE
						}
					})
					bind.touch(slot0, slot4.btnReceive, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot3.csvId)
						}
					})
					bind.touch(slot0, slot4.btnGoto, {
						methods = {
							ended = functools.partial(slot0.clickGotoCell, slot3.goTo)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onGetBtn"),
				clickGotoCell = bindHelper.self("onGotoBtn")
			}
		}
	},
	btnOneKey = {
		varname = "btnOneKey",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onOneKey")
			}
		}
	},
	["btnOneKey.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	slot0.callBack = slot1.callBack

	slot0:initModel()
	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "yyID"
		uv3 = "yyID"
		slot3.yydata = slot1[slot2.yyID] or {}
		uv3 = "yyID"

		slot3:initRight()
	end)
	slot0.showTab:addListener(function (slot0, slot1)
		uv2 = "tabDatas"
		slot2 = slot2.tabDatas:atproxy(slot1)
		slot2.selected = false
		uv2 = "tabDatas"
		slot2 = slot2.tabDatas:atproxy(slot0)
		slot2.selected = true
		uv2 = "tabDatas"
		slot2 = slot2.label
		slot2 = slot2.visible

		slot2(slot2, slot0 == 1)

		uv2 = "tabDatas"

		slot2:initRight()
	end)
	Dialog.onCreate(slot0)
end

function slot2.initModel(slot0)
	slot0.yyID = gGameModel.role:read("grid_walk").yy_id
	slot0.showTab = idler.new(1)
	slot0.taskData = idlers.newWithMap({})
	slot0.tabDatas = idlers.newWithMap({
		{
			selected = true,
			redHint = "gridWalkTask",
			name = gLanguageCsv.dailyTasks
		},
		{
			selected = false,
			redHint = "gridWalkAchievements",
			name = gLanguageCsv.treasureAchievements
		}
	})
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
end

function slot2.onTabClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

function slot2.initRight(slot0)
	slot1 = {}
	slot2 = {}
	slot3 = false

	for slot11, slot12 in csvPairs(csv.yunying.grid_walk_tasks) do
		if slot12.huodongID == csv.yunying.yyhuodong[slot0.yyID].huodongID then
			slot13 = table.shallowcopy(slot12)
			slot13.csvId = slot11
			slot13.get = (slot0.yydata.stamps or {})[slot11]
			slot13.val = (slot0.yydata.valsums or {})[slot11]

			if slot13.get == 1 then
				slot3 = true
			end

			if slot12.taskType == 0 then
				table.insert(slot2, slot13)
			else
				table.insert(slot1, slot13)
			end
		end
	end

	if slot0.showTab:read() == 1 then
		slot0.taskData:update(slot1)
	elseif slot0.showTab:read() == 2 then
		slot0.taskData:update(slot2)
	end

	uv8 = "csv"

	slot8(slot0.btnOneKey, slot3)
end

function slot2.onSortCards(slot0, slot1)
	return function (slot0, slot1)
		if (slot0.get or 0.5) ~= (slot1.get or 0.5) then
			return slot3 < slot2
		end

		return slot0.csvId < slot1.csvId
	end
end

function slot2.onGetBtn(slot0, slot1, slot2)
	gGameApp:requestServer("/game/yy/award/get", function (slot0)
		slot1 = gGameUI
		slot1 = slot1.showGainDisplay

		slot1(slot1, slot0)

		uv1 = "gGameUI"

		slot1.callBack()
	end, slot0.yyID, slot2)
end

function slot2.onOneKey(slot0)
	gGameApp:requestServer("/game/yy/award/get/onekey", function (slot0)
		slot1 = gGameUI
		slot1 = slot1.showGainDisplay

		slot1(slot1, slot0)

		uv1 = "gGameUI"

		slot1.callBack()
	end, slot0.yyID)
end

function slot2.onGotoBtn(slot0, slot1, slot2)
	jumpEasy.jumpTo(slot2)
end

return slot2
