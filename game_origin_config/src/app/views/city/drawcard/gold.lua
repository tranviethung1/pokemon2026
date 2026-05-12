return {
	initPageItemFunc = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
		slot0:addEffectInRect("effect/jingbichouka.skel")
		slot0.isLimitDraw:set(false)

		slot10 = slot2 < tonumber(gCommonConfigCsv.drawGoldFreeLimit) and not (gCommonConfigCsv.drawGoldFreeRefreshDuration - (time.getTime() - slot0.lastDrawTime:read()) > 0)
		slot11 = nil
		slot13 = nil

		if slot6 < dataEasy.getPrivilegeVal(game.PRIVILEGE_TYPE.FreeGoldDrawCardTimes) then
			slot10 = true

			slot0.freeTxt:text(gLanguageCsv.privilegeCount)
			slot0.txtFree:text(gLanguageCsv.privilege)
			text.addEffect(slot0.txtFree, {
				color = cc.c4b(255, 241, 1, 255)
			})

			slot11 = false
			slot13 = slot12 - slot6 .. "/" .. slot12
		else
			slot0.freeTxt:text(gLanguageCsv.freeCount)
			slot0.txtFree:text(gLanguageCsv.free)
			text.addEffect(slot0.txtFree, {
				color = cc.c4b(177, 233, 126, 255)
			})

			slot13 = gCommonConfigCsv.drawGoldFreeLimit - slot2 .. "/" .. gCommonConfigCsv.drawGoldFreeLimit
			slot11 = slot2 < tonumber(gCommonConfigCsv.drawGoldFreeLimit) and slot9
		end

		slot0.isFree:set(slot10)
		slot0.isCost:set(not slot10)
		slot0.isCutDown:set(slot11, true)
		slot0.freeTimes:set(slot13)

		slot14 = "common/icon/icon_gold.png"
		slot15 = "common/icon/icon_gold.png"
		slot16 = gCommonConfigCsv.drawGoldCostPrice
		slot17 = gCommonConfigCsv.draw10GoldCostPrice
		slot18 = dataEasy.getNumByKey(game.ITEM_TICKET.goldCard)

		if not slot10 and slot18 > 0 then
			slot14 = dataEasy.getIconResByKey(game.ITEM_TICKET.goldCard)
			slot16 = string.format("%s/%s", slot18, 1)
		end

		if slot18 >= 10 then
			slot15 = dataEasy.getIconResByKey(game.ITEM_TICKET.goldCard)
			slot17 = string.format("%s/%s", slot18, 10)
		end

		slot0.oneIconPath:set(slot14)
		slot0.tenIconPath:set(slot15)
		slot0.drawOnceCost:set(slot16)
		slot0.drawTenCost:set(slot17)
	end,
	isEnoughToDrawFunc = function (slot0, slot1)
		slot3 = slot0.gold:read()
		slot4 = gCommonConfigCsv.drawGoldCostPrice
		slot5 = gCommonConfigCsv.draw10GoldCostPrice

		if dataEasy.getNumByKey(game.ITEM_TICKET.goldCard) > 0 then
			slot4 = 1
			slot2 = slot6

			if slot6 >= 10 then
				slot5 = 10
				slot3 = slot6
			end
		end

		if slot1 then
			return slot5 <= slot3
		else
			return slot4 <= slot2
		end
	end,
	drawOneClickFunc = function (slot0)
		gGameApp:requestServer("/game/lottery/card/draw", function (slot0)
			audio.pauseMusic()
			audio.playEffectWithWeekBGM("drawcard_one.mp3")

			slot1, slot6, slot3 = dataEasy.getRawTable(slot0)
			uv6 = "audio"

			gGameUI:stackUI("city.drawcard.result", nil, , {
				drawType = "gold",
				times = 1,
				items = dataEasy.getItems(slot1, slot6),
				isFree = slot6
			})
		end, slot0.isFree:read() and "free_gold1" or "gold1")

		if slot1 then
			sdk.trackEvent("free_goldsingle")
		end
	end,
	drawTenClickFunc = function (slot0)
		sdk.trackEvent("gold_10x")
		gGameApp:requestServer("/game/lottery/card/draw", function (slot0)
			audio.pauseMusic()
			audio.playEffectWithWeekBGM("drawcard_ten.mp3")

			slot1, slot2, slot3 = dataEasy.getRawTable(slot0)

			gGameUI:stackUI("city.drawcard.result", nil, , {
				drawType = "gold",
				isFree = false,
				times = 10,
				items = dataEasy.getItems(slot1, slot2)
			})
		end, "gold10")
	end
}
