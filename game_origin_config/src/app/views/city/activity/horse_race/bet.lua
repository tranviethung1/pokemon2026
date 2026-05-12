slot0 = class("HorseRaceBet", Dialog)
slot0.RESOURCE_FILENAME = "horse_race_bet.json"
slot0.RESOURCE_BINDING = {
	player = "player",
	["topPanel.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["betPanel.list"] = {
		varname = "bet",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				backupCached = false,
				data = bindHelper.self("itemData"),
				item = bindHelper.self("player"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:get("btnBet")
					slot6 = slot1:get("get")

					slot1:get("cost"):get("num"):text(gCommonConfigCsv.horseRaceBetCost)

					if slot3.idx ~= 0 or slot3.status ~= 2 and slot3.status ~= 5 or slot3.round ~= "prepare" then
						slot5:setVisible(false)
						slot4:get("bet"):text(gLanguageCsv.horseRaceNoBet)
						adapt.setTextScaleWithWidth(slot4:get("bet"), nil, slot4:width() - 50)
						text.addEffect(slot4:get("bet"), {
							color = ui.COLORS.DISABLED.WHITE
						})
						cache.setShader(slot4, false, "hsl_gray")
					end

					if slot3.idx == slot2 then
						slot5:setVisible(false)
						slot4:setVisible(false)
						slot6:setVisible(true)
					end

					slot7 = csv.cross.horse_race.horse_race_card[slot3.val.csv_id]

					slot1:get("name"):text(string.format(gLanguageCsv.horseRaceID, slot2, slot7.name))
					slot1:get("speed"):text(string.format(gLanguageCsv.horseRaceSpeed, slot7.speed))
					slot1:get("stamina"):text(string.format(gLanguageCsv.horseRaceStamina, slot7.stamina))
					slot1:get("sprintTime"):text(string.format(gLanguageCsv.horseRaceSprintTime, slot7.sprintTime / 10))
					slot1:get("sprint"):text(string.format(gLanguageCsv.horseRaceSprint, slot7.sprintRandom))
					ccui.ImageView:create(csv.unit[slot7.unitID].cardShow):addTo(slot1:get("img"), 1, "img"):alignCenter(slot1:get("img"):size())
					bind.touch(slot0, slot1:get("btnBet"), {
						methods = {
							ended = functools.partial(slot0.onBetClick, slot3.val.csv_id, slot1)
						}
					})
				end
			},
			handlers = {
				onBetClick = bindHelper.self("onBetClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	slot0.activityId = slot1
	slot0.data, slot0.status, slot0.cb = slot2()
	slot0.play = slot0.data:read().view.play
	slot0.bet = false

	slot0:initModel()

	slot0.itemData = idlertable.new({})

	idlereasy.any({
		slot0.yyhuodongs,
		slot0.status,
		slot0.data
	}, function (slot0, slot1, slot2, slot3)
		uv4 = "data"
		slot4 = slot1[slot4] or {}
		slot5 = {}
		uv6 = "read"
		slot6 = slot6.data:read().view.date

		for slot10, slot11 in pairs(slot3.view.race_cards) do
			if slot4 and slot4.horse_race.bet_award and slot4.horse_race.bet_award[slot6] then
				uv13 = "read"

				if slot4.horse_race.bet_award[slot6][slot13.play] then
					uv13 = "read"

					if slot4.horse_race.bet_award[slot6][slot13.play][1] or 0 > 0 then
						uv12 = "read"
						slot12.bet = true
					end

					uv16 = "read"

					table.insert(slot5, {
						val = slot11,
						idx = slot4.horse_race.bet_award[slot6][slot16.play][1] + 1,
						status = slot2,
						round = slot3.view.round
					})
				end
			else
				table.insert(slot5, {
					idx = 0,
					val = slot11,
					status = slot2,
					round = slot3.view.round
				})
			end
		end

		uv7 = "read"

		slot7.itemData:set(slot5)
	end)
	Dialog.onCreate(slot0)
end

function slot0.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.rmb = gGameModel.role:getIdler("rmb")
end

function slot0.onBetClick(slot0, slot1, slot2, slot3)
	slot4 = slot0.status:read()

	if slot0.bet then
		gGameUI:showTip(gLanguageCsv.horseRaceAlreadyBet)
	elseif slot4 == 3 or slot4 == 6 or slot4 == 1 or slot4 == 4 or slot0.data:read().view.round ~= "prepare" then
		gGameUI:showTip(gLanguageCsv.horseRaceDoNotBet)
	elseif slot0.rmb:read() < gCommonConfigCsv.horseRaceBetCost then
		uiEasy.showDialog("rmb")
	else
		gGameUI:showDialog({
			isRich = true,
			btnType = 2,
			content = string.format(gLanguageCsv.horseRaceBetTips, gCommonConfigCsv.horseRaceBetCost),
			cb = function ()
				uv4 = "gGameApp"
				uv5 = "gGameApp"
				slot5 = slot5.data
				slot6 = slot5
				uv6 = "gGameApp"
				uv7 = "requestServer"

				gGameApp:requestServer("/game/yy/horse/race/bet", function (slot0)
					uv1 = "localData"
					slot1.localData = slot0
				end, slot4.activityId, slot5.read(slot6).view.date, slot6.play, slot7)
			end
		})
	end
end

function slot0.onClose(slot0)
	if slot0.localData then
		slot0.data:set(slot0.localData)
	elseif slot0.cb then
		slot0:addCallbackOnExit(slot0.cb)
	end

	Dialog.onClose(slot0)
end

return slot0
