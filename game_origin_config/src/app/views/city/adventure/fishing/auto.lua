slot1 = class("AutoFishingView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "fishing_auto.json"
slot1.RESOURCE_BINDING = {
	btnCancel = "btnCancel",
	fish = "autoFish",
	["award.item"] = "awardItem",
	btnFinish = "btnFinish",
	["fish.item"] = "fishItem",
	["fish.list"] = {
		varname = "fishList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("autoFishCfg"),
				item = bindHelper.self("fishItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						event = "extend",
						class = "fish_icon",
						props = {
							onNodeClick = true,
							data = {
								key = slot2,
								num = slot3
							},
							onNode = function (slot0)
								slot0:xy(10, 10)
							end
						}
					})
				end
			}
		}
	},
	["award.list"] = {
		varname = "awardList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("autoAwardCfg"),
				item = bindHelper.self("awardItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					if slot3.key == "id" then
						slot4 = csv.cards[slot3.val].unitID

						bind.extend(slot0, slot1, {
							class = "card_icon",
							props = {
								unitId = slot4,
								rarity = csv.unit[slot4].rarity,
								star = csv.cards[slot3.val].star
							}
						})
						bind.touch(slot0, slot1, {
							methods = {
								ended = functools.partial(slot0.itemClick, slot1, slot2, slot3)
							}
						})
					else
						bind.extend(slot0, slot1, {
							class = "icon_key",
							props = {
								data = {
									key = slot3.key,
									num = slot3.val
								}
							}
						})
					end
				end
			},
			handlers = {
				itemClick = bindHelper.self("onitemClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0:initModel()

	slot0.autoFishCfg = idlertable.new({})
	slot0.autoAwardCfg = idlers.newWithMap({})

	slot0:enableSchedule()
	slot0:schedule(function ()
		gGameApp:requestServer("/game/fishing/main")
	end, gCommonConfigCsv.fishingAutoDuration + 1, 0, 6)
	idlereasy.any({
		slot0.autoStopped,
		slot0.autoAward,
		slot0.autoWinCounter,
		slot0.autoFailCounter
	}, function (slot0, slot1, slot2, slot3, slot4)
		slot5 = {}
		uv6 = "autoFish"
		slot6 = slot6.autoFish:get("txt2")
		slot6 = slot6.text

		slot6(slot6, slot3 + slot4)

		uv6 = "autoFish"
		slot6 = slot6.autoFish:get("txt4")
		slot6 = slot6.text

		slot6(slot6, slot3)

		uv6 = "autoFish"
		slot6 = slot6.autoFish:get("txt6")
		slot7 = slot6

		slot6.text(slot7, slot4)

		uv7 = "autoFish"
		slot9 = "txt1"
		uv9 = "autoFish"
		slot9 = slot9.autoFish:get("txt2")
		uv9 = "autoFish"
		slot9 = slot9.autoFish:get("txt3")
		uv9 = "autoFish"
		slot9 = slot9.autoFish:get("txt4")
		uv9 = "autoFish"
		slot9 = slot9.autoFish:get("txt5")
		uv9 = "autoFish"
		slot9 = slot9.autoFish:get("txt6")
		uv9 = "autoFish"

		adapt.oneLinePos(slot7.autoFish:get(slot9), {
			slot9,
			slot9,
			slot9,
			slot9,
			slot9,
			slot9.autoFish:get("txt7")
		}, cc.p(5, 0), "left")

		if slot2.fish ~= nil then
			uv6 = "autoFish"

			slot6.autoFishCfg:set(slot2.fish)
		end

		if slot2.type1 then
			for slot9, slot10 in pairs(slot2.type1) do
				table.insert(slot5, {
					key = slot9,
					val = slot10
				})
			end
		end

		if slot2.type2 then
			for slot9, slot10 in pairs(slot2.type2) do
				table.insert(slot5, {
					key = slot9,
					val = slot10
				})
			end
		end

		if slot2.cards then
			for slot9, slot10 in pairs(slot2.cards) do
				table.insert(slot5, {
					key = "id",
					val = slot10.id
				})
			end
		end

		uv6 = "autoFish"

		slot6.autoAwardCfg:update(slot5)
	end)
	bind.touch(slot0, slot0.btnCancel, {
		methods = {
			ended = function ()
				uv0 = "enableSchedule"
				slot0 = slot0:enableSchedule()
				slot0 = slot0.unSchedule

				slot0(slot0, 6)

				uv0 = "enableSchedule"

				slot0:onClose()
			end
		}
	})
	bind.touch(slot0, slot0.btnFinish, {
		methods = {
			ended = function ()
				gGameApp:requestServer("/game/fishing/auto/end", function ()
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
				end)
			end
		}
	})
end

function slot1.onitemClick(slot0, slot1, slot2, slot3, slot4)
	gGameUI:showItemDetail(slot2, {
		key = "card",
		num = slot4.val
	})
end

function slot1.initModel(slot0)
	slot0.autoStopped = gGameModel.fishing:getIdler("auto_stopped")
	slot0.autoAward = gGameModel.fishing:getIdler("auto_award")
	slot0.autoWinCounter = gGameModel.fishing:getIdler("auto_win_counter")
	slot0.autoFailCounter = gGameModel.fishing:getIdler("auto_fail_counter")
end

return slot1
