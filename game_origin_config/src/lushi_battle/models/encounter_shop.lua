slot0 = class("AutoChessEncounterShop")
AutoChessBattle.AutoChessEncounterShop = slot0

function slot0.ctor(slot0, slot1, slot2, slot3, slot4)
	slot0.id = slot1
	slot0.scene = slot2
	slot0._records = slot4
	slot0._cards = slot3
	slot0.buy = {
		0,
		0,
		0
	}
	slot0.cards = {}
end

function slot0.init(slot0, slot1)
	slot2 = csv.auto_chess.encounter[slot0.id]
	slot3 = nil
	slot0._cfg = csvClone(csv.auto_chess.game_shop[(not slot0.scene:isGuide() or slot2.shop[1]) and slot2.shop[ymrand.random(1, table.length(slot2.shop))]])

	if slot0._cfg.isInitial then
		slot0._items = table.deepcopy(slot0._cards)
	else
		slot4 = {}

		if slot0._cfg.items then
			slot4 = AutoChessCsv.doFormula(slot0._cfg.items, {
				scene = AutoChessCsv.CsvScene.new(slot0.scene)
			})
		end

		slot0._items = slot4
	end

	if not slot0._cfg.repeat1 and slot0._records[slot3] ~= nil then
		slot4 = {}

		for slot8, slot9 in ipairs(slot0._items) do
			if not slot0._records[slot3][slot9] then
				table.insert(slot4, slot9)
			end
		end

		slot0._items = slot4
	end

	slot0.shopIndex = slot1

	if table.length(slot0._items) > 0 then
		for slot7 = 1, 3 do
			if slot0:randomUnitID() then
				slot0.cards[slot7] = slot0:newObj(slot7, slot8)
			end
		end
	end
end

function slot0.randomUnitID(slot0)
	if table.length(slot0._items) == 0 then
		return nil
	end

	slot1 = nil
	slot2 = slot0._items[slot0.scene:isGuide() and 1 or ymrand.random(1, table.length(slot0._items))]

	if not slot0._cfg.repeat1 then
		if slot0._records[slot0._cfg.id] == nil then
			slot0._records[slot0._cfg.id] = {}
		end

		slot0._records[slot0._cfg.id][slot2] = true
	end

	if not slot0._cfg.repeat2 then
		table.remove(slot0._items, slot1)
	end

	return slot2
end

function slot0.newObj(slot0, slot1, slot2)
	slot3 = AutoChessEasy.getRoleDataFromCards(slot2)
	slot3.readyState = lushi.ObjectReadyState.shop
	slot4 = slot0.scene.play:createObjectModel(slot1, slot3.type)
	slot4.shopIndex = slot0.shopIndex

	slot4:init(slot3)
	slot4.view:proxy():updateRiseState(slot0.scene:checkRiseStar(slot4) and true or false)

	return slot4
end

function slot0.viewData(slot0)
	slot1 = csv.auto_chess.encounter[slot0.id]
	slot2 = {}
	slot3 = {}
	slot4 = 0

	if slot0._cfg.limited > 0 then
		slot4 = slot0._cfg.limited - itertools.sum(slot0.buy)
	end

	for slot8 = 1, 3 do
		if slot0.cards[slot8] then
			slot2[slot8] = slot9.id
			slot3[slot8] = slot0:getBuyPrice(slot9)
		end
	end

	return AutoChessEasy.getEncounterViewData(slot0, slot1, {
		desc = slot0._cfg.desc,
		costType = slot0._cfg.costType,
		buy = slot0.buy,
		ids = slot2,
		left = slot4,
		prices = slot3,
		type = lushi.EncounterType.shop
	})
end

function slot0.getBuyPrice(slot0, slot1)
	if slot0._cfg.free[slot1.seat] then
		return 0
	end

	return math.max(slot1:price() + slot0._cfg.cost[slot1.seat] + slot0.scene.trainer[1]:getShopFix(slot0._cfg.type) + slot0.scene.trainer[1]:getShopFix(0), 0)
end

function slot0.canConfirm(slot0, slot1)
	if slot0.cards[slot1] == nil then
		gRootViewProxy:proxy():showTip(gLanguageCsv.autoChessSelectFirst)

		return false
	end

	if slot0._cfg.limited > 0 and slot0._cfg.limited <= itertools.sum(slot0.buy) then
		return false
	end

	if slot0._cfg.costType == 0 then
		if slot0.scene:getGoldNum() < slot0:getBuyPrice(slot0.cards[slot1]) then
			gRootViewProxy:proxy():showTip(gLanguageCsv.autoChessNoGold)

			return false
		end
	elseif slot0.scene.trainer[1]:hp() <= slot0:getBuyPrice(slot0.cards[slot1]) then
		gRootViewProxy:proxy():showTip(gLanguageCsv.autoChessNoHP)

		return false
	end

	if not slot0.scene:canBuyCard() then
		gRootViewProxy:proxy():showTip(gLanguageCsv.autoChessHandFull)

		return false
	end

	return true
end

function slot0.confirm(slot0, slot1)
	slot2 = slot0.cards[slot1]

	slot0.scene:addTrackingData(lushi.TrackingEvents.ShopBuyByID, 1, slot2.unitID)

	slot0.cards[slot1] = nil
	slot0.buy[slot1] = slot0.buy[slot1] + 1

	if slot0._cfg.costType == 0 then
		slot0.scene:useGold(slot0:getBuyPrice(slot2))
	elseif slot3 > 0 then
		slot0.scene:addTrackingData(lushi.TrackingEvents.ShopCostHP, slot3)
		slot0.scene.trainer[1]:beAttack(slot3, {
			ignoreReduce = true,
			ingoreTrigger = true
		})
	end

	slot0.scene:setObjInHand(slot2)

	if slot0._cfg.type == 1 then
		if slot0:randomUnitID() then
			slot0.cards[slot1] = slot0:newObj(slot1, slot4)
		end
	elseif slot0._cfg.type == 2 then
		slot0.cards[slot1] = slot0:newObj(slot1, slot2.unitID)
	elseif slot0._cfg.type == 3 then
		-- Nothing
	end

	slot0.scene:afterGainCard(slot2)

	return slot2
end

function slot0.confirmView(slot0)
	if slot0:isOver() then
		return
	end

	gRootViewProxy:notify("refreshEncounter", slot0:viewData())
end

function slot0.isOver(slot0)
	if slot0._cfg.limited > 0 and slot0._cfg.limited <= itertools.sum(slot0.buy) then
		return true
	end

	if next(slot0.cards) then
		return false
	end

	return true
end

function slot0.complete(slot0)
	slot0._cfg = nil

	for slot4 = 1, 3 do
		if slot0.cards[slot4] then
			slot0.scene:deleteObj(slot5)

			slot0.cards[slot4] = nil
		end
	end

	gRootViewProxy:proxy():clearDeleteObjLayer()

	slot0.scene = nil
end

function slot0.onIndexChange(slot0, slot1)
	slot0.shopIndex = slot1

	for slot5 = 1, 3 do
		if slot0.cards[slot5] then
			slot6.shopIndex = slot1

			gRootViewProxy:notify("shopEncounterChange", slot6.id)
		end
	end
end

return slot0
