slot0 = {
	bad = 3,
	perfect = 1,
	good = 2
}
slot2 = class("BeachIceGameOverView", cc.load("mvc").ViewBase)
slot2.RESOURCE_FILENAME = "beach_ice_game_over.json"
slot2.RESOURCE_BINDING = {
	perfectScore = "perfectScore",
	badScore = "badScore",
	["bg.box"] = "panelBox",
	bg = "bg",
	goodScore = "goodScore",
	text = "panelText",
	goodText = "goodText",
	perfectText = "perfectText",
	badText = "badText",
	btnSure = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClick")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	slot0.cb = slot1.cb
	slot0.awards = slot1.award
	slot2 = {}

	for slot6, slot7 in orderCsvPairs(csv.yunying.shaved_ice_base) do
		if slot7.huodongID == slot1.huodongID then
			slot2 = slot7.score

			break
		end
	end

	slot0.perfectText:text(string.format(gLanguageCsv.perfectNumber, slot1.perfectNum))
	slot0.goodText:text(string.format(gLanguageCsv.goodPeople, slot1.goodNum))

	slot7 = slot1.badNum

	slot0.badText:text(string.format(gLanguageCsv.numberOfDefects, slot7))

	uv7 = "cb"
	slot7 = slot2[slot7.perfect] * slot1.perfectNum

	slot0.perfectScore:text(string.format(gLanguageCsv.bonusPoints, slot7))

	uv7 = "cb"
	slot7 = slot2[slot7.good] * slot1.goodNum

	slot0.goodScore:text(string.format(gLanguageCsv.bonusPoints, slot7))

	slot3 = slot0.badScore
	slot3 = slot3.text
	uv7 = "cb"

	slot3(slot3, string.format(gLanguageCsv.bonusPoints, slot2[slot7.bad] * slot1.badNum))

	uv3 = "cb"
	slot4 = slot1.perfectNum
	uv4 = "cb"
	slot4 = slot2[slot4.good] * slot1.goodNum
	uv4 = "cb"

	slot0.panelText:text(string.format(gLanguageCsv.settlementPoints, slot1.perfectNum + slot1.goodNum + slot1.badNum, slot2[slot3.perfect] * slot4 + slot4 + slot2[slot4.bad] * slot1.badNum))

	slot4 = widget.addAnimationByKey(slot0.bg, "effect/jiedianjiangli.skel", "boxBg", "effect_loop", 10):xy(slot0.panelBox:x(), slot0.panelBox:y() - 50):anchorPoint(0.5, 0.5)

	bind.touch(slot0, slot0.panelBox, {
		methods = {
			ended = function ()
				uv0 = "onClick"

				slot0:onClick()
			end
		}
	})
	uiEasy.addVibrateToNode(slot0, slot0.panelBox, true)
end

function slot2.onClick(slot0)
	gGameUI:showGainDisplay(slot0.awards, {
		cb = function ()
			uv0 = "cb"

			if slot0.cb then
				uv0 = "cb"

				slot0.cb()
			end

			uv0 = "onClose"
			uv1 = "cb"

			slot0.onClose(slot1)
		end
	})
end

return slot2
