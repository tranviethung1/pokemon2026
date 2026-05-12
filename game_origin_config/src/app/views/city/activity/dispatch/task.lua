slot0 = {
	CAN_NOT_GOTTEN = 2,
	CAN_GOTTEN = 1,
	GOTTEN = 0
}
slot1 = class("ActitivyDispatchTask", Dialog)
slot1.RESOURCE_FILENAME = "activity_dispatch_task.json"
slot1.RESOURCE_BINDING = {
	rankItem = "rankItem",
	["leftPanel.tabItem"] = "tabItem",
	rewardPanel1 = "rewardPanel1",
	["topPanel.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnOneKeyGet = {
		varname = "btnOneKeyGet",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onOneKeyGetBtn")
			}
		}
	},
	["btnOneKeyGet.text"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["leftPanel.tabList"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("tabDatasIdlers"),
				item = bindHelper.self("tabItem"),
				showTab = bindHelper.self("showTab"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()

						slot6 = slot1:get("selected"):show()
					else
						slot5:hide()

						slot6 = slot4:show()
					end

					if slot3.redHint then
						bind.extend(slot0, slot1, {
							class = "red_hint",
							props = {
								state = slot0.showTab:read() ~= slot2,
								specialTag = slot3.redHint,
								listenData = {
									activityId = slot3.id,
									type = slot3.type
								},
								onNode = function (slot0)
									uv3 = "xy"
									slot4 = slot3
									uv4 = "xy"

									slot0:xy(slot3.width(slot4), slot4:height())
								end
							}
						})
					end

					slot6:get("txt"):text(slot3.name)
					adapt.setAutoText(slot6:get("txt"), nil, 200)
					slot5:setTouchEnabled(false)
					bind.touch(slot0, slot4, {
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
	["rankItem.btnGet.text"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["rewardPanel1.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 5,
				data = bindHelper.self("achvDatas1"),
				item = bindHelper.self("rankItem"),
				dataOrderCmpGen = bindHelper.self("onSortCards", true),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:multiget("achvDesc", "btnGet", "list", "got", "txt", "btnGoto").achvDesc:text(slot3.desc)

					if next(slot3.award) ~= nil then
						uiEasy.createItemsToList(slot0, slot4.list, slot3.award, {
							scale = 0.8
						})
					end

					slot4.list:setScrollBarEnabled(false)
					bind.touch(slot0, slot4.btnGet, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot3.csvId)
						}
					})
					bind.touch(slot0, slot4.btnGoto, {
						methods = {
							ended = functools.partial(slot0.clickGotoCell, slot3.goTo)
						}
					})
					slot4.txt:text(slot3.progress .. "/" .. slot3.taskParam)

					if slot3.achType == 1 then
						slot4.txt:hide()
						slot4.btnGet:y(120)
					end

					uv6 = "multiget"

					if slot3.get == slot6.GOTTEN then
						slot4.btnGoto:hide()
						slot4.btnGet:get("txt"):text(gLanguageCsv.received)
						slot4.txt:setTextColor(cc.c4b(98, 197, 88, 255))
					else
						uv6 = "multiget"

						if slot3.get == slot6.CAN_GOTTEN then
							slot4.btnGoto:hide()
							slot4.btnGet:get("txt"):text(gLanguageCsv.spaceReceive)
							slot4.txt:setTextColor(cc.c4b(98, 197, 88, 255))
						else
							slot4.btnGoto:hide()
							slot4.btnGet:get("txt"):text(gLanguageCsv.spaceReceive)
							slot4.txt:setTextColor(cc.c4b(247, 115, 78, 255))

							if slot3.achType == 5 then
								if slot3.goTo == "" then
									slot4.btnGet:show()
									slot4.btnGoto:hide()
								else
									slot4.btnGet:hide()
									slot4.btnGoto:show()
								end
							end
						end
					end

					uiEasy.setBtnShader(slot4.btnGet, slot4.btnGet:get("txt"), slot3.get)
				end
			},
			handlers = {
				clickCell = bindHelper.self("onGetBtn"),
				clickGotoCell = bindHelper.self("onGotoBtn")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.activityId = slot1

	slot0.rewardPanel1:show()

	slot3 = 0

	for slot7, slot8 in orderCsvPairs(csv.yunying.dispatch_task) do
		if slot8.huodongID == csv.yunying.yyhuodong[slot0.activityId].huodongID then
			slot3 = slot8.type

			break
		end
	end

	slot0.showTab = idler.new(slot3)

	slot0:initModel()
	Dialog.onCreate(slot0)
end

function slot1.initModel(slot0)
	slot0.achvDatas1 = idlers.new()
	slot0.tabDatasIdlers = idlers.new()
	slot1 = {
		{
			redHint = "dispatchTaskType",
			type = 1,
			name = gLanguageCsv.dispatchTaskType1,
			id = slot0.activityId
		},
		{
			redHint = "dispatchTaskType",
			type = 2,
			name = gLanguageCsv.dispatchTaskType2,
			id = slot0.activityId
		},
		{
			redHint = "dispatchTaskType",
			type = 3,
			name = gLanguageCsv.dispatchTaskType3,
			id = slot0.activityId
		},
		{
			redHint = "dispatchTaskType",
			type = 4,
			name = gLanguageCsv.dispatchTaskType4,
			id = slot0.activityId
		},
		{
			redHint = "dispatchTaskType",
			type = 5,
			name = gLanguageCsv.dispatchTaskType5,
			id = slot0.activityId
		}
	}
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "activityId"
		slot4 = {}
		uv5 = "activityId"
		slot6 = {}
		slot5.datas = slot6
		uv6 = "activityId"
		slot6 = false

		for slot10, slot11 in orderCsvPairs(csv.yunying.dispatch_task) do
			if slot11.huodongID == csv.yunying.yyhuodong[slot6.activityId].huodongID then
				table.shallowcopy(slot11).csvId = slot10
				slot12.get = (slot2.stamps or {})[slot10]
				slot12.progress = ((slot1[slot2.activityId] or {}).valsums or {})[slot10] or 0
				slot14 = slot11.type
				slot12.achType = slot14
				uv14 = "activityId"
				uv16 = "activityId"
				slot14.datas[slot11.type] = slot16.datas[slot11.type] or {}
				slot14 = slot11.type

				if not slot4[slot11.type] then
					uv15 = "valsums"
					slot15 = slot15[slot11.type]
				end

				slot4[slot14] = slot15
				uv15 = "activityId"
				slot15 = slot15.datas[slot11.type]

				table.insert(slot15, slot12)

				uv15 = "datas"

				if slot12.get == slot15.CAN_GOTTEN then
					slot6 = true
				end
			end
		end

		slot7 = uiEasy.setBtnShader
		uv8 = "activityId"
		uv9 = "activityId"
		slot9 = slot9.btnOneKeyGet:get("txt")
		slot10 = slot6 == false and 2 or 1

		slot7(slot8.btnOneKeyGet, slot9, slot10)

		uv7 = "activityId"
		slot7 = slot7.achvDatas1
		slot7 = slot7.update
		uv9 = "activityId"
		uv10 = "activityId"

		slot7(slot7, slot9.datas[slot10.showTab:read()])

		uv7 = "activityId"

		slot7.tabDatasIdlers:update(slot4)
	end)
	slot0.showTab:addListener(function (slot0, slot1)
		uv2 = "tabDatasIdlers"
		slot2 = slot2.tabDatasIdlers:atproxy(slot1)
		slot2.select = false
		uv2 = "tabDatasIdlers"
		slot4 = slot0
		slot2 = slot2.tabDatasIdlers:atproxy(slot4)
		slot2.select = true
		uv2 = "tabDatasIdlers"
		uv4 = "tabDatasIdlers"

		slot2.achvDatas1:update(slot4.datas[slot0])
	end)
end

function slot1.onTabClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

function slot1.onGetBtn(slot0, slot1, slot2)
	gGameApp:requestServer("/game/yy/award/get", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityId, slot2)
end

function slot1.onOneKeyGetBtn(slot0, slot1)
	gGameApp:requestServer("/game/yy/award/get/onekey", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityId)
end

function slot1.onGotoBtn(slot0, slot1, slot2)
	jumpEasy.jumpTo(slot2)
end

function slot1.onSortCards(slot0, slot1)
	return function (slot0, slot1)
		if (slot0.get or 0.5) ~= (slot1.get or 0.5) then
			return slot3 < slot2
		end

		return slot0.csvId < slot1.csvId
	end
end

return slot1
