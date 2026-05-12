slot1 = class("QixiFindBirdOverView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "qixi_find_bird_over.json"
slot1.RESOURCE_BINDING = {
	text1 = "text1",
	rewardList = "rewardList",
	spinePanel = {
		varname = "spinePanel",
		binds = {
			event = "click",
			method = bindHelper.self("onClose")
		}
	}
}
slot1.RESOURCE_STYLES = {
	backGlass = true
}

function slot1.onCreate(slot0, slot1)
	slot0.cb = slot1.cb

	widget.addAnimation(slot0.spinePanel, "level/newzhandoushengli.skel", "effect3", 100):anchorPoint(cc.p(0.5, 0.5)):name("textSpine"):xy(slot0.spinePanel:width() / 2, slot0.spinePanel:height() / 2 - 55):addPlay("effect3_loop")

	slot3, slot4 = slot0.rewardList:xy()
	slot5 = slot0.rewardList:size()

	if slot1.gateCount == 0 then
		slot0.text1:text(gLanguageCsv.qixiGameOver)
		slot0.text1:setTextColor(cc.c3b(241, 59, 84))
		slot0.text1:anchorPoint(0.5, 0.5)
		slot0.text1:xy(slot3 + slot5.width / 2, slot4 + slot5.height / 2)
	else
		slot0.text1:text(string.format(gLanguageCsv.qixiText1, slot2))
	end

	uiEasy.createItemsToList(slot0, slot0.rewardList, slot1.reward.result or {}, {
		margin = 20,
		onAfterBuild = function (slot0)
			slot0:setItemAlignCenter()
		end
	})
	performWithDelay(slot0, function ()
		uv0 = "canClose"
		slot0.canClose = true
	end, 1)
end

function slot1.onClose(slot0)
	if not slot0.canClose then
		return
	end

	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb, true)

	uv1 = "canClose"

	slot1.onClose(slot0)
end

return slot1
