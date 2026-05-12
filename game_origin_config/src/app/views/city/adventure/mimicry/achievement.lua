slot0 = {
	CAN_NOT_GOTTEN = 2,
	CAN_GOTTEN = 1,
	GOTTEN = 0
}
slot1 = class("MimicryAhievementView", Dialog)
slot1.RESOURCE_FILENAME = "mimicry_achievement.json"
slot1.RESOURCE_BINDING = {
	rankItem = "rankItem",
	rewardPanel1 = "rewardPanel1",
	["topPanel.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
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
				data = bindHelper.self("achvDatas"),
				item = bindHelper.self("rankItem"),
				value = bindHelper.self("value"),
				dataOrderCmpGen = bindHelper.self("onSortCards", true),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot3.cfg

					slot1:multiget("achvDesc", "btnGet", "list", "got").achvDesc:text(slot4.mimicryAchievement)

					if next(slot4.award) ~= nil then
						uiEasy.createItemsToList(slot0, slot5.list, slot4.award, {
							scale = 0.8
						})
					end

					slot5.list:setScrollBarEnabled(false)

					slot9 = {
						methods = {
							ended = functools.partial(slot0.clickCell, slot3.csvId, slot3.get)
						}
					}

					bind.touch(slot0, slot5.btnGet, slot9)

					uv9 = "cfg"

					slot5.got:visible(slot3.get == slot9.GOTTEN)

					uv9 = "cfg"

					slot5.btnGet:visible(slot3.get ~= slot9.GOTTEN)

					if (slot0.value[slot3.csvId] or 0) < slot4.targetArg2 then
						slot5.btnGet:get("txt"):text(slot6 .. "/" .. slot4.targetArg2)
					else
						slot5.btnGet:get("txt"):text(gLanguageCsv.spaceReceive)
					end

					uiEasy.setBtnShader(slot5.btnGet, slot5.btnGet:get("txt"), slot3.get == 1 and 1 or 2)
				end
			},
			handlers = {
				clickCell = bindHelper.self("onGetBtn")
			}
		}
	},
	btnBattle = {
		varname = "btnBattle",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onGetAllAwardBtn")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0:initModel()

	slot0.achvDatas = idlers.new()

	idlereasy.when(slot0.state, function (slot0, slot1)
		slot2 = {}
		slot3 = 2

		for slot7, slot8 in orderCsvPairs(csv.mimicry.tasks) do
			slot10 = slot2

			table.insert(slot10, {
				cfg = slot8,
				csvId = slot7,
				get = slot1[slot7]
			})

			uv10 = "orderCsvPairs"

			if slot1[slot7] == slot10.CAN_GOTTEN then
				slot3 = 1
			end
		end

		slot4 = uiEasy.setBtnShader
		uv5 = "csv"

		slot4(slot5.btnBattle, nil, slot3)

		uv4 = "csv"

		slot4.achvDatas:update(slot2)
	end)
	Dialog.onCreate(slot0)
end

function slot1.initModel(slot0)
	slot0.value = gGameModel.mimicry:read("achievement_value")
	slot0.state = gGameModel.mimicry:getIdler("achievement_state")
end

function slot1.onGetBtn(slot0, slot1, slot2, slot3)
	uv4 = "CAN_GOTTEN"

	if slot3 == slot4.CAN_GOTTEN then
		gGameApp:requestServer("/game/mimicry/award", function (slot0)
			gGameUI:showGainDisplay(slot0)
		end, slot2)
	end
end

function slot1.onGetAllAwardBtn(slot0)
	gGameApp:requestServer("/game/mimicry/award/onekey", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end)
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
