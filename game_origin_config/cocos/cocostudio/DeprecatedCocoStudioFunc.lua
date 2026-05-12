if ccs == nil then
	return
end

function slot0(slot0, slot1)
end

slot1 = {
	shareReader = function ()
		uv0 = "GUIReader:shareReader"

		slot0("GUIReader:shareReader", "ccs.GUIReader:getInstance")

		return ccs.GUIReader:getInstance()
	end
}
GUIReader.shareReader = slot1.shareReader

function slot1.purgeGUIReader()
	uv0 = "GUIReader:purgeGUIReader"

	slot0("GUIReader:purgeGUIReader", "ccs.GUIReader:destroyInstance")

	return ccs.GUIReader:destroyInstance()
end

GUIReader.purgeGUIReader = slot1.purgeGUIReader
slot2 = {
	sharedSceneReader = function ()
		uv0 = "SceneReader:sharedSceneReader"

		slot0("SceneReader:sharedSceneReader", "ccs.SceneReader:getInstance")

		return ccs.SceneReader:getInstance()
	end
}
SceneReader.sharedSceneReader = slot2.sharedSceneReader

function slot2.purgeSceneReader(slot0)
	uv1 = "SceneReader:purgeSceneReader"

	slot1("SceneReader:purgeSceneReader", "ccs.SceneReader:destroyInstance")

	return slot0:destroyInstance()
end

SceneReader.purgeSceneReader = slot2.purgeSceneReader
ccs.GUIReader.purgeGUIReader = ({
	purgeGUIReader = function ()
		uv0 = "ccs.GUIReader:purgeGUIReader"

		slot0("ccs.GUIReader:purgeGUIReader", "ccs.GUIReader:destroyInstance")

		return ccs.GUIReader:destroyInstance()
	end
}).purgeGUIReader
ccs.ActionManagerEx.destroyActionManager = ({
	destroyActionManager = function ()
		uv0 = "ccs.ActionManagerEx:destroyActionManager"

		slot0("ccs.ActionManagerEx:destroyActionManager", "ccs.ActionManagerEx:destroyInstance")

		return ccs.ActionManagerEx:destroyInstance()
	end
}).destroyActionManager
ccs.SceneReader.destroySceneReader = ({
	destroySceneReader = function (slot0)
		uv1 = "ccs.SceneReader:destroySceneReader"

		slot1("ccs.SceneReader:destroySceneReader", "ccs.SceneReader:destroyInstance")

		return slot0:destroyInstance()
	end
}).destroySceneReader
slot6 = {
	sharedArmatureDataManager = function ()
		uv0 = "CCArmatureDataManager:sharedArmatureDataManager"

		slot0("CCArmatureDataManager:sharedArmatureDataManager", "ccs.ArmatureDataManager:getInstance")

		return ccs.ArmatureDataManager:getInstance()
	end
}
CCArmatureDataManager.sharedArmatureDataManager = slot6.sharedArmatureDataManager

function slot6.purge()
	uv0 = "CCArmatureDataManager:purge"

	slot0("CCArmatureDataManager:purge", "ccs.ArmatureDataManager:destoryInstance")

	return ccs.ArmatureDataManager:destoryInstance()
end

CCArmatureDataManager.purge = slot6.purge
