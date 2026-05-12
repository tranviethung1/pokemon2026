slot0 = cc.load("mvc").ViewBase
slot1 = class("WorldCupBetAwardView", Dialog)
slot1.RESOURCE_FILENAME = "worldcup_bet_award.json"
slot1.RESOURCE_BINDING = {
	right = "rightTitle",
	rightScoreList = "rightScoreList",
	item = "item",
	loseList = "loseList",
	title = "title",
	rightScore = "rightScoreTitle",
	lose = "loseTitle",
	rightList = "rightList",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0.data = slot1

	slot0.title:text(gLanguageCsv.worldcupBetAwardTitle)
	slot0.rightTitle:text(gLanguageCsv.worldcupBetAwardTitle1)
	slot0.loseTitle:text(gLanguageCsv.worldcupBetAwardTitle2)
	slot0.rightScoreTitle:text(gLanguageCsv.worldcupBetAwardTitle3)
	adapt.setTextScaleWithWidth(slot0.title, nil, 400)
	adapt.setTextScaleWithWidth(slot0.rightTitle, nil, 400)
	adapt.setTextScaleWithWidth(slot0.rightScoreTitle, nil, 400)
	slot0:initAwardList(slot2)
	Dialog.onCreate(slot0)
end

function slot1.initAwardList(slot0, slot1)
	slot0.rightTitle:visible(slot1 == 1)
	slot0.rightList:visible(slot1 == 1)
	slot0.loseTitle:visible(slot1 == 1)
	slot0.loseList:visible(slot1 == 1)
	slot0.rightScoreTitle:visible(slot1 ~= 1)
	slot0.rightScoreList:visible(slot1 ~= 1)
	uiEasy.createItemsToList(slot0, slot0.rightList, slot0.data.rightData, {
		scale = 0.85,
		margin = 20
	})
	uiEasy.createItemsToList(slot0, slot0.loseList, slot0.data.wrongData, {
		scale = 0.85,
		margin = 20
	})
	uiEasy.createItemsToList(slot0, slot0.rightScoreList, slot0.data.rightScoreData, {
		scale = 0.85,
		margin = 20
	})
end

return slot1
