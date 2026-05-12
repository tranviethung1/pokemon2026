slot1 = class("HorseRaceEnd", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "horse_race_end.json"
slot1.RESOURCE_BINDING = {
	["replay.text"] = "panelText",
	two = "two",
	three = "three",
	one = "one",
	bg1 = "bg1",
	four = "four",
	replay = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onReplay")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2, slot3)
	slot10 = slot0
	slot11 = "onClose"

	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0.createHandler(slot10, slot11)
	}):init({
		subTitle = "HORSE RACE",
		title = gLanguageCsv.horseRace
	})

	slot0.activityId = slot1
	slot0.index = slot2[2]
	slot0.cb = slot3
	slot0.data = slot2[1]
	slot4 = 1

	slot0:initModel()

	slot5 = {}

	for slot10, slot11 in pairs({
		"one",
		"two",
		"three",
		"four"
	}) do
		slot12 = slot6[slot0.data[slot10].result] or slot6[slot10]
		slot13 = csv.cross.horse_race.horse_race_card[slot0.data[slot10].csv_id]

		text.addEffect(slot0.panelText, {
			outline = {
				size = 3,
				color = cc.c4b(218, 112, 21, 255)
			}
		})
		widget.addAnimation(slot0[slot12]:get("player"), csv.unit[slot13.unitID].unitRes, "standby_loop", 5):alignCenter(cc.size(slot0[slot12]:get("player"):size().width, slot0[slot12]:get("player"):size().height - 300)):anchorPoint(cc.p(0.5, 0.5)):setScale(2):setSkin(csv.unit[slot13.unitID].skin)

		if slot0.index and slot0.index > 0 then
			slot0[slot11]:get("bet"):setVisible(slot10 == slot0.data[slot0.index].result)
		else
			slot0[slot11]:get("bet"):setVisible(false)
		end

		if slot0.data[slot10].result == 1 then
			slot4 = slot10
		end
	end

	if slot0.index and slot0.index > 0 then
		slot7 = csv.cross.horse_race.horse_race_card[slot0.data[slot0.index].csv_id]
		slot8 = slot0.data[slot0.index].result

		if matchLanguage({
			"en"
		}) then
			slot8 = ({
				"1st",
				"2nd",
				"3rd",
				"4th"
			})[slot8] or slot8
		end

		slot9 = rich.createByStr(string.format(gLanguageCsv.horseRaceHasBet, csv.unit[slot7.unitID].name, slot8), 50):size(700, 300):xy(500, 800):addTo(slot0.bg1, 10):ignoreContentAdaptWithSize(false)
	else
		slot8 = rich.createByStr(string.format(gLanguageCsv.horseRaceNotBet, csv.unit[csv.cross.horse_race.horse_race_card[slot0.data[slot4].csv_id].unitID].name), 50):size(700, 300):xy(500, 800):addTo(slot0.bg1, 10):ignoreContentAdaptWithSize(false)
	end
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
end

function slot1.onReplay(slot0)
	uv4 = "data"

	slot4.onClose(slot0)
	gGameUI:stackUI("city.activity.horse_race.match", nil, , slot0.activityId, {
		slot0.data,
		slot0.index
	})
end

function slot1.onClose(slot0)
	uv1 = "onClose"

	slot1.onClose(slot0)
	gGameUI:goBackInStackUI("city.activity.horse_race.view")
end

return slot1
