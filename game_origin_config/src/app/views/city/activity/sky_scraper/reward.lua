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

slot2 = class("SkyScraperRewardView", Dialog)
slot2.RESOURCE_FILENAME = "sky_scraper_reward.json"
slot2.RESOURCE_BINDING = {
	["leftPanel.barPanel.txt"] = "barTxt",
	["leftPanel.barPanel"] = "barPanel",
	leftPanel = "leftPanel",
	["rightPanel.tabItem"] = "tabItem",
	["leftPanel.max"] = "max",
	["leftPanel.icon"] = "icon",
	["rightPanel.centerItem"] = "centerItem",
	["topPanel.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["leftPanel.bar"] = {
		varname = "bar",
		binds = {
			event = "extend",
			class = "loadingbar",
			props = {
				data = bindHelper.self("curPagePro")
			}
		}
	},
	["leftPanel.box"] = {
		varname = "panelBox",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBoxClick")
			}
		}
	},
	["rightPanel.tabList"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				padding = 5,
				data = bindHelper.self("tabDatas"),
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
									id = slot3.id
								},
								onNode = function (slot0)
									uv3 = "xy"
									slot4 = slot3
									uv4 = "xy"

									slot0:xy(slot3.width(slot4) + 5, slot4:height() + 5)
								end
							}
						})
					end

					slot6:get("txt"):text(slot3.name)
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
	["rightPanel.centerList"] = {
		varname = "centerList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 5,
				padding = 5,
				data = bindHelper.self("centerData"),
				item = bindHelper.self("centerItem"),
				itemAction = {
					isAction = true
				},
				dataOrderCmpGen = bindHelper.self("onSortCards", true),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("icon", "taskName", "taskNumTxt", "btnGet", "itemList", "got")

					if next(slot3.award) ~= nil then
						uiEasy.createItemsToList(slot0, slot4.itemList, slot3.award, {
							scale = 0.7,
							margin = 20
						})
					end

					slot4.taskName:text(slot3.label)
					slot4.icon:get("txt"):text(slot3.points)
					slot4.taskNumTxt:text((slot3.had or 0) .. "/" .. slot3.params)

					slot7 = slot0

					bind.touch(slot7, slot4.btnGet, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot3.csvId)
						}
					})

					uv7 = "multiget"

					if slot3.get == slot7.GOTTEN then
						slot4.btnGet:visible(false)
						slot4.got:visible(true)
						slot4.taskNumTxt:visible(false)
					else
						uv6 = "icon"
						uv9 = "multiget"

						slot6(slot4.btnGet, slot3.get == slot9.CAN_GOTTEN)
						text.addEffect(slot4.taskNumTxt, {
							color = slot3.params <= slot5 and cc.c4b(96, 196, 86, 255) or cc.c4b(247, 107, 67, 255)
						})
						slot4.btnGet:visible(true)
						slot4.got:visible(false)
						slot4.taskNumTxt:visible(true)
					end
				end
			},
			handlers = {
				clickCell = bindHelper.self("onGetBtn")
			}
		}
	},
	["rightPanel.btnOneKey"] = {
		varname = "getBtn1",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onOneKey")
			}
		}
	},
	["rightPanel.btnOneKey.txt"] = {
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
	slot0.activityId = slot1
	slot0.showTab = idler.new(1)

	slot0:initModel()
	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "activityId"
		uv3 = "activityId"
		slot3.yydata = slot1[slot2.activityId] or {}
		uv3 = "activityId"
		slot3 = slot3.initLeft

		slot3(slot3)

		uv3 = "activityId"
		uv5 = "activityId"

		slot3:initRight(slot5.activityId)
	end)
	slot0.showTab:addListener(function (slot0, slot1)
		uv2 = "tabDatas"
		slot2 = slot2.tabDatas:atproxy(slot1)
		slot2.select = false
		uv2 = "tabDatas"
		slot4 = slot0
		slot2 = slot2.tabDatas:atproxy(slot4)
		slot2.select = true
		uv2 = "tabDatas"
		uv4 = "tabDatas"

		slot2:initRight(slot4.activityId)
	end)
	Dialog.onCreate(slot0)
end

function slot2.initModel(slot0)
	slot0.centerData = idlers.newWithMap({})
	slot0.curPagePro = idler.new(0)
	slot0.tabDatas = idlers.newWithMap({
		{
			redHint = "skyScraperSetTask",
			name = gLanguageCsv.skyScraperS,
			id = slot0.activityId
		},
		{
			redHint = "skyScraperScoreTask",
			name = gLanguageCsv.skyScraperScoreTask,
			id = slot0.activityId
		},
		{
			redHint = "skyScraperPerfectStructures",
			name = gLanguageCsv.skyScraperPerfectStructures,
			id = slot0.activityId
		}
	})
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
end

function slot2.onTabClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

function slot2.onGetBtn(slot0, slot1, slot2)
	gGameApp:requestServer("/game/yy/skyscraper/awards", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityId, slot2, 0)
end

function slot2.initLeft(slot0)
	slot0.huodongId = csv.yunying.yyhuodong[slot0.activityId].huodongID
	slot2 = csv.yunying.skyscraper_medals
	slot4 = (slot0.yydata.info or {}).task_points or 0
	slot5 = 0
	slot6 = slot0.yydata.stamps1 or {}
	slot7 = 0
	slot8 = 1
	slot9 = 0

	for slot13, slot14 in orderCsvPairs(slot2) do
		if slot14.huodongID == slot0.huodongId and slot2[slot8].medalLevel < slot14.medalLevel then
			slot8 = slot13 or slot8
		end
	end

	for slot13, slot14 in orderCsvPairs(slot2) do
		if slot14.huodongID == slot0.huodongId and slot4 < slot7 + slot14.points then
			slot9 = slot13
			slot5 = slot4 - (slot7 - slot14.points)

			break
		end
	end

	if slot9 == 0 then
		slot9 = slot8

		slot0.curPagePro:set(100)
		slot0.max:visible(true)
		slot0.barPanel:visible(false)
	else
		slot0.curPagePro:set(math.min(100, slot5 / slot2[slot9].points * 100))
		slot0.max:visible(false)
		slot0.barPanel:visible(true)
		slot0.barTxt:text(slot5 .. "/" .. slot2[slot9].points)
	end

	slot0.icon:texture(slot2[slot9].resource)
	slot0.icon:get("imgRank"):texture(slot2[slot9].resourceNum)
	slot0.icon:get("textRank"):text(gLanguageCsv[slot2[slot9].medalsName])

	slot14 = slot2[slot9].color

	slot0.icon:get("textRank"):setTextColor(cc.c3b(unpack(slot14)))
	adapt.setTextScaleWithWidth(slot0.icon:get("textRank"), false, 180)

	slot10 = false

	for slot14, slot15 in pairs(slot6) do
		if slot15 == 1 then
			slot10 = true

			break
		end
	end

	slot0.panelBox:visible(true)

	if slot10 then
		slot11 = widget.addAnimationByKey(slot0.leftPanel, "effect/jiedianjiangli.skel", "effect", "effect_loop", 1):xy(slot0.panelBox:x(), slot0.panelBox:y() - 50)
	else
		slot0.leftPanel:removeChildByName("effect")

		if curMedal == slot2[slot8].medalLevel + 1 then
			slot0.panelBox:visible(false)
			slot0.leftPanel:removeChildByName("effect")
		end
	end
end

function slot2.initRight(slot0, slot1)
	slot2 = {}
	slot3 = {}
	slot4 = {}
	slot5 = false
	slot8 = slot0.yydata.info or {}

	for slot12, slot13 in csvPairs(csv.yunying.skyscraper_tasks) do
		if slot13.huodongID == csv.yunying.yyhuodong[slot1].huodongID then
			table.shallowcopy(slot13).csvId = slot12
			slot14.get = (slot0.yydata.stamps or {})[slot12]

			if slot14.get == 1 and slot13.type == 1 then
				slot5 = true
			elseif slot14.get == 1 and slot13.type == 2 then
				slot5 = true
			elseif slot14.get == 1 and slot13.type == 3 then
				slot5 = true
			end

			if slot13.type == 1 then
				slot14.had = slot8.floors

				table.insert(slot2, slot14)
			elseif slot13.type == 2 then
				slot14.had = slot8.points

				table.insert(slot3, slot14)
			elseif slot13.type == 3 then
				slot14.had = slot8.perfections

				table.insert(slot4, slot14)
			end
		end
	end

	if slot0.showTab:read() == 1 then
		slot0.centerData:update(slot2)
	elseif slot0.showTab:read() == 2 then
		slot0.centerData:update(slot3)
	else
		slot0.centerData:update(slot4)
	end

	uv9 = "csv"

	slot9(slot0.getBtn1, slot5)
end

function slot2.onBoxClick(slot0)
	slot0.huodongId = csv.yunying.yyhuodong[slot0.activityId].huodongID
	slot2 = slot0.yydata.stamps1 or {}
	slot5 = {}

	for slot10, slot11 in orderCsvPairs(csv.yunying.skyscraper_medals) do
		if slot11.huodongID == slot0.huodongId and ((slot0.yydata.info or {}).task_points or 0) < 0 + slot11.points then
			slot5 = slot11.award

			break
		end
	end

	slot7 = false

	for slot12, slot13 in pairs(slot2) do
		if slot13 == 1 then
			slot7 = true

			if nil == nil then
				slot8 = slot12
			elseif slot12 < slot8 then
				slot8 = slot12
			end
		end
	end

	if slot7 then
		gGameApp:requestServer("/game/yy/skyscraper/awards", function (slot0)
			gGameUI:showGainDisplay(slot0)
		end, slot0.activityId, slot8, 1)
	elseif itertools.size(slot5) ~= 0 then
		gGameUI:showBoxDetail({
			state = 1,
			data = slot5,
			content = gLanguageCsv.skyScraperBoxTip
		})
	end
end

function slot2.onSortCards(slot0, slot1)
	return function (slot0, slot1)
		if (slot0.get or 0.5) ~= (slot1.get or 0.5) then
			return slot3 < slot2
		end

		return slot0.csvId < slot1.csvId
	end
end

function slot2.onOneKey(slot0)
	gGameApp:requestServer("/game/yy/award/get/onekey", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityId)
end

return slot2
