slot0 = class("AutoChessAI")

function slot0.ctor(slot0, slot1)
	slot0.scene = slot1
	slot0.operateList = {}
	slot0.curData = nil
	slot0.curEncMark = nil
	slot0.delta = 0
	slot0.isActive = false
	slot0.logicOnly = false
	slot0.isInited = false
end

slot1 = nil
slot1 = {
	function (slot0, slot1)
		return {
			typ = 1,
			func = function ()
				uv0 = "scene"
				slot0 = slot0.scene.operateMgr
				slot1 = slot0
				uv3 = "operateMgr"

				slot0.addOperate(slot1, lushi.OperateTable.menuClick, slot3)

				uv1 = "scene"

				for slot3 = table.length(slot1.operateList), 1, -1 do
					uv4 = "scene"

					if slot4.operateList[slot3].typ == 1 then
						uv6 = "scene"

						table.remove(slot6.operateList, slot3)
					end
				end
			end,
			after = function ()
				uv0 = "scene"

				if slot0.scene.trainer[1].toSelectSkills then
					slot2 = 1
					uv2 = "scene"

					slot2.scene.operateMgr:addOperate(lushi.OperateTable.findSkillConfirm, slot0[math.random(slot2, table.length(slot0))])
					gRootViewProxy:proxy():showFindSkill(false)
				end

				uv1 = "scene"
				uv3 = "trainer"

				slot1:onNewEncounter(slot3)
			end
		}
	end,
	function (slot0)
		return {
			typ = 2,
			func = function ()
				gRootViewProxy:proxy():onEncounterBack()
			end,
			after = function ()
				uv0 = "onNewEncounter"

				slot0:onNewEncounter()
			end
		}
	end,
	function (slot0, slot1)
		return {
			typ = 3,
			func = function ()
				uv0 = "scene"
				uv2 = "encounter"
				slot1 = {}

				for slot5, slot6 in pairs(slot0.scene.encounter.data:encounter(slot2).cards) do
					table.insert(slot1, slot6)
				end

				if table.length(slot1) > 0 then
					slot4 = 1
					uv4 = "scene"

					slot4.scene.operateMgr:addOperate(lushi.OperateTable.encounterConfirm, slot1[math.random(slot4, slot2)].seat)
				end
			end,
			after = function ()
				uv0 = "onNewEncounter"

				slot0:onNewEncounter()
			end
		}
	end,
	function (slot0, slot1)
		return {
			typ = 4,
			func = function ()
				uv0 = "scene"
				slot0 = slot0.scene.operateMgr
				slot0 = slot0.addOperate

				slot0(slot0, lushi.OperateTable.gotoBattle)

				uv0 = "scene"

				slot0.scene.operateMgr:addOperate(lushi.OperateTable.startFight)
			end,
			after = function ()
				uv0 = "onNewEncounter"

				slot0:onNewEncounter()
			end
		}
	end,
	function (slot0, slot1)
		return {
			typ = 5,
			func = function ()
				uv0 = "type"

				if slot0.type == lushi.ObjectType.normal then
					uv0 = "lushi"

					if not slot0.scene:canSetInEmbattle() then
						return
					end

					slot0 = {}
					uv1 = "lushi"

					for slot4, slot5 in slot1.scene.heros:order_pairs() do
						if not slot5.isFakeCard then
							uv6 = "type"
							uv8 = "type"

							if slot6:runFilterTarget(slot8.unitCfg.filterTarget, slot5) then
								table.insert(slot0, slot5)
							end
						end
					end

					uv3 = "lushi"

					if table.length(slot0) > 0 then
						slot4 = 1
						uv4 = "lushi"
						uv7 = "type"

						slot4.scene.operateMgr:addOperate(lushi.OperateTable.handCardSelect, slot7.id, math.random(1, slot3.scene.heros:size() + 1), slot0[math.random(slot4, slot2)].id)
					else
						uv3 = "lushi"
						uv6 = "type"

						slot3.scene.operateMgr:addOperate(lushi.OperateTable.handCardMove, slot6.id, slot1)
					end
				else
					slot0 = {}
					uv1 = "lushi"

					for slot4, slot5 in slot1.scene.heros:order_pairs() do
						table.insert(slot0, slot5)
					end

					if table.length(slot0) > 0 then
						slot3 = 1
						uv3 = "type"

						if slot3.type == lushi.ObjectType.event then
							uv3 = "lushi"
							uv6 = "type"

							slot3.scene.operateMgr:addOperate(lushi.OperateTable.eventCardMove, slot6.id, slot0[math.random(slot3, slot1)].id)
						else
							uv3 = "type"

							if slot3.type == lushi.ObjectType.equip then
								uv3 = "lushi"
								uv7 = "type"

								slot3.scene.operateMgr:addOperate(lushi.OperateTable.handEquipMove, slot2.id, slot7.id)
							end
						end
					end
				end
			end,
			after = function ()
				uv1 = "table"

				if table.length(slot1.scene.findCards) > 0 then
					uv1 = "table"

					slot1.scene.operateMgr:addOperate(lushi.OperateTable.findCardConfirm, math.random(1, slot0))
					gRootViewProxy:proxy():showFindList(false)
				end

				uv1 = "table"

				slot1:onNewEncounter()
			end
		}
	end,
	function (slot0, slot1)
		return {
			typ = 6,
			func = function ()
				uv0 = "scene"
				uv2 = "encounter"

				if slot0.scene.encounter.data:encounter(slot2):isJump() then
					uv1 = "scene"

					slot1.scene.operateMgr:addOperate(lushi.OperateTable.encounterConfirm)
				else
					slot1 = nil
					slot2 = csv.auto_chess.encounter[slot0.id]

					for slot6 = 1, 4 do
						if slot0._cfg[string.format("choiceDesc%d", slot6)] == "" or slot0._cfg[slot7] == nil then
							break
						end

						slot1 = slot6
					end

					uv3 = "scene"

					slot3.scene.operateMgr:addOperate(lushi.OperateTable.encounterConfirm, math.random(1, slot1))
				end
			end,
			after = function ()
				uv0 = "onNewEncounter"

				slot0:onNewEncounter()
			end
		}
	end,
	function (slot0, slot1)
		return {
			typ = 3,
			func = function ()
				uv0 = "scene"
				uv2 = "encounter"
				slot1 = {}

				if slot0.scene.encounter.data:encounter(function (slot0)
					return slot0.type == lushi.ObjectType.normal
				end)._cfg.type == 1 then
					function slot2(slot0)
						return slot0.type == lushi.ObjectType.normal and slot0.star < lushi.StarLimit
					end
				end

				uv3 = "scene"

				for slot6, slot7 in slot3.scene.heros:order_pairs() do
					if slot2(slot7) then
						table.insert(slot1, slot7)
					end
				end

				uv4 = "scene"

				for slot6, slot7 in ipairs(slot4.scene.handCards) do
					if slot2(slot7) then
						table.insert(slot1, slot7)
					end
				end

				if table.length(slot1) > 0 then
					slot5 = 1
					uv5 = "scene"

					slot5.scene.operateMgr:addOperate(lushi.OperateTable.encounterConfirm, slot1[math.random(slot5, slot3)].id)
				end
			end,
			after = function ()
				uv0 = "onNewEncounter"

				slot0:onNewEncounter()
			end
		}
	end,
	function (slot0)
		return {
			typ = 4,
			func = function ()
				uv1 = "scene"

				for slot4, slot5 in slot1.scene.heros:order_pairs() do
					table.insert({}, slot5)
				end

				uv2 = "scene"

				for slot4, slot5 in ipairs(slot2.scene.handCards) do
					table.insert(slot0, slot5)
				end

				if table.length(slot0) > 0 then
					slot3 = 1
					uv3 = "scene"

					slot3.scene.operateMgr:addOperate(lushi.OperateTable.saleCard, slot0[math.random(slot3, slot1)].id)
				end
			end,
			after = function ()
				uv0 = "onNewEncounter"

				slot0:onNewEncounter()
			end
		}
	end,
	function (slot0, slot1)
		return {
			typ = 1,
			func = function ()
				if math.random(1, 100) > 5 then
					return
				end

				uv1 = "math"
				slot1 = slot1.scene.operateMgr
				slot2 = slot1
				uv4 = "random"

				slot1.addOperate(slot2, lushi.OperateTable.menuDelete, slot4)

				uv2 = "math"

				for slot4 = table.length(slot2.operateList), 1, -1 do
					uv5 = "math"

					if slot5.operateList[slot4].typ == 1 then
						uv7 = "math"

						table.remove(slot7.operateList, slot4)
					end
				end
			end,
			after = function ()
				uv0 = "onNewEncounter"

				slot0:onNewEncounter()
			end
		}
	end
}

function slot0.init(slot0)
	slot0.operateList = {}
	slot0.curData = nil
	slot0.curEncMark = nil
	slot0.delta = 0

	slot0:addGoOneEncounter()
end

function slot0.addGoOneEncounter(slot0)
	for slot5 = 1, 3 do
		if slot0.scene.encounter.data:encounter(slot5) then
			uv9 = "scene"

			table.insert(slot0.operateList, slot9[1](slot0, slot5))

			if csv.auto_chess.encounter[slot6.id].close then
				uv10 = "scene"

				table.insert(slot0.operateList, slot10[9](slot0, slot5))
			end
		end
	end
end

function slot0.onNewEncounter(slot0, slot1)
	if not slot0.scene.encounter.data:encounter(slot1) then
		slot0.curEncMark = nil
		slot0.operateList = {}

		slot0:addGoOneEncounter()

		return true
	end

	if slot0.curEncMark then
		slot0.curEncMark = nil

		if slot0.curEncMark == tostring(slot2) and not csv.auto_chess.encounter[slot2.id].back then
			slot0.operateList = {}

			slot0:onNewEncounter(slot1)
		end

		return true
	end

	if not slot0.curEncMark then
		slot0.curEncMark = tostring(slot2)
		uv6 = "scene"

		table.insert(slot0.operateList, slot6[2](slot0))
	end

	if slot3.type == lushi.EncounterType.shop then
		slot0:addBuyOneItem(slot1)
	elseif slot3.type == lushi.EncounterType.battle then
		slot0:playCards()
		slot0:startFight(slot1)
	elseif slot3.type == lushi.EncounterType.story then
		uv6 = "scene"

		table.insert(slot0.operateList, slot6[6](slot0, slot1))
	elseif slot3.type == lushi.EncounterType.enhance then
		uv6 = "scene"

		table.insert(slot0.operateList, slot6[7](slot0, slot1))
	elseif slot3.type == lushi.EncounterType.pvp then
		slot0.isActive = false
	end

	return false
end

function slot0.addBuyOneItem(slot0, slot1)
	uv4 = "table"

	table.insert(slot0.operateList, slot4[3](slot0, slot1))
end

function slot0.playCards(slot0)
	for slot4 = table.length(slot0.operateList), 1, -1 do
		if slot0.operateList[slot4].typ == 5 then
			table.remove(slot0.operateList, slot4)
		end
	end

	slot1 = {}

	for slot5, slot6 in ipairs(slot0.scene.handCards) do
		if slot6.type == lushi.ObjectType.normal then
			if slot0.scene:canSetInEmbattle() then
				table.insert(slot1, slot6)
			end
		else
			table.insert(slot1, slot6)
		end
	end

	if table.length(slot1) > 0 then
		uv5 = "table"

		table.insert(slot0.operateList, slot5[5](slot0, slot1[math.random(1, slot2)]))
	end

	if not slot0.scene:canSetInEmbattle() and slot2 > 0 and math.random(1, 100) < 15 then
		uv6 = "table"

		table.insert(slot0.operateList, slot6[8](slot0))
	end
end

function slot0.startFight(slot0, slot1)
	uv4 = "table"

	table.insert(slot0.operateList, slot4[4](slot0, slot1))
end

function slot0.update(slot0, slot1)
	if not slot0.isActive then
		return
	end

	if not slot0.isInited then
		slot0.isInited = true

		math.randomseed(os.time())

		if not slot0.logicOnly then
			slot2 = gRootViewProxy:raw().showAwardList

			gRootViewProxy:raw().showAwardList = function (slot0, slot1, slot2, slot3, slot4, slot5)
				if slot1 then
					gRootViewProxy:notify("setShopVisible", true, "fight", true)
					slot5()
				end
			end

			slot3 = gRootViewProxy:raw().showSelectList

			gRootViewProxy:raw().showSelectList = function ()
			end
		end
	end

	if not slot0.scene:isUpdateOver() then
		return
	end

	if slot0.scene.operateMgr.queue:size() > 0 or not slot2.waitInput then
		return
	end

	slot0.delta = slot1 + slot0.delta

	if not slot0.logicOnly and slot0.delta < 500 then
		return
	end

	slot0.delta = 0

	if slot0.curData then
		slot0.curData.after()

		slot0.curData = nil

		return
	end

	if table.length(slot0.operateList) > 0 then
		slot5 = table.remove(slot0.operateList, math.random(1, slot3))
		slot0.curData = slot5

		slot5.func()

		return
	end
end

return slot0
