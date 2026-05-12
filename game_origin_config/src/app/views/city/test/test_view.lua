time.registerTime(time.SERVER_TIMEKEY, 1, os.time())
gGameModel.role:init({
	_db = {
		stamina_last_recover_time = 0,
		level = 99,
		yy_endtime = 0,
		gold = 0,
		rmb = 0,
		vip_sum = 10000,
		stamina = 100,
		trainer_level = 1,
		id = "1111111",
		vip_level = 18,
		yyhuodongs = {},
		yy_open = {},
		yy_delta = {},
		figures = {},
		pokedex = {},
		skins = {},
		logos = {},
		gate_star = {
			[10102] = {
				star = 3
			},
			[10105] = {
				star = 3
			}
		},
		items = {
			[12.0] = 111,
			[13.0] = 1111,
			[11.0] = 1
		},
		frags = {
			[20001.0] = 22
		},
		vip_gift = {},
		recharges = {},
		trainer_skills = {}
	}
})
gGameModel.daily_record:init({
	_db = {
		lianjin_free_times = 0,
		buy_stamina_times = 0,
		lianjin_times = 2,
		lianjin_gifts = {}
	}
})
gGameModel.monthly_record:init({
	_db = {
		vip = 1,
		vip_gift = {}
	}
})
gGameModel.currday_dispatch:init({
	luckyCat = false,
	sendedRedPacket = false,
	randomTower = false,
	activityDirectBuyGift = false,
	newPlayerWeffare = false,
	firstRecharge = false,
	passport = false,
	goldLuckyCat = false,
	vipGift = false,
	serverOpenItemBuy = {},
	firstRechargeDaily = {}
})
gGameModel.forever_dispatch:init({
	cloneBattleLookHistory = 0,
	dispatchTasksRedHintRefrseh = false,
	reunionBindPlayer = 0,
	chatPrivatalyLastId = 0,
	exclusiveLimitDatas = false,
	cloneBattleLookRobot = false,
	battleManualDatas = false,
	dispatchTasksNextAutoTime = 0,
	activityItemExchange = {}
})
gGameModel.currlogin_dispatch:init({
	rechargeWheelSkip = false,
	livenessWheelSkip = false
})

slot0 = "cross_online_fight"
gGameModel[slot0] = require("app.models." .. slot0).new(gGameModel)

gGameModel[slot0]:syncFrom({
	theme_id = 2
}, true)

slot1 = {
	{
		name = "city.bag",
		key = "bag",
		styles = {
			full = true
		}
	},
	{
		name = "city.pvp.online_fight.theme",
		key = "online_fight_theme",
		styles = {
			blackLayer = true,
			full = false,
			clickClose = true
		}
	}
}
slot2 = itertools.map(slot1, function (slot0, slot1)
	return slot1.key, slot0
end)
slot3 = itertools.map(slot1, function (slot0, slot1)
	return slot1.name, slot0
end)

return function (slot0)
	slot1 = ccui.Layout:create():size(display.sizeInView):alignCenter(display.sizeInView):addTo(slot0, 5, "_TestView_"):x(display.sizeInView.width / 2 - display.uiOrigin.x)

	slot1:setTouchEnabled(true)
	ccui.ImageView:create("common/bg/bg_tzjc.png"):alignCenter(display.sizeInView):scale(2):addTo(slot1, -1, "bg")

	slot2 = nil
	slot3 = ccui.Button:create("common/btn/btn_normal.png"):setTitleText("返回"):setTitleFontSize(60):xy(display.uiOrigin.x - display.uiOriginMax.x + 100, display.height - 100):scale(0.8):opacity(150):hide():addTo(slot0, 1000)

	slot3:setTouchEnabled(true)
	bind.touch(slot0, slot3, {
		methods = {
			ended = function ()
				uv0 = "tolua"

				if slot0 then
					uv1 = "tolua"

					if not tolua.isnull(slot1) then
						uv0 = "tolua"

						slot0:removeSelf()

						uv0 = nil
					end
				end

				uv0 = "isnull"

				slot0:hide()
			end
		}
	})

	slot4 = ccui.ImageView:create("common/btn/btn_back.png"):xy(display.uiOrigin.x - display.uiOriginMax.x + 150, display.height - 150):addTo(slot1, 10)

	slot4:setTouchEnabled(true)
	bind.touch(slot0, slot4, {
		methods = {
			ended = function ()
				uv0 = "removeSelf"
				slot0 = slot0.removeSelf

				slot0(slot0)

				uv0 = "removeSelf"

				slot0:removeSelf()
			end
		}
	})

	slot5, slot6 = nil
	slot7 = display.sizeInView.width / 2 - 500
	slot8 = 1000

	label.create("注:可以输入工程名或文件路径打开对应界面", {
		fontSize = 45,
		color = ui.COLORS.NORMAL.DEFAULT
	}):anchorPoint(0, 0.5):xy(slot7, slot8):addTo(slot1)

	slot8 = slot8 - 100
	slot5 = ccui.EditBox:create(cc.size(800, 60), "img/editor/input.png"):anchorPoint(0, 0.5):xy(slot7 + label.create("工程名(.json):", {
		fontSize = 45,
		color = ui.COLORS.NORMAL.DEFAULT
	}):anchorPoint(0, 0.5):xy(slot7, slot8):addTo(slot1):width() + 20, slot8):setColor(cc.c4b(200, 200, 200, 255)):addTo(slot1)

	slot5:setFontSize(45)
	slot5:setFontColor(ui.COLORS.NORMAL.DEFAULT)
	slot5:registerScriptEditBoxHandler(function (slot0)
		if slot0 == "return" then
			uv1 = "return"
			slot2 = slot1
			uv2 = "getText"

			if not slot2[slot1.getText(slot2)] then
				gGameUI:showTip("%s(.json)未定义", slot1)
			else
				uv3 = "gGameUI"
				uv5 = "showTip"

				slot3:setText(slot5[slot2].name)
			end
		end
	end)

	slot8 = slot8 - 100
	slot6 = ccui.EditBox:create(cc.size(800, 60), "img/editor/input.png"):anchorPoint(0, 0.5):xy(slot7 + label.create("文件路径:", {
		fontSize = 45,
		color = ui.COLORS.NORMAL.DEFAULT
	}):anchorPoint(0, 0.5):xy(slot7, slot8):addTo(slot1):width() + 20, slot8):setColor(cc.c4b(200, 200, 200, 255)):addTo(slot1)

	slot6:setFontSize(45)
	slot6:setFontColor(ui.COLORS.NORMAL.DEFAULT)

	slot12 = slot6

	slot6.registerScriptEditBoxHandler(slot12, function (slot0)
		if slot0 == "return" then
			uv1 = "return"
			slot2 = slot1
			uv2 = "getText"

			if slot2[slot1.getText(slot2)] then
				uv3 = "setText"
				uv5 = "key"

				slot3:setText(slot5[slot2].key)
			else
				uv3 = "setText"

				slot3:setText("")
			end
		end
	end)

	uv12 = "Layout"
	slot12 = slot12[1]

	slot5:setText(slot12.key)
	slot6:setText(slot12.name)

	slot8 = slot8 - 100

	bind.touch(slot0, ccui.Button:create("common/btn/btn_normal_red.png"):setTitleText("上一个"):setTitleFontSize(72):xy(display.sizeInView.width / 2 - 300, slot8):addTo(slot1):scale(0.5), {
		methods = {
			ended = function ()
				uv0 = "setText"
				uv0 = 1
				uv0 = "setText"

				if slot0 - 1 < 1 then
					uv0 = "key"
					slot0 = #slot0
					uv0 = 1
				end

				uv0 = "key"
				uv1 = "setText"
				slot0 = slot0[slot1]
				uv1 = "name"
				slot1 = slot1.setText

				slot1(slot1, slot0.key)

				uv1 = "setText"

				slot1:setText(slot0.name)
			end
		}
	})
	bind.touch(slot0, ccui.Button:create("common/btn/btn_normal_red.png"):setTitleText("下一个"):setTitleFontSize(72):xy(display.sizeInView.width / 2 + 300, slot8):addTo(slot1):scale(0.5), {
		methods = {
			ended = function ()
				uv0 = "setText"
				uv0 = 1
				uv0 = "setText"
				uv1 = "key"

				if slot0 + 1 > #slot1 then
					uv0 = slot0
				end

				uv0 = "key"
				uv1 = "setText"
				slot0 = slot0[slot1]
				uv1 = "name"
				slot1 = slot1.setText

				slot1(slot1, slot0.key)

				uv1 = "setText"

				slot1:setText(slot0.name)
			end
		}
	})
	bind.touch(slot0, ccui.Button:create("common/btn/btn_normal.png"):setTitleText("显示界面"):setTitleFontName("font/youmi1.ttf"):anchorPoint(0.5, 0.5):setTitleFontSize(45):xy(display.sizeInView.width / 2, slot8 - 150):addTo(slot1), {
		methods = {
			ended = function ()
				xpcall(function ()
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
				end, function (slot0)
					printError("showTestView: ", slot0)
				end)
			end
		}
	})
end
