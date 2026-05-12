slot0 = class("AutoChessEncounterEnhance")
AutoChessBattle.AutoChessEncounterEnhance = slot0

function slot0.ctor(slot0, slot1, slot2)
	slot0.id = slot1
	slot0.scene = slot2
	slot0.useCount = 0
end

function slot0.init(slot0)
	slot1 = csv.auto_chess.encounter[slot0.id]
	slot2 = slot1.choose[ymrand.random(1, table.length(slot1.choose))]
	slot0._cfg = csvClone(csv.auto_chess.choose[slot2])
	slot0.sid = slot2
end

function slot0.viewData(slot0)
	slot1 = csv.auto_chess.encounter[slot0.id]
	slot2 = 0

	if slot0._cfg.limited > 0 then
		slot2 = slot0._cfg.limited - slot0.useCount
	end

	return AutoChessEasy.getEncounterViewData(slot0, slot1, {
		desc = slot0._cfg.desc,
		useCount = slot0.useCount,
		type = lushi.EncounterType.enhance,
		left = slot2,
		instruction = slot0._cfg.info,
		enhanceType = slot0._cfg.type
	})
end

function slot0.getCost(slot0, slot1)
	return AutoChessCsv.doFormula(slot0._cfg.cost, slot1.protectedEnv)
end

function slot0.canConfirm(slot0, slot1)
	if not slot0.scene:getOperateObject(slot1) then
		gRootViewProxy:proxy():showTip(gLanguageCsv.autoChessNeedSelect)

		return false
	end

	if slot0._cfg.limited > 0 and slot0._cfg.limited <= slot0.useCount then
		return false
	end

	if slot0.scene:getGoldNum() < slot0:getCost(slot2) then
		gRootViewProxy:proxy():showTip(gLanguageCsv.autoChessNoGold)

		return false
	end

	if slot0._cfg.type == 1 and lushi.HandCardLimit <= table.length(slot0.scene.handCards) then
		gRootViewProxy:proxy():showTip(gLanguageCsv.autoChessHandFull)

		return false
	end

	return true
end

function slot0.confirm(slot0, slot1)
	slot0.scene:useGold(slot0:getCost(slot0.scene:getOperateObject(slot1)))

	slot0.useCount = slot0.useCount + 1

	if slot0._cfg.type == 1 then
		slot0.scene:addTrackingData(lushi.TrackingEvents.ShopRiseStar, 1, math.min(slot2.star * 2, lushi.StarLimit))
		slot0.scene:addTrackingData(lushi.TrackingEvents.ShopRiseByID, 1, slot2.unitID)
		slot2:riseStar()
		AutoChessEasy.queueEffect("shopRise", {
			baseObjId = slot1
		})

		if slot2.readyState == lushi.ObjectReadyState.embattle then
			slot2:returnToHand()
		end

		slot0.scene:afterGainCard(slot2)
	elseif slot0._cfg.type == 2 then
		slot2:addAttrs({
			attack = slot0._cfg.typeValue[1],
			defence = slot0._cfg.typeValue[2],
			hpMax = slot0._cfg.typeValue[3]
		})
		slot2:battleDataInit()
	elseif slot0._cfg.type == 3 then
		-- Nothing
	elseif slot0._cfg.type == 4 then
		-- Nothing
	end
end

function slot0.confirmView(slot0)
	AutoChessEasy.queueEffect(function ()
		slot3 = lushi.ObjectReadyState.embattle

		gRootViewProxy:proxy():refreshPostion(1, slot3)
		gRootViewProxy:notify("listSelect")

		uv3 = "gRootViewProxy"

		gRootViewProxy:notify("refreshEncounter", slot3:viewData())
	end)
end

function slot0.isOver(slot0)
	if slot0._cfg.limited > 0 and slot0._cfg.limited <= slot0.useCount then
		return true
	end

	return false
end

function slot0.complete(slot0)
	slot0._cfg = nil
	slot0.scene = nil
end

function slot0.refreshCsv(slot0)
	slot0._cfg = csvClone(csv.auto_chess.choose[slot0.sid])
end

return slot0
