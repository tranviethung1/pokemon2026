slot0 = class("BattleEndPvpStageUpView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "battle_end_pvp_stage_up.json"
slot0.RESOURCE_BINDING = {
	stageChange = "stageChange",
	stageTxt = "stageTxt",
	stage = {
		varname = "stage",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	},
	imgBg = {
		binds = {
			event = "click",
			method = bindHelper.self("onCloseClick")
		}
	}
}

function slot0.playEffect(slot0, slot1, slot2)
	slot3 = "effect_loop"

	if slot1 == "zuanshi" and slot2 == "dashi" or slot1 == "dashi" and slot2 == "wangzhe" or slot1 == "zuanshi" and slot2 == "wangzhe" then
		slot3 = "effect_up"
	end

	widget.addAnimationByKey(slot0:getResourceNode(), "crossarena/duanwei_di.skel", "selEffect", slot3, 100):anchorPoint(cc.p(0.5, 0.5)):xy(slot0.stageChange:xy()):scale(2):play(slot3)
end

function slot0.playUPEffect(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = slot1 .. slot0.upx

	if slot1 ~= slot2 then
		slot6 = slot5 and slot1 .. "_down" or slot1 .. "_up"
	end

	slot8 = widget.addAnimationByKey(slot0:getResourceNode(), slot0.mainSpine, "selEffect99", slot6, 100):anchorPoint(cc.p(0.5, 0.5)):xy(slot0.stageChange:xy()):scale(2.2)

	if slot1 == slot2 then
		slot0.stageTxt:text(function (slot0, slot1)
			slot2 = slot0

			if slot0 == "K" then
				uv3 = "K"
				slot2 = slot3.data.gateType == game.GATE_TYPE.crossSupremacy and "" or (slot1 ~= "dashi" or gLanguageCsv.crossArenaStage18) and gLanguageCsv.crossArenaStage19
			end

			return slot2
		end(slot4, slot2))
		widget.addAnimationByKey(slot0:getResourceNode(), "crossarena/duanwei_shengji.skel", "selEffect2", "effect", 100):anchorPoint(cc.p(0.5, 0.5)):xy(slot0.stageChange:xy()):play("effect")
	else
		performWithDelay(slot0:getResourceNode(), function ()
			uv0 = "hide"
			slot1 = slot0

			slot0.hide(slot1)

			uv1 = "widget"
			uv2 = "addAnimationByKey"
			uv4 = "mainSpine"
			slot2 = cc.p
			uv2 = "addAnimationByKey"
			slot2 = 2.2
			uv2 = "mainSpine"

			widget.addAnimationByKey(slot1, slot2.mainSpine, "selEffect3", slot4 .. "_loop", 100):anchorPoint(slot2(0.5, 0.5)):xy(slot2.stageChange:xy()):scale(slot2):play(slot2 .. "_loop")
		end, 1.8)
		transition.executeSequence(slot0.stageTxt):func(function ()
			uv0 = "stageTxt"
			uv2 = "text"
			uv3 = "stageTxt"
			uv4 = "text"

			slot0.stageTxt:text(slot2(slot3, slot4))
		end):fadeOut(0.8):done()
		performWithDelay(slot0.stageTxt, function ()
			uv1 = "transition"

			transition.executeSequence(slot1.stageTxt):func(function ()
				uv0 = "stageTxt"
				uv2 = "text"
				uv3 = "stageTxt"
				uv4 = "text"

				slot0.stageTxt:text(slot2(slot3, slot4))
			end):fadeIn(1):done()
		end, 1)
	end

	slot0.stageTxt:scale(1.5)
end

function slot0.onCreate(slot0, slot1, slot2, slot3)
	audio.playEffectWithWeekBGM("pvp_win.mp3")

	slot0.data = slot2
	slot0.results = slot3
	slot0.mainSpine = slot0.results.stageUpInfo.mainSpine
	slot0.upx = slot0.results.stageUpInfo.upx
	slot4 = slot3.preData
	slot6, slot7, slot8, slot9, slot10 = nil

	if slot3.flag == "crossArena" then
		slot0.stage:text(gLanguageCsv.crossArenaRankUPTo .. slot3.curData.stageName)

		for slot16, slot17 in ipairs(csv.cross.arena.stage) do
			if slot17.version == csv.cross.service[gGameModel.cross_arena:read("csvID")].version then
				if slot5.stageName == slot17.stageName then
					slot9 = slot17.stageLevel
					slot7 = slot17.stagePinyin
				end

				if slot4.stageName == slot17.stageName then
					slot8 = slot17.stageLevel
					slot6 = slot17.stagePinyin
				end
			end
		end

		slot10 = false
	elseif slot3.flag == "crossSupremacy" then
		slot0.stage:text(gLanguageCsv.crossArenaRankUPTo .. slot5.stageName)

		slot9 = slot5.stageLevel
		slot7 = slot5.stagePinyin
		slot8 = slot4.stageLevel
		slot6 = slot4.stagePinyin
		slot10 = slot5.rankScore < slot4.rankScore
	end

	slot0:playEffect(slot6, slot7)
	slot0:playUPEffect(slot6, slot7, slot8, slot9, slot10)
end

function slot0.onCloseClick(slot0)
	gGameUI:switchUI("city.view")
end

return slot0
