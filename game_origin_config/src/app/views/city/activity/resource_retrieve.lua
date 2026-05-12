slot0 = {
	equipItems = 5,
	energyItems = 6,
	advanceItems = 4,
	roleExp = 1,
	gold = 2,
	expItems = 3
}
slot1 = {
	gold = gLanguageCsv.gold,
	roleExp = gLanguageCsv.experience,
	advanceItems = gLanguageCsv.advanceMaterial,
	expItems = gLanguageCsv.experienceMaterial,
	equipItems = gLanguageCsv.accessoriesDrawing,
	energyItems = gLanguageCsv.energyItems
}
slot2 = {
	equipItems = "icon_sptz.png",
	energyItems = "icon_nlhx.png",
	advanceItems = "icon_jjcl.png",
	roleExp = "icon_wjjy.png",
	gold = "icon_jb.png",
	expItems = "icon_jlyl.png"
}
slot3 = {
	FREE = 1,
	ALL = 2,
	NOT = 0
}
slot4 = {
	[0] = gLanguageCsv.canRetrieve,
	gLanguageCsv.canAlsoRetrieve,
	gLanguageCsv.haveRetrieved
}
slot5 = class("ActivityResourceRetrieve", cc.load("mvc").ViewBase)
slot5.RESOURCE_FILENAME = "activity_resource_retrieve.json"
slot5.RESOURCE_BINDING = {
	item = "item",
	["item.textCount1"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(178, 119, 0, 255)
				}
			}
		}
	},
	["item.textCount2"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(178, 119, 0, 255)
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
				data = bindHelper.self("itemsData"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot0.initItem(slot1, slot2, slot3)
				end,
				itemAction = {
					isAction = true
				},
				dataOrderCmp = function (slot0, slot1)
					return slot0.order < slot1.order
				end
			},
			handlers = {
				initItem = bindHelper.self("initItem")
			}
		}
	}
}

function slot5.onCreate(slot0, slot1)
	slot0.activityId = slot1

	slot0:initModel()
	slot0:initData()
end

function slot5.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.yyOpen = gGameModel.role:read("yy_open")
	slot0.itemsData = idlertable.new({})
	slot0.roleLv = gGameModel.role:getIdler("level")
	slot0.rmb = gGameModel.role:getIdler("rmb")
end

function slot5.initData(slot0)
	slot1 = csv.yunying.yyhuodong[slot0.activityId]
	slot2 = slot1.clientParam
	slot3 = slot1.huodongID

	idlereasy.any({
		slot0.yyhuodongs,
		slot0.rmb
	}, function (slot0, slot1, slot2)
		uv3 = "activityId"

		if (slot1[slot3.activityId] or {}).lastday ~= tonumber(time.getTodayStrInClock()) then
			return
		end

		slot5 = {}

		for slot9, slot10 in csvPairs(csv.yunying.retrieve) do
			uv12 = "lastday"

			if slot10.huodongID == slot12 and slot3.info.level == slot10.level then
				slot5 = slot10
			end
		end

		slot6 = {}
		slot7 = {}
		uv9 = "tonumber"

		if slot9.limit < slot3.info.days then
			uv8 = "tonumber"

			if not slot8.limit then
				slot8 = slot3.info.days
			end
		end

		uv9 = "tonumber"
		slot9 = slot9.dayUpd[slot8]

		for slot13, slot14 in csvMapPairs(slot5) do
			if slot13 ~= "cost" and slot13 ~= "level" and slot13 ~= "huodongID" then
				slot15 = {
					percent = 100,
					key = slot13,
					item = slot16,
					retrieveState = slot16.NOT
				}
				slot16 = {}
				uv16 = "time"
				slot16 = {}

				for slot20, slot21 in csvMapPairs(slot14) do
					table.insert(slot16, {
						item = slot20,
						count = slot21 * slot9
					})
				end

				if #slot16 ~= 0 then
					uv17 = "getTodayStrInClock"
					slot15.order = slot17[slot13] or 100

					if slot3.retrieve_award ~= nil then
						if type(slot3.retrieve_award[slot13]) == "table" and slot3.retrieve_award[slot13].rmb == 1 then
							uv17 = "time"
							slot15.retrieveState = slot17.ALL
							slot15.percent = 0
						elseif type(slot3.retrieve_award[slot13]) == "table" and slot3.retrieve_award[slot13].free == 1 then
							uv17 = "time"
							slot17 = slot17.FREE
							slot15.retrieveState = slot17
							uv17 = "tonumber"
							slot15.percent = 100 - slot17.freeProportion
						else
							uv17 = "time"
							slot15.retrieveState = slot17.NOT
							slot15.percent = 100
						end
					end

					slot15.item = slot16
					slot6[slot13] = slot15
				end
			elseif slot13 == "cost" then
				slot7 = slot14
			end
		end

		for slot13, slot14 in csvMapPairs(slot7) do
			uv15 = "tonumber"

			if slot6[slot13] then
				slot6[slot13].cost = math.ceil(slot15.rmbUpd[slot8] * slot14)
				slot6[slot13].canBuy = slot6[slot13].cost <= slot2
			end
		end

		slot10 = dataEasy.tryCallFunc
		uv11 = "activityId"

		slot10(slot11.list, "updatePreloadCenterIndex")

		uv10 = "activityId"

		slot10.itemsData:set(slot6)
	end)
	slot0.roleLv:addListener(function (slot0, slot1)
		print("curval == oldval", slot0, slot1)

		if slot0 == slot1 then
			return
		end

		gGameUI:stackUI("common.upgrade_notice", nil, , slot1)
	end, true)
end

function slot5.initItem(slot0, slot1, slot2, slot3, slot4)
	slot5 = csv.yunying.yyhuodong[slot0.activityId].clientParam.freeProportion
	slot6 = slot2:get("textType")
	slot11 = slot2:get("textCount")
	slot12 = 0
	uv14 = "csv"

	if slot4.retrieveState == slot14.NOT then
		slot2:get("imgFound"):hide()
		slot2:get("imgAllFound"):hide()
		slot2:get("btnFree"):show()
		slot2:get("btnBuy"):show()

		slot15 = "textState"
		uv15 = "yunying"

		slot2:get(slot15):text(slot15[0])
	else
		uv14 = "csv"

		if slot4.retrieveState == slot14.FREE then
			slot9:show()
			slot10:hide()
			slot7:hide()
			slot8:show()

			slot15 = "textState"
			uv15 = "yunying"

			slot2:get(slot15):text(slot15[1])
		else
			uv14 = "csv"

			if slot4.retrieveState == slot14.ALL then
				slot9:hide()
				slot10:show()
				slot8:hide()
				slot7:hide()

				slot15 = "textState"
				uv15 = "yunying"

				slot2:get(slot15):text(slot15[2])
			else
				printWarn("retrieveState error %s ", slot4.retrieveState)
			end
		end
	end

	if matchLanguage({
		"en"
	}) then
		slot2:get("img3"):width(slot2:get("textState"):width() + 40)
	end

	slot13 = slot2:get("textCount1")
	slot14 = slot2:get("textCount2")
	slot15 = slot2:get("imgIcon1")
	slot16 = slot2:get("imgIcon2")
	slot17 = slot4.item
	slot18 = math.floor

	slot15:texture(dataEasy.getIconResByKey(slot17[1].item))
	slot13:text(function (slot0, slot1)
		if slot1 == 100 then
			return math.floor(slot0)
		elseif slot1 ~= 0 then
			uv4 = "math"

			return math.floor(slot0 - math.floor(slot0 * slot4 / 100))
		elseif slot1 == 0 then
			return math.floor(slot0)
		end
	end(slot17[1].count, slot4.percent))

	if slot17[2] ~= nil then
		slot13:x(169)
		slot15:x(slot13:x() - slot13:size().width / 2 - 10)
		slot14:text(slot19(slot17[2].count, slot4.percent)):show()
		slot14:x(394)
		slot16:x(slot14:x() - slot14:size().width / 2 - 10)
		slot16:texture(dataEasy.getIconResByKey(slot17[2].item))
	else
		slot13:x(264)
		slot15:x(slot13:x() - slot13:size().width / 2 - 10)
		slot14:hide()
		slot16:hide()
	end

	uv23 = "yyhuodong"

	slot2:get("imgAwardIcon"):texture("activity/resource_find/" .. slot23[slot4.key])

	slot22 = "textType"
	uv22 = "activityId"

	slot2:get(slot22):text(slot22[slot4.key])
	slot8:get("price"):text(slot4.cost)

	if slot4.canBuy == false then
		slot8:get("price"):setTextColor(ui.COLORS.NORMAL.ALERT_YELLOW)
	else
		slot8:get("price"):setTextColor(ui.COLORS.WHITE)
	end

	slot2:get("textRemainPercent"):text(slot4.percent .. "%")
	bind.touch(slot0, slot7, {
		methods = {
			ended = functools.partial(slot0.sendGetAward, slot0, slot4.key, "free", 0)
		}
	})
	bind.touch(slot0, slot8, {
		methods = {
			ended = functools.partial(slot0.sendGetAward, slot0, slot4.key, "rmb", slot4.cost)
		}
	})
end

function slot5.sendGetAward(slot0, slot1, slot2, slot3)
	if slot3 > 0 and gGameModel.role:read("rmb") < slot3 then
		uiEasy.showDialog("rmb")

		return
	end

	if slot3 > 0 then
		dataEasy.sureUsingDiamonds(function ()
			uv4 = "gGameApp"
			uv5 = "requestServer"
			uv6 = "/game/yy/retrieve/get"

			gGameApp:requestServer("/game/yy/retrieve/get", function (slot0)
				gGameUI:showGainDisplay(slot0)
			end, slot4.activityId, slot5, slot6)
		end, slot3)
	else
		slot4()
	end
end

return slot5
