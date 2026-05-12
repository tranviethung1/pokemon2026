return {
	getBaseCfg = function (slot0)
		return csv.auto_chess.base[(csv.cross.service[gGameModel.auto_chess:read("csv_id")] or {}).version] or csv.auto_chess.base[1]
	end,
	getCardType = function (slot0)
		if csv.auto_chess.cards[slot0] then
			return "card", 1, csv.auto_chess.cards[slot0]
		elseif csv.auto_chess.equip[slot0] then
			return "equip", 2, csv.auto_chess.equip[slot0]
		elseif csv.auto_chess.event[slot0] then
			return "event", 3, csv.auto_chess.event[slot0]
		else
			printError("auto_chess_card id(%s) error", tostring(slot0))

			return
		end
	end,
	createNpcSpine = function (slot0, slot1, slot2, slot3)
		slot4 = slot1

		if type(slot1) == "number" then
			slot4 = gRoleFigureCsv[csv.auto_chess.trainer[slot1].figureID].qRoleSpine

			if slot3 then
				slot4 = slot6.resSpine
			end
		end

		slot0:removeChildByName("spine")

		return widget.addAnimationByKey(slot0, slot4, "spine", slot3 and "standby_loop1" or "standby_loop", 1):xy(slot0:width() / 2, slot2 == "main" and 0 or 80):scale(slot2 == "main" and 2.5 or 2)
	end,
	getAchievementLevel = function (slot0)
		slot0 = slot0 or gGameModel.auto_chess:read("achievement_points")
		slot3 = gAutoChessAchievementLevelCsv[itertools.size(gAutoChessAchievementLevelCsv)].point

		for slot7, slot8 in pairs(gAutoChessAchievementLevelCsv) do
			if slot8.point <= slot0 then
				slot1 = 0 + 1
				slot0 = slot0 - slot8.point
			else
				slot3 = slot8.point

				break
			end
		end

		return slot1, slot0, slot3
	end,
	storeAchievementTask = function (slot0)
		if slot0 then
			uv1 = "_storeAchievementTask"
			slot1._storeAchievementTask = gGameModel.auto_chess:read("achievement_tasks")

			return
		end

		uv1 = "_storeAchievementTask"

		return slot1._storeAchievementTask or {}
	end,
	getAchievementChanged = function ()
		uv0 = "storeAchievementTask"

		for slot6, slot7 in pairs(gGameModel.auto_chess:read("achievement_tasks")) do
			if slot7 ~= slot0.storeAchievementTask()[slot6] then
				-- Nothing
			end
		end

		uv3 = "storeAchievementTask"

		slot3.storeAchievementTask(true)

		return {
			[slot6] = slot7
		}
	end,
	showAchievementTips = function (slot0)
		uv1 = "getAchievementChanged"

		if itertools.isempty(slot1.getAchievementChanged()) then
			return
		end

		userDefault.setForeverLocalKey("autoChessAchievementTrainer", true)

		slot2 = 0

		for slot6, slot7 in orderCsvPairs(csv.auto_chess.achievement_task) do
			if slot1[slot6] then
				slot8 = slot0:clone():addTo(slot0:parent(), slot0:z()):name("item" .. slot6):show():anchorPoint(0.5, 0.5):xy(slot0:xy())
				slot9 = slot8:multiget("num", "txtTitle")

				slot9.txtTitle:text(slot7.name)
				slot9.num:text(slot7.point)
				slot8:setCascadeOpacityEnabled(true)
				transition.executeSequence(slot8, true):delay(slot2 * 2 + 0.1):moveTo(0.4, slot8:x() + slot8:width() + 280 - display.uiOriginMax.x, slot8:y()):delay(1.5):func(function ()
					slot0 = 0.8
					uv2 = "transition"
					uv4 = "executeSpawn"
					uv5 = "transition"
					slot1 = transition.executeSpawn(slot2, true):moveTo(slot0, slot4, slot5:y() + 200):fadeOut(slot0)
					slot2 = slot1

					slot1.done(slot2)

					uv2 = "moveTo"

					performWithDelay(slot2:parent(), function ()
						uv0 = "removeSelf"

						slot0:removeSelf()
					end, slot0)
				end):done()

				slot2 = slot2 + 1
			end
		end
	end,
	getBattleResult = function (slot0, slot1)
		if slot1 then
			return slot0.result
		end

		return slot0.pve_pass and "win" or "fail"
	end
}
