function AutoChessEasy.queueEffect(slot0, slot1)
	if type(slot0) == "function" then
		gRootViewProxy:proxy():onEventEffectQueue("callback", {
			func = slot0,
			delay = slot1 and slot1.delay,
			lifetime = slot1 and slot1.lifetime,
			zOrder = slot1 and slot1.zOrder
		})
	elseif slot2 == "string" then
		gRootViewProxy:proxy():onEventEffectQueue(slot0, slot1)
	else
		error("only function or string be allowed")
	end
end

function AutoChessEasy.queueZOrderNotify(slot0, slot1, ...)
	assert(type(slot0) == "string", "msg not string type")

	slot2 = {
		...
	}

	gRootViewProxy:proxy():onEventEffectQueue("callback", {
		func = function ()
			uv2 = "gRootViewProxy"
			uv4 = "notify"

			gRootViewProxy:notify(slot2, unpack(slot4))
		end,
		zOrder = slot1
	})
end

function AutoChessEasy.priorDataTable(slot0, slot1)
	slot2 = {
		__isDirty = true,
		__value = {},
		__varName = slot1
	}

	assert(lushi.VariablePriorityTb[slot1], "lushi.priorDataTable need priority define")

	slot2.__value[lushi.VariablePriorityTb[slot1].default] = slot0

	function slot2.get(slot0)
		slot1 = slot0.__value

		if slot0.__isDirty then
			for slot5, slot6 in pairs(slot1) do
				slot0.__lastKey = (slot0.__lastKey == nil or slot0.__lastKey < slot5) and slot5 or slot0.__lastKey
			end

			slot0.__isDirty = false
		end

		return slot1[slot0.__lastKey]
	end

	function slot2.set(slot0, slot1, slot2, slot3)
		slot4 = lushi.VariablePriorityTb[slot0.__varName][slot2] or lushi.VariablePriorityTb[slot0.__varName].default

		if slot3 and slot4 ~= lushi.VariablePriorityTb[slot0.__varName].default then
			slot0.__value[slot4] = nil
		else
			slot0.__value[slot4] = slot1
		end

		slot0.__isDirty = true
		slot0.__lastKey = nil
	end

	return slot2
end

function AutoChessEasy.calcPointer(slot0, slot1, slot2, slot3)
	slot5 = {
		x = slot0 - slot2,
		y = slot1 - slot3
	}

	return math.sqrt((slot0 - slot2) * (slot0 - slot2) + (slot1 - slot3) * (slot1 - slot3)), -(math.atan2(slot5.y, slot5.x) * 180 / math.pi) - 90
end

function AutoChessEasy.isInPanel(slot0, slot1, slot2, slot3)
	slot4 = gRootViewProxy:proxy():getPanelByState(slot2, slot3 or 1)
	slot5, slot6 = slot4:getPosition()
	slot7 = slot4:size()
	slot8 = slot7.height / 2

	return slot0 > slot5 - slot7.width / 2 and slot0 < slot5 + slot9 and slot1 > slot6 - slot8 and slot1 < slot6 + slot8
end

function AutoChessEasy.getEmbaltteSprByPos(slot0, slot1)
	if not AutoChessEasy.isInPanel(slot0.x, slot0.y, lushi.ObjectReadyState.embattle) then
		return
	end

	for slot6, slot7 in pairs(slot1:onViewProxyCall("getSceneObjsByTeam", 1)) do
		if slot7:isInEmbattle() then
			slot8, slot9 = slot7:getPosition()
			slot10 = slot7.sprite:box()
			slot11 = slot10.width
			slot12 = slot10.height

			if slot8 - slot11 / 2 <= slot0.x and slot0.x <= slot8 + slot11 / 2 and slot9 - slot12 / 2 <= slot0.y and slot0.y <= slot9 + slot12 / 2 then
				return slot7
			end
		end
	end
end

slot0 = 1.2
slot1 = 15
slot2 = 40

function slot3(slot0)
	slot3 = "cardBg"
	slot0.cardBg = slot0.sprite:get(slot3)
	slot1 = slot0.cardBg:getBoundingBox()
	uv3 = "cardBg"
	slot2 = slot1.height / 2 - slot3
	uv4 = "cardBg"
	slot3 = slot1.width / 2 - slot4
	slot4 = {
		cc.p(-slot3, -slot2),
		cc.p(-slot3, slot2),
		cc.p(slot3, slot2),
		cc.p(slot3, -slot2)
	}
	slot5 = cc.DrawNode:create()

	slot5:drawPolygon(slot4, #slot4, cc.c4b(1, 1, 0, 0), 1, cc.c4b(0, 1, 0, 1))

	slot6 = cc.ClippingNode:create(slot5)

	slot6:addTo(slot0.sprite, 2):xy(slot0.cardBg:x(), slot0.cardBg:y())

	slot7 = slot0.sprite:get("unitSpr")

	slot7:retain()
	slot7:removeFromParent()
	slot7:addTo(slot6):align(cc.p(0.5, 0.5), 0, 0)
	slot7:autorelease()

	slot0.unitSpr = slot7
end

function slot4(slot0, slot1)
	slot2 = lushi.CardRarityRes[slot1.rarity]

	slot0.cardBg:loadTexture(lushi.CardBgRes .. slot2)
	slot0.sprite:get("cardShade"):loadTexture(lushi.CardShaderRes .. slot2)
	slot0.unitSpr:loadTexture(slot1.unitCfg.res)
end

function AutoChessEasy.initEventPanel(slot0, slot1)
	uv2 = "unitSpr"

	slot2(slot0)
	slot0.unitSpr:scale(slot1 and 1 or 0.5)

	slot0.eventName = slot0.sprite:get("eventName")
end

function AutoChessEasy.updateEventPanel(slot0, slot1, slot2)
	slot4 = slot1.rarity
	uv4 = "lushi"

	slot4(slot0, slot1)
	slot0.sprite:get("eventType"):loadTexture(lushi.EventCardRes[slot1.eventType])
	slot0.sprite:get("eventTypeBg"):loadTexture(lushi.EventTypeBgRes .. lushi.CardRarityRes[slot4])

	slot7, slot8 = slot0.eventName:xy()

	if slot2 then
		uv9 = "CardRarityRes"

		if not (slot9 * 2) then
			uv9 = "CardRarityRes"
		end
	end

	slot0.eventName = rich.createByStr(lushi.EventNameRichFormat .. slot1.unitCfg.name, slot9):align(cc.p(1, 0.5), slot7, slot8):addTo(slot0.sprite, 4)

	slot6:removeFromParent()
end

function AutoChessEasy.initCardPanel(slot0, slot1)
	uv2 = "dmgText"

	slot2(slot0)

	slot0.dmgText = slot0.sprite:get("dmgText")
	slot0.hpText = slot0.sprite:get("hpText")
	slot0.shieldText = slot0.sprite:get("shieldText")
	slot0.shieldBg = slot0.sprite:get("shieldBg")
	slot0.equipBg1 = slot0.sprite:get("equipBg1")
	slot0.equipBg2 = slot0.sprite:get("equipBg2")
	slot0.equipBg = slot0.equipBg1
	slot0.panelStar = slot0.sprite:get("panelStar")

	if slot1 then
		uv2 = "sprite"

		if not (slot2 * 2) then
			uv2 = "sprite"
		end
	end

	slot0.unitSpr:scale(slot2)
end

function AutoChessEasy.updateCardPanel(slot0, slot1, slot2)
	uv3 = "lushi"

	slot3(slot0, slot1)

	slot3 = lushi.CardRarityRes[slot1.rarity]

	slot0.sprite:get("dmgBg"):loadTexture(lushi.CardDmgRes .. slot3)
	slot0.sprite:get("starBg"):loadTexture(lushi.CardStarRes .. slot3)
	slot0.sprite:get("hpBg"):loadTexture(lushi.CardHpRes .. slot3)

	slot12 = slot1:getBaseAttr("defence")

	slot0:setStr("dmgText", slot1:attack(), slot1:getBaseAttr("attack"))
	slot0:setStr("hpText", slot1:hp(), slot1:getBaseAttr("hpMax"))

	if slot1:shieldHp() < 1 then
		slot0.shieldText:hide()
		slot0.shieldBg:hide()
	else
		slot0:setStr("shieldText", slot9, slot12)
		slot0.shieldText:show()
		slot0.shieldBg:show()
	end

	AutoChessEasy.updateCardStar(slot0, slot1, slot2)
end

function AutoChessEasy.updateCardStar(slot0, slot1, slot2)
	slot3 = slot1.star
	slot4 = {
		x = slot0.panelStar:width() / 2,
		y = slot0.panelStar:height() / 2
	}
	slot5 = slot2 and 2 or 1

	for slot9 = 1, 4 do
		slot10 = lushi.StarPos[slot3][slot9]

		if slot9 <= slot3 then
			slot0.panelStar:get("star" .. slot9):setPosition(slot10.x / 2 * slot5 + slot4.x, slot10.y / 2 * slot5 + slot4.y):show()
		else
			slot11:hide()
		end
	end
end

function AutoChessEasy.showPointer(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6, slot7 = AutoChessEasy.calcPointer(slot1, slot2, slot3.x, slot3.y)

	slot0.pointSpr:setPosition(cc.p(slot1, slot2)):height(slot6 + 20):setRotation(slot7):scale(1):show()

	if slot5 then
		slot0.pointHeadSpr:show():setPosition(cc.p(slot1, slot2))

		if slot4 then
			slot0.pointTailSpr:show():setPosition(slot3)
		else
			slot0.pointTailSpr:hide()
		end
	end
end

AutoChessEasy.shopFunc = {
	onTouchEnded = function (slot0, slot1, slot2, slot3)
		if slot3 then
			slot0:onViewProxyNotify("shopSelect", slot1.model.seat)
		end
	end
}

function AutoChessEasy.getMenuNode()
end

function AutoChessEasy.getMenuInfo(slot0, slot1, slot2)
	slot3 = slot0:clone()
	slot4 = slot3:get("titleLabel")

	adapt.setTextScaleWithWidth(slot4, slot1.name, 300)
	text.addEffect(slot4, {
		color = cc.c4b(91, 84, 91, 255),
		outline = {
			size = 3,
			color = lushi.EncounterRes.Color[slot1.type]
		}
	})
	slot3:get("descLabel"):setText(slot1.desc)

	slot6 = slot3:get("encounterItem")

	slot6:loadTexture(lushi.EncounterRes.Events[slot1.type])
	slot6:xy(cc.pAdd(lushi.MenuPosFix[slot1.type], cc.p(250, 330)))
	slot3:get("deleteBtn"):hide()
	slot3:addTo(slot2, 1):xy(0, 230):show()

	if slot1.icon ~= "" and slot1.icon ~= nil then
		slot8 = cc.Sprite:create(slot1.icon)

		slot8:height(slot8:height() * slot1.iconScale)
		slot8:width(slot8:width() * slot1.iconScale)
		cache.setLushiShader(slot8, false, "lushi/event/box_zzq_mask2.png", slot1.iconOffset)
		slot8:addTo(slot3, 1, "headSpr"):align(cc.p(0.5, 1 - 167 / slot8:height()), 0, 0):xy(cc.p(slot4:x() - 5, slot4:y() + 220))
	end

	return slot3
end

function AutoChessEasy.getBossMenuInfo(slot0, slot1, slot2)
	slot3 = slot0:clone()

	adapt.setTextScaleWithWidth(slot3:get("titleLabel"), slot1.name, 420)
	slot3:get("descLabel"):setText(slot1.desc)
	slot3:get("deleteBtn"):hide()
	slot3:addTo(slot2, 1):xy(0, 260):show()

	if slot1.icon ~= "" and slot1.icon ~= nil then
		slot7 = cc.Sprite:create(slot1.icon)

		slot7:height(slot7:height() * slot1.iconScale)
		slot7:width(slot7:width() * slot1.iconScale)
		cache.setLushiShader(slot7, false, "lushi/event/box_zzq_mask1.png", slot1.iconOffset)
		slot7:addTo(slot3, 1, "headSpr"):align(cc.p(0.5, 1 - 266 / slot7:height()), 0, 0):xy(cc.p(slot4:x() + 25, slot4:y() + 110))
	end

	return slot3
end

function AutoChessEasy.updateSkillInfo(slot0, slot1)
	slot2 = slot0:get("skillImage")

	text.addEffect(slot2:get("goldNum"), {
		color = lushi.Color.white,
		outline = {
			size = 3,
			color = lushi.OutLineColor.gold
		}
	})

	if slot1.type ~= lushi.TrainerSKillType.passiveSkill then
		slot2:get("gold"):show()
		slot4:show()
		slot4:setText(slot1.cost)
	else
		slot4:hide()
		slot3:hide()
	end

	slot2:loadTexture(slot1.skillIcon)
	slot0:get("nameText"):setText(slot1.name)

	if slot0:get("oneDesc"):get("descText") then
		slot7:removeFromParent()
	end

	rich.createWithWidth("#C0x5b545b#" .. slot1.desc, 45, nil, slot6:width() - 25):anchorPoint(0, 1):addTo(slot6, 1, "descText"):xy(15, slot6:height() - 35)
end

function AutoChessEasy.bfsSetNode(slot0)
	for slot5, slot6 in pairs(slot0:getChildren()) do
		AutoChessEasy.bfsSetNode(slot6)
	end

	slot0:setCascadeOpacityEnabled(true)
end

function AutoChessEasy.autoRemoveSpine(slot0, slot1)
	slot0:setSpriteEventHandler(function (slot0, slot1)
		if slot0 == sp.EventType.ANIMATION_COMPLETE then
			slot2 = removeCSprite
			uv3 = "sp"

			slot2(slot3)

			uv2 = "EventType"

			if slot2 then
				uv2 = "EventType"

				slot2()
			end
		end
	end)
end

function AutoChessEasy.playOnceEffect(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = newCSprite(slot0)

	slot7:addTo(slot3, slot4):anchorPoint(0.5, 0.5):scale(slot5):xy(slot2.x, slot2.y)
	AutoChessEasy.autoRemoveSpine(slot7, slot6)

	slot9 = slot7:play(slot1 or "effect")

	return slot7
end

function AutoChessEasy.getShowPriceNode(slot0)
	slot0 = slot0 or 80
	slot1 = cc.Node:create()
	slot2 = cc.Sprite:create(lushi.goldRes)

	slot2:xy(-25, 0):addTo(slot1, 1, "goldIcon")
	slot2:setContentSize(slot0, slot0)

	slot3 = cc.Label:createWithTTF("0", "font/youmi1.ttf", slot0)

	text.addEffect(slot3, {
		color = lushi.Color.white,
		outline = {
			size = 3,
			color = cc.c4b(50, 45, 50, 255)
		}
	})
	slot3:align(cc.p(0, 0.5), 32, 0):addTo(slot1, 1, "goldText")

	return slot1
end
