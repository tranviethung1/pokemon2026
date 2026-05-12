slot0 = AutoChessBattle.Trainer
slot0.IgnoreKeys = {
	__cid = true,
	csvObject = true,
	__class = true,
	components_ = true,
	buffImmuneCache = true
}

function slot0.packInit(slot0)
	if slot0.cfg then
		slot0:updateHeadImg()
	end

	gRootViewProxy:notify("updateTrainerHp", slot0:hp(), slot0.team)

	if slot0.toSelectSkills then
		gRootViewProxy:proxy():showFindSkill(true, slot0.toSelectSkills)
	else
		gRootViewProxy:notify("updateTrainerSkill", slot0.skillId, slot0.skillType, slot0.team, slot0.skillCost)
	end
end
