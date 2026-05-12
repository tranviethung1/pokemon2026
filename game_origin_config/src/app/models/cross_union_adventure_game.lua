slot0 = class("CrossUnionAdventureGameModel")

function slot0.ctor(slot0, slot1)
	slot0.game = slot1

	slot0:setDefault()
end

function slot0.setDefault(slot0)
	slot1 = {
		frame = 0,
		vertices = {},
		roles = {},
		unions = {},
		msgs = {},
		chats = {},
		boxes = {},
		plays = {}
	}
	slot0.allData = table.deepcopy(slot1, true)
	slot0.data = slot1
end

function slot0.fromServer(slot0, slot1)
	if slot1.theme then
		slot0:setDefault()
	end

	for slot5, slot6 in pairs(slot1) do
		if type(slot6) ~= "table" then
			slot0.allData[slot5] = slot6
		elseif itertools.include({
			"msgs",
			"chats"
		}, slot5) then
			slot0.allData[slot5] = slot0.allData[slot5] or {}

			if slot1.theme then
				slot0.allData[slot5] = {}
			end

			for slot10, slot11 in ipairs(slot6) do
				if slot11.type ~= -1 then
					table.insert(slot0.allData[slot5], slot11)
				end
			end
		else
			slot0.allData[slot5] = slot0.allData[slot5] or {}

			if itertools.include({
				"roles",
				"unions"
			}, slot5) then
				for slot10, slot11 in pairs(slot6) do
					slot0.allData[slot5][slot10] = slot0.allData[slot5][slot10] or {}

					for slot15, slot16 in pairs(slot11) do
						slot0.allData[slot5][slot10][slot15] = table.deepcopy(slot16)
					end
				end
			else
				for slot10, slot11 in pairs(slot6) do
					slot0.allData[slot5][slot10] = table.deepcopy(slot11)
				end
			end
		end
	end

	slot0.data = slot1
end

function slot0.move(slot0, slot1)
	slot0:sendPacket({
		cmd = "move",
		destVertices = slot1
	})
end

function slot0.transfer(slot0, slot1)
	slot0:sendPacket({
		cmd = "transfer",
		destVertex = slot1
	})
end

function slot0.quit(slot0)
	slot0:sendPacket({
		cmd = "quit"
	}, function ()
		uv0 = "allData"
		slot0.allData.prepareTime = nil

		gGameApp.net.unionadventureSession:sleep()
	end)
end

function slot0.controlAuto(slot0, slot1)
	if slot1 then
		slot0:sendPacket({
			cmd = "autoOpen"
		})
	else
		slot0:sendPacket({
			cmd = "autoClose"
		})
	end
end

function slot0.chat(slot0, slot1)
	slot0:sendPacket({
		cmd = "chat",
		msg = slot1
	})
end

function slot0.swapTroop(slot0)
	slot0:sendPacket({
		cmd = "swapTroop"
	})
end

function slot0.testControlRole(slot0, slot1)
	slot0:sendPacket({
		cmd = "testControlRole",
		roleID = slot1
	})
end

function slot0.testControlStop(slot0, slot1)
	if slot1 then
		slot0:sendPacket({
			cmd = "testStopOpen"
		})
	else
		slot0:sendPacket({
			cmd = "testStopClose"
		})
	end
end

function slot0.testControlAllAuto(slot0, slot1)
	if slot1 then
		slot0:sendPacket({
			cmd = "testAllAutoOpen"
		})
	else
		slot0:sendPacket({
			cmd = "testAllAutoClose"
		})
	end
end

function slot0.testRebuild(slot0, slot1)
	slot0:sendPacket({
		cmd = "testRebuild",
		theme = slot1 or 1
	})
end

function slot0.testCar(slot0, slot1)
	slot0:sendPacket({
		cmd = "testCar",
		carID = slot1
	})
end

function slot0.testEvent(slot0, slot1)
	slot0:sendPacket({
		cmd = "testEvent",
		csvID = slot1
	})
end

function slot0.testCase(slot0, slot1)
	slot0:sendPacket({
		cmd = "testCase",
		caseID = slot1
	})
end

function slot0.testSpeed(slot0, slot1)
	slot0:sendPacket({
		cmd = "testSpeed",
		speed = slot1
	})
end

function slot0.testPrepareTime(slot0, slot1)
	slot0:sendPacket({
		cmd = "testPrepareTime",
		prepareTime = slot1
	})
end

function slot0.getRoleNum(slot0, slot1)
	for slot6, slot7 in pairs(slot0.allData.roles) do
		if slot7.info and slot7.info.team == slot1 and slot7.move.state ~= 6 then
			slot2 = 0 + 1
		end
	end

	return slot2
end

function slot0.getVertexNum(slot0, slot1)
	for slot6, slot7 in pairs(slot0.allData.vertices) do
		if slot7.team == slot1 and not itertools.include({
			1,
			2
		}, csv.cross.union_adventure.map[slot6].type) then
			slot2 = 0 + 1
		end
	end

	return slot2
end

function slot0.getRoleTeamHp(slot0, slot1, slot2)
	if not slot0.allData.roles[slot1] then
		return 0
	end

	if itertools.size(slot0.allData.roles[slot1].info.cards[slot2 or slot0.allData.roles[slot1].record.curTroop]) == 0 then
		return 0
	end

	for slot10, slot11 in pairs(slot3.cards[slot2]) do
		slot6 = 0 + slot4.cardStates[slot11]
	end

	if slot6 <= 0 then
		return 0
	end

	return math.max(0.1, mathEasy.getPreciseDecimal(slot6 / slot5 * 100, 1))
end

function slot0.getFightPoint(slot0, slot1, slot2)
	if not slot0.allData.roles[slot1] then
		return 0
	end

	if itertools.size(slot0.allData.roles[slot1].info.cards[slot2 or slot0.allData.roles[slot1].record.curTroop]) == 0 then
		return 0
	end

	for slot10, slot11 in pairs(slot3.cards[slot2]) do
		slot6 = 0 + slot3.cardAttrs[slot11].fighting_point
	end

	return slot6
end

function slot0.sendPacket(slot0, slot1, slot2)
	gGameApp:requestPacket("/unionadventure/input", function (slot0, slot1)
		if slot1 then
			gGameUI:showTip(slot1.err)
		end

		uv2 = "gGameUI"

		if slot2 then
			uv2 = "gGameUI"

			slot2(slot1)
		end
	end, slot1)
end

return slot0
