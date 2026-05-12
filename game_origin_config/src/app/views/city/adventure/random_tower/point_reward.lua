function slot0(slot0, slot1)
	slot0:setTouchEnabled(slot1)
	cache.setShader(slot0, false, slot1 and "normal" or "hsl_gray")

	if slot1 then
		text.addEffect(slot0:get("textNote"), {
			glow = {
				color = ui.COLORS.GLOW.WHITE
			}
		})
	else
		text.deleteAllEffect(slot0:get("textNote"))
		text.addEffect(slot0:get("textNote"), {
			color = ui.COLORS.DISABLED.WHITE
		})
	end
end

slot1 = class("RandomTowerPointRewardView", Dialog)
slot1.RESOURCE_FILENAME = "random_tower_point_reward.json"
slot1.RESOURCE_BINDING = {
	["down.textScore"] = "textScore",
	item = "item",
	["down.list"] = "downList",
	["down.textNote"] = "textNote",
	["title.textTitle1"] = "textTitle1",
	["title.textTitle2"] = "textTitle2",
	item1 = "item1",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["down.btnGet"] = {
		varname = "getBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					return slot0:onGetBtn(-1)
				end)
			}
		}
	},
	["down.btnGet.textNote"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 4,
				data = bindHelper.self("pointDatas"),
				item = bindHelper.self("item"),
				dataOrderCmpGen = bindHelper.self("onSortCards", true),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:multiget("textScore", "btnGet", "icon", "list", "imgReceived").textScore:text(slot3.point)

					if next(slot3.award) ~= nil then
						uiEasy.createItemsToList(slot0, slot4.list, slot3.award, {
							scale = 1
						})
					end

					slot4.imgReceived:visible(slot3.canReceive == 0)
					slot4.btnGet:visible(slot3.canReceive ~= 0)
					bind.touch(slot0, slot4.btnGet, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})

					uv5 = "multiget"

					slot5(slot4.btnGet, slot3.canReceive == 1)
				end
			},
			handlers = {
				clickCell = bindHelper.self("onitemClick")
			}
		}
	}
}

function slot1.onCreate(slot0)
	slot0:initModel()

	slot0.pointDatas = idlers.new()
	slot3 = {}
	slot4 = {}
	slot0.saveGetAward = userDefault.getForeverLocalKey("saveGetAward", {})
	slot4 = userDefault.getForeverLocalKey("isGetAward", {})

	idlereasy.any({
		slot0.resultPointAward,
		slot0.pointAwardVersion
	}, function ()
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

	if userDefault.getForeverLocalKey("awardState", {}) and slot5.isOpen or slot4 and slot4.isOpen then
		if false and true then
			gGameUI:showDialog({
				btnType = 2,
				title = gLanguageCsv.tips,
				content = gLanguageCsv.etherIntegral,
				cb = function ()
				end
			})
			userDefault.setForeverLocalKey("isGetAward", {
				isOpen = true
			})
		else
			userDefault.setForeverLocalKey("isGetAward", {})
		end

		slot0.saveGetAward = slot3
	end

	if slot5 and slot5.isOpen then
		userDefault.setForeverLocalKey("awardState", {})
	end

	slot0.textScore:text(math.floor(slot0.dayPoint:read() + slot0.history_point:read() * 0.08))
	adapt.oneLinePos(slot0.textScore, slot0.textNote, cc.p(20, 0), "left")
	adapt.oneLinePos(slot0.textTitle1, slot0.textTitle2, nil, "left")
	Dialog.onCreate(slot0)
end

function slot1.initModel(slot0)
	slot0.resultPointAward = gGameModel.random_tower:getIdler("point_award")
	slot0.dayPoint = gGameModel.random_tower:getIdler("day_point")
	slot0.history_point = gGameModel.random_tower:getIdler("history_point")
	slot0.pointAwardVersion = gGameModel.random_tower:getIdler("point_award_version")
end

function slot1.onitemClick(slot0, slot1, slot2, slot3)
	slot0:onGetBtn(slot3.id)
end

function slot1.onGetBtn(slot0, slot1)
	gGameApp:requestServerCustom("/game/random_tower/point/award"):params(slot1):onErrClose(function (slot0)
		if slot0.err ~= "randomTowerPointAwardVersionChange" then
			return false
		end

		gGameApp:requestServerCustom("/game/random_tower/prepare", function (slot0)
			if slot0.view.updata then
				gGameUI:showDialog({
					btnType = 2,
					title = gLanguageCsv.tips,
					content = gLanguageCsv.randomTowerPointAwardVersionChange,
					cb = function ()
					end
				})
			end
		end)
	end):onResponse(function ()
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
		gGameUI:showGainDisplay(slot0)
		userDefault.setForeverLocalKey("isGetAward", {})
	end)

	if slot1 == -1 then
		slot0.saveGetAward = {}
	else
		slot0.saveGetAward[slot1] = false
	end
end

function slot1.onClose(slot0)
	userDefault.setForeverLocalKey("saveGetAward", slot0.saveGetAward)
	Dialog.onClose(slot0)
end

function slot1.onSortCards(slot0, slot1)
	return function (slot0, slot1)
		if slot0.canReceive ~= slot1.canReceive then
			return slot1.canReceive < slot0.canReceive
		end

		return slot0.id < slot1.id
	end
end

return slot1
