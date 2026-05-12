slot0 = {
	"diuqiu_effect",
	"cjq_diuqiu_effect",
	"dsq_diuqiu_effect"
}
slot1 = {
	"chenggong_effect",
	"cjq_chenggong_effect",
	"dsq_chenggong_effect"
}
slot2 = {
	"jinglinqiu_effect_loop",
	"cjq_jinglinqiu_effect_loop",
	"dsq_jinglinqiu_effect_loop"
}
slot3 = {
	"shibai1_effect",
	"shibai2_effect",
	"shibai3_effect"
}
slot4 = {
	{
		"shibai1_effect",
		"shibai2_effect",
		"shibai3_effect"
	},
	{
		"cjq_shibai1_effect",
		"cjq_shibai2_effect",
		"cjq_shibai3_effect"
	},
	{
		"dsq_shibai1_effect",
		"dsq_shibai2_effect",
		"dsq_shibai3_effect"
	}
}
slot5 = {
	"capture/shibai1_effect.mp3",
	"capture/shibai2_effect.mp3",
	"capture/shibai3_effect.mp3"
}
slot7 = class("CaptureSpriteView", cc.load("mvc").ViewBase)
slot7.RESOURCE_FILENAME = "capture_sprite.json"
slot7.RESOURCE_BINDING = {
	["btn2.success"] = "successbg2",
	["btn1.success"] = "successbg1",
	["btn3.success"] = "successbg3",
	btn1 = "btn1",
	btn3 = "btn3",
	ball2 = "ball2",
	["titleUp.number"] = "number",
	ball1 = "ball1",
	ball3 = "ball3",
	bg = "bg",
	btn2 = "btn2",
	titleUp = "titleUp",
	["btn1.success.success"] = "successtxt1",
	["titleUp.tex"] = "tex",
	anima = "anima",
	["btn3.success.success"] = "successtxt3",
	["btn2.success.success"] = "successtxt2"
}
slot7.RESOURCE_STYLES = {
	full = true
}

function slot8(slot0)
	for slot4, slot5 in orderCsvPairs(csv.capture.probability) do
		if slot5.probability <= slot0 then
			return slot5.desc
		end
	end

	return ""
end

function slot7.initModel(slot0)
	slot0.level = gGameModel.capture:getIdler("level")
	slot0.captureNumber = gGameModel.role:getIdler("items")
	slot0.limit = gGameModel.capture:getIdler("limit_sprites")
	slot0.levelBall = gGameModel.role:getIdler("level")
	slot0.gold = gGameModel.role:getIdler("gold")
end

function slot7.onCreate(slot0, slot1, slot2, slot3)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "CATCH",
		title = gLanguageCsv.capture
	})

	slot0.cb = slot3
	slot0.gateId = slot2
	slot0.captureTab = slot1
	slot0.numberUsed = slot1.sceneTimes

	slot0:initModel()

	slot0.itemMove = true
	slot0.ballData = true
	slot0.captureTabId = {
		523,
		524,
		525
	}
	slot0.timeTab = {
		5,
		4,
		3
	}
	slot4 = {
		600,
		100,
		-400
	}
	slot0.animaData = {
		btnClickState = 1,
		closeDate = true
	}
	slot6 = csv.unit[csv.cards[slot1.cardID].unitID]
	slot0.cardSprite = widget.addAnimation(slot0.anima:get("state"), slot6.unitRes, "standby_loop", 5):alignCenter(slot0.anima:get("state"):size()):scale(slot6.scale * gCommonConfigCsv.captureSprite)

	slot0.cardSprite:setSkin(slot6.skin)
	uiEasy.setMaxStar(slot0.anima, {
		scale = 1.2,
		cardId = slot0.captureTab.cardID,
		position = {
			x = math.floor(slot0.anima:get("state"):width() / 0.9),
			y = math.min(slot6.everyPos.lifePos.y + slot0.anima:height() / 2 or math.floor(slot0.anima:height() / 1.5), 600)
		}
	})

	slot0.captureBgAnima = widget.addAnimation(slot0.bg, "diuqiu/buzhuo_di.skel", "daiji_loop", 3):alignCenter(slot0.bg:size())

	slot0.titleUp:get("number"):text(slot0.numberUsed .. "/" .. slot0.numberUsed)
	idlereasy.when(slot0.captureNumber, function (slot0, slot1)
		uv3 = "csv"
		slot2 = csv.capture.level[slot3.level:read()].rateUp

		for slot6 = 1, 3 do
			uv7 = "csv"
			slot7 = slot7.captureNumber
			slot8 = slot7
			uv8 = "csv"

			if slot7.read(slot8)[slot8.captureTabId[slot6]] then
				uv7 = "csv"
				uv10 = "csv"
				slot10 = slot10.captureNumber
				slot11 = slot10
				uv11 = "csv"

				slot7["btn" .. slot6]:get("title.number"):text("x " .. slot10.read(slot11)[slot11.captureTabId[slot6]])
			else
				uv7 = "csv"

				slot7["btn" .. slot6]:get("title.number"):text("x " .. 0)
			end
		end
	end)
	idlereasy.when(slot0.level, function (slot0, slot1)
		uv3 = "csv"
		slot3 = slot3.level
		slot4 = slot3
		slot3 = nil
		uv4 = "csv"

		if slot4.animaData.btnClickData then
			uv5 = "capture"
			uv7 = "csv"
			slot6 = "rate" .. slot7.animaData.btnClickData
			slot4 = math.floor(csv.capture.level[slot3.read(slot4)].rateUp * slot5[slot6])
			uv4 = "csv"
			uv6 = "csv"
			slot6 = "success.success"
			uv6 = "level"

			slot4["btn" .. slot6.animaData.btnClickData]:get(slot6):text(slot6(slot4))
		else
			for slot7 = 1, 3 do
				uv9 = "capture"
				slot8 = math.floor(slot2 * slot9["rate" .. slot7])
				uv8 = "csv"
				slot10 = "success.success"
				uv10 = "level"

				slot8["btn" .. slot7]:get(slot10):text(slot10(slot8))
			end
		end
	end)

	for slot13 = 1, 3 do
		slot0["ball" .. slot13]:addTouchEventListener(function (slot0, slot1)
			if slot1 == ccui.TouchEventType.began then
				uv2 = "ccui"
				uv3 = "ccui"
				slot3 = slot3.captureNumber
				slot4 = slot3
				uv4 = "ccui"
				uv5 = "TouchEventType"
				slot2.ballNumber = slot3.read(slot4)[slot4.captureTabId[slot5]]
				uv2 = "ccui"

				if slot2.ballNumber then
					uv2 = "ccui"

					if slot2.ballNumber <= 0 then
						uv2 = "ccui"
						slot2.ballData = false
						uv2 = "ccui"
						uv4 = "TouchEventType"
						slot2 = slot2["btn" .. slot4]:get("title.number")
						slot2 = slot2.text

						slot2(slot2, "x " .. 0)

						uv2 = "TouchEventType"

						if slot2 == 1 then
							slot2 = gGameUI
							slot2 = slot2.showTip
							slot4 = gLanguageCsv.captureBallNotEnough

							slot2(slot2, slot4)

							uv2 = "ccui"
							uv4 = "TouchEventType"

							slot2:buyerBall(slot4)
						else
							uv2 = "TouchEventType"

							if slot2 == 2 then
								gGameUI:showTip(gLanguageCsv.canBuyInBoutique)
							else
								gGameUI:showTip(gLanguageCsv.getInActOrMysteryShop)
							end
						end

						return
					else
						uv2 = "ccui"
						slot2.ballData = true
					end
				end

				uv2 = "ccui"

				if slot2.animaData.btnClickState == 1 then
					uv2 = "ccui"
					uv4 = "TouchEventType"
					slot2 = slot2["ball" .. slot4]
					slot2 = slot2.setEnabled

					slot2(slot2, false)

					uv2 = "ccui"
					slot2 = slot2.animaData
					slot3 = 2
					slot2.btnClickState = slot3
					uv2 = "ccui"
					slot2 = slot2.animaData
					uv3 = "TouchEventType"
					slot2.btnClickData = slot3
					uv2 = "ccui"

					if not slot2.spriteBall then
						uv2 = "ccui"

						if not slot2.guideBall then
							uv2 = "ccui"
							uv4 = "ccui"
							uv6 = "TouchEventType"
							slot6 = "ball"
							slot5 = "diuqiu/buzhuo.skel"
							uv6 = "began"
							uv7 = "TouchEventType"
							slot7 = 3
							uv5 = "ccui"
							uv7 = "TouchEventType"
							slot5 = slot5["ball" .. slot7]:get("ball")
							slot6 = slot5
							slot3 = widget.addAnimation(slot4["ball" .. slot6]:get(slot6), slot5, slot6[slot7], slot7):alignCenter(slot5.size(slot6))
							slot4 = slot3
							slot2.spriteBall = slot3.scale(slot4, 1.8)
							uv2 = "ccui"
							uv4 = "ccui"
							uv6 = "TouchEventType"
							slot5 = "diuqiu/buzhuo.skel"
							uv5 = "ccui"
							slot5 = slot5.spriteBall
							slot6 = slot5
							uv6 = "ccui"
							slot2.guideBall = widget.addAnimation(slot4["ball" .. slot6], slot5, "yindao_effect_loop", 3):xy(slot5.x(slot6) + 260, slot6.spriteBall:y() + 400):scale(0.65)
						end
					end

					uv2 = "ccui"
					uv4 = "TouchEventType"

					slot2:captureChangeView(slot4, -1000)
				end

				uv2 = "ccui"
				slot2.touchBeganPos = slot0:getTouchBeganPosition()
				uv2 = "ccui"
				slot2.btnClickView = false
			elseif slot1 == ccui.TouchEventType.moved then
				uv2 = "ccui"

				if not slot2.ballData then
					return
				end

				uv2 = "ccui"

				if slot2.animaData.btnClickState ~= 2 then
					return
				end

				uv4 = "ccui"

				if slot0:getTouchMovePosition().y - slot4.touchBeganPos.y >= 20 then
					uv4 = "ccui"
					slot4.btnClickView = true
				else
					uv4 = "ccui"
					slot4.btnClickView = false
				end
			elseif slot1 == ccui.TouchEventType.ended or slot1 == ccui.TouchEventType.canceled then
				uv2 = "ccui"

				if slot2.animaData.btnClickState ~= 2 then
					return
				end

				uv2 = "ccui"

				if not slot2.btnClickView then
					uv2 = "ccui"
					uv4 = "TouchEventType"

					slot2:captureChangeView(slot4, 0)

					return
				end

				uv2 = "ccui"

				if not slot2.ballData then
					return
				end

				uv2 = "ccui"
				slot2 = slot2.anima
				slot2 = slot2.removeChildByName

				slot2(slot2, "maxStarBg")

				uv2 = "ccui"
				slot2 = slot2.anima
				slot2 = slot2.removeChildByName

				slot2(slot2, "maxStarText")

				uv2 = "ccui"
				slot2.animaData.closeDate = false
				slot2 = audio.playEffectWithWeekBGM

				slot2("capture/diuqiu_effect.mp3")

				uv2 = "ccui"

				if not slot2.spriteBall then
					uv2 = "ccui"

					if slot2.guideBall then
						uv2 = "ccui"
						slot2 = slot2.spriteBall
						slot2 = slot2.hide

						slot2(slot2)

						uv2 = "ccui"

						slot2.guideBall:hide()
					end
				end

				uv2 = "ccui"
				slot2 = slot2.animaData
				slot2.btnClickState = 3
				uv2 = "ccui"
				uv4 = "ccui"
				uv6 = "TouchEventType"
				slot6 = "castAnima"
				slot5 = "diuqiu/buzhuo.skel"
				uv6 = "ballNumber"
				uv7 = "TouchEventType"
				slot6 = slot6[slot7]
				uv5 = "captureNumber"
				uv6 = "TouchEventType"
				slot3 = widget.addAnimation(slot4["ball" .. slot6]:get(slot6), slot5, slot6, 5):xy(slot5[slot6], 600):scale(2)
				slot2.castBallAnima = slot3
				uv3 = "ccui"

				performWithDelay(slot3, function ()
					uv0 = "anima"

					slot0.anima:runAction(cc.Sequence:create(cc.ScaleBy:create(0.2, 0.3), cc.CallFunc:create(function ()
						uv0 = "cardSprite"

						slot0.cardSprite:visible(false)
					end)))
				end, 0.8)

				uv3 = "ccui"

				performWithDelay(slot3, function ()
					uv0 = "castBallAnima"

					if slot0.castBallAnima then
						uv0 = "castBallAnima"
						slot0 = slot0.castBallAnima
						slot0 = slot0.removeFromParent

						slot0(slot0)

						uv0 = "castBallAnima"
						slot0.castBallAnima = nil
					end

					uv0 = "castBallAnima"
					uv2 = "removeFromParent"

					slot0:onChangeClick(slot2)
				end, 1.3)
			end
		end)
	end

	adapt.oneLinePos(slot0.tex, slot0.number, cc.p(5, 0), "left")
	adapt.setTextScaleWithWidth(slot0.successtxt1, nil, slot0.successbg1:size().width - 20)
	adapt.setTextScaleWithWidth(slot0.successtxt2, nil, slot0.successbg2:size().width - 20)
	adapt.setTextScaleWithWidth(slot0.successtxt3, nil, slot0.successbg3:size().width - 20)
end

function slot7.captureChangeView(slot0, slot1, slot2)
	if slot0.itemMove and slot2 >= 0 or not slot0.itemMove and slot2 < 0 then
		return
	end

	for slot6 = 1, 3 do
		slot0["btn" .. slot6]:stopAllActions()

		if slot1 ~= slot6 then
			slot0["btn" .. slot6]:runAction(cc.MoveTo:create(0.2, cc.p(slot0["btn" .. slot6]:x(), 283 + slot2)))
			slot0["ball" .. slot6]:visible(slot2 >= 0)
		end
	end

	if slot2 >= 0 then
		slot0["btn" .. slot1]:visible(true)
		slot0["btn" .. slot1]:scale(1)

		if slot0.spriteBall and slot0.guideBall then
			slot0.spriteBall:removeFromParent()

			slot0.spriteBall = nil

			slot0.guideBall:removeFromParent()

			slot0.guideBall = nil
		end

		slot0.animaData.closeDate = true
		slot0.itemMove = true

		slot0["ball" .. slot1]:setEnabled(true)

		slot0.animaData.btnClickState = 1
	else
		slot0["btn" .. slot1]:visible(false)

		slot0.itemMove = false
	end
end

function slot7.onChangeClick(slot0, slot1)
	slot2 = math.random(1, 3)

	gGameApp:requestServer("/game/capture", function (slot0)
		if csvNext(slot0.view.result) then
			uv1 = "csvNext"

			if not slot1.resultAnima then
				uv1 = "csvNext"
				uv3 = "csvNext"
				uv5 = "view"
				uv6 = "result"
				slot4 = 5
				slot2 = widget.addAnimation(slot3.anima, "diuqiu/buzhuo.skel", slot5[slot6], 2):scale(slot4)
				slot3 = slot2
				uv4 = "csvNext"
				slot1.resultAnima = slot2.alignCenter(slot3, slot4.anima:size())
				uv1 = "csvNext"
				uv3 = "csvNext"

				slot1.resultAnima:y(slot3.resultAnima:y() - 40)
			else
				uv1 = "csvNext"
				slot1 = slot1.resultAnima:show()
				slot1 = slot1.play
				uv3 = "view"
				uv4 = "result"

				slot1(slot1, slot3[slot4])

				uv1 = "csvNext"

				slot1.resultAnima:scale(5)
			end

			uv1 = "csvNext"
			slot3 = "chenggong_effect"

			slot1.captureBgAnima:play(slot3)
			audio.playEffectWithWeekBGM("capture/chenggong_effect.mp3")

			slot1 = {
				db_id = slot0.view.result.carddbIDs[1][1],
				first = slot0.view.result.carddbIDs[1][2]
			}
			uv3 = "csvNext"

			performWithDelay(slot3, function ()
				uv5 = "gGameUI"
				uv8 = "stackUI"

				gGameUI:stackUI("common.gain_sprite", nil, {
					full = true
				}, slot5, nil, false, slot8:createHandler("captureWin"))
			end, 5.5)

			return
		end

		slot1 = audio.playEffectWithWeekBGM
		uv2 = "resultAnima"
		uv3 = "widget"

		slot1(slot2[slot3])

		uv1 = "csvNext"
		slot1 = slot1.captureBgAnima
		slot1 = slot1.play
		uv3 = "addAnimation"
		uv4 = "widget"

		slot1(slot1, slot3[slot4])

		uv1 = "csvNext"

		if not slot1.resultAnima then
			uv1 = "csvNext"
			uv3 = "csvNext"
			slot4 = "diuqiu/buzhuo.skel"
			uv5 = "anima"
			uv6 = "result"
			uv6 = "widget"
			uv4 = "csvNext"
			slot2 = widget.addAnimation(slot3.anima, slot4, slot5[slot6][slot6], 2):alignCenter(slot4.anima:size())
			slot3 = slot2
			slot1.resultAnima = slot2.scale(slot3, 5)
			uv1 = "csvNext"
			uv3 = "csvNext"

			slot1.resultAnima:y(slot3.resultAnima:y() - 40)
		else
			uv1 = "csvNext"
			slot1 = slot1.resultAnima:show()
			slot1 = slot1.play
			uv3 = "anima"
			uv4 = "result"
			uv4 = "widget"

			slot1(slot1, slot3[slot4][slot4])

			uv1 = "csvNext"

			slot1.resultAnima:scale(5)
		end

		uv2 = "csvNext"
		uv4 = "csvNext"
		uv5 = "widget"
		slot4 = slot4.timeTab[slot5] - 1

		performWithDelay(slot2, function ()
			audio.playEffectWithWeekBGM("capture/fanhui_effect.mp3")
		end, slot4)

		uv2 = "csvNext"
		uv4 = "csvNext"
		uv5 = "widget"

		performWithDelay(slot2, function ()
			uv0 = "titleUp"
			slot2 = "number"
			slot0 = slot0.titleUp:get(slot2)
			slot0 = slot0.text
			uv2 = "titleUp"
			uv3 = "get"
			uv4 = "titleUp"

			slot0(slot0, slot2.numberUsed - slot3.view.scene_times .. "/" .. slot4.numberUsed)

			uv0 = "titleUp"
			slot0 = slot0.resultAnima
			slot0 = slot0.scale

			slot0(slot0, 3)

			uv0 = "titleUp"
			slot0 = slot0.resultAnima
			slot0 = slot0.play

			slot0(slot0, "fanhui_effect")

			uv0 = "titleUp"
			slot0 = slot0.captureBgAnima
			slot1 = slot0

			slot0.play(slot1, "fanhui_effect")

			uv1 = "titleUp"

			performWithDelay(slot1, function ()
				uv0 = "cardSprite"
				slot0 = slot0.cardSprite
				slot0 = slot0.visible

				slot0(slot0, true)

				uv0 = "cardSprite"

				slot0.anima:scale(1)
			end, 0.3)

			uv1 = "titleUp"

			performWithDelay(slot1, function ()
				uv0 = "captureBgAnima"
				slot0 = slot0.captureBgAnima
				slot0 = slot0.play
				slot2 = "daiji_loop"

				slot0(slot0, slot2)

				uv0 = "captureBgAnima"
				uv2 = "play"
				slot3 = 0

				slot0:captureChangeView(slot2, slot3)

				uv2 = "captureBgAnima"
				slot1 = math.min
				uv3 = "captureBgAnima"

				if not (csv.unit[csv.cards[slot2.captureTab.cardID].unitID].everyPos.lifePos.y + slot3.anima:height() / 2) then
					uv3 = "captureBgAnima"
					slot2 = math.floor(slot3.anima:height() / 1.5)
				end

				slot3 = 600
				slot2 = uiEasy.setMaxStar
				uv3 = "captureBgAnima"
				slot3 = slot3.anima
				uv5 = "captureBgAnima"
				uv7 = "captureBgAnima"

				slot2(slot3, {
					scale = 1.2,
					cardId = slot5.captureTab.cardID,
					position = {
						x = math.floor(slot7.anima:get("state"):width() / 0.9),
						y = slot1(slot2, slot3)
					}
				})

				uv2 = "daiji_loop"
				uv3 = "captureBgAnima"

				if slot2.view.scene_times == slot3.numberUsed then
					uv7 = "captureBgAnima"

					gGameUI:stackUI("city.capture.capture_over", nil, , slot7:createHandler("captSpriteCloseView"))

					return
				end
			end, 0.8)
		end, slot4.timeTab[slot5])
	end, slot0.captureTab.type, slot0.gateId, slot0.captureTabId[slot1])
end

function slot7.captureWin(slot0)
	slot0:captureChangeView(slot0.animaData.btnClickData, 0)
	slot0:captSpriteCloseView()
end

function slot7.buyerBall(slot0, slot1)
	if slot1 ~= 1 then
		gGameUI:showTip(gLanguageCsv.captureBallNotEnough)

		return
	end

	gGameUI:stackUI("common.buy_info", nil, , {
		gold = csv.items[game.SPRITE_BALL_ID.normal].specialArgsMap.buy_gold
	}, {
		id = game.SPRITE_BALL_ID.normal
	}, {
		contentType = "num",
		maxNum = 100
	}, slot0:createHandler("showBuyInfo"))
end

function slot7.showBuyInfo(slot0, slot1)
	if slot0.levelBall:read() < csv.items[game.SPRITE_BALL_ID.normal].specialArgsMap.buy_level then
		gGameUI:showTip(gLanguageCsv.buyItemLevelLimit)

		return
	else
		gGameApp:requestServer("/game/ball/buy_item", function (slot0)
			gGameUI:showTip(gLanguageCsv.hasBuy)
		end, game.SPRITE_BALL_ID.normal, slot1)
	end
end

function slot7.onClose(slot0)
	if not slot0.animaData.closeDate then
		return
	end

	gGameUI:showDialog({
		clearFast = true,
		btnType = 2,
		title = gLanguageCsv.abandon,
		content = gLanguageCsv.spriteClose,
		cb = function ()
			uv0 = "onClose"
			uv1 = "onClose"

			slot0.onClose(slot1)
		end
	})
end

function slot7.captSpriteCloseView(slot0, slot1)
	if slot0.cb then
		slot0.cb(slot1)
	end
end

return slot7
