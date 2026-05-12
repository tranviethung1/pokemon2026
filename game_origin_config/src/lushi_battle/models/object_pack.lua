slot0 = AutoChessBattle.ObjectModel
slot1 = AutoChessBattle.AutoChessBuffModel
slot0.IgnoreKeys = {
	attackMeDeadObj = true,
	csvObject = true,
	isDeleted = true,
	__cid = true,
	components_ = true,
	__class = true,
	unitCfg = true,
	protectedEnv = true,
	view = true,
	IgnoreKeys = true,
	buffImmuneCache = true
}

function slot0.packInit(slot0)
	slot0.unitCfg = csvClone(csv.auto_chess.cards[slot0.unitID])
	slot0.protectedEnv = AutoChessCsv.makeProtectedEnv(slot0)

	slot0:addObjViewToScene()

	for slot4, slot5 in ipairs(slot0.equipMents) do
		slot0.view:proxy():onAddEquipment(csv.auto_chess.equip[slot5.unitID], slot4)
	end

	if slot0.readyState == lushi.ObjectReadyState.shop then
		slot0.view:proxy():updateRiseState(slot0.scene:checkRiseStar(slot0) and true or false)
	end

	if not slot0.view then
		error("not have view")
	end
end
