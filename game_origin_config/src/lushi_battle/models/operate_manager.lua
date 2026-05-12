slot0 = class("AutoChessOperateManager")
AutoChessBattle.OperateManager = slot0

function slot1()
	return true
end

slot2 = {
	[lushi.OperateTable.handCardMove] = {
		run = function (slot0, slot1, slot2)
			slot0.scene:handCardMoveEnd(slot1, slot2)
			slot0:setWaitMark(true)
		end,
		check = function (slot0, slot1, slot2)
			return slot0.scene:checkHandCardMoveEnd(slot1, slot2)
		end
	},
	[lushi.OperateTable.menuDelete] = {
		run = function (slot0, slot1)
			slot0.scene.encounter:menuDelete(slot1)
			slot0:setWaitMark(true)
		end
	},
	[lushi.OperateTable.menuClick] = {
		run = function (slot0, slot1)
			slot0.scene.encounter:menuClick(slot1)
			slot0:setWaitMark(true)
		end
	},
	[lushi.OperateTable.encounterConfirm] = {
		run = function (slot0, ...)
			slot0.scene.encounter:onConfirm(...)
			slot0:setWaitMark(true)
		end,
		check = function (slot0, ...)
			return slot0.scene.encounter:onConfirmCheck(...)
		end
	},
	[lushi.OperateTable.gotoBattle] = {
		run = function (slot0, ...)
			slot0.scene.encounter:gotoBattle(...)
		end
	},
	[lushi.OperateTable.handEquipMove] = {
		run = function (slot0, slot1, slot2)
			slot0.scene:handEquipMoveEnd(slot1, slot2)
			slot0:setWaitMark(true)
		end,
		check = function (slot0, slot1, slot2)
			return slot0.scene:checkAddEquip(slot1, slot2)
		end
	},
	[lushi.OperateTable.embattleMoveBegin] = {
		run = function (slot0, slot1)
			slot0.scene:embattleCardMoveBegin(slot1)
			slot0:setWaitMark(true)
		end
	},
	[lushi.OperateTable.embattleMoveEnd] = {
		run = function (slot0, slot1, slot2)
			slot0.scene:embattleCardMoveEnd(slot1, slot2)
			slot0:setWaitMark(true)
		end
	},
	[lushi.OperateTable.startFight] = {
		run = function (slot0)
			slot0.scene:startFight()
		end
	},
	[lushi.OperateTable.saleCard] = {
		run = function (slot0, slot1)
			slot0.scene:saleCard(slot1)
			slot0:setWaitMark(true)
		end
	},
	[lushi.OperateTable.trainerSkillConfirm] = {
		run = function (slot0, ...)
			slot0.scene.trainer[1]:useSkill(...)
			slot0:setWaitMark(true)
		end,
		check = function (slot0, ...)
			return slot0.scene.trainer[1]:canUseSkill(...)
		end
	},
	[lushi.OperateTable.handCardSelect] = {
		run = function (slot0, slot1, slot2, slot3)
			slot0.scene:setHandSelect(slot1, slot2, slot3)
			slot0:setWaitMark(true)
		end,
		check = function (slot0, slot1, slot2, slot3)
			return slot0.scene:checkHandSelect(slot1, slot3)
		end
	},
	[lushi.OperateTable.handCardCancel] = {
		run = function (slot0)
			slot0.scene:removeFakeCardInEmbattle()
			slot0.scene:refreshCardInEmbattle()
			slot0:setWaitMark(true)
		end
	},
	[lushi.OperateTable.eventCardMove] = {
		run = function (slot0, slot1, slot2)
			slot0.scene:eventCardMoveEnd(slot1, slot2)
			slot0:setWaitMark(true)
		end,
		check = function (slot0, slot1, slot2)
			return slot0.scene:checkEventSelect(slot1, slot2)
		end
	},
	[lushi.OperateTable.findCardConfirm] = {
		run = function (slot0, slot1)
			slot0.scene:onFindConfirm(slot1)
			slot0:setWaitMark(true)
		end
	},
	[lushi.OperateTable.findSkillConfirm] = {
		run = function (slot0, slot1)
			slot0.scene:addTrackingData(lushi.TrackingEvents.ChooseSkill, 1, slot1)
			slot0.scene.trainer[1]:resetSkill(slot1)
			slot0:setWaitMark(true)
		end
	},
	[lushi.OperateTable.quitBattle] = {
		run = function (slot0, slot1)
			slot0.scene:clearEnemy()
			slot0.scene.trainer[2]:reset()
			slot0:setWaitMark(true)
		end
	},
	[lushi.OperateTable.abandonGame] = {
		run = function (slot0)
			slot0.isAbandon = true

			slot0.scene:abandonGame()
			slot0:setWaitMark(true)
		end
	}
}

function slot0.ctor(slot0, slot1)
	slot0.scene = slot1
	slot0.queue = CVector.new()
	slot0.history = {}
	slot0.waitInput = true
	slot0.isAbandon = false
	slot0.operateCount = 0
end

function slot0.runNextOpreate(slot0)
	if not slot0.waitInput then
		return
	end

	if not slot0.queue:pop_back() or not slot0:checkFunc(slot1) then
		return
	end

	slot0.scene.logicFrame = slot0.scene.logicFrame + 1

	if not lushi.GuideCountExclude[slot1.name] then
		slot0.operateCount = slot0.operateCount + 1
	end

	slot2 = clone(slot1)
	slot2.frame = slot0.scene.logicFrame

	table.insert(slot0.history, slot2)
	slot0:runFunc(slot1)
end

function slot0.checkFunc(slot0, slot1)
	uv2 = "name"

	if not slot2[slot1.name].check then
		return true
	else
		uv2 = "name"

		return slot2[slot1.name].check(slot0, table.unpack(slot1.args))
	end
end

function slot0.runFunc(slot0, slot1)
	slot2 = slot0.setWaitMark

	slot2(slot0, false)

	uv2 = "setWaitMark"

	slot2[slot1.name].run(slot0, table.unpack(slot1.args))
end

function slot0.setWaitMark(slot0, slot1)
	slot0.waitInput = slot1
end

function slot0.addOperate(slot0, slot1, ...)
	slot0.queue:push_front({
		name = slot1,
		args = {
			...
		}
	})
	slot0:runNextOpreate()
end

function slot0.getHistory(slot0)
	return slot0.history
end

function slot0.clearHistory(slot0, slot1)
	for slot5 = table.length(slot0.history), 1, -1 do
		if slot0.history[slot5].frame <= slot1 then
			table.remove(slot0.history, slot5)
		end
	end
end

function slot0.addOperateFromHistory(slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		if slot0.scene.logicFrame < slot6.frame then
			slot6.fromHistory = true

			slot0.queue:push_front(slot6)
		end
	end
end
