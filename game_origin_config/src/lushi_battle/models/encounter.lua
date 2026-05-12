slot0 = class("AutoChessEncounterModel")
AutoChessBattle.EncounterModel = slot0
slot1 = {
	Battle = {},
	Buy = {},
	Enhance = {}
}
slot2 = {
	"attack",
	"defence",
	"hpMax"
}
slot3 = 3

function slot4(slot0, slot1)
	return slot0.seat < slot1.seat
end

function slot0.ctor(slot0, slot1)
	slot0.scene = slot1
	slot0.mode = nil
	uv3 = "scene"
	slot0.shopCards = CMap.new(slot3)
	slot0.funcs = {}
	slot0.menus = {}
	slot0.modeInfo = nil
	slot0.modeIdx = nil
	slot0.data = AutoChessBattle.ChessEncounterDataModel.new({
		1,
		2,
		3
	})
end

function slot0.init(slot0)
	slot0:initMenu()
end

function slot0.initMenu(slot0)
	slot0.data:initChapterEncounter()

	slot0.chapter = slot0.data:chapter()

	slot0:onNewChapter()
end

function slot0.onNewChapter(slot0)
	for slot4, slot5 in ipairs(slot0.data._encounters) do
		slot0:createMenu(slot4)
	end

	gRootViewProxy:notify("updateMenu")
end

function slot0.createMenu(slot0, slot1)
	if not slot0.data._encounters[slot1] then
		return
	end

	slot0.menus[slot1] = {}
	slot3 = csv.auto_chess.encounter[slot2]

	assert(slot3, string.format("AutoChessEncounterModel no such event id:%s", slot2))
	gRootViewProxy:notify("createMenu", slot1, {
		cfgId = slot2,
		name = slot3.name,
		canDelete = slot3.close
	})

	return true
end

function slot0.onModeChange(slot0, slot1)
	slot0.modeInfo = slot0.menus[slot1]
	slot0.modeIdx = slot1
	slot4 = csv.auto_chess.encounter[slot0.data._encounters[slot1]]
	slot0.mode = slot4.type
	slot0.cfg = csvClone(slot4)

	slot0:setFuncs()
	slot0.funcs.init(slot0)
end

function slot0.setFuncs(slot0)
	uv1 = "lushi"
	slot1 = slot1[lushi.EncounterModes[slot0.mode]]

	assert(slot1)

	slot0.funcs = slot1
end

function slot0.onClickConfirm(slot0)
	slot1, slot2 = slot0.funcs.getConfirmParams(slot0)

	if not slot1 then
		return
	end

	slot0.scene.operateMgr:addOperate(lushi.OperateTable.encounterConfirm, table.unpack(slot2))
end

function slot0.onConfirm(slot0, ...)
	slot0.funcs.onConfirm(slot0, ...)

	if slot0.mode ~= 1 then
		slot0.scene:sendInput()
	end
end

function slot0.onSelect(slot0, slot1)
	slot0.funcs.onSelect(slot0, slot1)
end

function slot0.quit(slot0)
	slot0.modeInfo = nil
	slot0.modeIdx = nil
	slot0.mode = nil
	slot0.cfg = nil

	slot0.funcs.onQuit(slot0)

	slot0.funcs = nil

	gRootViewProxy:notify("showMenu")
end

function slot0.quitAndDelte(slot0)
	slot0:menuDelete(slot0.modeIdx)
	slot0:quit()
end

function slot0.oneBattleEnd(slot0)
	if slot0:isLastFight() then
		slot0.scene:gameOver()

		return
	end

	gRootViewProxy:notify("setShopVisible", true, "fight", true)
	slot0:quitAndDelte()
end

function slot0.menuClick(slot0, slot1)
	slot0:onModeChange(slot1)
	gRootViewProxy:notify("showInfo")
end

function slot0.addCardAttr(slot0, slot1, slot2)
	slot5 = slot1
	slot3 = slot0.scene:getObject(slot5)
	uv5 = "scene"

	for slot7, slot8 in ipairs(slot5) do
		slot3.attrs:addEnhanceAttr(slot8, slot2[slot7])
	end

	slot3:battleDataInit()
	AutoChessEasy.queueEffect(function ()
		uv0 = "view"

		slot0.view:proxy():onRefreshCardAttr()
		buff.holder.view:proxy():attrChangeEffect(1)
	end)
end

function slot0.addCardStar(slot0, slot1)
	slot2 = slot0.scene:getObject(slot1)
	slot2.star = math.min(slot2.star * 2, lushi.StarLimit)

	for slot6, slot7 in pairs(AutoChessAttrs.AttrsTable) do
		if slot2.data[slot6] then
			if slot6 == "hpMax" then
				slot8 = "hp"
			end

			slot9 = AutoChessCsv.doFormula(slot2.unitCfg[slot8], slot2.protectedEnv)
			slot2.data[slot6] = slot9

			slot2.attrs:addBaseAttr(slot6, slot9 - slot2.data[slot6])
		end
	end

	slot2:battleDataInit()
	AutoChessEasy.queueEffect(function ()
		uv0 = "view"
		slot0 = slot0.view:proxy()
		slot0 = slot0.onRefreshCardAttr

		slot0(slot0)

		uv0 = "view"

		slot0.view:proxy():updateStar()
	end)
end

function slot0.menuDelete(slot0, slot1)
	slot0.menus[slot1] = nil

	slot0.data:completeEncounter(slot1)
	gRootViewProxy:notify("deleteMenu", slot1)

	if slot0.chapter ~= slot0.data:chapter() then
		slot0.chapter = slot0.data:chapter()

		slot0:onNewChapter()
	else
		slot0:createMenu(slot1)
		gRootViewProxy:notify("updateMenu")
	end
end

function slot0.getIds(slot0)
	slot1 = {}

	for slot5, slot6 in slot0.shopCards:order_pairs() do
		table.insert(slot1, slot6.id)
	end

	return slot1
end

function slot0.isLastFight(slot0)
	return slot0.cfg.battleType == 3
end

function slot0.onSelectListConfirm(slot0, slot1)
	assert(slot0:isEnhance())
	slot0.funcs.onSetCard(slot0, slot1)
end

function slot0.isEnhance(slot0)
	return lushi.EncounterModes[slot0.mode] == "Enhance"
end

function slot1.Buy.init(slot0)
	slot0.buySelectId = nil

	assert(table.length(slot0.cfg.shop) > 0, "EncounterModes.Buy.init shop list is empty")

	slot0.shopCfg = csvClone(csv.auto_chess.shop[slot0.cfg.shop[ymrand.random(1, table.length(slot0.cfg.shop))]])
	slot0.modeInfo.buyCount = slot0.modeInfo.buyCount or 0
	slot0.modeInfo.items = slot0.modeInfo.items or csvClone(slot2.items)

	if not slot0.modeInfo.cards then
		slot0.modeInfo.cards = {}

		for slot6 = 1, 3 do
			uv9 = "buySelectId"

			table.insert(slot0.modeInfo.cards, slot9.Buy.getRandomObj(slot0))
		end
	end

	for slot6, slot7 in ipairs(slot0.modeInfo.cards) do
		slot0.funcs.createObj(slot0, slot6, AutoChessEasy.getRoleDataFromCards(slot7))
	end

	gRootViewProxy:notify("refreshBuyModeCards", slot0:getIds())
end

function slot1.Buy.getRandomObj(slot0)
	if table.length(slot0.modeInfo.items) == 0 then
		return
	end

	return table.remove(slot0.modeInfo.items, ymrand.random(1, slot1))
end

function slot5(slot0, slot1)
	if slot0.shopCfg.free[slot1.seat] then
		return 0
	end

	return slot1:price() + slot0.shopCfg.cost[slot1.seat]
end

function slot1.Buy.getConfirmParams(slot0)
	if not slot0.buySelectId then
		return false
	end

	if not slot0.shopCards:find(slot0.buySelectId) then
		return false
	end

	slot2 = slot0.scene
	slot3 = slot2
	uv3 = "buySelectId"

	if slot2.getGoldNum(slot3) < slot3(slot0, slot1) then
		return false
	end

	return true, {
		slot0.buySelectId
	}
end

function slot1.Buy.onConfirm(slot0, slot1)
	gRootViewProxy:notify("shopSelect", slot0:getIds(), nil)

	slot2 = slot0.shopCards:erase(slot1)
	slot3 = slot2.unitID
	slot7 = slot2.seat

	table.remove(slot0.modeInfo.cards, slot7)

	uv7 = "gRootViewProxy"

	slot0.scene:useGold(slot7(slot0, slot2))
	gRootViewProxy:notify("addToGameLayer", slot2.id)
	slot0.scene:setObjInHand(slot2)

	slot0.modeInfo.buyCount = slot0.modeInfo.buyCount + 1

	if slot0.shopCfg.limited > 0 and slot0.shopCfg.limited <= slot0.modeInfo.buyCount then
		slot0:quitAndDelte()

		return
	end

	if slot0.shopCfg.type == 1 then
		uv5 = "notify"
		slot3 = slot5.Buy.getRandomObj(slot0)
	elseif slot0.shopCfg.type == 3 then
		slot3 = nil
	end

	if slot3 then
		table.insert(slot0.modeInfo.cards, slot4, slot3)
		slot0.funcs.createObj(slot0, slot4, AutoChessEasy.getRoleDataFromCards(slot3))
	end

	for slot9, slot10 in slot0.shopCards:order_pairs() do
		slot10.seat = 0 + 1
	end

	if slot0.shopCards:size() == 0 then
		slot0:quitAndDelte()

		return
	end

	gRootViewProxy:notify("refreshBuyModeCards", slot0:getIds())

	slot0.buySelectId = nil
end

function slot1.Buy.onSelect(slot0, slot1)
	slot0.buySelectId = slot1

	gRootViewProxy:notify("shopSelect", slot0:getIds(), slot1)
end

function slot1.Buy.createObj(slot0, slot1, slot2)
	slot3 = slot0.scene.play:createObjectModel(slot1, slot2.type)
	slot2.readyState = lushi.ObjectReadyState.shop

	slot0.shopCards:insert(slot3.id, slot3)
	slot3:init(slot2)
end

function slot1.Buy.onClear(slot0)
	slot0.buySelectId = nil
	slot0.shopCfg = nil

	for slot4, slot5 in slot0.shopCards:order_pairs() do
		slot0.scene:deleteObj(slot5)
	end

	uv3 = "buySelectId"

	slot0.shopCards:clear(slot3)
	gRootViewProxy:proxy():clearDeleteObjLayer()
end

function slot1.Buy.onQuit(slot0)
	slot0.funcs.onClear(slot0)
end

function slot1.Battle.init(slot0)
end

function slot1.Battle.createObj(slot0, slot1, slot2, slot3)
	slot4 = slot0.scene.play:createObjectModel(slot1, slot2.type)
	slot8 = slot4
	slot9 = lushi.ObjectReadyState.embattle

	slot0.scene:addObj(2, slot8, slot9)

	slot2.readyState = lushi.ObjectReadyState.embattle

	slot4:init(slot2)

	for slot8, slot9 in ipairs(slot3) do
		slot10 = AutoChessEasy.getRoleDataFromCards(slot9)
		slot10.readyState = lushi.ObjectReadyState.embattle
		slot11 = slot0.scene.play:createObjectModel(1, slot10.type)

		slot11:init(slot10)
		slot11:setEquipedData()

		slot11.team = slot4.team

		slot4:addEquipment(slot11)
	end
end

function slot1.Battle.getConfirmParams(slot0)
	return true, {}
end

function slot1.Battle.onConfirm(slot0)
	assert(table.length(slot0.cfg.monster) > 0, "EncounterModes.Battle.init monster list is empty")
	assert(table.length(csvClone(csv.auto_chess.monster[slot0.cfg.monster[ymrand.random(1, table.length(slot0.cfg.monster))]]).monsters) > 0, string.format("EncounterModes.Battle.init csv.auto_chess.monster monsters is empty, id:%s", slot1))

	for slot6, slot7 in ipairs(slot2.monsters) do
		slot8, slot9 = AutoChessEasy.getRoleDataFromMonsterFix(slot7)

		slot0.funcs.createObj(slot0, slot6 + lushi.TeamNumber, slot8, slot9)
	end

	gRootViewProxy:proxy():refreshPostion(2, lushi.ObjectReadyState.embattle)
	gRootViewProxy:proxy():onViewProxyNotify("setShopVisible", false, "fight")
	gRootViewProxy:proxy():onViewProxyNotify("setEnemyTrainerVisible", true)
end

function slot1.Battle.onQuit(slot0)
end

function slot1.Enhance.init(slot0)
	assert(table.length(slot0.cfg.choose) > 0, "EncounterModes.Battle.Enhance choose list is empty")

	slot0.chooseCfg = csvClone(csv.auto_chess.choose[slot0.cfg.choose[ymrand.random(1, table.length(slot0.cfg.choose))]])
	slot0.modeInfo.useCount = slot0.modeInfo.useCount or 0

	gRootViewProxy:proxy():onViewProxyNotify("setEnhanceImgVisible", true)
end

function slot1.Enhance.onQuit(slot0)
	slot0.funcs.onClear(slot0)
	gRootViewProxy:proxy():onViewProxyNotify("setEnhanceImgVisible", false)
end

function slot1.Enhance.onClear(slot0)
	if slot0.selectId then
		gRootViewProxy:proxy():onViewProxyNotify("resetEnhanceCard", slot0.selectId)
	end

	slot0.selectId = nil
	slot0.enhanced = nil
	slot0.chooseCfg = nil
end

function slot1.Enhance.onSetCard(slot0, slot1)
	slot0.selectId = slot1

	gRootViewProxy:proxy():onViewProxyNotify("setEnhanceCard", slot1)
end

function slot1.Enhance.getConfirmParams(slot0)
	if not slot0.selectId then
		return false
	end

	if slot0.scene:getGoldNum() < slot0.chooseCfg.cost then
		return false
	end

	return true, {
		slot0.selectId
	}
end

function slot1.Enhance.onConfirm(slot0, slot1)
	if not slot0.scene:getObject(slot1) then
		return
	end

	slot0.scene:useGold(slot0.chooseCfg.cost)

	if slot0.chooseCfg.type == 1 then
		slot0:addCardStar(slot1)

		if slot2.readyState == lushi.ObjectReadyState.embattle then
			slot2:returnToHand()
			gRootViewProxy:proxy():refreshPostion(nil, lushi.ObjectReadyState.hand)
			gRootViewProxy:proxy():refreshPostion(1, lushi.ObjectReadyState.embattle)
		end
	elseif slot0.chooseCfg.type == 2 then
		slot0:addCardAttr(slot1, slot0.chooseCfg.type_value)
	end

	gRootViewProxy:proxy():onViewProxyNotify("resetEnhanceCard", slot1)

	slot0.selectId = nil
	slot0.modeInfo.useCount = slot0.modeInfo.useCount + 1

	if slot0.chooseCfg.limited > 0 and slot0.chooseCfg.limited <= slot0.modeInfo.useCount then
		slot0:quitAndDelte()

		return
	end
end

require("lushi_battle.models.encounter_pack")
require("lushi_battle.models.encounter_generator")
