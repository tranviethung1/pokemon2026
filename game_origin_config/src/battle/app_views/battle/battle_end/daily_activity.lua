slot0 = class("BattleEndDailyActivityView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "battle_end_daily_activity.json"
slot0.RESOURCE_BINDING = {
	score = "score",
	awardsList = "awardsList",
	progress = "progress",
	progressText = "progressText",
	progressImg = "progressImg",
	scoreText = "scoreText",
	["bkg.exitText"] = "exitText",
	cardItem = "awardsItem",
	bkg = {
		binds = {
			event = "click",
			method = bindHelper.self("onPanelClick")
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	audio.playEffectWithWeekBGM("pve_win.mp3")

	slot0.results = slot2
	slot3 = slot0:getResourceNode()
	slot2 = slot2 or {}
	slot4 = (slot2.serverData or {}).view or {}
	slot5 = slot4.award or slot4.drop or {}
	slot6 = slot2.damage
	slot7 = slot2.hpMax
	slot8 = csv.scene_conf[slot1]

	widget.addAnimation(slot3, "level/newzhandoushengli.skel", "effect", 100):anchorPoint(cc.p(0.5, 0.5)):xy(slot3:get("title"):getPosition()):addPlay("effect_loop")
	slot0.exitText:text(gLanguageCsv.click2Exit)
	slot3:get("pjText"):text(gLanguageCsv.battleEvaluation .. " :")

	if slot2.socre then
		slot0.scoreText:text(gLanguageCsv.battleScore .. " :")
	else
		slot0.scoreText:text(gLanguageCsv.damageMade .. " :")
	end

	slot0.score:text(math.floor(slot2.socre or slot6 or 1))
	slot0.progressText:text(gLanguageCsv.battleProgress .. " :")

	if not slot2.percent then
		slot10 = (slot6 or 0) * 100 / (slot7 or 1)
		slot9 = slot10 - slot10 % 0.01
	end

	if slot6 or slot7 then
		slot0.progressImg:hide()
		slot0.progress:text(slot9 .. "%")
	else
		slot10:loadTexture(({
			"city/adventure/win/txt_b.png",
			"city/adventure/win/txt_a.png",
			"city/adventure/win/txt_s.png",
			"city/adventure/win/txt_ss.png",
			"city/adventure/win/txt_sss.png"
		})[slot2.rankNode or 1])

		if slot8.gateType == game.GATE_TYPE.dailyGold then
			slot0.progress:text(slot9 .. "%")
		elseif slot8.gateType == game.GATE_TYPE.dailyExp then
			slot0.progress:text(math.floor(slot9 / slot8.finishPoint.killNumber * 100) .. "%")
		end
	end

	adapt.oneLinePos(slot0.scoreText, slot0.score, cc.p(5, 0))
	adapt.oneLinePos(slot0.progressText, {
		slot0.progressImg,
		slot0.progress
	}, cc.p(5, 0))
	slot3:get("awardsText"):text(gLanguageCsv.getAwards .. " :")

	if slot8.gateType == game.GATE_TYPE.crossMineBoss and slot4.score and slot4.score ~= 0 then
		slot11 = slot3:get("awardsText")

		adapt.oneLinePos(cc.Label:createWithTTF("", ui.FONT_PATH, 47):color(cc.c3b(91, 84, 91)):align(cc.p(0, 0.5), slot0.progressText:x(), slot11:y()):addTo(slot3, 2, "mineGetText"):show():text(gLanguageCsv.crossMineBossScore), cc.Label:createWithTTF("", ui.FONT_PATH, 50):color(cc.c3b(238, 114, 14)):align(cc.p(0, 0.5), slot0.score:x(), slot11:y()):addTo(slot3, 2, "mineScoreText"):show():text("+" .. slot4.score), cc.p(16, 0))
	end

	slot11 = dataEasy.isGateIdDoubleDrop(slot1)

	if next(slot5) ~= nil then
		slot12 = {}

		for slot16, slot17 in pairs(slot5) do
			table.insert(slot12, {
				key = slot16,
				num = slot17,
				isDouble = slot11
			})
		end

		slot0:showItem(1, slot12)
	end
end

function slot0.showItem(slot0, slot1, slot2)
	slot3 = slot0.awardsItem:clone()

	slot3:show()
	bind.extend(slot0, slot3, {
		class = "icon_key",
		props = {
			data = {
				key = slot2[slot1].key,
				num = slot2[slot1].num
			},
			isDouble = slot2[slot1].isDouble,
			specialKey = {
				maxLimit = true
			},
			onNode = function (slot0)
				slot1, slot2 = slot0:xy()

				slot0:xy(slot1, slot2 + 3)
				slot0:hide():z(2)
				transition.executeSequence(slot0, true):delay(0.5):func(function ()
					uv0 = "show"

					slot0:show()
				end):done()
			end
		}
	})
	slot0.awardsList:setItemsMargin(25)
	slot0.awardsList:pushBackCustomItem(slot3)
	slot0.awardsList:setScrollBarEnabled(false)
	transition.executeSequence(slot0.awardsList, true):delay(0.25):func(function ()
		uv0 = "csvSize"
		uv2 = "showItem"

		if slot0 < csvSize(slot2) then
			uv0 = "csvSize"
			uv2 = "csvSize"
			uv3 = "showItem"

			slot0:showItem(slot2 + 1, slot3)
		end
	end):done()
end

function slot0.onPanelClick(slot0)
	gGameUI:switchUI("city.view")
end

return slot0
