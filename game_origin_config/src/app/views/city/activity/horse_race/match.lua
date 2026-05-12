slot1 = class("HorseRaceMatch", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "horse_race_match.json"
slot1.RESOURCE_BINDING = {
	["end"] = "ended",
	go = "go",
	ready = "ready",
	name = "panelName",
	lab = "lab",
	times = "times",
	trackBG = "trackBG",
	["times.time"] = "time",
	bet = "bet",
	blank = "blank",
	["lab.rate"] = "rate",
	btn = {
		varname = "btn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSkip")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2, slot3)
	gGameUI.topuiManager:createView("city", slot0):init()

	slot0.rightMarge = {
		300,
		250,
		200,
		150
	}
	slot0.leftMarge = {
		340,
		440,
		540,
		640
	}
	slot0.activityId = slot1
	slot0.select = slot2[2]
	slot0.data = slot2[1]
	slot0.index = slot2[2]
	slot0.cb = slot3

	slot0.time:text(0)

	if slot2[3] then
		slot0.btn:visible(false)
	else
		slot0.btn:visible(true)
	end

	slot4 = {}
	slot5 = {}
	slot6 = {}
	slot7 = {}
	slot8 = {
		"time",
		"sprint_time_slots",
		"csv_id",
		"result"
	}

	for slot13, slot14 in pairs({
		"endTime",
		"crash",
		"player",
		"result"
	}) do
		for slot18, slot19 in pairs(slot0.data) do
			slot20 = csv.cross.horse_race.horse_race_card[slot19.csv_id]
		end

		slot4[slot14] = {
			[slot18] = slot19[slot8[slot13]]
		}
	end

	slot4.distance = csv.cross.horse_race.base[1].distance

	slot0:initRes(slot4)
	slot0:initData(slot4)
	slot0:runAnimation(slot4)
end

function slot1.initData(slot0, slot1)
	slot3 = {
		[slot27] = slot29.stamina
	}
	slot0.ls = {}
	slot4 = 0
	slot5 = {
		0,
		0,
		0,
		0
	}
	slot0.speed = {
		400,
		450,
		300,
		350
	}
	slot6 = slot1.crash
	slot7 = {
		1,
		1,
		4,
		2,
		[slot27] = slot29.sprintMultiple
	}
	slot8 = {
		1,
		1,
		1,
		1
	}
	slot9 = {
		0,
		0,
		0,
		0
	}
	slot10 = {
		0,
		0,
		0,
		0
	}
	slot11 = slot1.distance
	slot12 = {
		slot11,
		slot11,
		slot11,
		slot11
	}
	slot13 = {
		20,
		30,
		10,
		10,
		[slot27] = slot29.staminaCost
	}
	slot14 = {
		10,
		10,
		10,
		10,
		[slot27] = slot29.staminaRecovery
	}
	slot15 = 1
	slot16 = 0
	slot17 = {
		0,
		0,
		0,
		0
	}
	slot18 = 1
	slot19 = 0
	slot20 = slot1.endTime
	slot0.costTime = {
		0,
		0,
		0,
		0
	}
	slot0.tempValue = {
		{},
		{},
		{},
		{}
	}
	slot0.secLen = {
		{},
		{},
		{},
		{}
	}
	slot21 = 600
	slot22 = {
		[slot27] = slot29.stamina
	}
	slot23 = {
		1,
		1,
		1,
		1
	}
	slot0.weak = {
		{},
		{},
		{},
		{}
	}

	for slot27, slot28 in pairs(slot1.player) do
		slot0.speed[slot27] = csv.cross.horse_race.horse_race_card[slot28].speed / 10
	end

	slot28 = slot20[3]
	slot0.maxTimes = math.ceil(math.max(slot20[1], slot20[2], slot28, slot20[4]))

	function slot24()
		slot0 = 1
		uv3 = "pairs"

		for slot5, slot6 in pairs(slot3) do
			if 0 < slot6 then
				slot1 = slot6
				slot0 = slot5
			end
		end

		return slot0
	end

	for slot28 = 1, slot0.maxTimes + 1 do
		for slot32 = 1, 4 do
			slot33 = 0

			if slot3[slot32] < slot22[slot32] * 0.5 and slot3[slot32] > 0 then
				slot33 = -csv.cross.horse_race.base[1].sMultiple2

				table.insert(slot0.weak[slot32], slot28)
			elseif slot3[slot32] <= 0 then
				slot33 = -csv.cross.horse_race.base[1].sMultiple1

				table.insert(slot0.weak[slot32], slot28)
			end

			for slot37, slot38 in pairs(slot6[slot32] or {}) do
				if slot38 == slot28 then
					slot9[slot32] = slot8[slot32]

					break
				end
			end

			slot34 = 0
			slot34 = slot21 <= slot28 and 500 or slot0.speed[slot32] * ((slot9[slot32] > 0 and slot7[slot32] or 0) + 1 + slot33)
			slot5[slot32] = slot34

			if slot11 <= slot10[slot32] + slot34 then
				slot0.costTime[slot32] = slot0.costTime[slot32] + (slot11 - slot10[slot32]) / slot34
				slot10[slot32] = slot11
				slot0.secLen[slot32][slot28] = slot11 - (slot10[slot32 - 1] or 0)
			else
				slot0.costTime[slot32] = slot0.costTime[slot32] + 1
				slot10[slot32] = slot10[slot32] + slot34
				slot0.secLen[slot32][slot28] = slot34
			end

			slot9[slot32] = slot9[slot32] - 1
			slot12[slot32] = slot12[slot32] - slot0.speed[slot32]

			if slot17[slot32] == 0 then
				slot3[slot32] = math.max(slot3[slot32] - slot13[slot32], 0)
			else
				slot3[slot32] = math.min(slot3[slot32] + slot14[slot32], slot22[slot32])
			end

			if slot3[slot32] == slot22[slot32] then
				slot17[slot32] = 0
			end

			if slot3[slot32] == 0 then
				slot17[slot32] = 1
			end

			slot0.tempValue[slot32][slot28] = slot10[slot32] * slot18
		end

		for slot32 = 1, 4 do
			if slot0.leftMarge[slot32] + slot10[slot32] * slot18 >= display.size.width * 0.618 then
				slot16 = 1
			end
		end

		if slot24() ~= slot15 then
			slot15 = slot29
		end

		if (slot10[slot15] * slot18 >= display.size.width * 0.5 and 1 or 0) == 1 then
			if slot0.maxBg:size().width - display.size.width - 600 >= slot10[slot15] * slot18 - display.size.width * 0.5 then
				slot33 = (slot0.secLen[slot15][slot28] + (slot0.secLen[slot15][slot28 + 1] or slot0.secLen[slot15][slot28])) / 2 * 0.4 + (slot0.secLen[slot15][slot28] + (slot0.secLen[slot15][slot28 - 1] or 0)) / 2 * 0.4 + slot0.secLen[slot15][slot28] * 0.2 + (slot0.ls[slot28 - 1] or 0)
				slot0.ls[slot28] = slot10[slot15] * slot18 - display.size.width * 0.5
			else
				slot0.ls[slot28] = slot32
			end
		end
	end
end

function slot1.runAnimation(slot0, slot1)
	slot2 = slot0.maxTimes
	slot3 = 1
	slot4 = slot0.obj
	slot5 = {
		0,
		0,
		0,
		0
	}
	slot6 = {
		0,
		0,
		0,
		0
	}

	slot0.go:runAction(cc.Sequence:create(cc.CallFunc:create(function ()
		uv0 = "ready"

		slot0.ready:setVisible(true)
	end), cc.DelayTime:create(1), cc.CallFunc:create(function ()
		uv0 = "ready"
		slot0 = slot0.ready
		slot0 = slot0.setVisible

		slot0(slot0, false)

		uv0 = "ready"

		slot0.go:setVisible(true)
	end), cc.DelayTime:create(1), cc.CallFunc:create(function ()
		uv0 = "go"

		slot0.go:setVisible(false)
	end)))
	slot0:enableSchedule():schedule(function (slot0)
		uv1 = "time"
		slot1 = slot1.time
		slot1 = slot1.text
		uv5 = "time"
		uv6 = "text"

		slot1(slot1, math.floor(math.min(slot5.maxTimes, slot6 - 1) / 10))

		uv1 = "math"

		if slot1 <= -2 then
			uv1 = "time"

			slot1.ended:setVisible(true)
		end

		uv1 = "math"
		uv2 = 10
		uv1 = "math"

		if slot1 - 1 > -2 then
			uv2 = "floor"

			for slot4, slot5 in pairs(slot2) do
				uv6 = "min"

				if slot6[slot4] == 0 then
					uv6 = "time"
					slot6 = slot6.animation[slot4]
					slot6 = slot6.play

					slot6(slot6, "run_loop")

					uv6 = "min"
					slot6[slot4] = 1
				end

				uv7 = "time"
				slot7 = slot7.costTime[slot4]
				uv7 = "text"

				if math.ceil(slot7) - slot7 >= 0 then
					slot9 = slot5
					slot8 = slot5.runAction
					slot10 = cc.Sequence
					slot11 = slot10
					slot10 = slot10.create
					slot12 = cc.MoveTo
					slot13 = slot12
					slot12 = slot12.create
					uv14 = "time"
					uv15 = "text"

					if slot14.costTime[slot4] - slot15 >= 0 then
						slot14 = 1
					else
						uv14 = "time"
						uv15 = "text"
						slot14 = slot14.costTime[slot4] - slot15 + 1
					end

					uv16 = "time"
					uv17 = "text"
					uv17 = "time"

					slot8(slot9, slot10(slot11, slot12(slot13, slot14 / 10, cc.p(slot16.tempValue[slot4][slot17] + slot17.leftMarge[slot4], slot5:y()))))

					uv8 = "time"
					slot8 = slot8.icon[slot4]
					slot8 = slot8.runAction
					slot10 = cc.Sequence
					slot11 = slot10
					slot12 = cc.MoveTo
					slot12 = slot12.create
					uv16 = "time"
					uv17 = "text"
					uv17 = "maxTimes"
					slot17 = 670 / slot17.distance
					uv17 = "time"

					slot8(slot8, slot10.create(slot11, slot12(slot12, (slot7 > 0 and 1 or slot7 + 1) / 10, cc.p(83 + slot16.tempValue[slot4][slot17] * slot17, slot17.icon[slot4]:y()))))

					uv8 = "time"
					slot8 = slot8.animation[slot4]
					slot9 = slot8
					slot8 = slot8.setTimeScale
					uv11 = "time"
					uv12 = "text"
					uv12 = "time"

					slot8(slot9, math.min(slot11.secLen[slot4][slot12] / slot12.speed[slot4], 4))

					uv8 = "text"
					uv9 = "time"

					if slot8 < slot9.maxTimes + 2 then
						uv9 = "maxTimes"
						slot9 = slot9.crash[slot4] or {}

						for slot11, slot12 in pairs(slot9) do
							uv13 = "text"

							if slot12 == slot13 then
								uv13 = "time"

								slot13.sprint[slot4]:setVisible(true)

								break
							else
								uv13 = "time"

								slot13.sprint[slot4]:setVisible(false)
							end
						end

						uv9 = "time"

						for slot11, slot12 in pairs(slot9.weak[slot4]) do
							uv13 = "text"

							if slot12 == slot13 then
								uv13 = "time"

								slot13.weakness[slot4]:setVisible(true)

								break
							else
								uv13 = "time"

								slot13.weakness[slot4]:setVisible(false)
							end
						end
					end
				end
			end

			uv1 = "time"
			slot1 = slot1.maxBg
			slot1 = slot1.runAction
			uv9 = "time"
			slot9 = slot9.maxBg
			slot10 = slot9
			uv10 = "time"
			uv11 = "text"
			slot10 = slot10.ls[slot11] or 0
			slot9 = slot9.size(slot10).width / 2 - slot10
			uv10 = "time"
			slot10 = slot10.maxBg
			slot11 = slot10

			slot1(slot1, cc.Sequence:create(cc.MoveTo:create(0.1, cc.p(slot9, slot10.y(slot11)))))

			uv1 = "time"
			slot1 = slot1.treeBg
			slot1 = slot1.runAction
			uv9 = "time"
			slot9 = slot9.montBg
			slot10 = slot9
			uv10 = "time"
			uv11 = "text"
			slot10 = (slot10.ls[slot11] or 0) * 0.8
			slot9 = slot9.size(slot10).width / 2 - slot10
			uv10 = "time"
			slot10 = slot10.treeBg
			slot11 = slot10

			slot1(slot1, cc.Sequence:create(cc.MoveTo:create(0.1, cc.p(slot9, slot10.y(slot11)))))

			uv1 = "time"
			slot1 = slot1.montBg
			slot1 = slot1.runAction
			uv9 = "time"
			slot9 = slot9.montBg
			slot10 = slot9
			uv10 = "time"
			uv11 = "text"
			slot10 = (slot10.ls[slot11] or 0) * 0.6
			slot9 = slot9.size(slot10).width / 2 - slot10
			uv10 = "time"
			slot10 = slot10.montBg
			slot11 = slot10

			slot1(slot1, cc.Sequence:create(cc.MoveTo:create(0.1, cc.p(slot9, slot10.y(slot11)))))

			uv1 = "time"
			uv9 = "time"
			slot9 = slot9.could
			slot10 = slot9
			uv10 = "time"
			uv11 = "text"
			slot10 = (slot10.ls[slot11] or 0) * 0.4
			uv10 = "time"

			slot1.could:runAction(cc.Sequence:create(cc.MoveTo:create(0.1, cc.p(slot9.size(slot10).width / 2 - slot10, slot10.could:y()))))
		end

		uv1 = "text"
		slot1 = slot1 + 1
		uv1 = 10
	end, 0.1, 2, "delayTime")

	slot7 = {
		1,
		1,
		1,
		1
	}

	function slot8()
		uv1 = "pairs"

		for slot3, slot4 in pairs(slot1) do
			for slot9 = 1, 4 do
				if slot9 ~= slot3 then
					uv10 = "pairs"
					slot10 = slot10[slot9]
					slot11 = slot10
					uv11 = "x"
					slot12 = slot4
					uv12 = "x"

					if slot10.x(slot11) - slot11.leftMarge[slot9] > slot4.x(slot12) - slot12.leftMarge[slot3] then
						slot5 = 1 + 1
					end
				end
			end

			uv6 = "leftMarge"
			slot6[slot3] = slot5
		end
	end

	slot9 = 0
	slot10 = {
		0,
		0,
		0,
		0
	}

	slot0:enableSchedule():schedule(function (slot0)
		uv2 = "pairs"

		for slot4, slot5 in pairs(slot2) do
			uv6 = "x"
			uv7 = "x"
			slot6[slot4] = slot7[slot4] - 1
			slot7 = slot5
			uv7 = "distance"
			uv8 = "leftMarge"

			if slot5.x(slot7) >= slot7.distance + slot8.leftMarge[slot4] - 10 then
				slot5:get("name"):visible(true)
			else
				uv6 = "x"

				if slot6[slot4] < 0 then
					slot6 = slot5:get("name"):setVisible(false)

					slot6:get("tip"):visible(false)
					slot6:get("beyond"):visible(true)
				end
			end

			slot7 = slot5
			uv7 = "distance"
			uv8 = "leftMarge"

			if slot5.x(slot7) >= slot7.distance + slot8.leftMarge[slot4] - 10 then
				uv6 = "get"

				if slot6[slot4] == 0 then
					slot6 = slot5:get("name")
					slot7 = slot6
					slot6 = slot6.setVisible(slot7, true)
					uv7 = "leftMarge"
					slot7 = slot7.sprint[slot4]
					slot7 = slot7.setVisible

					slot7(slot7, false)

					uv7 = "leftMarge"

					slot7.weakness[slot4]:setVisible(false)
					slot6:get("tip"):visible(true)
					slot6:get("beyond"):visible(false)

					slot7 = slot6:get("tip"):get("rank")
					slot7 = slot7.text
					uv11 = "distance"

					slot7(slot7, string.format(gLanguageCsv.horseRaceRecordRank, slot11.result[slot4]))

					uv7 = "leftMarge"
					slot7 = slot7.animation[slot4]
					slot7 = slot7.play

					slot7(slot7, "win_loop")

					uv7 = "leftMarge"
					slot7 = slot7.animation[slot4]
					slot7 = slot7.setTimeScale

					slot7(slot7, 1)

					uv7 = "get"
					slot7[slot4] = 1
				end
			end
		end

		uv2 = "pairs"

		for slot4, slot5 in pairs(slot2) do
			uv7 = "pairs"

			for slot9, slot10 in pairs(slot7) do
				if slot9 ~= slot4 then
					slot12 = slot10
					uv12 = "leftMarge"
					slot13 = slot5
					uv13 = "leftMarge"

					if slot10.x(slot12) - slot12.leftMarge[slot9] < slot5.x(slot13) - slot13.leftMarge[slot4] + 10 then
						uv11 = "name"
						uv12 = "name"

						if slot12[slot9] < slot11[slot4] then
							uv11 = "visible"

							if slot11 > 30 then
								uv11 = "get"

								if slot11[slot4] == 0 then
									slot11 = slot5:get("name")
									slot11 = slot11.setVisible

									slot11(slot11, true)

									uv11 = "x"

									if slot11[slot4] < 0 then
										transition.executeSequence(slot5:get("name"):get("beyond")):fadeTo(0, 255):easeBegin("SINEOUT"):fadeTo(1, 0):easeEnd():done()
									end

									uv11 = "x"
									slot11[slot4] = 10
								end
							end
						end
					end
				end
			end
		end

		uv1 = "setVisible"

		slot1()

		uv1 = "visible"
		slot1 = slot1 + 1
		uv6 = 10
	end, 0.1, 2, "places")
	performWithDelay(slot0, function ()
		uv0 = "unScheduleAll"
		slot0 = slot0.unScheduleAll

		slot0(slot0)

		uv0 = "unScheduleAll"

		slot0:onSkip()
	end, math.ceil(slot0.maxTimes / 10) + 4)
end

function slot1.initRes(slot0, slot1)
	slot2 = slot1.distance + 784 + 778
	slot0.node = slot0.trackBG:getParent()
	slot0.maxBg = ccui.Layout:create():size(slot2, 720):anchorPoint(0.5, 0.5):xy(slot2 / 2, 735):addTo(slot0.node, 5, "maxBg")
	slot0.bg2 = cc.Sprite:create("activity/horse_race/qidian.png"):setScale(2):anchorPoint(0.5, 0.5):xy(592, 346):addTo(slot0.maxBg, 5, "bg2")
	slot0.bg1 = cc.Sprite:create("activity/horse_race/paodao_04.png"):setScaleY(2):setScaleX(slot1.distance - 1000):anchorPoint(0.5, 0.5):xy(slot2 / 2 - 150, 105):addTo(slot0.maxBg, 5, "bg1")
	slot0.bg3 = cc.Sprite:create("activity/horse_race/zhongdian.png"):setScale(2):anchorPoint(0.5, 0.5):xy(slot1.distance + 655, 346):addTo(slot0.maxBg, 5, "bg3")
	slot0.bg4 = cc.Sprite:create("activity/horse_race/dimian_03.png"):setScaleY(2):setScaleX(2):anchorPoint(0.5, 0.5):xy(0, 103):addTo(slot0.maxBg, 3, "bg4")
	slot0.treeBg = ccui.Layout:create():size(slot2, 720):anchorPoint(0.5, 0.5):xy(slot2 / 2, 1334):addTo(slot0.node, 4, "treeBg")
	slot3 = 0
	slot4 = 0

	while slot3 <= slot2 + 1560 do
		cc.Sprite:create("activity/horse_race/dimian_03.png"):setScaleY(2):setScaleX(2):anchorPoint(0.5, 0.5):xy(slot4 * 1560 * 2 - 50, 103):addTo(slot0.maxBg, 3, "bg4")

		slot4 = slot4 + 1
		slot3 = slot3 + 3120 - 50
	end

	slot3 = 0

	while slot2 >= slot3 do
		slot6 = math.random(500, 1000)
		slot7 = math.random(4)
		slot8 = math.random(5, 30)

		if math.random(1, 5) > 3 then
			cc.Sprite:create("activity/horse_race/shu_0" .. slot7 .. ".png"):setScale(2):anchorPoint(0.5, 0.5):xy(0 + slot3, 230):addTo(slot0.treeBg, 5, "shu" .. slot3)
		end

		cc.Sprite:create("activity/horse_race/caocong_0" .. slot7 .. ".png"):setScale(2):anchorPoint(0.5, 0.5):xy(0 + slot3, 0 + slot8):addTo(slot0.treeBg, 5, "cao" .. slot3)

		slot3 = slot3 + slot6
	end

	slot0.montBg = ccui.Layout:create():size(slot2, 720):anchorPoint(0.5, 0.5):xy(slot2 / 2, 1440):addTo(slot0.node, 3, "montBg")
	slot3 = 0
	slot5 = {
		10,
		50,
		-25,
		65,
		110
	}

	while slot3 <= slot2 do
		slot7 = math.random(5)

		cc.Sprite:create("activity/horse_race/shan_0" .. slot7 .. ".png"):setScale(2):anchorPoint(0.5, 0.5):xy(0 + slot3, slot5[slot7]):addTo(slot0.montBg, 5, "shan" .. slot3)

		slot3 = slot3 + math.random(1200, 1600)
	end

	slot0.could = ccui.Layout:create():size(slot2, 720):anchorPoint(0.5, 0.5):xy(slot2 / 2, 1750):addTo(slot0.node, 2, "could")
	slot3 = 0

	while slot2 >= slot3 do
		cc.Sprite:create("activity/horse_race/yun_0" .. math.random(2) .. ".png"):setScale(2):anchorPoint(0.5, 0.5):xy(0 + slot3, 0):addTo(slot0.could, 5, "shan" .. slot3)

		slot3 = slot3 + math.random(1200, 1600)
	end

	slot0.icon = {}
	slot0.obj = {}
	slot0.animation = {}
	slot0.weakness = {}
	slot0.sprint = {}
	slot6 = {
		"standby_loop",
		"attack",
		"win_loop",
		"run_loop"
	}

	for slot10, slot11 in pairs(slot1.player) do
		slot12 = ccui.Layout:create():size(500, 800):xy(slot0.leftMarge[slot10], 50 + slot10 * 200 - 400):anchorPoint(0.5, 0.5):setScale(1):addTo(slot0.maxBg, 20 - slot10, "play" .. slot10)
		slot13 = slot0.blank:clone():addTo(slot12, 25):xy(0, 100):setVisible(false):alignCenter(slot12:size())

		widget.addAnimationByKey(slot13, "effect/saipao.skel", "sprint", "chongci_loop", 5):setScale(1.2):anchorPoint(cc.p(0.5, 0.5)):alignCenter(cc.size(slot13:size().width + 50, slot13:size().height - 100))

		slot14 = slot0.blank:clone():addTo(slot12, 25):xy(0, 100):setVisible(false):alignCenter(slot12:size())

		widget.addAnimationByKey(slot14, "effect/saipao.skel", "weak", "xuruo_loop", 5):setScale(2):anchorPoint(cc.p(0.5, 0.5)):alignCenter(cc.size(slot14:size().width - 0, slot14:size().height - 100))
		text.addEffect(slot0.panelName:clone():addTo(slot12, 20):xy(300, 680):setVisible(false):anchorPoint(cc.p(0.5, 0.5)):get("tip"):get("rank"), {
			outline = {
				size = 4,
				color = cc.c4b(218, 105, 64, 255)
			}
		})

		slot16 = csv.cross.horse_race.horse_race_card[slot11]

		widget.addAnimation(slot12, csv.unit[slot16.unitID].unitRes, "standby_loop", 5):anchorPoint(cc.p(0.5, 0.5)):alignCenter(slot12:size()):setScale(2):setSkin(csv.unit[slot16.unitID].skin)

		slot18 = nil
		slot19 = {
			-145,
			75,
			275,
			455
		}

		if slot10 == slot0.select then
			slot0.bet:clone():addTo(slot0.maxBg, 20 - slot10):xy(592 + slot0.leftMarge[slot10] - 500, slot19[slot10])
			slot0.bet:clone():addTo(slot0.maxBg, 20 - slot10):xy(slot1.distance + slot0.leftMarge[slot10] - 420, slot19[slot10])
			cc.Sprite:create(csv.unit[slot16.unitID].icon):setScale(1):anchorPoint(0.5, 0.5):xy(60, 80):addTo(cc.Sprite:create("activity/horse_race/icon_horserace_select.png"):setScale(1):anchorPoint(0.5, 0.5):xy(83, 135):addTo(slot0.lab, 3, "icon" .. slot10), 3, "icons" .. slot10)
		else
			cc.Sprite:create(csv.unit[slot16.unitID].icon):setScale(1):anchorPoint(0.5, 0.5):xy(55, 65):addTo(cc.Sprite:create("activity/horse_race/icon_horserace_normal.png"):setScale(1):anchorPoint(0.5, 0.5):xy(83, 135):addTo(slot0.lab, 3, "icon" .. slot10), 3, "icons" .. slot10)
		end

		table.insert(slot0.obj, slot12)
		table.insert(slot0.animation, slot17)
		table.insert(slot0.icon, slot18)
		table.insert(slot0.weakness, slot14)
		table.insert(slot0.sprint, slot13)
	end
end

function slot1.onSkip(slot0)
	uv4 = "activityId"

	slot4.onClose(slot0)
	gGameUI:stackUI("city.activity.horse_race.end", nil, , slot0.activityId, {
		slot0.data,
		slot0.index
	})
end

function slot1.onClose(slot0)
	uv1 = "onClose"

	slot1.onClose(slot0)
end

return slot1
