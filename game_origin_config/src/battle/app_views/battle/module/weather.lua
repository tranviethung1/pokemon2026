slot0 = class("WeatherInfo", battleModule.CBase)

function slot0.ctor(slot0, slot1)
	battleModule.CBase.ctor(slot0, slot1)

	slot0.weatherLayer = slot0.parent.weatherLayer
	slot0.weatherInfo = slot0.parent.UIWidgetMid:get("widgetPanel.weatherInfo")
	slot0.weatherView = slot0.parent.UIWidgetMid:get("widgetPanel.topinfo.weather")
	slot0.effect = nil
	slot0.curWeatherId = nil

	slot0:init()

	slot0.originSize = slot0.weatherView:getContentSize()
end

function slot0.init(slot0)
	slot0.weatherInfo:setVisible(false)

	slot1 = nil

	slot0.weatherView:addTouchEventListener(function ()
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

function slot0.initInfoPanel(slot0, slot1)
	slot0.weatherInfo:setVisible(slot1)

	if not slot1 or not slot0.cfg then
		return
	end

	slot0.weatherInfo:get("name"):setString(slot0.cfg.name)

	if slot0.model.lifeRound > 99 then
		nodetools.get(slot0.weatherInfo, "desc"):setString(gLanguageCsv.forever)
	else
		nodetools.get(slot0.weatherInfo, "desc"):setString(string.format(gLanguageCsv.leftRounds, slot0.model.lifeRound))
	end

	slot2 = slot0.weatherInfo:get("describe")

	slot2:removeAllChildren()

	slot4 = rich.createWithWidth(string.format("#C0x5b545b#%s", slot0.cfg.describe), 42, nil, slot2:getContentSize().width)

	slot4:setAnchorPoint(cc.p(0, 1))
	slot2:add(slot4)

	slot5 = slot0.weatherInfo:get("bg")

	slot5:setContentSize(cc.size(slot5:getContentSize().width, slot0.originSize.height < slot2:getPositionY() + slot4:getContentSize().height + 5 and slot8 or slot0.originSize.height))
end

function slot0.onWeatherRefresh(slot0, slot1, slot2)
	if not slot2.isShow then
		slot0.weatherView:setVisible(false)

		if slot0.effect then
			slot0.effect:play("effect_danchu")
		end

		slot0.curWeatherId = nil
	else
		slot0.cfg = csv.weather[slot2.weatherCfgId]

		if slot2.weatherCfgId ~= slot0.curWeatherId then
			if slot0.effect then
				slot0.effect:play("effect_danchu")
				performWithDelay(slot0.weatherLayer, function ()
					uv0 = "onShowWeatherAnimation"
					uv2 = "onShowWeatherAnimation"

					slot0:onShowWeatherAnimation(slot2.cfg.effectRes)
				end, 1)
			else
				slot0:onShowWeatherAnimation(slot0.cfg.effectRes)
			end
		end

		slot0.weatherView:get("icon"):loadTexture(slot0.cfg.iconRes)
		slot0.weatherView:setVisible(true)

		slot0.model = slot2
		slot0.curWeatherId = slot0.model.weatherCfgId

		nodetools.get(slot0.weatherView, "weatherDesc"):setString(slot0.cfg and slot0.cfg.name)

		if slot0.model.lifeRound > 99 then
			nodetools.get(slot0.weatherView, "roundDesc"):setString(gLanguageCsv.forever)
		else
			nodetools.get(slot0.weatherView, "roundDesc"):setString(string.format(gLanguageCsv.leftRounds, slot0.model.lifeRound))
		end
	end
end

function slot0.onShowWeatherAnimation(slot0, slot1)
	if slot0.effect then
		slot0.effect:removeFromParent()
	end

	if not slot1 then
		return
	end

	slot0.effect = newCSpriteWithOption(slot1)

	slot0.effect:xy(display.cx, display.cy):scale(2):play("effect_danru")
	performWithDelay(slot0.weatherLayer, function ()
		uv0 = "effect"

		slot0.effect:play("effect_loop")
	end, 1)
	slot0.weatherLayer:add(slot0.effect, 9999)
end

return slot0
