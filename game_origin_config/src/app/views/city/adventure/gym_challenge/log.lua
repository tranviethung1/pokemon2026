slot1 = class("GymLog", cc.load("mvc").ViewBase)
slot2 = 46
slot3 = 40
slot4 = 80
slot5 = {
	gymReset = 1,
	gymClosed = 19
}
slot6 = {
	"gymReset",
	"gymFubenPass",
	"gymAllPass",
	"gymOccupy",
	"gymLeaderWin",
	"gymLeaderFail",
	"crossGymLeaderOccupy",
	"crossGymOccupy",
	"crossGymLeaderWin",
	"crossGymWin",
	"crossGymLeaderFail",
	"crossGymFail",
	"gymLeaderDefenceWin",
	"gymLeaderDefenceFail",
	"crossGymLeaderDefenceWin",
	"crossGymLeaderDefenceFail",
	"crossGymDefenceWin",
	"crossGymDefenceFail",
	"gymClosed",
	"gymGarrison2",
	"gymPassGate2"
}
slot1.RESOURCE_FILENAME = "gym_log.json"
slot1.RESOURCE_BINDING = {
	item = "item",
	recordList = {
		varname = "recordList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("logDatas"),
				item = bindHelper.self("item"),
				time = bindHelper.self("lastTime"),
				preloadCenterIndex = bindHelper.self("preloadCenterIndex"),
				itemAction = {
					isAction = true
				},
				preloadBottom = bindHelper.self("preloadBottom"),
				onItem = function (slot0, slot1, slot2, slot3)
					uv4 = "time"
					slot5 = slot3.time
					slot6, slot7 = time.getHourAndMin(slot3.time)
					slot8 = time.getDate(slot3.time)
					slot11 = string.format

					slot1:get("textTime"):text(slot11("[%02d:%02d]", slot8.hour, slot8.min))

					slot9 = ""
					slot10 = {}
					uv11 = "getHourAndMin"

					if slot11[slot3.type] == "gymClosed" then
						if slot3.pass_num > 0 then
							uv12 = "getHourAndMin"
							slot9 = gLanguageCsv[slot12[slot3.type]] .. "\n" .. string.format(gLanguageCsv.gymPassGate1, slot3.pass_num)
						else
							uv12 = "getHourAndMin"
							slot9 = gLanguageCsv[slot12[slot3.type]] .. "\n" .. string.format(gLanguageCsv.gymPassGate2, slot3.pass_num)
						end

						if slot3.leader_gym_id then
							slot9 = slot9 .. "\n" .. string.format(gLanguageCsv.gymGarrison1, csv.gym.gym[slot3.leader_gym_id].fontColor .. csv.gym.gym[slot3.leader_gym_id].name .. "#C0x5B545B#", "#T44-0.8#")
						end

						if slot3.cross_leader_gym_id then
							slot9 = slot9 .. "\n" .. string.format(gLanguageCsv.gymGarrison1, csv.gym.gym[slot3.cross_leader_gym_id].fontColor .. gLanguageCsv.crossServer .. csv.gym.gym[slot3.cross_leader_gym_id].name .. "#C0x5B545B#", "#T45-0.8#")
						end

						if slot3.cross_gym_id then
							slot9 = slot9 .. "\n" .. string.format(gLanguageCsv.gymGarrison2, csv.gym.gym[slot3.cross_gym_id].fontColor .. gLanguageCsv.crossServer .. csv.gym.gym[slot3.cross_gym_id].name .. "#C0x5B545B#", "#T45-0.8#")
						end
					elseif slot3.gym_id then
						uv14 = "getHourAndMin"

						if string.find(slot14[slot3.type], "cross") then
							uv15 = "getHourAndMin"
							slot9 = string.format(gLanguageCsv[slot15[slot3.type]], csv.gym.gym[slot3.gym_id].fontColor .. gLanguageCsv.crossServer .. csv.gym.gym[slot3.gym_id].name .. "#C0x5B545B#")
						else
							uv15 = "getHourAndMin"
							slot9 = string.format(gLanguageCsv[slot15[slot3.type]], slot11 .. slot12 .. "#C0x5B545B#")
						end

						if slot3.gym_battle_history then
							slot9 = string.format(slot9, slot11 .. slot12 .. "#C0x5B545B#") .. "#LULgymLog##Icommon/btn/img_ckxq.png-182-54#"
							slot10 = slot3.gym_battle_history
						end
					else
						uv12 = "getHourAndMin"
						slot9 = gLanguageCsv[slot12[slot3.type]]
					end

					slot1:removeChildByName("text")

					slot11 = rich.createByStr(slot9, 40)

					rich.adjustWidth(slot11, 2000, 34)
					slot11:formatText()
					slot11:anchorPoint(cc.p(0, 1))
					slot11:xy(cc.p(330, 40))

					slot16 = "text"

					slot11:addTo(slot1, 10, slot16)
					uiEasy.setUrlHandler(slot11, slot10)

					slot13 = slot11
					slot12 = slot11.height(slot13)
					uv13 = "getDate"
					uv16 = "time"
					uv17 = "getDate"
					slot16 = (slot16 - slot17) / 2 + slot12

					slot11:xy(330, slot16)

					slot15 = "textTime"
					uv15 = "time"
					uv16 = "getDate"
					uv16 = "getDate"

					slot1:get(slot15):y((slot15 - slot16) / 2 + slot12 - slot16 / 2)

					if slot3.showDate then
						slot1:get("textDate"):text(slot8.month .. "." .. slot8.day)
						slot1:get("imgSlider1"):show()

						slot4 = slot4 - slot13 + slot11:height() + 100

						slot1:get("textDate"):y(slot4 - 50)
						slot1:get("imgSlider1"):y(slot4 - 50)
					else
						slot1:get("textDate"):hide()
						slot1:get("imgSlider1"):hide()
					end

					if slot3.showTitle then
						slot1:get("imgWeek"):y(slot4 + 10)

						slot4 = slot4 + 60

						slot1:get("imgWeek"):show()

						if slot3.weekType == 1 then
							slot1:get("imgWeek.textNote"):text(gLanguageCsv.lastWeek)
						else
							slot1:get("imgWeek.textNote"):text(gLanguageCsv.thisWeek)
						end
					end

					slot1:height(slot4)
					slot1:get("imgSlider2"):height(slot4)

					if slot0.time < slot5 and slot2 > #slot0.data - 5 then
						slot15 = "imgNew"
						uv15 = "time"
						uv16 = "getDate"
						uv16 = "getDate"

						slot1:get(slot15):y((slot15 - slot16) / 2 + slot12 - slot16 / 2):show()
					end
				end
			},
			handlers = {
				detailClick = bindHelper.self("onDetailClick")
			}
		}
	}
}

function slot1.onCreate(slot0)
	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "CHALLENGE LOG",
		title = gLanguageCsv.gymLogs
	})
	slot0:initData()

	slot0.lastTime = userDefault.getForeverLocalKey("gymLogOpenTime", 0)

	if slot0.preloadCenterIndex then
		dataEasy.tryCallFunc(slot0.recordList, "updatePreloadCenterIndex")
	else
		slot0.preloadBottom = true
	end
end

function slot1.onCleanup(slot0)
	if slot0.recordList:getCenterItemInCurrentView() then
		slot0.preloadCenterIndex = slot0.recordList:getIndex(slot1) + 1
	end

	slot2 = nil
	slot0.preloadBottom = slot2
	uv2 = "recordList"

	slot2.onCleanup(slot0)
end

function slot1.initData(slot0)
	slot3 = slot1.logs or {}
	slot4 = slot1.gym_close_info or {}
	slot5 = slot1.last_gym_close_info or {}

	for slot10, slot11 in pairs(gGameModel.gym:read("record").last_logs or {}) do
		slot12 = table.shallowcopy(slot11)
		slot12.weekType = 1

		table.insert({}, slot12)
	end

	for slot10, slot11 in pairs(slot3) do
		slot12 = table.shallowcopy(slot11)
		slot12.weekType = 2

		table.insert(slot6, table.shallowcopy(slot12))
	end

	slot7 = time.getNumTimestamp(time.getWeekStrInClock(5))
	uv12 = "gGameModel"

	table.insert(slot6, {
		showTitle = true,
		weekType = 1,
		time = slot7 + 18000 - 604800,
		type = slot12.gymReset
	})

	uv13 = "gGameModel"

	table.insert(slot6, {
		showTitle = true,
		weekType = 2,
		time = slot7 + 18000,
		type = slot13.gymReset
	})

	if slot7 - 7200 - 900 < time.getTime() then
		uv14 = "gGameModel"

		table.insert(slot6, {
			weekType = 1,
			time = slot10,
			type = slot14.gymClosed,
			pass_num = slot5.pass_num or 0,
			leader_gym_id = slot5.leader_gym_id,
			cross_leader_gym_id = slot5.cross_leader_gym_id,
			cross_gym_id = slot5.cross_gym_id
		})
	end

	if slot7 + 604800 - 7200 - 900 < time.getTime() then
		uv15 = "gGameModel"

		table.insert(slot6, {
			weekType = 2,
			time = slot11,
			type = slot15.gymClosed,
			pass_num = slot4.pass_num or 0,
			leader_gym_id = slot4.leader_gym_id,
			cross_leader_gym_id = slot4.cross_leader_gym_id,
			cross_gym_id = slot4.cross_gym_id
		})
	end

	table.sort(slot6, function (slot0, slot1)
		if slot0.time == slot1.time then
			return slot0.type < slot1.type
		else
			return slot0.time < slot1.time
		end
	end)

	for slot15, slot16 in ipairs(slot6) do
		if slot15 == 1 then
			slot16.showDate = true
		elseif time.getDate(slot16.time).yday ~= time.getDate(slot6[slot15 - 1].time).yday then
			slot16.showDate = true
		else
			slot16.showDate = false
		end
	end

	slot0.logDatas = idlers.newWithMap(slot6)
end

return slot1
