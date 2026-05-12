slot1 = class("QixiFindBirdStartView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "qixi_find_bird_start.json"
slot1.RESOURCE_BINDING = {
	spineBg = "spineBg",
	textCount = "textCount",
	startBtn = {
		varname = "startBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClickStart")
			}
		}
	},
	btnRule = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRuleBtn")
			}
		}
	},
	["btnRule.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "SEEKING LOVEBIRDS",
		title = gLanguageCsv.qixiFindBird
	})

	slot0.activityId = slot1
	slot0.gameTimes = 0
	slot0.gameGuide = true

	slot0:initModel()

	slot2 = csv.yunying.yyhuodong[slot1]

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "info"
		slot3 = (slot1[slot2] or {}).info or {}
		uv5 = "gameTimes"
		uv6 = "paramMap"
		slot6.gameTimes = slot5.paramMap.qixiGameTimes - (slot3.gameTimes or 0)

		if slot3.gameGuide then
			if slot3.gameGuide == 1 then
				uv6 = "paramMap"
				slot6.gameGuide = false
			else
				uv6 = "paramMap"
				slot6.gameGuide = true
			end
		else
			uv6 = "paramMap"
			slot6.gameGuide = true
		end

		uv6 = "paramMap"
		slot6 = slot6.textCount
		slot6 = slot6.text
		uv10 = "paramMap"

		slot6(slot6, string.format(gLanguageCsv.qixiGame, slot10.gameTimes, slot5))

		uv6 = "paramMap"
		slot6 = slot6.endTime
		slot7 = slot6
		uv7 = "paramMap"
		slot7 = uiEasy.setBtnShader
		uv8 = "paramMap"
		uv9 = "paramMap"
		slot9 = slot9.startBtn
		slot10 = slot9
		uv10 = "paramMap"

		slot7(slot8.startBtn, slot9.get(slot10, "text"), slot10.gameTimes > 0 and time.getTime() < (slot6.read(slot7)[slot7.activityId] or time.getTime()) and 1 or 3)

		uv7 = "paramMap"
		slot9 = "text"
		uv9 = "paramMap"

		slot7.startBtn:get(slot9):text(slot9.gameGuide and gLanguageCsv.qixiTry or gLanguageCsv.dartGameGuideStart)
	end)
	widget.addAnimationByKey(slot0.spineBg, "qixiqueqiao/qixichoujiang_hou.skel", "bg", "effect_loop", 0):xy(slot0.spineBg:width() / 2, slot0.spineBg:height() / 2)
	widget.addAnimationByKey(slot0.spineBg, "qixiqueqiao/qixichoujiang_q.skel", "bg", "effect_loop", 100):xy(slot0.spineBg:width() / 2, slot0.spineBg:height() / 2)
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.endTime = gGameModel.role:getIdler("yy_endtime")
end

function slot1.onClickStart(slot0)
	if slot0.gameTimes > 0 then
		if (slot0.endTime:read()[slot0.activityId] or time.getTime()) <= time.getTime() then
			gGameUI:showTip(gLanguageCsv.activityOver)

			return
		end

		gGameUI:stackUI("city.activity.qixi.find_bird_game", nil, , slot0.activityId, slot0.gameGuide)
	else
		gGameUI:showTip(gLanguageCsv.notEnoughTimes)
	end
end

function slot1.onRuleBtn(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1200
	})
end

function slot1.getRuleContext(slot0, slot1)
	return {
		adaptContext.noteText(135251, 135270)
	}
end

return slot1
