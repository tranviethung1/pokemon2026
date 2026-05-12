globals.EquipSprite = class("EquipSprite", AutoChessSprite)
slot0 = 15
slot1 = 0.5
slot2, slot3 = nil
EquipSprite.StateFuncMap = {
	none = {},
	inhand = {
		onTouchBegan = function (slot0, slot1, slot2)
			slot1.isMoveInit = false
		end,
		onTouchMoved = function (slot0, slot1, slot2, slot3)
			if slot0:getDrawOutId() and slot4 ~= slot1.model.id then
				return
			end

			slot1:z(999)

			if not slot1.isMoveInit then
				slot0:showSellingPrice(slot1.model:sellingPrice())

				slot1.isMoveInit = true
			end

			if not cc.rectContainsPoint(slot1.longPressRect, slot2) then
				if not slot1:isDrawOut() then
					slot0:onHandCardDrawOut(false, slot1)
				end

				slot5 = AutoChessEasy.getEmbaltteSprByPos(slot2, slot0)

				AutoChessEasy.showPointer(slot0, slot1:x(), slot1:y(), slot2, slot5, true)
				slot0:onPointTo(lushi.PointToType.equip, slot5, {
					equipSpr = slot1
				})
			else
				slot0.pointSpr:hide()
			end

			if AutoChessEasy.isInPanel(slot2.x, slot2.y, nil, 0) then
				slot0:showSellingPrice(slot1.model:sellingPrice(), true)
			else
				slot0:showSellingPrice(slot1.model:sellingPrice())
			end
		end,
		onTouchEnded = function (slot0, slot1, slot2, slot3)
			slot0:showSellingPrice()

			slot1.isMoveInit = nil

			if slot3 then
				slot0:onHandCardDrawOut(slot1:isDrawOut(), slot1)

				return
			end

			slot0.pointSpr:hide()
			slot0.pointHeadSpr:hide()
			slot0.pointTailSpr:hide()
			slot0:onPointEnd(lushi.PointToType.equip)

			slot4 = AutoChessEasy.getEmbaltteSprByPos(slot2, slot0)

			if slot0:getDrawOutId() == slot1.model.id then
				slot0:onHandCardDrawOut(true, slot1)
			end

			if slot4 then
				slot0:handleOperation(lushi.OperateTable.handEquipMove, slot4.id, slot1.model.id)

				slot0.drawOutId = nil
			elseif AutoChessEasy.isInPanel(slot2.x, slot2.y, nil, 0) then
				slot0:handleOperation(lushi.OperateTable.saleCard, slot1.model.id)
			else
				slot1:resetSpriteState()
			end
		end
	},
	inembattle = {},
	shop = AutoChessEasy.shopFunc
}

function EquipSprite.setCardData(slot0)
	slot0.cardPrefab:setData({
		attack = slot0.model:attack(),
		hp = slot0.model:hp(),
		defence = slot0.model:shieldHp()
	})
end
