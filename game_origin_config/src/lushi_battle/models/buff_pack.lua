slot0 = AutoChessBattle.AutoChessBuffModel
slot0.IgnoreKeys = {
	nodeManager = true,
	objThatTriggeringMeNow = true,
	csvObject = true,
	__cid = true,
	castBuffEnvAdded = true,
	__class = true,
	protectedEnv = true,
	components_ = true,
	csvCfg = true,
	triggerEnv = true,
	extraRecordKey = true,
	objTriggerVec = true,
	castBuffGroupStack = true,
	IgnoreKeys = true
}

function slot0.packInit(slot0)
	slot0.scene = slot0.holder.scene
	slot0.csvCfg = csvClone(csv.auto_chess.buff[slot0.cfgId])
	slot0.protectedEnv = AutoChessCsv.makeProtectedEnv(slot0.caster, nil, slot0)
	slot0.nodeManager = AutoChessBattle.BuffNodeManager.new(slot0)

	battleComponents.bind(slot0, "Event")
	slot0.nodeManager:init(slot0.csvCfg.triggerBehaviors)
	slot0:initTriggerEvents()

	if slot0.csvCfg.isShow then
		AutoChessEasy.queueEffect(function ()
			uv0 = "holder"
			uv2 = "holder"

			slot0.holder.view:proxy():playBuffAniEffect(slot2:getBuffEffectAniArgs())
		end)
	end
end
