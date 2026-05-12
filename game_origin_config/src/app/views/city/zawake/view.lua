slot0 = require("app.views.city.zawake.tools")
slot1 = 3120
slot2 = -1000
slot3 = 1300
slot5 = class("ZawakeView", cc.load("mvc").ViewBase)
slot5.RESOURCE_FILENAME = "zawake.json"
slot5.RESOURCE_BINDING = {
	["bgMap.mainPanel"] = "mainPanel",
	bgMap = "bgMap",
	["bgMap.mainPanel.topPanel"] = "topPanel",
	["bgMap.mainPanel.cardIcon"] = {
		varname = "cardIcon",
		binds = {
			event = "click",
			method = bindHelper.self("onReplaceClick")
		}
	},
	["rightPanel.btnRule.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["rightPanel.btnPreview.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["rightPanel.btnReset.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["bgMap.npcPanel"] = {
		varname = "npcPanel",
		binds = {
			event = "click",
			method = bindHelper.self("onAwakeClick")
		}
	},
	["rightPanel.btnRule"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRuleClick")
			}
		}
	},
	["rightPanel.btnPreview"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPreviewClick")
			}
		}
	},
	["rightPanel.btnReset"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onResetClick")
			}
		}
	},
	["rightPanel.toLastStageBtn.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c3b(236, 78, 87)
				}
			}
		}
	},
	["leftPanel.toLeftBtn.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c3b(236, 78, 87)
				}
			}
		}
	},
	["rightPanel.toLastStageBtn"] = {
		varname = "toLastStageBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onJumpToLastStageClick")
			}
		}
	},
	["leftPanel.toLeftBtn"] = {
		varname = "toLeftBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onJumpToLeftClick")
			}
		}
	},
	["bgMap.mainPanel.btnReplace"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onReplaceClick")
			}
		}
	},
	["bgMap.mainPanel.btnReplace.txt"] = {
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

function slot5.onCreate(slot0, slot1)
	slot0.bgMap:size(display.sizeInViewRect):x(display.sizeInViewRect.x):jumpToPercentHorizontal(50)

	slot2 = slot1 or {}
	slot0.params = slot2

	if not slot2.zawakeID then
		uv3 = "bgMap"
		slot3 = slot3.getFightPointMaxCard()
	end

	slot0.zawakeID = idler.new(slot3)

	slot0:initModel()
	slot0:initStagePanel()
	slot0:initBgMap()
	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "ZAWAKE",
		title = gLanguageCsv.zawake
	})
	slot0.zawakeID:addListener(function (slot0, slot1)
		uv2 = "getCardByZawakeID"
		slot2 = slot2.getCardByZawakeID(slot0)
		slot4 = slot2.cfg.unitID
		slot3 = csv.unit[slot4]
		uv4 = "csv"
		slot4 = slot4.topPanel:multiget("icon", "name")

		slot4.icon:texture(ui.RARITY_ICON[slot3.rarity])

		slot5 = slot4.name
		slot5 = slot5.text

		slot5(slot5, slot2.cfg.name)

		uv5 = "csv"
		slot5 = slot5.cardIcon
		slot6 = slot5

		slot5.removeAllChildren(slot6)

		uv6 = "csv"
		slot7 = slot3.unitRes
		uv7 = "csv"
		slot5 = widget.addAnimation(slot6.cardIcon, slot7, "standby_loop", 5):xy(slot7.cardIcon:width() / 2, 0):scale(slot3.scaleU * 2.3)
		slot6 = slot5
		slot5 = slot5.setSkin(slot6, slot3.skin)
		uv6 = "csv"

		slot6:updateAllStage()

		if slot0 ~= slot1 then
			uv6 = "csv"

			slot6:updateMainSpine(true)
		end
	end)
	idlereasy.when(slot0.zawake, function (slot0, slot1)
		uv2 = "updateAllStage"

		slot2:updateAllStage(slot1 or {})
	end)
	slot0.showStageID:addListener(function ()
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
	end)
end

function slot5.initModel(slot0)
	slot0.zawake = gGameModel.role:getIdler("zawake")
	slot0.showStageID = idler.new(1)
	slot0.npcIsMove = false
	slot0.npcWidth = slot0.npcPanel:width()
end

function slot5.initBgMap(slot0)
	slot0.bgMap:setScrollBarEnabled(false)
	slot0.bgMap:width(display.sizeInViewRect.width)

	slot1 = slot0.bgMap:getInnerContainer()

	slot0.bgMap:onScroll(function (slot0)
		if slot0.name == "CONTAINER_MOVED" then
			uv1 = "name"
			slot1 = slot1.toLastStageBtn
			slot1 = slot1.visible
			uv3 = "CONTAINER_MOVED"
			slot4 = slot3
			uv4 = "toLastStageBtn"
			slot3 = slot4 < slot3.x(slot4)

			slot1(slot1, slot3)

			uv1 = "name"
			slot1 = slot1.toLeftBtn
			slot1 = slot1.visible
			uv3 = "CONTAINER_MOVED"
			slot4 = slot3
			uv4 = "toLastStageBtn"
			slot3 = slot3.x(slot4) <= slot4

			slot1(slot1, slot3)

			uv1 = "name"
			uv3 = "CONTAINER_MOVED"

			slot1:setShowStageID(slot3:x())
		end
	end)
	slot0:onJumpToLeftClick()
	slot0:updateLianjieSpine(slot0.bgMap)
	slot0:updateMainSpine()
end

function slot5.initStagePanel(slot0)
	slot0.stagPanels = {}
	slot0.stagPanelsPosX = {}
	uv2 = "stagPanels"

	for slot4 = 1, slot2.MAXSTAGE do
		slot5 = slot0.bgMap:get("stagePanel" .. slot4)

		table.insert(slot0.stagPanels, slot5)
		table.insert(slot0.stagPanelsPosX, slot5:x())

		slot6 = slot5:get("infoPanel")

		text.addEffect(slot6:get("textStage"), {
			outline = {
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		})
		text.addEffect(slot6:get("textLevel0"), {
			outline = {
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		})
		text.addEffect(slot6:get("textLevel1"), {
			outline = {
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		})
		text.addEffect(slot6:get("textLevel2"), {
			outline = {
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		})

		slot7 = slot5:get("closePanel")

		text.addEffect(slot7:get("txt"), {
			outline = {
				color = cc.c4b(71, 66, 71, 255)
			}
		})
		slot7:get("bg"):width(slot7:get("txt"):width() + 50)
		bind.click(slot0, slot5:get("spineNode"), {
			method = function ()
				uv0 = "onStageClick"
				uv2 = "onStageClick"

				slot0:onStageClick(slot2)
			end
		})
	end
end

function slot5.updateMainSpine(slot0, slot1)
	slot2 = slot1 and "qiehuan" or "standby_loop"
	slot3 = 65
	slot4 = widget.addAnimationByKey(slot0.mainPanel, "zawake/jixiebi.skel", "effectBottom", slot2 .. "_hou", 5)

	slot4:scale(2)
	slot4:xy(slot0.mainPanel:width() / 2, slot3)
	slot4:play(slot2 .. "_hou")

	slot5 = widget.addAnimationByKey(slot0.mainPanel, "zawake/jixiebi.skel", "effectTop", slot2 .. "_qian", 15)

	slot5:scale(2)
	slot5:xy(slot0.mainPanel:width() / 2, slot3)
	slot5:play(slot2 .. "_qian")

	if slot1 then
		slot0.cardIcon:hide()
		performWithDelay(slot0.cardIcon, function ()
			uv0 = "cardIcon"

			slot0.cardIcon:show()
		end, 0.75)
		slot4:setTimeScale(2)
		slot4:setSpriteEventHandler(function (slot0, slot1)
			uv2 = "play"
			slot2 = slot2.play

			slot2(slot2, "standby_loop_hou")

			uv2 = "play"

			slot2:setTimeScale(1)
		end, sp.EventType.ANIMATION_COMPLETE)
		slot5:setTimeScale(2)
		slot5:setSpriteEventHandler(function (slot0, slot1)
			uv2 = "play"
			slot2 = slot2.play

			slot2(slot2, "standby_loop_qian")

			uv2 = "play"

			slot2:setTimeScale(1)
		end, sp.EventType.ANIMATION_COMPLETE)
	end
end

function slot5.setShowStageID(slot0, slot1)
	if slot0.npcIsMove then
		return
	end

	slot0.npcIsMove = true

	if slot0.stagPanelsPosX[slot0.showStageID:read()] < math.abs(slot1) or slot2 > slot1 + display.sizeInViewRect.width - slot0.npcWidth then
		slot3 = 1
		uv5 = "npcIsMove"

		for slot7 = 1, slot5.MAXSTAGE do
			if slot1 < slot0.stagPanelsPosX[slot7] then
				slot3 = slot7

				break
			end
		end

		if slot3 ~= slot0.showStageID:read() then
			slot0.showStageID:set(slot3)
		end
	end

	slot0.npcIsMove = false
end

function slot5.updateAllStage(slot0, slot1)
	uv4 = "zawake"

	for slot6 = 1, slot4.MAXSTAGE do
		slot0:updateStagePanel(slot6, ((slot1 or slot0.zawake:read() or {})[slot0.zawakeID:read()] or {})[slot6] or 0)
		bind.extend(slot0, slot0.stagPanels[slot6]:get("infoPanel"), {
			class = "red_hint",
			props = {
				specialTag = "canZawakeByStage",
				listenData = {
					stageID = slot6,
					zawakeID = slot0.zawakeID:read()
				},
				onNode = function (slot0)
					slot0:xy(340, 110)
				end
			}
		})
	end
end

function slot5.updateNpcSpine(slot0, slot1, slot2, slot3)
	slot5 = widget.addAnimationByKey(slot0.npcPanel, "zawake/meilutan.skel", "effect", slot1, 2)

	slot5:scaleX(slot2 and -2 or 2)
	slot5:setTimeScale(slot3 or 1)
	slot5:scaleY(2)
	slot5:play(slot1)
	slot5:xy(slot0.npcWidth / 2, 0)
end

function slot5.updateStageSpine(slot0, slot1, slot2)
	slot1:get("img"):hide()

	slot6 = string.format("zawake/jiqi_%s.skel", slot2)
	slot7 = "effect_posun_loop"

	if (((slot0.zawake:read() or {})[slot0.zawakeID:read()] or {})[slot2] or 0) > 0 then
		slot7 = "effect_xiufu_loop" .. slot5
	end

	slot8 = widget.addAnimationByKey(slot1, slot6, "effect", slot7, 5)

	slot8:scale(2)
	slot8:play(slot7)
	slot8:xy(slot1:width() / 2, 0)

	if slot2 == 4 then
		slot9 = widget.addAnimationByKey(slot1, slot6, "houEffect", "effect_hou_loop", 2)

		slot9:scale(2)
		slot9:play("effect_hou_loop")
		slot9:xy(slot1:width() / 2, 0)
	elseif slot2 == 7 then
		slot9 = widget.addAnimationByKey(slot1, "zawake/jiqi_7_hou.skel", "houEffect", slot7, 2)

		slot9:scale(2)
		slot9:play(slot7)
		slot9:xy(slot1:width() / 2, 0)
	end
end

function slot5.delStageSpine(slot0, slot1)
	slot1:get("img"):show()
	slot1:removeChildByName("effect")
	slot1:removeChildByName("houEffect")
end

function slot5.updateLianjieSpine(slot0, slot1, slot2)
	if slot2 == 4 then
		slot0:updateLianjieSpine(slot1, 3)
	elseif slot2 == 6 then
		slot0:updateLianjieSpine(slot1, 5)
	end

	slot3 = {
		{
			500,
			215
		},
		{
			733,
			23
		},
		{
			-480,
			37
		},
		{
			647,
			141
		},
		{
			-530,
			177
		},
		{
			420,
			95
		},
		{
			488,
			112
		},
		{
			370,
			169
		}
	}
	slot4 = "effect_boliguandao_kaiqi_loop"

	if slot2 then
		slot8 = string.format("effect_chuansongdai_%d_guanbi_loop", slot2)
		slot4 = slot8
		uv8 = "updateLianjieSpine"
		slot9 = slot0.zawakeID:read()
		uv9 = "updateLianjieSpine"

		if (((slot0.zawake:read() or {})[slot0.zawakeID:read()] or {})[slot2] or 0) == slot9.MAXLEVEL and slot8.isPreUnlockByState(slot9, slot2) then
			slot4 = string.format("effect_chuansongdai_%d_kaiqi_loop", slot2)
		end
	end

	slot5 = widget.addAnimationByKey(slot1, "zawake/lianjie_1.skel", "chuansongdai" .. (slot2 or 0), slot4, 3)

	slot5:scale(2)
	slot5:play(slot4)

	if slot2 then
		slot5:xy(slot3[slot2][1], slot3[slot2][2])
	else
		slot5:xy(1260, 405)
	end
end

function slot5.onJumpToLeftClick(slot0)
	uv2 = "math"
	slot2 = slot0.bgMap

	slot2:scrollToPercentHorizontal(math.max((slot2 - display.sizeInViewRect.width) / 2, 0) / (slot0.bgMap:getInnerContainerSize().width - display.sizeInViewRect.width) * 100, 0.5, true)
	slot0.toLastStageBtn:show()
	slot0.toLeftBtn:hide()
end

function slot5.onJumpToLastStageClick(slot0)
	slot3 = {}

	for slot7, slot8 in pairs((slot0.zawake:read() or {})[slot0.zawakeID:read()] or {}) do
		table.insert(slot3, {
			stage = slot7,
			level = slot8
		})
	end

	table.sort(slot3, function (slot0, slot1)
		return slot1.stage < slot0.stage
	end)

	slot4 = 1

	if #slot3 > 0 then
		slot4 = slot3[1].stage
	end

	slot0:moveToByStage(slot4)
end

function slot5.onStageClick(slot0, slot1)
	slot2 = slot0.zawakeID
	slot3 = slot2
	slot2 = slot2.read(slot3)
	uv3 = "zawakeID"
	slot5 = slot1
	slot3, slot4 = slot3.getStagesCfg(slot2, slot5)
	uv5 = "zawakeID"

	if not slot5.isOpenByStage(slot2, slot1) then
		gGameUI:showTip(gLanguageCsv.comingSoon)

		return
	end

	uv6 = "zawakeID"
	slot6, slot7 = slot6.isPreUnlockByState(slot2, slot1)

	if slot6 then
		gGameUI:stackUI("city.zawake.stage", nil, {
			backGlass = true
		}, {
			stage = slot1,
			zawakeID = slot2
		})

		return
	end

	gGameUI:stackUI("city.zawake.unlock_tips", nil, , {
		labelDatas = slot7,
		stageID = slot1
	})
end

function slot5.moveToByStage(slot0, slot1, slot2)
	slot3 = slot0.stagPanels[slot1]

	if slot2 then
		slot0.bgMap:jumpToPercentHorizontal(math.max(slot3:x() + slot3:width() / 2 - display.sizeInViewRect.width / 2, 0) / (slot0.bgMap:getInnerContainerSize().width - display.sizeInViewRect.width) * 100)
	else
		slot0.bgMap:scrollToPercentHorizontal(slot5, 0.5, true)
	end
end

function slot5.updateStagePanel(slot0, slot1, slot2)
	slot3 = slot0.stagPanels[slot1]
	slot5 = slot3
	uv5 = "stagPanels"

	if slot2 == slot5.MAXLEVEL then
		text.addEffect(slot3.get(slot5, "infoPanel"):get("textLevel1"), {
			color = ui.COLORS.NORMAL.WHITE
		})
	else
		text.addEffect(slot4:get("textLevel1"), {
			color = ui.COLORS.NORMAL.RED
		})
	end

	slot4:get("textLevel1"):text(slot2)
	slot4:get("textStage"):text(string.format("%s%s", gLanguageCsv.effortAdvance, gLanguageCsv["symbolRome" .. slot1]))
	adapt.oneLineCenterPos(cc.p(slot4:width() / 2, slot4:height() / 2), {
		slot4:get("textStage"),
		slot4:get("textLevel0"),
		slot4:get("textLevel1"),
		slot4:get("textLevel2")
	}, cc.p(3, 0))

	slot5 = slot4:get("bg")
	slot5 = slot5.width

	slot5(slot5, slot4:get("textStage"):width() + slot4:get("textLevel0"):width() + slot4:get("textLevel1"):width() + slot4:get("textLevel2"):width() + 70)

	uv5 = "stagPanels"
	slot5 = slot5.isOpenByStage(slot0.zawakeID:read(), slot1)
	slot7 = slot3
	uv7 = "stagPanels"
	slot7, slot8 = slot7.getStagesCfg(slot0.zawakeID:read(), slot1)
	slot9 = slot3:get("closePanel")

	slot9:visible(not slot5)
	text.addEffect(slot9:get("txt"), {
		outline = {
			color = cc.c4b(71, 66, 71, 255)
		}
	})
	slot3.get(slot7, "lockPanel"):hide()

	if slot5 then
		uv10 = "stagPanels"
		slot10, slot0.stagPanels[slot1].labelDatas, slot12 = slot10.isPreUnlockByState(slot0.zawakeID:read(), slot1)
		slot0.stagPanels[slot1].isUnlock = slot10

		slot6:visible(not slot10)
		slot0:updateStageSpine(slot3:get("spineNode"), slot1)
		slot4:show()

		if not slot10 then
			uv13 = "stagPanels"

			if slot2 == slot13.MAXLEVEL and not slot12 then
				slot9:show()
				slot6:visible(false)
				slot9:get("txt"):text(gLanguageCsv.starNotZawake)
				slot9:get("bg"):width(slot9:get("txt"):width() + 50)
			end

			slot0:delStageSpine(slot3:get("spineNode"))
		end
	else
		slot9:get("txt"):text(gLanguageCsv.comingSoon)
		slot9:get("bg"):width(slot9:get("txt"):width() + 50)
		slot0:delStageSpine(slot3:get("spineNode"))
		slot4:hide()
	end

	if slot1 == 3 or slot1 == 5 then
		return
	end

	slot0:updateLianjieSpine(slot3:get("spineNode"), slot1)
end

function slot5.onAwakeClick(slot0)
	gGameUI:stackUI("city.zawake.force")
end

function slot5.onPreviewClick(slot0)
	slot3 = (gGameModel.role:read("zawake") or {})[slot0.zawakeID:read()] or {}
	slot4 = {}
	uv6 = "zawakeID"

	for slot8 = 1, slot6.MAXSTAGE do
		uv10 = "zawakeID"

		for slot12 = 1, slot10.MAXLEVEL do
			uv13 = "zawakeID"

			if slot13.getLevelCfg(slot1, slot8, slot12) and slot13.skillID > 0 then
				uv14 = "zawakeID"

				if slot14.getSkillCfg(slot1, slot13.skillID) then
					gGameUI:stackUI("city.zawake.preview", nil, , slot1)

					return
				end
			end
		end
	end

	gGameUI:showTip(gLanguageCsv.zawakeNoPreviewSkill)
end

function slot5.onResetClick(slot0)
	for slot6, slot7 in pairs((slot0.zawake:read() or {})[slot0.zawakeID:read()] or {}) do
		if slot7 > 0 then
			gGameUI:stackUI("city.zawake.reset", nil, , slot0.zawakeID:read())

			return
		end
	end

	gGameUI:showTip(gLanguageCsv.zawakeResetTips)
end

function slot5.onReplaceClick(slot0)
	gGameUI:stackUI("city.zawake.replace", nil, , {
		zawakeID = slot0.zawakeID
	})
end

function slot5.onRuleClick(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1500
	})
end

function slot5.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.zawake)
		end),
		slot2.noteText(124001, 124051)
	}
end

function slot5.onClose(slot0)
	if slot0.params.cb and slot0.params.zawakeID ~= slot0.zawakeID:read() then
		uv2 = "params"

		if slot2.getCardByZawakeID(slot0.zawakeID:read()).dbId then
			slot1(slot2.dbId)
		end
	end

	slot2 = gGameApp
	slot2 = slot2.requestServer

	slot2(slot2, "/game/card/zawake/quit")

	uv2 = "cb"

	slot2.onClose(slot0)
end

return slot5
