function slot0(slot0, slot1, slot2, slot3)
	bind.extend(slot0, slot1, {
		class = "listview",
		props = {
			data = slot3,
			item = slot0.itemCell,
			onItem = function (slot0, slot1, slot2, slot3)
				slot4 = slot1:multiget("textName", "textVal")

				slot4.textName:text(gLanguageCsv[slot3.items[1]])
				slot4.textVal:text(slot3.items[2] .. "%")
				adapt.oneLinePos(slot4.textName, slot4.textVal, cc.p(10, 0), "left")
			end
		}
	})
end

slot1 = class("GemDrawPreview", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "gem_preview.json"
slot1.RESOURCE_BINDING = {
	item21 = "itemDwonChildCell",
	item = "item",
	item2 = "itemDwonCell",
	item1 = "itemUpCell",
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 6,
				data = bindHelper.self("showData"),
				item = bindHelper.self("item"),
				itemUpCell = bindHelper.self("itemUpCell"),
				itemDwonCell = bindHelper.self("itemDwonCell"),
				itemDwonChildCell = bindHelper.self("itemDwonChildCell"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("upList", "downList")

					if slot3[1].key then
						slot4.downList:visible(false)
						slot4.upList:visible(true)
						slot1:size(cc.size(slot0:size().width, slot4.upList:size().height))
						bind.extend(slot0, slot4.upList, {
							class = "listview",
							props = {
								data = slot3,
								item = slot0.itemUpCell,
								onItem = function (slot0, slot1, slot2, slot3)
									bind.extend(slot0, slot1, {
										class = "icon_key",
										props = {
											data = {
												key = slot3.key
											},
											specialKey = {
												leftTopLv = 1
											}
										}
									})

									if slot3.info == 2 then
										cc.Sprite:create("city/drawcard/draw/txt_up.png"):addTo(slot1):xy(cc.p(slot1:size().width - 40, slot1:size().height - 17)):z(5)
									end
								end
							}
						})
					else
						slot4.downList:visible(true)
						slot4.upList:visible(false)
						bind.extend(slot0, slot4.downList:get("list"), {
							class = "listview",
							props = {
								data = slot3,
								item = slot0.itemDwonCell,
								itemCell = slot0.itemDwonChildCell,
								onItem = function ()
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
								end
							}
						})
					end
				end
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.showData = idlers.new()
	slot2 = 1
	slot3 = {}
	slot4 = {}
	slot5 = csv.gem.gem
	slot7 = {
		[slot12] = true
	}

	for slot11, slot12 in ipairs(csv.yunying.yyhuodong[slot1].clientParam.up) do
		-- Nothing
	end

	for slot13, slot14 in ipairs(csv.draw_preview[csv.yunying.yyhuodong[slot1].clientParam.priviewId].item) do
		slot2 = 1

		if slot5[slot14].suitID and slot7[slot15] then
			slot2 = 2
		end

		if slot3[slot2] == nil then
			slot3[slot2] = {}
		end

		table.insert(slot3[slot2], {
			key = slot14,
			quality = dataEasy.getCfgByKey(slot14).quality,
			info = slot2
		})
	end

	for slot14, slot15 in pairs(slot3) do
		function (slot0)
			table.sort(slot0, function (slot0, slot1)
				if slot0.quality ~= slot1.quality then
					return slot1.quality < slot0.quality
				end

				return slot0.key < slot1.key
			end)
		end(slot15)
	end

	slot11 = slot0:setStructData(slot3)

	if slot9.desc and csvSize(slot9.desc) then
		for slot15, slot16 in ipairs(slot9.desc) do
			table.insert(slot4, {
				type = "desc",
				items = slot16
			})
		end
	end

	table.insert(slot11, slot0:setStructEscData(slot4))
	slot0.showData:update(slot11)
end

function slot1.setStructData(slot0, slot1)
	slot2 = {}
	slot3 = 1
	slot4 = {}

	for slot8, slot9 in pairs(slot1) do
		for slot13, slot14 in pairs(slot9) do
			if slot3 % 9 == 1 then
				if slot3 > 9 then
					table.insert(slot2, slot4)
				end

				slot4 = {}
			end

			table.insert(slot4, slot14)

			slot3 = slot3 + 1
		end
	end

	if #slot4 > 0 then
		table.insert(slot2, slot4)
	end

	return slot2
end

function slot1.setStructEscData(slot0, slot1)
	slot3 = 1
	slot4 = {}

	for slot8, slot9 in pairs(slot1) do
		if slot3 % 4 == 1 then
			if slot3 > 4 then
				table.insert({}, slot4)
			end

			slot4 = {}
		end

		table.insert(slot4, slot9)

		slot3 = slot3 + 1
	end

	if #slot4 > 0 then
		table.insert(slot2, slot4)
	end

	return slot2
end

return slot1
