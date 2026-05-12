slot0 = game.TOWN_BUILDING_ID
slot1 = class("BuildLevelUpView", Dialog)
slot1.RESOURCE_FILENAME = "town_building_level_up_dialog.json"
slot1.RESOURCE_BINDING = {
	["baseNode.listOpen"] = "listOpen",
	["baseNode.bg"] = "bg",
	["baseNode.title1"] = "title1",
	baseNode = "baseNode",
	["baseNode.title"] = "title",
	["baseNode.list"] = "list",
	["baseNode.xingxing1"] = "xingxing1",
	["baseNode.txtInfo"] = "txtInfo",
	["baseNode.listCondition"] = "listCondition",
	["baseNode.xingxing2"] = "xingxing2",
	["baseNode.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["baseNode.btnOk"] = {
		varname = "btnOk",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClickOk")
			}
		}
	},
	["baseNode.btnOk.title"] = {
		varname = "btnText",
		binds = {
			{
				event = "effect",
				data = {
					glow = {
						color = ui.COLORS.GLOW.WHITE
					}
				}
			},
			{
				event = "text",
				idler = bindHelper.self("btnText")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.cb = slot1.cb
	slot0.factoryId = slot1.factoryId
	slot0.itemState = slot1.itemState
	slot0.conditionState = slot1.conditionState
	slot2 = gTownBuildingCsv[slot0.factoryId][1]

	slot0.title:text(slot2.name)
	adapt.oneLinePos(slot0.title, slot0.title1, cc.p(5, 0), "left")
	slot0.txtInfo:text(string.format(gLanguageCsv.townBuildingLevelUpTip02, slot2.name))
	beauty.textScroll({
		fontSize = 40,
		isRich = true,
		list = slot0.listCondition,
		strs = slot1.content
	})

	slot4 = slot0.listCondition:size()
	slot5 = slot0.listCondition:getInnerContainerSize().height - slot4.height

	slot0.listCondition:size(cc.size(slot4.width, slot4.height + slot5))
	slot0.listCondition:y(slot0.listCondition:y() - slot5)

	slot6 = {}
	slot7 = {}

	for slot11, slot12 in csvMapPairs(slot1.data) do
		if dataEasy.getNumByKey(slot11) < slot12 then
			table.insert(slot7, dataEasy.getCfgByKey(slot11).name .. "*" .. slot12)
		end

		table.insert(slot6, {
			key = slot11,
			num = dataEasy.getNumByKey(slot11),
			targetNum = slot12
		})
	end

	slot0.costTip = slot7

	uiEasy.createItemsToList(slot0, slot0.list, slot6, {
		onAfterBuild = function (slot0)
			slot0:adaptTouchEnabled():setItemAlignCenter()
		end
	})
	slot0.list:y(slot0.list:y() - slot5)

	if slot1.content02 then
		beauty.textScroll({
			fontSize = 40,
			align = "center",
			isRich = true,
			list = slot0.listOpen,
			strs = slot1.content02
		})

		slot9 = slot0.listOpen:size()
		slot10 = slot0.listOpen:getInnerContainerSize().height - slot9.height

		slot0.listOpen:size(cc.size(slot9.width, slot9.height + slot10))
		slot0.listOpen:y(slot0.listOpen:y() - (slot5 + slot10))
	else
		slot0.listOpen:setTouchEnabled(false)
		slot0.listOpen:setScrollBarEnabled(false)
	end

	slot0.btnOk:y(slot0.btnOk:y() - slot5)
	slot0.xingxing2:y(slot0.xingxing2:y() - slot5)

	slot8 = slot0.bg:size()

	slot0.bg:size(cc.size(slot8.width, slot8.height + slot5))
	slot0.baseNode:y(slot0.baseNode:y() - slot5 / 2)

	slot0.btnText = idler.new(gLanguageCsv.spaceUpgrade)
	slot9 = {}

	if slot1.clearFast then
		slot1.clearFast = true
	end

	Dialog.onCreate(slot0, slot1)
end

function slot1.onClickOk(slot0)
	if not slot0.itemState then
		gGameUI:showTip(string.format("%s %s", table.concat(slot0.costTip, ","), gLanguageCsv.townCostNotEnough))

		return
	elseif not slot0.conditionState then
		gGameUI:showTip(gLanguageCsv.townBuildingUpgradeConditionTip)

		return
	end

	slot0:addCallbackOnExit(slot0.cb)
	Dialog.onClose(slot0)

	return slot0
end

return slot1
