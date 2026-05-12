slot0 = class("SnowBallChooseRole", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "snow_ball_choose_role.json"
slot0.RESOURCE_BINDING = {
	panel2 = "panel2",
	panel1 = "panel1",
	panel3 = "panel3",
	btnChoose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onChooseClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.activityId = slot1
	slot0.chooseCsvId = 0
	slot6 = {
		onClose = slot7
	}
	slot7 = slot0:createHandler("onClose")

	gGameUI.topuiManager:createView("default", slot0, slot6):init({
		subTitle = "CHOOSE ELVES",
		title = gLanguageCsv.snowBallGameChooseSprite
	})

	for slot6, slot7 in csvPairs(csv.yunying.snowball_element) do
		if slot7.belongs == 3 and slot7.huodongID == csv.yunying.yyhuodong[slot1].huodongID then
			slot10 = csvClone(slot7)
			slot10.csvId = slot6

			table.insert({}, slot10)
		end
	end

	for slot6 = 1, 3 do
		bind.touch(slot0, slot0["panel" .. slot6], {
			methods = {
				ended = function ()
					uv0 = "chooseCsvId"
					uv1 = "csvId"
					slot0.chooseCsvId = slot1.csvId

					for slot3 = 1, 3 do
						uv4 = "chooseCsvId"
						uv7 = "panel"

						slot4["panel" .. slot3]:get("imgSel"):setVisible(slot7 == slot3)
					end
				end
			}
		})

		slot9 = slot2[slot6].attr.cardName or slot8.attr.careName

		print(slot9)
		slot7:get("imageSprite"):texture(string.format("activity/snow_ball/%s.png", slot9))

		slot10 = slot7:get("imgSm")
		slot11 = {}

		for slot15 = 1, slot8.attr.life - 1 do
			slot10:clone():addTo(slot10:getParent()):xy(slot10:x() + 49 * slot15, slot10:y())
		end

		slot12 = slot7:get("imgSd")

		for slot16 = 1, slot8.attr.showSpeed - 1 do
			slot12:clone():addTo(slot12:getParent()):xy(slot12:x() + 49 * slot16, slot12:y())
		end

		slot13 = slot7:get("imgTx")

		for slot17 = 1, slot8.attr.showWeight - 1 do
			slot13:clone():addTo(slot13:getParent()):xy(slot13:x() + 49 * slot17, slot13:y())
		end
	end
end

function slot0.initModel(slot0)
end

function slot0.onChooseClick(slot0)
	if slot0.chooseCsvId == 0 then
		gGameUI:showTip(gLanguageCsv.chooseSpriteTips)

		return
	end

	slot0:onClose()
	gGameUI:stackUI("city.activity.snow_ball.game", nil, , slot0.activityId, slot0.chooseCsvId)
end

return slot0
