slot0 = class("AutoChessEncounter")

function slot0.ctor(slot0, slot1, slot2)
	slot0.parent = slot1
	slot0.index = slot2
	slot0.battleView = slot0.parent.parent

	if slot0.index == 1 then
		slot0.panel = slot0.battleView.panelInfo
	else
		slot0.panel = slot3:clone():addTo(slot0.parent.panel, 0, "panelInfo" .. slot2):xy(slot3:xy())
	end

	slot4 = slot0.panel:get("confirmBtn")

	bind.touch(slot0, slot4, {
		clicksafe = true,
		methods = {
			ended = function ()
				uv0 = "onClickConfirm"

				slot0:onClickConfirm()
			end
		}
	})
	slot4:setTitleFontSize(45)

	slot5 = slot0.panel:get("enhanceImg")

	slot5:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended or slot1 == ccui.TouchEventType.canceled then
			uv2 = "ccui"

			slot2:onClickEnhance()
		end
	end)
	slot5:setPositionY(slot0.panel:getBoundingBox().height / 2 - 70)

	slot0.shopLogo = slot0.panel:get("imgShop")
	slot0.battleLogo = slot0.panel:get("zdPanel")
	slot0.enhanceImg = slot5
	slot0.btn = slot4
	slot0.shopPriceNodes = {}
end

slot1 = {
	[lushi.EncounterType.shop] = function (slot0, slot1)
		slot0:updateShopInfo(slot1)
		slot0.shopLogo:show()
	end,
	[lushi.EncounterType.enhance] = function (slot0, slot1)
		slot0.enhanceImg:show()
		slot0:showEnhanceInfo(slot1)
	end,
	[lushi.EncounterType.battle] = function (slot0, slot1)
		slot0.battleLogo:show()
		slot0:showBattleInfo(slot1)
	end,
	[lushi.EncounterType.story] = function (slot0, slot1)
		slot0:showStoryInfo(slot1)
	end,
	[lushi.EncounterType.pvp] = function (slot0, slot1)
		slot0:showPVPInfo(slot1)
	end
}

function slot0.init(slot0, slot1)
	slot0:reset()

	slot0.type = slot1.type
	slot0.ids = slot1.ids
	slot0.name = slot1.name
	slot0.canReturn = slot1.canReturn

	slot0:updateMenuCopy(slot1)

	slot2 = slot0.btn
	slot2 = slot2.setTitleText

	slot2(slot2, lushi.EncounterText.confirm[slot0.type])

	uv2 = "reset"

	if slot2[slot0.type] then
		slot2(slot0, slot1)
	end
end

function slot0.reset(slot0)
	slot0.type = nil
	slot0.selectId = nil

	slot0:__checkAndRemove("leftTimeText")
	slot0:resetShop()
	slot0:resetEnhance()
	slot0:resetStory()
	slot0:resetBattle()
	slot0:resetPvP()
end

function slot0.resetShop(slot0)
	slot0:removeShopPrices()
	slot0.shopLogo:hide()
end

function slot0.resetEnhance(slot0)
	slot0.enhanceImg:hide()
	slot0:__checkAndRemove("priceNode")
	slot0:__checkAndRemove("enhanceTitle")
end

function slot0.resetStory(slot0)
	slot0:__checkAndRemove("storyDesc")

	if slot0.storyBars then
		for slot5, slot6 in pairs(slot1) do
			slot6.img:hide()
			slot6:removeFromParent()
		end
	end

	slot0.storyBars = nil
end

function slot0.resetBattle(slot0)
	slot0.battleLogo:hide()
	slot0:__checkAndRemove("battleDesc")
end

function slot0.resetPvP(slot0)
	slot0:__checkAndRemove("pvpDesc")
end

function slot0.__checkAndRemove(slot0, slot1)
	if slot0[slot1] then
		slot2:removeFromParent()
	end

	slot0[slot1] = nil
end

function slot0.updateMenuCopy(slot0, slot1)
	if slot0.menuCopy then
		slot0.menuCopy:removeFromParent()
	end

	slot2 = nil

	if slot1.isBoss then
		AutoChessEasy.getBossMenuInfo(slot0.parent.bossPanel, slot1, slot0.panel):x(650)
	else
		AutoChessEasy.getMenuInfo(slot0.parent.encounterPanel, slot1, slot0.panel):x(526)
	end

	slot0.menuCopy = slot2
end

function slot0.showStoryInfo(slot0, slot1)
	slot4 = slot1.optionState
	slot6 = slot0.battleView.panelShop:getBoundingBox()
	slot0.storyBars = slot0.storyBars or {}
	slot10 = slot6.height - slot8 - (slot6.height - slot6.height / 5) / (table.length(slot1.optionDescs) + 1)
	slot11 = rich.createWithWidth(slot1.desc, 37, nil, 1165)

	slot11:addTo(slot0.panel, 1):xy(slot6.width / 2 + 85, slot6.height - slot8):color(cc.c3b(95, 84, 93))

	slot0.storyDesc = slot11

	for slot16 = 1, slot3 do
		slot0.storyBars[slot16], slot0.storyBars[slot16].img = function (slot0)
			uv1 = "ccui"
			slot2 = ccui.ImageView:create("lushi/event/btn_zzq_box2.png")

			slot2:setTouchEnabled(false)
			slot2:setScale9Enabled(true)

			slot6 = 1200

			slot2:setContentSize(cc.size(slot6, 85))

			slot3 = slot2:getBoundingBox()
			uv6 = "ImageView"
			slot6 = slot6.panel
			slot7 = 1
			uv6 = "create"
			uv7 = "lushi/event/btn_zzq_box2.png"

			slot2:addTo(slot6, slot7):xy(slot6.width / 2 + slot7, slot1 - (slot0 - 1) * 90):show()

			slot4 = ccui.Scale9Sprite:create("lushi/event/btn_zzq_box1.png")

			slot4:setScale9Enabled(true)

			slot7 = slot3.width / 2

			slot4:setContentSize(cc.size(slot3.width + 15, slot3.height + 15)):addTo(slot2, -1):xy(slot7, slot3.height / 2):hide()

			uv7 = "setTouchEnabled"

			ccui.Text:create(slot7[slot0], "font/youmi.ttf", 37):addTo(slot2, 99):xy(50, slot3.height / 2):anchorPoint(0, 0.5):color(cc.c3b(95, 84, 93))

			return slot2, slot4
		end(slot16)
		slot0.storyBars[slot16].idx = slot16

		slot0.storyBars[slot16]:addClickEventListener(function ()
			uv0 = "selectId"
			uv1 = "storyBars"
			slot0.selectId = slot1
			uv1 = "idx"

			for slot3 = 1, slot1 do
				uv4 = "selectId"
				uv5 = "storyBars"

				if slot4.storyBars[slot5].idx == slot3 then
					uv4 = "selectId"

					slot4.storyBars[slot3].img:show()
				else
					uv4 = "selectId"

					slot4.storyBars[slot3].img:hide()
				end
			end
		end)
	end

	slot0:updateStory(slot4)
end

function slot0.updateStory(slot0, slot1)
	if not slot0.storyBars then
		return
	end

	for slot6, slot7 in ipairs(slot0.storyBars) do
		slot2 = 0 + 1

		if slot1[slot6] == 1 then
			slot7:setTouchEnabled(true)
			slot7:color(cc.c3b(255, 255, 255))
			slot7:show()
		elseif slot1[slot6] == 0 then
			slot7:setTouchEnabled(false)
			slot7:color(cc.c3b(128, 128, 128))
			slot7:show()
		else
			slot2 = slot2 - 1

			slot7:hide()
		end
	end

	slot3 = slot0.battleView.panelShop:getBoundingBox()
	slot4 = slot3.height / 5

	for slot10, slot11 in ipairs(slot0.storyBars) do
		if slot11:isVisible() then
			slot11:y(slot3.height - slot4 - (slot3.height - slot4) / (slot2 + 1) - (0 + 1 - 1) * 90)
		end
	end
end

function slot0.showEnhanceInfo(slot0, slot1)
	slot0:showBtnPrice()
	slot0:showBtnLeftTime(slot1.left, gLanguageCsv.autoChessEnhanceLeft)

	slot3 = cc.Label:createWithTTF(slot1.instruction, "font/youmi.ttf", 37)
	slot4, slot5 = slot0.menuCopy:getPosition()

	slot3:addTo(slot0.panel, 1):xy(slot4 + slot0.menuCopy:getBoundingBox().width / 2 + slot3:width() / 2, slot0.panel:getBoundingBox().height / 5 * 4):color(cc.c3b(95, 84, 93)):show()

	slot0.enhanceTitle = slot3
	slot0.enhanceType = slot1.enhanceType
end

function slot0.showBtnPrice(slot0, slot1)
	slot0:__checkAndRemove("priceNode")

	if (slot0.battleView:handleOperation(lushi.OperateTable.getEnhancePrice, slot1) or 0) <= 0 then
		return
	end

	slot3, slot4 = slot0.btn:getPosition()
	slot5 = AutoChessEasy.getShowPriceNode(64)

	slot5:get("goldIcon"):setScale(0.8)
	slot5:get("goldText"):setString(slot2)
	slot5:addTo(slot0.panel, 1):xy(slot3, slot4 + 80):show()

	slot0.priceNode = slot5
end

function slot0.showBtnLeftTime(slot0, slot1, slot2)
	if slot1 <= 0 then
		return
	end

	slot3, slot4 = slot0.btn:getPosition()
	slot5 = cc.Label:createWithTTF(string.format(slot2 or "", slot1), "font/youmi.ttf", 35)

	slot5:addTo(slot0.panel, 1):xy(slot3, slot4 - 80):color(lushi.EncounterColor.price):show()

	slot0.leftTimeText = slot5
end

function slot0.showBattleInfo()
	error("Decompilation failed")
	-- Exception in function building!
	-- Traceback (most recent call last):
	-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
	--     return _build_function_definition(prototype, state.header)
	--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
	--     node.statements.contents = _build_function_blocks(state, instructions)
	--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 75, in _build_function_blocks
	--     _blockenize(state, instructions)
	-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 143, in _blockenize
	--     _fix_broken_unary_expressions(state, instructions)
	-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1242, in _fix_broken_unary_expressions
	--     _remove_instruction(state, instructions, i + 1)
	-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1265, in _remove_instruction
	--     state.debuginfo.addr_to_line_map.pop(index)
	-- IndexError: pop from empty list
end

function slot0.showBattleAwards(slot0)
end

function slot0.showPVPInfo()
	error("Decompilation failed")
	-- Exception in function building!
	-- Traceback (most recent call last):
	-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
	--     return _build_function_definition(prototype, state.header)
	--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
	--     node.statements.contents = _build_function_blocks(state, instructions)
	--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 75, in _build_function_blocks
	--     _blockenize(state, instructions)
	-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 143, in _blockenize
	--     _fix_broken_unary_expressions(state, instructions)
	-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1242, in _fix_broken_unary_expressions
	--     _remove_instruction(state, instructions, i + 1)
	-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1265, in _remove_instruction
	--     state.debuginfo.addr_to_line_map.pop(index)
	-- IndexError: pop from empty list
end

function slot0.onShopSelect(slot0, slot1)
	if slot0.type ~= lushi.EncounterType.shop or slot0.selectId == slot1 then
		return
	end

	slot0.selectId = slot1

	for slot5, slot6 in pairs(slot0.ids) do
		if slot0.battleView:onViewProxyCall("getSceneObjById", slot6) then
			if slot7.model.seat == slot1 then
				slot7.holdingHaloVisible:set(true, "shop")
				slot7:onHoldingHalo()
			else
				slot7.holdingHaloVisible:set(nil, "shop", true)
				slot7:onHoldingHalo()
			end
		end
	end
end

function slot0.onListSelect(slot0, slot1)
	if slot0.type ~= lushi.EncounterType.enhance or slot0.selectId == slot1 then
		return
	end

	if slot1 then
		slot0:onSetEnhanceCard(slot1)
	elseif slot0.selectId then
		slot0:onResetEnhanceCard(slot0.selectId)
	end

	slot0.selectId = slot1
end

function slot2(slot0)
	slot0.battleView:handleOperation(lushi.OperateTable.encounterConfirm, slot0.selectId)
end

function slot3(slot0)
	slot0.battleView:handleOperation(lushi.OperateTable.gotoBattle)
end

slot4 = {
	[lushi.EncounterType.shop] = slot2,
	[lushi.EncounterType.enhance] = slot2,
	[lushi.EncounterType.battle] = slot3,
	[lushi.EncounterType.story] = slot2,
	[lushi.EncounterType.pvp] = slot3
}

function slot0.onClickConfirm(slot0)
	uv1 = "type"

	if slot1[slot0.type] then
		slot1(slot0)
	end
end

function slot0.onClickEnhance(slot0)
	slot0.battleView:showSelectList(true, slot0.enhanceType)
end

function slot0.setVisible(slot0, slot1)
	slot0.panel:setVisible(slot1)

	if not slot1 then
		slot0:resetSelected()
	end
end

function slot0.resetSelected(slot0)
	slot0:onShopSelect()
	slot0:onListSelect()
end

function slot0.updateShopInfo(slot0, slot1)
	slot0:showBtnLeftTime(slot1.left, gLanguageCsv.autoChessShopLeft)
	slot0:updateShopCardsPos(slot1.ids)
	slot0:updateShopPrices(slot1.prices, slot1.costType)
end

function slot0.updateShopCardsPos(slot0, slot1)
	slot2 = {}

	for slot6 = 1, 3 do
		if slot1[slot6] then
			table.insert(slot2, slot1[slot6])
		end
	end

	slot0.battleView:setPosByData(slot0.parent:calcPos(slot2))
end

function slot0.updateShopPrices(slot0, slot1, slot2)
	slot0:removeShopPrices()

	for slot6 = 1, 3 do
		if slot0.ids[slot6] and slot1[slot6] then
			slot7 = slot0.battleView:onViewProxyCall("getSceneObjById", slot0.ids[slot6])
			slot8 = AutoChessEasy.getShowPriceNode(60)

			slot8:get("goldText"):setString(slot1[slot6])

			slot10 = slot8:get("goldIcon")

			if slot2 == 1 then
				slot10:setTexture("city/adventure/auto_chess/icon_zzq_sl.png")
				slot10:scale(1.15)
			end

			slot8:addTo(slot0.panel, 1):xy(slot7:x(), slot7:y() + 230):show()
			table.insert(slot0.shopPriceNodes, slot8)
		end
	end
end

function slot0.removeShopPrices(slot0)
	for slot4, slot5 in ipairs(slot0.shopPriceNodes) do
		slot5:removeFromParent()
	end

	slot0.shopPriceNodes = {}
end

function slot0.onSetEnhanceCard(slot0, slot1)
	slot0:resetSelected()
	slot0:showBtnPrice(slot1)
	slot0.enhanceImg:setTouchEnabled(false)

	slot2 = slot0.battleView:onViewProxyCall("getSceneObjById", slot1)

	slot2:setClickEnable(false)
	slot2:retain()
	slot2:removeFromParent()
	slot2:addTo(slot0.panel):setPosition(slot0.enhanceImg:getPosition()):z(999):autorelease()
	slot2.sprite:setRotation3D({
		x = 0
	})

	if slot2.shadowBg then
		slot2.shadowBg:hide()
	end

	slot2.enhanceType = slot0.enhanceType
	slot2.isEnhancing = true
	slot0.battleView.isEnhancing = true
end

function slot0.onResetEnhanceCard(slot0, slot1)
	slot0:showBtnPrice()
	slot0.enhanceImg:setTouchEnabled(true)

	if slot0.battleView:onViewProxyCall("getSceneObjById", slot1) then
		slot2.isEnhancing = false
		slot2.enhanceType = nil

		slot0.battleView:onViewProxyNotify("addToGameLayer", slot1)
		slot2:setClickEnable(true)
		slot2:resetSpriteState()
	end

	slot0.battleView.isEnhancing = false
end

function slot0.onShow(slot0)
	if slot0.type == lushi.EncounterType.enhance then
		slot0:onClickEnhance()
	end

	slot0.parent:refreshPage(slot0.name, lushi.EncounterColor.info, false, lushi.EncounterRes.Titles[slot0.type], lushi.EncounterRes.Bgs[slot0.type])
end

function slot0.getCanReturn(slot0)
	return slot0.canReturn
end

function slot0.isBattle(slot0)
	return slot0.type == lushi.EncounterType.battle
end

return slot0
