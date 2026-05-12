slot0 = AutoChessBattle.SceneModel
slot1 = AutoChessBattle.ObjectModel
slot0.IgnoreKeys = {
	updateResumeStack = true,
	csvObject = true,
	riseStarObjs = true,
	sendInputState = true,
	operateMgr = true,
	isPvP = true,
	isError = true,
	isRunning = true,
	fightGainCards = true,
	fightBackUp = true,
	deadObjsToBeDeleted = true,
	sendArray = true,
	needToDelBuffIDs = true,
	play = true,
	gainCardObjIDs = true,
	guideFrame = true,
	pvpTeamBackup = true,
	__cid = true,
	guide = true,
	herosOrder = true,
	__class = true,
	guideExtraOperate = true,
	framesInScene = true
}

function slot0.packInit(slot0)
	gRootViewProxy:proxy():onUpdateGoldNum(slot0.goldNum)
	gRootViewProxy:notify("setShopVisible", true)
	slot0:updateEventPanelView()

	if table.length(slot0.findWaitList) > 0 then
		gRootViewProxy:proxy():showFindList(true)
	end
end
