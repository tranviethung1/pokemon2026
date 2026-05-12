slot0 = {
	received = 2,
	noReach = 0,
	canReceive = 1
}
slot1 = {
	reunion = 1,
	senior = 2
}
slot2 = {
	reunion = 2,
	gift = 1
}
slot3 = {
	ReunionGift = 1,
	TaskAward = 3,
	BindAward = 2,
	PointAward = 4
}
slot4 = class("ReunionBindView", cc.load("mvc").ViewBase)
slot4.RESOURCE_FILENAME = "reunion_bind.json"
slot4.RESOURCE_BINDING = {
	["rightPanel.invitePanel.worldBtn"] = "worldBtn",
	["rightPanel.bindPanel.headBg"] = "bindHeadBg",
	["topPanel.bg.reunion"] = "topPanelReunion",
	["rightPanel.receiveBtn.label"] = "receiveBtnLabel",
	["rightPanel.bindPanel.nameBg"] = "bindNameBg",
	["rightPanel.labelList"] = "rightPanelLabelList",
	["rightPanel.selfPanel.nameBg"] = "selfNameBg",
	["rightPanel.invitePanel"] = "invitePanel",
	["rightPanel.bindPanel"] = "bindPanel",
	["rightPanel.list"] = "list",
	["rightPanel.selfPanel.headBg"] = "selfHeadBg",
	["rightPanel.selfPanel"] = "selfPanel",
	["topPanel.bg.senior"] = "topPanelSenior",
	["topPanel.bg.reunion.title_0"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(255, 217, 121, 255)
				}
			}
		}
	},
	["topPanel.bg.reunion.title"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 5,
					color = cc.c4b(162, 60, 17, 255)
				},
				shadow = {
					size = 2,
					color = cc.c4b(255, 220, 23, 255),
					offset = cc.size(0, -3)
				}
			}
		}
	},
	["topPanel.bg.senior.title"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 5,
					color = cc.c4b(162, 60, 17, 255)
				},
				shadow = {
					size = 2,
					color = cc.c4b(255, 220, 23, 255),
					offset = cc.size(0, -3)
				}
			}
		}
	},
	["topPanel.btnRule"] = {
		varname = "btnRule",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRule")
			}
		}
	},
	["rightPanel.selfPanel.nameBg.name"] = {
		varname = "selfName",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 2,
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	["rightPanel.bindPanel.nameBg.name"] = {
		varname = "bindName",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 2,
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	["rightPanel.invitePanel.recommendBtn"] = {
		varname = "recommendBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRecommendBtnClick")
			}
		}
	},
	["rightPanel.goPanel"] = {
		varname = "goPanel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onGoTaskClick")
			}
		}
	},
	["rightPanel.receiveBtn"] = {
		varname = "receiveBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onReceiveClick")
			}
		}
	}
}

function slot4.onCreate(slot0, slot1, slot2)
	slot0.yyID = slot1
	slot0.goPanelClick = slot2.goPanelClick
	slot4 = slot2.bindInfo

	slot0:initModel()

	slot0.role_type = slot0.reunion:read().role_type
	slot8 = {
		methods = slot9
	}
	slot9 = {
		ended = functools.partial(slot0.onWorldInvite, slot0, "worldBtn")
	}

	bind.touch(slot0, slot0.worldBtn, slot8)

	for slot8, slot9 in csvPairs(csv.yunying.reunion_gift) do
		if slot9.huodongID == csv.yunying.yyhuodong[slot1].huodongID then
			uv11 = "yyID"

			if slot9.type == slot11.reunion and slot9.target == slot0.role_type then
				slot0.csvID = slot8

				uiEasy.createItemsToList(slot0, slot0.list, slot9.item)
			end
		end
	end

	uv7 = "csv"
	slot7 = slot7.reunion == slot0.role_type

	slot0.topPanelReunion:visible(slot7)

	uv7 = "csv"

	slot0.topPanelSenior:visible(slot7.senior == slot0.role_type)
	slot0:createHead(slot0.selfPanel:get("headBg"), slot0.figure)
	slot0.selfName:text(slot0.roleName)
	slot0.selfNameBg:visible(true)
	slot0.selfPanel:get("noPlayer"):visible(false)
	slot0.OtherRoleID:addListener(function (slot0, slot1)
		if slot0 == slot1 then
			return
		end

		if slot0 ~= "" then
			uv2 = ""

			slot2:onGetInfo(slot0, function (slot0)
				uv2 = "view"

				slot2:showBindInfo(slot0.view)
			end)
		else
			uv2 = ""
			slot2 = slot2.bindPanel:get("noPlayer")
			slot2 = slot2.visible

			slot2(slot2, true)

			uv2 = ""

			slot2.bindNameBg:visible(false)
		end
	end)
	idlereasy.any({
		slot0.reunion,
		slot0.reunionBindRoleId
	}, function (slot0, slot1, slot2)
		uv3 = "role_type"
		uv4 = "reunion"

		if slot3.role_type == slot4.reunion then
			if slot2 then
				uv3 = "role_type"
				slot3 = slot3.setOtherRoleID

				slot3(slot3, slot2)

				uv3 = "role_type"
				slot3 = slot3.receiveBtn
				slot3 = slot3.visible

				slot3(slot3, true)

				uv3 = "role_type"
				slot3 = slot3.invitePanel
				slot4 = slot3

				slot3.visible(slot4, false)

				uv4 = "role_type"

				text.deleteAllEffect(slot4.receiveBtnLabel)
			else
				uv3 = "role_type"
				slot3 = slot3.receiveBtn
				slot3 = slot3.visible

				slot3(slot3, false)

				uv3 = "role_type"

				slot3.invitePanel:visible(true)

				if slot1.world_invite_time then
					slot3 = time.getTime() - slot1.world_invite_time > 0 and slot3 or 30
					uv4 = "role_type"

					slot4:setBtnTime("(%s S)", slot3 < 30 and 30 - slot3 or 0)
				end
			end

			if slot1.gift.bind then
				uv4 = "role_type"

				if slot1.gift.bind[1] == slot4.csvID then
					uv4 = "setOtherRoleID"

					if slot1.gift.bind[2] == slot4.received then
						uv3 = "role_type"

						slot3.goPanel:visible(true)
					end
				end
			end
		end

		if not slot1.gift then
			slot3 = cache.setShader
			uv4 = "role_type"

			slot3(slot4.receiveBtn, false, "hsl_gray")

			uv3 = "role_type"
			slot3 = slot3.receiveBtnLabel
			slot3 = slot3.text

			slot3(slot3, gLanguageCsv.notReach)

			uv3 = "role_type"

			slot3.receiveBtn:setTouchEnabled(false)
		elseif slot1.gift.bind then
			uv4 = "role_type"

			if slot1.gift.bind[1] == slot4.csvID then
				uv4 = "setOtherRoleID"

				if slot1.gift.bind[2] == slot4.canReceive then
					slot3 = cache.setShader
					uv4 = "role_type"

					slot3(slot4.receiveBtn, false, "normal")

					uv3 = "role_type"
					slot3 = slot3.receiveBtnLabel
					slot4 = slot3

					slot3.text(slot4, gLanguageCsv.spaceReceive)

					slot3 = text.addEffect
					uv4 = "role_type"

					slot3(slot4.receiveBtnLabel, {
						glow = {
							color = ui.COLORS.GLOW.WHITE
						}
					})

					uv3 = "role_type"

					slot3.receiveBtn:setTouchEnabled(true)
				end
			end
		elseif slot1.gift.bind then
			uv4 = "role_type"

			if slot1.gift.bind[1] == slot4.csvID then
				uv4 = "setOtherRoleID"

				if slot1.gift.bind[2] == slot4.received then
					slot3 = cache.setShader
					uv4 = "role_type"

					slot3(slot4.receiveBtn, false, "hsl_gray")

					uv3 = "role_type"
					slot3 = slot3.receiveBtnLabel
					slot3 = slot3.text

					slot3(slot3, gLanguageCsv.received)

					uv3 = "role_type"

					slot3.receiveBtn:setTouchEnabled(false)
				end
			end
		end
	end)
	slot0.bindPanel:get("noPlayer"):visible(true)
	slot0.bindNameBg:visible(false)

	slot7 = slot4

	slot0:showBindInfo(slot7)

	uv7 = "csv"

	if slot0.role_type == slot7.reunion then
		slot0:createRichText(gLanguageCsv.reunionBindTextByReunion)
		gGameModel.forever_dispatch:getIdlerOrigin("reunionBindPlayer"):set(slot0.reunion:read().info.yyID)
	else
		slot0.receiveBtn:visible(true)
	end
end

function slot4.showBindInfo(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.bindPanel:get("noPlayer"):visible(false)
	slot0.bindNameBg:visible(true)
	slot0.bindName:text(slot1.name)

	slot2 = slot0.createHead

	slot2(slot0, slot0.bindPanel:get("headBg"), slot1.figure)

	uv2 = "bindPanel"

	if slot2.senior == slot0.role_type then
		slot0:createRichText(string.format(gLanguageCsv.reunionBindTextBySenior, slot1.name))
	end

	slot0.bindHeadBg:get("headBtn"):onClick(functools.partial(slot0.onBindHeadBtnClick, slot0, slot1))
end

function slot4.initModel(slot0, slot1)
	slot0.reunion = gGameModel.role:getIdler("reunion")
	slot0.reunionBindRoleId = gGameModel.reunion_record:getIdler("bind_role_db_id")
	slot0.figure = gGameModel.role:read("figure")
	slot0.roleName = gGameModel.role:read("name")
	slot0.datas = idlers.new()
	slot0.OtherRoleID = idler.new(slot1 and slot1.id or "")

	slot0.goPanel:visible(false)
	slot0.invitePanel:visible(false)
end

function slot4.createRichText(slot0, slot1)
	slot0.rightPanelLabelList:removeAllItems()
	beauty.textScroll({
		fontSize = 42,
		isRich = true,
		verticalSpace = 10,
		list = slot0.rightPanelLabelList,
		strs = slot1
	})
end

function slot4.createHead(slot0, slot1, slot2)
	slot3 = slot1:get("panel")

	slot3:removeAllChildren()

	slot7 = cc.Sprite:create(gRoleFigureCsv[slot2].res):anchorPoint(0.5, 0.5):xy(slot3:width() / 2, 0):scale(0.8):addTo(slot3, 2, "Icon")
end

function slot4.setOtherRoleID(slot0, slot1)
	slot0.OtherRoleID:set(slot1)
end

function slot4.onReceiveClick(slot0)
	if slot0.reunion:read().info.end_time - time.getTime() < 0 then
		gGameUI:showTip(gLanguageCsv.activityOver)

		return
	end

	uv7 = "read"

	gGameApp:requestServer("/game/yy/reunion/award/get", function (slot0)
		slot1 = gGameUI
		slot2 = slot1
		slot1 = slot1.showGainDisplay

		slot1(slot2, slot0)

		uv1 = "gGameUI"
		uv2 = "showGainDisplay"

		if slot1.role_type == slot2.reunion then
			uv1 = "gGameUI"

			slot1.goPanel:visible(true)
		end
	end, slot0.yyID, slot0.csvID, slot7.BindAward)
end

function slot4.onGoTaskClick(slot0)
	if slot0.goPanelClick then
		slot0.goPanelClick:set(1)
	end
end

function slot4.onGetInfo(slot0, slot1, slot2)
	gGameApp:requestServer("/game/role_info", function ()
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
	end, slot1)
end

function slot4.onRule(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"))
end

function slot4.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.reunionRule)
		end),
		slot2.noteText(148),
		slot2.noteText(101001, 101020)
	}
end

function slot4.onWorldInvite(slot0, slot1)
	gGameApp:requestServer("/game/yy/reunion/bind/invite", function (slot0)
		if slot0.view.result then
			uv1 = "view"

			slot1:setBtnTime("(%s S)", 30)
		end
	end, "world")
end

function slot4.onRecommendBtnClick(slot0)
	require("app.views.city.activity.reunion.invite").sendProtocol(1, function (slot0, slot1)
		gGameUI:stackUI("city.activity.reunion.invite", nil, , slot0, slot1)
	end)
end

function slot4.onBindHeadBtnClick(slot0, slot1, slot2)
	slot3 = slot2.target
	slot4, slot5 = slot3:xy()
	slot6 = slot3:getParent():convertToWorldSpace(cc.p(slot4, slot5))
	slot6.x = slot6.x + 250
	slot6.y = slot6.y + 400

	gGameUI:stackUI("city.chat.personal_info", nil, , slot6, {
		role = slot1
	})
end

function slot4.setBtnTime(slot0, slot1, slot2)
	slot3 = 0

	slot0:enableSchedule():unSchedule(slot0.worldBtn:name())

	if slot2 > 30 or slot2 <= 0 then
		cache.setShader(slot4, false, "normal")
		slot4:get("label"):text(gLanguageCsv.worldInvitation)
		slot4:setTouchEnabled(true)

		return
	end

	slot0:enableSchedule():schedule(function ()
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
	end, 1, 0, slot5)
end

return slot4
