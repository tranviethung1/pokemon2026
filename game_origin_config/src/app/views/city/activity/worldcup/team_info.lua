slot0 = cc.load("mvc").ViewBase
slot1 = class("WorldCupTeamInfoView", Dialog)
slot1.RESOURCE_FILENAME = "worldcup_teaminfo.json"
slot1.RESOURCE_BINDING = {
	textInfo1 = "textInfo1",
	textInfo2 = "textInfo2",
	title2 = "title2",
	title1 = "title1"
}

function slot1.onCreate(slot0, slot1)
	slot1 = slot1 or {}

	slot0.title1:text(gLanguageCsv.worldcupTeamInfoTitle1)
	slot0.title2:text(gLanguageCsv.worldcupTeamInfoTitle2)
	slot0.textInfo1:hide()

	slot3, slot4 = slot0.textInfo1:xy()

	beauty.textScroll({
		align = "left",
		size = cc.size(560, 150),
		strs = {
			fontPath = "font/youmi.ttf",
			str = slot1.historyScore
		},
		effect = {
			color = ui.COLORS.NORMAL.DEFAULT
		}
	}):xy(slot3, slot4 - 20):anchorPoint(0, 0.5):addTo(slot0.textInfo1:parent(), 10, "textInfo1")
	slot0.textInfo2:hide()
	slot0.title2:y(slot0.title2:y() + 50)

	slot6, slot7 = slot0.textInfo2:xy()

	beauty.textScroll({
		align = "left",
		size = cc.size(560, 280),
		strs = {
			fontPath = "font/youmi.ttf",
			str = slot1.historyGlory
		},
		effect = {
			color = ui.COLORS.NORMAL.DEFAULT
		}
	}):xy(slot6, slot7 - 40):anchorPoint(0, 0.5):addTo(slot0.textInfo2:parent(), 10, "textInfo2")
	Dialog.onCreate(slot0)
end

return slot1
