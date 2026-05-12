slot2 = {
	"lv",
	"lan",
	"zi",
	"cheng"
}
slot3 = {
	cc.c4b(145, 225, 177, 255),
	cc.c4b(112, 161, 227, 255),
	cc.c4b(177, 135, 254, 255),
	cc.c4b(236, 183, 42, slot8)
}
slot8 = 255
slot4 = 10

for slot8 = 1, 4 do
	table.insert({}, {
		quality = slot8,
		icon = string.format("city/adventure/mimicry/btn_ntdz_%s.png", slot2[slot8]),
		log = string.format("city/adventure/mimicry/log_ntdz_%s.png", slot2[slot8]),
		maxNumber = csv.mimicry.base[1][string.format("quality%sBuffFieldNum", slot8)]
	})
end

slot5 = {
	initBuffView = function (slot0)
		slot0.progressBarSign = idler.new(true)
		slot0.progressBarData = {}
		slot1 = 0

		idlereasy.when(slot0.progressBarSign, function ()
			error("Decompilation failed")
			-- Exception in function building!
			-- Traceback (most recent call last):
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
			--     return _build_function_definition(prototype, state.header)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
			--     node.statements.contents = _build_function_blocks(state, instructions)
			--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
			--     statement, line_marked_elements = _build_statement(state, addr, instruction)
			--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
			--     return _build_var_assignment(state, addr, instruction)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
			--     assn = func(*args, **kwargs)
			--            ^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
			--     expression = _build_const_expression(state, addr, instruction)
			--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 834, in _build_const_expression
			--     return _build_numeric_constant(state, instruction.CD)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1027, in _build_numeric_constant
			--     number = state.constants.numeric_constants[index]
			--              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
			-- IndexError: list index out of range
		end)

		function slot4(slot0, slot1)
			uv5 = "cc"
			slot5 = slot5.maxNumber
			slot1 = cc.clampf(slot1, 0, slot5)
			slot3 = gLanguageCsv.mimicryBattleNumber
			uv5 = "cc"
			uv3 = "cc"

			if slot1 < slot3.maxNumber then
				uv6 = "cc"
				slot2 = string.format(slot3, slot1, slot5.maxNumber) .. string.format(gLanguageCsv.mimicryRecoverNum, time.getRefreshHour(), slot6.recoverNumber)
			end

			uv3 = "cc"

			slot3.countPanel:removeAllChildren()

			slot5 = 40
			uv5 = "cc"
			slot5 = cc.p
			uv5 = "cc"
			slot3 = rich.createByStr(slot2, slot5):addTo(slot5.countPanel, 20, "richText"):anchorPoint(slot5(0.5, 0.5)):xy(slot5.countPanel:size().width / 2, 60)
			slot4 = slot3
			uv4 = "cc"

			if slot4.battle then
				slot3.formatText(slot4):hide()
			end

			uv5 = "cc"
			slot5 = slot5.num1
			slot5 = slot5.setTextColor

			slot5(slot5, slot1 <= 0 and ui.COLORS.NORMAL.RED or cc.c4b(56, 240, 115, 255))

			uv5 = "cc"
			slot5 = slot5.num1
			slot5 = slot5.text

			slot5(slot5, slot1)

			uv5 = "cc"
			slot5 = slot5.num2
			slot6 = slot5
			uv8 = "cc"
			slot8 = slot8.maxNumber

			slot5.text(slot6, "/" .. slot8 .. gLanguageCsv.symbolBracketRight)

			uv6 = "cc"
			uv8 = "cc"
			slot8 = slot8.num1
			uv8 = "cc"

			adapt.oneLinePos(slot6.txtTime1, {
				slot8,
				slot8.num2
			}, cc.p(1, 0))
		end

		idlereasy.when(slot0.battle_times, slot4)

		uv4 = "progressBarSign"

		slot0.buffSeleLv:update(slot4)
		idlereasy.any({
			slot0.buff_choice,
			slot0.bossID
		}, function (slot0, slot1, slot2)
			uv3 = "buffsChoiceClient"

			slot3.buffsChoiceClient:set(slot1[slot2] or {})
		end)
		idlereasy.any({
			slot0.buff_field,
			slot0.buffsChoiceClient,
			slot0.bossID
		}, function (slot0, slot1, slot2, slot3)
			uv4 = "progressBarData"
			slot4.progressBarData = {}
			slot4 = csv.mimicry.base[1]
			slot5 = {}
			slot6 = pairs

			for slot9, slot10 in slot6(slot2 or {}) do
				uv11 = "progressBarData"

				if slot11.buffCsv[slot10] then
					uv11 = "progressBarData"

					if not slot5[slot11.buffCsv[slot10].quality] then
						slot5[slot11] = {}
					end

					slot12 = table.insert
					slot13 = slot5[slot11]

					slot12(slot13, slot10)

					uv12 = "progressBarData"
					slot12 = slot12.progressBarData
					uv13 = "progressBarData"
					slot12[slot11] = slot13.progressBarData[slot11] or {}
					uv12 = "progressBarData"

					if not slot12.progressBarData[slot11][slot10] then
						uv12 = "progressBarData"
						uv13 = "progressBarData"
						slot12.progressBarData[slot11][slot10] = slot13.buffCsv[slot10].level
					end
				end
			end

			uv6 = "progressBarData"
			slot6 = slot6.progressBarSign
			slot7 = slot6

			slot6.notify(slot7)

			uv7 = "csv"

			for slot9 = 1, slot7 do
				slot10 = 1
				slot11 = slot4[string.format("quality%sBuffFieldNum", slot9)]
				slot12 = {}
				slot13 = 0

				if slot1[slot3] then
					slot13 = slot1[slot3][slot9] or 0
				end

				for slot17 = 1, slot11 do
					table.insert(slot12, {
						id = slot5[slot9] and slot5[slot9][slot10],
						lock = slot13 < slot17,
						quality = slot9,
						num = slot5[slot9] and #slot5[slot9] or 0
					})

					slot10 = slot10 + 1
				end

				uv14 = "progressBarData"

				slot14[string.format("buffSelectData%s", slot9)]:update(slot12)
			end

			for slot10, slot11 in pairs(slot2) do
				-- Nothing
			end

			uv7 = "progressBarData"
			slot7.buffSelectSever = {
				[slot11] = slot10
			}
			uv7 = "progressBarData"
			slot7 = slot7.txtBuffNum
			slot7 = slot7.text
			slot12 = slot2
			uv12 = "progressBarData"

			slot7(slot7, string.format("%s/%s", itertools.size(slot12), slot12.allBuffSlot))

			uv7 = "progressBarData"

			slot7.bossName:text(csv.mimicry.boss[slot3].gateName)
		end)
		slot0:maxQualitybuffShow()
		idlereasy.any({
			slot0.bossID,
			slot0.buffQuality
		}, function (slot0, slot1, slot2)
			uv4 = "dataEasy"
			slot4 = slot4.buffList

			dataEasy.tryCallFunc(slot4, "filterSortItems")

			slot3 = false
			uv4 = "dataEasy"

			for slot7, slot8 in slot4.buffDatas:ipairs() do
				slot10 = slot8
				slot9 = slot8.read(slot10).bossID
				uv10 = "dataEasy"

				if slot10.buffQuality:read() == slot8:read().quality and (slot9 == slot1 or slot9 == 0) then
					slot3 = true

					break
				end
			end

			uv4 = "dataEasy"
			slot4 = slot4.panelNobuff
			slot4 = slot4.setVisible

			slot4(slot4, not slot3)

			uv4 = "dataEasy"

			slot4.buffShow:set(0)
		end)
		idlereasy.when(slot0.buffShow, function (slot0, slot1)
			uv2 = "buffCsv"
			uv3 = "buffCsv"
			slot3 = slot3.buffLeftPanel:get("buffDescPanel")

			slot3:setVisible(slot1 and slot1 ~= 0)

			slot4 = not slot1 or slot1 == 0 or not slot2.buffCsv[slot1]
			slot5 = slot3.setVisible

			slot5(slot3, not slot4)

			uv5 = "buffCsv"

			slot5.buffLeftPanel:get("txtNo"):setVisible(slot4)

			if slot4 then
				return
			end

			slot3:get("buffName"):text(slot2.name)

			slot7 = "buffName"
			uv7 = "buffLeftPanel"

			slot3:get(slot7):setTextColor(slot7[slot2.quality])
			slot3:get("buffIcon"):texture(slot2.icon1)
			slot3:get("buffPoint"):text(slot2.basicScores)
			slot3:get("buffLevel"):text(slot2.level)
			adapt.oneLinePos(slot3:get("txt1"), slot3:get("buffPoint"))
			adapt.oneLinePos(slot3:get("txt2"), slot3:get("buffLevel"))
			slot3:get("buffDesc"):removeAllChildren()
			beauty.textScroll({
				isRich = true,
				list = slot3:get("buffDesc"),
				strs = "#C0xFFFCED#" .. slot2.desc
			})
		end)
	end,
	maxQualitybuffShow = function (slot0)
		slot2 = userDefault.getForeverLocalKey("mimicryRoleBuff", nil)
		slot5 = {}
		slot8 = false
		slot9 = false

		for slot14, slot15 in ipairs(slot0.buffs:read() or {}) do
			slot16 = slot0.buffCsv[slot15]
			slot16.isNew = not (userDefault.getForeverLocalKey("mimicryNewBuffs", nil) or {})[slot15]
			slot16.key = slot14

			table.insert(slot5, slot16)

			if slot2 and not slot2[slot15] or not slot2 then
				slot9 = true
				slot10 = math.max(slot16.quality, 1)

				if slot0.buffCsv[slot15].tips ~= 0 then
					table.insert({}, slot0.buffCsv[slot15])

					slot8 = true
				end
			end
		end

		userDefault.setForeverLocalKey("mimicryRoleBuff", {
			[slot15] = true
		})

		function slot11()
			if not gGameUI.guideManagerLocal:checkFinished(4) then
				uv2 = "gGameUI"

				performWithDelay(slot2, function ()
					gGameUI.guideManagerLocal:checkGuide({
						specialName = "mimicryNewBuff"
					})
				end, 0.2)
			end
		end

		slot0.buffDatas:update(slot5)

		if not slot2 or slot8 then
			if slot8 and slot0.battle then
				performWithDelay(slot0, function ()
					uv6 = "gGameUI"
					uv6 = "stackUI"

					gGameUI:stackUI("city.adventure.mimicry.buff_show", nil, , {
						showBuffData = slot6,
						cb = slot6
					})
				end, 0)
			elseif slot9 and slot0.battle then
				slot11()
			end
		elseif slot9 and slot0.battle then
			slot11()
		end

		slot0.buffQuality:set(slot10)
		slot0.describe:get("score"):text(slot0.total_scores:read()[slot0.bossData:at(slot0.showTab:read()):read().csvId] or 0)
		slot0.describe:get("max"):text(slot0.history_scores:read()[slot14] or 0)
		adapt.oneLinePos(slot0.describe:get("maxTitle"), slot0.describe:get("max"), cc.p(2, 0))
		adapt.oneLinePos(slot0.describe:get("scoreTitle"), slot0.describe:get("score"), cc.p(2, 0))
	end,
	buffSchedule = function (slot0, slot1)
		slot3 = 0

		for slot7, slot8 in ipairs(slot0.buff_field:read()[slot0.bossID:read()] or {}) do
			if slot8 > 0 then
				for slot12 = 1, slot8 do
					slot3 = slot3 + gMimicryBuffsCsv[slot7][slot12]
				end
			end
		end

		slot0.bg:get("panel.mask"):width(900 * (slot3 == 0 and 0 or slot1 / slot3))
		slot0.bg:get("panel.lv"):text(gLanguageCsv.textLv .. slot1)
	end,
	changeBuffQuality = function (slot0, slot1, slot2, slot3)
		slot0.buffQuality:set(slot2)
	end,
	onMarkerClick = function (slot0, slot1, slot2, slot3)
		for slot8, slot9 in slot0[string.format("buffSelectData%s", slot3.quality)]:ipairs() do
			if slot9:read().id == slot3.id then
				slot0.buffSelectSever[slot3.id] = nil
				slot0.upBuff = false

				slot0.buffsChoiceClient:set(itertools.keys(slot0.buffSelectSever))
				slot0:onBuffClick(slot1, slot2, slot3)

				return
			end
		end

		for slot8, slot9 in slot4:ipairs() do
			if slot9:read().lock then
				break
			end

			if not slot9:read().id then
				slot0.upBuff = true
				slot10 = itertools.keys(slot0.buffSelectSever)

				table.insert(slot10, slot3.id)
				slot0.buffsChoiceClient:set(slot10)
				slot0:onBuffClick(slot1, slot2, slot3)

				return
			end
		end

		slot6 = nil

		for slot10, slot11 in orderCsvPairs(csv.mimicry.buff_field) do
			if slot3.quality == slot11.quality and slot11.scoresCondition > (slot0.total_scores:read()[slot0.bossID:read()] or 0) then
				slot6 = slot6 and math.min(slot11.scoresCondition, slot6) or slot11.scoresCondition
			end
		end

		if slot6 then
			gGameUI:showTip(string.format(gLanguageCsv.mimicryBuffUnlockTip, tostring(slot6)))
		else
			gGameUI:showTip(gLanguageCsv.mimicryBuffNumMax)
		end
	end,
	onBuffClick = function (slot0, slot1, slot2, slot3)
		slot0.buffShow:set(slot3.id)

		slot0.buffDatas:atproxy(slot3.key).isNew = false

		userDefault.setForeverLocalKey("mimicryNewBuffs", {
			[slot3.id] = true
		})
	end,
	onFilterBuffs = function (slot0, slot1)
		slot2 = slot0.buffQuality:read()

		return function (slot0, slot1)
			if slot1.bossID ~= 0 then
				uv3 = "bossID"

				if slot1.bossID ~= slot3.bossID:read() then
					return false
				end
			end

			uv3 = "read"

			return slot1.quality == slot3, slot0
		end
	end,
	onSortBuffs = function (slot0, slot1)
		return function (slot0, slot1)
			if slot0.isNew == slot1.isNew then
				return slot0.id < slot1.id
			end

			return slot0.isNew
		end
	end,
	onBuffLvListItem = function (slot0, slot1, slot2, slot3, slot4, slot5)
		idlereasy.any({
			slot0.buffsChoiceClient,
			slot0.bossID,
			slot0.buffDatas
		}, function (slot0, slot1, slot2, slot3)
			uv4 = "date"

			if slot4.date.round == "start" then
				slot4 = 0
				slot6 = pairs

				for slot9, slot10 in slot6(slot1 or {}) do
					uv11 = "date"

					if slot11.buffCsv[slot10] then
						uv11 = "date"
						uv12 = "round"

						if slot11.buffCsv[slot10].quality == slot12.quality then
							slot5 = 0 + 1
						end
					end
				end

				uv6 = "date"

				for slot9, slot10 in slot6.buffDatas:ipairs() do
					slot12 = slot10
					uv12 = "round"

					if slot10.read(slot12).quality == slot12.quality and (slot10:read().bossID == slot2 or slot10:read().bossID == 0) then
						slot4 = slot4 + 1
					end
				end

				uv6 = "start"

				slot6:get("buffLvTxt"):text(string.format("%s/%s", tostring(slot5), tostring(slot4)))
			end
		end):anonyOnly(slot2, slot4)
		idlereasy.when(slot0.buffQuality, function (slot0, slot1)
			uv2 = "date"

			if slot2.date.round == "start" then
				uv2 = "round"
				slot4 = "iconSelect"
				uv4 = "start"

				slot2:get(slot4):setVisible(slot1 == slot4.quality)
			end
		end):anonyOnly(slot2, slot4)
		slot3:get("buffLvIcon"):texture(slot5.icon)
		bind.touch(slot2, slot3, {
			methods = {
				ended = functools.partial(function (slot0)
					uv1 = "buffQuality"

					slot1.buffQuality:set(slot0)
				end, slot4)
			}
		})
	end,
	onBuffSelectCell = function (slot0, slot1, slot2, slot3, slot4, slot5)
		slot6 = ""

		if slot5.lock or not slot5.id then
			slot6 = "city/adventure/mimicry/log_ntdz_hui.png"
		else
			uv7 = ""
			slot6 = slot7[slot5.quality].log

			if slot4 == slot5.num and slot0.upBuff and slot0.buffQuality:read() == slot5.quality then
				slot0.upBuff = false

				widget.addAnimation(slot3, "mimicry/dxfk.skel", "dxfk", 20):xy(slot3:size().width / 2, slot3:size().height / 2):scale(2)
			end
		end

		slot3:get("rightBuffIcon"):texture(slot6)
		slot3:get("lock"):scale(0.28)
		slot3:get("lock"):visible(slot5.lock)
	end,
	requestForTest = function (slot0, slot1, slot2, slot3)
		slot4 = tonumber(slot0.battleNum) or 1
		slot5, slot6 = slot0:getTestData()
		slot7 = {}

		function slot8(slot0)
			uv3 = "battleEntrance"
			slot3 = slot3.bossID
			slot4 = slot3
			uv4 = "battleRequest"
			uv5 = "/game/mimicry/battle/start"
			uv7 = "bossID"

			battleEntrance.battleRequest("/game/mimicry/battle/start", slot3.read(slot4), slot4, slot5, 1, slot7):onStartOK(function (slot0)
			end):onResult(function (slot0, slot1)
				slot3 = slot1.serverData.view.boss_scores or 0
				slot4 = slot2.buff_scores or 0
				uv6 = "serverData"
				uv7 = "view"
				uv9 = "boss_scores"
				uv10 = "view"
				slot6[slot7] = {
					bossScores = slot3,
					buffScores = slot4,
					sum = slot3 + slot4,
					buff = slot9[slot10]
				}
				uv6 = "buff_scores"
				uv7 = "view"

				if slot7 < slot6 then
					uv10 = "bossScores"
					slot10 = slot10.bossID
					slot11 = slot10
					uv11 = "buffScores"
					uv12 = "view"

					gGameApp:requestServer("/game/mimicry/deploy/buff", function ()
						error("Decompilation failed")
						-- Exception in function building!
						-- Traceback (most recent call last):
						-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
						--     return _build_function_definition(prototype, state.header)
						--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
						-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
						--     node.statements.contents = _build_function_blocks(state, instructions)
						--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
						-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
						--     statement, line_marked_elements = _build_statement(state, addr, instruction)
						--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
						-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
						--     return _build_var_assignment(state, addr, instruction)
						--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
						-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
						--     assn = func(*args, **kwargs)
						--            ^^^^^^^^^^^^^^^^^^^^^
						-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
						--     expression = _build_const_expression(state, addr, instruction)
						--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
						-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
						--     return _build_string_constant(state, instruction.CD)
						--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
						-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
						--     node.value = state.constants.complex_constants[index]
						--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
						-- IndexError: list index out of range
					end, slot10.read(slot11), slot11[slot12 + 1])
				else
					slot6 = 0
					uv8 = "serverData"
					slot8 = slot8[1].sum
					uv12 = "serverData"

					for slot14, slot15 in ipairs(slot12) do
						slot10 = 0 + slot15.sum
						slot7 = slot15.sum < math.max(slot6, slot15.sum) and 0 or slot14
						slot9 = math.min(slot8, slot15.sum) < slot15.sum and 0 or slot14

						print("-----------------------------------------------------------------------------------------")
						print(string.format("第%s次挑战", slot14))
						print(string.format("boss分数：%s ", slot15.bossScores))
						print(string.format("buff分数：%s ", slot15.buffScores))
						print(string.format("总分数：%s ", slot15.sum))
						print("使用buff")
						print_r(slot15.buff)
					end

					print("-----------------------------------------------------------------------------------------")
					print(string.format("最高分为%s,第%s次挑战", slot6, slot7))

					slot14 = slot8

					print(string.format("最低分为%s,第%s次挑战", slot14, slot9))

					uv14 = "serverData"

					print(string.format("平均分为%s", slot10 / #slot14))

					return false
				end
			end):run()
		end

		gGameApp:requestServer("/game/mimicry/deploy/buff", function ()
			error("Decompilation failed")
			-- Exception in function building!
			-- Traceback (most recent call last):
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
			--     return _build_function_definition(prototype, state.header)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
			--     node.statements.contents = _build_function_blocks(state, instructions)
			--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
			--     statement, line_marked_elements = _build_statement(state, addr, instruction)
			--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
			--     return _build_var_assignment(state, addr, instruction)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
			--     assn = func(*args, **kwargs)
			--            ^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
			--     expression = _build_const_expression(state, addr, instruction)
			--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
			--     return _build_string_constant(state, instruction.CD)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
			--     node.value = state.constants.complex_constants[index]
			--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
			-- IndexError: list index out of range
		end, slot0.bossID:read(), slot6[1])
	end,
	getTestData = function (slot0)
		slot1 = slot0.battleNum or 1
		slot2 = slot0.buff_field:read()[slot0.bossID:read()]
		slot3 = {}
		slot4 = {}

		for slot8, slot9 in orderCsvPairs(csv.mimicry.buffs) do
			if not slot4[slot9.quality] then
				slot4[slot9.quality] = {}
			end

			table.insert(slot4[slot9.quality], slot9)
		end

		function slot5(slot0)
			if type(slot0) ~= "table" then
				return
			end

			slot1 = {}
			slot2 = 1

			while #slot0 ~= 0 do
				if slot0[math.random(1, #slot0)] ~= nil then
					slot1[slot2] = slot0[slot3]

					table.remove(slot0, slot3)

					slot2 = slot2 + 1
				end
			end

			return slot1
		end

		for slot9 = 1, tonumber(slot1) or 1 do
			if not slot3[slot9] then
				slot3[slot9] = {}
			end

			for slot13, slot14 in pairs(slot4) do
				if not slot3[slot9][slot13] then
					slot3[slot9][slot13] = {}
				end

				for slot21, slot22 in pairs(slot5(clone(slot14))) do
					if slot2[slot13] <= #slot3[slot9][slot13] then
						break
					end

					if not slot22.bossID or slot22.bossID == 0 or slot22.bossID == slot0.bossID:read() then
						table.insert(slot3[slot9][slot13], slot22.id)
					end
				end
			end
		end

		slot6 = {}

		for slot10, slot11 in ipairs(slot3) do
			if not slot6[slot10] then
				slot6[slot10] = {}
			end

			for slot15, slot16 in pairs(slot11) do
				for slot20, slot21 in pairs(slot16) do
					table.insert(slot6[slot10], slot21)
				end
			end
		end

		return slot3, slot6
	end,
	fightCb = function (slot0, slot1, slot2, slot3, slot4, slot5)
		slot7 = {
			[slot12] = slot13.card_id
		}
		slot8 = {
			[slot13.card_id] = slot13.skin_id
		}

		for slot12, slot13 in pairs(slot2) do
			if slot13 then
				if slot13.skin_id ~= 0 then
					-- Nothing
				end
			end
		end

		if not slot4 then
			battleEntrance.battleRequest("/game/mimicry/battle/start", slot0.bossID:read(), slot0:findCsvID(slot7), slot8, nil, slot3):onStartOK(function (slot0)
				slot2 = "mimicryBattleCard"
				slot1 = userDefault.getForeverLocalKey(slot2, {})
				uv2 = "userDefault"
				uv4 = "getForeverLocalKey"
				uv4 = "mimicryBattleCard"
				slot1[slot2.bossID:read()] = {
					cards = slot4,
					skins = slot4
				}
				slot2 = userDefault.setForeverLocalKey

				slot2("mimicryBattleCard", slot1, {
					new = true
				})

				uv2 = "bossID"

				if slot2 then
					uv2 = "bossID"

					slot2:onClose(false)

					uv3 = nil
				end
			end):show()
		else
			slot10 = {}
			slot11 = nil
			slot12 = slot0.history_scores:read()[slot0.bossID:read()] or 0
			slot13 = 0
			slot14 = {}

			function slot15(slot0)
				uv3 = "battleEntrance"
				slot3 = slot3.bossID
				slot4 = slot3
				uv4 = "battleRequest"
				uv5 = "/game/mimicry/battle/start"
				uv7 = "bossID"

				battleEntrance.battleRequest("/game/mimicry/battle/start", slot3.read(slot4), slot4, slot5, 1, slot7):onStartOK(function (slot0)
				end):onResult(function ()
					error("Decompilation failed")
					-- Exception in function building!
					-- Traceback (most recent call last):
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
					--     return _build_function_definition(prototype, state.header)
					--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
					--     node.statements.contents = _build_function_blocks(state, instructions)
					--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
					--     statement, line_marked_elements = _build_statement(state, addr, instruction)
					--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
					--     return _build_var_assignment(state, addr, instruction)
					--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
					--     assn = func(*args, **kwargs)
					--            ^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
					--     expression = _build_const_expression(state, addr, instruction)
					--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 834, in _build_const_expression
					--     return _build_numeric_constant(state, instruction.CD)
					--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1027, in _build_numeric_constant
					--     number = state.constants.numeric_constants[index]
					--              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
					-- IndexError: list index out of range
				end):run()
			end

			if slot0.testBtn and EDITOR_ENABLE then
				slot0:requestForTest(slot9, slot8, slot3)
			else
				slot15(1)
			end
		end
	end,
	onSweepReward = function (slot0, slot1, slot2, slot3)
		gGameUI:stackUI("city.gate.sweep", nil, , {
			showType = 2,
			from = "gate",
			type = "mimicry",
			hasExtra = false,
			isDouble = false,
			sweepData = slot1,
			oldRoleLv = slot0.roleLv:read(),
			startGateId = csv.mimicry.boss[slot0.bossID:read()].gateID,
			oldCapture = gGameModel.capture:read("limit_sprites"),
			scaors = slot2,
			newNum = slot3,
			cb = function ()
				uv0 = "maxQualitybuffShow"

				slot0:maxQualitybuffShow()
			end
		})
	end,
	onBtnBattle = function (slot0, slot1)
		if slot0.battle_times:read() <= 0 then
			gGameUI:showTip(gLanguageCsv.todayChanllengeToMuch)

			return
		end

		slot0:saveBuffs(function ()
			slot6 = game.EMBATTLE_FROM_TABLE.mimicry
			uv6 = "gGameUI"
			slot6 = slot6:createHandler("fightCb")
			uv6 = "gGameUI"
			slot6 = slot6.bossID
			slot7 = slot6
			slot6 = slot6.read(slot7)
			uv6 = "stackUI"
			uv6 = "gGameUI"
			uv7 = "gGameUI"

			gGameUI:stackUI("city.adventure.mimicry.embattle", nil, {
				full = true
			}, {
				from = slot6,
				fightCb = slot6,
				bossID = slot6,
				isQuick = slot6,
				limitID = slot6.date.bosses[slot7.bossID:read()]
			})
		end)
	end,
	onBtnReword = function (slot0)
		if itertools.isempty(slot0.buffsChoiceClient:read()) then
			gGameUI:showTip(gLanguageCsv.noBuffsEquip)

			return
		end

		slot0.buffsChoiceClient:set({})
		gGameUI:showTip(gLanguageCsv.resetSuccess)
	end,
	onBtnBuffDesc = function (slot0)
		uv3 = "string"

		for slot5 = 1, slot3 do
			slot6 = {}

			for slot11, slot12 in slot0[string.format("buffSelectData%s", slot5)]:ipairs() do
				if slot12:read().id then
					table.insert(slot1[slot5], {
						id = slot12:read().id
					})
				end
			end
		end

		gGameUI:stackUI("city.adventure.mimicry.mimicry_additions", nil, , {
			[slot5] = {}
		}, slot0.buff_field:read(), slot0.bossID:read())
	end,
	findCsvID = function (slot0, slot1)
		slot2 = {}

		for slot6, slot7 in csvMapPairs(csv.mimicry.cards) do
			for slot11, slot12 in pairs(slot1) do
				if slot12 == slot7.cardID then
					slot2[slot11] = slot7.id
				end
			end
		end

		return slot2
	end,
	saveBuffs = function (slot0, slot1)
		gGameApp:requestServer("/game/mimicry/deploy/buff", function ()
			error("Decompilation failed")
			-- Exception in function building!
			-- Traceback (most recent call last):
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
			--     return _build_function_definition(prototype, state.header)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
			--     node.statements.contents = _build_function_blocks(state, instructions)
			--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
			--     statement, line_marked_elements = _build_statement(state, addr, instruction)
			--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
			--     return _build_var_assignment(state, addr, instruction)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
			--     assn = func(*args, **kwargs)
			--            ^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
			--     expression = _build_const_expression(state, addr, instruction)
			--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
			--     return _build_string_constant(state, instruction.CD)
			--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
			--     node.value = state.constants.complex_constants[index]
			--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
			-- IndexError: list index out of range
		end, slot0.bossID:read(), slot0.buffsChoiceClient:read())
	end
}

return function (slot0)
	uv2 = "pairs"

	for slot4, slot5 in pairs(slot2) do
		slot0[slot4] = slot5
	end
end
