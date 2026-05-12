slot1 = class("RandomTowerSelectEventView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "random_tower_select_event.json"
slot1.RESOURCE_BINDING = {
	textTitle = "textTitle",
	item = "item",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "listview",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("eventDatas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("textOrder", "textDesc")

					slot4.textOrder:text(slot2)
					slot4.textDesc:text(slot3.name)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2, slot3)
	slot0.cb = slot2
	slot0.boardID = slot1

	slot0:initModel()

	if slot3 then
		slot0.type = "jump"
		slot0.eventId = slot3
	else
		slot0.type = "common"
		slot0.eventId = slot0.roomInfo:read().event[slot1]
	end

	slot0.textTitle:text(csv.random_tower.event[slot0.eventId].desc)

	if matchLanguage({
		"kr",
		"en"
	}) then
		slot0.textTitle:x(display.sizeInView.width / 2)
		adapt.setTextAdaptWithSize(slot0.textTitle, {
			size = cc.size(1900, 150)
		})
	end

	slot5 = {}

	for slot9 = 1, 3 do
		if slot4["choice" .. slot9] ~= "" then
			table.insert(slot5, {
				key = slot9,
				name = slot4["choice" .. slot9]
			})
		end
	end

	slot0.eventDatas = slot5
end

function slot1.initModel(slot0)
	slot0.roomInfo = gGameModel.random_tower:getIdler("room_info")
end

function slot1.onItemClick(slot0, slot1, slot2, slot3)
	if slot0.type == "jump" then
		gGameApp:requestServerCustom("/game/random_tower/jump/event"):params(slot0.boardID, "choice" .. slot3.key):onResponse(function ()
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
		end):wait({
			false
		}):doit(function (slot0)
			uv1 = "eventId"
			uv2 = "onClose"
			uv3 = "eventId"

			slot2.onClose(slot3)

			uv8 = "gGameUI"

			gGameUI:stackUI("city.adventure.random_tower.event_reward", nil, {
				clickClose = true
			}, {
				eventId = slot1.eventId,
				tb = slot0,
				choiceID = slot8.key,
				cb = function ()
				end
			})
		end)

		return
	end

	gGameApp:requestServerCustom("/game/random_tower/event/choose"):params("choice" .. slot3.key):onResponse(function ()
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
	end):wait({
		false
	}):doit(function (slot0)
		uv1 = "eventId"
		uv2 = "eventId"
		uv3 = "cb"
		uv4 = "eventId"

		slot3.onClose(slot4)

		uv9 = "onClose"

		gGameUI:stackUI("city.adventure.random_tower.event_reward", nil, {
			clickClose = true
		}, {
			eventId = slot1.eventId,
			tb = slot0,
			choiceID = slot9.key,
			cb = slot2.cb
		})
	end)
end

return slot1
