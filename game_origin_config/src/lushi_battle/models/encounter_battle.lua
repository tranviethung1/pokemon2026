slot0 = class("AutoChessEncounterBattle")
AutoChessBattle.AutoChessEncounterBattle = slot0

function slot0.ctor(slot0, slot1, slot2)
	slot0.id = slot1
	slot0.scene = slot2
	slot0.result = "unkown"
	slot0.fakeObjs = {}
	slot0.hasHide = false
end

function slot0.init(slot0)
	slot2, slot3, slot4 = nil

	if slot0.scene:isGuide() then
		slot4 = csv.auto_chess.monster[csv.auto_chess.encounter[slot0.id].monster[1]].trainerSkill[1]
	elseif table.length(csv.auto_chess.monster[slot1.monster[ymrand.random(1, table.length(slot1.monster))]].trainerSkill) > 0 then
		slot4 = slot2.trainerSkill[ymrand.random(1, table.length(slot2.trainerSkill))]
	end

	slot0.sid = slot3
	slot0.trainerSkill = slot4
	slot0._cfg = csvClone(slot2)
	slot0.monsters = {}

	for slot8, slot9 in ipairs(slot0._cfg.monsters) do
		slot10, slot11 = AutoChessEasy.getRoleDataFromMonsterFix(slot9, slot0.scene:isGuide())
		slot0.monsters[slot8] = {
			slot10,
			slot11
		}
	end

	if slot0._cfg.awardWin.card then
		slot0._cfg.awardWin.card = AutoChessCsv.doFormula(slot0._cfg.awardWin.card, {
			scene = AutoChessCsv.CsvScene.new(slot0.scene)
		})
	end

	if slot0._cfg.awardFail.card then
		slot0._cfg.awardFail.card = AutoChessCsv.doFormula(slot0._cfg.awardFail.card, slot5)
	end
end

function slot0.viewData(slot0)
	slot1 = csv.auto_chess.encounter[slot0.id]

	return AutoChessEasy.getEncounterViewData(slot0, slot1, {
		desc = slot0._cfg.desc,
		title = slot0._cfg.descShow,
		award = clone(slot0._cfg.awardWin),
		type = lushi.EncounterType.battle,
		isBoss = slot1.battleType == 3
	})
end

function slot0.gotoBattle(slot0)
	slot0:setTrainer()
	gRootViewProxy:notify("setBackBtn", false)
	gRootViewProxy:proxy():showReadyState()
	slot0.scene:modelWait("goto_battle", function ()
		uv0 = "createObjs"
		slot0 = slot0.createObjs

		slot0(slot0)

		uv0 = "createObjs"

		slot0.scene.operateMgr:setWaitMark(true)
	end)
end

function slot0.createObjs(slot0)
	for slot4, slot5 in ipairs(slot0.monsters) do
		slot6, slot7 = unpack(slot5)
		slot6.readyState = lushi.ObjectReadyState.none
		slot8 = slot0.scene.play:createObjectModel(slot4 + lushi.TeamNumber, slot6.type)
		slot12 = slot8
		slot13 = lushi.ObjectReadyState.embattle

		slot0.scene:addObj(2, slot12, slot13)
		slot8:init(slot6)

		for slot12, slot13 in ipairs(slot7) do
			slot14 = AutoChessEasy.getRoleDataFromCards(slot13)
			slot14.readyState = lushi.ObjectReadyState.embattle
			slot15 = slot0.scene.play:createObjectModel(1, slot14.type)

			slot15:init(slot14)
			slot15:setEquipedData()

			slot15.team = slot8.team

			slot8:addEquipment(slot15)
		end

		slot8.readyState = lushi.ObjectReadyState.embattle

		slot8.view:proxy():resetSpriteState()
	end

	for slot4, slot5 in slot0.scene.enemyHeros:order_pairs() do
		slot5:addAuras(true)
		slot5:tirggerAuraWhenAddFromConfig()
	end

	gRootViewProxy:notify("updateBackBtn")
	gRootViewProxy:proxy():refreshPostion(2, lushi.ObjectReadyState.embattle)
	slot0.scene:addGuideOperate()
end

function slot0.setTrainer(slot0)
	slot0.scene.trainer[2]:resetRole(slot0._cfg.trainerId)

	if slot0.trainerSkill then
		slot1:resetSkill(slot0.trainerSkill)
	end
end

function slot0.getTrainer(slot0, slot1)
	return slot0.scene.trainer[slot1]
end

function slot0.canConfirm(slot0, slot1)
	return true
end

function slot0.confirm(slot0, slot1)
	slot0.result = slot1
	slot2 = csv.auto_chess.encounter[slot0.id]

	if slot0.result ~= "win" and slot2.failJump and slot2.failJump > 0 and not slot0.hasHide then
		slot0.tempHideEncounterID = slot2.failJump

		return
	end

	if not slot0:isOver() then
		return
	end

	if slot0.scene.isGameOver then
		return
	end

	if slot1 == "win" then
		slot0:getAward(slot0._cfg.awardWin)
	else
		slot0:getAward(slot0._cfg.awardFail)
	end
end

function slot0.getAward(slot0, slot1)
	slot0.fakeObjs = {}

	if slot1.card then
		slot0.fakeObjs = AutoChessEasy.createFakeObj(slot1.card, slot0.scene)
	end

	AutoChessEasy.queueEffect("getAward", {
		objs = slot0.fakeObjs,
		gold = slot1[lushi.ShopGoldKey],
		result = slot0.result
	})
	slot0.scene:addGuideOperate()
	slot0.scene.guide:checkGuide(cb, slot0.scene:getGuideFrame())
	slot0.scene:waitGetAwardEnd()
end

function slot0.afterGetAward(slot0)
	for slot4, slot5 in ipairs(slot0.fakeObjs) do
		slot0.scene:deleteObj(slot5)
	end

	slot0.fakeObjs = {}
	slot1 = nil

	if ((slot0.result ~= "win" or slot0._cfg.awardWin) and slot0._cfg.awardFail).card then
		AutoChessEasy.gainHandObj(slot1.card, slot0.scene)
	end

	if slot1[lushi.ShopGoldKey] then
		slot0.scene:gainGold(slot1[lushi.ShopGoldKey])
	end
end

function slot0.confirmView(slot0)
	if not slot0:isOver() then
		gRootViewProxy:notify("setShopVisible", true, "fight", true)
	end
end

function slot0.isOver(slot0)
	if csv.auto_chess.encounter[slot0.id].failJump ~= -1 then
		return slot0.result == "win"
	else
		return true
	end
end

function slot0.complete(slot0)
	slot0._cfg = nil
	slot0.monsters = nil
	slot0.scene = nil
end

function slot0.awakeFromHide(slot0)
	slot0.hasHide = true
	slot0.tempHideEncounterID = nil
end

return slot0
