slot0 = {
	mp = 2,
	hp = 1,
	life = 3
}
slot1 = {
	supply = 2,
	skill = 4,
	point = 3,
	attr = 1,
	fetter = 5
}

function slot2(slot0, slot1, slot2, slot3)
	for slot7 = 1, math.huge do
		if not slot1:get("item" .. slot7) then
			break
		end

		slot8:removeFromParent()
	end

	slot1:multiget("titlePanel", "list", "textDesc").titlePanel:visible(slot3.itemType == "title")
	slot4.textDesc:visible(slot3.itemType == "empty")
	slot4.list:visible(slot3.itemType == "item")

	if slot3.itemType == "title" then
		slot6 = slot1:get("titlePanel"):getBoundingBox()

		slot1:size(cc.size(slot0:size().width, slot6.height))
		slot1:get("titlePanel"):y(slot6.height / 2)

		slot7 = slot4.titlePanel:get("textTitle")

		slot7:text(slot3.title)
		text.addEffect(slot7, {
			outline = {
				color = ui.COLORS.OUTLINE.WHITE
			}
		})
		adapt.oneLineCenterPos(cc.p(slot4.titlePanel:get("textTitle"):xy()), {
			slot4.titlePanel:get("imgLeft"),
			slot4.titlePanel:get("textTitle"),
			slot4.titlePanel:get("imgRight")
		}, cc.p(40, 0))
	elseif slot3.itemType == "empty" then
		slot6 = slot0.cloneItem:size()

		slot1:size(cc.size(slot5, slot6.height + 10))
		slot1:get("list"):size(cc.size(slot5, slot6.height + 10))
		slot4.textDesc:text(slot3.desc)
	else
		slot6 = slot0.cloneItem:size()

		slot1:size(cc.size(slot5, slot6.height + 10))
		slot1:get("list"):size(cc.size(slot5, slot6.height + 10))
		bind.extend(slot0, slot1:get("list"), {
			class = "listview",
			props = {
				data = slot3.buffDatas,
				item = slot0.cloneItem,
				topPadding = padding,
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("icon"):texture(slot3.icon):scale(1.5)
					slot1:get("logo"):hide()

					if csv.hell_random_tower.buffs[slot3.buffId].logo ~= "" then
						slot1:get("logo"):show():texture(slot4.logo)
					end

					uv8 = "csv"
					uv9 = "hell_random_tower"

					slot1:onClick(functools.partial(slot8.clickCell, slot9, slot3))
				end
			}
		})
	end
end

slot4 = class("HellRandomTowerLookBuffView", cc.load("mvc").ViewBase)
slot4.RESOURCE_FILENAME = "random_tower_look_buff.json"
slot4.RESOURCE_BINDING = {
	centerItem = "centerItem",
	subList = "subList",
	textNum = "textNum",
	rightItem = "rightItem",
	buffItem = "buffItem",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	centerList = {
		varname = "centerList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 6,
				data = bindHelper.self("centerDatas"),
				item = bindHelper.self("centerItem"),
				cloneItem = bindHelper.self("buffItem"),
				clonSubList = bindHelper.self("subList"),
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
				clickCell = bindHelper.self("onClickItem")
			}
		}
	},
	["rightTitlePanel.textTitle"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	rightList = {
		varname = "listview",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("attrDatas"),
				item = bindHelper.self("rightItem"),
				dataOrderCmp = function (slot0, slot1)
					return slot0.sortKey < slot1.sortKey
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("textTitle", "textNum")

					slot4.textTitle:text(slot3.name)
					adapt.setTextScaleWithWidth(slot4.textTitle, nil, 240)

					slot5 = "+0%"
					slot6 = ui.COLORS.NORMAL.WHITE

					if tonumber(slot3.num) > 0 then
						slot5 = "+" .. dataEasy.getAttrValueString(slot2, slot3.num .. slot3.symbol)
					elseif tonumber(slot3.num) < 0 then
						slot5 = dataEasy.getAttrValueString(slot2, slot3.num .. slot3.symbol)
						slot6 = ui.COLORS.NORMAL.RED
					end

					text.addEffect(slot4.textNum, {
						color = slot6
					})
					slot4.textNum:text(slot5)
				end
			}
		}
	}
}

function slot4.onCreate(slot0, slot1, slot2)
	slot0:initModel()

	slot0.cb = slot2
	slot0.centerDatas = idlers.new()
	slot0.attrDatas = idlers.new()
	slot3 = {
		[7] = {
			symbol = "",
			num = 0,
			sortKey = 1,
			name = gLanguageCsv.spaceDamage
		},
		[8] = {
			symbol = "",
			num = 0,
			sortKey = 2,
			name = gLanguageCsv.spaceSpecialDamage
		},
		[9] = {
			symbol = "",
			num = 0,
			sortKey = 3,
			name = gLanguageCsv.spaceDefence
		},
		[10] = {
			symbol = "",
			num = 0,
			sortKey = 4,
			name = gLanguageCsv.spaceSpecialDefence
		},
		[14] = {
			symbol = "",
			num = 0,
			sortKey = 5,
			name = gLanguageCsv.spaceStrike
		},
		[15] = {
			symbol = "",
			num = 0,
			sortKey = 6,
			name = gLanguageCsv.attrStrikeDamage
		},
		[17] = {
			symbol = "",
			num = 0,
			sortKey = 7,
			name = gLanguageCsv.spaceBlock
		},
		[26] = {
			symbol = "",
			num = 0,
			sortKey = 8,
			name = gLanguageCsv.spaceSuckBlood
		},
		[22] = {
			symbol = "",
			num = 0,
			sortKey = 9,
			name = gLanguageCsv.attrDamageAdd
		},
		[23] = {
			symbol = "",
			num = 0,
			sortKey = 10,
			name = gLanguageCsv.attrDamageSub
		}
	}
	slot4 = {
		{
			buffType = slot6.skill,
			title = slot6
		},
		{
			buffType = slot6.fetter,
			title = slot6
		},
		{
			buffType = slot6.point,
			title = gLanguageCsv.hellRandomTowerBuff5
		}
	}
	uv6 = "initModel"
	slot6 = gLanguageCsv.hellRandomTowerBuff3
	uv6 = "initModel"
	slot6 = gLanguageCsv.hellRandomTowerBuff4
	uv6 = "initModel"

	idlereasy.when(slot0.buffs, function (slot0, slot1)
		slot2 = {}

		for slot6, slot7 in ipairs(slot1) do
			uv10 = "ipairs"

			if slot10.attr == csv.hell_random_tower.buffs[slot7].buffType then
				for slot13 = 1, 3 do
					slot14 = slot8["attrNum" .. slot13]
					slot16 = slot13
					uv16 = "csv"

					if slot16[slot8["attrType" .. slot16]] ~= nil and slot14 ~= "" then
						if string.find(slot14, "%%") then
							slot16 = string.gsub(slot14, "%%", "")
							slot14 = slot16
							uv16 = "csv"
							slot16[slot15].symbol = "%"
						end

						uv16 = "csv"
						uv17 = "csv"
						slot16[slot15].num = slot17[slot15].num + tonumber(slot14)
					end
				end
			end

			uv10 = "ipairs"

			if slot10.point ~= slot9 then
				uv10 = "ipairs"

				if slot10.skill ~= slot9 then
					uv10 = "ipairs"

					if slot10.fetter == slot9 then
						if csvSize(slot8.unlockCondition) > 0 then
							uv10 = "ipairs"
							slot9 = slot10.fetter
						end

						if not slot2[slot9] then
							slot2[slot9] = {}
						end

						table.insert(slot2[slot9], slot7)
					end
				end
			end
		end

		uv3 = "hell_random_tower"
		uv5 = "csv"

		slot3.attrDatas:update(slot5)

		slot3 = {}
		uv5 = "buffs"

		for slot7, slot8 in ipairs(slot5) do
			table.insert(slot3, {
				itemType = "title",
				title = slot8.title
			})

			if not slot2[slot8.buffType] then
				table.insert(slot3, {
					itemType = "empty",
					desc = string.format(gLanguageCsv.noSomeAdd, slot8.title)
				})
			else
				slot10 = {}

				for slot14, slot15 in ipairs(slot2[slot9]) do
					table.insert(slot10, {
						icon = csv.hell_random_tower.buffs[slot15].icon,
						buffId = slot15
					})

					if slot14 % 5 == 0 then
						table.insert(slot3, {
							itemType = "item",
							buffDatas = slot10
						})

						slot10 = {}
					end
				end

				if next(slot10) ~= nil then
					table.insert(slot3, {
						itemType = "item",
						buffDatas = slot10
					})
				end
			end
		end

		uv4 = "hell_random_tower"

		slot4.centerDatas:update(slot3)
	end)
end

function slot4.initModel(slot0)
	slot0.roomInfo = gGameModel.hell_random_tower:getIdler("room_info")
	slot0.buffs = gGameModel.hell_random_tower:getIdler("buffs")
end

function slot4.onitemClick(slot0, slot1, slot2, slot3)
	slot0.selectIdx:set(slot2.k)
end

function slot4.onClickItem(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot4.target
	slot6, slot7 = slot5:xy()

	gGameUI:stackUI("city.adventure.random_tower.buff_detail", nil, , {
		cfg = csv.hell_random_tower.buffs[slot3.buffId],
		buffId = slot3.buffId,
		pos = slot5:getParent():convertToWorldSpace(cc.p(slot6 - 290, slot7 - 90)),
		target = slot1.item
	})
end

return slot4
