slot1 = class("QixiFindBirdGameView", cc.load("mvc").ViewBase)
slot2 = {
	{
		row = 3,
		column = 3,
		aimSize = 3
	},
	{
		row = 3,
		column = 4,
		aimSize = 3
	},
	{
		row = 3,
		column = 4,
		aimSize = 4
	},
	{
		row = 3,
		column = 5,
		aimSize = 4
	},
	{
		row = 3,
		column = 5,
		aimSize = 5
	},
	{
		row = 4,
		column = 5,
		aimSize = 5
	},
	{
		row = 4,
		column = 6,
		aimSize = 5
	}
}
slot3 = {
	"qixiGame",
	"qixiGame1",
	"qixiGame2"
}
slot4 = 3
slot5 = "activity/qixi/qixi_bird_%s.png"
slot1.RESOURCE_FILENAME = "qixi_find_bird_game.json"
slot1.RESOURCE_BINDING = {
	item = "item",
	sublist = "subList",
	topPanel = "topPanel",
	listview = "list",
	["leftPanel.time"] = "time",
	handItem = "handItem",
	startPanel = "startPanel",
	["leftPanel.icon"] = "icon",
	["topPanel.topList"] = {
		varname = "topList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("aimData"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot8 = "rightIcon"
					slot4 = slot1:multiget("icon", "errorPanel", slot8, "bg")
					uv8 = "multiget"

					slot4.icon:texture(string.format(slot8, slot3.idx))
					slot4.icon:opacity(slot3.isSel and 100 or 255)
					slot1:setCascadeOpacityEnabled(true)
					slot4.rightIcon:visible(slot3.isSel)
					slot4.bg:hide()
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			}
		}
	},
	["leftPanel.list"] = {
		varname = "leftList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("handData"),
				item = bindHelper.self("handItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("error"):visible(slot3.isError)
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			}
		}
	},
	["startPanel.tip"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 13,
					color = cc.c3b(255, 253, 240)
				}
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0.activityId = slot1
	slot0.isGameGuide = slot2

	slot0:enableSchedule()
	slot0:initModel()
	slot0.startPanel:setCascadeOpacityEnabled(true)
	slot0.topPanel:setCascadeOpacityEnabled(true)
	slot0.list:setCascadeOpacityEnabled(true)
	slot0.topList:setCascadeOpacityEnabled(true)
	slot0:startGame()
	slot0:onPlay()
end

function slot1.initModel(slot0)
	slot0.boxData = idlers.newWithMap({})
	slot0.handData = idlers.newWithMap({})
	slot1 = {}
	uv3 = "boxData"

	for slot5 = 1, slot3 do
		table.insert(slot1, {
			isError = false
		})
	end

	slot0.handData:update(slot1)

	slot0.aimData = idlers.new()
	slot0.gateCount = 1
	slot0.columnSize = slot0:getGateData().column
	slot0.cutDownTime = csv.yunying.yyhuodong[slot0.activityId].paramMap.qixiGameTimeLimit or 90
end

function slot1.updateTableView(slot0)
	slot0.list:setTouchEnabled(false)
	bind.extend(slot0, slot0.list, {
		class = "tableview",
		props = {
			asyncPreload = 24,
			data = bindHelper.self("boxData"),
			columnSize = bindHelper.self("columnSize"),
			item = bindHelper.self("subList"),
			cell = bindHelper.self("item"),
			onCell = function (slot0, slot1, slot2, slot3)
				slot8 = "rightIcon"
				slot4 = slot1:multiget("icon", "errorPanel", slot8)
				uv8 = "multiget"

				slot4.icon:texture(string.format(slot8, slot3.idx))
				slot4.icon:opacity(slot3.isSel and 100 or 255)
				slot4.rightIcon:visible(slot3.isSel)
				slot0:setCascadeOpacityEnabled(true)
				slot1:setCascadeOpacityEnabled(true)

				function slot0.onAfterBuild(slot0)
					slot0:setItemAlignCenter()
				end

				slot0:setTouchEnabled(false)
				bind.click(slot0, slot1, {
					method = functools.partial(slot0.itemClick, slot0:getIdx(slot2), slot1, slot3)
				})
			end
		},
		handlers = {
			itemClick = bindHelper.self("onItemClick")
		}
	})
end

function slot1.getGameData(slot0)
	slot1 = {}
	slot2 = {}
	slot3 = slot0:getGateData()
	slot5 = slot3.aimSize

	for slot9 = 1, slot3.row * slot3.column do
		table.insert(slot2, {
			isSel = false,
			idx = slot9
		})
	end

	random.shuffle(slot2)

	for slot9 = 1, slot5 do
		slot1[slot9] = slot2[slot9]
	end

	random.shuffle(slot2)

	return slot1, slot2
end

function slot1.getGateData(slot0)
	uv2 = "itertools"

	if itertools.size(slot2) < slot0.gateCount then
		uv2 = "itertools"

		return slot2[slot1]
	end

	uv2 = "itertools"

	return slot2[slot0.gateCount]
end

function slot1.startGame(slot0)
	slot0.list:hide()
	slot0.topPanel:hide()

	slot1 = gLanguageCsv.qixiText2

	if slot0.isGameGuide then
		slot1 = gLanguageCsv.qixiText3 .. gLanguageCsv.qixiText2
	end

	slot0.startPanel:get("tip"):text(string.format(slot1, slot0.gateCount))

	slot0.columnSize = slot0:getGateData().column

	slot0:updateTableView()

	slot0.playing = false

	if slot0.gateCount == 1 then
		gGameApp:requestServer("/game/yy/qixi/game/start", function (slot0)
		end, slot0.activityId)
	end

	transition.executeSequence(slot0.startPanel):fadeTo(0, 0):show():fadeIn(0.3):delay(0.4):fadeOut(0.3):hide():func(function ()
		uv1 = "transition"
		slot0 = transition.executeSequence(slot1.list):fadeTo(0, 0):show():fadeIn(0.3)
		slot1 = slot0

		slot0.done(slot1)

		uv1 = "transition"
		slot2 = 0.3
		slot0 = transition.executeSequence(slot1.topPanel):fadeTo(0, 0):show():fadeIn(slot2)
		slot0 = slot0.done

		slot0(slot0)

		uv0 = "transition"
		slot0.playing = true
		uv0 = "transition"
		slot0, slot1 = slot0:getGameData()
		uv2 = "transition"
		slot2 = slot2.boxData
		slot2 = slot2.update

		slot2(slot2, slot1)

		uv2 = "transition"
		slot2 = slot2.aimData
		slot2 = slot2.update

		slot2(slot2, slot0)

		uv2 = "transition"

		slot2:gudieCheck()
	end):done()
end

function slot1.gudieCheck(slot0)
	if not slot0:isGuide() then
		return
	end

	slot0.playing = false
	uv4 = "isGuide"

	gGameUI.guideManagerLocal:checkGuide({
		specialName = slot4[slot0.gateCount],
		endCb = function ()
			uv0 = "playing"
			slot0.playing = true
		end
	})
end

function slot1.showEndView(slot0)
	if slot0.isGameOver then
		return
	end

	slot0.isGameOver = true

	slot0:unscheduleUpdate()
	gGameApp:requestServerCustom("/game/yy/qixi/game/end"):params(slot0.activityId, slot0.gateCount - 1):delay(0.1):onErrClose(function ()
		uv0 = "onClose"

		slot0:onClose()
	end):doit(function (slot0)
		function slot7()
			uv0 = "onClose"

			slot0:onClose()
		end

		uv7 = "gGameUI"

		gGameUI:stackUI("city.activity.qixi.find_bird_over", nil, , {
			cb = slot7,
			gateCount = slot7.gateCount - 1,
			reward = slot0.view or {}
		})
	end)
end

function slot1.setCutDownTime(slot0, slot1)
	slot2 = math.max(slot0.cutDownTime - slot1, 0)

	slot0.time:text(time.getCutDown(math.ceil(slot2)).min_sec_clock)

	if slot2 == 0 then
		slot0:showEndView()
	elseif slot2 > 10 then
		slot0.time:setTextColor(cc.c3b(91, 84, 91))
	else
		slot0.time:setTextColor(ui.COLORS.RED)
	end
end

function slot1.onPlay(slot0)
	slot1 = 0
	slot2 = socket.gettime()

	slot0.time:text(time.getCutDown(slot0.cutDownTime).min_sec_clock)
	slot0:scheduleUpdate(function ()
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
end

function slot1.isCurGateOver(slot0)
	for slot4, slot5 in slot0.aimData:ipairs() do
		if not slot5:read().isSel then
			return false
		end
	end

	slot0.gateCount = slot0.gateCount + 1

	return true
end

function slot1.isGuide(slot0)
	if slot0.isGameGuide then
		uv2 = "isGameGuide"
		slot1 = slot0.gateCount <= #slot2
	end

	return slot1
end

function slot1.onItemClick(slot0, slot1, slot2, slot3, slot4)
	if slot4.isSel then
		return
	end

	slot5 = false
	slot6 = 1

	for slot10, slot11 in slot0.aimData:ipairs() do
		if slot4.idx == slot11:read().idx then
			slot5 = true
			slot6 = slot10

			break
		end
	end

	if slot5 then
		slot0.boxData:atproxy(slot2.k).isSel = true
		slot0.aimData:atproxy(slot6).isSel = true

		if slot0:isCurGateOver() then
			gGameUI:disableTouchDispatch(nil, false)
			performWithDelay(slot0, function ()
				uv0 = "startGame"

				slot0:startGame()
				gGameUI:disableTouchDispatch(nil, true)
			end, 0.1)
		end
	else
		slot7 = slot3:get("errorPanel")

		slot7:setCascadeOpacityEnabled(true)
		transition.executeSequence(slot7):show():func(function ()
			uv0 = "setTouchEnabled"
			slot0 = slot0.setTouchEnabled

			slot0(slot0, false)

			uv0 = "setHandErrorData"

			slot0:setHandErrorData()
		end):fadeTo(0.2, 100):fadeTo(0.2, 255):fadeTo(0.2, 100):hide():func(function ()
			uv0 = "setTouchEnabled"

			slot0:setTouchEnabled(true)
		end):done()
	end
end

function slot1.setHandErrorData(slot0)
	for slot6 = 1, slot0.handData:size() do
		slot2 = 0 + 1

		if not slot0.handData:atproxy(slot6).isError then
			slot0.handData:atproxy(slot6).isError = true

			break
		end
	end

	uv3 = "handData"

	if slot3 <= slot2 then
		slot0:showEndView()
	end
end

return slot1
