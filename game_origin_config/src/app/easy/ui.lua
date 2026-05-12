slot0 = cc.rectContainsPoint
slot1 = {}
globals.uiEasy = slot1

function slot1.isContainsWorldPoint(slot0, slot1)
	if not slot0 or not slot1 then
		return false
	end

	slot2 = slot0:box()
	slot3 = slot0:parent():convertToWorldSpace(cc.p(slot2.x, slot2.y))
	slot4 = slot3.x
	slot2.y = slot3.y
	slot2.x = slot4
	uv4 = "box"

	if slot4(slot2, slot1) then
		return true
	end
end

function slot2(slot0, slot1, slot2)
	slot3, slot4 = dataEasy.getQuality(slot2, slot0.space)
	slot5 = ""

	return ((not slot0.name or (type(slot0.name) ~= "table" or gLanguageCsv[slot0.name[slot3]]) and (slot0.name ~= "" or slot1.name) and slot0.name) and slot1.name) .. slot4, slot3
end

function slot1.setIconName(slot0, slot1, slot2)
	slot2 = slot2 or {}
	slot3 = 1
	slot4 = ""
	slot5 = ""
	slot6 = nil

	if slot0 == "card" then
		uv9 = ""
		slot4, slot3 = slot9(slot2, csv.cards[dataEasy.getCardIdAndStar(slot1)], slot2.advance or 1)
	elseif slot0 == "explore" then
		uv8 = ""
		slot4, slot3 = slot8(slot2, csv.explorer.explorer[slot1], slot2.advance or 1)
	elseif type(slot0) == "string" and string.find(slot0, "star_skill_points_%d+") then
		slot4 = csv.cards[tonumber(string.sub(slot0, string.find(slot0, "%d+")))].name .. gLanguageCsv.starSkill
	else
		if not dataEasy.getCfgByKey(slot0) then
			return
		end

		slot3 = dataEasy.isFurnitureItem(slot0) and 1 or slot7.quality

		if (dataEasy.isHeldItem(slot0) or dataEasy.isContractItem(slot0)) and slot2.advance and slot2.advance > 0 then
			slot4 = slot7.name .. string.format("%s+%s", slot2.space and " " or "", slot2.advance)
		end
	end

	if slot2.node then
		slot2.node:text(slot4)

		if not slot2.noColor then
			text.addEffect(slot2.node, {
				color = ui.COLORS.QUALITY_OUTLINE[slot3]
			})
		end

		if slot2.width and slot2.width < slot2.node:width() then
			slot7 = slot2.node:anchorPoint()
			slot8 = slot2.node:height()

			slot2.node:anchorPoint(slot7.x, 1)
			slot2.node:y(slot2.node:y() + (1 - slot7.y) * slot8)
			adapt.setTextAdaptWithSize(slot2.node, {
				vertical = "top",
				size = cc.size(slot2.width, slot8 * 3)
			})
		end
	end

	return slot4, slot6
end

function slot1.getCardName(slot0)
	slot1 = gGameModel.cards:find(slot0)
	slot4, slot5 = dataEasy.getQuality(slot1:read("advance"))

	return string.format("%s%s%s", ui.QUALITY_OUTLINE_COLOR[slot4], csv.cards[slot1:read("card_id")].name, slot5)
end

function slot1.getIconDesc(slot0, slot1)
	slot2 = ""
	slot3 = dataEasy.getCfgByKey(slot0)
	slot2 = (not dataEasy.isFragment(slot0) or string.format(slot3.desc, slot3.combCount)) and slot3.desc

	if slot3.descType and slot3.descType ~= 0 and slot3.type == game.ITEM_TYPE_ENUM_TABLE.chooseGift then
		slot4 = {}

		for slot8, slot9 in csvMapPairs(slot3.specialArgsMap) do
			slot10, slot11 = csvNext(slot9)

			if slot10 == "card" then
				if not assertInWindows(csv.cards[slot11.id], "csv.item[%s].specialArgsMap card:%s not exist", slot0, slot11.id) then
					table.insert(slot4, slot12.name)
				end
			else
				if slot11 > 1 or slot3.descType == 2 then
					slot13 = string.format("%s*%s", dataEasy.getCfgByKey(slot10).name, slot11)
				end

				table.insert(slot4, slot13)
			end
		end

		slot2 = string.format(gLanguageCsv.itemDescType, table.concat(slot4, gLanguageCsv.symbolComma))
	end

	return slot2
end

function slot1.createItemsToList(slot0, slot1, slot2, slot3)
	slot3 = slot3 or {}
	slot4 = ccui.Layout:create():size(0, 0):hide()

	slot4:retain()
	slot0:onNodeEvent("exit", function ()
		uv0 = "release"

		if slot0 then
			uv0 = "release"

			slot0:release()

			uv0 = nil
		end
	end)
	bind.extend(slot0, slot1, {
		class = "listview",
		props = {
			data = dataEasy.getItemData(slot2),
			item = slot4,
			margin = slot3.margin,
			padding = slot3.padding,
			dataOrderCmp = slot3.sortFunc or dataEasy.sortItemCmp,
			onAfterBuild = function (slot0)
				uv1 = "onAfterBuild"

				if slot1.onAfterBuild then
					uv1 = "onAfterBuild"

					slot1.onAfterBuild(slot0)
				end

				slot0:adaptTouchEnabled()
			end,
			itemAction = {
				isAction = false
			},
			onItem = function (slot0, slot1, slot2, slot3)
				slot9 = slot3.grayState
				uv9 = "bind"
				slot9 = slot9.isDouble
				uv9 = "bind"
				slot9 = slot9.specialKey
				uv9 = "bind"

				bind.extend(slot0, slot1, {
					class = "icon_key",
					props = {
						data = slot3,
						grayState = slot9,
						isDouble = slot9,
						specialKey = slot9,
						noListener = slot9.noListener,
						isExtra = slot3.extra,
						onNode = function (slot0)
							uv1 = "scale"

							if slot1.scale then
								uv3 = "scale"

								slot0:scale(slot3.scale)
							end

							slot1 = slot0:box()
							slot2 = slot0.alignCenter

							slot2(slot0, slot1)

							uv2 = "box"
							slot2 = slot2.size

							slot2(slot2, slot1)

							uv2 = "scale"

							if slot2.onNode then
								uv2 = "scale"
								uv4 = "alignCenter"

								slot2.onNode(slot0, slot4)
							end

							uv2 = "scale"

							if slot2.func then
								uv2 = "scale"

								slot2.func(slot0)
							end
						end
					}
				})
			end
		}
	})
end

function slot1.createSimpleCardToList(slot0, slot1, slot2, slot3)
	slot3 = slot3 or {}
	slot4 = slot3.type or 1
	slot5 = ccui.Layout:create():size(150, 150):scale(slot3.itemScale or 1):hide()

	slot5:retain()
	slot0:onNodeEvent("exit", function ()
		uv0 = "release"

		if slot0 then
			uv0 = "release"

			slot0:release()

			uv0 = nil
		end
	end)
	bind.extend(slot0, slot1, {
		class = "listview",
		props = {
			data = slot2,
			item = slot5,
			margin = slot3.margin,
			padding = slot3.padding,
			onAfterBuild = function (slot0)
				uv1 = "onAfterBuild"

				if slot1.onAfterBuild then
					uv1 = "onAfterBuild"

					slot1.onAfterBuild(slot0)
				end

				slot0:adaptTouchEnabled()
			end,
			itemAction = {
				isAction = false
			},
			onItem = function (slot0, slot1, slot2, slot3)
				if slot3 ~= 0 then
					slot4 = csv.unit[slot3]
					uv5 = "csv"

					if slot5.itemFunc then
						uv5 = "csv"

						slot5.itemFunc(slot2, slot1)
					end

					slot7 = slot1
					uv7 = "csv"

					ccui.ImageView:create(slot4.iconSimple):addTo(slot7, 2, "icon"):scale(slot7.scale or 2):xy(slot1:width() / 2, slot1:height() / 2)
				else
					uv4 = "unit"

					if slot4 == 1 then
						slot6 = slot1
						uv6 = "csv"

						ccui.ImageView:create("common/icon/icon_empty.png"):addTo(slot6, 1, "bg"):scale(slot6.bgScale or 1):xy(slot1:width() / 2, slot1:height() / 2)
					end
				end
			end
		}
	})
end

function slot1.showDialog(slot0, slot1, slot2)
	slot3 = (slot1 or {}).content

	function slot4()
		if not gGameUI:goBackInStackUI("city.recharge") then
			gGameUI:stackUI("city.recharge", nil, {
				full = true
			})
		end
	end

	if slot0 == "gold" then
		gGameUI:stackUI("common.gain_gold")
	elseif slot0 == "rmb" then
		gGameUI:showDialog({
			clearFast = true,
			btnType = 2,
			title = gLanguageCsv.rmbNotEnough,
			content = slot3 or gLanguageCsv.noDiamondGoBuy,
			cb = slot4
		}, slot2)
	elseif slot0 == "vip" then
		gGameUI:showDialog({
			clearFast = true,
			btnType = 2,
			title = slot1.titleName,
			content = slot3 or {
				string.format(gLanguageCsv.commonTodayMax, slot1.titleName),
				string.format(gLanguageCsv.commonVipIncrease, slot1.titleName)
			},
			cb = slot4,
			btnStr = gLanguageCsv.showVip
		}, slot2)
	elseif dataEasy.getCfgByKey(slot0) then
		gGameUI:showTip(slot3 or string.format(gLanguageCsv.coinNotEnough, slot5.name))
	else
		printWarn("uiEasy.showDialog not have:", slot0)
	end
end

function slot1.addTouchOneByOne(slot0, slot1)
	slot0:visible(slot1.nodeVisible or false)

	slot2 = cc.EventListenerTouchOneByOne:create()
	slot4 = cc.p(0, 0)

	function slot5(slot0)
		uv1 = "setEnabled"
		slot1 = slot1.setEnabled

		slot1(slot1, false)

		uv1 = "dispatchEvent"
		slot1 = slot1.dispatchEvent

		slot1(slot1, slot0)

		uv1 = "setEnabled"

		slot1:setEnabled(true)
	end

	function slot8(slot0, slot1)
		slot2 = slot0:getLocation()
		uv4 = "getLocation"
		uv5 = "getLocation"
		slot5 = nil
		uv6 = "x"

		if slot6.ended then
			uv6 = "x"
			uv10 = "y"
			slot5 = slot6.ended(slot2, slot2.x - slot4.x, slot2.y - slot5.y, slot10, slot1)
		end

		if slot5 ~= false then
			uv6 = "y"

			slot6(slot1)
		end

		uv6 = "x"

		if slot6.afterEnded then
			uv6 = "x"

			slot6.afterEnded(slot2, slot3, slot4)
		end
	end

	slot2:setSwallowTouches(true)
	slot2:registerScriptHandler(function ()
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
	end, cc.Handler.EVENT_TOUCH_BEGAN)
	slot2:registerScriptHandler(function (slot0, slot1)
		slot2 = slot0:getLocation()
		uv4 = "getLocation"
		uv5 = "getLocation"
		slot5 = nil
		uv6 = "x"

		if slot6.moved then
			uv6 = "x"
			uv10 = "y"
			slot5 = slot6.moved(slot2, slot2.x - slot4.x, slot2.y - slot5.y, slot10, slot1)
		end

		if slot5 ~= false then
			uv6 = "y"

			slot6(slot1)
		end
	end, cc.Handler.EVENT_TOUCH_MOVED)
	slot2:registerScriptHandler(slot8, cc.Handler.EVENT_TOUCH_ENDED)
	slot2:registerScriptHandler(slot8, cc.Handler.EVENT_TOUCH_CANCELLED)
	display.director:getEventDispatcher():addEventListenerWithSceneGraphPriority(slot2, slot0)

	return slot2
end

function slot1.addListviewScroll(slot0, slot1, slot2, slot3)
	slot4 = slot0:getDirection() == ccui.ScrollViewDir.vertical
	slot5 = slot0:getInnerContainer()

	function slot6(slot0)
		uv1 = "getContentSize"
		slot2 = slot1
		uv2 = "getPosition"
		slot3 = slot2
		uv3 = "getContentSize"
		slot5, slot5 = slot3:getPosition()
		slot6 = slot1.getContentSize(slot2).width
		slot7 = slot2.getContentSize(slot3).width
		uv8 = "width"

		if slot8 then
			slot7 = slot2.height
			slot6 = slot1.height
		end

		return math.min(slot6, math.max(0, math.abs(slot5) + (slot0 and 1 or -1) * slot7)) / (slot6 - slot7) * 100
	end

	function slot7(slot0)
		uv1 = "math"

		if math.min(100, math.max(0, slot1(slot0))) == 0 then
			uv2 = "max"
			slot2 = slot2.visible

			slot2(slot2, false)

			uv2 = "min"

			slot2:visible(true)
		elseif slot1 == 100 then
			uv2 = "min"
			slot2 = slot2.visible

			slot2(slot2, false)

			uv2 = "max"

			slot2:visible(true)
		else
			uv2 = "max"
			slot2 = slot2.visible

			slot2(slot2, true)

			uv2 = "min"

			slot2:visible(true)
		end

		uv2 = "visible"

		if slot2 then
			uv2 = "jumpToPercentVertical"

			if slot2 then
				uv2 = "jumpToPercentHorizontal"

				slot2:jumpToPercentVertical(slot1)
			else
				uv2 = "jumpToPercentHorizontal"

				slot2:jumpToPercentHorizontal(slot1)
			end
		else
			uv2 = "jumpToPercentVertical"

			if slot2 then
				uv2 = "jumpToPercentHorizontal"

				slot2:scrollToPercentVertical(slot1, 0.2, false)
			else
				uv2 = "jumpToPercentHorizontal"

				slot2:scrollToPercentHorizontal(slot1, 0.2, false)
			end
		end
	end

	bind.touch(slot0, slot1, {
		methods = {
			ended = functools.partial(slot7, false)
		}
	})
	bind.touch(slot0, slot2, {
		methods = {
			ended = functools.partial(slot7, true)
		}
	})
end

function slot1.addTabListClipping(slot0, slot1, slot2)
	slot2 = slot2 or {}

	slot0:retain()
	slot0:removeFromParent()

	slot6 = ccui.Scale9Sprite:create()

	slot6:initWithFile(slot2.rect or cc.rect(59, 1, 1, 1), slot2.mask or "common/box/mask_tab.png")
	slot6:size(slot0:size()):anchorPoint(0, 0):xy(slot0:x() + (slot2.offsetX or 0), slot0:y() + (slot2.offsetY or 0))
	cc.ClippingNode:create(slot6):setAlphaThreshold(0.1):add(slot0):addTo(slot1, slot0:z())
	slot0:release()
end

function slot1.setRankIcon(slot0, slot1, slot2, slot3)
	if slot0 < 4 then
		slot1:texture(ui.RANK_ICON[slot0])
		slot2:hide()
		slot3:hide()
	elseif slot0 < 11 then
		slot1:texture(ui.RANK_ICON[4])
		slot2:text(slot0)
		slot3:hide()
	else
		slot1:hide()
		slot2:hide()
		slot3:text(slot0)
	end
end

function slot1.updateUnlockRes(slot0, slot1, slot2)
	if (slot2 or {}).justRemove then
		slot1:removeChildByName("_lock_res_")

		return idlereasy.assign(idler.new(true))
	end

	return dataEasy.getListenUnlock(slot0, function (slot0)
		uv1 = "removeChildByName"

		slot1:removeChildByName("_lock_res_")

		if slot0 then
			uv1 = "_lock_res_"

			if slot1.specialLock == true then
				uv1 = "removeChildByName"
				slot1 = slot1:size()
				uv5 = "_lock_res_"
				uv5 = "_lock_res_"
				uv5 = "_lock_res_"
				slot5 = ((slot5.res or "common/btn/btn_lock1.png").pos or cc.p(slot1.width * 0.5, slot1.height * 0.5)).scale or 1
				uv5 = "removeChildByName"
				uv6 = "_lock_res_"

				ccui.ImageView:create(slot5):xy(slot5):scale(slot5):addTo(slot5, slot6.zOrder or 10, "_lock_res_")
			end
		end
	end)
end

function slot1.checkText(slot0, slot1, slot2)
	slot3 = (slot1 or {}).noBlackList or false
	slot4 = {
		"\"",
		"'",
		"\\",
		"/",
		"#"
	}

	if not slot2 then
		for slot8, slot9 in pairs(slot4) do
			if string.find(slot0, slot9) then
				gGameUI:showTip(gLanguageCsv.noContainSpecailChar)

				return false
			end
		end
	end

	if slot0 == "" then
		gGameUI:showTip(gLanguageCsv.canNotEmpty)

		return false
	end

	if LOCAL_LANGUAGE == "cn" then
		for slot9 = 1, #slot0 do
			if slot0:byte(slot9) >= 48 and slot10 <= 57 then
				slot5 = 0 + 1
			end
		end

		if slot5 >= 4 then
			gGameUI:showTip(gLanguageCsv.noContainSpecailChar)

			return false
		end
	end

	if #slot0 > 0 and (string.byte(slot0, 1) == 32 or string.byte(slot0, #slot0) == 32) then
		gGameUI:showTip(gLanguageCsv.hasSpaceBothEnds)

		return false
	end

	if slot1.name and slot0 == slot1.name then
		gGameUI:showTip(gLanguageCsv.noChangeName)

		return false
	end

	if not slot3 and blacklist.findBlacklist(slot0) then
		gGameUI:showTip(gLanguageCsv.inBlacklist)

		return false
	end

	if slot1.cost and slot1.cost > 0 and gGameModel.role:read("rmb") < slot1.cost then
		uv5 = "noBlackList"

		slot5.showDialog("rmb")

		return false
	end

	return true
end

function slot1.setBtnShader(slot0, slot1, slot2)
	if slot2 == 1 then
		if slot1 then
			text.deleteAllEffect(slot1)
			text.addEffect(slot1, {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			})
		end

		slot0:setTouchEnabled(true)
		cache.setShader(slot0, false, "normal")
	else
		if slot1 then
			text.deleteAllEffect(slot1)
			text.addEffect(slot1, {
				color = ui.COLORS.DISABLED.WHITE
			})
		end

		slot0:setTouchEnabled(slot2 == 3)
		cache.setShader(slot0, false, "hsl_gray")
	end
end

function slot1.setBoxEffect(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0:size()

	if not slot0:get("effect") then
		widget.addAnimationByKey(slot0, "effect/kaixiangguang.skel", "effect", "effect", 10):xy(slot5.width / 2 + (slot3 or 0), slot5.height / 2 + (slot4 or 0)):scale(slot1 or 1):setSpriteEventHandler(function (slot0, slot1)
			uv2 = "hide"
			slot2 = slot2.hide

			slot2(slot2)

			uv2 = "hide"

			if slot2 then
				uv2 = "hide"

				slot2()
			end
		end, sp.EventType.ANIMATION_COMPLETE)
	else
		slot6:show():play("effect")
	end
end

function slot1.setTitleEffect(slot0, slot1, slot2)
	if slot2 and slot2.mega then
		slot3 = widget.addAnimation(slot0, "chaojinhua/jiesuan2.skel", "effect", 25)

		slot3:y(slot3:y() + 450)
		performWithDelay(slot0, function ()
			uv0 = "play"

			slot0:play("effect_loop")
		end, 1.1)

		return
	end

	slot4 = widget.addAnimationByKey(slot0, "level/jiesuanshengli.skel", "effectBg", "jiesuan_shenglitu", 10)

	widget.addAnimationByKey(slot0, "level/jiesuanshengli.skel", "effect", slot1, 20):setSpriteEventHandler(function (slot0, slot1)
		uv2 = "play"
		slot2 = slot2.play
		uv4 = "_loop"

		slot2(slot2, slot4 .. "_loop")

		uv2 = "jiesuan_shenglitu_loop"

		slot2:play("jiesuan_shenglitu_loop")
	end, sp.EventType.ANIMATION_COMPLETE)
end

function slot1.setExecuteSequence(slot0, slot1)
	if type(slot0) ~= "table" then
		slot0 = {
			slot0
		}
	end

	slot2 = slot1 or {}
	slot3 = slot2.offx or -300
	slot4 = slot2.time or 1
	slot7 = cc.clampf(slot3 / (50 - slot3), 0.1, 0.9)

	for slot11, slot12 in ipairs(slot0) do
		slot12:hide()
		performWithDelay(slot12, function ()
			uv0 = "show"
			slot0 = slot0.show

			slot0(slot0)

			uv0 = "show"
			slot0, slot1 = slot0:xy()
			uv2 = "show"
			slot3 = slot2
			slot2 = slot2.scaleX(slot3)
			uv3 = "show"
			slot4 = slot3
			slot3 = slot3.scaleY(slot4)
			uv4 = "show"
			uv6 = "xy"
			slot4 = slot4:x(slot0 + slot6)
			slot5 = slot4

			slot4.scaleX(slot5, 0)

			uv5 = "show"
			slot6 = "EaseInOut"
			uv6 = "scaleX"
			slot6 = slot6 / 2
			uv7 = "scaleY"
			uv6 = "scaleX"
			slot6 = slot6 / 2
			slot7 = slot0
			slot4 = transition.executeSequence(slot5):easeBegin(slot6):moveTo(slot6, slot0 + slot7, slot1):moveTo(slot6, slot7, slot1):easeEnd()
			slot5 = slot4

			slot4.done(slot5)

			uv5 = "show"
			uv6 = "scaleX"
			uv7 = "x"
			slot6 = slot6 * slot7 / 2
			slot7 = slot2
			uv6 = "scaleX"
			uv7 = "x"
			slot6 = slot6 * (1 - slot7) / 2
			uv6 = "scaleX"

			transition.executeSequence(slot5):scaleXTo(slot6, slot7):scaleTo(slot6, slot2 * 1.25, slot3 * 1.25):scaleTo(slot6 / 2, slot2, slot3):done()
		end, slot2.delayTime or 0)
	end
end

function slot1.setPrivilegeRichText(slot0, slot1, slot2, slot3, slot4)
	if dataEasy.getPrivilegeVal(slot0) and slot5 ~= 0 then
		if string.find(tostring(slot5), ".", 1, true) then
			slot5 = slot5 * 100 .. "%"
		end

		slot6 = nil

		return rich.createByStr(slot4 and "#C0x5B545B#(" .. string.format(gLanguageCsv.currentPrivilege, slot2, tostring(slot5)) .. "#C0x5B545B#)" or string.format(gLanguageCsv.currentPrivilege, slot2, tostring(slot5)), 40, nil, , cc.p(0, 0.5)):addTo(slot1, 10, "privilege"):anchorPoint(cc.p(0, 0.5)):xy(slot3):formatText()
	end
end

function slot1.setCardNum(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0:size()
	slot6 = slot0:get("num")
	slot7 = slot0:get("num1")
	slot8 = slot0:get("num2")

	if not slot2 then
		if not slot1 or slot1 == 0 then
			slot1 = ""
		end

		slot9 = ui.DEFAULT_OUTLINE_SIZE

		if type(slot1) ~= "number" then
			slot1 = gLanguageCsv[slot1] or slot1
			slot9 = 3
		end

		if not slot6 then
			text.addEffect(cc.Label:createWithTTF(slot1, ui.FONT_PATH, 36):align(cc.p(1, 0), slot5.width - 30, 12):addTo(slot0, 10, "num"), {
				outline = {
					color = ui.COLORS.QUALITY_OUTLINE[slot3],
					size = slot9
				}
			})
		end

		slot6:show():text(mathEasy.getShortNumber(slot1))

		if slot7 then
			itertools.invoke({
				slot7,
				slot8
			}, "hide")
		end
	else
		slot1 = slot1 or 0

		if not slot7 then
			text.addEffect(cc.Label:createWithTTF(0, ui.FONT_PATH, 36):align(cc.p(1, 0), slot5.width - 20, 10):addTo(slot0, 10, "num1"), {
				outline = {
					color = ui.COLORS.QUALITY_OUTLINE[slot3]
				}
			})
			text.addEffect(cc.Label:createWithTTF(0, ui.FONT_PATH, 36):align(cc.p(1, 0), slot5.width - 30, 10):addTo(slot0, 10, "num2"), {
				outline = {
					color = ui.COLORS.QUALITY_OUTLINE[slot3]
				}
			})
		end

		slot7:show():text("/" .. mathEasy.getShortNumber(slot2))
		slot8:show():text(mathEasy.getShortNumber(slot1))

		if not slot4 then
			text.addEffect(slot8, {
				color = slot2 <= slot1 and ui.COLORS.NORMAL.FRIEND_GREEN or ui.COLORS.NORMAL.ALERT_ORANGE
			})
		end

		adapt.oneLinePos(slot7, slot8, nil, "right")

		if slot6 then
			slot6:hide()
		end
	end
end

function slot1.isOpenMystertShop()
	return gGameModel.mystery_shop:read("last_active_time") + csv.mystery_shop_config[1].shop_exist_time - 1 - time.getTime() > 0, slot4
end

function slot1.showMysteryShop()
	uv0 = "isOpenMystertShop"
	slot3 = csv.mystery_shop_config[1]

	if slot3.min_level <= gGameModel.role:read("level") and gGameModel.daily_record:read("mystery_active_times") < slot3.daily_active_times and slot0.isOpenMystertShop() and userDefault.getForeverLocalKey("mySteryState", 0) == 0 then
		userDefault.setForeverLocalKey("mySteryState", 1)
		gGameUI:stackUI("city.mystery_shop.show")

		return true
	end

	return false
end

function slot1.showActivityBoss()
	slot0 = gGameModel.role:read("yyhuodongs")
	slot2 = nil

	for slot6, slot7 in ipairs(gGameModel.role:read("yy_open")) do
		if csv.yunying.yyhuodong[slot7].type == game.YYHUODONG_TYPE_ENUM_TABLE.huoDongBoss then
			slot2 = slot7

			break
		end
	end

	if slot0[slot2] and slot0[slot2].info then
		if slot0[slot2].info.huodong_boss_count and slot3 ~= userDefault.getForeverLocalKey("activityBossCount", 0) then
			userDefault.setForeverLocalKey("activityBossCount", slot3)
			gGameUI:stackUI("city.activity.activity_boss.show")

			return true
		end
	end

	return false
end

function slot1.setBottomMask(slot0, slot1, slot2)
	slot3 = slot0:getInnerContainer()
	slot4 = slot0:size().width
	slot5 = true

	slot0:onScroll(function ()
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

function slot1.addVibrateToNode(slot0, slot1, slot2, slot3)
	slot4 = {
		{
			rotation = 7,
			t1 = 0.1,
			t2 = 0.1
		},
		{
			rotation = -5,
			t1 = 0.1,
			t2 = 0.1
		},
		{
			rotation = 3,
			t1 = 0.1,
			t2 = 0.1
		},
		{
			rotation = -2,
			t1 = 0.1,
			t2 = 0.1
		},
		{
			rotation = 1,
			t1 = 0.1,
			t2 = 0.1
		}
	}

	if slot2 then
		slot0:enableSchedule():schedule(function (slot0)
			uv2 = "tolua"

			if tolua.isnull(slot2) then
				uv1 = "isnull"
				uv3 = "enableSchedule"

				slot1:enableSchedule():unSchedule(slot3)

				return
			end

			uv2 = "tolua"
			slot1 = transition.executeSequence(slot2)
			uv3 = "unSchedule"

			for slot5, slot6 in pairs(slot3) do
				slot1:rotateTo(slot6.t1, slot6.rotation):delay(slot6.t2)
			end

			slot1:rotateTo(0.1, 0):done()
		end, 2, nil, slot3 or slot1:getName() .. "toRotationScheduleTag")
	else
		slot0:enableSchedule():unSchedule(slot3)
	end
end

function slot1.shareBattleToChat(slot0, slot1)
	if not dataEasy.isChatOpen(gUnlockCsv.battleShare) then
		return
	end

	if gCommonConfigCsv.shareTimesLimit <= gGameModel.daily_record:read("battle_share_times") then
		gGameUI:showTip(gLanguageCsv.shareTimesNotEnough)

		return
	end

	gGameUI:showDialog({
		btnType = 2,
		isRich = false,
		cb = function ()
			uv4 = "gGameApp"
			uv5 = "requestServer"

			gGameApp:requestServer("/game/battle/share", function (slot0)
				gGameUI:showTip(gLanguageCsv.recordShareSuccess)
				sdk.trackEvent("share_arenawin")
			end, slot4, slot5, "arena")
		end,
		content = string.format(gLanguageCsv.shareBattleNote, gCommonConfigCsv.shareTimesLimit - slot2 .. "/" .. gCommonConfigCsv.shareTimesLimit)
	})
end

slot3 = {
	{
		key = "redpack",
		func = function (slot0, slot1, slot2)
			gGameApp:requestServer("/game/union/redpacket/info", function (slot0)
				gGameUI:stackUI("city.union.redpack.view", nil, {
					full = true
				}, slot0.view, 2)
			end)
		end
	},
	{
		key = "gymLog",
		func = function (slot0, slot1, slot2)
			gGameUI:stackUI("city.adventure.gym_challenge.battle_detail", nil, , slot1)
		end
	},
	{
		key = "reunion",
		func = function (slot0, slot1, slot2)
			if not slot1.isMine then
				slot4 = gGameModel.role:read("level") or 0
				slot5 = gGameModel.role:read("top6_fighting_point")
				slot6 = gGameModel.role:read("id")
				slot7 = gGameModel.role:read("reunion") or {}
				slot8 = time.getTime()

				gGameApp:requestServer("/game/yy/reunion/record/get", function (slot0)
					slot1 = slot0.view.reunion_record
					slot2 = slot1.bind_history
					slot3 = slot1.bind_role_db_id
					uv4 = "view"

					if slot4 >= gCommonConfigCsv.seniorRoleLevel then
						uv4 = "reunion_record"

						if slot4 >= gCommonConfigCsv.seniorRoleFightingPoint then
							uv4 = "bind_history"

							if slot4.role_type ~= 0 then
								gGameUI:showTip(gLanguageCsv.reunionWorldChatErr6)
							else
								uv4 = "bind_history"

								if slot4.info then
									uv4 = "bind_history"
									uv5 = "bind_role_db_id"

									if slot5 < slot4.info.end_time then
										gGameUI:showTip(gLanguageCsv.reunionWorldChatErr4)
									end
								else
									uv4 = "bind_history"

									if slot4.bind_cd then
										uv4 = "bind_history"
										uv5 = "bind_role_db_id"

										if slot5 < slot4.bind_cd then
											uv4 = "bind_history"
											uv5 = "bind_role_db_id"
											slot5 = time.getCutDown(slot4.bind_cd - slot5)

											gGameUI:showTip(string.format(gLanguageCsv.reunionWorldChatErr3, slot5.day, slot5.hour, slot5.min))
										end
									else
										uv4 = "gCommonConfigCsv"

										if slot4.end_time then
											uv4 = "gCommonConfigCsv"
											uv5 = "bind_role_db_id"

											if slot4.end_time < slot5 or slot3 then
												gGameUI:showTip(gLanguageCsv.reunionWorldChatErr5)
											elseif not itertools.isempty(slot2) then
												uv6 = "seniorRoleLevel"

												if itertools.include(slot2, slot6) then
													gGameUI:showTip(gLanguageCsv.reunionWorldChatErr2)
												end
											else
												uv8 = "gCommonConfigCsv"

												gGameApp:requestServer("/game/role_info", function (slot0)
													gGameUI:showDialog({
														btnType = 2,
														isRich = true,
														content = string.format(gLanguageCsv.reunionBindDialogText, slot0.view.name),
														cb = function ()
															uv4 = "gGameApp"
															uv5 = "gGameApp"
															uv6 = "gGameApp"

															gGameApp:requestServer("/game/yy/reunion/bind/join", function (slot0)
																if slot0.view.result then
																	jumpEasy.jumpTo("reunion")
																	gGameUI:showTip(gLanguageCsv.reunionBindDialogSuccess)
																end
															end, slot4.yyID, slot5.roleID, slot6.end_time)
														end
													})
												end, slot8.roleID)
											end
										end
									end
								end
							end
						end
					end
				end, (slot1.args or {}).roleID)

				return
			end

			gGameUI:showTip(gLanguageCsv.reunionWorldChatErr1)
		end
	},
	{
		key = "party",
		func = function (slot0, slot1, slot2)
			slot1.cb()
		end
	}
}
slot4 = {
	{
		key = "^role",
		func = function (slot0, slot1, slot2)
			if slot1.args[slot2].id ~= gGameModel.role:read("id") then
				slot4, slot5 = slot0:xy()

				gGameUI:stackUI("city.chat.personal_info", nil, , slot0:getParent():convertToWorldSpace(cc.p(slot4, slot5)), {
					role = slot3[slot2]
				})
			end
		end
	},
	{
		key = "^card",
		func = function (slot0, slot1, slot2)
			gGameApp:requestServerCustom("/game/card_info"):onErrCall(function ()
				gGameUI:showTip(gLanguageCsv.cardDoesNotExist)
			end):params(slot1.args[slot2]):doit(function (slot0)
				gGameUI:stackUI("city.card.info", nil, , slot0.view)
			end)
		end
	},
	{
		key = "^union",
		func = function (slot0, slot1, slot2)
			gGameApp:requestServer("/game/union/find", function (slot0)
				gGameUI:stackUI("city.union.join.detail", nil, , , slot0.view[1])
			end, slot1.args[slot2])
		end
	},
	{
		key = "battleID",
		func = function (slot0, slot1, slot2)
			slot3 = slot1.args
			slot4 = slot3[slot2]
			slot5 = "/game/pw/playrecord/get"

			if string.find(slot3.from, "crossArena") then
				slot5 = "/game/cross/arena/playrecord/get"
			elseif string.find(slot3.from, "onlineFight") then
				slot5 = "/game/cross/online/playrecord/get"
			elseif string.find(slot3.from, "crossMine") then
				slot5 = "/game/cross/mine/playrecord/get"
			elseif string.find(slot3.from, "crossSupremacy") then
				slot5 = "/game/cross/supremacy/playrecord/get"
			end

			gGameModel:playRecordBattle(slot4, slot3.crossKey, slot5, 2)
		end
	},
	{
		key = "nature_room_id",
		func = function (slot0, slot1, slot2)
			if not slot1.isMine then
				if gGameModel.role:read("clone_daily_be_kicked_num") < 3 then
					gGameApp:requestServer("/game/clone/room/join", function (slot0)
						gGameUI:goBackInStackUI("city.view")
						jumpEasy.jumpTo("cloneBattle")
					end, slot1.args.nature_room_id)
				else
					gGameUI:showTip(gLanguageCsv.beKickThreeTimesPleaseNext)
				end
			else
				gGameUI:showTip(gLanguageCsv.cloneInviteMyRoom)
			end
		end
	},
	{
		key = "hd_redPacket_idx",
		func = function (slot0, slot1, slot2)
			slot5 = false

			for slot9, slot10 in ipairs(gGameModel.role:read("yy_open")) do
				if slot1.args.yy_id == slot10 then
					slot5 = true

					break
				end
			end

			if not slot5 then
				gGameUI:showTip(gLanguageCsv.huodongNoOpen)

				return
			end

			if gGameModel.daily_record:read("huodong_redPacket_rob") == gVipCsv[gGameModel.role:read("vip_level")].huodongRedPacketRob then
				gGameUI:showTip(gLanguageCsv.redPacketRoleRobLimit)

				return
			end

			slot9 = "/game/yy/red/packet/rob"

			if csv.yunying.yyhuodong[slot3.yy_id].type == game.YYHUODONG_TYPE_ENUM_TABLE.huodongCrossRedPacket then
				slot9 = "/game/yy/cross/red/packet/rob"
			end

			gGameApp:requestServerCustom(slot9):onErrCall(function (slot0)
				if gLanguageCsv[slot0.err] then
					gGameUI:showTip(gLanguageCsv[slot0.err])
				end
			end):params(slot3.hd_redPacket_idx):doit(function (slot0)
				uv6 = "gGameUI"

				gGameUI:stackUI("city.activity.chinese_new_year", nil, , slot6.yy_id, slot0.view.info, "world")
			end)
		end
	}
}

function slot1.setUrlHandler(slot0, slot1, slot2)
	slot3 = slot1.args or {}

	slot0:setOpenUrlHandler(function (slot0)
		uv2 = "ipairs"

		for slot4, slot5 in ipairs(slot2) do
			if string.find(slot0, slot5.key) then
				uv7 = "string"
				uv8 = "find"

				return slot5.func(slot7, slot8, slot0)
			end
		end

		uv1 = "key"

		if not slot1[slot0] then
			printWarn("chat url 缺少对应 key(%s) 的数据", tostring(slot0))

			return
		end

		uv2 = "func"

		for slot4, slot5 in ipairs(slot2) do
			if string.find(slot0, slot5.key) then
				uv7 = "string"
				uv8 = "find"

				return slot5.func(slot7, slot8, slot0)
			end
		end

		printWarn("chat url 未知 key(%s) type(%s)", tostring(slot0), type(slot0))
	end)
end

slot5 = {
	[0] = gLanguageCsv.normalSkill,
	gLanguageCsv.smallSkills,
	gLanguageCsv.uniqueSkill,
	gLanguageCsv.passiveSkill
}

function slot1.setSkillInfoToItems(slot0, slot1)
	slot0 = slot0 or {}
	slot2 = slot1

	if type(slot1) == "number" then
		slot2 = csv.skill[slot1]
	end

	slot3 = slot2.skillNatureType
	slot5 = "city/card/system/skill/icon_skill.png"
	slot6 = "city/card/system/skill/icon_skill_text.png"

	if slot2.skillType == battle.SkillType.NormalSkill then
		slot5 = ui.SKILL_ICON[slot3]
		slot6 = ui.SKILL_TEXT_ICON[slot3]
	end

	if slot0.icon then
		slot0.icon:texture(slot5)
	end

	if slot0.name then
		slot0.name:text(slot2.skillName)
	end

	if slot0.type1 then
		slot0.type1:texture(slot6)
	end

	if slot0.type2 then
		uv9 = "type"

		slot0.type2:text(slot9[slot2.skillType2])
	end

	if slot0.target then
		slot0.target:text(slot2.targetTypeDesc)

		if slot0.name and slot0.target:width() + slot0.name:width() > slot0.target:x() - slot0.name:x() then
			adapt.setTextAdaptWithSize(slot0.name, {
				maxLine = 2,
				vertical = "center",
				horizontal = "left",
				size = cc.size(600, slot0.name:height() * 2)
			})
		end
	end
end

function slot1.getMaxStar(slot0)
	for slot6, slot7 in ipairs(gGameModel.role:read("cards")) do
		if gGameModel.cards:find(slot7):read("card_id", "star").card_id == slot0 and csv.cards[slot0].star < slot9.star then
			slot2 = slot9.star
		end
	end

	return slot2
end

function slot1.getStarPanel(slot0, slot1)
	slot1 = slot1 or {}
	slot2 = ccui.Layout:create():size(0, 0):name("starPanel")
	slot4 = slot1.dbid
	slot5 = slot0 > 6 and 6 or slot0
	slot6 = 104
	slot8 = slot6 / 2 - (slot6 * slot5 + (slot1.interval or 0) * (slot5 - 1)) / 2

	if slot1.align == "left" then
		slot8 = slot6 / 2
	elseif slot1.align == "right" then
		slot8 = slot6 / 2 - slot7
	end

	for slot12 = 1, slot5 do
		slot13 = slot12 > slot0 - 6 and "common/icon/icon_star.png" or "common/icon/icon_star_z.png"

		if dataEasy.getIsStarAidState(slot4) then
			widget.addAnimationByKey(slot2, "starswap/xingji.skel", "effctStar" .. slot12, "effect_loop", 10):xy(slot8 + (slot12 - 1) * (slot6 + slot3), 0):scale(2.5):setCascadeOpacityEnabled(true):opacity(204)
		end

		ccui.ImageView:create(slot13):xy(slot8 + (slot12 - 1) * (slot6 + slot3), 0):addTo(slot2)
	end

	return slot2
end

function slot1.addTextEffect1(slot0)
	text.addEffect(slot0, {
		outline = {
			size = 3,
			color = cc.c4b(255, 84, 0, 255)
		},
		glow = {
			color = cc.c4b(255, 71, 0, 255)
		}
	})
end

function slot1.useEditBox(slot0, slot1)
	if device.platform ~= "ios" and device.platform ~= "windows" then
		return
	end

	slot5 = cc.EditBox:create(slot0:getContentSize(), cc.Scale9Sprite:create()):anchorPoint(slot0:anchorPoint()):xy(cc.p(slot0:xy())):addTo(slot0:parent(), slot0:z() + 1)

	slot5:registerScriptEditBoxHandler(function (slot0)
		printInfo("# uiEasy.useEditBox handler event: " .. slot0)

		if slot0 == "began" then
			uv1 = "printInfo"
			slot1 = slot1.setPosition
			uv3 = "# uiEasy.useEditBox handler event: "

			slot1(slot1, slot3)

			uv1 = "printInfo"
			uv3 = "began"

			slot1:setText(slot3:getStringValue())
		end

		if slot0 == "changed" then
			uv1 = "began"
			uv3 = "printInfo"

			slot1:setText(slot3:getText())
		end

		if slot0 == "ended" then
			uv1 = "printInfo"
			slot2 = slot1
			uv2 = "began"
			slot2 = slot2.setText

			slot2(slot2, slot1.getText(slot2))

			uv2 = "printInfo"
			slot2 = slot2.setText

			slot2(slot2, "")

			uv2 = "setPosition"

			if slot2 then
				uv2 = "setPosition"

				slot2(slot1)
			end
		end
	end)

	slot0.editBox = slot5
end

function slot1.setTeamBuffItem(slot0, slot1, slot2, slot3)
	slot3 = slot3 or csv.unit[csv.cards[slot1].unitID]

	slot0:get("attrBg"):show()

	slot4 = slot0:get("attrBg.attr1")
	slot5 = slot0:get("attrBg.attr2")

	slot4:get("img"):texture(ui.ATTR_ICON[slot3.natureType])
	slot4:get("bg"):visible(slot2 == 1)
	slot4:get("bg2"):visible(slot2 == 2)
	slot4:y(slot2 == 1 and 45 or 42)
	slot4:scale(slot2 == 1 and 1 or 0.9)
	slot4:get("img"):scale(slot2 == 1 and 0.64 or 0.56)

	if slot3.natureType2 then
		slot5:show()
		slot5:get("img"):texture(ui.ATTR_ICON[slot3.natureType2])
		slot5:get("bg"):visible(slot2 == 2)
		slot5:get("bg2"):visible(slot2 == 1)
		slot5:y(slot2 == 2 and 45 or 42)
		slot5:scale(slot2 == 2 and 1 or 0.9)
		slot5:get("img"):scale(slot2 == 2 and 0.64 or 0.56)
	else
		slot5:hide()
	end
end

function slot1.showConfirmNature(slot0, slot1)
	slot2 = csv.unit

	for slot8 = 1, 2 do
		if ({
			slot2[slot0].natureType,
			slot2[slot0].natureType2
		})[slot8] and not itertools.include({
			slot2[slot1].natureType,
			slot2[slot1].natureType2
		}, slot9) then
			gGameUI:showDialog({
				btnType = 1,
				content = gLanguageCsv.changeNatureToChangeTeam
			})

			break
		end
	end
end

function slot1.storageTo(slot0)
	slot1 = slot0.timeScale or 1
	slot2 = slot0.targetPos or slot0.node:parent():convertToWorldSpace(cc.p(slot0.node:xy()))
	slot5 = ccui.Layout:create():size(display.sizeInView):addTo(slot0.panel or gGameUI.scene, 111, slot0.animationName or "answerGift")

	slot5:setBackGroundColorType(1)
	slot5:setBackGroundColorOpacity(0)

	slot6 = cc.Sprite:create(slot0.img or "city/union/answer/daxingxing.png"):alignCenter(display.sizeInView):addTo(slot5)
	slot9 = cc.ParticleSystemQuad:create(slot0.plistFile or "particle/xingxing.plist", slot0.aniFile or "particle/xingxing2.json")

	slot9:addTo(slot5):scale(4):alignCenter(display.sizeInView)

	slot10, slot11 = slot6:xy()
	slot12 = cc.p(slot10, slot11)
	slot16 = {
		cc.p(slot10 + (slot2.x - slot10) * 2 / 3, slot11),
		cc.p(slot2.x, slot11 + (slot2.y - slot11) * 1 / 2),
		slot2
	}

	gGameUI:disableTouchDispatch(nil, false)

	slot17 = nil
	slot17 = slot6:onNodeEvent("exit", function ()
		uv0 = "remove"

		slot0:remove()
		gGameUI:disableTouchDispatch(nil, true)
	end)

	slot6:runAction(transition.sequence({
		cc.RotateTo:create(0.1 / slot1, 300),
		cc.EaseIn:create(cc.BezierTo:create(1 / slot1, slot16), 3),
		cc.CallFunc:create(function ()
			uv0 = "removeSelf"
			slot1 = slot0

			slot0.removeSelf(slot1)

			uv1 = "widget"
			slot2 = "union_answer/xingxing_guang.skel"
			uv2 = "addAnimationByKey"

			widget.addAnimationByKey(slot1, slot2, "effect", "effect", 999):xy(slot2)
		end)
	}))
	slot9:runAction(transition.sequence({
		cc.RotateTo:create(0.1 / slot1, 300),
		cc.EaseIn:create(cc.BezierTo:create(1 / slot1, slot16), 3)
	}))

	return slot5
end

function slot1.digitRollAction(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot2 <= slot1 then
		return
	end

	slot3 = slot3 or 1.2
	slot6 = slot4 or 1
	slot7 = slot0:scale()

	if math.modf((slot2 - slot1) / 10) == 0 then
		slot8 = 1
	end

	slot9 = (slot3 - slot7) / 40

	slot0:stopAllActions()
	schedule(slot0, function ()
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
	end, 0.048 / slot6)
end

function slot1.sweepingEffect(slot0, slot1)
	if slot0:getChildByName("_sweepPanel_") then
		return
	end

	slot1 = slot1 or {}
	slot4 = slot0:height()
	slot5 = slot1.speedTime or 1
	slot6 = slot1.delayTime or 0.5
	slot7 = slot1.angle or 20
	slot8 = slot1.scaleX or 3
	slot11 = -100 - math.tan(math.rad(slot7)) * slot4
	slot15 = cc.utils:captureNodeSprite(slot0, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888, 1, 0, 0)

	slot15:retain()

	slot16 = ccui.Layout:create():setClippingEnabled(true):anchorPoint(0, 0):xy(0, 0):size(slot0:width(), slot0:height())
	slot17 = cc.ClippingNode:create(slot15):setAlphaThreshold(0.05):xy(0, 0):addChild(slot16, 1, "_ClippingPanel_"):addTo(ccui.Layout:create():anchorPoint(0, 0):xy(0, 0):size(slot0:width(), slot0:height()):addTo(slot0, 100, "_sweepPanel_"), 1, "_ClippingNode_")
	slot18 = ccui.Scale9Sprite:create()

	slot18:initWithFile(cc.rect(20, 20, 1, 1), "common/icon/img_light_2.png")
	slot18:setSkewX(slot7)
	slot18:height(slot4 / math.cos(math.rad(slot7)))
	slot18:setBlendFunc({
		src = GL_DST_COLOR,
		dst = GL_ONE
	})
	slot18:anchorPoint(0, 0)
	slot18:xy(slot11, 0)
	slot18:scaleX(slot8)
	slot18:addTo(slot16, 1, "_light_")
	slot15:release()
	function (slot0, slot1, slot2)
		slot0:xy(slot1[1], slot1[2])

		uv7 = "xy"
		slot9 = slot2[1]
		slot7 = cc.DelayTime
		uv9 = "cc"

		slot0:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.MoveTo:create(slot7, cc.p(slot9, slot2[2])), cc.CallFunc:create(function ()
			uv0 = "xy"
			uv2 = "xy"
			uv3 = "xy"

			slot0:xy(slot2[1], slot3[2])
		end), slot7:create(slot9))))
	end(slot18, {
		slot11 - slot18:width() * slot8,
		0
	}, {
		slot0:width() + 50,
		0
	})
	function (slot0)
		uv5 = "cc"
		uv6 = "Sequence"
		slot7 = 1.05
		slot5 = cc.ScaleTo
		uv7 = "Sequence"
		slot8 = 0.95
		slot6 = cc.ScaleTo
		uv8 = "Sequence"
		slot9 = 1.01
		uv9 = "Sequence"

		slot0:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(slot5), cc.ScaleTo:create(slot6 / 4, slot7), slot5:create(slot7 / 4, slot8), slot6:create(slot8 / 4, slot9), cc.ScaleTo:create(slot9 / 4, 1))))
	end(slot0)

	function slot21(slot0)
		slot0:setOpacity(5)

		uv5 = "setOpacity"
		uv6 = "cc"
		slot6 = 50
		uv6 = "setOpacity"
		uv7 = "cc"
		slot7 = 5
		slot5 = cc.FadeTo
		uv7 = "setOpacity"
		uv8 = "cc"
		slot8 = 50
		slot6 = cc.FadeTo
		uv8 = "setOpacity"
		uv9 = "cc"

		slot0:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeTo:create((slot5 + slot6) / 4, slot6), cc.FadeTo:create((slot6 + slot7) / 4, slot7), slot5:create((slot7 + slot8) / 4, slot8), slot6:create((slot8 + slot9) / 4, 5))))
	end
end

function slot1.goToShop(slot0, slot1)
	if not gGameUI:goBackInStackUI("city.shop") then
		gGameApp:requestServer(game.SHOP_GET_PROTOL[slot0] or game.SHOP_GET_PROTOL[1], function (slot0)
			uv1 = "gGameUI"

			if slot1 then
				uv1 = "gGameUI"

				slot1()
			else
				uv6 = "stackUI"

				gGameUI:stackUI("city.shop", nil, {
					full = true
				}, slot6)
			end
		end)
	end
end

function slot1.showHoudongId(slot0, slot1, slot2)
	if not dev.SHOW_HUODONG_ID then
		return
	end

	slot0:removeChildByName("_editor_yyid_")
	slot0:removeChildByName("_editor_huodongid_")

	if not slot1 then
		return
	end

	slot2 = slot2 or {}
	slot3 = slot0:size()

	adapt.setTextScaleWithWidth(ccui.Text:create("yyid:" .. slot1, "font/youmi1.ttf", 36):opacity(200):align(cc.p(0.5, 0.5), slot3.width / 2, slot3.height / 2 + (slot2.dy1 or 0)):addTo(slot0, 999, "_editor_yyid_"), nil, slot2.width or 160)
	text.addEffect(slot4, {
		color = ui.COLORS.NORMAL.DEFAULT,
		outline = {
			size = 2,
			color = ui.COLORS.OUTLINE.WHITE
		}
	})
	adapt.setTextScaleWithWidth(ccui.Text:create("hdid:" .. ((gGameModel.role:read("yy_hdid") or {})[slot1] or csv.yunying.yyhuodong[slot1].huodongID), "font/youmi1.ttf", 36):opacity(200):align(cc.p(0.5, 0.5), slot3.width / 2, slot3.height / 2 + (slot2.dy2 or 0)):addTo(slot0, 999, "_editor_huodongid_"), nil, slot2.width or 160)
	text.addEffect(slot7, {
		color = ui.COLORS.NORMAL.DEFAULT,
		outline = {
			size = 2,
			color = ui.COLORS.OUTLINE.WHITE
		}
	})
end

function slot1.onTownHomeClick(slot0)
	gGameApp:requestServer("/game/town/society/home/visit", function (slot0)
		uv1 = "data"
		slot1.data = slot0.view
		uv6 = "data"

		gGameUI:stackUI("city.town.home.view", nil, , slot6)
	end, slot0.serverKey, slot0.townDBID)
end

function slot1.setMaxStar(slot0, slot1)
	slot0:removeChildByName("maxStarBg")
	slot0:removeChildByName("maxStarText")

	if dataEasy.isUnlock(gUnlockCsv.fragShopMaxStar) then
		slot2 = slot0:box()

		if csv.cards[slot1.cardId] and dataEasy.getCardMaxStar(slot3.cardMarkID) == 12 then
			slot1.align = slot1.align or "right"
			slot6 = slot1.scale or 0.85
			slot10 = cc.Label:createWithTTF(gLanguageCsv.maxStar, "font/youmi1.ttf", 42):align(cc.p(0.5, 0.5), 0, 0):scale(slot6):addTo(slot0, 101, "maxStarText")
			slot11 = ccui.Scale9Sprite:create()

			slot11:initWithFile(cc.rect(60, 0, 1, 1), "city/shop/logo_shop_sp.png")
			slot11:align(cc.p(0.5, 0.5), slot1.position and slot1.position.x or math.floor(slot2.width * (slot1.align == "right" and 0.69 or 0.11)) + 8, slot1.position and slot1.position.y or math.floor(slot2.height * 0.72) + 22):addTo(slot0, 100, "maxStarBg"):scale(slot1.align == "right" and slot6 or -slot6, slot6)
			text.addEffect(slot10, {
				color = cc.c4b(254, 127, 76, 255)
			})

			slot12 = slot10:size()
			slot13 = math.min(slot12.width + 40, 160)

			slot11:width(slot13)
			slot10:scale(slot13 / (slot12.width + 40) * slot6):xy(slot11:x(), slot11:y() + 7 * slot6)
		end
	end
end

slot6 = {
	function (slot0, slot1, slot2, slot3, slot4)
		return {
			dir = "top",
			offsetY = 230,
			canvasDir = "vertical",
			x = slot4.x or slot1:width() / 2,
			y = slot4.y or 150,
			scale = slot4.scale or 1,
			type = slot0,
			countDown = slot2[slot0][1],
			this = slot3
		}
	end,
	function (slot0, slot1)
		return {
			offsetY = 440,
			canvasDir = "horizontal",
			x = slot1.x or 510,
			y = slot1.y or 260,
			scale = slot1.scale and 0.85 or 1,
			type = slot0,
			dir = slot1.dir or slot0 > 2 and "left" or "right"
		}
	end,
	function (slot0)
		return {
			canvasDir = "vertical",
			offsetY = 440,
			x = 960,
			y = 400,
			dir = "top",
			scale = 0.6,
			type = slot0
		}
	end,
	function (slot0)
		return {
			offsetY = 440,
			canvasDir = "vertical",
			x = 1100,
			y = 260,
			dir = "top",
			scale = 0.8,
			type = slot0
		}
	end,
	function (slot0, slot1, slot2)
		return {
			dir = "top",
			offsetY = 440,
			canvasDir = "vertical",
			scale = 0.8,
			x = slot2.x or slot1:width() / 2,
			y = slot2.y or 120,
			type = slot0
		}
	end,
	function (slot0, slot1, slot2, slot3)
		return {
			x = 914,
			offsetY = 440,
			dir = "top",
			y = 45,
			canvasDir = "vertical",
			scale = 0.5,
			type = slot0,
			countDown = slot2[slot0][1],
			this = slot3
		}
	end
}

function slot1.addRelicIcon(slot0, slot1, slot2, slot3, slot4)
	slot5 = nil

	if slot1 then
		if slot2 then
			if slot1[slot2] and itertools.size(slot1[slot2]) > 0 then
				if itertools.include({
					game.RELIC_BUFF.ENDLESSTOWER,
					game.RELIC_BUFF.DISPATCH
				}, slot2) then
					uv6 = "itertools"
					slot5 = slot6[1](slot2, slot0, slot1, slot4, slot3 or {})
				elseif itertools.include({
					game.RELIC_BUFF.GOLD_ECTYPAL,
					game.RELIC_BUFF.EXP_ECTYPAL,
					game.RELIC_BUFF.GIFT_ECTYPAL,
					game.RELIC_BUFF.FRAGMENT_ECTYPAL,
					game.RELIC_BUFF.CONTRACT_ECTYPAL
				}, slot2) then
					uv6 = "itertools"
					slot5 = slot6[2](slot2, slot3)
				elseif slot2 == game.RELIC_BUFF.BUY_STAMINA then
					uv6 = "itertools"
					slot5 = slot6[3](slot2)
				elseif slot2 == game.RELIC_BUFF.LIANJIN then
					uv6 = "itertools"
					slot5 = slot6[4](slot2)
				elseif slot2 == game.RELIC_BUFF.TOWN_DISPATCH then
					uv6 = "itertools"
					slot5 = slot6[5](slot2, slot0, slot3)
				elseif itertools.include({
					game.RELIC_BUFF.TOWN_FELLING,
					game.RELIC_BUFF.TOWN_LIANJIN,
					game.RELIC_BUFF.TOWN_DESSERT_SHOP
				}, slot2) then
					uv6 = "itertools"
					slot5 = slot6[6](slot2, slot0, slot1, slot4)
				end
			elseif slot0:get("relicPanel") then
				slot0:get("relicPanel"):hide()
			end
		else
			slot5 = {
				dir = "down",
				offsetY = -80,
				action = true,
				y = 100,
				canvasDir = "horizontal",
				x = 100
			}
		end

		if slot5 then
			uv6 = "size"

			return slot6.addRelicIconShwo(slot0, slot5)
		end
	end
end

function slot1.addRelicIconShwo(slot0, slot1)
	slot1.key = "relicBuff"
	slot2 = slot0:get("relicPanel") or ccui.Layout:create():size(200, 200):anchorPoint(0.5, 0.5):xy(slot1.x, slot1.y):addTo(slot0, 100, "relicPanel"):setTouchEnabled(true):scale(slot1.scale or 1)

	if not (slot2:get("relicBg") or cc.Sprite:create("common/btn/btn_sz.png"):alignCenter(slot2:size()):scale(1.54):addTo(slot2, 1, "relicBg")):get("relicIcon") then
		cc.Sprite:create("city/town/relic/icon_yjzf.png"):alignCenter(slot3:size()):addTo(slot3, 3, "relicIcon"):scale(0.7)
	end

	if slot1.action then
		slot2:stopActionByTag(10021)

		slot4 = cc.Sequence:create(cc.MoveBy:create(0.8, cc.p(0, 30)), cc.MoveBy:create(0.8, cc.p(0, -30)))

		slot4:setTag(10021)
		slot2:runAction(cc.RepeatForever:create(slot4))
	end

	if itertools.include({
		game.RELIC_BUFF.TOWN_FELLING,
		game.RELIC_BUFF.TOWN_LIANJIN,
		game.RELIC_BUFF.TOWN_DESSERT_SHOP,
		game.RELIC_BUFF.ENDLESSTOWER
	}, slot1.type) then
		slot6 = slot1.timeTag or 1

		if not slot2:get("times") then
			text.addEffect(cc.Label:createWithTTF("", ui.FONT_PATH, 30):alignCenter(slot2:size()):y(20):addTo(slot2, 10, "times"):show(), {
				outline = {
					size = 4,
					color = cc.c4b(91, 84, 91, 255)
				}
			})
		else
			slot5:unScheduleAll()
		end

		slot5:removeAllChildren()

		slot9 = csv.town.relic_buff[slot1.countDown.buff_id].duration * 60 * 60 + slot1.countDown.effect_time

		if slot1.type ~= game.RELIC_BUFF.ENDLESSTOWER then
			slot5:hide()
		end

		bind.extend(slot1.this, slot5, {
			class = "cutdown_label",
			props = {
				endTime = slot9 + 2,
				tag = slot6,
				endFunc = function ()
					uv0 = "unSchedule"
					uv2 = "gGameApp"

					slot0:unSchedule(slot2)
					gGameApp:requestServer("/town/relic/buff/refresh", function (slot0)
					end)
				end,
				callFunc = function (slot0)
					uv1 = "text"
					uv3 = "text"

					slot1:text(slot3:text() .. gLanguageCsv.relicAoexpiryDate)
				end
			}
		})
	end

	if itertools.include({
		game.RELIC_BUFF.TOWN_FELLING,
		game.RELIC_BUFF.TOWN_LIANJIN,
		game.RELIC_BUFF.TOWN_DESSERT_SHOP
	}, slot1.type) then
		slot6 = slot2:get("textBg") or ccui.ImageView:create("city/town/map/factory/box_zf.png"):setScale9Enabled(true):setCapInsets(cc.rect(27, 25, 1, 1)):addTo(slot2, 10, "textBg"):xy(-480, 100):size(120, 50):scale(2)
		slot7 = slot6:get("title") or cc.Label:createWithTTF(gLanguageCsv.benediction, ui.FONT_PATH, 40):alignCenter(slot6:size()):addTo(slot6, 10, "title")

		if not slot2:get("addAttr") then
			slot14 = cc.Label:createWithTTF(string.format(gLanguageCsv.omniHora, gTownFactoryCsv[slot9][gGameModel.town:read("buildings")[slot1.this.factoryId].level or 1].efficient * csv.town.relic_buff[slot1.countDown.buff_id].param), ui.FONT_PATH, 40):addTo(slot2, 10, "addAttr"):xy(-220, 100):scale(2):color(cc.c4b(252, 100, 58, 255)):anchorPoint(0, 0.5)
		else
			slot14:text(string.format(gLanguageCsv.omniHora, slot13))
		end

		slot14:x(-350)
		adapt.oneLinePos(slot14, slot3, cc.p(6, 0))
	end

	bind.touch(slot0, slot2, {
		methods = {
			ended = functools.partial(function (slot0, slot1)
				gGameUI:showItemDetail(slot1, slot0)
			end, slot1, slot2)
		}
	})

	return slot2
end

function slot1.hex2Color(slot0)
	slot0 = string.sub(slot0, 3, #slot0 - 1)
	slot1 = tonumber(slot0)

	if #slot0 > 8 then
		return cc.c4b(math.floor(slot1 / 65536 % 256), math.floor(slot1 / 256 % 256), slot1 % 256, math.floor(slot1 / 16777216))
	end

	return cc.c3b(math.floor(slot1 / 65536), math.floor(slot1 / 256 % 256), slot1 % 256)
end

function slot1.color2hex(slot0)
	slot2 = 6

	if slot0.a then
		slot1 = (slot0.r * 65536 + slot0.g * 256 + slot0.b) * 16777216
		slot2 = 8
	end

	return string.format("#C0x%0" .. slot2 .. "x#", slot1)
end

function slot1.autoChessDesc(slot0, slot1, slot2)
	slot3 = (slot2 or {}).defaultColor or "#L100010##LOC0x232121##LOS3##C0xFFFCED#"

	for slot9 = 1, #string.split(slot0, "@") do
		if slot9 % 2 == 1 then
			slot5 = "" .. slot4[slot9]
		elseif slot2.fromBattle then
			slot5 = slot5 .. slot4[slot9]
		end
	end

	slot0 = slot5

	if slot2.env then
		slot6 = "#L100010##LOC0x232121##LOS3##C0x21E038#"

		if slot2.noOutLine then
			slot6 = "#L10##C0x21E038#"
		end

		slot8 = ""

		for slot12 = 1, #string.split(slot0, "$") do
			slot8 = slot12 % 2 == 1 and slot8 .. slot3 .. slot7[slot12] or slot8 .. slot3 .. slot7[slot12] .. slot6 .. "$" .. slot7[slot12] .. "$"
		end

		slot0 = eval.doMixedFormula(slot8, slot2.env)
	else
		slot0 = slot3 .. slot0
	end

	for slot9, slot10 in orderCsvPairs(slot1) do
		if not gAutoChessKeyWordsCsv[slot10] then
			printError("csv.auto_chess.key_words key[%s] 不存在", slot10)
		else
			slot12, slot13 = nil

			while true do
				slot14, slot13 = string.find(slot0, gAutoChessKeyWordsCsv[slot10].name, slot12, true)

				if slot14 == nil then
					break
				end

				uv14 = "defaultColor"
				slot15 = nil

				if slot2.noOutLine then
					slot15 = string.format("%s#L0#%s#L0#%s", slot14.color2hex(cc.c4b(unpack(gAutoChessKeyWordsCsv[slot10].fontColor, 1, 4))), string.sub(slot0, slot12, slot13), slot3)
				else
					uv18 = "defaultColor"
					slot15 = string.format("%s#L100010#%s#LOS3#%s#L0#%s", "#LOC" .. string.sub(slot18.color2hex(cc.c4b(unpack(gAutoChessKeyWordsCsv[slot10].strokeColor, 1, 4))), 3), slot14, string.sub(slot0, slot12, slot13), slot3)
				end

				slot0 = string.format("%s" .. slot15 .. "%s", string.sub(slot0, 1, slot12 - 1), string.sub(slot0, slot13 + 1))
				slot12 = slot12 + #slot15
			end
		end
	end

	return slot0
end

function slot1.getVipStr(slot0, slot1)
	slot3 = game.VIP_SUPREME <= (slot0 or gGameModel.role:read("vip_level"))
	slot4 = slot3 and "supreme" or "textVIP"
	slot5 = slot1 and gLanguageCsv[slot4] or gLanguageCsv[slot4 .. "1"]

	if slot3 then
		slot2 = slot2 - game.VIP_SUPREME + 1
	end

	return {
		str = slot5 .. slot2,
		level = slot2,
		title = slot5
	}
end

function slot1.skillDesc2str(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot0) do
		if type(slot7) == "table" then
			slot8, slot9 = csvNext(slot7)

			if (slot1 or {}).defaultColor and slot8 == "title" then
				slot9 = "#C0xFFFCED##D0xCCC6B6##F48##L00100010##LOC0x8C887D##LOS3#" .. slot9
			end

			table.insert(slot2, slot9)
		else
			if slot1.defaultColor then
				slot7 = "#F40##C0x5B545B#" .. slot7
			end

			table.insert(slot2, slot7)
		end
	end

	return table.concat(slot2, "\n")
end

function slot7(slot0, slot1)
	if not slot0 then
		return {}
	end

	slot2 = {}
	slot3 = nil

	for slot7, slot8 in orderCsvPairs(slot0) do
		slot9 = nil

		if type(slot8) == "string" then
			slot9 = slot8
		elseif type(slot8) == "table" then
			slot10, slot3 = csvNext(slot8)
		end

		if slot9 then
			if slot1 then
				slot10, slot11 = nil

				while true do
					if string.match(slot9, "#C[^#]+#") == nil then
						break
					end

					slot13, slot14 = string.find(slot9, slot12, slot10, true)
					slot9 = string.sub(slot9, 1, slot13 - 1) .. string.sub(slot9, slot14 + 1)
				end
			end

			table.insert(slot2, slot9)
		end
	end

	return slot2, slot3
end

function slot8(slot0, slot1, slot2, slot3)
	if not dataEasy.isUnlock(gUnlockCsv.starEffect) then
		return
	end

	if csv.skill[slot0.skillId].starEffect[slot3 or 1] then
		slot7 = csv.cards[slot0.cardId] and slot6.star or 0

		if slot0.star then
			slot7 = slot0.star
		end

		slot9 = slot5 <= slot7 and "#C0x5B545B#" or "#C0xB7B09E#"
		slot10 = slot4.starEffectDesc1

		if slot2 == false and csvSize(slot4.starEffectDescShort1) > 0 then
			slot10 = slot4.starEffectDescShort1
		end

		if slot0.isZawake and csvSize(slot4.zawakeStarEffectDesc1) > 0 then
			slot10 = slot4.zawakeStarEffectDesc1

			if slot2 == false and csvSize(slot4.zawakeStarEffectDescShort1) > 0 then
				slot10 = slot4.zawakeStarEffectDescShort1
			end
		end

		if csvSize(slot4.starEffect) > 1 then
			slot10 = slot10[slot3]
		end

		uv11 = "dataEasy"
		slot11, slot12 = slot11(slot10, not slot8)

		return slot11, {
			string.format(gLanguageCsv.starUnlockSkillDesc, slot5, ""),
			slot12
		}, slot9, slot8
	end
end

function slot1.getStarSkillDesc(slot0, slot1, slot2)
	if dataEasy.isSkillChange() then
		uv3 = "dataEasy"

		return slot3.getStarSkillDesc1(slot0, slot1, slot2)
	end

	if not dataEasy.isUnlock(gUnlockCsv.starEffect) then
		return ""
	end

	slot3 = csv.skill[slot0.skillId]
	slot5 = csv.cards[slot0.cardId] and slot4.star or 0

	if slot0.star then
		slot5 = slot0.star
	end

	slot6 = ""

	if slot3.starEffect and csvSize(slot3.starEffect) > 0 then
		slot7 = slot3.starEffect[1] <= slot5 and "#C0x60c456#" or "#C0xB7B09E#"

		if slot1 == "handbook" then
			slot7 = "#C0xB7B09E#"
		end

		slot8 = slot3.starEffect[1]

		for slot12, slot13 in orderCsvPairs(slot3.starEffect) do
			if slot13 <= slot5 then
				slot8 = slot13
			end
		end

		slot9 = slot3.starEffectDesc

		if slot2 == false and slot3.starEffectDescShort ~= "" then
			slot9 = slot3.starEffectDescShort
		end

		if slot0.isZawake and slot3.zawakeEffect[2] == 1 then
			slot9 = slot3.zawakeEffectDesc

			if slot2 == false and slot3.zawakeEffectDescShort ~= "" then
				slot9 = slot3.zawakeEffectDescShort
			end
		end

		slot6 = "\n\n" .. slot7 .. string.format(gLanguageCsv.starUnlockSkillDesc, slot8, eval.doMixedFormula(slot9, {
			skillLevel = slot0.skillLevel or 1,
			math = math
		}, nil))
	end

	return slot6
end

function slot1.getStarSkillDesc1(slot0, slot1, slot2)
	slot3 = {}

	for slot7 = 1, math.huge do
		uv8 = "math"
		slot8, slot9, slot10 = slot8(slot0, slot1, slot2, slot7)

		if slot8 then
			uv12 = "huge"

			table.insert(slot3, "\n\n" .. slot10 .. table.concat(slot9, "  ") .. eval.doMixedFormula(slot12.skillDesc2str(slot8, slot0), {
				skillLevel = slot0.skillLevel or 1,
				math = math
			}, nil))
		else
			break
		end
	end

	return table.concat(slot3)
end

function slot1.setSkillDescKeyWords(slot0, slot1, slot2)
	for slot6, slot7 in orderCsvPairs(slot1) do
		if not gSkillDescKeyWordsCsv[slot7] then
			printError("csv.skill_desc_key_words[%s] 不存在", slot7)
		else
			slot9, slot10 = nil

			while true do
				slot11, slot10 = string.find(slot0, gSkillDescKeyWordsCsv[slot7].name, slot9, true)

				if slot11 == nil then
					break
				end

				uv11 = "orderCsvPairs"
				slot12 = string.format("%s#L10#%s#L0#%s", slot11.color2hex(cc.c3b(unpack(gSkillDescKeyWordsCsv[slot7].fontColor, 1, 3))), string.sub(slot0, slot9, slot10), "#C0x5B545B#")

				if slot2.linkFunc then
					slot12 = string.format("%s#L10010##LUL%s#%s#L0#%s", slot11, slot7, string.sub(slot0, slot9, slot10), "#C0x5B545B#")
				end

				slot0 = string.format("%s" .. slot12 .. "%s", string.sub(slot0, 1, slot9 - 1), string.sub(slot0, slot10 + 1))
				slot9 = slot9 + #slot12
			end
		end
	end

	return slot0
end

function slot1.showSkillDesc(slot0, slot1, slot2, slot3)
	slot0:removeAllChildren()
	slot0:setItemsMargin(slot1.margin or 10)

	slot4 = csv.skill[slot1.skillId]

	if slot1.descGray and slot4.descGray ~= "" then
		table.insert({}, {
			normal = "#C0xB8B19F#" .. slot4.descGray
		})
	end

	slot7 = slot4.describe1

	if not slot3 and csvSize(slot4.describeShort1) > 0 then
		slot7 = slot4.describeShort1
	end

	if slot1.isZawake and csvSize(slot4.zawakeEffectDesc1) > 0 then
		slot7 = slot4.zawakeEffectDesc1

		if not slot3 and csvSize(slot4.zawakeEffectDescShort1) > 0 then
			slot7 = slot4.zawakeEffectDescShort1
		end
	end

	slot8 = slot4.keyWords

	if slot1.isZawake then
		slot8 = slot4.zawakeKeyWords
	end

	for slot12, slot13 in orderCsvPairs(slot7) do
		if type(slot13) == "string" then
			slot15 = eval.doMixedFormula(slot13, {
				skillLevel = slot1.skillLevel or 1,
				math = math
			})
			uv15 = "removeAllChildren"

			table.insert(slot5, slot15.setSkillDescKeyWords("#C0x5B545B#" .. slot15, slot8, slot1))
		else
			table.insert(slot5, slot13)
		end
	end

	if not slot1.ignoreStar and csvSize(slot4.starEffect) > 0 then
		slot1.defaultColor = true

		for slot12 = 1, math.huge do
			uv13 = "setItemsMargin"
			slot13, slot14, slot15, slot16 = slot13(slot1, slot2, slot3, slot12)

			if slot13 then
				table.insert(slot5, {
					height = 5
				})

				if slot14[2] then
					-- Nothing
				end

				slot25 = {
					[2] = string.format("#C0xFFFCED##D0x%s##F48##L00100010#%s#LOS3#%s#L0#", string.sub(slot16 and "#C0x8CB4E4#" or slot15, 5, 10), slot16 and "#LOC0x5580B4#" or "#LOC0x8C887D#", slot14[2]),
					string.format("#C0xFFFCED##D0x%s##F48##L00100010##LOC0x8C887D##LOS3#%s#L0#", string.sub(slot16 and "#C0x60c456#" or slot15, 5, 10), slot14[1])
				}
				slot24 = table.concat(slot25, "  ")

				table.insert(slot5, {
					title = slot24
				})

				for slot24, slot25 in orderCsvPairs(slot13) do
					if type(slot25) == "string" then
						if slot16 then
							uv27 = "removeAllChildren"
							slot26 = slot27.setSkillDescKeyWords(slot15 .. eval.doMixedFormula(slot25, {
								skillLevel = slot1.skillLevel or 1,
								math = math
							}), slot8, slot1)
						end

						table.insert(slot5, slot26)
					else
						table.insert(slot5, slot25)
					end
				end
			else
				break
			end
		end
	end

	for slot12, slot13 in ipairs(slot5) do
		if type(slot13) == "string" then
			slot14 = 10
			slot15 = ccui.Layout:create():anchorPoint(0, 0):size(slot0:width(), 0)

			slot0:pushBackCustomItem(slot15)

			slot16 = ccui.ImageView:create("common/box/log_jlq_jn.png")
			slot17 = rich.createWithWidth(slot13, 40, nil, slot0:width() - slot16:width() - slot14):anchorPoint(0, 1)

			slot15:height(slot17:height())
			slot16:addTo(slot15):xy(slot16:width() / 2, slot17:height() - slot16:height() / 2 - 6)
			slot17:addTo(slot15):xy(slot16:width() + slot14, slot17:height())

			if slot1.linkFunc then
				slot17:setOpenUrlHandler(function (slot0)
					uv1 = "linkFunc"

					slot1.linkFunc(slot0)
				end)
			end
		else
			slot14 = slot13.normal or ""

			if slot13.title then
				slot14 = "#C0xFFFCED##D0x8CB4E4##F48##L00100010##LOC0x5580B4##LOS3#" .. slot13.title
			end

			slot15 = ccui.Layout:create():anchorPoint(0, 0):size(slot0:width(), 0)

			slot0:pushBackCustomItem(slot15)
			slot15:height(rich.createWithWidth(slot14, 40, nil, slot0:width()):anchorPoint(0, 0.5):addTo(slot15):formatText():height() + 10)

			if slot13.height then
				slot15:height(slot13.height)
			end

			slot16:y(slot15:height() / 2)
		end
	end

	slot0:refreshView()
end

function slot1.getArmstexture(slot0, slot1)
	if not dataEasy.isUnlock(gUnlockCsv.arms) then
		return
	end

	slot4 = false
	slot3 = slot0:get("armsPanel") or ccui.Layout:create():size(150, 150):anchorPoint(0.5, 0.5):xy(slot0:size().width / 2, slot0:size().height / 2):addTo(slot0, 100, "armsPanel")
	slot5 = slot3:get("bg") or ccui.ImageView:create("city/arms/di.png"):addTo(slot3, 10, "bg"):xy(slot3:width() / 2, slot3:height() / 2):scale(1)

	slot3:removeChildByName("fistDot")

	slot6 = "city/arms/none.png"

	if (slot1 or {})[1] and slot2[1] ~= 0 then
		slot6 = string.format("city/arms/icon_%s.png", game.NATURE_TABLE[slot2[1]])
	elseif slot2[2] and slot2[2] ~= 0 then
		slot6 = string.format("city/arms/icon_%s.png", game.NATURE_TABLE[slot2[2]])
		slot4 = true
	end

	slot7 = ccui.ImageView:create(slot6):xy(117, 117):addTo(slot3, 11, "fistDot"):scale(1)

	slot3:removeChildByName("secondDot")

	slot8 = "city/arms/none.png"

	if slot2[2] and slot2[2] ~= 0 and not slot4 then
		slot8 = string.format("city/arms/icon_%s.png", game.NATURE_TABLE[slot2[2]])
	end

	slot9 = ccui.ImageView:create(slot8):xy(33, 33):addTo(slot3, 12, "secondDot"):scale(1)
end

function slot1.createTexParameters(slot0, slot1, slot2)
	slot3 = cc.Sprite:create(slot0)

	if not (slot2 or {}).size then
		slot4 = cc.size(2, 2)

		while slot4.width < slot3:width() do
			slot4.width = slot4.width * 2
		end

		while slot4.height < slot3:height() do
			slot4.height = slot4.height * 2
		end
	end

	slot5 = slot4.width / slot3:width() / (slot2.scale or 1)
	slot6 = ccui.Layout:create():size(slot4)

	slot3:addTo(slot6):scale(slot5):alignCenter(slot4)
	cc.utils:captureNodeSprite(slot6, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888, 1, 0, 0):getTexture():setTexParameters(gl.LINEAR, gl.LINEAR, gl.REPEAT, gl.REPEAT)

	slot8 = slot1.width * slot5

	if slot2.autoWidth then
		if tonumber(slot2.autoWidth) then
			slot8 = slot4.width * slot2.autoWidth
		end
	end

	slot9 = slot1.height * slot5

	if slot2.autoHeight then
		if tonumber(slot2.autoHeight) then
			slot9 = slot4.height * slot2.autoHeight
		end
	end

	slot7:setTextureRect(cc.rect(slot1.x, slot1.y, slot8, slot9))
	slot7:anchorPoint(0.5, 0.5):scale(1 / slot5)

	return slot7
end
