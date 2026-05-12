slot0 = {
	1,
	2,
	3,
	4,
	5
}
slot1 = require("app.views.city.activity.worldcup.tools")
slot2 = class("WorldCupAchievementView", Dialog)
slot2.RESOURCE_FILENAME = "worldcup_achievement.json"
slot2.RESOURCE_BINDING = {
	subList = "sublist",
	item = "item",
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("achievementDatas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("achvDesc", "btnGet", "list", "got", "txt")

					slot4.achvDesc:text(slot3.data.title)

					slot7 = slot4.list

					uiEasy.createItemsToList(slot0, slot7, slot3.data.award)

					slot5 = 2
					uv7 = "multiget"

					if slot3.data.targetType == slot7[5] then
						slot5 = slot3.cur == 0 and 2 or slot3.cur <= slot3.data.targetArg and 1 or 2

						slot4.txt:text("0/1")
					else
						slot5 = slot3.data.targetArg <= slot3.cur and 1 or 2

						slot4.txt:text(slot3.cur .. "/" .. slot3.data.targetArg)
					end

					slot4.txt:visible(slot3.cur < slot3.data.targetArg)
					uiEasy.setBtnShader(slot4.btnGet, false, slot5)
					slot4.got:hide()
					slot4.btnGet:visible(slot5 == 1)

					for slot10, slot11 in orderCsvPairs(csv.yunying.worldcup_tasks) do
						if slot11.targetType == slot3.data.targetType then
							slot6 = 0 + 1
						end
					end

					if slot3.data.sort == slot6 and slot3.get then
						slot4.got:show()
						slot4.btnGet:hide()
						slot4.txt:hide()
					end

					bind.touch(slot0, slot4.btnGet, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onGetClick")
			}
		}
	},
	btnOnekey = {
		varname = "btnOnekey",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onOnekeyClick")
			}
		}
	},
	["topPanel.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	slot0:initModel()

	slot0.activityId = slot1

	idlereasy.when(slot0.worldCupdata, function (slot0, slot1)
		uv2 = "initDatas"

		slot2:initDatas()
	end)
	Dialog.onCreate(slot0)
end

function slot2.initModel(slot0)
	slot0.worldCupdata = gGameModel.role:getIdler("worldcup")
	slot0.achievementDatas = idlers.newWithMap({})
end

function slot2.initDatas(slot0)
	slot1 = {}
	slot3 = csv.yunying.yyhuodong[slot0.activityId].huodongID
	slot4 = slot0.worldCupdata:read().bet_wdl or {}
	slot5 = slot0.worldCupdata:read().bet_score or {}
	slot7 = (slot0.worldCupdata:read().awards or {})[3] or {}

	for slot11, slot12 in orderCsvPairs(csv.yunying.worldcup_tasks) do
		uv13 = "csv"
		slot13 = slot13.getAchievementCount(slot11)
		slot14 = true

		if slot1[slot12.targetType] and slot1[slot12.targetType].get ~= 0 then
			slot14 = false
		end

		if slot14 then
			slot1[slot12.targetType] = {
				taskId = slot11,
				data = slot12,
				cur = slot13,
				get = slot7[slot11]
			}
		end
	end

	slot8 = 2

	for slot12, slot13 in pairs(slot1) do
		if slot13.get ~= 0 then
			uv15 = "yunying"

			if slot13.data.targetType == slot15[5] then
				if slot13.cur ~= 0 and slot13.cur <= slot13.data.targetArg then
					slot8 = 1
				end
			elseif slot13.data.targetArg <= slot13.cur then
				slot8 = 1
			end
		end
	end

	uiEasy.setBtnShader(slot0.btnOnekey, slot0.btnOnekey:get("txt"), slot8)
	slot0.achievementDatas:update(slot1)
end

function slot2.onGetClick(slot0, slot1, slot2, slot3)
	gGameApp:requestServer("/game/yy/worldcup/task/award", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot3.taskId)
end

function slot2.onOnekeyClick(slot0)
	gGameApp:requestServer("/game/yy/worldcup/task/award/onekey", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end)
end

return slot2
