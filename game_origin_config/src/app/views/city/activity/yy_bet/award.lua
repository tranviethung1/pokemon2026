slot0 = {
	CAN_NOT_GOTTEN = 2,
	CAN_GOTTEN = 1,
	GOTTEN = 0
}
slot1 = {
	gLanguageCsv.yyBetAward1,
	gLanguageCsv.yyBetAward2,
	gLanguageCsv.yyBetAward3,
	gLanguageCsv.yyBetAward4,
	gLanguageCsv.yyBetAward5,
	gLanguageCsv.yyBetAward6,
	gLanguageCsv.yyBetAward7
}
slot2 = class("YybetAward", Dialog)
slot2.RESOURCE_FILENAME = "yybet_award.json"
slot2.RESOURCE_BINDING = {
	["leftPanel.tabItem"] = "tabItem",
	["topPanel.txt"] = "textTitle",
	item = "item",
	["topPanel.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["leftPanel.tabList"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("tabDatas"),
				item = bindHelper.self("tabItem"),
				showTab = bindHelper.self("showTab"),
				yyID = bindHelper.self("yyID"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("normal", "selected")

					slot4.normal:get("txt"):text(slot3.name)
					slot4.selected:get("txt"):text(slot3.name)
					slot4.normal:visible(not slot3.selected)
					slot4.selected:visible(slot3.selected)
					slot4.normal:setTouchEnabled(true)
					slot4.selected:setTouchEnabled(false)
					slot4.selected:get("txt"):getVirtualRenderer():setLineSpacing(-10)

					if slot3.redHint then
						bind.extend(slot0, slot1, {
							class = "red_hint",
							props = {
								state = slot0.showTab:read() ~= slot2,
								specialTag = slot3.redHint,
								listenData = {
									activityId = slot0.yyID,
									taskType = slot3.type
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

					bind.touch(slot0, slot4.normal, {
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
	["rewardPanel1.list"] = {
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
					slot8 = "list"
					uv8 = "multiget"

					slot1:multiget("achvDesc", "btnGet", slot8, "got").achvDesc:text(string.format(slot8[slot3.targetType], slot3.targetArg))

					if next(slot3.award) ~= nil then
						uiEasy.createItemsToList(slot0, slot4.list, slot3.award, {
							scale = 0.8
						})
					end

					slot5 = slot4.list
					slot6 = slot5

					slot5.setScrollBarEnabled(slot6, false)

					uv6 = "achvDesc"

					if slot3.get == slot6.GOTTEN then
						slot4.got:show()
						slot4.btnGet:hide()
						uiEasy.setBtnShader(slot4.btnGet, slot4.btnGet:get("txt"), 2)
					else
						uv6 = "achvDesc"

						if slot3.get == slot6.CAN_GOTTEN then
							slot4.got:hide()
							slot4.btnGet:show()
							slot4.btnGet:get("txt"):text(gLanguageCsv.spaceReceive)
							uiEasy.setBtnShader(slot4.btnGet, slot4.btnGet:get("txt"), 1)
						else
							slot4.got:hide()
							slot4.btnGet:show()

							if slot3.targetType == 5 then
								slot4.btnGet:get("txt"):text(gLanguageCsv.spaceReceive)
							else
								slot4.btnGet:get("txt"):text(slot3.val .. "/" .. slot3.targetArg)
							end

							uiEasy.setBtnShader(slot4.btnGet, slot4.btnGet:get("txt"), 2)
						end
					end

					bind.touch(slot0, slot4.btnGet, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot3.csvId)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onGetBtn")
			}
		}
	}
}

function slot2.initTools(slot0)
	slot0.tools = require("app.views.city.activity.yy_bet.tools")
end

function slot2.onCreate(slot0, slot1)
	slot0.yyID = slot1

	slot0:initTools()
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

		if slot2.tabDatas:atproxy(slot1) then
			uv2 = "tabDatas"
			slot2.tabDatas:atproxy(slot1).selected = false
		end

		uv2 = "tabDatas"

		if slot2.tabDatas:atproxy(slot0) then
			uv2 = "tabDatas"
			slot2.tabDatas:atproxy(slot0).selected = true
		end

		uv2 = "tabDatas"

		slot2:initRight()

		if slot0 == 1 then
			uv2 = "tabDatas"

			slot2.textTitle:text(gLanguageCsv.task)
		else
			uv2 = "tabDatas"

			slot2.textTitle:text(gLanguageCsv.achievement)
		end
	end)
	Dialog.onCreate(slot0)
end

function slot2.initModel(slot0)
	slot1 = false
	slot2 = false

	for slot6, slot7 in csvPairs(slot0.tools.getCsv("task")) do
		if slot7.type == 2 then
			slot2 = true
		else
			slot1 = true
		end

		if slot1 and slot2 then
			break
		end
	end

	slot0.taskData = idlers.newWithMap({})
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.tabDatas = idlers.newWithMap({})

	if slot1 and slot2 then
		slot0.showTab = idler.new(1)

		slot0.tabDatas:update({
			{
				selected = true,
				redHint = "battleBetTaskAward",
				type = 1,
				name = gLanguageCsv.dailyTasks
			},
			{
				selected = false,
				redHint = "battleBetTaskAward",
				type = 2,
				name = gLanguageCsv.achievement
			}
		})
	elseif slot1 then
		slot0.showTab = idler.new(1)
	elseif slot2 then
		slot0.showTab = idler.new(2)
	end
end

function slot2.onTabClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

function slot2.initRight(slot0)
	slot1 = {}
	slot2 = {}
	slot4 = csv.yunying.yyhuodong[slot0.yyID].huodongID
	slot6 = slot0.yydata.valsums or {}

	for slot10, slot11 in csvPairs(slot0.tools.getCsv("task")) do
		csvClone(slot11).csvId = slot10

		if not (slot0.yydata.stamps or {})[slot10] then
			uv13 = "csv"
			slot13 = slot13.CAN_NOT_GOTTEN
		end

		slot12.get = slot13
		slot12.val = slot6[slot10] or 0
		slot12.type = slot11.type

		if slot11.type == 2 then
			table.insert(slot2, slot12)
		else
			table.insert(slot1, slot12)
		end
	end

	if slot0.showTab:read() == 1 then
		slot0.taskData:update(slot1)
	elseif slot0.showTab:read() == 2 then
		slot0.taskData:update(slot2)
	end
end

function slot2.onSortCards(slot0, slot1)
	return function (slot0, slot1)
		if (slot0.get == 2 and 0.5 or slot0.get) ~= (slot1.get == 2 and 0.5 or slot1.get) then
			return slot3 < slot2
		end

		return slot0.csvId < slot1.csvId
	end
end

function slot2.onGetBtn(slot0, slot1, slot2)
	gGameApp:requestServer(slot0.tools.getProtocol("award"), function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.yyID, 2, slot2)
end

return slot2
