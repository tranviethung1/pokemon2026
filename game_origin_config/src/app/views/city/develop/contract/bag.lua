slot0 = class("ContractBagView", Dialog)
slot0.RESOURCE_FILENAME = "contract_bag.json"
slot0.RESOURCE_BINDING = {
	["filterPanel.arrow"] = "filterArrow",
	noItem = "noItem",
	item = "item",
	innweList = "innweList",
	btnClose = {
		varname = "btnClose",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				yMargin = 20,
				xMargin = 50,
				asyncPreload = 24,
				columnSize = 6,
				data = bindHelper.self("contractsData"),
				item = bindHelper.self("innweList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1:multiget("icon", "locked", "name").icon, {
						class = "icon_key",
						props = {
							noListener = true,
							data = {
								key = slot3.id,
								num = slot3.num,
								dbId = slot3.dbid
							},
							specialKey = {
								contractType = true,
								lv = slot3.level,
								unitId = slot3.unitId
							},
							onNode = function (slot0)
								slot0:xy(105, 120)
								slot0:setTouchEnabled(false)
							end
						}
					})

					if slot3.cardDbid then
						bind.extend(slot0, slot1, {
							class = "red_hint",
							props = {
								listenData = {
									dbid = slot3.dbid
								},
								specialTag = {
									"contractUpgradeOrAdvance"
								},
								onNode = function (slot0)
									slot0:xy(220, 250)
								end
							}
						})
					end

					slot4.locked:visible(slot3.locked)
					slot4.name:text(slot3.name)
					adapt.oneLineCenterPos(cc.p(125, 40), slot3.locked and {
						slot4.locked,
						slot4.name
					} or slot4.name, cc.p(5, 0))
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot0:getIdx(slot2), slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	},
	filterPanel = {
		varname = "btnFilter",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onFilter")
			}
		}
	},
	["filterPanel.txt"] = {
		varname = "filterTxt",
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

function slot0.onCreate(slot0)
	slot0:initModel()
	idlereasy.any({
		slot0.contracts,
		slot0.filterType
	}, function (slot0, slot1, slot2)
		uv3 = "updateShowData"

		slot3:updateShowData(slot1, slot2)
	end)
	Dialog.onCreate(slot0)
end

function slot0.initModel(slot0)
	slot0.contracts = gGameModel.role:getIdler("contracts")
	slot0.contractsData = idlers.new({})
	slot0.filterType = idler.new(0)
end

function slot0.updateShowData(slot0, slot1, slot2)
	dataEasy.tryCallFunc(slot0.list, "updatePreloadCenterIndexAdaptFirst")

	slot3 = {}
	slot4 = csv.contract.contract

	for slot8, slot9 in pairs(slot1) do
		slot10 = gGameModel.contracts:find(slot9):read("card_db_id", "locked", "sum_exp", "contract_id", "level", "advance", "id")

		if slot2 == 0 or slot2 == slot4[slot10.contract_id].type then
			slot11 = nil

			if slot10.card_db_id and gGameModel.cards:find(slot10.card_db_id) then
				slot11 = dataEasy.getUnitId(slot12:read("card_id"), slot12:read("skin_id"))
			end

			slot12 = slot4[slot10.contract_id]

			if slot10.card_db_id or slot10.locked or slot10.sum_exp > 0 then
				slot3[slot9] = {
					num = 1,
					id = slot10.contract_id,
					contractDbid = slot10.id,
					name = slot12.name,
					dbid = slot9,
					level = slot10.level,
					unitId = slot11,
					locked = slot10.locked,
					advance = slot10.advance,
					quality = slot12.quality,
					cardDbid = slot10.card_db_id,
					isEquip = slot10.card_db_id and true or false
				}
			elseif slot3[slot10.contract_id] then
				slot3[slot10.contract_id].num = slot3[slot10.contract_id].num + 1
			else
				slot3[slot10.contract_id] = slot13
			end
		end
	end

	slot5 = 0
	slot3 = itertools.map(slot3, function ()
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

	table.sort(slot3, function (slot0, slot1)
		if slot0.isEquip ~= slot1.isEquip then
			return slot0.isEquip
		end

		if slot0.locked ~= slot1.locked then
			return slot0.locked
		end

		if slot0.quality ~= slot1.quality then
			return slot1.quality < slot0.quality
		end

		if slot0.advance ~= slot1.advance then
			return slot1.advance < slot0.advance
		end

		if slot0.level ~= slot1.level then
			return slot1.level < slot0.level
		end

		return slot0.id < slot1.id
	end)
	slot0.noItem:visible(#slot3 == 0)
	slot0.noItem:get("textNote"):text(gLanguageCsv.contractBagEmptyTip)
	slot0.contractsData:update(slot3)
end

function slot0.onFilterBtnClick(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0.filterType:set(slot3)
end

function slot0.getDbidTb(slot0)
	slot1 = {}

	for slot5, slot6 in slot0.contractsData:ipairs() do
		table.insert(slot1, slot6:read().contractDbid)
	end

	return slot1
end

function slot0.onFilter(slot0)
	slot0.filterArrow:setRotation(180)

	slot1 = slot0.btnFilter:size()
	slot2 = slot0.btnFilter:parent():convertToWorldSpace(cc.p(slot0.btnFilter:xy()))
	slot2.x = slot2.x - slot1.width / 2
	slot2.y = slot2.y - slot1.height / 2

	gGameUI:stackUI("city.develop.contract.filter", nil, , slot2, {
		"left",
		"top"
	}, slot0:createHandler("setFilterType"))
end

function slot0.setFilterType(slot0, slot1)
	slot0.filterArrow:setRotation(0)

	if slot1 then
		slot0.filterType:set(slot1)
		slot0.filterTxt:text(gLanguageCsv["contractType" .. slot1] or gLanguageCsv.typeFilter)
	end
end

function slot0.onItemClick(slot0, slot1, slot2, slot3)
	gGameUI:stackUI("city.develop.contract.strength", nil, , {
		idx = slot2.k,
		dbidTb = slot0:getDbidTb(),
		dbid = slot3.dbid,
		cb = slot0:createHandler("refreshData")
	})
end

function slot0.refreshData(slot0)
	slot0.filterType:notify()
end

return slot0
