slot0 = require("lushi_battle.views.model")

require("lushi_battle.tools.include")
require("lushi_battle.views.module.include")
require("lushi_battle.views.sprite")
require("lushi_battle.views.sprite_equip")
require("lushi_battle.views.sprite_event")
require("lushi_battle.views.sprite_list")
require("lushi_battle.views.event_list_item")
require("lushi_battle.views.find_list_item")
require("lushi_battle.views.effects.include")

slot2 = class("AutoChessBattleView", cc.load("mvc").ViewBase)
globals.AutoChessBattleView = slot2
slot3 = require("lushi_battle.test_data")

require("lushi_battle.pack.pack")

slot2.RESOURCE_STYLES = {
	disableTimeSpeeder = true
}
slot2.RESOURCE_FILENAME = "auto_chess_battle.json"
slot2.RESOURCE_BINDING = {
	["stage.panelEvent.eventNum"] = "eventNum",
	["stage.panelSale"] = "panelSale",
	cardPanel = "cardPanel",
	handSelect = "handSelect",
	["ui.playBtn.rateNum"] = "rateNum",
	["stage.panelShop.panelMenu"] = "panelMenu",
	["ui.goldNum"] = "goldNum",
	skillInfoPanel = "skillInfoPanel",
	["stage.panelTrainer1"] = "panelTrainer1",
	["stage.panelHand"] = "panelHand",
	["handSelect.panelText.bg"] = "handSelectBg",
	["bossPanel.descLabel"] = "bossDesc",
	["encounterPanel.descLabel"] = "encounterDesc",
	encounterPanel = "encounterPanel",
	pointSpr = "pointSpr",
	bg = "bg",
	bossPanel = "bossPanel",
	["stage.panelEvent.eventIcon"] = "eventIcon",
	["stage.panelHero"] = "panelHero",
	["stage.panelShop.panelInfo"] = "panelInfo",
	["bossPanel.titleLabel"] = "bossTitle",
	["ui.goldIcon"] = "goldIcon",
	["stage.panelShop"] = "panelShop",
	stage = "stage",
	["stage.panelTrainer2"] = "panelTrainer2",
	["stage.panelShop.shopBg"] = "shopBg",
	["handSelect.panelText"] = "handSelectPanel",
	["stage.panelEnemy"] = "panelEnemy",
	ui = "ui",
	["stage.panelEvent"] = {
		varname = "panelEvent",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onShowEventList")
				}
			}
		}
	},
	["stage.fightBtn"] = {
		varname = "fightBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onStartFight")
			}
		}
	},
	["ui.backBtn"] = {
		varname = "backBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onEncounterBack")
			}
		}
	},
	["ui.playBtn"] = {
		varname = "playBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSpeeedUp")
			}
		}
	},
	["ui.pauseBtn"] = {
		varname = "pauseBtn",
		binds = {
			event = "touch",
			clicksafe = true,
			methods = {
				ended = bindHelper.self("onPause")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	display.director:setProjection(cc.DIRECTOR_PROJECTION_3D)

	slot0._model = nil
	slot0._scene = nil
	slot0._play = nil
	slot0.modelWaitType = nil
	slot0.isFighting = false
	slot0.gameLayer = nil
	slot0.deathCache = {}
	slot0.pages = {}
	slot0.drawOutId = nil
	slot0.pointToBuffer = {}
	slot0.guideManager = require("lushi_battle.app_views.lushi_battle.guide_manager").new(slot0)
	slot0.effectManager = autoChessEffect.Manager.new("AutoChessView")
	slot0.subModuleNotify = autoChessModule.CNotify.new(slot0)
	slot0.onceEffectWaitCount = 0

	if (slot1 or {}).isGuide then
		slot0.playBtn:hide()
		slot0.pauseBtn:hide()

		uv4 = "display"
		require("app.models.chess_play").new(gGameModel):init(slot4.getNewbieData()):getData().isGuide = true
	elseif lushi.InitFromRecord then
		if not (gGameModel.battle and gGameModel.battle:getData() or {}).stateSet or slot1.stateSet == "" then
			slot2 = io.open("zzqtest.rc", "rb")

			slot2:close()

			slot1.stateSet = slot2:read("*a")
		end
	else
		uv4 = "display"
		slot1 = require("app.models.chess_play").new(gGameModel):init(slot4.getData()):getData()
	end

	slot0:initBattle(slot1)

	slot0.modelPauseTimer = {}

	slot0:initSpeed()

	function slot2(slot0, slot1)
		slot0.__ani:setOpacity(0)
		slot0:setSpriteEventHandler(function (slot0, slot1)
			if slot0 == sp.EventType.ANIMATION_COMPLETE then
				uv2 = "sp"
				slot2 = slot2.__ani
				slot2 = slot2.setOpacity

				slot2(slot2, 255)

				uv2 = "sp"

				slot2:setSpriteEventHandler()
			end

			uv2 = "EventType"

			if slot2 then
				uv2 = "EventType"

				slot2()
			end
		end)
	end

	slot0.fightBtn:setTouchEnabled(false)

	slot3 = newCSprite("lushi/button/zizouqi_anniu.skel")

	slot3:play("effect2")
	slot3:addTo(slot0.fightBtn):xy(100, 100):scale(2)
	slot2(slot3, function ()
		uv0 = "setSpriteEventHandler"

		slot0:setSpriteEventHandler(function (slot0, slot1)
			if slot0 == sp.EventType.ANIMATION_COMPLETE then
				uv2 = "sp"

				slot2:fightBtnEffectOver()
			end
		end)
	end)

	slot0.fightSprite = slot3
	slot4 = newCSprite("lushi/gold/zzq_jb.skel")

	slot4:play("effect")
	slot4:addTo(slot0.ui):xy(slot0.goldIcon:getPosition()):scale(2)
	slot0.goldIcon:hide()
	slot2(slot4)

	slot0.goldEffect = slot4
	slot0.goldNumX = slot0.goldNum:x() + 33

	text.addEffect(slot0.goldNum, {
		color = lushi.Color.white,
		outline = {
			size = 3,
			color = cc.c4b(50, 45, 50, 255)
		}
	})
	text.addEffect(slot0.bossTitle, {
		color = lushi.Color.white2,
		outline = {
			size = 4,
			color = cc.c4b(91, 84, 91, 255)
		}
	})
	text.addEffect(slot0.bossDesc, {
		color = lushi.Color.white2,
		outline = {
			size = 4,
			color = cc.c4b(91, 84, 91, 255)
		}
	})
	text.addEffect(slot0.eventNum, {
		outline = {
			size = 4,
			color = lushi.Color.white2
		}
	})
	adapt.setTextAdaptWithSize(slot0.bossDesc, {
		maxLine = 2,
		vertical = "top",
		horizontal = "center",
		size = cc.size(340, 85)
	})
	adapt.setTextAdaptWithSize(slot0.encounterDesc, {
		maxLine = 3,
		vertical = "top",
		horizontal = "center",
		size = cc.size(300, 115)
	})
	adapt.centerWithScreen({
		"left",
		nil,
		false
	}, {
		"right",
		nil,
		false
	}, nil, {
		{
			slot0.shopPanel,
			"width"
		},
		{
			slot0.shopBg,
			"width"
		}
	})
	slot0:addTestBtn()
end

function slot2.cleanUp(slot0)
	if slot0._model then
		slot0._model:cleanUp()
	end
end

function slot2.reset(slot0)
	slot1 = slot0.cleanUp

	slot1(slot0)

	uv1 = "cleanUp"
	slot0._model = slot1.new()
	slot0._scene = nil
	slot0._play = nil
	slot0.tick = 0
	slot0.fightBtnTouchEnable = AutoChessEasy.priorDataTable(false, "fightBtnTouchEnable")
	slot0.allTouchDisable = AutoChessEasy.priorDataTable(false, "allTouchDisable")
end

function slot2.initBattle(slot0, slot1)
	slot0:reset()

	slot0.data = slot1
	slot6 = 999

	slot0:get("Panel"):add(slot0:createLayerGame(), 1):add(slot0:createDeleteObjLayer()):add(slot0:createUILayer(), slot6)
	slot0.subModuleNotify:init()

	for slot6, slot7 in ipairs(lushi.PageOrder) do
		slot0.pages[slot7] = gGameUI:createView(lushi.Pages[slot7].viewName, slot0):init(slot0)
	end

	slot0.pointSpr:removeFromParent():addTo(slot0.gameLayer, 9997)

	slot0.pointHeadSpr = cc.Sprite:create("lushi/img_jt0.png"):addTo(slot0.gameLayer, 9998):hide()
	slot0.pointTailSpr = cc.Sprite:create("lushi/img_jt1.png"):addTo(slot0.gameLayer, 9996):hide()

	slot0.pointTailSpr:runAction(cc.RepeatForever:create(cc.RotateBy:create(1, 180)))
	slot0._model:reset(slot1)

	slot0.timeScale = 1

	display.director:resume()
	display.director:getScheduler():setTimeScale(slot0.timeScale)

	if display.director.isSpineThreadDrawEnabled then
		display.director:setSpineThreadDrawEnabled(false)
	end

	collectgarbage("stop")
end

function slot2.createLayerGame(slot0)
	slot1 = ccui.Layout:create()

	slot1:setAnchorPoint(cc.p(0.5, 0.5))

	slot2 = slot0.stage

	slot1:setPosition(slot2:getPosition())
	slot1:setContentSize(slot2:size())
	slot1:setName("gameLayer")

	slot0.gameLayer = slot1

	return slot1
end

function slot2.createDeleteObjLayer(slot0)
	slot1 = cc.Layer:create()

	slot1:name("deleteObjLayer"):setVisible(false)

	slot0.deleteObjLayer = slot1

	return slot1
end

function slot2.createUILayer(slot0)
	slot0.layer = cc.Layer:create()

	slot0.layer:name("UILayer")

	return slot0.layer
end

function slot2.onModelWait(slot0, slot1)
	slot0.modelWaitType = slot1

	slot0._model:setModelEnable(false)

	slot0.modelPauseTimer[1] = os.clock()
end

function slot2.onModelResume(slot0)
	slot0.modelWaitType = nil

	slot0._model:setModelEnable(true)

	slot0.modelPauseTimer = {}
end

slot4, slot5, slot6 = nil

function slot2.onUpdate()
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

function slot2.onEventEffect(slot0, slot1, slot2, slot3)
	slot4 = nil

	if slot1 then
		slot4 = slot0:onViewProxyCall("getSceneObj", slot1.id)
	end

	slot5 = slot4 or slot0

	return slot0.effectManager:addAndPlay(nil, autoChessEffect.newEventEffect(slot2, slot5, slot3, slot4 or slot5))
end

function slot2.onEventEffectQueue(slot0, slot1, slot2)
	return slot0.effectManager:queueAppend(autoChessEffect.newEventEffect(slot1, slot0, slot2, slot0))
end

function slot2.onEventEffectQueueFront(slot0, slot1, slot2)
	return slot0.effectManager:queuePrepend(autoChessEffect.newEventEffect(slot1, slot0, slot2, slot0))
end

function slot2.getSceneModel(slot0)
	if not slot0._scene then
		slot0._scene = readOnlyProxy(slot0._model.scene)
	end

	return slot0._scene
end

function slot2.getSceneRaw(slot0)
	return slot0._model.scene
end

function slot2.getPlayModel(slot0)
	if not slot0._play then
		slot0._play = readOnlyProxy(slot0._model.scene.play)
	end

	return slot0._play
end

function slot2.updateAllEmbattlePos(slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		if slot0:onViewProxyCall("getSceneObjById", slot6.id) then
			slot7:updatePos(slot6.x, slot6.y)
		end
	end
end

function slot2.setPosByData(slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		if slot0:onViewProxyCall("getSceneObjById", slot6.id) then
			slot7:updatePos(slot6.x, slot6.y, 0)
		end
	end
end

function slot2.onClose(slot0)
	slot0:cleanUp()

	slot0._model = nil
	slot0._scene = nil
	slot0._play = nil

	battleComponents.clearAll()

	if slot0.guideManager:isInGuiding() then
		slot0.guideManager:onClose()
	end

	uv1 = "cleanUp"

	slot1.onClose(slot0)
end

function slot2.getPanelByState(slot0, slot1, slot2)
	if slot1 == lushi.ObjectReadyState.hand then
		return slot0.panelHand
	elseif slot1 == lushi.ObjectReadyState.shop then
		return slot0.panelShop
	elseif slot2 == 1 then
		return slot0.panelHero
	elseif slot2 == 2 then
		return slot0.panelEnemy
	elseif slot2 == 0 then
		return slot0.panelSale
	end
end

function slot2.displayTeamObjSprites(slot0, slot1, slot2)
	for slot7, slot8 in pairs(slot0:onViewProxyCall("getSceneAllObjs")) do
		if slot8.team == slot1 then
			if slot2 then
				slot8:show()
			else
				slot8:hide()
			end
		end
	end
end

function slot2.addFakeCard(slot0)
	if not slot0.fakeCard then
		slot1 = newCSprite("lushi/icon_wz.png")

		slot1:align(cc.p(0.5, 0.5), -1000, -1000):addTo(slot0.gameLayer):setRotation3D({
			x = -15
		}):setCascadeOpacityEnabled(true)

		slot0.fakeCard = slot1
	end

	if slot0.fakeCardVisible then
		return
	end

	slot0.fakeCardVisible = true

	slot0.fakeCard:stopAllActions()
	transition.executeSequence(slot0.fakeCard):func(function ()
		uv0 = "fakeCard"
		slot0 = slot0.fakeCard
		slot0 = slot0.show

		slot0(slot0)

		uv0 = "fakeCard"

		slot0.fakeCard:setOpacity(0)
	end):fadeIn(0.15):done()
end

function slot2.setFakeCardPos(slot0, slot1)
	if not slot0.fakeCard then
		return
	end

	slot0.fakeCard:setPosition(slot1)
end

function slot2.removeFakeCard(slot0)
	if not slot0.fakeCard then
		return
	end

	if not slot0.fakeCardVisible then
		return
	end

	slot0.fakeCardVisible = false

	slot0.fakeCard:stopAllActions()
	transition.executeSequence(slot0.fakeCard):fadeOut(0.15):func(function ()
		uv0 = "fakeCard"

		slot0.fakeCard:hide()
	end):done()
end

function slot2.onHandCardDrawOut(slot0, slot1, slot2)
	if slot1 then
		slot2:playDrawOut(slot1)

		slot0.drawOutId = nil
	else
		if slot0.drawOutId and slot0:onViewProxyCall("getSceneObjById", slot0.drawOutId) then
			slot3:playDrawOut(true)
		end

		slot2:playDrawOut(slot1)

		slot0.drawOutId = slot2.model.id
	end

	slot0:onOtherDrawSlide()
end

function slot2.onOtherDrawSlide(slot0)
	slot1 = slot0._model.scene

	if not slot0.drawOutId then
		slot0:refreshPostion(nil, lushi.ObjectReadyState.hand)

		return
	end

	slot3 = -100

	for slot7, slot8 in ipairs(slot1.handCards) do
		if slot8.id == slot0.drawOutId then
			slot3 = 100
		else
			slot0:onViewProxyCall("getSceneObjById", slot8.id):slideDrawOut(slot3)
		end
	end
end

function slot2.getDrawOutId(slot0)
	return slot0.drawOutId
end

slot7 = {
	[lushi.PointToType.equip] = function (slot0, slot1)
		return slot0.model:canAddEquipment(slot1.equipSpr.model.unitCfg.filterTarget)
	end,
	[lushi.PointToType.trainer] = function (slot0, slot1)
		return slot0.model.scene.trainer[slot1.index]:canUseSkill(slot0.id)
	end,
	[lushi.PointToType.event] = function (slot0, slot1)
		return slot0.model.scene:checkEventSelect(slot1.eventSpr.id, slot0.id)
	end
}

function slot2.getPointTobuffer(slot0, slot1, slot2, slot3)
	if not slot0.pointToBuffer[slot2.id] then
		uv6 = "pointToBuffer"
		slot0.pointToBuffer[slot2.id] = slot6[slot1](slot2, slot3)
	end

	return slot0.pointToBuffer[slot2.id]
end

function slot2.onPointTo(slot0, slot1, slot2, slot3)
	if not slot2 or slot0.selectTargetId ~= slot2.model.id then
		slot0:removePointTo(slot1)
	end

	if slot2 then
		if slot0:getPointTobuffer(slot1, slot2, slot3) then
			slot0.selectTargetId = slot2.model.id

			slot0:showPointTo(slot1, slot2)
		else
			slot0:removePointTo(slot1)
		end
	end
end

function slot2.onPointEnd(slot0, slot1)
	slot0.pointToBuffer = {}

	slot0:removePointTo(slot1)
end

function slot2.showPointTo(slot0, slot1, slot2)
	slot2:onBePointingTo(slot1, true)
end

function slot2.removePointTo(slot0, slot1)
	if slot0.selectTargetId then
		if slot0:onViewProxyCall("getSceneObjById", slot0.selectTargetId) then
			slot2:onBePointingTo(slot1, false)
		end

		slot0.selectTargetId = nil
	end
end

function slot2.onCanPointTo(slot0, slot1, slot2, slot3)
	for slot8, slot9 in slot0:getSceneModel().heros:order_pairs() do
		if slot0:onViewProxyCall("getSceneObjById", slot9.id) then
			slot10:onCanPointTo(slot2 and slot0:getPointTobuffer(slot1, slot10, slot3))
		end
	end
end

function slot2.refreshPostion(slot0, slot1, slot2)
	slot3 = nil

	if slot2 == lushi.ObjectReadyState.embattle then
		if slot1 == 3 then
			slot3 = slot0:getSceneModel():getAllEmbattlePos()
		else
			slot3 = slot0:getSceneModel():calcEmbattlePos(slot1)
		end
	elseif slot2 == lushi.ObjectReadyState.hand then
		slot3 = slot0:getSceneModel():calcHandPos()
	end

	slot0:setPosByData(slot3)
end

function slot2.showFightBtn(slot0, slot1, slot2, slot3, slot4)
	slot0.fightBtnTouchEnable:set(slot1, slot2, slot3)

	if slot0.fightBtnTouchEnable:get() == slot0.fightBtnTouchEnable:get() then
		return
	end

	if not slot4 then
		slot0.fightBtn:setTouchEnabled(slot6)
		slot0.fightSprite:play(slot6 and "effect" or "effect2")
	else
		slot0.fightBtn:setTouchEnabled(slot6)
	end
end

function slot2.fightBtnEffectOver(slot0)
	slot0.fightBtn:setTouchEnabled(slot0.fightBtnTouchEnable:get())
end

function slot2.onStartFight(slot0)
	slot0:showFightBtn(false)
	slot0:startFight()
	slot0:onViewProxyNotify("updateBackBtn")
	slot0:handleOperation(lushi.OperateTable.startFight)
end

function slot2.startFight(slot0)
	slot0.isFighting = true
end

function slot2.endFight(slot0)
	slot0.isFighting = false

	slot0:onViewProxyNotify("updateBackBtn")
end

function slot2.onGameOver(slot0, slot1)
	slot0:onViewProxyNotify("setShopVisible", false)
	slot0:onViewProxyNotify("showEventList", false)

	slot0.isGameOver = true

	display.director:getScheduler():setTimeScale(1)
end

function slot2.backToCity(slot0)
	slot0.backView = "city.view"
end

function slot2.setEffectDebugBreakpoint(slot0, slot1)
	slot0.effectManager:resume()

	if slot1 == nil then
		slot0.effectManager:setEffectPlayCallback(nil)

		return
	end

	slot0.effectManager:setEffectPlayCallback(function (...)
		uv0 = "effectManager"

		if slot0(...) then
			uv0 = "resume"

			slot0.effectManager:resume()
		else
			uv0 = "resume"

			slot0.effectManager:pause()
		end
	end)
end

function slot2.handleOperation(slot0, slot1, ...)
	if slot0.allTouchDisable:get() then
		return
	end

	if not slot0.guideManager:checkOperate(slot1, ...) then
		return
	end

	return slot0._model:handleOperation(slot1, ...)
end

function slot2.onEncounterBack(slot0, ...)
	slot0:onViewProxyNotify("encounterBack")
end

function slot2.onShowEventList(slot0)
	if slot0.isGameOver then
		return
	end

	slot0:showEventList(true)
end

function slot2.onUpdateGoldNum(slot0, slot1)
	slot0.goldNum:setText(slot1)
	slot0.goldNum:x(slot0.goldNumX - slot0.goldNum:getBoundingBox().width)
	slot0.goldEffect:x(slot0.goldNum:x() - 53)

	if not slot0.goldInit then
		slot0.goldInit = true

		return
	end

	slot0.goldNum:runAction(cc.Sequence:create(cc.ScaleTo:create(0.25, 1.5), cc.ScaleTo:create(0.15, 1)))
	slot0.goldEffect:play("effect")
end

function slot2.clearDeleteObjLayer(slot0)
	slot0.deleteObjLayer:removeAllChildren()
end

function slot2.showSellingPrice(slot0, slot1, slot2)
	function slot3(slot0, slot1)
		if slot0:get("goldText") then
			slot2:removeFromParent()
		end

		slot3 = rich.createWithWidth(lushi.SaleGoldNum .. slot1, 72, nil, 300):anchorPoint(0, 0.5):addTo(slot0, 1, "goldText"):xy(10, -120)
	end

	if not slot0.saleHalo then
		slot4 = slot0.panelSale:box()
		slot5 = newCSprite("lushi/zizouqi_cj.skel")

		slot5:play("sell_cards_off", true)
		slot5:addTo(slot0.panelSale, 0):xy(slot4.width / 2, -118)

		slot0.saleHalo = slot5
		slot6 = newCSprite("lushi/zizouqi_cj.skel")

		slot6:play("sell_cards_on2", true)
		slot6:addTo(slot0.panelSale, 3):xy(slot4.width / 2, -118)

		slot0.saleHalo2 = slot6
	end

	if not slot0.salePrice then
		slot4 = cc.Node:create()
		slot5 = cc.Sprite:create(lushi.goldRes)

		slot5:xy(-40, -120):addTo(slot4, 1, "goldIcon")
		slot5:setContentSize(72, 72)
		ccui.ImageView:create("lushi/pop/logo_ljt1.png"):xy(0, 0):addTo(slot4, 1, "deleteIcon")
		slot3(slot4, 0)
		slot4:addTo(slot0.panelSale, 1):xy(slot0.panelSale:width() / 2, slot0.panelSale:height() / 2)

		slot0.salePrice = slot4
		slot0.panelSale.isInArea = false
	end

	if slot2 ~= slot0.panelSale.isInArea then
		if slot2 then
			slot0.salePrice:get("deleteIcon"):loadTexture("lushi/pop/logo_ljt2.png")
			slot0.saleHalo:play("sell_cards_on1", true)
			slot0.saleHalo2:show()
		else
			slot0.saleHalo:play("sell_cards_off", true)
			slot0.salePrice:get("deleteIcon"):loadTexture("lushi/pop/logo_ljt1.png")
			slot0.saleHalo2:hide()
		end

		slot0.panelSale.isInArea = slot2
	end

	if (slot1 and true or false) == slot0.panelSale:isVisible() then
		return
	end

	if slot4 then
		slot0.panelSale:show()
		slot3(slot0.salePrice, slot1)
	else
		slot0.panelSale:hide()
	end

	slot0:onViewProxyNotify("setShopVisible", not slot4, "sale", not slot4)
	slot0:displayTeamObjSprites(2, not slot4)
end

function slot2.showFightState(slot0, slot1)
	newCSprite("lushi/zizouqi_cj.skel"):addTo(slot0, 9999):xy(display.width / 2, display.height / 2 + 40)

	if slot1 then
		slot2:play("the_competition_" .. slot1)
	else
		slot2:play("battle_begins")
	end

	AutoChessEasy.autoRemoveSpine(slot2)
	AutoChessEasy.queueEffect("wait", {
		lifetime = 1500
	})
end

function slot2.showReadyState(slot0)
	slot1 = newCSprite("lushi/zizouqi_cj.skel")

	slot1:addTo(slot0, 9999):xy(display.width / 2, display.height / 2 + 40)
	slot0.gameLayer:hide()
	slot0:showFightBtn(true)
	slot0:showFightBtn(false, "stageAction", false, true)
	slot1:play("prewar_preparation")
	slot0:onViewProxyNotify("playTrainerEnterEffect")
	AutoChessEasy.autoRemoveSpine(slot1, function ()
		uv0 = "gameLayer"
		slot0 = slot0.gameLayer
		slot0 = slot0.show

		slot0(slot0)

		uv0 = "gameLayer"

		slot0:showFightBtn(nil, "stageAction", true, true)
	end)
	AutoChessEasy.queueEffect("wait", {
		lifetime = 1500
	})
end

function slot2.onPause(slot0)
	gGameUI:stackUI("lushi_battle.pause", nil, , slot0):z(99999)
end

function slot2.initSpeed(slot0)
	slot0.timeScale = tonumber(userDefault.getForeverLocalKey("chessSpeed", 1))

	slot0:setSpeed()
end

function slot2.onSpeeedUp(slot0)
	slot0.timeScale = slot0.timeScale + 1

	if table.length(lushi.SpeedTimeScale) < slot0.timeScale then
		slot0.timeScale = 1
	end

	userDefault.setForeverLocalKey("chessSpeed", slot0.timeScale)
	slot0:setSpeed()
end

function slot2.setSpeed(slot0)
	slot0.rateNum:setText("x" .. slot0.timeScale)
	display.director:getScheduler():setTimeScale(lushi.SpeedTimeScale[slot0.timeScale])
end

function slot2.showTip(slot0, ...)
	gGameUI:showTip(...)
end

function slot2.onUpdatePanelEvent(slot0, slot1)
	if slot1 and slot1 > 0 then
		slot0.eventIcon:loadTexture("lushi/event/btn_zzq_sjk1.png")
		slot0.eventNum:show()
		slot0.eventNum:setText(slot1)
	else
		slot0.eventIcon:loadTexture("lushi/event/btn_zzq_sjk0.png")
		slot0.eventNum:hide()
	end
end

function slot2.setGuideData(slot0, slot1)
	slot0.guideManager:setData(slot1)
end

function slot2.onGuideOver(slot0)
	gGameUI:switchUI("city.view")
	gGameUI:stackUI("city.adventure.auto_chess.view", nil, {
		full = true
	})
end

function slot2.changeMainBg(slot0, slot1)
	slot0.bg:loadTexture(slot1)
end

function slot2.setDisableState(slot0, slot1, slot2)
	slot3 = slot0.allTouchDisable:get()

	if slot1 then
		slot0.allTouchDisable:set(true, slot2, false)
	else
		slot0.allTouchDisable:set(nil, slot2, true)
	end

	if slot0.allTouchDisable:get() ~= slot3 then
		slot0:setAllBtns()
	end
end

function slot2.setAllBtns(slot0)
	slot1 = not slot0.allTouchDisable:get()

	slot0.panelEvent:setTouchEnabled(slot1)
	slot0.backBtn:setTouchEnabled(slot1)
	slot0.playBtn:setTouchEnabled(slot1)
	slot0.pauseBtn:setTouchEnabled(slot1)

	if not slot1 then
		slot0:showFightBtn(false, "allDisable", false, true)
	else
		slot0:showFightBtn(nil, "allDisable", true, true)
	end
end

require("lushi_battle.views.viewac_proxy")
require("lushi_battle.views.viewac_pages")
require("lushi_battle.views.viewac_test")

return slot2
