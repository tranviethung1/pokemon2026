slot1 = class("AutoChessAchievementView", cc.load("mvc").ViewBase)
slot2 = require("app.views.city.adventure.auto_chess.tools")
slot1.RESOURCE_FILENAME = "auto_chess_achievement.json"
slot1.RESOURCE_BINDING = {
	["leftPanel.leftItem"] = "leftItem",
	["rightPanel.infoPanel.progress"] = "progressBar",
	["rightPanel.item"] = "item",
	["rightPanel.txtTips"] = "txtTips",
	["rightPanel.infoPanel"] = "infoPanel",
	["leftPanel.leftList"] = {
		varname = "leftList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("leftDatas"),
				item = bindHelper.self("leftItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("btnNormal"):hide()

						slot6 = slot1:get("btnSelected"):show()
					else
						slot5:hide()
						slot4:show():get("textNote1"):text(slot3.subName)
					end

					if matchLanguageForce({
						"en",
						"en_us",
						"en_eu"
					}) then
						slot1:get("normal"):get("textNote1"):hide()
						slot1:get("normal"):get("textNote"):y(slot1:height() / 2 - 2)
					end

					slot6:get("textNote"):text(slot3.name)
					slot5:setTouchEnabled(false)
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onLeftItemClick")
			}
		}
	},
	["rightPanel.infoPanel.info.textLv"] = {
		binds = {
			event = "effect",
			data = {
				shadow = {
					size = 4,
					color = cc.c4b(100, 100, 100, 255),
					offset = cc.size(0, -12)
				}
			}
		}
	},
	["rightPanel.infoPanel.info.textPro"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(97, 89, 89, 255)
				}
			}
		}
	},
	["rightPanel.infoPanel.box"] = {
		varname = "btnAward",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onAwardClick")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "autoChessAchievement",
					onNode = function (slot0)
						slot0:xy(140, 100)
					end
				}
			}
		}
	},
	["rightPanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("rightData"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("textCount", "textNote1", "textNote2", "textPro", "imgGot", "textHide")

					slot4.imgGot:visible(slot3.isCompleted)
					slot4.textPro:visible(not slot3.isCompleted)
					slot4.textPro:text(slot3.count .. "/" .. slot3.target)
					slot4.textCount:text(slot3.point)
					slot4.textNote1:text(slot3.name)
					slot4.textNote2:text(slot3.desc)
					slot4.textHide:visible(slot3.isHide)
					adapt.oneLinePos(slot4.textNote1, slot4.textHide, cc.p(0, 0))
				end
			}
		}
	}
}

function slot1.onCreate(slot0)
	slot5 = {
		onClose = slot6
	}
	slot6 = slot0:createHandler("onClose")

	gGameUI.topuiManager:createView("auto_chess", slot0, slot5):init({
		subTitle = "ACHIEVEMENT",
		title = gLanguageCsv.achievement
	})
	slot0:initModel()

	slot1 = {}

	for slot5, slot6 in orderCsvPairs(csv.auto_chess.achievement_type) do
		table.insert(slot1, {
			id = slot5,
			name = slot6.name,
			subName = slot6.subName
		})
	end

	slot0.leftDatas = idlers.newWithMap(slot1)
	slot0.showTab = idler.new(1)
	slot0.rightData = idlers.newWithMap({})

	slot0.showTab:addListener(function (slot0, slot1)
		uv2 = "leftDatas"
		slot2 = slot2.leftDatas:atproxy(slot1)
		slot2.select = false
		uv2 = "leftDatas"
		slot2 = slot2.leftDatas:atproxy(slot0)
		slot2.select = true
		uv2 = "leftDatas"

		slot2:initData()
	end)
	idlereasy.any({
		slot0.achievementAward
	}, function (slot0, slot1)
		uv2 = "initData"

		slot2:initData()
	end)
	slot0:playProgressAni()
end

function slot1.onLeftItemClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

function slot1.initModel(slot0)
	slot0.achievementExp = gGameModel.auto_chess:getIdler("achievement_points")
	slot0.achievementAward = gGameModel.auto_chess:getIdler("achievement_box_awards")
	slot0.achievementTasks = gGameModel.auto_chess:getIdler("achievement_tasks")
	slot0.achievementCounter = gGameModel.auto_chess:getIdler("achievement_counter")
end

function slot1.initData(slot0)
	slot1 = {}
	slot4 = slot0.achievementCounter:read()

	for slot9, slot10 in orderCsvPairs(csv.auto_chess.achievement_task) do
		slot11 = slot0.achievementTasks:read()[slot9] and true or false

		if slot10.type == slot0.leftDatas:atproxy(slot0.showTab:read()).id then
			slot12 = 0

			if slot4[slot9] then
				slot12 = slot4[slot9]
			end

			if slot11 or not slot10.isHidden then
				table.insert(slot1, {
					id = slot9,
					name = slot10.name,
					desc = slot10.desc,
					point = slot10.point,
					target = slot10.targetArg,
					isCompleted = slot11,
					count = slot12,
					isHide = slot10.isHidden
				})
			end
		end
	end

	table.sort(slot1, function (slot0, slot1)
		if slot0.isCompleted ~= slot1.isCompleted then
			return slot0.isCompleted == false
		end

		return slot0.id < slot1.id
	end)
	slot0.rightData:update(slot1)

	slot0.canGetAward = false

	for slot10, slot11 in pairs(slot0.achievementAward:read() or {}) do
		if slot11 == 1 then
			slot0.canGetAward = true
		end
	end

	slot0.btnAward:removeChildByName("effect")

	if slot0.canGetAward then
		widget.addAnimation(slot0.btnAward, "effect/jiedianjiangli.skel", "effect_loop", -1):xy(slot0.btnAward:width() / 2, slot0.btnAward:height() / 2 - 40):scale(0.6):name("effect")
	end

	slot0.txtTips:parent():removeChildByName("achievementTips")

	slot7, slot8, slot9 = slot0:getTabTaskCounts(slot2)

	slot0.txtTips:hide()
	rich.createByStr(string.format(gLanguageCsv.autoChessAchievementTips, slot7, slot8, slot9), 40):addTo(slot0.txtTips:parent(), 10, "achievementTips"):anchorPoint(cc.p(1, 0.5)):xy(slot0.txtTips:xy())
end

function slot1.onAwardClick(slot0)
	if slot0.canGetAward then
		gGameApp:requestServer("/game/auto_chess/achievement/award/get", function (slot0)
			gGameUI:showGainDisplay(slot0)
		end)
	else
		gGameUI:stackUI("city.adventure.auto_chess.achievement_reward", nil, {
			clickClose = true,
			blackLayer = true
		})
	end
end

function slot1.getTabTaskCounts(slot0, slot1)
	slot3 = 0
	slot4 = 0
	slot6 = 0

	for slot11, slot12 in orderCsvPairs(csv.auto_chess.achievement_task) do
		slot13 = slot0.achievementTasks:read()[slot11] and true or false

		if slot12.type == slot0.leftDatas:atproxy(slot1).id then
			if slot12.isHidden then
				slot5 = 0 + 1
			end

			slot3 = slot3 + 1

			if slot13 then
				slot4 = slot4 + 1

				if slot12.isHidden then
					slot6 = slot6 + 1
				end
			end
		end
	end

	return slot4, slot3, slot5 - slot6
end

function slot1.playProgressAni(slot0)
	slot2 = "autoChessAchievementPoint"
	slot1 = userDefault.getForeverLocalKey(slot2)
	uv2 = "userDefault"
	slot2, slot3, slot4 = slot2.getAchievementLevel(slot1)
	slot5 = transition.executeSequence(slot0.progressBar, true):func(function ()
		uv2 = "math"
		uv3 = "min"
		slot1 = math.floor(slot2 / slot3 * 100)
		uv1 = "floor"
		slot1 = slot1.progressBar
		slot1 = slot1.setPercent

		slot1(slot1, math.min(slot1, 100))

		uv1 = "floor"
		slot3 = "textRate"
		slot1 = slot1.infoPanel:get(slot3)
		slot1 = slot1.text
		uv3 = "math"
		uv5 = "min"

		slot1(slot1, slot3 .. "/" .. slot5)

		uv1 = "floor"
		slot3 = "info.textLv"
		uv3 = "progressBar"

		slot1.infoPanel:get(slot3):text(slot3)
	end)

	if slot1 == slot0.achievementExp:read() then
		slot5:done()

		return
	end

	uv6 = "userDefault"
	slot6, slot7, slot8 = slot6.getAchievementLevel()
	slot12 = slot2 == slot6 and slot7 or slot4

	slot5:delay(0.5):func(function ()
		uv0 = "infoPanel"
		slot2 = "textRate"
		slot0 = slot0.infoPanel:get(slot2)
		slot1 = slot0
		uv2 = "get"
		uv4 = "textRate"

		slot0.text(slot1, slot2 .. "/" .. slot4)

		slot0 = 0
		uv1 = "infoPanel"

		slot1.infoPanel:scheduleUpdate(function ()
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
	end):progressTo(0.3, slot2 == slot6 and math.min(math.floor(slot7 / slot8 * 100), 100) or 100):func(function ()
		uv0 = "infoPanel"
		slot2 = "textRate"
		uv2 = "get"
		uv4 = "textRate"

		slot0.infoPanel:get(slot2):text(slot2 .. "/" .. slot4)
	end)

	if slot2 ~= slot6 then
		slot5:func(function ()
			uv0 = "progressBar"
			slot0 = slot0.progressBar
			slot1 = slot0
			uv1 = "progressBar"
			slot1 = slot1.progressBar:size()

			if not slot0.get(slot1, "effect") then
				uv3 = "progressBar"
				slot0 = widget.addAnimationByKey(slot3.progressBar, "effect/shengjitiao.skel", "effect", "effect", 10):xy(slot1.width / 2 + 0, slot1.height / 2 + 0):scale(1):scaleX(1.35)
			else
				slot0:play("effect")
			end
		end):delay(0.5):func(function ()
			uv0 = "progressBar"
			slot0 = slot0.progressBar
			slot0 = slot0.setPercent

			slot0(slot0, 0)

			uv0 = "progressBar"
			slot2 = "info.textLv"
			slot0 = slot0.infoPanel:get(slot2)
			slot0 = slot0.text
			uv2 = "setPercent"

			slot0(slot0, slot2)

			uv0 = "progressBar"
			slot0 = slot0.infoPanel:get("textRate")
			slot1 = slot0
			uv4 = "infoPanel"

			slot0.text(slot1, 0 .. "/" .. slot4)

			slot0 = 0
			uv1 = "progressBar"
			slot1 = slot1.infoPanel
			slot1 = slot1.unscheduleUpdate

			slot1(slot1)

			uv1 = "progressBar"

			slot1.infoPanel:scheduleUpdate(function ()
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
		end):progressTo(slot9, math.floor(slot7 / slot8 * 100)):func(function ()
			uv0 = "infoPanel"
			slot2 = "textRate"
			uv2 = "get"
			uv4 = "textRate"

			slot0.infoPanel:get(slot2):text(slot2 .. "/" .. slot4)
		end)
	end

	slot5:done()
	userDefault.setForeverLocalKey("autoChessAchievementPoint", slot0.achievementExp:read())
end

function slot1.isLevelUp(slot0, slot1)
	slot2 = slot1
	slot4 = 0

	for slot8, slot9 in pairs(gAutoChessAchievementLevelCsv) do
		if slot9.point <= slot2 then
			slot3 = 0 + 1
			slot2 = slot2 - slot9.point
		else
			slot4 = slot9.point

			break
		end
	end

	uv5 = "pairs"
	slot5, slot6, slot7 = slot5.getAchievementLevel()

	return slot3 < slot5, slot3, slot2, slot4
end

function slot1.onClose(slot0)
	uv1 = "onClose"

	slot1.onClose(slot0)
end

return slot1
