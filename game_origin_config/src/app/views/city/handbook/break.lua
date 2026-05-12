slot0 = {
	water = "#C0xFF8DB9FC#",
	fire = "#C0xFFF76A6B#",
	normal = "#C0xFFC6B6AC#",
	combat = "#C0xFFF98562#",
	poison = "#C0xFFAE7EDE#",
	ground = "#C0xFFB8B7B1#",
	worm = "#C0xFFC4D138#",
	fairy = "#C0xFFF96494#",
	ice = "#C0xFF6BDBEC#",
	super = "#C0xFFE76FD7#",
	evil = "#C0xFFAF8B85#",
	grass = "#C0xFF87DC87#",
	ghost = "#C0xFF788797#",
	fly = "#C0xFF85CEFC#",
	dragon = "#C0xFFABA2FF#",
	rock = "#C0xFFBE9E6A#",
	electricity = "#C0xFFE5CC3B#",
	steel = "#C0xFFA5B8BE#"
}

function slot1(slot0, slot1, slot2, slot3)
	slot1:get("progressBar"):removeChildByName("changtiao")
	slot1:get("topView"):visible(false)

	slot5 = ""
	slot6 = ""

	if slot3.cfg.targetType == 2 then
		slot5 = gLanguageCsv[game.NATURE_TABLE[slot3.cfg.targetArg2]] .. gLanguageCsv.xi
		slot6 = ui.ATTRCOLOR[game.NATURE_TABLE[slot3.cfg.targetArg2]]
	end

	slot1:removeChildByName("richText1")
	rich.createByStr(string.format(gLanguageCsv.handbookBreakTitle, "#C0xFF5B545B#", slot3.cfg.targetArg, slot6, slot5, "#C0xFF5B545B#"), 50):anchorPoint(0, 0.5):xy(57, 180):name("richText1"):addTo(slot1, 3)

	slot7 = slot0.hasNum:read()

	if slot4 == 2 then
		for slot11, slot12 in pairs(slot0.cards:read()) do
			if slot3.cfg.targetArg2 == csv.unit[csv.cards[slot11].unitID].natureType or slot14.natureType2 and slot3.cfg.targetArg2 == slot14.natureType2 then
				slot7 = 0 + 1
			end
		end
	end

	slot1:get("textNum"):text(string.format("%d/%d", slot7, slot3.cfg.targetArg))
	slot1:get("progressBar"):setPercent(math.max(math.min(slot7 / slot3.cfg.targetArg * 100, 100), 0))
	slot1:removeChildByName("richText2")
	rich.createByStr(slot3.cfg.desc, 40):anchorPoint(0, 0.5):xy(57, 100):name("richText2"):addTo(slot1, 3)

	slot10 = slot3.cfg.targetArg <= slot7
	slot11 = slot1:get("btnBreak")

	cache.setShader(slot11, false, "normal")
	cache.setShader(slot11:get("textNote"), false, "normal")

	if slot3.state == 0 then
		slot1:get("imgFlag"):visible(true)
		slot11:visible(false)
	elseif slot3.state == 1 then
		slot12:visible(false)
		slot11:visible(true)
		text.addEffect(slot11:get("textNote"), {
			glow = {
				color = ui.COLORS.GLOW.WHITE
			}
		})
		widget.addAnimationByKey(slot1:get("progressBar"), "shengjichangtiao/changtiao.skel", "changtiao", "effect_loop", 99):anchorPoint(cc.p(0.5, 0.5)):xy(slot1:get("imgProBar"):width() / 2, slot1:get("imgProBar"):height() / 2)
	else
		slot12:visible(false)
		slot11:visible(true)
		cache.setShader(slot11, false, "hsl_gray")
		cache.setShader(slot11:get("textNote"), false, "hsl_gray")
		text.deleteEffect(slot11:get("textNote"), {
			"glow"
		})
	end
end

slot2 = class("HandbookBreakView", Dialog)
slot2.RESOURCE_FILENAME = "handbook_break.json"
slot2.RESOURCE_BINDING = {
	item = "item",
	btnItem = "btnItem",
	["panel.title.btnClose"] = {
		varname = "btnClose",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["panel.listview"] = {
		varname = "breakList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 4,
				data = bindHelper.self("breakDatas"),
				item = bindHelper.self("item"),
				hasNum = bindHelper.self("hasNum"),
				cards = bindHelper.self("cards"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					uv4 = "bind"

					slot4(slot0, slot1, slot2, slot3)
					bind.touch(slot0, slot1:get("btnBreak"), {
						methods = {
							ended = functools.partial(slot0.clickItem, slot2, slot3, slot1)
						}
					})
				end
			},
			handlers = {
				clickItem = bindHelper.self("onBreak")
			}
		}
	},
	["panel.tabPanel.list"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("btnsData"),
				item = bindHelper.self("btnItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:get("textNote")

					slot1:get("btnClick"):visible(slot3.state)
					slot1:get("btnNormal"):visible(not slot3.state)
					slot1:get("frameBG"):visible(slot3.state and slot3.attrNatureType > 0)
					slot4:text(slot3.text)
					adapt.setTextScaleWithWidth(slot4, nil, 150)

					if slot3.state then
						text.addEffect(slot4, {
							color = ui.COLORS.NORMAL.WHITE
						})
					else
						text.addEffect(slot4, {
							color = ui.COLORS.NORMAL.DEFAULT
						})
					end

					if slot3.attrNatureType > 0 then
						slot1:get("imgIcon"):texture(ui.SKILL_ICON[slot3.attrNatureType])
					else
						slot1:get("imgIcon"):texture("city/main/icon_tj@.png")
						slot1:get("imgIcon"):scale(1)
					end

					bind.touch(slot0, slot1:get("btnNormal"), {
						methods = {
							ended = functools.partial(slot0.clickItem, slot2, slot3)
						}
					})
					bind.extend(slot0, slot1, {
						class = "red_hint",
						props = {
							state = slot3.red_hint
						}
					})
				end
			},
			handlers = {
				clickItem = bindHelper.self("onChangeView")
			}
		}
	}
}

function slot2.onCreate(slot0)
	slot0:initModel()

	slot0.curSelBtn = 1
	slot0.btnsData = idlers.newWithMap({
		{
			red_hint = false,
			attrNatureType = 0,
			state = true,
			text = gLanguageCsv.overView
		},
		{
			red_hint = false,
			attrNatureType = 1,
			state = false,
			text = gLanguageCsv.normal
		},
		{
			red_hint = false,
			attrNatureType = 2,
			state = false,
			text = gLanguageCsv.fire
		},
		{
			red_hint = false,
			attrNatureType = 3,
			state = false,
			text = gLanguageCsv.water
		},
		{
			red_hint = false,
			attrNatureType = 4,
			state = false,
			text = gLanguageCsv.grass
		},
		{
			red_hint = false,
			attrNatureType = 5,
			state = false,
			text = gLanguageCsv.electricity
		},
		{
			red_hint = false,
			attrNatureType = 6,
			state = false,
			text = gLanguageCsv.ice
		},
		{
			red_hint = false,
			attrNatureType = 7,
			state = false,
			text = gLanguageCsv.combat
		},
		{
			red_hint = false,
			attrNatureType = 8,
			state = false,
			text = gLanguageCsv.poison
		},
		{
			red_hint = false,
			attrNatureType = 9,
			state = false,
			text = gLanguageCsv.ground
		},
		{
			red_hint = false,
			attrNatureType = 10,
			state = false,
			text = gLanguageCsv.fly
		},
		{
			red_hint = false,
			attrNatureType = 11,
			state = false,
			text = gLanguageCsv.super
		},
		{
			red_hint = false,
			attrNatureType = 12,
			state = false,
			text = gLanguageCsv.worm
		},
		{
			red_hint = false,
			attrNatureType = 13,
			state = false,
			text = gLanguageCsv.rock
		},
		{
			red_hint = false,
			attrNatureType = 14,
			state = false,
			text = gLanguageCsv.ghost
		},
		{
			red_hint = false,
			attrNatureType = 15,
			state = false,
			text = gLanguageCsv.dragon
		},
		{
			red_hint = false,
			attrNatureType = 16,
			state = false,
			text = gLanguageCsv.evil
		},
		{
			red_hint = false,
			attrNatureType = 17,
			state = false,
			text = gLanguageCsv.steel
		},
		{
			red_hint = false,
			attrNatureType = 18,
			state = false,
			text = gLanguageCsv.fairy
		}
	})
	slot0.hasNum = idler.new(itertools.size(slot0.cards:read()))
	slot0.breakDatas = idlers.newWithMap({})

	slot0:refreshIdlersMap()
	slot0:refreshTabRedHint()
	Dialog.onCreate(slot0)
end

function slot2.initModel(slot0)
	slot0.cards = gGameModel.role:getIdler("pokedex")
	slot0.pokedexAdvance = gGameModel.role:getIdler("pokedex_advance")
end

function slot2.refreshIdlersMap(slot0)
	slot1 = {}

	for slot7, slot8 in orderCsvPairs(csv.pokedex_advance) do
		if slot0.btnsData:atproxy(slot0.curSelBtn).attrNatureType == (slot8.targetArg2 or 0) then
			table.insert(slot1, {
				cfg = slot8,
				state = slot0.pokedexAdvance:read()[slot7] or 0.5,
				csvId = slot7
			})
		end
	end

	table.sort(slot1, function (slot0, slot1)
		if slot0.state ~= slot1.state then
			return slot1.state < slot0.state
		end

		return slot0.csvId < slot1.csvId
	end)
	dataEasy.tryCallFunc(slot0.breakList, "updatePreloadCenterIndex")
	slot0.breakDatas:update(slot1)
	slot0.breakList:jumpToTop()
end

function slot2.refreshTabRedHint(slot0)
	slot1 = slot0.pokedexAdvance:read()

	for slot5, slot6 in slot0.btnsData:pairs() do
		slot0.btnsData:atproxy(slot5).red_hint = false

		for slot11, slot12 in orderCsvPairs(csv.pokedex_advance) do
			if slot0.btnsData:atproxy(slot5).attrNatureType == (slot12.targetArg2 or 0) and (slot1[slot11] or 0.5) == 1 then
				slot0.btnsData:atproxy(slot5).red_hint = true

				break
			end
		end
	end
end

function slot2.onBreak(slot0, slot1, slot2, slot3, slot4)
	if slot3.state ~= 1 then
		return
	end

	gGameApp:requestServerCustom("/game/role/pokedex_advance"):params(slot3.csvId):onResponse(function (slot0)
		uv1 = "get"
		slot1 = slot1:get("topView")
		slot1 = slot1.visible

		slot1(slot1, true)

		uv1 = "get"

		if slot1:get("progressBar"):get("changtiao") then
			slot1:play("effect")
		else
			uv3 = "get"
			slot4 = cc.p
			uv4 = "get"
			slot4 = slot4:get("imgProBar")
			slot5 = slot4
			uv5 = "get"
			slot1 = widget.addAnimationByKey(slot3:get("progressBar"), "shengjichangtiao/changtiao.skel", "changtiao", "effect", 99):anchorPoint(slot4(0.5, 0.5)):xy(slot4.width(slot5) / 2, slot5:get("imgProBar"):height() / 2)
		end

		uv3 = "topView"

		performWithDelay(slot3, function ()
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
		end, 0.8333333333333334)
	end):wait({
		false
	}):doit(function (slot0)
		uv1 = "refreshIdlersMap"
		slot1 = slot1.refreshIdlersMap

		slot1(slot1)

		uv1 = "refreshIdlersMap"
		uv3 = "refreshIdlersMap"
		uv5 = "refreshIdlersMap"

		slot1:refreshTabRedHint(slot3.btnsData:atproxy(slot5.curSelBtn).attrNatureType)
		gGameUI:showTip(gLanguageCsv.breakSuccess)
	end)
end

function slot2.onChangeView(slot0, slot1, slot2, slot3)
	slot0.btnsData:atproxy(slot0.curSelBtn).state = false
	slot0.btnsData:atproxy(slot2).state = true
	slot0.curSelBtn = slot2

	slot0:refreshIdlersMap()
end

return slot2
