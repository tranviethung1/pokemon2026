slot0 = class("TownFactoryLevelUpView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "town_factory_level_up.json"
slot0.RESOURCE_BINDING = {
	["centerPanel.rightPanel"] = "rightPanel",
	subList = "subList",
	item = "item",
	spine = "spine",
	centerPanel = "centerPanel",
	["centerPanel.leftPanel"] = "leftPanel",
	imgBG = {
		binds = {
			event = "click",
			method = bindHelper.self("onClose")
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				data = bindHelper.self("teamDatas"),
				columnSize = bindHelper.self("midColumnSize"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					adapt.setTextScaleWithWidth(slot1:get("name"), slot3.name .. ":", slot1:width() - slot1:get("num1"):width() - slot1:get("arrow"):width() - slot1:get("num2"):width())
					slot1:get("num1"):text(slot3.left)
					slot1:get("num2"):text(slot3.right)
					adapt.oneLinePos(slot1:get("name"), {
						slot1:get("num1"),
						slot1:get("arrow"),
						slot1:get("num2")
					}, {
						cc.p(10, 0),
						cc.p(10, 0),
						cc.p(10, 0)
					})
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			}
		}
	}
}
slot0.RESOURCE_STYLES = {
	blackLayer = true,
	clickClose = true
}
slot1 = {
	"efficient",
	"inventory",
	"energyExpend",
	"unlockSeat",
	"slotCapacityAdd",
	"slotTimeAdd"
}

function slot0.onCreate(slot0, slot1)
	slot0.midColumnSize = 2
	slot2 = gGameModel.town:read("buildings")[slot1].level
	slot3 = gTownFactoryCsv[slot1][slot2 - 1]
	slot4 = gTownFactoryCsv[slot1][slot2]

	userDefault.setForeverLocalKey("townBuildingLevel", {
		[slot1] = slot2
	})
	slot0.rightPanel:get("name"):text(gTownBuildingCsv[slot1][1].name .. string.format(gLanguageCsv.crossMineWish09, tostring(slot2)))

	slot9 = gLanguageCsv.crossMineWish09
	slot10 = tostring

	slot0.leftPanel:get("name"):text(gTownBuildingCsv[slot1][1].name .. string.format(slot9, slot10(slot2 - 1)))
	slot0.rightPanel:get("icon"):texture(gTownBuildingCsv[slot1][slot2].res)

	slot7 = gTownBuildingCsv[slot1][slot2 - 1].res

	slot0.leftPanel:get("icon"):texture(slot7)

	slot5 = {}
	uv7 = "midColumnSize"

	for slot9, slot10 in pairs(slot7) do
		if slot3[slot10] ~= slot4[slot10] then
			table.insert(slot5, {
				name = gLanguageCsv[slot10],
				left = slot3[slot10],
				right = slot4[slot10]
			})
		end
	end

	slot0.teamDatas = idlers.newWithMap(slot5)

	if itertools.size(slot5) == 0 then
		slot0.centerPanel:y(slot0.centerPanel:y() - 100)
	elseif slot6 == 1 or slot6 == 3 then
		slot0.midColumnSize = 1

		slot0.list:x(slot0.list:x() + 350)
	else
		slot0.list:x(slot0.list:x() + 50)
	end

	slot0.list:y(slot0.list:y() + 10)
	uiEasy.setTitleEffect(slot0.spine, "xjiesuan_shengjizi")
	slot0.spine:xy(slot0.spine:x() + 140, slot0.spine:y() - 350)
end

return slot0
