slot0 = cc.load("mvc").ViewBase
slot1 = class("ActivityLightingNewYearAnswerDialog", Dialog)
slot2 = {
	"A",
	"B",
	"C"
}
slot1.RESOURCE_FILENAME = "lighting_new_year_answer.json"
slot1.RESOURCE_BINDING = {
	name = "panelName",
	item = "item1",
	mask = "mask",
	num = "num",
	title = "title",
	lantern1 = "lantern1",
	text = "panelText",
	tabName = "tabName",
	icon = "icon",
	lantern2 = "lantern2",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "answerList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("answerData"),
				item = bindHelper.self("item1"),
				onItem = function (slot0, slot1, slot2, slot3)
					if slot3.iconSelect == 0 then
						slot1:get("icon"):hide()
					else
						slot1:get("icon"):show()
						slot1:get("icon"):texture("activity/lighting_new_year/pop_up/" .. (slot3.iconSelect == 2 and "logo_dg" or "logo_cw") .. ".png")
					end

					slot1:get("title"):text(slot3.desc)

					slot6 = "rank"
					uv6 = "iconSelect"

					slot1:get(slot6):text(slot6[slot2])
					slot1:get("bg"):texture("activity/lighting_new_year/pop_up/" .. (slot3.select and "btn_xz" or "btn_wxz") .. ".png")
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCellItem, slot1, slot2, slot3)
						}
					})
				end,
				onAfterBuild = function (slot0)
					slot0:setScrollBarEnabled(false)
				end
			},
			handlers = {
				clickCellItem = bindHelper.self("onItemClick")
			}
		}
	},
	confirmBtn = {
		varname = "confirmBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("confirmTopic")
			}
		}
	},
	nextQuestion = {
		varname = "nextQuestion",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onNextQuestion")
			}
		}
	},
	["confirmBtn.title"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["nextQuestion.title"] = {
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

function slot1.onCreate(slot0, slot1, slot2)
	slot0.cb = slot2
	slot0.activityId = slot1.huodongId
	slot0.answerData = idlers.new()
	slot0.answerIdx = idler.new(0)

	slot0.answerIdx:addListener(function (slot0, slot1)
		if slot1 ~= slot0 then
			uv2 = "answerData"

			for slot5, slot6 in slot2.answerData:ipairs() do
				slot6:proxy().select = slot5 == slot0
			end
		end
	end)
	slot0:initModel()
	slot0:ctorData(csv.yunying.yyhuodong[slot0.activityId].huodongID)
	slot0:initData()
	slot0.panelName:text(gLanguageCsv.lightingNewYearRiddles)
	Dialog.onCreate(slot0, {
		blackType = 1,
		clearFast = true,
		clickClose = true
	})
end

function slot1.initModel(slot0)
	slot0.yyData = gGameModel.role:read("yyhuodongs")[slot0.activityId]
end

function slot1.ctorData(slot0, slot1)
	slot2 = {}

	for slot8, slot9 in orderCsvPairs(csv.yunying.lighting_new_year) do
		if slot1 == slot9.huodongID then
			if nil ~= slot9.day then
				slot4 = 1
				slot3 = slot9.day
			end

			slot2[slot8] = slot4
			slot4 = slot4 + 1
		end
	end

	slot0.lightingData = slot2
end

function slot1.initData(slot0)
	slot0.mask:hide()

	slot0.csvId = dataEasy.getLightingNewYearCsvId(slot0.activityId)
	slot1 = csv.yunying.lighting_new_year[slot0.csvId]

	slot0.panelText:text(slot1.question)
	slot0.tabName:text(slot1.name)
	slot0.tabName:getVirtualRenderer():setLineSpacing(35)
	slot0.nextQuestion:hide()
	slot0.confirmBtn:show()
	uiEasy.setBtnShader(slot0.confirmBtn, false, 2)

	if slot1.day == 16 then
		slot0.num:text("(1/1)")
		slot0.confirmBtn:get("title"):text(gLanguageCsv.reward)
	else
		slot0.num:text("(" .. slot0.lightingData[slot0.csvId] .. "/2" .. ")")
	end

	slot2 = {}

	for slot6 = 1, math.huge do
		if slot1["answer" .. slot6] and slot1["answer" .. slot6] ~= "" then
			table.insert(slot2, {
				iconSelect = 0,
				select = false,
				desc = slot1["answer" .. slot6],
				day = slot1.day,
				rightAnswer = slot1.rightAnswer,
				idx = slot6
			})
		else
			break
		end
	end

	slot0.answerIdx:set(0)
	slot0.answerData:update(random.shuffle(slot2))
end

function slot1.onItemClick(slot0, slot1, slot2, slot3, slot4)
	slot0.selectAnlwer = slot4
	slot0.item = slot2

	uiEasy.setBtnShader(slot0.confirmBtn, false, 1)
	slot0.answerIdx:set(slot3)
end

function slot1.confirmTopic(slot0)
	if not slot0.selectAnlwer then
		return
	end

	slot1 = slot0.selectAnlwer

	gGameApp:requestServer("/game/yy/lighting_new_year/answer", function (slot0)
		uv1 = "mask"
		slot1 = slot1.mask
		slot2 = slot1
		slot1 = slot1.show

		slot1(slot2)

		uv1 = "show"
		uv2 = "show"

		if slot1.idx ~= slot2.rightAnswer then
			uv1 = "show"

			if slot1.day == 16 then
				uv1 = "mask"
				slot1 = slot1.answerIdx
				slot2 = slot1
				uv2 = "mask"
				slot2.answerData:atproxy(slot1.read(slot2)).iconSelect = 2
			else
				uv1 = "mask"
				slot1 = slot1.answerIdx
				slot2 = slot1
				uv2 = "mask"
				slot2 = slot2.answerData:atproxy(slot1.read(slot2))
				slot2.iconSelect = 1
				uv2 = "mask"

				for slot5, slot6 in slot2.answerData:pairs() do
					slot7 = slot6:proxy()

					if slot7.idx == slot7.rightAnswer then
						slot7.iconSelect = 2
					end
				end
			end
		end

		if slot0.view.result and itertools.size(slot0.view.result) > 0 then
			uv2 = "mask"

			if csv.yunying.lighting_new_year[slot2.csvId].day == 16 then
				uv1 = "mask"
				slot1.award = slot0

				gGameUI:showGainDisplay(slot0, {
					cb = function ()
						uv1 = "uiEasy"

						uiEasy.setBtnShader(slot1.confirmBtn, false, 2)
					end
				})
			else
				uv1 = "mask"
				slot1.award = slot0
				uv1 = "mask"
				slot1 = slot1.confirmBtn
				slot1 = slot1.hide

				slot1(slot1)

				uv1 = "mask"
				slot1 = slot1.nextQuestion
				slot1 = slot1.hide

				slot1(slot1)

				uv1 = "mask"
				slot1 = slot1.title
				slot1 = slot1.show

				slot1(slot1)

				uv1 = "mask"

				slot1.title:text(gLanguageCsv.lightingNewYearAward)
			end
		else
			uv1 = "mask"
			slot1 = slot1.nextQuestion
			slot1 = slot1.show

			slot1(slot1)

			uv1 = "mask"

			slot1.confirmBtn:hide()
		end
	end, slot0.activityId, slot1.day, slot0.csvId, slot1.idx)
end

function slot1.onNextQuestion(slot0)
	slot0:initData()
end

function slot1.onClose(slot0)
	if slot0.award and csv.yunying.lighting_new_year[slot0.csvId].day ~= 16 then
		slot2 = slot0.award
		slot3 = slot0.cb
		slot4 = slot0.csvId

		slot0:addCallbackOnExit(function ()
			uv2 = "gGameUI"

			gGameUI:showGainDisplay(slot2, {
				cb = function ()
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
			})
		end)
		Dialog.onClose(slot0)

		return
	end

	if slot0.cb then
		slot2 = nil

		if slot0.award and slot1.day == 16 then
			slot2 = slot0.csvId
		end

		slot0:addCallbackOnExit(functools.partial(slot0.cb, slot2))
	end

	Dialog.onClose(slot0)
end

return slot1
