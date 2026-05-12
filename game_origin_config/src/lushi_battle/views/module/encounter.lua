slot0 = require("lushi_battle.views.encounter_info")
slot1 = class("AutoChessEncounter", battleModule.CBase)

function slot1.ctor(slot0, slot1)
	battleModule.CBase.ctor(slot0, slot1)

	slot0.panel = slot0.parent.panelShop
	slot0.panelMenu = slot0.parent.panelMenu
	slot0.panelInfo = {}

	for slot5 = 1, 3 do
		uv7 = "battleModule"
		slot0.panelInfo[slot5] = slot7.new(slot0, slot5)
	end

	slot0.encounterPanel = slot0.parent.encounterPanel
	slot0.bossPanel = slot0.parent.bossPanel
	slot0.enhanceImg = slot0.parent.enhanceImg
	slot0.menus = {}
	slot0.cnt = 0
	slot0.shopVisible = AutoChessEasy.priorDataTable(true, "shopVisible")
	slot0.curIndex = nil
	slot0.encoutnerLeftNum = 0
	slot0.isFake = false
	slot0.numLabel = slot0.parent.panelShop:get("numLabel")
	slot0.numBg = slot0.parent.panelShop:get("numBg")
	slot0.shopBg = slot0.parent.shopBg
end

function slot1.calcPos(slot0, slot1)
	slot2 = slot0.panel:getBoundingBox()
	slot8 = {}

	for slot12, slot13 in ipairs(slot1) do
		table.insert(slot8, {
			x = slot2.width / 2 - (table.length(slot1) - 1) * (lushi.CardWidth + 30) / 2 + (slot12 - 1) * slot6,
			y = slot2.height / 2 - 60,
			id = slot13
		})
	end

	return slot8
end

function slot1.onRefreshEncounter(slot0, slot1)
	if slot0.curIndex then
		slot0.panelInfo[slot0.curIndex]:init(slot1)
	end
end

function slot1.onShopSelect(slot0, slot1)
	if slot0.curIndex then
		slot0.panelInfo[slot0.curIndex]:onShopSelect(slot1)
	end
end

function slot1.onListSelect(slot0, slot1)
	if slot0.curIndex then
		slot0.panelInfo[slot0.curIndex]:onListSelect(slot1)
	end
end

function slot1.onUpdateStory(slot0, slot1, slot2)
	if slot0.panelInfo[slot1] then
		slot0.panelInfo[slot1]:updateStory(slot2)
	end
end

function slot1.onSetShopVisible(slot0, slot1, slot2, slot3)
	slot0.shopVisible:set(slot1, slot2, slot3)
	slot0.panel:setVisible(slot0.shopVisible:get())
	slot0:onUpdateBackBtn()
end

function slot1.onCreateMenu(slot0, slot1, slot2)
	slot3 = nil
	slot3 = (not slot2.isBoss or AutoChessEasy.getBossMenuInfo(slot0.bossPanel, slot2, slot0.panelMenu)) and AutoChessEasy.getMenuInfo(slot0.encounterPanel, slot2, slot0.panelMenu)
	slot3.idx = slot1

	slot3:onClick(functools.partial(slot0.parent.handleOperation, slot0.parent, lushi.OperateTable.menuClick, slot3.idx))

	slot4 = slot3:get("deleteBtn")

	if slot2.canDelete then
		slot4:show()
		slot4:onClick(functools.partial(slot0.parent.handleOperation, slot0.parent, lushi.OperateTable.menuDelete, slot3.idx))
	else
		slot4:hide()
	end

	slot0.menus[slot1] = slot3
	slot0.cnt = slot0.cnt + 1

	slot0.panelInfo[slot1]:init(slot2)
end

function slot1.onDeleteMenu(slot0, slot1)
	slot0.menus[slot1] = nil

	if slot0.menus[slot1] then
		slot2:removeFromParent()

		slot0.cnt = slot0.cnt - 1
	end
end

function slot1.onClearAllMenu(slot0, slot1)
	for slot5, slot6 in pairs(slot0.menus) do
		slot6:removeFromParent()
	end

	slot0.menus = {}
	slot0.cnt = 0
end

function slot1.onUpdateMenu(slot0)
	for slot7 = 1, lushi.EncounterShowNum do
		if slot0.menus[slot7] then
			slot0.menus[slot7]:x(slot0.panelMenu:getBoundingBox().width / (slot0.cnt + 1) * (0 + 1))
		end
	end
end

function slot1.showPanelInfo(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.panelInfo) do
		if slot5 == slot1 then
			slot6:setVisible(true)
			slot6:onShow()
		else
			slot6:setVisible(false)
		end
	end
end

function slot1.onShowMenu(slot0, slot1, slot2)
	slot0.curIndex = nil

	slot0.panelMenu:setVisible(true)
	slot0:showPanelInfo()

	slot0.encoutnerLeftNum = slot1 or slot0.encoutnerLeftNum

	if slot2 ~= nil then
		slot0.isFake = slot2
	end

	slot0:refreshPage(string.format(gLanguageCsv.autoChessEncounterMenu, slot0.encoutnerLeftNum), lushi.EncounterColor.menu, true, lushi.EncounterRes.OriginTitle, lushi.EncounterRes.OriginBg, slot0.isFake)
	slot0:onUpdateBackBtn()
end

function slot1.onShowInfo(slot0, slot1, slot2)
	slot0.curIndex = slot1

	slot0:showPanelInfo(slot1)
	slot0.panelMenu:setVisible(false)
	slot0:onUpdateBackBtn()
end

function slot1.onUpdateBackBtn(slot0)
	if not slot0.curIndex or not slot0.panelInfo[slot0.curIndex]:getCanReturn() or slot0.parent.isFighting then
		slot0.parent.backBtn:hide()
	else
		slot0.parent.backBtn:show()
	end
end

function slot1.onSetBackBtn(slot0, slot1)
	slot0.parent.backBtn:setVisible(slot1)
end

function slot1.onEncounterBack(slot0)
	if not slot0.curIndex or not slot0.panelInfo[slot0.curIndex]:getCanReturn() or slot0.parent.isFighting then
		return
	end

	if slot0.panelInfo[slot0.curIndex]:isBattle() and slot0.shopVisible:get() == false then
		slot0:onSetShopVisible(true, "fight", true)
		slot0.parent:showFightBtn(false)
		slot0.parent:onViewProxyNotify("setEnemyTrainerVisible", false)
		slot0.parent:handleOperation(lushi.OperateTable.quitBattle)
	end

	slot0:onShowMenu()
end

function slot1.refreshPage(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0.numLabel:setText(slot1)
	text.addEffect(slot0.numLabel, {
		color = slot2
	})
	slot0.numBg:loadTexture(slot4)
	slot0.shopBg:loadTexture(slot5)
	slot0.numBg:setVisible(not slot6)
	slot0.numLabel:setVisible(not slot6)
end

return slot1
