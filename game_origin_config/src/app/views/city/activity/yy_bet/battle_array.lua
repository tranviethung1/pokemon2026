slot0 = class("YyBetBattleArray", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "yybet_battle_array.json"
slot0.RESOURCE_BINDING = {
	battlePanel1 = "battlePanel1",
	battlePanel2 = "battlePanel2"
}

function slot0.initTools(slot0)
	slot0.tools = require("app.views.city.activity.yy_bet.tools")
end

function slot0.onCreate(slot0, slot1, slot2)
	slot0:initTools()

	slot0.captainL = slot0.tools.getCsv("teams")[slot1].captainID
	slot0.captainR = slot0.tools.getCsv("teams")[slot2].captainID
	slot0.cardSprites = {
		{},
		{}
	}

	slot0:initSpriteL(slot1)
	slot0:initSpriteR(slot2)
end

function slot0.initSpriteL(slot0, slot1)
	slot2 = slot0.battlePanel1

	for slot8 = 1, 6 do
		if slot0.tools.getCsv("cards")[slot0.tools.getCsv("teams")[slot1].team[slot8]] then
			slot10 = slot9.cardID
			slot11 = dataEasy.getUnitCsv(slot10, 0)
			slot13 = csv.unit[csv.cards[slot10].unitID]
		end
	end

	slot2:get("fightNote.btnGHimg"):texture(dataEasy.getTeamBuffBest({
		[slot8] = {
			slot13.natureType,
			slot13.natureType2
		}
	}).buf.imgPath)

	for slot9 = 1, 6 do
		slot10 = slot2:get("item" .. slot9)

		slot10:removeChildByName("sprite")
		slot10:get("attrBg"):removeAllChildren()

		if not slot0.tools.getCsv("cards")[slot3[slot9]] then
			slot10:hide()
		else
			slot12 = slot11.cardID
			slot13 = dataEasy.getUnitCsv(slot12)
			slot15 = csv.unit[csv.cards[slot12].unitID]
			slot16 = slot10:size()
			slot17 = widget.addAnimation(slot10, slot13.unitRes, "standby_loop", 11):scaleX(slot13.scale):scaleY(slot13.scale):xy(slot16.width / 2, 50):z(0):name("sprite")

			slot17:setSkin(slot13.skin)

			slot17.orgPos = cc.p(slot16.width / 2, 100)
			slot17.battlePos = slot10:convertToNodeSpace(cc.p(display.sizeInView.width / 2 - 80, 600))

			slot0:createAttrL(slot10:get("attrBg"), slot15.natureType, slot15.natureType2, slot5.flags[slot9])

			slot0.cardSprites[1][slot9] = slot17
		end
	end

	slot6 = slot2:get("item" .. slot0.captainL)

	slot0.battlePanel1:get("ahead"):xy(slot6:x() + slot6:width() / 2 + 45, slot6:y() + 40)
	slot0.battlePanel1:get("ahead"):z(3)
end

function slot0.initSpriteR(slot0, slot1)
	slot2 = slot0.battlePanel2

	for slot8 = 1, 6 do
		if slot0.tools.getCsv("cards")[slot0.tools.getCsv("teams")[slot1].team[slot8]] then
			slot10 = slot9.cardID
			slot11 = dataEasy.getUnitCsv(slot10, 0)
			slot13 = csv.unit[csv.cards[slot10].unitID]
		end
	end

	slot2:get("fightNote.btnGHimg"):texture(dataEasy.getTeamBuffBest({
		[slot8] = {
			slot13.natureType,
			slot13.natureType2
		}
	}).buf.imgPath)

	for slot9 = 1, 6 do
		slot10 = slot2:get("item" .. slot9)

		slot10:removeChildByName("sprite")
		slot10:get("attrBg"):removeAllChildren()

		if not slot0.tools.getCsv("cards")[slot3[slot9]] then
			slot10:hide()
		else
			slot12 = slot11.cardID
			slot13 = dataEasy.getUnitCsv(slot12)
			slot15 = csv.unit[csv.cards[slot12].unitID]
			slot16 = slot10:size()
			slot17 = widget.addAnimation(slot10, slot13.unitRes, "standby_loop", 11):scaleX(-slot13.scale):scaleY(slot13.scale):xy(slot16.width / 2, 50):z(0):name("sprite")

			slot17:setSkin(slot13.skin)

			slot17.orgPos = cc.p(slot16.width / 2, 100)
			slot17.battlePos = slot10:convertToNodeSpace(cc.p(display.sizeInView.width / 2 - 80, 600))

			slot0:createAttrR(slot10:get("attrBg"), slot15.natureType, slot15.natureType2, slot5.flags[slot9])

			slot0.cardSprites[2][slot9] = slot17
		end
	end

	slot6 = slot2:get("item" .. slot0.captainR)

	slot0.battlePanel2:get("ahead"):xy(slot6:x() - slot6:width() / 2 - 45, slot6:y() + 40)
	slot0.battlePanel2:get("ahead"):z(1)
end

function slot0.spriteBattle(slot0, slot1, slot2, slot3)
	slot4 = slot0.cardSprites[slot1][slot2]

	slot4:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
		uv0 = "parent"
		slot0 = slot0:parent():parent()
		slot0 = slot0.z

		slot0(slot0, 4)

		uv0 = "parent"

		slot0:play("run_loop")
	end), cc.MoveTo:create(0.5, slot4.battlePos), cc.CallFunc:create(function ()
		uv0 = "play"
		slot0 = slot0.play

		slot0(slot0, "attack")

		uv0 = "play"

		slot0:setSpriteEventHandler(function ()
			uv0 = "setSpriteEventHandler"
			slot0 = slot0.setSpriteEventHandler

			slot0(slot0, nil, sp.EventType.ANIMATION_COMPLETE)

			uv0 = "setSpriteEventHandler"

			slot0:play("run_loop")

			slot0 = cc.Sequence
			slot1 = slot0
			uv5 = "setSpriteEventHandler"
			uv1 = "setSpriteEventHandler"

			slot1:runAction(slot0.create(slot1, cc.MoveTo:create(0.5, slot5.orgPos), cc.CallFunc:create(function ()
				uv0 = "play"
				slot0 = slot0.play

				slot0(slot0, "standby_loop")

				uv0 = "play"
				slot0 = slot0:parent():parent()
				slot0 = slot0.z

				slot0(slot0, 3)

				uv0 = "standby_loop"

				slot0()
			end)))
		end, sp.EventType.ANIMATION_COMPLETE)
	end)))
end

function slot0.startFight(slot0)
	if slot0.fighting then
		return
	end

	slot0.fighting = true
	slot0.fightArray = 1

	slot0:randomFight()
end

function slot0.randomFight(slot0)
	slot0.fightArray = slot0.fightArray == 1 and 2 or 1

	slot0:spriteBattle(slot0.fightArray, math.random(1, 6), function ()
		uv0 = "randomFight"

		slot0:randomFight()
	end)
end

function slot0.stopFight(slot0)
	for slot4 = 1, 2 do
		for slot8 = 1, 6 do
			slot9 = slot0.cardSprites[slot4][slot8]

			slot9:setSpriteEventHandler(nil, sp.EventType.ANIMATION_COMPLETE)
			slot9:stopAllActions()
			slot9:xy(slot9.orgPos)
			slot9:play("standby_loop")
		end
	end
end

function slot0.createAttrL(slot0, slot1, slot2, slot3, slot4)
	if slot4 == 1 then
		ccui.ImageView:create("city/embattle/logo_sxd.png"):addTo(slot1):scale(0.8):xy(0, 72)
	else
		slot5:xy(72, 72)
	end

	slot6 = ccui.ImageView:create("city/pvp/online_fight/ban/logo_sxd0.png"):addTo(slot1):xy(3, 75)
	slot7 = ccui.ImageView:create(ui.ATTR_ICON[slot2]):addTo(slot1):xy(3, 75):scale(0.64)

	if slot3 then
		if slot4 == 1 then
			ccui.ImageView:create("city/pvp/online_fight/ban/logo_sxd0.png"):addTo(slot1):xy(75, 75):scale(0.8):y(70)
			ccui.ImageView:create(ui.ATTR_ICON[slot3]):addTo(slot1):xy(75, 75):scale(0.64):scale(0.512):y(70)
		else
			slot6:scale(0.8):y(70)
			slot7:scale(0.512):y(70)
		end
	end
end

function slot0.createAttrR(slot0, slot1, slot2, slot3, slot4)
	if slot4 == 1 then
		ccui.ImageView:create("city/embattle/logo_sxd.png"):addTo(slot1):scaleX(-0.8):scaleY(0.8):xy(150, 72)
	else
		slot5:xy(78, 72)
	end

	slot6 = ccui.ImageView:create("city/pvp/online_fight/ban/logo_sxd0.png"):addTo(slot1):xy(147, 75)
	slot7 = ccui.ImageView:create(ui.ATTR_ICON[slot2]):addTo(slot1):xy(147, 75):scale(0.64)

	if slot3 then
		if slot4 == 1 then
			ccui.ImageView:create("city/pvp/online_fight/ban/logo_sxd0.png"):addTo(slot1):xy(75, 75):scale(0.8):y(70)
			ccui.ImageView:create(ui.ATTR_ICON[slot3]):addTo(slot1):xy(75, 75):scale(0.64):scale(0.512):y(70)
		else
			slot6:scale(0.8):y(70)
			slot7:scale(0.512):y(70)
		end
	end
end

function slot0.playWin(slot0, slot1)
	slot2 = "effect_l"

	if slot1 == 2 then
		slot2 = "effect_r"
	end

	widget.addAnimationByKey(slot0:getResourceNode(), "xianshipvp/jinjichang.skel", "winSpine", slot2, 100):xy(display.sizeInView.width / 2, display.sizeInView.height / 2 + 100):scale(1.5)
end

return slot0
