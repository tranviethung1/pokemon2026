function slot1(slot0, slot1)
	slot2 = slot0:getHerosMap(slot1.team)
	slot3 = slot1.team == 1 and 0 or lushi.TeamNumber
	slot4 = 1

	for slot9, slot10 in slot2:order_pairs() do
		if not slot10:isDeath() then
			slot5 = 0 + 1
		end

		slot10.seat = slot3 + 1

		if slot10.id == slot1.id then
			slot4 = slot3 + 1
		end
	end

	if lushi.TeamNumber <= slot5 then
		return
	end

	return slot4
end

slot2 = {
	[0] = function (slot0, slot1)
		uv3 = "holder"

		return slot3(slot0, slot1.holder)
	end,
	function (slot0, slot1)
		if not slot1.caster then
			return
		end

		uv3 = "caster"

		return slot3(slot0, slot2)
	end
}

function slot3(slot0, slot1)
	uv2 = "pos"

	if not slot2[slot1.pos] then
		return
	end

	if not slot2(slot0, slot1.buff) then
		return
	end

	slot4 = slot1.holderTeam
	AutoChessEasy.getRoleDataFromCards(slot1.cardId).star = slot1.star

	if slot1.buff.specialTarget and slot1.buff.holder:getTargets(slot1.buff.specialTarget)[1] then
		if slot1.star == 0 then
			AutoChessEasy.getRoleDataFromCards(slot7.unitID).star = slot7.star
		end
	end

	slot5.readyState = lushi.ObjectReadyState.none
	slot5.team = slot4
	slot6 = slot0.play:createObjectModel(slot3, slot5.type)
	slot10 = slot6
	slot11 = lushi.ObjectReadyState.embattle

	slot0:addObj(slot4, slot10, slot11)
	slot6:init(slot5)

	slot6.readyState = lushi.ObjectReadyState.embattle

	slot6.view:proxy():resetSpriteState()
	slot0.play:addSummonObjToLeftHeros(slot6)

	for slot10, slot11 in ipairs(slot1.buffList) do
		if csv.auto_chess.buff[slot11] then
			AutoChessBattle.addBuffToHero(slot11, slot6, slot6, {
				value = 0
			})
		end
	end

	slot6:onEnterField()
	slot6.view:proxy():setVisible(false)
	AutoChessEasy.queueEffect("wait", {
		lifetime = 400
	})

	slot7 = slot0:calcEmbattlePos(slot4)

	battleEasy.queueEffect(function ()
		slot0 = gRootViewProxy:proxy()
		slot0 = slot0.setPosByData
		uv2 = "gRootViewProxy"

		slot0(slot0, slot2)

		uv0 = "proxy"

		slot0.view:proxy():onSummon()
	end)
	AutoChessEasy.queueEffect("wait", {
		lifetime = 400
	})
end

function AutoChessBattle.SceneModel.summon(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot0.isRunning then
		uv11 = "holder"

		table.insert(slot0.play.roundLogicDelay, {
			typef = slot11,
			args = {
				cardId = slot1,
				star = slot2,
				pos = slot3,
				buffList = slot4,
				seat = seat,
				buff = {
					holder = slot5.holder,
					caster = slot5.caster,
					specialTarget = slot5.csvCfg.specialTarget
				},
				holderTeam = slot5.holder.team
			}
		})
	else
		uv8 = "holder"

		slot8(slot0, slot7)
	end
end
