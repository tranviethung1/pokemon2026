require("lushi_battle.models.encounter_generator")

slot0 = class("AutoChessEncounterModel")
AutoChessBattle.EncounterModel = slot0

function slot0.ctor(slot0, slot1)
	slot0.scene = slot1
	slot0.mode = nil
	slot0.modeIdx = nil
	slot0.lastFrame = 0
end

function slot0.init(slot0, slot1, slot2)
	slot0.data = AutoChessBattle.ChessEncounterDataModel.new(slot0.scene, slot1, slot2)

	slot0.data:initChapterEncounter()

	slot0.chapter = slot0.data:chapter()

	slot0:createMenus(1, 2, 3)
	slot0:refreshMenuView()
end

function slot0.createMenus(slot0, ...)
	for slot4, slot5 in ipairs({
		...
	}) do
		if slot0.data:encounter(slot5) then
			gRootViewProxy:notify("createMenu", slot5, slot6:viewData())
		end
	end

	gRootViewProxy:notify("updateMenu")
end

function slot0.completeEncounter(slot0, slot1)
	slot0.data:encounter(slot1):complete()
	slot0.data:completeEncounter(slot1)
	gRootViewProxy:notify("deleteMenu", slot1)

	if slot0.chapter ~= slot0.data:chapter() then
		slot0.chapter = slot0.data:chapter()

		gRootViewProxy:notify("clearAllMenu")
		slot0:createMenus(1, 2, 3)
	else
		slot0:createMenus(slot1)
	end

	slot0:refreshMenuView()
end

function slot0.tempHideEncounter(slot0, slot1)
	slot2 = slot0.data:encounter(slot1)

	slot0.data:tempHideEncounter(slot1)
	gRootViewProxy:notify("deleteMenu", slot1)
	slot0:createMenus(slot1)
	slot0:refreshMenuView()
end

function slot0.resetEncountersPos(slot0)
	slot1 = nil

	for slot6, slot7 in pairs(slot0.data._encounters) do
		slot2 = 0 + 1

		if csv.auto_chess.encounter[slot7.id].type == lushi.EncounterType.battle and slot8.battleType == 3 then
			slot1 = slot6
		end
	end

	if slot1 and slot1 ~= 2 and slot2 == 3 then
		slot3 = slot0.data._encounters[2]
		slot0.data._encounters[2] = slot0.data._encounters[slot1]
		slot0.data._encounters[slot1] = slot3

		if slot3.onIndexChange then
			slot3:onIndexChange(slot1)
		end

		gRootViewProxy:notify("clearAllMenu")
		slot0:createMenus(1, 2, 3)
	end
end

function slot0.refreshMenuView(slot0)
	slot0:resetEncountersPos()
	gRootViewProxy:notify("showMenu", slot0.data:getLeftEncounterNum(), slot0.data.isFake)
end

function slot0.activateEncounter(slot0, slot1)
	slot0.modeIdx = slot1
	slot2 = slot0.data:encounter(slot1)
	slot0.mode = csv.auto_chess.encounter[slot2.id].type

	gRootViewProxy:notify("showInfo", slot1, slot2:viewData())
end

function slot0.onConfirmCheck(slot0, ...)
	return slot0.data:encounter(slot0.modeIdx):canConfirm(...)
end

function slot0.onConfirm(slot0, ...)
	if slot0.data:encounter(slot0.modeIdx) then
		slot1:confirm(...)
		slot1:confirmView()
	end

	slot0.scene:waitEncounterConfirm()
end

function slot0.afterConfirmView(slot0)
	if slot0.data:encounter(slot0.modeIdx) then
		if slot1:isOver() then
			if csv.auto_chess.encounter[slot1.id].guideExit then
				slot0.scene:guideOver()

				return
			end

			slot0:completeEncounter(slot0.modeIdx)

			if slot1.nextEncounterID then
				slot0:menuClick(slot0.modeIdx)
			end
		elseif slot1.tempHideEncounterID then
			slot0:tempHideEncounter(slot0.modeIdx)
		end
	end

	slot0.scene:addGuideOperate()

	if not slot0.scene.isPvP then
		slot0.scene:addToSendArray("sendInput")
	end
end

function slot0.menuClick(slot0, slot1)
	slot0:activateEncounter(slot1)
end

function slot0.menuDelete(slot0, slot1)
	slot0:completeEncounter(slot1)
end

function slot0.gotoBattle(slot0)
	gRootViewProxy:notify("setShopVisible", false, "fight")
	slot0.data:encounter(slot0.modeIdx):gotoBattle()
	gRootViewProxy:notify("setEnemyTrainerVisible", true)
end

function slot0.getCost(slot0, slot1)
	if slot0.data:encounter(slot0.modeIdx) and slot2.getCost and slot0.scene:getOperateObject(slot1) then
		return slot2:getCost(slot3)
	end

	return nil
end

function slot0.afterGetAward(slot0)
	slot0.data:encounter(slot0.modeIdx):afterGetAward()
end

function slot0.update(slot0)
	if slot0.lastFrame < slot0.scene.logicFrame then
		slot0.lastFrame = slot0.scene.logicFrame

		for slot4, slot5 in slot0.scene.heros:order_pairs() do
			if slot5.isFakeCard then
				return
			end
		end

		for slot4 = 1, 3 do
			if slot0.data:encounter(slot4) and slot5.update then
				slot5:update()
			end
		end
	end
end

function slot0.getCurrentEncounter(slot0)
	return slot0.data:encounter(slot0.modeIdx)
end

require("lushi_battle.models.encounter_pack")
