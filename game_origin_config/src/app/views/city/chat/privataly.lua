slot0 = 50
slot1 = class("ChatPrivatalyView", Dialog)
slot2 = cc.load("mvc").ViewBase

function slot3(slot0)
	slot1 = time.getDate(slot0)

	if time.getTime() - slot0 > 604800 then
		return string.formatex(gLanguageCsv.timeMonthDay, {
			month = slot1.month,
			day = slot1.day
		}) .. " " .. string.format("%02d:%02d", slot1.hour, slot1.min)
	elseif slot1.day ~= time.getDate(time.getTime()).day then
		return gLanguageCsv["weekday" .. (slot1.wday == 1 and 7 or slot1.wday - 1)] .. " " .. slot2
	else
		return slot2
	end
end

slot1.RESOURCE_FILENAME = "chat_privataly.json"
slot1.RESOURCE_BINDING = {
	tipsText = "tipsText",
	item = "item",
	["leftPanel.item"] = "leftItem",
	["bottomPanel.textInput"] = "textInput",
	["leftPanel.sliderBg"] = "sliderBg",
	leftPanel = "leftPanel",
	tipsBg = "tipsBg",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["bottomPanel.btnSend"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSendClick")
			}
		}
	},
	["bottomPanel.btnSend.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["bottomPanel.btnPicture"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPicClick")
			}
		}
	},
	["leftPanel.list"] = {
		varname = "leftList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = -20,
				asyncPreload = 6,
				data = bindHelper.self("personInfo"),
				item = bindHelper.self("leftItem"),
				barBg = bindHelper.self("sliderBg"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("selected", "name", "level", "lv", "btnDelete", "icon", "itemNode")

					slot4.itemNode:setEnabled(not slot3.select)
					slot4.selected:visible(slot3.select == true)
					slot4.icon:visible(slot3.select == true)

					if slot3.select == true then
						itertools.invoke({
							slot4.name,
							slot4.level,
							slot4.lv
						}, "setTextColor", ui.COLORS.NORMAL.WHITE)
					else
						itertools.invoke({
							slot4.name,
							slot4.level,
							slot4.lv
						}, "setTextColor", ui.COLORS.NORMAL.DEFAULT)
					end

					adapt.oneLinePos(slot4.lv, slot4.level, cc.p(5, 0), "left")
					slot4.level:text(slot3.role.level)
					slot4.name:text(slot3.role.name)
					bind.extend(slot0, slot4.itemNode, {
						event = "extend",
						class = "role_logo",
						props = {
							vip = false,
							level = false,
							logoId = slot3.role.logo,
							frameId = slot3.role.frame or 1,
							onNode = function (slot0)
								slot0:x(110):scale(0.8):z(6)
							end
						}
					})
					slot4.icon:onTouch(functools.partial(slot0.iconClick, slot2, slot3))
					slot4.itemNode:onTouch(functools.partial(slot0.itemClick, slot2, slot3))
				end,
				onBeforeBuild = function (slot0)
					slot1, slot2 = slot0:xy()
					slot4, slot5 = slot0.barBg:xy()
					slot6 = slot0.barBg:size()

					slot0:setScrollBarEnabled(true)
					slot0:setScrollBarColor(cc.c3b(241, 59, 84))
					slot0:setScrollBarOpacity(255)
					slot0:setScrollBarWidth(13)
					slot0:setScrollBarAutoHideEnabled(false)
					slot0:setScrollBarPositionFromCorner(cc.p(slot6.width + 1, (slot0:size().height - slot6.height) / 2 + 10))
				end
			},
			handlers = {
				itemClick = bindHelper.self("onChangePerson"),
				delClick = bindHelper.self("onDeletePerson"),
				iconClick = bindHelper.self("playerInfo")
			}
		}
	},
	list = {
		varname = "rightList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = -10,
				preloadBottom = true,
				asyncPreload = 5,
				backupCached = false,
				data = bindHelper.self("chatContents"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					itertools.invoke({
						slot1:get("mine"),
						slot1:get("other")
					}, "hide")

					slot5 = slot1:get(slot3.isMine and "mine" or "other"):visible(true)
					slot6 = slot5:y()

					bind.extend(slot0, slot5, {
						event = "extend",
						class = "role_logo",
						props = {
							vip = false,
							level = false,
							logoId = slot3.role.logo,
							frameId = slot3.role.frame,
							onNode = function (slot0)
								uv3 = "xy"

								slot0:xy(slot3.isMine and 1210 or 100, 90):scale(0.8)
							end
						}
					})

					slot9 = 0
					slot10 = slot1:size()
					slot11 = nil

					slot5:multiget("imgEmoji", "imgTextBG", "txtContent").imgEmoji:visible(gEmojiCsv[string.match(slot3.msg, "%[(%w+)%]")] ~= nil)

					if gEmojiCsv[slot8] then
						slot7.imgEmoji:texture(gEmojiCsv[slot8].resource)

						slot9 = slot7.imgEmoji:size().height
						slot12 = slot7.imgEmoji:getBoundingBox()

						slot7.imgTextBG:size(slot12.width + 40, slot12.height + 20)
						slot1:size(slot1:size().width, slot12.height + 86)

						slot11 = slot5:size().height - slot12.height - 86
					elseif itertools.first(game.MESSAGE_SHOW_TYPE[slot3.type], 4) then
						slot5:removeChildByName("richtext")

						slot12, slot13 = slot7.txtContent:xy()
						slot14 = slot3.isMine and -25 or 57
						slot15 = rich.createWithWidth(slot3.msg, 40, nil, 550, nil, cc.p(0, 0))

						slot15:anchorPoint(slot3.isMine and 1 or 0, 1):xy(slot12, slot13 + 5):addTo(slot5, 5, "richtext")
						slot7.imgTextBG:size(slot15:size().width + 80, slot15:size().height + 50)
						slot1:size(slot1:size().width, slot15:size().height + 178)

						slot11 = slot5:size().height - slot15:size().height - 178

						uiEasy.setUrlHandler(slot15, slot3)
					else
						slot13, slot14 = slot5:get("txtContent"):xy()
						slot15 = cc.Label:createWithTTF(slot3.msg, ui.FONT_PATH, 40)

						slot15:anchorPoint(slot3.isMine and 1 or 0, 1):xy(slot13, slot14 + 5):addTo(slot5, 5)
						slot15:setMaxLineWidth(700)
						slot15:setTextColor(ui.COLORS.NORMAL.DEFAULT)

						slot9 = slot15:size().height

						slot7.imgTextBG:size(cc.size(slot15:size().width + 105, slot9 + 60))
						slot1:size(slot1:size().width, slot9 + 134)

						slot11 = slot5:size().height - slot9 - 134
					end

					if slot3.showTime == true then
						slot14 = "txtTime"
						uv14 = "isMine"

						slot1:get(slot14):text(slot14(slot3.time))
						slot1:get("imgTime"):width(slot1:get("txtTime"):width() / 2 + 20)
						slot1:get("imgTime"):y(slot1:height() + 58)
						slot1:get("txtTime"):y(slot1:height() + 58)
						slot1:size(slot1:size().width, slot1:size().height + 116)
					else
						slot1:get("txtTime"):hide()
						slot1:get("imgTime"):hide()
						slot1:size(slot1:size().width, slot1:size().height)
					end

					slot5:y(slot6 - slot11)
				end
			},
			handlers = {
				itemClick = bindHelper.self("onShowInfoClick")
			}
		}
	}
}

function slot1.uiInit(slot0)
	slot0.textInput:setPlaceHolderColor(ui.COLORS.DISABLED.WHITE)
	slot0.textInput:setTextColor(ui.COLORS.NORMAL.DEFAULT)
	blacklist:addListener(slot0.textInput, "*", function (slot0)
		uv1 = "textInput"
		uv5 = "text"

		slot1.textInput:text(string.utf8limit(slot0, slot5, true))
	end)
	uiEasy.addTabListClipping(slot0.leftList, slot0.leftPanel, {
		offsetX = 14
	})
	slot0.tipsText:text(gLanguageCsv.preventFraudChatTips)

	if dataEasy.isUnlock(gUnlockCsv.preventFraud) then
		slot0.rightList:height(735)
		slot0.tipsText:show()
		slot0.tipsBg:show()

		if matchLanguage({
			"tw"
		}) then
			slot0.rightList:height(695)
			slot0.tipsText:height(110)
			slot0.tipsBg:height(115)
		end
	else
		slot0.rightList:height(812)
		slot0.tipsText:hide()
		slot0.tipsBg:hide()
	end
end

function slot1.initModel(slot0)
	slot0.myFriend = gGameModel.society:getIdler("friends")
	slot0.friendMessage = gGameModel.messages:getIdler("private")
	slot0.id = gGameModel.role:getIdler("id")
	slot0.logo = gGameModel.role:getIdler("logo")
	slot0.delectData = idler.new(true)
end

function slot1.onCreate(slot0, slot1)
	slot0:uiInit()
	slot0:initModel()

	if itertools.size(slot0.friendMessage:read()) ~= 0 then
		gGameModel.forever_dispatch:getIdlerOrigin("chatPrivatalyLastId"):set(slot2[slot3].id)
	end

	slot0.curSelIdx = 1
	slot0.curSelId = 0
	slot0.state = slot1 and true or false
	slot0.personData = slot1
	slot0.personId = slot1 and slot1.role.id
	slot0.changeInfo = false
	slot0.chatContents = idlertable.new({})
	slot0.personInfo = idlers.newWithMap({})

	idlereasy.any({
		slot0.friendMessage,
		slot0.delectData
	}, function (slot0, slot1)
		slot2 = {}

		if not itertools.isempty(slot1) then
			for slot6, slot7 in ipairs(slot1) do
				slot8 = table.deepcopy(slot7, true)
				slot9 = nil

				if slot7.isMine then
					if not slot8.args then
						uv11 = "itertools"
						slot11 = slot11.id:read()
						uv11 = "itertools"
						slot8.args = {
							id = slot11,
							logo = slot11.logo:read()
						}
					end

					slot9 = slot8.args.id
				else
					slot9 = slot8.role.id
				end

				slot2[slot9] = slot2[slot9] or {}

				table.insert(slot2[slot9], slot8)

				if slot7.args then
					uv10 = "itertools"

					if slot9 == slot10.personId then
						uv10 = "itertools"
						slot10.changeInfo = true
					end
				end
			end
		end

		slot3 = {}
		slot4 = false

		for slot8, slot9 in pairs(slot2) do
			slot11 = slot9[#slot9].isMine and slot9[slot10].args or slot9[slot10].role
			uv12 = "itertools"

			if slot12.personData then
				uv12 = "itertools"

				if slot8 == slot12.personData.role.id then
					slot4 = true
					uv12 = "itertools"
					uv13 = "itertools"
					slot12.curSelId = slot13.personData.role.id
					uv12 = "itertools"
					slot12 = slot12.personData.role.name
					slot11.name = slot12
					uv12 = "itertools"
					slot11.id = slot12.personData.role.id

					if itertools.isempty(slot1) then
						uv12 = "itertools"
						slot11 = slot12.personData.role
					end
				end
			end

			table.insert(slot3, {
				id = slot8,
				role = slot11,
				content = slot9
			})
		end

		table.sort(slot3, function (slot0, slot1)
			uv2 = "personData"

			if slot2.personData then
				uv3 = "personData"

				if slot0.role.id == slot3.personData.role.id then
					return true
				else
					uv3 = "personData"

					if slot1.role.id == slot3.personData.role.id then
						return false
					end
				end
			end

			slot2 = slot0.content
			slot3 = slot1.content

			return slot3[#slot3].id <= slot2[#slot2].id
		end)

		if not slot4 then
			uv5 = "itertools"

			if slot5.personData then
				uv9 = "itertools"
				slot9 = slot9.personData.role.id
				uv9 = "itertools"

				table.insert(slot3, 1, {
					id = slot9,
					role = slot9.personData.role,
					content = {}
				})

				slot4 = true
			end
		end

		uv5 = "itertools"
		slot5.isShowDelBtn = idler.new(false)
		uv5 = "itertools"

		slot5.isShowDelBtn:addListener(function (slot0, slot1, slot2)
			uv3 = "delBtn"

			if not slot3.delBtn then
				return
			end

			uv3 = "delBtn"

			slot3.delBtn:visible(slot0)

			if not slot0 then
				uv3 = "delBtn"
				slot3.delBtn = nil
			end
		end)

		slot6 = slot3
		slot5 = idlers.newWithMap(slot6)
		uv6 = "itertools"

		for slot9, slot10 in slot6.personInfo:ipairs() do
			uv11 = "itertools"

			slot11.personInfo:remove(slot9)
		end

		for slot9, slot10 in slot5:ipairs() do
			uv11 = "itertools"

			slot11.personInfo:add(slot9, slot10)
		end

		uv6 = "itertools"

		if slot6.curSelId == 0 then
			uv6 = "itertools"
			slot6.curSelId = slot3[1].id
			uv6 = "itertools"
			slot6.curSelIdx = 1
		else
			for slot9, slot10 in ipairs(slot3) do
				uv12 = "itertools"

				if slot10.id == slot12.curSelId then
					uv11 = "itertools"
					slot11.curSelIdx = slot9
				end
			end
		end

		uv6 = "itertools"
		uv8 = "itertools"
		slot9 = #slot3
		slot6.curSelIdx = math.min(slot8.curSelIdx, slot9)

		for slot9, slot10 in ipairs(slot3) do
			for slot14, slot15 in ipairs(slot10.content) do
				if slot14 == 1 then
					slot3[slot9].content[slot14].showTime = true
				elseif slot15.time - slot3[slot9].content[slot14 - 1].time > 300 or slot3[slot9].content[slot14 - 1].time - slot15.time > 0 then
					slot3[slot9].content[slot14].showTime = true
				else
					slot3[slot9].content[slot14].showTime = false
				end
			end
		end

		if not itertools.isempty(slot1) then
			uv6 = "itertools"
			slot6 = slot6.chatContents
			slot6 = slot6.set
			uv8 = "itertools"
			slot8 = slot3[slot8.curSelIdx].content

			slot6(slot6, slot8)

			uv6 = "itertools"
			uv8 = "itertools"
			slot6.personInfo:atproxy(slot8.curSelIdx).select = true
		end
	end)

	if time.getTime() > gCommonConfigCsv.antiFraudPosterAppearsCD * 60 * 60 + userDefault.getForeverLocalKey("chatPosterTime", 0) and dataEasy.isUnlock(gUnlockCsv.preventFraud) then
		gGameUI:stackUI("city.chat.poster")
		userDefault.setForeverLocalKey("chatPosterTime", time.getTime())
	end

	Dialog.onCreate(slot0)
end

function slot1.onShowInfoClick(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot4.target
	slot6, slot7 = slot5:xy()

	gGameUI:stackUI("city.chat.personal_info", nil, , slot5:getParent():convertToWorldSpace(cc.p(slot6, slot7)), slot3)
end

function slot1.onDeletePerson(slot0, slot1, slot2)
end

function slot1.playerInfo(slot0, slot1, slot2, slot3, slot4)
	if slot4.name == "ended" then
		slot5 = slot4.target
		slot6, slot7 = slot5:xy()

		gGameUI:stackUI("city.chat.personal_info", nil, , slot5:getParent():convertToWorldSpace(cc.p(slot6 - 450, slot7 + 200)), slot3, {
			params = true,
			state = slot0.state,
			cb = function (slot0, slot1)
				if slot0 then
					if slot1 then
						uv2 = "changeInfo"

						if slot2.changeInfo then
							uv2 = "changeInfo"
							slot2.personData = nil
							uv2 = "changeInfo"
							slot2 = slot2.delectData
							slot2 = slot2.set

							slot2(slot2, false)

							uv2 = "changeInfo"
							slot2.state = false
						end
					end
				elseif not slot1 then
					uv3 = "changeInfo"

					Dialog.onClose(slot3)
				elseif slot1 then
					uv2 = "changeInfo"

					if slot2.state then
						uv2 = "changeInfo"

						if slot2.changeInfo then
							uv3 = "changeInfo"

							Dialog.onClose(slot3)
						end
					end
				elseif slot1 then
					uv2 = "changeInfo"

					if not slot2.state then
						uv3 = "changeInfo"

						Dialog.onClose(slot3)
					end
				end
			end
		})
	end
end

slot4, slot5 = nil

function slot1.onChangePerson()
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
end

function slot1.onPicClick(slot0, slot1, slot2)
	slot3 = slot0.personInfo:atproxy(slot0.curSelIdx).role

	gGameUI:stackUI("city.chat.emoji", nil, , {
		id = slot3.id,
		level = slot3.level,
		logo = slot3.logo,
		name = slot3.name,
		vip = slot3.vip,
		frame = slot3.frame
	}, "role", slot0.rightList)
end

function slot1.onSendClick(slot0, slot1, slot2)
	if not dataEasy.isChatOpen(gUnlockCsv.roleChat) then
		return
	end

	slot3 = slot0.personInfo:atproxy(slot0.curSelIdx).role

	if slot0.textInput:text() and slot0.textInput:text() ~= "" then
		gGameApp:requestServer("/game/chat", function (slot0)
			uv1 = "textInput"
			slot1 = slot1.textInput
			slot1 = slot1.text

			slot1(slot1, "")

			uv1 = "textInput"

			slot1.rightList:jumpToBottom()
			sdk.trackEvent("priv_text")
		end, slot0.textInput:text(), "role", {
			id = slot3.id,
			level = slot3.level,
			logo = slot3.logo,
			name = slot3.name,
			vip = slot3.vip,
			frame = slot3.frame
		})
	else
		gGameUI:showTip(gLanguageCsv.canNotEmpty)
	end
end

return slot1
