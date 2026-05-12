slot0 = {
	days = 1,
	times = 2
}
slot1 = {
	finished = 2,
	goJump = 1
}
slot2 = class("ReunionCatchUpView", cc.load("mvc").ViewBase)
slot2.RESOURCE_FILENAME = "reunion_catch.json"
slot2.RESOURCE_BINDING = {
	item = "item",
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 3,
				data = bindHelper.self("datas"),
				item = bindHelper.self("item"),
				dataOrderCmp = function (slot0, slot1)
					return slot0.csvId < slot1.csvId
				end,
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot9 = "label1"
					uv9 = "cfg"

					slot1:multiget("list", "title", slot9, "time", "bodyList", "remarkList", "goPanel", "completed").completed:visible(slot3.state == slot9.finished)

					uv9 = "cfg"

					slot5.goPanel:visible(slot3.state == slot9.goJump)

					if slot3.cfg.goto == "" then
						slot5.goPanel:visible(false)
					end

					bind.touch(slot0, slot5.goPanel, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot4.goto)
						}
					})

					slot6 = slot5.title
					slot7 = slot6

					slot6.text(slot7, slot4.title)

					uv7 = "multiget"

					if slot4.addType == slot7.days then
						slot5.label1:text(gLanguageCsv.reunionCatchUpCutdown)

						slot7 = slot3.finishTimes
						uv7 = "list"

						slot7.setCountdown(slot0, time.getNumTimestamp(slot7, time.getRefreshHour()), slot5.time, slot5.completed, slot5.goPanel, {
							tag = slot2,
							v = slot3
						})
					else
						uv7 = "multiget"

						if slot4.addType == slot7.times then
							slot5.label1:text(gLanguageCsv.reunionCatchUpTimes)
							slot5.time:text(string.format(gLanguageCsv.reunionCatchUpText, slot4.addNum, slot3.finishTimes))
						end
					end

					beauty.textScroll({
						fontSize = 36,
						list = slot5.bodyList,
						strs = slot4.desc
					})
					beauty.textScroll({
						fontSize = 36,
						verticalSpace = 10,
						isRich = true,
						list = slot5.remarkList,
						strs = "#C0xFF5B545B#" .. slot4.remark
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onJumpTo")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	slot2 = csv.yunying.yyhuodong[slot1]

	slot0:initModel()

	slot0.datas = idlers.new()

	idlereasy.when(slot0.reunion, function (slot0, slot1)
		slot2 = slot1.catchup or {}
		slot3 = {}

		for slot7, slot8 in csvPairs(csv.yunying.reunion_catchup) do
			uv10 = "catchup"

			if slot8.huodongID == slot10.huodongID then
				uv9 = "csvPairs"
				slot9 = slot9.goJump
				slot10 = 0
				uv12 = "csv"

				if slot8.addType == slot12.times and slot2[slot7] then
					if slot8.addNum <= slot2[slot7] then
						uv11 = "csvPairs"
						slot9 = slot11.finished
					end

					slot10 = slot2[slot7]
				else
					uv12 = "csv"

					if slot8.addType == slot12.days then
						if tonumber(time.getStrInClock(math.floor(slot1.info.reunion_time))) + slot8.addNum <= tonumber(time.getTodayStrInClock()) then
							uv13 = "csvPairs"
							slot9 = slot13.finished
						end

						slot10 = slot11
					end
				end

				table.insert(slot3, {
					csvId = slot7,
					cfg = slot8,
					state = slot9,
					finishTimes = slot10
				})
			end
		end

		uv4 = "yunying"

		slot4.datas:update(slot3)
	end)
end

function slot2.initModel(slot0)
	slot0.reunion = gGameModel.role:getIdler("reunion")
end

function slot2.onJumpTo(slot0, slot1, slot2)
	if slot2 ~= "" then
		jumpEasy.jumpTo(slot2)
	end
end

function slot2.setCountdown(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = (slot5 or {}).tag or 1

	slot0:enableSchedule():unSchedule(slot6)
	bind.extend(slot0, slot2, {
		class = "cutdown_label",
		props = {
			endTime = slot1,
			tag = slot6,
			strFunc = function (slot0)
				return slot0.str
			end,
			callFunc = function ()
			end,
			endFunc = function ()
				uv0 = "finishTimes"
				uv1 = "finishTimes"
				uv0 = 86400
				uv0 = "v"

				if time.getTime() < slot0.v.finishTimes + slot1.v.cfg.addNum * 86400 then
					uv1 = "cfg"

					performWithDelay(slot1, function ()
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
					end, 1)
				else
					uv0 = "time"
					slot0 = slot0.text

					slot0(slot0, gLanguageCsv.activityOver)

					uv0 = "getTime"
					slot0 = slot0.visible

					slot0(slot0, true)

					uv0 = "performWithDelay"

					slot0:visible(false)
				end
			end,
			onNode = function (slot0)
			end
		}
	})
end

return slot2
