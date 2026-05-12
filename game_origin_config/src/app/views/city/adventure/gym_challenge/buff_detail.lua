slot1 = class("GymBuffDetail", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "gym_buf_detail.json"
slot1.RESOURCE_BINDING = {
	imgTextBg = "imgTextBg",
	textNote = "textNote",
	textCost = "textCost",
	imgIcon = "imgIcon",
	imgCost = "imgCost",
	textLv = "textLv",
	textNoteLv = "textNoteLv",
	textName = "textName",
	textNoteCost = "textNoteCost",
	imgLockBg = "imgLockBg",
	lockPanel = "lockPanel",
	textDesc = "textDesc",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnAct = {
		varname = "btnAct",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onActClick")
			}
		}
	},
	btnDetail = {
		varname = "btnDetail",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onDetailClick")
			}
		}
	}
}

function slot2(slot0, slot1)
	slot3 = ""

	for slot7, slot8 in pairs(string.split(slot0, "$")) do
		if string.find(slot8, "skilllevel") then
			slot11 = ""

			if slot2[slot7 + 1] and string.find(slot2[slot7 + 1], "^%%") then
				slot11 = "%"
				slot2[slot7 + 1] = string.gsub(slot2[slot7 + 1], "^%%", "")
			end

			slot9 = eval.doFormula(slot8, {
				skilllevel = slot1,
				math = math
			}, slot0) .. slot11
		end

		slot3 = slot3 .. slot9
	end

	return slot3
end

function slot1.onCreate(slot0, slot1, slot2, slot3, slot4)
	slot0.id = slot1
	slot0.unlocked = slot2
	slot0.lv = 0
	slot5 = csv.gym.talent_buff[slot1]

	slot0.imgIcon:texture(slot5.icon)
	slot0.textName:text(slot5.name)

	slot0.gymDatas = gGameModel.role:getIdler("gym_datas")

	idlereasy.when(slot0.gymDatas, function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		uv3 = "gym_talent_trees"
		slot3 = 0

		if slot1.gym_talent_trees[slot3.treeID] then

			-- Decompilation error in this vicinity:
			--- BLOCK #1 8-13, warpins: 1 ---
			uv5 = "treeID"

			if not slot2.talent[slot5.id] then

				-- Decompilation error in this vicinity:
				--- BLOCK #2 14-14, warpins: 1 ---
				slot3 = 0
				--- END OF BLOCK #2 ---



			end
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-13, warpins: 1 ---
		uv5 = "treeID"

		if not slot2.talent[slot5.id] then

			-- Decompilation error in this vicinity:
			--- BLOCK #2 14-14, warpins: 1 ---
			slot3 = 0
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #1 ---




		-- Decompilation error in this vicinity:
		--- BLOCK #2 14-14, warpins: 1 ---
		slot3 = 0
		--- END OF BLOCK #2 ---




		-- Decompilation error in this vicinity:
		--- BLOCK #3 15-28, warpins: 3 ---
		uv4 = "treeID"
		slot4 = slot4.textLv
		slot4 = slot4.text
		uv8 = "gym_talent_trees"

		slot4(slot4, slot3 .. "/" .. slot8.levelUp)

		uv4 = "gym_talent_trees"

		if slot4.effectType == 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #4 29-34, warpins: 1 ---
			slot4 = {}
			--- END OF BLOCK #4 ---

			FLOW; TARGET BLOCK #5



			-- Decompilation error in this vicinity:
			--- BLOCK #5 35-41, warpins: 2 ---
			uv9 = "gym_talent_trees"
			--- END OF BLOCK #5 ---

			FLOW; TARGET BLOCK #6



			-- Decompilation error in this vicinity:
			--- BLOCK #6 42-48, warpins: 1 ---
			uv9 = "gym_talent_trees"
			--- END OF BLOCK #6 ---

			FLOW; TARGET BLOCK #7



			-- Decompilation error in this vicinity:
			--- BLOCK #7 49-55, warpins: 1 ---
			uv9 = "gym_talent_trees"

			if slot9["attrNum" .. slot8] then

				-- Decompilation error in this vicinity:
				--- BLOCK #8 56-58, warpins: 1 ---
				slot9 = 0

				if slot3 == 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #9 59-74, warpins: 1 ---
					uv11 = "gym_talent_trees"
					slot12 = "attrType" .. slot8
					uv12 = "gym_talent_trees"
					slot9 = dataEasy.getAttrValueString(slot11[slot12], slot12["attrNum" .. slot8][1])
					--- END OF BLOCK #9 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #10 75-89, warpins: 1 ---
					uv11 = "gym_talent_trees"
					slot12 = "attrType" .. slot8
					uv12 = "gym_talent_trees"
					slot9 = dataEasy.getAttrValueString(slot11[slot12], slot12["attrNum" .. slot8][slot3])
					--- END OF BLOCK #10 ---



				end

				--- END OF BLOCK #8 ---

				FLOW; TARGET BLOCK #11



				-- Decompilation error in this vicinity:
				--- BLOCK #11 90-95, warpins: 2 ---
				table.insert(slot4, slot9)
				--- END OF BLOCK #11 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #12 96-96, warpins: 0 ---
				break
				--- END OF BLOCK #12 ---



			end
			--- END OF BLOCK #7 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #13



		-- Decompilation error in this vicinity:
		--- BLOCK #4 29-34, warpins: 1 ---
		slot4 = 
		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 35-41, warpins: 2 ---
		uv9 = "gym_talent_trees"
		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 42-48, warpins: 1 ---
		uv9 = "gym_talent_trees"
		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 49-55, warpins: 1 ---
		uv9 = "gym_talent_trees"

		if slot9["attrNum" .. slot8] then

			-- Decompilation error in this vicinity:
			--- BLOCK #8 56-58, warpins: 1 ---
			slot9 = 0

			if slot3 == 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #9 59-74, warpins: 1 ---
				uv11 = "gym_talent_trees"
				slot12 = "attrType" .. slot8
				uv12 = "gym_talent_trees"
				slot9 = dataEasy.getAttrValueString(slot11[slot12], slot12["attrNum" .. slot8][1])
				--- END OF BLOCK #9 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #10 75-89, warpins: 1 ---
				uv11 = "gym_talent_trees"
				slot12 = "attrType" .. slot8
				uv12 = "gym_talent_trees"
				slot9 = dataEasy.getAttrValueString(slot11[slot12], slot12["attrNum" .. slot8][slot3])
				--- END OF BLOCK #10 ---



			end

			--- END OF BLOCK #8 ---

			FLOW; TARGET BLOCK #11



			-- Decompilation error in this vicinity:
			--- BLOCK #11 90-95, warpins: 2 ---
			table.insert(slot4, slot9)
			--- END OF BLOCK #11 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #12 96-96, warpins: 0 ---
			break
			--- END OF BLOCK #12 ---



		end

		--- END OF BLOCK #7 ---




		-- Decompilation error in this vicinity:
		--- BLOCK #8 56-58, warpins: 1 ---
		slot9 = 0

		if slot3 == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #9 59-74, warpins: 1 ---
			uv11 = "gym_talent_trees"
			slot12 = "attrType" .. slot8
			uv12 = "gym_talent_trees"
			slot9 = dataEasy.getAttrValueString(slot11[slot12], slot12["attrNum" .. slot8][1])
			--- END OF BLOCK #9 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #10 75-89, warpins: 1 ---
			uv11 = "gym_talent_trees"
			slot12 = "attrType" .. slot8
			uv12 = "gym_talent_trees"
			slot9 = dataEasy.getAttrValueString(slot11[slot12], slot12["attrNum" .. slot8][slot3])
			--- END OF BLOCK #10 ---



		end

		--- END OF BLOCK #8 ---

		FLOW; TARGET BLOCK #11



		-- Decompilation error in this vicinity:
		--- BLOCK #9 59-74, warpins: 1 ---
		uv11 = "gym_talent_trees"
		slot12 = "attrType" .. slot8
		uv12 = "gym_talent_trees"
		slot9 = dataEasy.getAttrValueString(slot11[slot12], slot12["attrNum" .. slot8][1])
		--- END OF BLOCK #9 ---




		-- Decompilation error in this vicinity:
		--- BLOCK #10 75-89, warpins: 1 ---
		uv11 = "gym_talent_trees"
		slot12 = "attrType" .. slot8
		uv12 = "gym_talent_trees"
		slot9 = dataEasy.getAttrValueString(slot11[slot12], slot12["attrNum" .. slot8][slot3])

		--- END OF BLOCK #10 ---




		-- Decompilation error in this vicinity:
		--- BLOCK #11 90-95, warpins: 2 ---
		table.insert(slot4, slot9)

		--- END OF BLOCK #11 ---




		-- Decompilation error in this vicinity:
		--- BLOCK #12 96-96, warpins: 0 ---
		break

		--- END OF BLOCK #12 ---




		-- Decompilation error in this vicinity:
		--- BLOCK #13 97-97, warpins: 1 ---
		--- END OF BLOCK #13 ---




		-- Decompilation error in this vicinity:
		--- BLOCK #14 98-112, warpins: 5 ---
		uv5 = "treeID"
		uv8 = "gym_talent_trees"

		slot5.textDesc:text(string.format(slot8.desc, table.unpack(slot4)))

		--- END OF BLOCK #14 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #18



		-- Decompilation error in this vicinity:
		--- BLOCK #15 113-121, warpins: 1 ---
		uv4 = "treeID"
		slot4 = slot4.textDesc
		slot5 = slot4
		slot4 = slot4.text
		uv6 = "talent"
		uv7 = "gym_talent_trees"
		slot7 = slot7.desc
		--- END OF BLOCK #15 ---

		slot8 = if not slot3 then
		JUMP TO BLOCK #16
		else
		JUMP TO BLOCK #17
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #16 122-122, warpins: 1 ---
		slot8 = 0

		--- END OF BLOCK #16 ---

		FLOW; TARGET BLOCK #17



		-- Decompilation error in this vicinity:
		--- BLOCK #17 123-124, warpins: 2 ---
		slot4(slot5, slot6(slot7, slot8))

		--- END OF BLOCK #17 ---

		FLOW; TARGET BLOCK #18



		-- Decompilation error in this vicinity:
		--- BLOCK #18 125-147, warpins: 2 ---
		slot4 = adapt.oneLineCenterPos
		uv6 = "treeID"
		slot6 = slot6.imgIcon
		slot7 = 607
		uv7 = "treeID"
		slot7 = slot7.textNoteLv
		uv7 = "treeID"

		slot4(cc.p(slot6:x(), slot7), {
			slot7,
			slot7.textLv
		})

		uv4 = "treeID"
		--- END OF BLOCK #18 ---

		if slot4.unlocked == false then
		JUMP TO BLOCK #19
		else
		JUMP TO BLOCK #20
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #19 148-225, warpins: 1 ---
		uv4 = "treeID"
		slot4 = slot4.btnAct:get("textNote")
		slot5 = slot4
		slot6 = gLanguageCsv.notActivatedTip

		slot4.text(slot5, slot6)

		uv5 = "treeID"
		uv6 = "treeID"
		slot6 = slot6.btnAct:get("textNote")
		slot7 = 2

		uiEasy.setBtnShader(slot5.btnAct, slot6, slot7)

		slot5 = {
			slot6,
			slot6,
			slot6,
			slot6,
			slot6.textLv
		}
		uv6 = "treeID"
		uv6 = "treeID"
		uv6 = "treeID"
		uv6 = "treeID"
		slot6 = slot6.textNoteCost.textCost.imgCost.textNoteLv
		uv6 = "treeID"

		itertools.invoke(slot5, "hide")

		uv5 = "id"
		slot4 = csv.gym.talent_buff[slot5]
		slot5 = slot4.preTalentIDs
		slot6 = slot4.preLevel
		uv7 = "treeID"
		slot7 = slot7.lockPanel
		slot7 = slot7.show

		slot7(slot7)

		uv7 = "treeID"
		slot9 = "textNote3"

		slot7.lockPanel:get(slot9)

		slot8 = "(%d/%d)"
		uv9 = "textLv"
		uv10 = "text"
		uv8 = "treeID"

		slot8.lockPanel:get("textLevel"):text(string.format(slot8, slot9, slot10))

		--- END OF BLOCK #19 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #26



		-- Decompilation error in this vicinity:
		--- BLOCK #20 226-229, warpins: 1 ---
		uv4 = "gym_talent_trees"
		--- END OF BLOCK #20 ---

		if slot4.levelUp <= slot3 then
		JUMP TO BLOCK #21
		else
		JUMP TO BLOCK #22
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #21 230-280, warpins: 1 ---
		uv4 = "treeID"
		slot4 = slot4.btnAct:get("textNote")
		slot5 = slot4
		slot6 = gLanguageCsv.levelMax

		slot4.text(slot5, slot6)

		uv5 = "treeID"
		uv6 = "treeID"
		slot6 = slot6.btnAct:get("textNote")

		uiEasy.setBtnShader(slot5.btnAct, slot6, 2)

		slot4 = itertools.invoke
		uv6 = "treeID"
		slot6 = slot6.textNoteCost
		uv6 = "treeID"
		slot6 = slot6.textCost
		uv6 = "treeID"
		slot6 = slot6.imgCost
		uv6 = "treeID"

		slot4({
			slot6,
			slot6,
			slot6,
			slot6.btnDetail
		}, "hide")

		uv4 = "treeID"
		slot4 = slot4.imgLockBg
		slot4 = slot4.hide

		slot4(slot4)

		uv4 = "treeID"

		slot4.lockPanel:hide()

		--- END OF BLOCK #21 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #26



		-- Decompilation error in this vicinity:
		--- BLOCK #22 281-342, warpins: 1 ---
		uv6 = "gym_talent_trees"
		slot5 = "cost" .. slot6.costID
		uv5 = "treeID"
		slot5 = slot5.textCost
		slot5 = slot5.text
		slot7 = csv.gym.talent_cost[slot3][slot5].gym_talent_point

		slot5(slot5, slot7)

		uv5 = "treeID"

		slot5.imgLockBg:hide()

		uv7 = "treeID"
		slot7 = slot7.btnAct
		slot8 = slot7
		uv8 = "treeID"
		slot8 = slot8.textNoteCost
		slot8 = slot8.y
		uv8 = "treeID"
		slot8 = slot8.textNoteCost
		uv8 = "treeID"
		slot8 = slot8.textCost
		uv8 = "treeID"

		adapt.oneLineCenterPos(cc.p(slot7.x(slot8), slot8(slot8)), {
			slot8,
			slot8,
			slot8.imgCost
		}, {
			cc.p(10, 0),
			cc.p(10, 0)
		})

		--- END OF BLOCK #22 ---

		if slot3 == 0 then
		JUMP TO BLOCK #23
		else
		JUMP TO BLOCK #24
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #23 343-366, warpins: 1 ---
		uv5 = "treeID"
		slot5 = slot5.btnAct:get("textNote")
		slot6 = slot5
		slot7 = gLanguageCsv.spaceActive

		slot5.text(slot6, slot7)

		uv6 = "treeID"
		uv7 = "treeID"

		uiEasy.setBtnShader(slot6.btnAct, slot7.btnAct:get("textNote"), 1)

		--- END OF BLOCK #23 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #25



		-- Decompilation error in this vicinity:
		--- BLOCK #24 367-389, warpins: 1 ---
		uv5 = "treeID"
		slot5 = slot5.btnAct:get("textNote")
		slot6 = slot5
		slot7 = gLanguageCsv.spaceUpgrade

		slot5.text(slot6, slot7)

		uv6 = "treeID"
		uv7 = "treeID"

		uiEasy.setBtnShader(slot6.btnAct, slot7.btnAct:get("textNote"), 1)

		--- END OF BLOCK #24 ---

		FLOW; TARGET BLOCK #25



		-- Decompilation error in this vicinity:
		--- BLOCK #25 390-394, warpins: 2 ---
		uv5 = "treeID"

		slot5.lockPanel:hide()

		--- END OF BLOCK #25 ---

		FLOW; TARGET BLOCK #26



		-- Decompilation error in this vicinity:
		--- BLOCK #26 395-397, warpins: 3 ---
		uv4 = "treeID"
		slot4.lv = slot3

		return
		--- END OF BLOCK #26 ---



	end)
end

function slot1.onActClick(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-22, warpins: 1 ---
	--- END OF BLOCK #0 ---

	if slot0.gymDatas:read()
	.gym_talent_point < csv.gym.talent_cost[slot0.lv]["cost" .. csv.gym.talent_buff[slot0.id].costID].gym_talent_point then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 23-29, warpins: 1 ---
	gGameUI:showTip(gLanguageCsv.gymBuffPointNotEnough)

	return

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 30-38, warpins: 1 ---
	gGameApp:requestServer("/game/gym/talent/level/up", function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-36, warpins: 1 ---
		uv1 = "imgTextBg"
		slot1 = slot1.imgTextBg:show():y(620):stopAllActions()
		slot1 = slot1.setOpacity

		slot1(slot1, 255)

		uv1 = "imgTextBg"

		slot1.imgTextBg:get("imgText"):stopAllActions():setOpacity(255)

		slot1 = 2
		slot2 = 1
		slot3 = 0.5
		uv4 = "imgTextBg"
		--- END OF BLOCK #0 ---

		if slot4.lv == 0 then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 37-47, warpins: 1 ---
		uv4 = "imgTextBg"

		slot4.imgTextBg:get("imgText"):texture("city/adventure/gym_challenge/txt_jhcg.png")

		--- END OF BLOCK #1 ---

		UNCONDITIONAL JUMP; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #2 48-57, warpins: 1 ---
		uv4 = "imgTextBg"

		slot4.imgTextBg:get("imgText"):texture("city/adventure/gym_challenge/txt_sjcg.png")

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 58-125, warpins: 2 ---
		slot5 = "new_advance_suc.mp3"

		audio.playEffectWithWeekBGM(slot5)

		uv5 = "imgTextBg"
		slot4 = transition.executeSequence(slot5.imgTextBg):moveBy(slot3, 0, 100):delay(slot1):moveBy(slot2, 0, 100):hide()
		slot5 = slot4

		slot4.done(slot5)

		uv5 = "imgTextBg"
		slot4 = transition.executeSequence(slot5.imgTextBg):delay(slot1 + slot3):fadeOut(slot2)
		slot5 = slot4

		slot4.done(slot5)

		uv5 = "imgTextBg"

		transition.executeSequence(slot5.imgTextBg:get("imgText")):delay(slot1 + slot3):fadeOut(slot2):done()

		return
		--- END OF BLOCK #3 ---



	end, slot0.id)

	return
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 39-39, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

function slot1.onDetailClick(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot2 = slot0.lv + 1
	slot4 = "#L10##C0x5B545B#" .. gLanguageCsv.gymBufLvUpEff .. "\n#L0#"
	--- END OF BLOCK #0 ---

	if csv.gym.talent_buff[slot0.id].effectType == 1 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #12
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-21, warpins: 1 ---
	slot5 = {}
	--- END OF BLOCK #1 ---

	for slot9=1, math.huge, 1
	LOOP BLOCK #2
	GO OUT TO BLOCK #11


	-- Decompilation error in this vicinity:
	--- BLOCK #2 22-27, warpins: 2 ---
	--- END OF BLOCK #2 ---

	slot10 = if slot3["attrType" .. slot9] then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #11
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 28-33, warpins: 1 ---
	--- END OF BLOCK #3 ---

	if slot3["attrType" .. slot9] ~= 0 then
	JUMP TO BLOCK #4
	else
	JUMP TO BLOCK #11
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #4 34-39, warpins: 1 ---
	--- END OF BLOCK #4 ---

	slot10 = if slot3["attrNum" .. slot9] then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #11
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 40-42, warpins: 1 ---
	slot10 = 0
	--- END OF BLOCK #5 ---

	if slot2 == 0 then
	JUMP TO BLOCK #6
	else
	JUMP TO BLOCK #7
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #6 43-56, warpins: 1 ---
	slot10 = dataEasy.getAttrValueString(slot3["attrType" .. slot9], slot3["attrNum" .. slot9][1])
	--- END OF BLOCK #6 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #7 57-69, warpins: 1 ---
	slot10 = dataEasy.getAttrValueString(slot3["attrType" .. slot9], slot3["attrNum" .. slot9][slot2])

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 70-75, warpins: 2 ---
	table.insert(slot5, slot10)

	--- END OF BLOCK #8 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #9 76-76, warpins: 0 ---
	--- END OF BLOCK #9 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #10 77-77, warpins: 1 ---
	--- END OF BLOCK #10 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #11 78-88, warpins: 5 ---
	slot4 = slot4 .. string.format(slot3.desc, table.unpack(slot5))
	--- END OF BLOCK #11 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #16



	-- Decompilation error in this vicinity:
	--- BLOCK #12 89-91, warpins: 1 ---
	--- END OF BLOCK #12 ---

	if slot3.effectType == 2 then
	JUMP TO BLOCK #13
	else
	JUMP TO BLOCK #16
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #13 92-96, warpins: 1 ---
	slot5 = slot4
	uv6 = "lv"
	slot7 = slot3.desc
	--- END OF BLOCK #13 ---

	slot8 = if not slot2 then
	JUMP TO BLOCK #14
	else
	JUMP TO BLOCK #15
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #14 97-97, warpins: 1 ---
	slot8 = 0
	--- END OF BLOCK #14 ---

	FLOW; TARGET BLOCK #15



	-- Decompilation error in this vicinity:
	--- BLOCK #15 98-99, warpins: 2 ---
	slot4 = slot5 .. slot6(slot7, slot8)

	--- END OF BLOCK #15 ---

	FLOW; TARGET BLOCK #16



	-- Decompilation error in this vicinity:
	--- BLOCK #16 100-109, warpins: 3 ---
	gGameUI:showItemDetailCustom(slot1, {
		width = 420,
		content = slot4
	}, "common.text", {
		canvasDir = "horizontal"
	})

	return
	--- END OF BLOCK #16 ---



end

return slot1
