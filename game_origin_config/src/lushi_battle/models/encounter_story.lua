slot0 = class("AutoChessEncounterStory")
AutoChessBattle.AutoChessEncounterStory = slot0

function slot0.ctor(slot0, slot1, slot2)
	slot0.id = slot1
	slot0.scene = slot2
	slot0.choice = nil
	slot0.secondDesc = nil
	slot0.secondConfirm = false
end

function slot0.init(slot0, slot1)
	slot2 = csv.auto_chess.encounter[slot0.id]
	slot3 = slot2.story[ymrand.random(1, table.length(slot2.story))]
	slot0.sid = slot3
	slot0._cfg = csvClone(csv.auto_chess.story[slot3])
	slot0.storyIndex = slot1
end

function slot0.viewData(slot0)
	slot1 = csv.auto_chess.encounter[slot0.id]
	slot2 = {}

	for slot6 = 1, 4 do
		if slot0._cfg[string.format("choiceDesc%d", slot6)] == "" or slot0._cfg[slot7] == nil then
			break
		end

		slot2[slot6] = slot0._cfg[slot7]
	end

	return AutoChessEasy.getEncounterViewData(slot0, slot1, {
		desc = slot0.secondDesc or slot0._cfg.desc,
		type = lushi.EncounterType.story,
		optionDescs = AutoChessEasy.ifElse(slot0.secondDesc, {}, slot2),
		optionState = AutoChessEasy.ifElse(slot0.secondDesc, {}, slot0:getOptionState())
	})
end

function slot0.isJump(slot0)
	return slot0._cfg.choiceDesc1 == nil or slot1 == ""
end

function slot0.canConfirm(slot0, slot1)
	if slot0.secondDesc then
		return true
	end

	if not (slot0:isJump() or slot1 ~= nil) then
		gRootViewProxy:proxy():showTip(gLanguageCsv.autoChessSelectFirst)
	end

	if slot1 and slot0:checkOption(slot1) ~= 1 then
		slot2 = false
	end

	return slot2
end

function slot0.confirm(slot0, slot1)
	if slot0.secondDesc then
		slot0.secondConfirm = true

		return
	end

	if slot0.choice then
		return
	end

	slot0.choice = slot1

	if slot1 then
		slot2 = slot0.scene.trainer[1]

		if slot0._cfg["choice" .. slot0.choice .. "After"] and slot3 ~= "" then
			slot0.secondDesc = slot3
		end

		if slot0._cfg["choice" .. slot1].case.card then
			AutoChessEasy.gainHandObj(AutoChessCsv.doFormula(slot4.card, {
				scene = AutoChessCsv.CsvScene.new(slot0.scene),
				trainer = AutoChessCsv.CsvTrainer.new(slot2)
			}), slot0.scene)
		end

		if slot4[lushi.ShopGoldKey] then
			if slot4[lushi.ShopGoldKey] > 0 then
				slot0.scene:gainGold(slot4[lushi.ShopGoldKey])
			else
				slot0.scene:useGold(-slot4[lushi.ShopGoldKey])
			end
		end

		if slot4.trainerHp then
			if slot4.trainerHp > 0 then
				slot0.scene.trainer[1]:resumeHp(slot4.trainerHp)
			elseif slot4.trainerHp < 0 then
				slot0.scene.trainer[1]:beAttack(-slot4.trainerHp)
			end
		end

		if slot4.specialScore then
			slot0.scene:addTrackingData(lushi.TrackingEvents.SpecialScore, slot4.specialScore)
		end

		if slot4.insertEncounter then
			for slot8, slot9 in ipairs(slot4.insertEncounter) do
				slot0.scene.encounter.data:insertEncounter(slot9[1], slot9[2])
			end
		end

		if slot4.trainerBuff then
			for slot8, slot9 in ipairs(slot4.trainerBuff) do
				slot11 = AutoChessBattle.addBuffToHero(slot9, slot2, slot2, {
					value = 0
				})
			end
		end
	end
end

function slot0.confirmView(slot0)
	if slot0.secondDesc and not slot0.secondConfirm then
		AutoChessEasy.queueEffect(function ()
			uv3 = "gRootViewProxy"

			gRootViewProxy:notify("refreshEncounter", slot3:viewData())
		end)

		return
	end

	if slot0._cfg.onceEffectResPath and slot1 ~= "" then
		AutoChessEasy.queueEffect("changeChapter", {
			resPath = slot1,
			aniName = slot0._cfg.onceEffectAniName,
			pos = slot0._cfg.onceEffectOffsetPos
		})
	end
end

function slot0.isOver(slot0)
	if slot0.secondDesc then
		return slot0.secondConfirm
	end

	return slot0:isJump() or slot0.choice ~= nil
end

function slot0.complete(slot0)
	if slot0.choice and slot0._cfg["choice" .. slot0.choice].case.encounter then
		slot0.nextEncounterID = slot1.encounter
	end

	slot0._cfg = nil
	slot0.scene = nil
end

function slot0.getOptionState(slot0)
	slot1 = {}

	for slot5 = 1, 4 do
		if slot0._cfg[string.format("choiceDesc%d", slot5)] == "" or slot0._cfg[slot6] == nil then
			break
		end

		slot1[slot5] = slot0:checkOption(slot5)
	end

	return slot1
end

function slot0.checkOption(slot0, slot1)
	slot4 = slot0._cfg["choice" .. slot1].showCondition or {}
	slot5 = 1

	for slot10, slot11 in ipairs(slot0._cfg["choice" .. slot1].condition or {}) do
		slot6 = true and AutoChessCsv.doFormula(slot11, {
			scene = AutoChessCsv.CsvScene.new(slot0.scene),
			trainer = AutoChessCsv.CsvTrainer.new(slot0.scene.trainer[1])
		})
	end

	if not slot6 then
		slot5 = 0
	end

	for slot10, slot11 in ipairs(slot4) do
		slot6 = true and AutoChessCsv.doFormula(slot11, slot2)
	end

	if not slot6 then
		slot5 = 2
	end

	return slot5
end

function slot0.update(slot0)
	slot1 = slot0:getOptionState()

	AutoChessEasy.queueEffect(function ()
		uv3 = "gRootViewProxy"
		uv4 = "notify"

		gRootViewProxy:notify("updateStory", slot3.storyIndex, slot4)
	end)
end

function slot0.onIndexChange(slot0, slot1)
	slot0.storyIndex = slot1
end

function slot0.refreshCsv(slot0)
	slot0._cfg = csvClone(csv.auto_chess.story[slot0.sid])
end

return slot0
