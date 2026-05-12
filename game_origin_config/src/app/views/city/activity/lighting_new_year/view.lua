slot0 = {
	{
		1270,
		550
	},
	{
		1825,
		350
	},
	{
		1825,
		950
	},
	{
		740,
		420
	},
	{
		1955,
		800
	},
	{
		930,
		800
	},
	{
		450,
		450
	},
	{
		1650,
		450
	},
	{
		2200,
		950
	},
	{
		950,
		400
	},
	{
		800,
		620
	},
	{
		2055,
		600
	},
	{
		550,
		750
	},
	{
		2200,
		600
	},
	{
		740,
		770
	},
	{
		440,
		1000
	}
}
slot2 = class("ActivityLightingNewYearDialog", cc.load("mvc").ViewBase)
slot2.RESOURCE_FILENAME = "lighting_new_year.json"
slot2.RESOURCE_BINDING = {
	number = "number",
	title = "title",
	animaPanel = "animaPanel",
	closeBg = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	openBtn = {
		varname = "openBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("openAnswer")
			}
		}
	},
	rule = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRules")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	slot0.activityId = slot1
	slot0.huodongID = csv.yunying.yyhuodong[slot0.activityId].huodongID

	slot0:ctorAnimaCfg()
	slot0:initModel()
	slot0:retroactiveDays()
	slot0:initData()
	slot0:setParticle()
	slot0:setLanternAnima()
	slot0:setTimeLabel()
	text.addEffect(slot0.number, {
		outline = {
			size = 4,
			color = ui.COLORS.QUALITY_OUTLINE[1]
		}
	})
end

function slot2.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
end

function slot2.ctorAnimaCfg(slot0)
	slot1 = {}

	for slot5, slot6 in orderCsvPairs(csv.yunying.lighting_new_year) do
		if slot0.huodongID == slot6.huodongID and not slot1[slot6.day] then
			slot1[slot6.day] = slot6
		end
	end

	slot0.animaCfg = slot1
end

function slot2.retroactiveDays(slot0)
	for slot6 = 1, slot0.yyhuodongs:read()[slot0.activityId].info.days do
		if slot1.stamps[slot6] ~= 1 then
			slot2 = 0 + 1
		end
	end

	slot0.number:text(string.format(gLanguageCsv.lightingNewYearNumber, slot2))
	uiEasy.setBtnShader(slot0.openBtn, false, slot2 == 0 and 2 or 1)
end

function slot2.initData(slot0)
	slot0.openCsvId = dataEasy.getLightingNewYearCsvId(slot0.activityId)

	slot0.openBtn:get("title"):text((csv.yunying.lighting_new_year[slot0.openCsvId] or slot0.animaCfg[slot0.yyhuodongs:read()[slot0.activityId].info.days]).name .. gLanguageCsv.lightingNewYearLanternRiddles)
end

function slot2.setParticle(slot0)
	if slot0.openCsvId and slot0.openCsvId ~= 0 then
		slot1 = csv.yunying.lighting_new_year[slot0.openCsvId].day

		if slot0.animaPanel:get("daitiaozhan") then
			slot0.animaPanel:get("daitiaozhan"):play("lizi_loop")

			slot4 = "daitiaozhan"
			uv4 = "openCsvId"
			uv5 = "openCsvId"

			slot0.animaPanel:get(slot4):xy(slot4[slot1][1], slot5[slot1][2])
		else
			slot4 = "xinchundenglong/xinchundenglong.skel"
			slot5 = "daitiaozhan"
			uv4 = "openCsvId"
			uv5 = "openCsvId"

			widget.addAnimationByKey(slot0.animaPanel, slot4, slot5, "lizi_loop", 20):xy(slot4[slot1][1], slot5[slot1][2])
		end
	end
end

function slot2.setLanternAnima(slot0)
	slot2 = "anima"

	for slot6, slot7 in ipairs(slot0.animaCfg) do
		slot8 = slot7.spine1

		if slot0.yyhuodongs:read()[slot0.activityId].stamps[slot6] == 1 then
			slot8 = slot7.spine2
		end

		slot9 = 0
		slot10 = 0

		if slot7.day == 16 then
			slot10 = -100
			slot9 = -200
		end

		widget.addAnimationByKey(slot0.animaPanel, "xinchundenglong/xinchundenglong.skel", slot2 .. slot6, slot8, slot7.zOrder):xy(1270 + slot9, 350 + slot10):scale(1.3)
	end

	widget.addAnimationByKey(slot0.animaPanel, "xinchundenglong/xinchundenglong.skel", "bg", "beijing_loop", 0):xy(1270, 350):scale(1.3)
	widget.addAnimationByKey(slot0.animaPanel, "xinchundenglong/hhb.skel", "role", "hhb_standby_loop", 30):xy(2400, 250)
end

function slot2.setTimeLabel(slot0)
	slot2, slot3 = time.getActivityOpenDate(slot0.activityId)
	slot4 = time.getDate(slot3)
	slot5 = time.getDate(gGameModel.role:read("yy_endtime")[slot0.activityId])

	slot0.title:get("time"):text(gLanguageCsv.activityTime .. string.format("%s-%s", string.format("%d.%02d.%02d", slot4.year, slot4.month, slot4.day), string.format("%d.%02d.%02d", slot5.year, slot5.month, slot5.day)))
end

function slot2.openAnswer(slot0)
	slot0.openBtn:hide()
	slot0.number:hide()
	gGameUI:stackUI("city.activity.lighting_new_year.answer", nil, , {
		huodongId = slot0.activityId,
		csvId = slot0.openCsvId
	}, slot0:createHandler("setlightingAnima"))
end

function slot2.setlightingAnima(slot0, slot1)
	slot0.openBtn:show()
	slot0.number:show()

	if not slot1 then
		return
	end

	slot0:retroactiveDays()
	slot0:initData()

	slot2 = slot0.animaPanel:get("role")

	slot2:play("hhb_standby_loop")
	slot2:xy(2400, 250)
	slot2:stopAllActions()

	slot3 = csv.yunying.lighting_new_year[slot1]
	slot6 = slot3.actionAnima
	slot7 = slot3.scaleTab
	slot8 = slot3.spine2

	transition.executeSequence(slot2):func(function ()
		uv0 = "scaleX"
		slot0 = slot0.scaleX

		slot0(slot0, 1)

		uv0 = "scaleX"

		slot0:play("hhb_run_loop")
	end):moveBy(slot3.timeData, -slot3.actionPos, 0):func(function ()
		uv0 = "scaleX"
		slot0 = slot0.scaleX
		uv2 = "play"

		slot0(slot0, slot2)

		uv0 = "scaleX"
		slot1 = slot0
		uv2 = "performWithDelay"

		slot0.play(slot1, slot2)

		uv1 = "scaleX"

		performWithDelay(slot1, function ()
			uv0 = "animaPanel"

			if slot0.animaPanel:get("daitiaozhan") then
				uv0 = "animaPanel"

				slot0.animaPanel:get("daitiaozhan"):play("lizi")
			end

			uv0 = "animaPanel"
			uv3 = "get"

			if slot0.animaPanel:get("anima" .. slot3.day) then
				uv0 = "animaPanel"
				uv3 = "get"
				slot2 = "anima" .. slot3.day
				uv2 = "daitiaozhan"

				slot0.animaPanel:get(slot2):play(slot2)
			end

			uv0 = "play"
			slot0 = slot0.play

			slot0(slot0, "hhb_run_loop")

			uv0 = "play"
			slot1 = slot0
			slot2 = -1

			slot0.scaleX(slot1, slot2)

			uv1 = "play"
			uv2 = "lizi"
			uv3 = "anima"

			transition.executeSequence(slot1):moveBy(slot2, slot3, 0):func(function ()
				uv0 = "play"
				slot0 = slot0.play

				slot0(slot0, "hhb_standby_loop")

				uv0 = "play"
				slot0 = slot0.scaleX

				slot0(slot0, 1)

				uv0 = "hhb_standby_loop"

				slot0:setParticle()
			end):done()
		end, 1.2)
	end):done()
end

function slot2.onRules(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"))
end

function slot2.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.spaceRule)
		end),
		slot2.noteText(126201, 126220)
	}
end

return slot2
