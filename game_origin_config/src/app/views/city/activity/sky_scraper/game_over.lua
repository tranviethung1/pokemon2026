slot1 = class("SkyScraperGameOver", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "sky_scraper_game_over.json"
slot1.RESOURCE_BINDING = {
	["awardBg.awardText"] = "scoreText",
	awardList = "awardList",
	["awardBg.awardNewText"] = "awardNewText",
	item = "item",
	["awardBg.awardNewImg"] = "awardNewImg",
	imgOver = "imgOver",
	awardBg = "awardBg",
	awardText = "awardText",
	barPanel = "barPanel",
	["barPanel.maxText"] = "maxText",
	["barPanel.curImg"] = "curImg",
	["bkg.exitText"] = "exitText",
	pjText = "pjText",
	bkg = {
		binds = {
			event = "click",
			method = bindHelper.self("onPanelClick")
		}
	},
	["barPanel.bar"] = {
		varname = "progressBar",
		binds = {
			event = "extend",
			class = "loadingbar",
			props = {
				data = bindHelper.self("curPagePro")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0.closeCb = slot1
	slot0.activityId = slot2
	slot0.floor = slot4

	slot0:initModel()
	audio.playEffectWithWeekBGM("pve_win.mp3")

	slot8 = slot7.view.result or {}

	slot0.showdata:update(slot8)
	uiEasy.createItemsToList(slot0, slot0.awardList, slot8, {
		specialKey = {
			maxLimit = true
		},
		onAfterBuild = function ()
			uv0 = "awardList"

			slot0.awardList:setItemAlignCenter()
		end
	})
	slot0.curImg:get("txt"):text(slot4)
	slot0.pjText:text(string.format(gLanguageCsv.skyScraperGameOverScore, slot4))
	slot0.awardText:text(string.format(gLanguageCsv.skyScraperGameOverAward, slot6))
	slot0.scoreText:setString(slot3)
	slot0.awardNewImg:setVisible(slot5)
	slot0.awardNewText:setVisible(slot5)
end

function slot1.initModel(slot0)
	slot0.curPagePro = idler.new(0)
	slot0.showdata = idlers.newWithMap({})
	slot3 = (csv.yunying.yyhuodong[slot0.activityId].paramMap or {}).maxFloor

	slot0.maxText:text(slot3)
	slot0.curPagePro:set(slot0.floor / slot3 * 100)
	slot0.curImg:x(slot0.curImg:x() + slot0.floor / slot3 * 830)

	if slot0.floor == slot3 then
		widget.addAnimation(slot0.imgOver, "level/newzhandoushengli.skel", "effect4", 100):anchorPoint(cc.p(0.5, 0.5)):xy(290, -410):addPlay("effect4_loop")
		slot0.curImg:get("txt"):visible(false)
	else
		widget.addAnimation(slot0.imgOver, "level/newzhandoushengli.skel", "effect3", 100):anchorPoint(cc.p(0.5, 0.5)):xy(290, -410):addPlay("effect3_loop")
	end
end

function slot1.onPanelClick(slot0)
	slot0.closeCb()
end

return slot1
