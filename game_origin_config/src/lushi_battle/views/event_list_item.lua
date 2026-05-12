globals.EventListItem = class("EventListItem", cc.Node)
slot0 = 0.9

function EventListItem.ctor(slot0, slot1, slot2, slot3)
	slot0.battleView = slot1
	slot0.sprite = nil
	slot0.model = slot2
	slot0.key = slot3
end

function EventListItem.init(slot0)
	slot0.sprite = ccui.Layout:create()

	bind.extend(slot0.battleView, slot0.sprite, {
		class = "auto_chess_card1",
		props = {
			id = slot0.model.unitID,
			star = slot0.star,
			onNode = function (slot0)
				slot3 = 5

				slot0:z(slot3)

				uv3 = "z"

				slot0:scale(slot3)
			end
		}
	})
	slot0.sprite:addTo(slot0):align(cc.p(0.5, 0.5), 0, 0)

	if slot0.model.unitCfg.canSell then
		slot0:addSaleBtn()
		slot0:addPrice()
	end

	slot0.sprite:setTouchEnabled(true)
	slot0:addListener()
end

function EventListItem.addListener(slot0)
	slot1 = nil

	function slot4(slot0, slot1)
		uv2 = "showInfoAct"

		if slot2.showInfoAct then
			uv2 = "showInfoAct"
			slot2 = slot2.stopAction
			uv4 = "showInfoAct"

			slot2(slot2, slot4.showInfoAct)

			uv2 = "showInfoAct"
			slot2.showInfoAct = nil
		end

		uv2 = "showInfoAct"

		slot2.battleView:hideCardInfo()

		return true
	end

	slot5 = cc.EventListenerTouchOneByOne:create()

	slot5:setSwallowTouches(true)
	slot5:registerScriptHandler(function (slot0, slot1)
		slot3 = slot0
		uv3 = "getLocation"
		slot3 = slot3.sprite.node
		slot4 = slot3
		slot3 = slot3.box(slot4)
		uv4 = "getLocation"
		slot4 = slot4.sprite:parent():convertToWorldSpace(cc.p(slot3.x, slot3.y))
		slot3.x = slot4.x
		slot5 = slot4.y
		slot3.y = slot5
		uv5 = "getLocation"
		slot6 = table.deepcopy(slot3)
		slot5.longPressRect = slot6
		uv6 = "getLocation"

		if cc.rectContainsPoint(slot6.longPressRect, slot0.getLocation(slot3)) then
			uv5 = "getLocation"

			if slot5.showInfoAct then
				uv5 = "getLocation"
				slot5 = slot5.stopAction
				uv7 = "getLocation"

				slot5(slot5, slot7.showInfoAct)

				uv5 = "getLocation"
				slot5.showInfoAct = nil
			end

			uv5 = "getLocation"
			uv7 = "getLocation"
			slot5.showInfoAct = performWithDelay(slot7, function ()
				uv0 = "showInfoAct"
				slot0.showInfoAct = nil
				uv0 = "showInfoAct"
				uv2 = "showInfoAct"

				slot0.battleView:showCardInfo(slot2.model)
			end, 0.3)

			return true
		end

		return false
	end, cc.Handler.EVENT_TOUCH_BEGAN)
	slot5:registerScriptHandler(function (slot0, slot1)
		uv4 = "getLocation"

		if not cc.rectContainsPoint(slot4.longPressRect, slot0:getLocation()) then
			uv3 = "getLocation"

			if slot3.showInfoAct then
				uv3 = "getLocation"
				slot3 = slot3.stopAction
				uv5 = "getLocation"

				slot3(slot3, slot5.showInfoAct)

				uv3 = "getLocation"
				slot3.showInfoAct = nil
			end

			uv3 = "getLocation"

			slot3.battleView:hideCardInfo()
		end

		return true
	end, cc.Handler.EVENT_TOUCH_MOVED)
	slot5:registerScriptHandler(slot4, cc.Handler.EVENT_TOUCH_ENDED)
	slot5:registerScriptHandler(slot4, cc.Handler.EVENT_TOUCH_CANCELLED)

	slot0.listener = slot5

	slot0.sprite:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot5, slot0.sprite)
end

function EventListItem.addSaleBtn(slot0, slot1)
	slot2 = slot0.sprite.node.cardBg:getBoundingBox()
	uv4 = "sprite"
	slot2.width = slot2.width * slot4
	uv4 = "sprite"
	slot2.height = slot2.height * slot4

	bind.touch(slot0, ccui.Button:create("lushi/event/icon_lanse.png"):xy(slot2.width / 2 - 15, slot2.height / 2 - 15):scale(0.6):addTo(slot0), {
		clicksafe = true,
		methods = {
			ended = function ()
				uv0 = "battleView"

				if slot0.battleView.isFighting then
					return
				end

				uv0 = "battleView"
				uv3 = "battleView"

				slot0.battleView:handleOperation(lushi.OperateTable.saleCard, slot3.model.id)
			end
		}
	})
end

function EventListItem.addPrice(slot0)
	slot1 = 0
	slot2 = slot0.sprite.node.cardBg:getBoundingBox()
	uv4 = "sprite"
	slot2.width = slot2.width * slot4
	uv4 = "sprite"
	slot2.height = slot2.height * slot4
	slot3 = slot2.height / 2 + 90
	slot4 = cc.Sprite:create("lushi/pop/logo_ljt2.png"):xy(slot1 - 70, slot3):addTo(slot0):scale(0.6)

	cc.Sprite:create(lushi.goldRes):xy(slot1, slot3):addTo(slot0):setContentSize(62, 62)

	slot6 = rich.createWithWidth("#C0xfffced##Pfont/youmi1.ttf#+" .. slot0.model:sellingPrice(), 54, nil, 300):anchorPoint(0, 0.5):xy(slot1 + 40, slot3):addTo(slot0)
end

function EventListItem.sceneDelObj(slot0, slot1)
	slot0.sprite:getEventDispatcher():removeEventListener(slot0.listener)
	slot0:unscheduleUpdate()
	slot0:removeSelf()
end
