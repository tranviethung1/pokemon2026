function slot0(slot0, slot1, slot2)
	for slot7 = 1, slot2 do
		if csv.base_attribute.skill_level[slot0 + slot7 - 1] then
			slot3 = 0 + csv.base_attribute.skill_level[slot0 + slot7 - 1]["gold" .. slot1]
		end
	end

	return slot3
end

slot1 = 50
slot2 = 50
slot3 = class("CardSkillView", cc.load("mvc").ViewBase)
slot3.RESOURCE_FILENAME = "card_skill.json"
slot3.RESOURCE_BINDING = {
	["townPanel.townMask"] = "townMask",
	topItem = "topItem",
	["townPanel.skillItem"] = "skillItem",
	["townPanel.conditionItem"] = "conditionItem",
	panel = "skillPanel",
	["panel.fastUpgradePanel.btnPanel"] = "btnFastUpgrade",
	["panel.textNum"] = "skillNum",
	townPanel = "townPanel",
	item = "item",
	["panel.textNote"] = "textNote",
	topList = {
		varname = "topList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("tabDatas"),
				item = bindHelper.self("topItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()

						slot6 = slot1:get("selected"):show()
					else
						slot5:hide()

						slot6 = slot4:show()
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
	["townPanel.skillList"] = {
		varname = "skillList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("townSkillDatas"),
				item = bindHelper.self("skillItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					if slot3.hasSkill then
						slot4 = slot1:get("panel"):multiget("effectState", "effectName", "skillType", "desc", "icon")
						slot5 = slot3.cfg

						slot4.effectState:text(slot3.state)

						slot9 = gLanguageCsv["symbolRome" .. slot5.level]

						slot4.effectName:text(slot5.name .. slot9)
						slot4.skillType:text(slot5.name)

						slot8 = slot5.desc

						slot4.desc:text(slot8)

						uv8 = "hasSkill"
						uv9 = "get"

						slot4.desc:height(slot9 * math.ceil(#slot5.desc / slot8))
						slot1:height(slot4.desc:height() + 300)
						slot1:get("panel"):y(slot4.desc:height() + 300)
						slot4.icon:texture(slot5.icon)
						slot1:get("noData"):hide()
						slot1:get("panel"):show()
					else
						slot1:get("noData"):show()
						slot1:get("panel"):hide()
					end
				end
			}
		}
	},
	["townPanel.conditionList"] = {
		varname = "conditionList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("townSkillConditionDatas"),
				item = bindHelper.self("conditionItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("text", "tip")

					slot4.tip:visible(not slot3.finish)
					slot4.text:text(slot3.text)
					adapt.oneLinePos(slot4.text, slot4.tip, cc.p(5, 0), "left")
				end
			}
		}
	},
	["panel.btnAdd"] = {
		varname = "addBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSkillAddClick")
			}
		}
	},
	["panel.textFlag"] = {
		varname = "skillMax",
		binds = {
			event = "text",
			idler = bindHelper.self("skillPointState")
		}
	},
	["panel.fastUpgradePanel"] = {
		varname = "fastUpgradePanel",
		binds = {
			event = "click",
			method = bindHelper.self("onFastUpgradeClick")
		}
	},
	["panel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 5,
				data = bindHelper.self("skillData"),
				item = bindHelper.self("item"),
				cardLv = bindHelper.self("cardLv"),
				star = bindHelper.self("star"),
				cardId = bindHelper.self("cardId"),
				advance = bindHelper.self("advance"),
				zawakeSkills = bindHelper.self("zawakeSkills"),
				canFastUpgrade = bindHelper.self("canFastUpgrade"),
				itemAction = {
					isAction = true
				},
				margin = bindHelper.self("listMargin"),
				dataOrderCmp = function (slot0, slot1)
					return slot0.id < slot1.id
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:name("item" .. slot0:getIdx(slot2))

					slot4 = csv.skill[slot3.skillId]
					slot5 = slot0.cardLv:read()
					slot6 = slot1:multiget("textLvNum", "textCost", "textName", "imgType", "btnAdd", "imgIcon", "imgBG", "textFastUpgradeNum", "textLvNote")

					slot6.textLvNote:text(gLanguageCsv.textLv1)
					slot6.textLvNum:text(slot3.skillLevel)

					if matchLanguage({
						"cn"
					}) then
						slot6.textLvNum:setPositionX(slot6.textLvNum:getPositionX() - 50)
						slot6.textLvNote:setPositionY(slot6.textLvNum:getPositionY())
						adapt.oneLinePos(slot6.textLvNum, slot6.textLvNote)
					end

					uv7 = "name"

					text.addEffect(slot6.textCost, {
						color = slot7(slot3.skillLevel, slot4.costID, slot3.fastUpgradeNum) <= slot3.clientGold and cc.c4b(91, 84, 91, 255) or cc.c4b(249, 87, 114, 255)
					})
					slot6.textCost:text(slot7)
					uiEasy.setSkillInfoToItems({
						name = slot6.textName,
						icon = slot6.imgIcon,
						type1 = slot6.imgType
					}, slot3.skillId)
					adapt.setTextScaleWithWidth(slot6.textName, nil, 300)
					cache.setShader(slot6.btnAdd, false, slot5 >= slot3.skillLevel + slot3.fastUpgradeNum and "normal" or "hsl_gray")
					slot6.btnAdd:onTouch(functools.partial(slot0.clickCell, slot1, slot2, slot3))
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCellTip, slot2, slot3)
						}
					})

					slot9 = true
					slot10 = ""
					slot11 = "s%"

					if slot4.activeType == 1 then
						slot9 = slot4.activeCondition <= slot0.star:read()
						slot11 = gLanguageCsv.potentialIncreasedStarsUnlocked
						slot10 = slot4.activeCondition
					elseif slot4.activeType == 2 then
						slot9 = slot4.activeCondition <= slot0.advance:read()
						slot11 = gLanguageCsv.skillBreakAdvanceUnlocked
						slot10 = ui.QUALITYCOLOR[dataEasy.getQuality(slot4.activeCondition)] .. gLanguageCsv.symbolSquareBracketLeft .. uiEasy.setIconName("card", slot0.cardId:read(), {
							space = true,
							node = slot1:get("textTip"),
							name = ui.QUALITY_COLOR_TEXT,
							advance = slot4.activeCondition
						}) .. gLanguageCsv.symbolSquareBracketRight
					end

					slot6.textFastUpgradeNum:text(string.format(gLanguageCsv.upLevelNumber, slot3.fastUpgradeNum)):visible(slot0.canFastUpgrade:read() and slot9)
					slot1:removeChildByName("activeCondition")
					rich.createWithWidth(string.format(slot11, slot10), 40, nil, 800):anchorPoint(0, 1):xy(205, 95):visible(not slot9):addTo(slot1, 2, "activeCondition")
					slot1:get("imgMask"):visible(not slot9)
					slot1:get("imgCostIcon"):visible(slot9)
					slot1:get("textCost"):visible(slot9)
					slot1:get("btnAdd"):visible(slot9)
					slot6.imgBG:z(0)
					slot1:removeChildByName("zawakeBg")
					slot6.imgIcon:removeChildByName("zawakeUp")

					if dataEasy.isZawakeSkill(slot3.skillId, slot0.zawakeSkills:read()) then
						ccui.ImageView:create("city/zawake/panel_z1.png"):alignCenter(slot1:size()):addTo(slot1, 1, "zawakeBg")
						ccui.ImageView:create("city/drawcard/draw/txt_up.png"):scale(1.2):align(cc.p(1, 1), 200, 190):addTo(slot6.imgIcon, 1, "zawakeUp")
						slot6.textName:text(csv.skill[csv.skill[slot3.skillId].zawakeEffect[1]].skillName .. slot6.textName:text())
					end
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemAddClick"),
				clickCellTip = bindHelper.self("onItemTipClick")
			}
		}
	}
}

function slot3.onCreate(slot0, slot1)
	slot0.selectDbId = slot1()

	slot0:initModel()
	slot0:enableSchedule()

	slot0.skillData = idlers.new()
	slot0.listMargin = idler.new(11)
	slot0.skillPointState = idler.new("")
	slot0.skillList = {}
	slot0.tmpSkillPoint = idler.new(0)
	slot0.refreshPoint = idler.new(true)
	slot0.serverSkillPoint = idler.new(0)

	slot0.btnFastUpgrade:get("checkBox"):setSelectedState(userDefault.getForeverLocalKey("skillFastUpgrade", false))

	slot0.canFastUpgrade = idler.new(false)

	dataEasy.getListenUnlock(gUnlockCsv.fastUpgrade, function (slot0)
		uv1 = "canFastUpgrade"
		slot1 = slot1.canFastUpgrade
		slot1 = slot1.set
		uv3 = "set"

		slot1(slot1, slot3 and slot0)

		uv1 = "canFastUpgrade"

		slot1.fastUpgradePanel:visible(slot0)
	end)
	slot0.townPanel:visible(false)
	slot0.townMask:visible(false)
	dataEasy.getListenUnlock(gUnlockCsv.town, function (slot0)
		uv1 = "topList"
		slot1 = slot1.topList
		slot1 = slot1.visible

		slot1(slot1, slot0)

		uv1 = "topList"

		if not slot0 then
			uv2 = "topList"
			slot2 = slot2.skillPanel
			slot2 = slot2.y
			uv4 = "topList"
			slot4 = slot4.skillPanel:y() + slot1.topList:size().height

			slot2(slot2, slot4)

			uv2 = "topList"
			slot2 = slot2.list
			slot2 = slot2.y
			uv4 = "topList"
			slot4 = slot4.list:y() - 120

			slot2(slot2, slot4)

			uv2 = "topList"
			uv4 = "topList"

			slot2.list:height(slot4.list:height() + 120)
		else
			uv2 = "topList"

			slot2.listMargin:set(0)
		end
	end)
	idlereasy.any({
		slot0.cardId,
		slot0.skinId,
		slot0.zawakeSkills
	}, function (slot0, slot1, slot2)
		slot3 = {}
		slot5 = slot1
		slot6 = slot2
		uv5 = "dataEasy"
		slot5.skillList = dataEasy.getSortCardSkillList(slot5, slot6)
		uv6 = "dataEasy"

		for slot8, slot9 in ipairs(slot6.skillList) do
			slot10 = 1

			if csv.skill[slot9].skillType2 == battle.MainSkillType.PassiveSkill then
				slot10 = 2
			end

			uv11 = "dataEasy"
			slot11 = slot11.skills:read()[slot9] or 1
			uv13 = "dataEasy"
			slot13 = slot13.gold:read()
			uv13 = "dataEasy"
			slot3[slot9] = {
				id = slot8,
				skillId = slot9,
				skillLevel = slot11,
				skillPassive = slot10,
				clientGold = slot13,
				fastUpgradeNum = slot13:getFastUpgradeNum(slot11)
			}
		end

		uv5 = "dataEasy"
		slot5 = slot5.unSchedule

		slot5(slot5, "skillLvUp")

		uv5 = "dataEasy"
		slot5 = slot5.skillData
		slot5 = slot5.update

		slot5(slot5, slot3)

		uv5 = "dataEasy"
		slot5 = slot5.tmpSkillPoint
		slot5 = slot5.set

		slot5(slot5, 0)

		uv5 = "dataEasy"

		slot5:updateTownPanel()
	end)
	idlereasy.any({
		slot0.skills,
		slot0.cardLv
	}, function (slot0, slot1)
		uv3 = "csvPairs"

		for slot5, slot6 in csvPairs(slot3.skillList) do
			uv7 = "csvPairs"

			slot7.skillData:at(slot6):modify(function (slot0)
				uv1 = "skillLevel"
				uv2 = "fastUpgradeNum"
				slot1 = slot1[slot2] or 1
				slot0.skillLevel = slot1
				uv1 = "getFastUpgradeNum"
				slot0.fastUpgradeNum = slot1:getFastUpgradeNum(slot0.skillLevel)
			end, true)
		end
	end)

	slot0.clientGold = idler.new(0)

	idlereasy.when(slot0.gold, function (slot0, slot1)
		uv2 = "clientGold"

		slot2.clientGold:set(slot1)
	end)
	idlereasy.when(slot0.clientGold, function (slot0, slot1)
		uv3 = "csvPairs"

		for slot5, slot6 in csvPairs(slot3.skillList) do
			uv7 = "csvPairs"

			slot7.skillData:at(slot6):modify(function (slot0)
				uv1 = "clientGold"
				slot0.clientGold = slot1
			end, true)
		end
	end)

	slot3 = 0

	idlereasy.when(slot0.vipLevel, function ()
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

	slot4 = 0

	idlereasy.when(slot0.roleLv, function ()
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

	slot5 = nil

	idlereasy.any({
		slot0.skillPointLast,
		slot0.skillPoint,
		slot0.tmpSkillPoint,
		slot0.refreshPoint
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

	slot0.timeStart = idler.new(true)

	idlereasy.when(slot0.timeStart, function (slot0, slot1)
		if slot1 then
			uv2 = "schedule"

			slot2:schedule(function ()
				uv0 = "refreshPoint"
				uv2 = "refreshPoint"

				slot0.refreshPoint:set(not slot2.refreshPoint:read())
			end, 1, 0, "CardSkillView")
		else
			uv2 = "schedule"
			slot2 = slot2.unSchedule

			slot2(slot2, "CardSkillView")

			uv2 = "schedule"

			slot2.skillPointState:set("(MAX)")
		end
	end)
	idlereasy.any({
		slot0.serverSkillPoint,
		slot0.canFastUpgrade
	}, function (slot0, slot1)
		uv2 = "timeStart"
		uv3 = "set"
		slot3 = slot3.timeStart
		slot3 = slot3.set

		slot3(slot3, slot1 < slot2)

		uv3 = "set"
		slot3 = slot3.addBtn
		slot3 = slot3.visible

		slot3(slot3, false)

		uv3 = "set"

		slot3.skillNum:text(slot1)

		if gCommonConfigCsv.skillPointLimitMax <= slot1 then
			uv3 = "set"

			slot3.skillPointState:set("(" .. gLanguageCsv.alreadyMax .. ")")
		else
			uv3 = "timeStart"

			if slot3 <= slot1 then
				uv3 = "set"

				slot3.skillPointState:set("(MAX)")
			end
		end

		uv4 = "set"
		slot4 = slot4.textNote
		uv6 = "set"
		slot6 = slot6.skillNum
		uv6 = "set"
		slot6 = cc.p(20, 0)
		slot7 = "left"

		adapt.oneLinePos(slot4, {
			slot6,
			slot6.skillMax
		}, slot6, slot7)

		uv4 = "set"

		for slot6, slot7 in csvPairs(slot4.skillList) do
			uv8 = "set"

			slot8.skillData:at(slot7):modify(function (slot0)
				uv1 = "fastUpgradeNum"
				slot0.fastUpgradeNum = slot1:getFastUpgradeNum(slot0.skillLevel)
			end, true)
		end
	end)
end

function slot3.initModel(slot0)
	slot0.items = gGameModel.role:getIdler("items")
	slot0.skillPointLast = gGameModel.role:getIdler("skill_point_last_recover_time")
	slot0.skillPoint = gGameModel.role:getIdler("skill_point")
	slot0.roleLv = gGameModel.role:getIdler("level")
	slot0.vipLevel = gGameModel.role:getIdler("vip_level")
	slot0.gold = gGameModel.role:getIdler("gold")

	idlereasy.when(slot0.selectDbId, function (slot0, slot1)
		slot2 = gGameModel.cards
		slot3 = slot2
		slot2 = slot2.find(slot3, slot1)
		uv3 = "gGameModel"
		slot6 = slot2
		uv6 = "gGameModel"
		slot3.cardId = idlereasy.assign(slot2.getIdler(slot6, "card_id"), slot6.cardId)
		uv3 = "gGameModel"
		slot6 = slot2
		uv6 = "gGameModel"
		slot3.skinId = idlereasy.assign(slot2.getIdler(slot6, "skin_id"), slot6.skinId)
		uv3 = "gGameModel"
		slot6 = slot2
		uv6 = "gGameModel"
		slot3.cardLv = idlereasy.assign(slot2.getIdler(slot6, "level"), slot6.cardLv)
		uv3 = "gGameModel"
		slot6 = slot2
		uv6 = "gGameModel"
		slot3.skills = idlereasy.assign(slot2.getIdler(slot6, "skills"), slot6.skills)
		uv3 = "gGameModel"
		slot6 = slot2
		uv6 = "gGameModel"
		slot3.star = idlereasy.assign(slot2.getIdler(slot6, "star"), slot6.star)
		uv3 = "gGameModel"
		slot6 = slot2
		uv6 = "gGameModel"
		slot3.advance = idlereasy.assign(slot2.getIdler(slot6, "advance"), slot6.advance)
		uv3 = "gGameModel"
		slot6 = slot2
		uv6 = "gGameModel"
		slot4 = idlereasy.assign(slot2.getIdler(slot6, "zawake_skills"), slot6.advance)
		slot3.zawakeSkills = slot4
		uv4 = "gGameModel"

		dataEasy.tryCallFunc(slot4.list, "setItemAction", {
			isAction = true
		})
	end)

	slot0.showTab = idler.new(1)
	slot0.tabDatas = idlers.newWithMap({
		{
			id = 1,
			redHint = "skillBattle",
			name = gLanguageCsv.zhandou,
			panel = slot0.skillPanel
		},
		{
			id = 2,
			redHint = "townSkill",
			name = gLanguageCsv.town,
			panel = slot0.townPanel
		}
	})

	slot0.showTab:addListener(function (slot0, slot1)
		uv2 = "tabDatas"
		slot2 = slot2.tabDatas:atproxy(slot1)
		slot2.select = false
		uv2 = "tabDatas"
		slot2 = slot2.tabDatas:atproxy(slot0)
		slot2.select = true
		uv2 = "tabDatas"

		if slot2.tabDatas:atproxy(slot1).panel then
			uv2 = "tabDatas"

			slot2.tabDatas:atproxy(slot1).panel:hide()
		end

		uv2 = "tabDatas"

		slot2.tabDatas:atproxy(slot0).panel:show()
	end)

	slot0.townSkillDatas = idlers.new()
	slot0.townSkillConditionDatas = idlers.new({})
end

function slot3.onTabClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

function slot3.updateTownPanel(slot0)
	if not dataEasy.isUnlock(gUnlockCsv.town) then
		return
	end

	slot4 = gGameModel.cards:find(slot0.selectDbId:read()):read("star", "advance")

	if csv.cards[slot0.cardId:read()].townSkill == 0 then
		slot0.townMask:show()
		slot0.townPanel:get("max"):hide()
		slot0.townPanel:get("condition"):hide()
		slot0.townSkillDatas:update({})
		slot0.townSkillConditionDatas:update({})
	else
		slot0.townMask:hide()

		slot6, slot7 = nil
		slot8 = {}
		slot9 = {}

		for slot13, slot14 in orderCsvPairs(csv.town.skill) do
			if slot14.skill == slot5 and slot14.needAdvance <= slot4.advance and slot14.needStar <= slot4.star then
				slot6 = slot14
				slot7 = slot13
			end
		end

		slot10 = nil

		if slot7 then
			table.insert(slot8, {
				hasSkill = true,
				state = gLanguageCsv.townSkillNowEffect,
				cfg = slot6
			})

			if csv.town.skill[slot7 + 1] and csv.town.skill[slot7 + 1].skill == slot5 then
				slot10 = csv.town.skill[slot7 + 1]
			else
				slot0.townPanel:get("condition"):hide()
				slot0.townPanel:get("max"):show()
			end
		else
			table.insert(slot8, {
				hasSkill = false
			})

			slot10 = gTownSkillCsv[slot5][1]
		end

		if slot10 then
			slot0.townPanel:get("max"):hide()
			slot0.townPanel:get("condition"):show()

			slot11, slot12 = dataEasy.getQuality(slot10.needAdvance)
			slot13 = ""

			slot0.townPanel:get("max"):hide()
			slot0.townPanel:get("condition"):show()
			table.insert(slot8, {
				hasSkill = true,
				state = gLanguageCsv.townSkillNextEffect,
				cfg = slot10
			})
			table.insert(slot9, {
				text = gLanguageCsv.townCardSkillConditionStar .. slot10.needStar,
				finish = slot10.needStar <= slot4.star
			})
			table.insert(slot9, {
				text = gLanguageCsv.townCardSkillConditionAdvance .. (not itertools.isempty(slot12) and gLanguageCsv[ui.QUALITY_COLOR_TEXT[slot11]] .. "+" .. slot12 or gLanguageCsv[ui.QUALITY_COLOR_TEXT[slot11]] .. slot12),
				finish = slot10.needAdvance <= slot4.advance
			})
		end

		slot0.townSkillDatas:update(slot8)
		slot0.townSkillConditionDatas:update(slot9)
	end
end

function slot3.onFastUpgradeClick(slot0)
	slot1 = userDefault.getForeverLocalKey("skillFastUpgrade", false)

	slot0.btnFastUpgrade:get("checkBox"):setSelectedState(not slot1)
	userDefault.setForeverLocalKey("skillFastUpgrade", not slot1)
	slot0.canFastUpgrade:set(not slot1)
end

function slot3.getFastUpgradeNum(slot0, slot1)
	if not slot0.canFastUpgrade:read() then
		return 1
	end

	if slot0.cardLv:read() <= slot1 then
		return 5
	end

	if slot0.serverSkillPoint:read() == 0 then
		return 1
	end

	return math.min(slot3 - slot1, math.min(slot4, 5))
end

function slot3.onItemAddClick(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot5.name == "began" then
		slot0.tmpSkillPoint:set(0)

		slot6 = 0.4
		slot7 = 0.6
		slot0.notMoved = true
		slot0.touchBeganPos = clone(slot5)

		slot0:enableSchedule():schedule(function (slot0)
			uv1 = "gGameUI"

			if slot1 <= 0 and not gGameUI:isConnecting() then
				uv1 = "isConnecting"

				if slot1 <= 0.2 then
					slot1 = 0.2
				else
					uv1 = "isConnecting"
					slot1 = slot1 - 0.2
				end

				uv1 = 2
				uv1 = "isConnecting"
				uv0 = 2
				uv1 = "skillLevel"
				uv2 = "skillData"
				uv4 = "atproxy"
				slot2 = slot2.skillData:atproxy(slot4).skillLevel
				slot1.skillLevel = slot2
				uv1 = "skillLevel"
				uv2 = "skillData"
				slot2 = slot2.skillData
				slot3 = slot2
				uv4 = "atproxy"
				slot1.fastUpgradeNum = slot2.atproxy(slot3, slot4).fastUpgradeNum
				uv1 = "skillData"
				uv3 = "skillLevel"

				if slot1:canLevelUp(slot3, false) then
					uv1 = "skillLevel"
					slot1 = slot1.fastUpgradeNum
					uv2 = "skillData"
					slot2 = slot2.tmpSkillPoint
					slot3 = slot2
					slot2 = slot2.modify

					slot2(slot3, function ()
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

					uv2 = "fastUpgradeNum"
					uv3 = "skillLevel"
					slot3 = slot3.skillLevel
					uv5 = "skillLevel"
					slot2 = slot2(slot3, csv.skill[slot5.skillId].costID, slot1)
					uv3 = "skillData"
					slot3 = slot3.clientGold
					slot3 = slot3.modify

					function slot5()
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

					slot3(slot3, slot5)

					uv3 = "skillData"
					slot3 = slot3.skillData
					slot4 = slot3
					uv5 = "atproxy"
					slot3 = slot3.atproxy(slot4, slot5).skillLevel + slot1
					uv4 = "skillData"
					uv6 = "atproxy"
					slot4 = slot4.skillData:atproxy(slot6)
					slot4.skillLevel = slot3
					uv4 = "skillData"
					slot4 = slot4.skillData
					slot5 = slot4
					uv6 = "atproxy"
					slot4 = slot4.atproxy(slot5, slot6)
					uv5 = "skillData"
					slot4.fastUpgradeNum = slot5:getFastUpgradeNum(slot3)
					uv4 = "skillData"
					slot4 = slot4.serverSkillPoint
					slot5 = slot4
					uv5 = "skillData"
					slot5 = slot5.tmpSkillPoint
					slot6 = slot5
					uv6 = "skillData"

					if dataEasy.getSkillPointMax(slot6.roleLv:read()) <= slot4.read(slot5) + slot5.read(slot6) then
						uv4 = "skillData"
						uv6 = "skillData"

						if slot4.serverSkillPoint:read() < dataEasy.getSkillPointMax(slot6.roleLv:read()) then
							uv4 = "skillData"
							uv9 = "skillData"
							uv10 = "skillLevel"

							gGameApp:requestServer("/game/card/skill/level/up", function (slot0)
								uv1 = "tmpSkillPoint"

								slot1.tmpSkillPoint:modify(function ()
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
							end, slot9.selectDbId, slot10.skillId, slot4.tmpSkillPoint:read())
						end
					end

					for slot7 = 1, slot1 do
						uv8 = "skillData"
						uv10 = "canLevelUp"
						uv11 = "skillLevel"

						slot8:upgradeFloatingWord(slot10, slot11.skillId)
					end

					uv4 = "canLevelUp"
					slot4 = slot4:get("imgIcon"):getContentSize()
					slot6 = "circle.mp3"

					audio.playEffectWithWeekBGM(slot6)

					uv6 = "canLevelUp"

					widget.addAnimationByKey(slot6:get("imgIcon"), "effect/jineng.skel", nil, "effect", 555):xy(slot4.width / 2, slot4.height / 2):scale(1.3)
				end
			end

			uv1 = "gGameUI"
			slot1 = slot1 - slot0
			uv0 = 2
		end, 0.1, 0, "skillLvUp")

		return
	end

	if slot5.name == "moved" then
		slot6 = slot5

		if ui.TOUCH_MOVE_CANCAE_THRESHOLD <= math.abs(slot6.x - slot0.touchBeganPos.x) or ui.TOUCH_MOVE_CANCAE_THRESHOLD <= math.abs(slot6.y - slot0.touchBeganPos.y) then
			slot0.notMoved = false

			slot0:unSchedule("skillLvUp")
		end
	elseif slot5.name == "ended" or slot5.name == "cancelled" then
		slot0:unSchedule("skillLvUp")
		slot0:canLevelUp(slot4, true)

		if gGameUI:isConnecting() then
			return
		end

		if slot0.tmpSkillPoint:read() > 0 then
			gGameApp:requestServer("/game/card/skill/level/up", function (slot0)
				uv1 = "tmpSkillPoint"

				slot1.tmpSkillPoint:set(0)
			end, slot0.selectDbId, slot4.skillId, slot0.tmpSkillPoint)
		elseif slot0.notMoved then
			if not slot0:canLevelUp(slot4, false) then
				return
			end

			function slot9(slot0)
				uv1 = "tmpSkillPoint"

				slot1.tmpSkillPoint:set(0)
			end

			gGameApp:requestServer("/game/card/skill/level/up", slot9, slot0.selectDbId, slot4.skillId, slot4.fastUpgradeNum)

			for slot9 = 1, slot4.fastUpgradeNum do
				slot0:upgradeFloatingWord(slot2, slot4.skillId)
			end

			slot6 = slot2:get("imgIcon"):getContentSize()

			audio.playEffectWithWeekBGM("circle.mp3")
			widget.addAnimationByKey(slot2:get("imgIcon"), "effect/jineng.skel", nil, "effect", 555):xy(slot6.width / 2, slot6.height / 2):scale(1.3)
		end
	end
end

function slot3.canLevelUp(slot0, slot1, slot2)
	uv3 = "skillLevel"
	slot3 = slot3(slot1.skillLevel, csv.skill[slot1.skillId].costID, slot1.fastUpgradeNum)

	if slot0.cardLv:read() < slot1.skillLevel + slot1.fastUpgradeNum then
		slot0:showTip(gLanguageCsv.spriteLevelNotEnough, slot2)

		return false
	end

	if slot0.serverSkillPoint:read() < slot1.fastUpgradeNum then
		slot0:onSkillAddClick(slot2)

		return false
	end

	if slot0.clientGold:read() < slot3 then
		slot0:showTip(gLanguageCsv.skillLevelGoldNotEnough, slot2)

		return false
	end

	return true
end

function slot3.showTip(slot0, slot1, slot2)
	if slot2 then
		gGameUI:showTip(slot1)
	end
end

function slot3.upgradeFloatingWord(slot0, slot1, slot2)
	slot0.floatingWordData = slot0.floatingWordData or {}
	slot3 = slot0.floatingWordData

	for slot8, slot9 in pairs(string.split(csv.skill[slot2].upLvDesc, "|")) do
		if not slot3[slot2] then
			slot3[slot2] = {}
		end

		table.insert(slot3[slot2], slot9)
	end

	if not slot0.oldselectDbId then
		slot0.oldselectDbId = slot0.selectDbId:read()
	end

	if not slot0.skillId then
		slot0.skillId = slot2
	end

	if slot0.skillId ~= slot2 then
		slot0.skillId = slot2
		slot0.floatingWordIndex = false
	end

	if not slot0.floatingWordIndex then
		slot0.floatingWordIndex = true
		slot5 = 0

		slot0:enableSchedule():schedule(function (slot0)
			uv2 = "next"
			uv3 = "tolua"

			if next(slot2[slot3]) == nil then
				uv2 = "isnull"

				if not tolua.isnull(slot2) then
					for slot4 = 1, 4 do
						uv5 = "isnull"

						if slot5:get("num" .. slot4) then
							slot5:hide()
						end
					end
				end

				uv1 = "get"
				slot1 = slot1.unSchedule
				uv4 = "tolua"

				slot1(slot1, "upgradeFloatingWord" .. slot4)

				uv1 = "get"
				slot1.floatingWordIndex = false
			else
				uv1 = "get"
				uv2 = "get"

				if slot1.oldselectDbId ~= slot2.selectDbId:read() then
					uv1 = "get"
					uv2 = "get"
					slot2 = slot2.selectDbId:read()
					slot1.oldselectDbId = slot2
					uv2 = "next"

					for slot4, slot5 in pairs(slot2) do
						uv6 = "next"
						slot6[slot4] = {}
					end
				else
					uv2 = "isnull"

					if tolua.isnull(slot2) then
						uv1 = "next"
						uv2 = "tolua"
						slot1[slot2] = {}

						return
					end

					uv1 = "num"

					if slot1 < 4 then
						uv1 = "num"

						if not (slot1 + 1) then
							slot1 = 1
						end
					end

					uv4 = 0.5
					uv1 = "isnull"
					uv4 = "num"

					if not slot1:get("num" .. slot4) then
						uv4 = "next"
						uv5 = "tolua"
						slot4 = cc.p(0, 0.5)
						uv4 = "isnull"
						uv7 = "num"

						text.addEffect(cc.Label:createWithTTF(slot4[slot5][1], ui.FONT_PATH, 50):align(slot4, 300, 80):addTo(slot4, 4000, "num" .. slot7), {
							color = cc.c4b(92, 153, 113, 255)
						})
					end

					uv4 = "next"
					uv5 = "tolua"

					slot1:text(slot4[slot5][1]):xy(300, 80):show():opacity(255)

					slot4 = 0.3
					slot2 = transition.executeSequence(slot1):moveBy(0.4, 0, 100):fadeOut(slot4)
					slot3 = slot2

					slot2.done(slot3)

					uv3 = "next"
					uv4 = "tolua"

					table.remove(slot3[slot4], 1)
				end
			end
		end, 0.2, 0.2, "upgradeFloatingWord" .. slot2)
	end
end

function slot3.onSkillAddClick(slot0, slot1)
	if not slot1 then
		return
	end

	gGameUI:stackUI("city.card.skill_buypoint", nil, , slot0:createHandler("getBuyInfoCb"))
end

function slot3.getBuyInfoCb(slot0)
	if dataEasy.getSkillPointMax(slot0.roleLv:read()) <= slot0.serverSkillPoint:read() then
		gGameUI:showTip(gLanguageCsv.skillPointBuyNoNeed)

		return
	end

	gGameApp:requestServer("/game/role/skill/point/buy", function (slot0)
		gGameUI:showTip(gLanguageCsv.hasBuy)
	end)
end

function slot3.onItemTipClick(slot0, slot1, slot2, slot3)
	if dataEasy.isSkillChange() then
		gGameUI:stackUI("common.skill_detail", nil, , {
			skillId = slot3.skillId,
			skillLevel = slot3.skillLevel,
			cardId = slot0.cardId:read(),
			star = slot0.star:read(),
			isZawake = dataEasy.isZawakeSkill(slot3.skillId, slot0.zawakeSkills:read())
		})

		return
	end

	gGameUI:stackUI("common.skill_detail", nil, {
		clickClose = true,
		dispatchNodes = slot1
	}, {
		skillId = slot3.skillId,
		skillLevel = slot3.skillLevel,
		cardId = slot0.cardId:read(),
		star = slot0.star:read(),
		isZawake = dataEasy.isZawakeSkill(slot3.skillId, slot0.zawakeSkills:read())
	})
end

return slot3
