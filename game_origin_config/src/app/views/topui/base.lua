slot0 = {
	RESOURCE_FILENAME = "topui_stamina_recover.json",
	RESOURCE_BINDING = {
		allRecover = "allRecover",
		buyTimes1 = "buyTimes1",
		nextRecover = "nextRecover",
		buyTimes2 = "buyTimes2"
	}
}
slot1 = class("TopuiBase", cc.load("mvc").ViewBase)

function slot1.onCreate(slot0, slot1, slot2)
	getRedFoxMoney()

	if slot0:getResourceNode():get("leftTopPanel") then
		adapt.dockWithScreen(slot3:get("leftTopPanel"), "left", "up", false)
	end

	if slot3:get("rightTopPanel") then
		adapt.dockWithScreen(slot3:get("rightTopPanel"), "right", "up", false)
	end

	if matchLanguage({
		"en"
	}) then
		(slot2 or {}).subTitle = ""
	end

	for slot7, slot8 in ipairs(slot1) do
		if slot8 == "stamina" then
			slot0:staminaInit()
		elseif slot8 == "title" then
			slot0:updateTitle(slot2.title, slot2.subTitle)
		elseif slot8 == "redfox" then
			slot0:redFoxInit()
		end
	end

	slot0.sign = slot2.sign
end

function slot1.redFoxInit(slot0)
	slot0:enableSchedule()
	slot0:schedule(function ()
		uv0 = "moneyNum"

		slot0.moneyNum:text((RedFoxMoney or "0") .. " $")
	end, 1, 1)
end

function slot1.staminaInit(slot0)
	slot0.stamina = gGameModel.role:getIdler("stamina")
	slot0.level = gGameModel.role:getIdler("level")
	slot0.staminaLRT = gGameModel.role:getIdler("stamina_last_recover_time")
	slot0.vipLevel = gGameModel.role:getIdler("vip_level")
	slot0.buyStaminaTimes = gGameModel.daily_record:getIdler("buy_stamina_times")
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.trainerLevel = gGameModel.role:getIdler("trainer_level")
	slot0.showStamina = idler.new(0)
	slot0.showStaminaMax = idlereasy.any({
		slot0.level,
		slot0.yyhuodongs,
		slot0.trainerLevel
	}, function (slot0, slot1, slot2, slot3)
		return true, dataEasy.getStaminaMax(slot1, slot3)
	end)

	slot0:enableSchedule()
	slot0:schedule(function ()
		uv0 = "showStamina"

		slot0.showStamina:set(dataEasy.getStamina())
	end, 1, 1)
	idlereasy.any({
		slot0.stamina,
		slot0.showStaminaMax,
		slot0.staminaLRT
	}, function (slot0, slot1, slot2, slot3)
		uv4 = "showStamina"

		slot4.showStamina:set(dataEasy.getStamina())
	end)

	function slot3(slot0, slot1, slot2, slot3)
		uv4 = "staminaText"
		slot4 = slot4.staminaText
		slot4 = slot4.text

		slot4(slot4, slot1)

		uv4 = "staminaText"
		slot4 = slot4.staminaMaxText
		slot4 = slot4.text

		slot4(slot4, "/" .. slot2)

		uv4 = "staminaText"

		slot4:unSchedule(1)

		if slot1 <= slot2 then
			uv5 = "staminaText"
			slot5 = slot5.staminaText

			text.deleteEffect(slot5, {
				"outline"
			})

			uv5 = "staminaText"

			text.addEffect(slot5.staminaText, {
				color = ui.COLORS.NORMAL.DEFAULT
			})

			if slot1 < slot2 then
				slot6 = (time.getTime() - slot3) % game.STAMINA_COLD_TIME
				uv6 = "staminaText"

				slot6:schedule(function ()
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
				end, game.STAMINA_COLD_TIME, game.STAMINA_COLD_TIME - slot6, 1)
			end
		else
			uv5 = "staminaText"

			text.addEffect(slot5.staminaText, {
				color = ui.COLORS.NORMAL.FRIEND_GREEN
			})
		end

		slot7 = 50
		uv7 = "staminaText"
		slot7 = slot7.staminaText
		uv7 = "staminaText"

		adapt.oneLineCenterPos(cc.p(192, slot7), {
			slot7,
			slot7.staminaMaxText
		})
	end

	idlereasy.any({
		slot0.showStamina,
		slot0.showStaminaMax,
		slot0.staminaLRT
	}, slot3)

	uv3 = "stamina"
	slot0.staminaInfo = gGameUI:createSimpleView(slot3, slot0):init():hide()
	slot1 = gGameUI:getConvertPos(slot0.staminaPanel)
	slot3 = slot0.staminaInfo:getResourceNode():size()
	slot4 = slot0.staminaPanel:size()

	slot0.staminaInfo:xy(slot1.x - slot3.width + slot4.width / 2 - display.uiOrigin.x, slot1.y - slot3.height - slot4.height / 2)

	slot5 = gGameUI:getConvertPos(slot0.staminaInfo)
	slot6 = ccui.Layout:create():anchorPoint(0, 0):size(display.sizeInView):xy(-slot5.x - display.uiOrigin.x * 2, -slot5.y):addTo(slot0.staminaInfo, -1)

	slot6:setTouchEnabled(true)
	slot6:onClick(function ()
		uv0 = "staminaInfo"

		slot0.staminaInfo:hide()

		uv2 = "staminaInfo"

		gGameUI:unModal(slot2.staminaInfo)
	end)

	function slot7()
		uv0 = "allRecoverTime"

		if slot0.allRecoverTime - time.getTime() <= 0 then
			uv1 = "allRecoverTime"
			slot1 = slot1.staminaInfo.nextRecover
			slot1 = slot1.text

			slot1(slot1, gLanguageCsv.staminaFull)

			uv1 = "allRecoverTime"
			slot1 = slot1.staminaInfo.allRecover
			slot2 = slot1

			slot1.text(slot2, gLanguageCsv.staminaFull)

			uv2 = "allRecoverTime"
			slot2 = slot2.staminaInfo.nextRecover

			text.addEffect(slot2, {
				color = ui.COLORS.NORMAL.FRIEND_GREEN
			})

			uv2 = "allRecoverTime"

			text.addEffect(slot2.staminaInfo.allRecover, {
				color = ui.COLORS.NORMAL.FRIEND_GREEN
			})
		else
			uv1 = "allRecoverTime"
			slot1 = slot1.staminaInfo.nextRecover
			slot1 = slot1.text

			slot1(slot1, time.getCutDown(slot0 % game.STAMINA_COLD_TIME).str)

			uv1 = "allRecoverTime"
			slot1 = slot1.staminaInfo.allRecover
			slot2 = slot1

			slot1.text(slot2, time.getCutDown(slot0).str)

			uv2 = "allRecoverTime"
			slot2 = slot2.staminaInfo.nextRecover

			text.addEffect(slot2, {
				color = ui.COLORS.NORMAL.DEFAULT
			})

			uv2 = "allRecoverTime"

			text.addEffect(slot2.staminaInfo.allRecover, {
				color = ui.COLORS.NORMAL.DEFAULT
			})
		end
	end

	idlereasy.any({
		slot0.showStamina,
		slot0.showStaminaMax,
		slot0.staminaLRT
	}, function (slot0, slot1, slot2, slot3)
		uv4 = "unSchedule"
		slot4 = slot4.unSchedule

		slot4(slot4, 2)

		uv4 = "unSchedule"
		slot4.allRecoverTime = (slot2 - slot1) * game.STAMINA_COLD_TIME + slot3
		uv4 = "allRecoverTime"

		slot4()

		if slot1 < slot2 then
			uv4 = "unSchedule"

			slot4:schedule(function ()
				uv0 = "allRecoverTime"

				slot0()

				uv0 = "time"

				if slot0.allRecoverTime - time.getTime() <= 0 then
					return false
				end
			end, 1, 0, 2)
		end
	end)
	idlereasy.any({
		slot0.vipLevel,
		slot0.buyStaminaTimes
	}, function (slot0, slot1, slot2)
		uv3 = "staminaInfo"
		slot3 = slot3.staminaInfo.buyTimes1
		slot3 = slot3.text

		slot3(slot3, slot2)

		uv3 = "staminaInfo"
		slot3 = slot3.staminaInfo.buyTimes2
		slot4 = slot3
		slot5 = "/" .. gVipCsv[slot1].buyStaminaTimes

		slot3.text(slot4, slot5)

		uv4 = "staminaInfo"
		uv5 = "staminaInfo"

		adapt.oneLinePos(slot4.staminaInfo.buyTimes1, slot5.staminaInfo.buyTimes2, nil, "left")

		if slot2 > 0 then
			uv4 = "staminaInfo"

			text.addEffect(slot4.staminaInfo.buyTimes1, {
				color = ui.COLORS.NORMAL.FRIEND_GREEN
			})
		else
			uv4 = "staminaInfo"

			text.addEffect(slot4.staminaInfo.buyTimes1, {
				color = ui.COLORS.NORMAL.DEFAULT
			})
		end
	end)
end

function slot1.updateTitle(slot0, slot1, slot2)
	slot0.titleText:text(slot1 or "")
	slot0.subTitleText:text(slot2 or "")
	adapt.oneLinePos(slot0.titleText, slot0.subTitleText, cc.p(15, 0))
end

function slot1.onGoldClick(slot0)
	gGameUI:stackUI("common.gain_gold")
end

function slot1.onRedFoxMoneyClick(slot0)
	gGameUI:stackUI("okami_dev.nap", nil)
end

function slot1.onDiamondClick(slot0)
	if not gGameUI:goBackInStackUI("city.recharge") then
		sdk.trackEvent("tap_diaplus")
		gGameUI:stackUI("city.recharge", nil, {
			full = true
		})
	end
end

function slot1.sendRequestBuyItem(slot0, slot1, slot2)
	gGameApp:requestServer("/game/buy_item", function (slot0)
		gGameUI:showTip(gLanguageCsv.hasBuy)
	end, slot1, slot2)
end

function slot1.onRmbCardClick(slot0)
	slot1 = game.ITEM_TICKET.rmbCard
	slot3, slot4 = csvNext(csv.items[slot1].specialArgsMap)

	gGameUI:stackUI("common.buy_info", nil, , {
		rmb = slot4
	}, {
		id = slot1
	}, {
		contentType = "num"
	}, slot0:createHandler("sendRequestBuyItem", slot1))
end

function slot1.onSkinCardClick(slot0)
	gGameUI:showTip(gLanguageCsv.skinTip07)
end

function slot1.onGoldCardClick(slot0)
	slot1 = game.ITEM_TICKET.goldCard
	slot3, slot4 = csvNext(csv.items[slot1].specialArgsMap)

	gGameUI:stackUI("common.buy_info", nil, , {
		gold = slot4
	}, {
		id = slot1
	}, {
		contentType = "num"
	}, slot0:createHandler("sendRequestBuyItem", slot1))
end

function slot1.onLimitCardClick(slot0)
	slot1 = game.ITEM_TICKET.limitCard
	slot3, slot4 = csvNext(csv.items[slot1].specialArgsMap)

	gGameUI:stackUI("common.buy_info", nil, , {
		rmb = slot4
	}, {
		id = slot1
	}, {
		contentType = "num"
	}, slot0:createHandler("sendRequestBuyItem", slot1))
end

function slot1.onEquipCardClick(slot0)
	slot1 = game.ITEM_TICKET.equipCard
	slot3, slot4 = csvNext(csv.items[slot1].specialArgsMap)

	gGameUI:stackUI("common.buy_info", nil, , {
		rmb = slot4
	}, {
		id = slot1
	}, {
		contentType = "num"
	}, slot0:createHandler("sendRequestBuyItem", slot1))
end

function slot1.onDiamondUpCardClick(slot0)
	slot1 = game.ITEM_TICKET.diamondUpCard
	slot3, slot4 = csvNext(csv.items[slot1].specialArgsMap)

	gGameUI:stackUI("common.buy_info", nil, , {
		rmb = slot4
	}, {
		id = slot1
	}, {
		contentType = "num"
	}, slot0:createHandler("sendRequestBuyItem", slot1))
end

function slot1.buyTickets(slot0, slot1, slot2)
	slot3 = game.ITEM_TICKET[slot1]
	slot5, slot6 = csvNext(csv.items[slot3].specialArgsMap)

	gGameUI:stackUI("common.buy_info", nil, , {
		[slot2] = slot6
	}, {
		id = slot3
	}, {
		contentType = "num"
	}, slot0:createHandler("sendRequestBuyItem", slot3))
end

function slot1.onStaminaLongTouch(slot0, slot1, slot2)
	if slot2.name == "click" then
		slot0:onStaminaClick()
	elseif slot2.name == "began" then
		slot0.staminaInfo:show()
		gGameUI:doModal(slot0.staminaInfo)
	elseif slot2.name == "ended" or slot2.name == "cancelled" then
		slot0.staminaInfo:hide()
		gGameUI:unModal(slot0.staminaInfo)
	end
end

function slot1.onStaminaClick(slot0)
	gGameUI:stackUI("common.gain_stamina")
end

function slot1.onluckyEggCardClick(slot0)
	slot1 = game.ITEM_TICKET.luckyEggCard
	slot3, slot4 = csvNext(csv.items[slot1].specialArgsMap)

	gGameUI:stackUI("common.buy_info", nil, , {
		rmb = slot4
	}, {
		id = slot1
	}, {
		contentType = "num"
	}, slot0:createHandler("sendRequestBuyItem", slot1))
end

function slot1.onUnionCoinClick(slot0)
	if dataEasy.notUseUnionBuild() then
		gGameUI:showTip(gLanguageCsv.cannotUseBuilding)

		return
	end

	gGameUI:stackUI("city.union.contrib.view")
end

function slot1.onDrawcardCoinClick(slot0)
	if not gGameUI:goBackInStackUI("city.drawcard.view") then
		gGameUI:stackUI("city.drawcard.view", nil, {
			full = true
		}, "equip")
	end
end

function slot1.onFragmentCoinClick(slot0)
	if not dataEasy.isUnlock(gUnlockCsv.cardReborn) then
		gGameUI:showTip(dataEasy.getUnlockTip(gUnlockCsv.cardReborn))

		return
	end

	if not gGameUI:goBackInStackUI("city.card.rebirth.view") then
		gGameUI:stackUI("city.card.rebirth.view", nil, {
			full = true
		}, 1, 2)
	end
end

function slot1.onPvpCoinClick(slot0)
	if not dataEasy.isUnlock(gUnlockCsv.arena) then
		gGameUI:showTip(dataEasy.getUnlockTip(gUnlockCsv.arena))

		return
	end

	if not gGameUI:goBackInStackUI("city.pvp.arena.view") then
		gGameApp:requestServer("/game/pw/battle/get", function (slot0)
			gGameUI:stackUI("city.pvp.arena.view")
		end)
	end
end

function slot1.onUnionCombetClick(slot0)
	slot1 = gGameModel.role:read("level")
	slot2 = gGameModel.union:read("level")

	for slot6, slot7 in orderCsvPairs(csv.sysopen) do
		if slot7.goto == "unionFight" then
			if not dataEasy.isUnlock(slot7.feature) then
				gGameUI:showTip(dataEasy.getUnlockTip(slot7.feature))

				return
			end

			if slot2 < slot7.unionlevel then
				gGameUI:showTip(gLanguageCsv.unionLevelLessNoOpened)

				return
			end

			jumpEasy.jumpTo("unionFight")

			return
		end
	end
end

function slot1.onExplorerCoinClick(slot0)
	if not dataEasy.isUnlock(gUnlockCsv.explorer) then
		gGameUI:showTip(dataEasy.getUnlockTip(gUnlockCsv.explorer))

		return
	end

	if not gGameUI:goBackInStackUI("city.develop.explorer.view") then
		gGameUI:stackUI("city.develop.explorer.view", nil, {
			full = true
		})
	end
end

function slot1.onRandomTowerCoinClick(slot0)
	if not dataEasy.isUnlock(gUnlockCsv.randomTower) then
		gGameUI:showTip(dataEasy.getUnlockTip(gUnlockCsv.randomTower))

		return
	end

	if not gGameUI:findStackUI("city.adventure.random_tower.view") then
		gGameApp:requestServer("/game/random_tower/prepare", function (slot0)
			gGameUI:stackUI("city.adventure.random_tower.view")
		end)
	end
end

function slot1.onCraftCoinClick(slot0)
	jumpEasy.jumpTo("craft")
end

function slot1.onCoinClick(slot0)
end

function slot1.onVipCoinClick(slot0)
end

function slot1.onBallClick(slot0, slot1)
	if slot1:getName() == "ballPanel1" then
		slot4 = gGameModel.role:read("gold")

		gGameUI:stackUI("common.buy_info", nil, , {
			gold = csv.items[game.SPRITE_BALL_ID.normal].specialArgsMap.buy_gold
		}, {
			id = game.SPRITE_BALL_ID.normal
		}, {
			contentType = "num"
		}, slot0:createHandler("showBuyInfo"))
	elseif slot2 == "ballPanel2" then
		uiEasy.goToShop(game.SHOP_INIT.FIX_SHOP)
	else
		gGameUI:showTip(string.format(gLanguageCsv.getInActOrMysteryShop))
	end
end

function slot1.onCrossCraftCoinClick(slot0)
	jumpEasy.jumpTo("crossCraft")
end

function slot1.onCrossArenaCoinClick(slot0)
	jumpEasy.jumpTo("crossArena")
end

function slot1.onCrossMineCoinClick(slot0)
	if not slot0.sign then
		jumpEasy.jumpTo("crossMine")
	end
end

function slot1.onCrossSupremacyCoinClick(slot0)
	if not slot0.sign then
		jumpEasy.jumpTo("crossSupremacy")
	end
end

function slot1.showBuyInfo(slot0, slot1)
	if gGameModel.role:read("level") < csv.items[game.SPRITE_BALL_ID.normal].specialArgsMap.buy_level then
		gGameUI:showTip(gLanguageCsv.buyItemLevelLimit)

		return
	else
		gGameApp:requestServer("/game/ball/buy_item", function (slot0)
			gGameUI:showTip(gLanguageCsv.hasBuy)
		end, game.SPRITE_BALL_ID.normal, slot1)
	end
end

function slot1.onOnlineFightCoinClick(slot0)
	jumpEasy.jumpTo("onlineFight")
end

function slot1.onTotemCoinClick(slot0)
	jumpEasy.jumpTo("totemDecompose")
end

return slot1
