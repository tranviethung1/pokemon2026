slot0 = {
	"standby_loop",
	"attack",
	"win_loop",
	"run_loop",
	"skill1"
}
slot1 = {
	gLanguageCsv.skinBuff1,
	gLanguageCsv.skinBuff2
}
slot2 = {
	"city/drawcard/draw/panel_card_gh.png",
	"city/drawcard/draw/panel_card_l.png",
	"city/drawcard/draw/panel_card_b.png",
	"city/drawcard/draw/panel_card_z.png",
	"city/drawcard/draw/panel_card_h.png",
	"city/drawcard/draw/panel_card_c.png",
	"city/drawcard/draw/panel_card_r.png"
}
slot3 = class("CardSkinView", Dialog)
slot3.RESOURCE_FILENAME = "card_skin.json"
slot3.RESOURCE_BINDING = {
	["panelRight.panelNature.txtBuffObj"] = "txtBuffObj",
	itemAttr = "itemAttr",
	["panelRight.txtLimitTime"] = "txtLimitTime",
	["panelRight.txtSkinDesc"] = "txtSkinDesc",
	["panelLeft.btnSwitch.imgSwitch"] = "imgSwitch",
	["panelLeft.imgFlag"] = "imgFlag",
	["panelLeft.imgActionDi"] = "imgActionBg",
	["panelRight.skinNoAdd"] = "skinNoAdd",
	["panelLeft.imgIconBg"] = "imgIconBg",
	["panelRight.panelNature"] = "panelNature",
	panelCell = "panelCell",
	item = "item",
	["panelLeft.textName"] = "cardNameTxt",
	["panelLeft.cardSpineNode"] = "cardSpineNode",
	["panelRight.imgDress"] = "imgDress",
	panelRight = "panelRight",
	["panelLeft.imgIcon"] = "imgIcon",
	starItem = "starItem",
	["panelLeft.btnSwitch.labelSwitch"] = "labelSwitch",
	["panelRight.skinList"] = "skinList",
	attrItem = "attrItem",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["panelLeft.attrList"] = {
		varname = "attrList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("attrDatas"),
				item = bindHelper.self("attrItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("imgIcon"):texture(ui.ATTR_ICON[slot3])
				end
			}
		}
	},
	["panelLeft.btnSwitch"] = {
		varname = "btnSwitch",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnSwitch")
			}
		}
	},
	["panelLeft.starList"] = {
		varname = "starList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 6,
				data = bindHelper.self("starDatas"),
				item = bindHelper.self("starItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("imgStar"):texture(slot3.icon)
				end
			}
		}
	},
	["panelLeft.heroNode"] = {
		varname = "heroNode",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onCardClick")
			}
		}
	},
	["panelRight.panelNature.infoList"] = {
		varname = "infoList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("skinNativeDatas"),
				item = bindHelper.self("itemAttr"),
				itemCell = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "listview",
						props = {
							margin = 100,
							data = slot3,
							item = slot0.itemCell,
							onItem = function (slot0, slot1, slot2, slot3)
								slot4 = slot1:multiget("title", "num")

								slot4.title:text(getLanguageAttr(slot3.attrType))
								slot4.num:text("+" .. dataEasy.getAttrValueString(slot3.attrType, slot3.attrValue))
								adapt.oneLinePos(slot4.title, slot4.num, cc.p(5, 0), "left")
								slot1:width(slot4.title:width() + slot4.num:width() + 5)
							end
						}
					})
				end
			}
		}
	},
	["panelRight.buttonLeft"] = {
		varname = "buttonLeft",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onButtonLeft")
			}
		}
	},
	["panelRight.buttonRight"] = {
		varname = "buttonRight",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onButtonRight")
			}
		}
	},
	["panelRight.buttonOp"] = {
		varname = "buttonOp",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onButtonOp")
			}
		}
	},
	["panelRight.buttonOp.text"] = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["panelRight.buttonBuy"] = {
		varname = "buttonBuy",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onButtonBuy")
			}
		}
	},
	["panelRight.buttonBuy.text"] = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	}
}

function slot3.onCreate(slot0, slot1)
	slot0.cardDbid = slot1
	slot0.selectID = idler.new(0)
	slot0.selectSkinID = idler.new(0)
	slot0.starDatas = idlertable.new({})
	slot0.attrDatas = idlers.newWithMap({})
	slot0.skinDatas = {}
	slot0.skinItemList = {}
	slot0.showTp = idler.new(0)
	slot0.skinNativeDatas = idlers.new({})
	slot0.cardActionState = idler.new(1)
	slot0.skinChilds = {}
	slot0.count = 10

	slot0:initModel()

	slot2 = gGameModel.cards:find(slot1)
	slot0.cardName = idlereasy.assign(slot2:getIdler("name"), slot0.cardName)
	slot0.cardId = idlereasy.assign(slot2:getIdler("card_id"), slot0.cardId)
	slot0.unitId = idlereasy.assign(slot2:getIdler("unit_id"), slot0.unitId)
	slot0.skinId = idlereasy.assign(slot2:getIdler("skin_id"), slot0.skinId)
	slot0.star = idlereasy.assign(slot2:getIdler("star"), slot0.star)
	slot0.advance = idlereasy.assign(slot2:getIdler("advance"), slot0.advance)
	slot0.level = idlereasy.assign(slot2:getIdler("level"), slot0.level)

	uiEasy.setIconName("card", slot0.cardId:read(), {
		space = true,
		node = slot0.cardNameTxt,
		name = slot0.cardName:read(),
		advance = slot0.advance:read()
	})
	idlereasy.when(slot0.star, function (slot0, slot1)
		slot2 = {}

		for slot7 = 1, 6 do
			slot8 = "common/icon/icon_star_d.png"

			if slot7 <= slot1 then
				slot8 = slot7 <= slot1 - 6 and "common/icon/icon_star_z.png" or "common/icon/icon_star.png"
			end

			table.insert(slot2, {
				icon = slot8
			})
		end

		uv4 = "common/icon/icon_star_d.png"

		slot4.starDatas:set(slot2)
	end)
	slot0.showTp:set(userDefault.getForeverLocalKey("skinShowType", 0, {
		rawData = true,
		rawKey = true
	}))
	slot0.cardId:addListener(function (slot0, slot1)
		slot3 = csv.unit[csv.cards[slot0].unitID]

		table.insert({}, slot3.natureType)

		if slot3.natureType2 then
			table.insert(slot4, slot3.natureType2)
		end

		uv5 = "csv"
		slot5 = slot5.attrDatas
		slot5 = slot5.update

		slot5(slot5, slot4)

		uv5 = "csv"

		slot5.imgFlag:texture(ui.RARITY_ICON[slot3.rarity])
	end)
	idlereasy.any({
		slot0.cardId,
		slot0.skins
	}, function (slot0, slot1, slot2)
		uv3 = "setSkinList"
		slot3 = slot3.setSkinList

		slot3(slot3, slot1, slot2)

		uv3 = "setSkinList"
		slot3 = slot3.initSkinList

		slot3(slot3)

		uv3 = "setSkinList"

		if slot3.selectID:read() ~= 0 then
			uv3 = "setSkinList"

			slot3.selectID:notify()
		end
	end)
	idlereasy.when(slot0.skinId, function (slot0, slot1)
		uv3 = "ipairs"

		for slot5, slot6 in ipairs(slot3.skinDatas) do
			if slot6.id and slot6.id == (slot1 or 0) then
				uv7 = "ipairs"

				slot7.selectID:set(slot5 - 1, true)

				break
			end
		end
	end)
	slot0.selectID:addListener(function (slot0, slot1)
		uv2 = "skinDatas"
		slot3 = slot0 + 1
		slot2 = slot2.skinDatas[slot3]
		uv3 = "skinDatas"
		slot3 = slot3.setSkinInfo

		slot3(slot3, slot2.id)

		uv3 = "skinDatas"
		slot3 = slot3.setButtonInfo

		slot3(slot3, slot2)

		uv3 = "skinDatas"
		slot3 = slot3.setButtonEnabled

		slot3(slot3)

		uv3 = "skinDatas"
		slot3 = slot3.setAutoScroll

		slot3(slot3, slot0)

		uv3 = "skinDatas"

		slot3:setLeftPanelInfo(slot2.unitId)
	end)
	idlereasy.when(slot0.showTp, function (slot0, slot1)
		uv2 = "setLeftPanelShow"
		slot2 = slot2.setLeftPanelShow

		slot2(slot2)

		uv2 = "setLeftPanelShow"
		slot2 = slot2.setLeftPanelInfo
		uv4 = "setLeftPanelShow"
		uv5 = "setLeftPanelShow"

		slot2(slot2, slot4.skinDatas[slot5.selectID:read() + 1].unitId)

		uv2 = "setLeftPanelShow"

		slot2.cardActionState:set(3, true)
	end)
	idlereasy.when(slot0.cardActionState, function (slot0, slot1)
		uv2 = "cardSprite"
		slot2 = slot2.cardSprite
		slot2 = slot2.setSpriteEventHandler

		slot2(slot2)

		uv2 = "cardSprite"
		slot2 = slot2.heroNode
		slot3 = slot2
		uv3 = "cardSprite"
		slot3 = slot3.cardSprite
		slot3 = slot3.retain

		slot3(slot3)

		uv3 = "cardSprite"
		slot3 = slot3.cardSprite
		slot3 = slot3.removeFromParent

		slot3(slot3)

		uv3 = "cardSprite"
		uv5 = "cardSprite"
		slot3 = slot3.cardSprite:addTo(slot5.heroNode, 5)
		slot3 = slot3.xy

		slot3(slot3, slot2.getContentSize(slot3).width / 2, 0)

		uv3 = "cardSprite"

		slot3.cardSprite:release()

		if slot1 ~= 1 then
			slot3 = 0
			uv4 = "cardSprite"

			slot4.cardSprite:setSpriteEventHandler(function ()
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
			end, sp.EventType.ANIMATION_COMPLETE)
		end

		if slot1 == 4 then
			uv3 = "cardSprite"
			uv5 = "setSpriteEventHandler"
			slot6 = false

			slot3.cardSprite:play(slot5[slot1], slot6)

			for slot6 = 2, 5 do
				uv7 = "cardSprite"
				uv9 = "setSpriteEventHandler"

				slot7.cardSprite:addPlay(slot9[slot1])
			end
		else
			uv3 = "cardSprite"
			uv5 = "setSpriteEventHandler"

			slot3.cardSprite:play(slot5[slot1])
		end

		uv4 = "cardSprite"
		uv5 = "setSpriteEventHandler"

		if (csv.cards[slot4.cardId:read()].soundsEffect or {})[slot5[slot1]] then
			uv6 = "setSpriteEventHandler"

			audio.playEffectWithWeekBGM(slot4[slot6[slot1]])
		end
	end)
	Dialog.onCreate(slot0)
end

function slot3.initModel(slot0)
	slot0.skins = gGameModel.role:getIdler("skins")
end

function slot3.setSkinList(slot0, slot1, slot2)
	slot5 = {
		{
			sign = false,
			rank = 0
		},
		{
			isHas = 0,
			sign = true,
			skinType = 1,
			days = 0,
			skinFrameType = 1,
			rank = 1,
			id = 0,
			icon = slot6.cardShow,
			scale = slot6.cardShowScale,
			posOffset = slot6.cardShowPosC,
			rarity = slot6.rarity,
			unitId = slot0.unitId:read(),
			name = gLanguageCsv.skinStart
		}
	}
	slot6 = csv.unit[slot0.unitId:read()]

	for slot10, slot11 in csvMapPairs(csv.cards[slot1].skinSkillMap) do
		if gSkinCsv[slot10] and slot12.isOpen then
			slot15 = csv.unit[dataEasy.getUnitId(slot0.cardId:read(), slot10)]
			slot5[#slot5 + 1] = {
				skinFrameType = 0,
				sign = true,
				id = slot10,
				skinType = slot12.skinType,
				days = slot12.days,
				isHas = slot2[slot10] or false,
				icon = slot15.cardShow,
				scale = slot15.cardShowScale,
				posOffset = slot15.cardShowPosC,
				rarity = slot15.rarity,
				costMap = slot12.costMap,
				skinFrameRes = slot12.skinFrameRes,
				extraItem = slot12.extraItem,
				isOpen = slot12.isOpen,
				name = slot12.name,
				desc = slot12.desc,
				rank = slot12.rank + 2,
				activeType = slot12.activeType,
				unitId = slot14
			}
		end
	end

	slot5[#slot5 + 1] = {
		sign = false,
		rank = 99999
	}

	table.sort(slot5, function (slot0, slot1)
		return slot0.rank < slot1.rank
	end)

	slot0.skinDatas = slot5
end

function slot3.initCell(slot0, slot1, slot2, slot3)
	slot4 = slot1:multiget("ImageBg", "labelName", "imageAdd", "imgLimitBg", "labelInfo")

	nodetools.map({
		slot4.imageAdd,
		slot4.imgLimitBg,
		slot4.labelInfo
	}, "visible", false)
	slot1:visible(slot2.sign)

	if not slot2.sign then
		return
	end

	slot5 = slot4.ImageBg:size()
	slot6 = 80
	slot7 = ccui.Scale9Sprite:create()

	slot7:initWithFile(cc.rect(82, 82, 1, 1), "common/icon/mask_card.png")
	slot7:size(slot5.width - 39, slot5.height - 39):alignCenter(slot5)

	slot8 = cc.Sprite:create(slot2.icon)
	slot9 = slot8:size()
	slot10 = cc.p(slot2.posOffset.x / slot2.scale, -slot2.posOffset.y / slot2.scale)
	slot11 = cc.size(slot5.width / slot2.scale, slot5.height / slot2.scale)

	slot8:alignCenter(slot5):scale(slot2.scale + 0.2):setTextureRect(cc.rect((slot9.width - slot11.width) / 2 - slot10.x, (slot9.height - slot11.height) / 2 - slot10.y, slot11.width, slot11.height))
	slot1:removeChildByName("clipping")

	slot13 = cc.ClippingNode:create(slot7):setAlphaThreshold(0.1):size(slot5):alignCenter(slot1:size()):add(slot8):addTo(slot1, 5, "clipping")

	slot4.labelName:text(slot2.name)

	if slot2.skinFrameType == 1 then
		uv16 = "multiget"

		slot4.ImageBg:texture(slot16[slot2.rarity + 2])
	else
		slot4.ImageBg:texture(slot2.skinFrameRes)
	end

	slot1:removeChildByName("cardSkinListSpine")
	slot8:show()

	if csv.unit[slot2.unitId].cardSpine and (slot2.skinType ~= 1 or slot14.cardSpineNeedStar <= slot0.star:read()) then
		slot8:hide()
		function (slot0, slot1)
			uv3 = "widget"
			slot4 = cc.p
			uv4 = "widget"
			slot5 = slot4
			uv5 = "addAnimationByKey"
			slot5 = slot5.cardSpinePos.x
			slot4 = slot4.width(slot5) / 2 + slot5
			uv5 = "widget"
			slot6 = slot5
			uv6 = "addAnimationByKey"
			uv4 = "addAnimationByKey"

			return widget.addAnimationByKey(slot3, slot0, slot1, "effect_loop", 5):setAnchorPoint(slot4(0.5, 0.5)):xy(slot4, slot5.height(slot6) / 2 + slot6.cardSpinePos.y):scale(slot4.cardSpineScale)
		end(slot14.cardSpine, "cardSkinListSpine")
	end

	slot8:removeChildByName("shinySpine")

	if slot14.shinyRes then
		widget.addAnimationByKey(slot8, slot14.shinyRes, "shinySpine", "effect_loop", 4):setAnchorPoint(cc.p(0.5, 0.5)):xy(slot12.width / 2 + slot14.shinyPos.x, slot11.height / 2 + slot14.shinyPos.y)
	end

	bind.touch(slot0, slot1, {
		clicksafe = true,
		scaletype = 0,
		methods = {
			ended = function ()
				uv0 = "onButtonClick"
				uv1 = "onButtonClick"
				uv2 = "onButtonClick"

				slot0.onButtonClick(slot1, slot2)
			end
		}
	})

	if slot2.isHas then
		return
	end

	if slot2.extraItem and csvSize(slot2.extraItem) == 1 then
		slot4.imageAdd:visible(true)

		slot16, slot17 = csvNext(slot2.extraItem)
		slot19 = cc.Sprite:create(csv.items[slot16].icon)

		slot19:alignCenter(slot19:size()):scale(1.2):xy(cc.p(80, 80)):addTo(slot4.imageAdd)
	end
end

function slot3.initSkinList(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0.skinDatas) do
		slot7 = slot0.panelCell:clone()
		slot1[#slot1 + 1] = slot7

		slot0:initCell(slot7, slot6, slot5)
	end

	slot0.skinChilds = slot1

	slot0.skinList:removeAllChildren()

	slot2 = slot0.panelCell:anchorPoint()
	slot3 = slot0.panelCell:size()

	for slot7, slot8 in pairs(slot1) do
		slot9 = slot8:anchorPoint()

		slot8:xy(slot3.width * (slot9.x + slot7 - 1), slot3.height * slot9.y)
		slot0.skinList:add(slot8, #slot1 - slot7)
	end

	slot0.skinList:setInnerContainerSize(cc.size(#slot1 * slot3.width, slot3.height))
	slot0.skinList:setScrollBarEnabled(false)
	slot0.skinList:setInertiaScrollEnabled(false)

	slot4 = slot0.skinList:size()
	slot6 = slot0.skinList:getInnerContainer()
	slot7 = slot4.width / 2
	slot8 = slot0.skinList:getInnerContainerSize().width - slot4.width
	slot9 = slot3.width

	slot0.skinList:onScroll(function (slot0)
		if slot0.name == "CONTAINER_MOVED" then
			uv1 = "name"

			slot1()
		elseif slot0.name == "SCROLLING_ENDED" then
			uv1 = "CONTAINER_MOVED"
			slot4 = 0
			uv4 = "SCROLLING_ENDED"
			slot4 = -slot4
			slot2 = math.abs(math.max(math.min(slot1:x(), slot4), slot4))
			slot1 = slot2
			uv2 = "x"
			uv4 = "x"
			slot4 = slot1 / slot4
			uv4 = "x"

			if slot1 % slot2 > slot4 / 2 then
				slot3 = math.floor(slot4) + 1
			end

			uv4 = "math"

			slot4.selectID:set(slot3 + 1, true)
		end
	end)
	function ()
		uv0 = "x"
		uv2 = "pairs"

		for slot4, slot5 in pairs(slot2) do
			uv8 = "xy"
			slot8 = slot8 - slot5:xy() - slot0:x()
			uv8 = "xy"
			slot7 = 1.1 - 0.4 * math.abs(slot8) / slot8

			slot5:scale(slot7, slot7)
		end
	end()
end

function slot3.setLeftPanelInfo(slot0, slot1)
	slot2 = csv.unit[slot1]

	if slot0.cardSprite then
		slot0.cardSprite:removeFromParent()
	end

	slot0.cardSprite = widget.addAnimation(slot0.heroNode, slot2.unitRes, "standby_loop", 5):xy(slot0.heroNode:getContentSize().width / 2, 0)

	slot0.cardSprite:scale(slot2.scaleU * 3)
	slot0.cardSprite:setSkin(slot2.skin)

	slot4 = slot0.showTp:read() == 0

	slot0.imgIcon:visible(not slot4)
	slot0.imgIconBg:visible(not slot4)
	slot0.cardSpineNode:visible(not slot4)
	slot0.imgIcon:texture(slot2.cardShow)
	slot0.cardActionState:set(3, true)

	slot6 = slot2.cardSkinPos

	slot0.cardSpineNode:removeChildByName("cardSpine")
	slot0.imgIcon:removeChildByName("shinySpine")

	if not slot4 then
		slot0.imgIcon:show()

		if slot2.cardSpine and (slot0.skinDatas[slot0.selectID:read() + 1].skinType ~= 1 or slot2.cardSpineNeedStar <= slot0.star:read()) then
			slot0.imgIcon:hide()
			function (slot0, slot1)
				uv3 = "widget"
				slot4 = cc.p
				uv4 = "widget"
				slot4 = slot4.imgIconBg
				slot5 = slot4
				uv5 = "addAnimationByKey"
				slot5 = slot5.cardSkinPos.x
				slot4 = slot4.width(slot5) / 2 + slot5
				uv5 = "widget"
				slot5 = slot5.imgIconBg
				slot6 = slot5
				uv6 = "addAnimationByKey"
				uv4 = "addAnimationByKey"

				widget.addAnimationByKey(slot3.cardSpineNode, slot0, slot1, "effect_loop", 5):setAnchorPoint(slot4(0.5, 0.5)):xy(slot4, slot5.height(slot6) / 2 + slot6.cardSkinPos.y):scale(slot4.cardSkinScale)
			end(slot2.cardSpine, "cardSpine")
		end

		if slot2.shinyRes then
			slot0.imgIcon:show()
			widget.addAnimationByKey(slot0.imgIcon, slot2.shinyRes, "shinySpine", "effect_loop", 4):alignCenter(slot0.imgIcon:size())
		end
	end
end

function slot3.setSkinInfo(slot0, slot1)
	slot0.panelNature:visible(slot1 ~= 0)
	slot0.skinNoAdd:visible(slot1 == 0)
	slot0.panelRight:removeChildByName("extraTip")
	slot0.panelRight:removeChildByName("sign")

	if slot1 == 0 then
		return
	end

	slot3 = {}
	slot4 = 0
	uv7 = "panelNature"

	slot0.txtBuffObj:text(slot7[csv.card_skin[slot1].attrAddType])

	slot5 = {}

	for slot9 = 1, 6 do
		if slot9 % 3 == 1 then
			if slot9 > 3 and #slot5 > 0 then
				slot3[#slot3 + 1] = slot5
			end

			slot5 = {}
		end

		if slot2["attrType" .. slot9] and slot10 ~= 0 then
			table.insert(slot5, {
				attrType = slot10,
				attrValue = slot2["attrNum" .. slot9]
			})
		end
	end

	if #slot5 > 0 then
		slot3[#slot3 + 1] = slot5
	end

	slot6, slot7 = slot0.skinNoAdd:xy()

	if #slot3 > 0 then
		slot0.skinNativeDatas:update(slot3)
		slot0.panelNature:get("desc"):y(slot0.infoList:y() + slot0.infoList:height() - slot0.infoList:size().height)
	else
		slot0.panelNature:visible(false)
		slot0.skinNoAdd:visible(true)

		slot7 = slot7 + 50
	end

	if slot2.extraTip ~= "" then
		rich.createByStr(slot2.extraTip, 40):anchorPoint(0.5, 0.5):xy(slot6, slot7):addTo(slot0.panelRight, 1, "extraTip")
	end

	if slot2.sign ~= "" then
		rich.createByStr("#C0x5B545B#" .. slot2.sign, 50):anchorPoint(0.5, 0.5):xy(slot6, 1140):addTo(slot0.panelRight, 1, "sign")
	end
end

function slot3.setAutoScroll(slot0, slot1)
	slot6 = slot0.skinList:getInnerContainerSize().width - slot0.skinList:size().width

	if math.abs(math.max(math.min(slot0.skinList:getInnerContainer():x(), -1), -(slot6 + 1))) >= 0 and slot6 >= slot7 - 2 then
		slot0.skinList:scrollToPercentHorizontal(math.min(slot0.panelCell:size().width * (slot1 - 1), slot6) / slot6 * 100, 0.4, true)
	end

	slot0.count = slot0.count + 1

	slot0.skinChilds[slot1 + 1]:setLocalZOrder(slot0.count)
end

function slot3.setButtonInfo(slot0, slot1)
	if slot0.panelRight:get("privilege") then
		slot2:removeFromParent()
	end

	nodetools.map({
		slot0.imgDress,
		slot0.buttonOp,
		slot0.buttonBuy,
		slot0.txtLimitTime,
		slot0.txtSkinDesc
	}, "visible", false)

	if slot0.skinId:read() == slot1.id then
		slot0.imgDress:show()
	elseif slot1.isHas then
		slot0.buttonOp:show()
	elseif csvSize(slot1.costMap) > 0 then
		slot0.buttonBuy:show()

		slot3 = gLanguageCsv.skinXiaoFei
		slot4 = true

		for slot8, slot9 in csvMapPairs(slot1.costMap) do
			if dataEasy.getNumByKey(slot8) < slot9 then
				slot4 = false
			end

			slot3 = slot3 .. string.format("%d#I%s-56-56#", slot9, dataEasy.getIconResByKey(slot8))
		end

		slot6, slot7 = slot0.buttonBuy:xy()
		slot8 = rich.createByStr(slot3, 40):addTo(slot0.panelRight, 10, "privilege"):anchorPoint(1, 0.5):xy(cc.p(slot6 - slot0.buttonBuy:size().width / 2 - 10, slot7)):formatText()
	else
		slot0.txtSkinDesc:show()
		slot0.txtSkinDesc:text(slot1.desc)
	end

	if slot1.isHas and slot1.isHas > 0 then
		if time.getTime() < math.ceil(slot1.isHas) then
			slot0.txtLimitTime:show()

			slot7 = ""

			if math.floor((slot3 - slot4) / 3600 / 24) > 0 then
				slot0.txtLimitTime:text(string.format(gLanguageCsv.skinTip05, slot6))
			else
				function ()
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
				end()

				slot9 = tag or 100

				slot0:enableSchedule():unSchedule(slot9)
				slot0:schedule(function ()
					uv0 = "gGameApp"

					if not slot0() then
						gGameApp:requestServer("/game/sync")

						return false
					end
				end, 1, 1, slot9)
			end
		end
	end
end

function slot3.setButtonEnabled(slot0)
	slot0.buttonRight:visible(slot0.selectID:read() + 2 < #slot0.skinDatas)
	slot0.buttonLeft:visible(slot1 > 1)
end

function slot3.setLeftPanelShow(slot0)
	slot1 = slot0.showTp:read() == 0

	slot0.heroNode:visible(slot1)
	slot0.imgActionBg:visible(slot1)
	slot0.imgSwitch:xy(slot1 and cc.p(156, 40) or cc.p(40, 40))
	slot0.labelSwitch:xy(slot1 and cc.p(70, 40) or cc.p(125, 40))
	slot0.labelSwitch:text(slot1 and gLanguageCsv.skinAction or gLanguageCsv.skinImg)
end

function slot3.onButtonBuy(slot0)
	slot3 = true
	slot4, slot5 = csvNext(slot0.skinDatas[slot0.selectID:read() + 1].costMap)
	slot2 = gLanguageCsv.skinTip01 .. string.format("%d#I%s-56-56#", slot5, dataEasy.getIconResByKey(slot4))

	if dataEasy.getNumByKey(slot4) < slot5 then
		slot3 = false
	end

	if slot3 then
		gGameUI:showDialog({
			isRich = true,
			btnType = 2,
			strs = string.format(gLanguageCsv.skinTip02, slot2, slot1.name),
			cb = function ()
				uv4 = "gGameApp"

				gGameApp:requestServer("/game/card/skin/buy", function (slot0)
					uv6 = "gGameUI"

					gGameUI:stackUI("city.card.skin.award", nil, , slot6.id)
				end, slot4.id)
			end,
			dialogParams = {
				clickClose = false
			}
		})
	else
		uiEasy.showDialog(slot4)
	end
end

function slot3.onCardClick(slot0)
	slot1 = slot0.cardActionState:read()
	slot2 = nil

	repeat
		uv5 = "cardActionState"
	until math.random(2, #slot5) ~= slot1

	slot0.cardActionState:set(slot2, true)
end

function slot3.onButtonRight(slot0)
	slot0.selectID:set(math.min(slot0.selectID:read() + 1, #slot0.skinDatas - 2))
end

function slot3.onButtonLeft(slot0)
	slot0.selectID:set(math.max(slot0.selectID:read() - 1, 1))
end

function slot3.onButtonOp(slot0)
	gGameApp:requestServer("/game/card/skin/use", function (slot0)
		gGameUI:showTip(gLanguageCsv.skinTip03)
	end, slot0.skinDatas[slot0.selectID:read() + 1].id, slot0.cardDbid)
end

function slot3.onBtnSwitch(slot0)
	slot0.showTp:set(slot0.showTp:read() == 0 and 1 or 0)
end

function slot3.onButtonClick(slot0, slot1)
	slot0.selectID:set(slot1 - 1)
	slot0.skinList:setEnabled(false)
	performWithDelay(slot0.skinList, function ()
		uv0 = "skinList"

		slot0.skinList:setEnabled(true)
	end, 0.2)
end

function slot3.onClose(slot0)
	Dialog.onClose(slot0)
	userDefault.setForeverLocalKey("skinShowType", slot0.showTp:read(), {
		rawKey = true
	})
end

return slot3
