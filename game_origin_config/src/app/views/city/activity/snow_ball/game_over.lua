slot0 = class("SnowballGameOver", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "snow_ball_game_over.json"
slot0.RESOURCE_BINDING = {
	["awardBg.awardText"] = "awardText",
	["awardBg.awardNewImg"] = "awardNewImg",
	["awardBg.awardNewText"] = "awardNewText",
	["bkg.exitText"] = "exitText",
	awardBg = "awardBg",
	bkg = {
		binds = {
			event = "click",
			method = bindHelper.self("onPanelClick")
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2, slot3, slot4)
	slot0.parent = slot1

	audio.playEffectWithWeekBGM("pve_win.mp3")

	slot5 = slot0:getResourceNode()

	widget.addAnimation(slot5, "level/newzhandoushengli.skel", "effect3", 100):anchorPoint(cc.p(0.5, 0.5)):xy(slot5:get("title"):getPosition()):addPlay("effect3_loop")
	slot0.awardText:setString(slot2)

	if slot4 == 0 then
		slot0.awardNewImg:setVisible(false)
		slot0.awardNewText:text(gLanguageCsv.snowBallGuideTips):show()
	else
		slot0.awardNewImg:setVisible(slot3)
		slot0.awardNewText:setVisible(slot3)
	end
end

function slot0.onPanelClick(slot0)
	slot0.parent:onClose()
end

return slot0
