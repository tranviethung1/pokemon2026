slot0 = {
	CAN_NOT_GOTTEN = 2,
	CAN_GOTTEN = 1,
	GOTTEN = 0
}
slot1 = {
	[202.0] = false,
	[204.0] = false
}

function slot2(slot0, slot1, slot2)
	slot0:setTouchEnabled(slot2)
	cache.setShader(slot0, false, slot1 and "normal" or "hsl_gray")

	if slot1 then
		text.addEffect(slot0:get("txt"), {
			glow = {
				color = ui.COLORS.GLOW.WHITE
			}
		})
	else
		text.deleteAllEffect(slot0:get("txt"))
		text.addEffect(slot0:get("txt"), {
			color = ui.COLORS.DISABLED.WHITE
		})
	end
end

function slot3(slot0, slot1, slot2, slot3)
	slot4 = slot1:multiget("txtRank", "btnGet", "list", "achvDesc", "txt")

	slot4.txt:text(slot3.title)
	adapt.setTextAdaptWithSize(slot4.txt, {
		maxLine = 2,
		vertical = "center",
		horizontal = "center",
		size = cc.size(300, 70)
	})
	slot4.txtRank:text(slot3.targetArg)

	if next(slot3.award) ~= nil then
		uiEasy.createItemsToList(slot0, slot4.list, slot3.award, {
			scale = 0.9,
			margin = 20
		})
	end

	bind.touch(slot0, slot4.btnGet, {
		methods = {
			ended = functools.partial(slot0.clickCell, slot3.csvId, slot3.get)
		}
	})

	slot6 = slot4.btnGet:get("txt")
	slot6 = slot6.text
	uv9 = "multiget"

	slot6(slot6, slot3.get == slot9.GOTTEN and gLanguageCsv.received or (slot3.times < slot3.targetArg and string.format("%s/%s", slot3.times, slot3.targetArg) or gLanguageCsv.spaceReceive))

	uv6 = "txtRank"
	uv9 = "multiget"

	slot6(slot4.btnGet, slot3.get == slot9.CAN_GOTTEN, true)
end

slot4 = class("VolleyballRewardView", Dialog)
slot4.RESOURCE_FILENAME = "volleyball_reward.json"
slot4.RESOURCE_BINDING = {
	["rewardPanel1.rankItem"] = "rankItem1",
	rewardPanel2 = "rewardPanel2",
	["rewardPanel2.rankItem"] = "rankItem2",
	["leftPanel.tabItem"] = "tabItem",
	rewardPanel1 = "rewardPanel1",
	["topPanel.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["leftPanel.tabList"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("tabDatas"),
				item = bindHelper.self("tabItem"),
				showTab = bindHelper.self("showTab"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()

						slot6 = slot1:get("selected"):show()
					else
						slot5:hide()

						slot6 = slot4:show()
					end

					if slot3.redHint then
						bind.extend(slot0, slot1, {
							class = "red_hint",
							props = {
								state = slot0.showTab:read() ~= slot2,
								specialTag = slot3.redHint,
								listenData = {
									id = slot3.id
								},
								onNode = function (slot0)
									uv3 = "xy"
									slot4 = slot3
									uv4 = "xy"

									slot0:xy(slot3.width(slot4) - 10, slot4:height() - 5)
								end
							}
						})
					end

					slot6:get("txt"):text(slot3.name)
					slot5:setTouchEnabled(false)
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onTabClick")
			}
		}
	},
	["rewardPanel1.btnAllGet"] = {
		varname = "getBtn1",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					gGameApp:requestServer("/game/yy/award/get/onekey", function (slot0)
						gGameUI:showGainDisplay(slot0)
					end, slot0.activityId)
				end)
			}
		}
	},
	["rewardPanel1.btnAllGet.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["rewardPanel1.list"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 5,
				days = bindHelper.self("days"),
				data = bindHelper.self("pointDatas1"),
				item = bindHelper.self("rankItem1"),
				dataOrderCmpGen = bindHelper.self("onSortCards", true),
				itemAction = {
					isAction = true
				},
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
			},
			handlers = {
				clickCell = bindHelper.self("onGetBtn")
			}
		}
	},
	["rewardPanel2.list"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 5,
				points = bindHelper.self("points"),
				data = bindHelper.self("pointDatas2"),
				item = bindHelper.self("rankItem2"),
				itemAction = {
					isAction = true
				},
				dataOrderCmpGen = bindHelper.self("onSortCards", true),
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
			},
			handlers = {
				clickCell = bindHelper.self("onGetBtn")
			}
		}
	},
	["rewardPanel2.btnAllGet"] = {
		varname = "getBtn2",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					gGameApp:requestServer("/game/yy/award/get/onekey", function (slot0)
						gGameUI:showGainDisplay(slot0)
					end, slot0.activityId)
				end)
			}
		}
	},
	["rewardPanel2.btnAllGet.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	}
}

function slot4.onCreate(slot0, slot1)
	slot0.activityId = slot1

	slot0.rewardPanel1:show()
	slot0.rewardPanel2:hide()
	slot0:initModel()

	slot0.showTab = idler.new(1)

	slot0.showTab:addListener(function (slot0, slot1)
		uv2 = "tabDatas"
		slot2 = slot2.tabDatas:atproxy(slot1)
		slot2.select = false
		uv2 = "tabDatas"
		slot2 = slot2.tabDatas:atproxy(slot0)
		slot2.select = true
		uv2 = "tabDatas"

		if slot2["rewardPanel" .. slot1] then
			uv2 = "tabDatas"

			slot2["rewardPanel" .. slot1]:hide()
		end

		uv2 = "tabDatas"

		slot2["rewardPanel" .. slot0]:show()
	end)
	Dialog.onCreate(slot0)
end

function slot4.initModel(slot0)
	slot0.pointDatas1 = idlers.new()
	slot0.pointDatas2 = idlers.new()
	slot0.tabDatas = idlers.newWithMap({
		{
			redHint = "volleyballDailyCheck",
			name = gLanguageCsv.dailyReward,
			id = slot0.activityId
		},
		{
			redHint = "volleyballAwarding",
			name = gLanguageCsv.volleyballAchievementAward,
			id = slot0.activityId
		}
	})
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "activityId"
		slot2 = slot1[slot2.activityId] or {}
		slot3 = {}
		slot4 = {}
		slot5 = false
		slot6 = false
		uv8 = "activityId"

		for slot12, slot13 in csvPairs(csv.yunying.volleyball_tasks) do
			if slot13.huodongID == csv.yunying.yyhuodong[slot8.activityId].huodongID then
				table.shallowcopy(slot13).csvId = slot12
				slot16 = slot2.valsums or {}
				slot17 = slot2.valsums1 or {}
				slot14.get = (slot2.stamps or {})[slot12]

				if slot14.targetArg2 ~= 0 then
					slot14.times = slot17[slot14.targetType] and slot17[slot14.targetType][slot14.targetArg2] or 0
				else
					slot14.times = slot16[slot14.targetType] or 0
				end

				if slot14.get == 1 and slot13.type == 1 then
					slot5 = true
				elseif slot14.get == 1 and slot13.type == 2 then
					slot6 = true
				end

				if slot13.type == 1 then
					table.insert(slot3, slot14)
				else
					table.insert(slot4, slot14)
				end
			end
		end

		uv9 = "activityId"
		slot9 = slot9.pointDatas1
		slot9 = slot9.update

		slot9(slot9, slot3)

		uv9 = "activityId"
		slot9 = slot9.pointDatas2
		slot10 = slot9
		slot9 = slot9.update

		slot9(slot10, slot4)

		uv9 = "csv"
		uv10 = "activityId"
		slot10 = slot10.getBtn1

		slot9(slot10, slot5, slot5)

		uv9 = "csv"
		uv10 = "activityId"

		slot9(slot10.getBtn2, slot6, slot6)
	end)
end

function slot4.onTabClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

function slot4.onGetBtn(slot0, slot1, slot2, slot3)
	uv4 = "CAN_GOTTEN"

	if slot3 == slot4.CAN_GOTTEN then
		gGameApp:requestServer("/game/yy/award/get", function (slot0)
			gGameUI:showGainDisplay(slot0)
		end, slot0.activityId, slot2)
	else
		uv4 = "CAN_GOTTEN"

		if slot3 == slot4.GOTTEN then
			gGameUI:showTip(gLanguageCsv.taskClosed)
		else
			gGameUI:showTip(gLanguageCsv.taskUnFinished)
		end
	end
end

function slot4.onSortCards(slot0, slot1)
	return function (slot0, slot1)
		if (slot0.get or 0.5) ~= (slot1.get or 0.5) then
			return slot3 < slot2
		end

		return slot0.csvId < slot1.csvId
	end
end

return slot4
