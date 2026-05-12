slot0 = table.insert
slot1 = table.sort
slot2 = {
	NORMAL = "city/card/gem/btn_yq_b.png",
	SELECTED = "city/card/gem/btn_yq_h.png"
}
slot3 = {
	nil,
	"effect_lv",
	"effect_lan",
	"effect_zi",
	"effect_huang",
	"effect_hong"
}
slot4 = {
	nil,
	"effect_lv_loop",
	"effect_lan_loop",
	"effect_zi_loop",
	"effect_huang_loop",
	"effect_hong_loop"
}
slot6 = require("app.views.city.card.gem.tools")
slot7 = class("GemView", cc.load("mvc").ViewBase)
slot7.RESOURCE_FILENAME = "gem.json"
slot7.RESOURCE_BINDING = {
	["right.btnFilterPanel.btnFilter.arrow"] = "filterArrow",
	["left.bg2"] = "centerBg",
	["right.acquire.num"] = "acquireNum",
	["right.item"] = "item",
	["right.btnFilterPanel"] = "btnFilterPanel",
	["right.noGemTip"] = "noGemTip",
	left = "left",
	["right.pageBtn"] = "pageBtn",
	["right.acquire.bg"] = "acquireBg",
	["right.subList"] = "subList",
	right = "right",
	["right.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				asyncPreload = bindHelper.self("asyncPreload"),
				data = bindHelper.self("showData"),
				columnSize = bindHelper.self("midColumnSize"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							noListener = true,
							data = {
								key = slot3.id,
								num = slot3.num,
								dbId = slot3.dbid
							},
							specialKey = {
								leftTopLv = slot3.level
							},
							onNode = function (slot0)
								uv1 = "selectEffect"

								if slot1.selectEffect then
									uv1 = "selectEffect"
									slot1 = slot1.selectEffect
									slot1 = slot1.removeSelf

									slot1(slot1)

									uv1 = "selectEffect"
									slot3 = slot0.size

									slot1.selectEffect:alignCenter(slot3(slot0))

									uv3 = "selectEffect"

									slot0:add(slot3.selectEffect, -1)
								end

								slot0:scale(1.15)

								uv4 = "removeSelf"
								uv5 = "removeSelf"
								uv7 = "alignCenter"
								uv8 = "selectEffect"

								slot0:onTouch(functools.partial(slot4.itemClick, slot5, slot0, slot7, slot8))
							end
						}
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	},
	["right.pageList"] = {
		varname = "pageList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = bindHelper.self("pageBtnSpace"),
				data = bindHelper.self("pageBtns"),
				item = bindHelper.self("pageBtn"),
				onItem = function (slot0, slot1, slot2, slot3)
					if slot3.select then
						uv4 = "select"

						if not slot4.SELECTED then
							uv4 = "select"
							slot4 = slot4.NORMAL
						end
					end

					slot1:get("bg"):texture(slot4)
					slot1:get("title"):setTextColor(slot3.select and ui.COLORS.WHITE or ui.COLORS.RED)
					slot1:get("title"):setString(gLanguageCsv["symbolRome" .. slot2])
					slot1:get("bg"):setTouchEnabled(true)
					bind.touch(slot0, slot1:get("bg"), {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("pageBtnClick")
			}
		}
	},
	["left.card"] = {
		varname = "card",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onShowSelectSpriteView")
			}
		}
	},
	["left.btnExchange"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onShowSelectSpriteView")
			}
		}
	},
	["left.btnDraw"] = {
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onClickDraw")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					state = bindHelper.self("gemFreeNumer"),
					onNode = function (slot0)
						slot0:xy(150, 150)
					end
				}
			}
		}
	},
	["left.btnShowAll"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("btnShowAllFunc")
			}
		}
	},
	["left.btnPoint"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClickIndex")
			}
		}
	},
	["left.btnPoint.pointNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("qualityNum")
		}
	},
	["left.btnDecompose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("btnDecompose")
			}
		}
	},
	["left.btnOneKeyUnEquip"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("unEquipAll")
			}
		}
	},
	["left.btnOneKeyUnEquip.txt"] = {
		binds = {
			{
				event = "effect",
				data = {
					glow = {
						color = ui.COLORS.GLOW.WHITE
					}
				}
			}
		}
	},
	["left.btnOneKeyEquip"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("oneKeyEquip")
			}
		}
	},
	["left.btnOneKeyEquip.txt"] = {
		binds = {
			{
				event = "effect",
				data = {
					glow = {
						color = ui.COLORS.GLOW.WHITE
					}
				}
			}
		}
	},
	["right.btnFilterPanel.btnFilter"] = {
		varname = "btnFilter",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onFilter")
			}
		}
	},
	["right.btnFilterPanel.btnFilter.txt"] = {
		varname = "filterTxt",
		binds = {
			{
				event = "effect",
				data = {
					glow = {
						color = ui.COLORS.GLOW.WHITE
					}
				}
			}
		}
	},
	["right.acquire.btnAdd"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("btnDecompose")
			}
		}
	}
}
slot7.RESOURCE_STYLES = {
	full = true
}

function slot7.onCreate(slot0, slot1)
	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "GEM",
		title = gLanguageCsv.gemTitle
	})

	slot0.selectEffect = ccui.ImageView:create("common/box/box_selected.png"):alignCenter(slot0.item:size()):retain()
	slot0.baglevelIdlers = {}

	slot0:initModel()

	slot2, slot3 = adapt.centerWithScreen("left", "right", {
		itemWidthExtra = 80,
		itemWidth = slot0.item:size().width
	}, {
		{
			{
				slot0.bagSubList,
				slot0.bagList
			},
			"width"
		},
		{
			{
				slot0.subList,
				slot0.list,
				slot0.pageList
			},
			"width"
		},
		{
			{
				slot0.subList,
				slot0.list,
				slot0.pageList
			},
			"pos",
			"left"
		}
	})
	slot0.deltaWidth = slot2 or 0
	slot0.midColumnSize = 4 + (slot3 or 0)
	slot0.asyncPreload = slot0.midColumnSize * 5
	slot0.pageBtnSpace = math.floor((slot0.pageList:width() - 6 * slot0.pageBtn:width()) / 5)

	slot0.btnFilterPanel:x(slot0.list:x() + slot0.list:width() - slot0.btnFilterPanel:width() / 2)
	slot0.right:get("acquire"):x(slot0.list:x())
	slot0.left:runAction(cc.MoveTo:create(0.4, cc.p(30 + display.sizeInViewRect.x, 0)))
	slot0.right:runAction(cc.MoveTo:create(0.4, cc.p(display.uiOrigin.x + 1500, 0)))

	for slot8, slot9 in ipairs({
		"btnDraw",
		"btnShowAll",
		"btnPoint",
		"btnDecompose"
	}) do
		text.addEffect(slot0.left:get(slot9):get("txt"), {
			outline = {
				size = 4,
				color = ui.COLORS.NORMAL.WHITE
			}
		})
	end

	slot0.pageBtns = idlers.newWithMap({
		{},
		{},
		{},
		{},
		{},
		{}
	})
	slot0.selectedPage = idler.new()

	slot0.selectedPage:addListener(function (slot0, slot1)
		if slot1 then
			uv2 = "pageBtns"
			slot2.pageBtns:atproxy(slot1).select = false
		end

		if slot0 then
			uv2 = "pageBtns"
			slot2.pageBtns:atproxy(slot0).select = true
		end
	end)

	slot0.gemFreeNumer = idler.new(true)

	idlereasy.any({
		slot0.goldFreeCount,
		slot0.rmbFreeCount
	}, function (slot0, slot1, slot2)
		if slot1 ~= 0 and slot2 ~= 0 then
			uv3 = "gemFreeNumer"

			slot3.gemFreeNumer:set(false)
		end
	end)

	slot0.selectItem = idlertable.new({})

	slot0.selectItem:addListener(function (slot0, slot1)
		if next(slot0) then
			uv2 = "next"
			slot2 = slot2.showData
			slot3 = slot2
			uv3 = "next"
			slot2.atproxy(slot3, slot0.k).selectEffect = slot3.selectEffect
		end
	end)
	idlereasy.when(slot0.items, function (slot0, slot1)
		uv2 = "set"

		slot2:set(slot1[529] or 0)
	end)
	idlereasy.when(idler.new(0), function (slot0, slot1)
		uv2 = "right"
		slot2 = slot2.right:get("acquire"):multiget("icon", "btnAdd", "bg", "num")

		slot2.num:text(slot1)

		if slot2.num:width() / 0.8 + 130 > 296 then
			slot2.bg:width(slot3)
			adapt.oneLinePos(slot2.icon, {
				slot2.num,
				slot2.btnAdd
			})
		end
	end)

	slot0.filterType = 0
	slot0.qualityNum = idler.new(0)
	slot0.showData = idlers.new({})

	idlereasy.when(slot0.gems, function (slot0, slot1)
		uv2 = "updateShowData"

		slot2:updateShowData()
	end)
	slot0:createGemSlots()
	idlereasy.when(gGameModel.role:getIdler("cards"), function (slot0, slot1)
		slot2 = {
			[slot10] = true
		}
		slot4 = nil
		slot5 = 0

		for slot9, slot10 in ipairs(slot1) do
			if 0 < csv.unit[csv.cards[gGameModel.cards:find(slot10):read("card_id", "fighting_point", "level", "star", "advance").card_id].unitID].rarity then
				slot4 = slot10
				slot3 = slot14.rarity
				slot5 = slot12.fighting_point
			elseif slot14.rarity == slot3 and slot5 < slot12.fighting_point then
				slot4 = slot10
				slot5 = slot12.fighting_point
			end
		end

		uv6 = "ipairs"

		if slot6 then
			uv6 = "ipairs"

			if slot2[slot6] then
				uv6 = "gGameModel"
				uv8 = "ipairs"

				slot6:setCardID(slot8)
			end
		else
			uv6 = "gGameModel"

			slot6:setCardID(slot4)
		end
	end)
end

function slot7.onTouchSlot(slot0, slot1, slot2)
	slot3 = slot0.gemSlots[slot1]
	slot6 = "gems"
	slot5 = slot0.curCard:read(slot6)[slot1]
	uv6 = "gemSlots"

	if not slot6.isSlotLocked(slot0.carddbid, slot1) then
		slot0.curSlot:set(slot1)
	elseif gGemPosCsv[csv.cards[gGameModel.cards:find(slot0.carddbid):read("card_id")].gemPosSeqID][slot1].openCondition[1] == 1 then
		gGameUI:showTip(gLanguageCsv.nLvUnlock, slot7[2])
	elseif slot7[1] == 2 then
		slot8, slot9 = dataEasy.getQuality(slot7[2])

		gGameUI:showTip(gLanguageCsv.openAdvance, gLanguageCsv[ui.QUALITY_COLOR_TEXT[slot8]] .. slot9)
	end

	if not slot5 then
		return
	end

	slot6 = gGameModel.gems:find(slot5)

	if slot2.name == "began" then
		slot0.touchBeganPos = slot3:getTouchBeganPosition()
	elseif slot2.name == "moved" then
		slot7 = slot2

		if not slot0.hasMovingItem and (ui.TOUCH_MOVED_THRESHOLD <= math.abs(slot7.x - slot0.touchBeganPos.x) or ui.TOUCH_MOVED_THRESHOLD <= math.abs(slot7.y - slot0.touchBeganPos.y)) then
			slot3:get("gemPanel"):visible(false)

			slot0.hasMovingItem = true

			slot0:createMovePanel({
				id = slot6:read("gem_id"),
				level = slot6:read("level")
			})
		end

		if slot0.hasMovingItem then
			slot7 = slot0:convertToNodeSpace(slot7)

			slot0.movePanel:xy(slot7.x, slot7.y)
		end
	elseif slot2.name == "ended" or slot2.name == "cancelled" then
		if not slot0.hasMovingItem then
			slot0:showDetails()
		else
			slot0.hasMovingItem = false
			slot7 = slot0.movePanel:box()
			slot8 = slot0.left:convertToNodeSpace(slot0:convertToWorldSpace(cc.p(slot7.x, slot7.y)))
			slot7.y = slot8.y
			slot7.x = slot8.x
			slot9 = slot3:box()

			if slot0:checkRectInSlots(slot7) == slot1 then
				slot3:get("gemPanel"):visible(true)
			elseif not slot10 then
				uv11 = "gemSlots"

				slot11.unEquipGem(slot0.carddbid, slot1)
			else
				uv11 = "gemSlots"

				slot11.moveGem(slot0.carddbid, slot10, slot5, function ()
					uv0 = "get"

					slot0:get("gemPanel"):visible(true)
				end)
			end

			slot0.movePanel:removeSelf()

			slot0.movePanel = nil
		end
	end
end

function slot7.checkRectInSlots(slot0, slot1)
	slot3 = nil

	for slot7, slot8 in pairs(slot0.gemSlots) do
		if cc.rectIntersectsRect(slot8:box(), slot1) and cc.pGetDistance(cc.p(slot9.x + slot9.width / 2, slot9.y + slot9.height / 2), cc.p(slot1.x + slot1.width / 2, slot1.y + slot1.height / 2)) < math.huge then
			slot2 = slot12
			slot3 = slot7
		end
	end

	return slot3
end

function slot7.createGemSlots(slot0)
	slot0.suitEffectQualitys = {}
	slot0.gemSlots = {}
	slot0.curSlot = idler.new(1)
	slot1 = cc.p(772, 704)
	slot2 = cc.p(772, 1100)
	slot8 = 5

	widget.addAnimationByKey(slot0.left, "fushichouqu/baoshixiangqian.skel", "bg", "effect_shiban_loop", slot8):xy(slot1)

	slot3 = slot2.x - slot1.x
	slot4 = slot2.y - slot1.y

	for slot8 = 1, 9 do
		slot0.suitEffectQualitys[slot8] = 0
		slot9 = (slot8 - 0.5) / 9 * 360 + 180
		slot10 = -math.rad(slot9)
		slot0.gemSlots[slot8] = slot0.left:get("gemSlot"):clone():addTo(slot0.left, 30):xy(slot1.x + slot3 * math.cos(slot10) + slot4 * math.sin(slot10), slot1.y + slot3 * math.sin(slot10) - slot4 * math.cos(slot10))

		widget.addAnimationByKey(slot0.gemSlots[slot8], "fushichouqu/baoshixiangqian.skel", "empty", "effect_kong_loop", 1):alignCenter(slot0.gemSlots[slot8]:size()):setRotation(slot9 + 180)
		slot0.gemSlots[slot8]:get("bg"):visible(false)
		slot0.gemSlots[slot8]:onTouch(function (slot0)
			uv1 = "onTouchSlot"
			uv3 = "onTouchSlot"

			slot1:onTouchSlot(slot3, slot0)
		end)
	end

	slot0.slotEffect = ccui.ImageView:create("common/box/box_portrait_select.png"):alignCenter(slot0.item:size()):retain()

	idlereasy.when(slot0.curSlot, function (slot0, slot1)
		uv2 = "gemSlots"
		slot2 = slot2.gemSlots[slot1]
		uv3 = "gemSlots"
		slot3 = slot3.slotEffect
		slot3 = slot3.removeSelf

		slot3(slot3)

		uv3 = "gemSlots"
		slot5 = slot2.size

		slot3.slotEffect:alignCenter(slot5(slot2))

		uv5 = "gemSlots"

		slot2:add(slot5.slotEffect, 5)
	end)
end

function slot7.updateShowData(slot0)
	slot0.selectItem:set({})
	dataEasy.tryCallFunc(slot0.list, "updatePreloadCenterIndexAdaptFirst")

	slot1 = {}
	slot2 = {}

	for slot7, slot8 in pairs(gGameModel.role:read("gems")) do
		slot9 = gGameModel.gems:find(slot8)
		slot10 = slot9:read("gem_id")
		slot12 = dataEasy.getCfgByKey(slot10)
		slot13 = {
			num = 1,
			id = slot10,
			suitNo = slot12.suitNo,
			suitID = slot12.suitID,
			level = slot9:read("level"),
			quality = slot12.quality,
			dbid = slot8
		}
		slot15 = slot0.selectedPage:read()

		if not slot9:read("card_db_id") and (not slot15 or slot15 == slot13.suitNo or not slot13.suitNo) and (slot0.filterType == 0 or slot0.filterType == slot13.suitID or not slot13.suitID) then
			if slot11 == 1 then
				if not slot2[slot10] then
					slot16 = {
						slot8
					}
					slot13.dbids = slot16
					slot2[slot10] = slot13
					uv16 = "selectItem"

					slot16(slot1, slot13)
				else
					uv16 = "selectItem"

					slot16(slot2[slot10].dbids, slot8)

					slot2[slot10].num = slot2[slot10].num + 1
				end
			else
				uv16 = "selectItem"

				slot16(slot1, slot13)
			end
		end
	end

	uv4 = "set"

	slot4(slot1, function (slot0, slot1)
		if slot0.quality ~= slot1.quality then
			return slot1.quality < slot0.quality
		end

		if slot0.suitID ~= slot1.suitID then
			if slot0.suitID and slot1.suitID then
				return slot0.suitID < slot1.suitID
			else
				return not slot1.suitID
			end
		end

		if slot0.suitNo ~= slot1.suitNo then
			if slot0.suitNo and slot1.suitNo then
				return slot0.suitNo < slot1.suitNo
			else
				return not slot1.suitNo
			end
		end

		return slot1.level < slot0.level
	end)

	function slot4(slot0, slot1, slot2)
		uv3 = "baglevelIdlers"

		function slot6(slot0, slot1)
			uv2 = "updateShowData"

			if slot2 then
				uv2 = "showData"

				slot2:updateShowData()
			else
				uv2 = "showData"
				uv4 = "atproxy"

				if slot2.showData:atproxy(slot4) then
					slot2.level = slot1
				end
			end
		end

		uv6 = "baglevelIdlers"
		slot3.baglevelIdlers[slot1] = idlereasy.when(gGameModel.gems:find(slot1):getIdler("level"), slot6, true):anonyOnly(slot6, stringz.bintohex(slot1))
	end

	for slot8, slot9 in ipairs(slot1) do
		if slot9.dbids then
			for slot13, slot14 in ipairs(slot9.dbids) do
				slot4(slot8, slot14, true)
			end
		else
			slot4(slot8, slot9.dbid)
		end
	end

	slot0.showData:update(slot1)
	slot0.noGemTip:visible(#slot1 == 0)
end

function slot7.pageBtnClick(slot0, slot1, slot2)
	if slot0.selectedPage:read() == slot2 then
		slot2 = nil
	end

	slot0.selectedPage:set(slot2)
	slot0:updateShowData()
end

function slot7.getPercent(slot0)
	slot1 = slot0.list:getInnerContainer()
	slot4, slot5 = slot1:xy()

	return 100 - math.abs(slot5) / (slot1:size().height - slot0.list:size().height) * 100
end

function slot7.onItemClick(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot6.name == "began" then
		slot0.touchBeganPos = slot3:getTouchBeganPosition()

		slot0.list:setTouchEnabled(false)

		slot0.isClicked = true
		slot0.hasMovingItem = nil
	elseif slot6.name == "moved" then
		slot7 = slot6
		slot8 = math.abs(slot7.x - slot0.touchBeganPos.x)
		slot9 = math.abs(slot7.y - slot0.touchBeganPos.y)

		if slot0.hasMovingItem == nil and (ui.TOUCH_MOVED_THRESHOLD <= slot8 or ui.TOUCH_MOVED_THRESHOLD <= slot9) then
			slot0.hasMovingItem = false

			if slot8 > slot9 * 0.7 then
				slot0.hasMovingItem = true

				slot0:createMovePanel(slot5)
			end

			slot0.list:setTouchEnabled(not slot0.hasMovingItem)

			slot0.isClicked = false
		end

		if slot0.hasMovingItem then
			slot7 = slot0:convertToNodeSpace(slot7)

			slot0.movePanel:xy(slot7.x, slot7.y)
		end
	elseif slot6.name == "ended" or slot6.name == "cancelled" then
		if not slot0.hasMovingItem then
			if slot0.isClicked then
				slot7 = slot1:getIdx(slot4)
				slot7.data = slot5

				slot0.selectItem:set(slot7)
				slot0:showDetails(slot5.dbid)
			end
		else
			slot0.hasMovingItem = false
			slot7 = slot0.movePanel:box()
			slot8 = slot0.left:convertToNodeSpace(slot0:convertToWorldSpace(cc.p(slot7.x, slot7.y)))
			slot7.y = slot8.y
			slot7.x = slot8.x

			if slot0:checkRectInSlots(slot7) then
				if slot0.curCard:read("gems")[slot9] then
					slot0:swapGem(slot9, slot0.movePanel.dbid)
				else
					slot0:equipGem(slot9, slot0.movePanel.dbid)
				end

				slot0.curSlot:set(slot9)
			end

			slot0.movePanel:removeSelf()

			slot0.movePanel = nil
		end
	end
end

function slot7.swapGem(slot0, slot1, slot2)
	uv3 = "swapGem"

	slot3.swapGem(slot0.carddbid, slot1, slot2)
end

function slot7.equipGem(slot0, slot1, slot2)
	uv3 = "equipGem"

	slot3.equipGem(slot0.carddbid, slot1, slot2, function ()
		uv0 = "gemSlots"
		uv1 = "get"

		if slot0.gemSlots[slot1]:get("effectEquip") then
			slot0:get("effectEquip"):removeSelf()
		end

		uv1 = "get"

		performWithDelay(widget.addAnimationByKey(slot0, "fushichouqu/baoshixiangqian.skel", "effectEquip", "effect_jihuo", 5):alignCenter(slot0:size()):setRotation((slot1 - 0.5) / 9 * 360), function ()
			uv0 = "removeSelf"

			slot0:removeSelf()
		end, 0.5)
	end)
end

function slot7.createMovePanel(slot0, slot1)
	if slot0.movePanel then
		slot0.movePanel:removeSelf()

		slot0.movePanel = nil
	end

	slot0.movePanel = slot0.item:clone():addTo(slot0, 100)
	slot0.movePanel.dbid = slot1.dbid
	slot0.moveData = slot1

	bind.extend(slot0, slot0.movePanel, {
		class = "icon_key",
		props = {
			simpleShow = true,
			data = {
				key = slot1.id
			},
			specialKey = {
				leftTopLv = slot1.level
			},
			onNode = function (slot0)
				slot0:scale(1.15)
			end
		}
	})
end

function slot7.onShowSelectSpriteView(slot0)
	gGameUI:stackUI("city.card.gem.select_sprite", nil, , slot0.carddbid, slot0:createHandler("setCardID"))
end

function slot7.setCardID(slot0, slot1)
	if not slot1 then
		return
	end

	slot2 = gGameModel.cards:find(slot1)
	slot3 = slot2:read("card_id", "skin_id", "fighting_point", "level", "star", "advance")

	bind.extend(slot0, slot0.card, {
		class = "card_icon",
		props = {
			unitId = dataEasy.getUnitId(slot3.card_id, slot3.skin_id),
			advance = slot3.advance,
			rarity = csv.unit[csv.cards[slot3.card_id].unitID].rarity,
			star = slot3.star,
			levelProps = {
				data = slot3.level
			},
			onNode = function (slot0)
			end
		}
	})

	slot0.carddbid = slot1
	slot0.curCard = slot2

	idlereasy.when(slot2:getIdler("gems"), function (slot0, slot1)
		uv2 = "updateShowData"
		slot2 = slot2.updateShowData

		slot2(slot2)

		uv2 = "updateShowData"

		slot2:resetGemSlots(slot1)
	end):anonyOnly(slot0, "cardgems")
end

function slot7.checkSuits(slot0, slot1)
	slot2 = {}

	for slot6 = 1, 9 do
		if slot1[slot6] and csv.gem.gem[gGameModel.gems:find(slot7):read("gem_id")].suitID then
			if not slot2[slot9.suitID] then
				slot2[slot9.suitID] = {}
			end

			uv10 = "gGameModel"

			slot10(slot2[slot9.suitID], {
				slot = slot6,
				quality = slot9.quality
			})
		end
	end

	slot3 = {}

	for slot7, slot8 in pairs(slot2) do
		uv9 = "gems"

		slot9(slot8, function (slot0, slot1)
			if slot0.quality ~= slot1.quality then
				return slot1.quality < slot0.quality
			end

			return slot0.slot < slot1.slot
		end)

		slot9, slot10 = next(gGemSuitCsv[slot7])

		for slot14 = 9, 1, -1 do
			if slot10[slot14] and slot14 <= #slot8 then
				for slot18 = 1, slot14 do
					slot3[slot8[slot18].slot] = slot8[slot14].quality
				end
			end
		end
	end

	return slot3
end

function slot7.resetGemSlots(slot0, slot1)
	slot2 = slot0:checkSuits(slot1)

	for slot6, slot7 in pairs(slot0.gemSlots) do
		if (not slot2[slot6] or slot0.suitEffectQualitys[slot6] ~= slot2[slot6]) and slot7:get("effect") then
			slot7:get("effect"):removeSelf()
		end

		if slot0.suitEffectQualitys[slot6] ~= slot2[slot6] and slot2[slot6] then
			uv13 = "checkSuits"
			slot9 = widget.addAnimationByKey(slot7, "fushichouqu/baoshixiangqian.skel", "effect", slot13[slot2[slot6]], 1):alignCenter(slot7:size())

			performWithDelay(slot9, function ()
				uv0 = "removeSelf"
				slot1 = slot0

				slot0.removeSelf(slot1)

				uv1 = "widget"
				slot2 = "fushichouqu/baoshixiangqian.skel"
				uv4 = "addAnimationByKey"
				uv5 = "fushichouqu/baoshixiangqian.skel"
				uv6 = "effect"
				uv2 = "widget"
				slot2 = slot2.size
				uv2 = "alignCenter"

				widget.addAnimationByKey(slot1, slot2, "effect", slot4[slot5[slot6]], 1):alignCenter(slot2(slot2)):setRotation(slot2)
			end, 0.5)
			slot9:setRotation((slot6 - 0.5) / 9 * 360)
		end

		slot0.suitEffectQualitys[slot6] = slot2[slot6]
		slot8 = slot7:get("gemPanel")
		slot9 = slot8:get("icon")
		slot11 = slot7:get("unlockLv")
		slot12 = slot7:get("unlockLvBg")
		slot13 = slot0.curCard
		slot14 = slot13
		slot13 = slot13.read(slot14, "advance")
		uv14 = "gemSlots"
		slot14, slot15 = slot14.isSlotLocked(slot0.carddbid, slot6)
		slot16 = slot1[slot6] and true or false

		slot8:visible(slot16)
		slot8:get("levelBg"):visible(false)
		text.addEffect(slot8:get("lv"), {
			outline = {
				color = ui.COLORS.NORMAL.DEFAULT
			}
		})

		if slot16 then
			slot9:texture(dataEasy.getCfgByKey(gGameModel.gems:find(slot1[slot6]):read("gem_id")).icon)
			slot9:visible(true)

			if slot0.baglevelIdlers[slot1[slot6]] then
				slot0.baglevelIdlers[slot1[slot6]]:destroy()

				slot0.baglevelIdlers[slot1[slot6]] = nil
			end

			idlereasy.when(slot18:getIdler("level"), function (slot0, slot1)
				uv2 = "setString"
				slot2 = slot2.setString

				slot2(slot2, gLanguageCsv.textLv .. slot1)

				uv2 = "gLanguageCsv"

				slot2:updateIndexPoints()
			end):anonyOnly(slot0, "gemSlot" .. slot6)
		else
			slot9:texture("city/card/gem/btn_jh2.png")
		end

		slot11:visible(slot14)

		if slot14 then
			slot11:text(slot15)
		end

		slot12:visible(slot14)
		slot7:get("lock"):visible(slot14)
		slot7:get("imgAdd"):visible(not slot16 and not slot14)
	end

	slot0:updateIndexPoints()
end

function slot7.updateIndexPoints(slot0)
	slot0.qualityNum:set(dataEasy.getGemQualityIndex(gGameModel.cards:find(slot0.carddbid)))
end

function slot7.unEquipAll(slot0)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.curCard:read("gems")) do
		if slot7 then
			uv8 = "curCard"

			slot8(slot2, slot7)
		end
	end

	if #slot2 == 0 then
		gGameUI:showTip(gLanguageCsv.noEquippedGem)

		return
	end

	gGameApp:requestServer("/game/gem/unload", function ()
		gGameUI:showTip(gLanguageCsv.dischargeSuccess)
	end, slot2)
end

function slot7.onFilter(slot0)
	slot0.filterArrow:setRotation(180)
	gGameUI:stackUI("city.card.gem.filter", nil, , slot0.btnFilterPanel:convertToWorldSpace(cc.p(slot0.btnFilterPanel:size().width, -100)), {
		"right",
		"top"
	}, slot0:createHandler("setFilterType"), slot0.filterType)
end

function slot7.setFilterType(slot0, slot1)
	slot0.filterArrow:setRotation(0)

	if slot1 then
		slot0.filterType = slot1

		slot0.filterTxt:text(gLanguageCsv["gemSuit" .. slot1] or gLanguageCsv.typeFilter)
		slot0:updateShowData()
	end
end

function slot7.onClickIndex(slot0)
	gGameUI:stackUI("city.card.gem.quality_index", nil, , slot0.carddbid, slot0.qualityNum:read())
end

function slot7.btnShowAllFunc(slot0)
	gGameUI:stackUI("city.card.gem.add_effect", nil, {
		blackLayer = true,
		clickClose = true
	}, slot0.carddbid, slot0.qualityNum:read())
end

function slot7.btnDecompose(slot0)
	gGameUI:stackUI("city.card.gem.decompose", nil, )
end

function slot7.onClickDraw(slot0)
	gGameUI:stackUI("city.card.gem.draw", nil, {
		full = true
	})
end

function slot7.showDetails(slot0, slot1)
	slot2 = slot0.curSlot:read()
	slot3 = slot0.centerBg:convertToWorldSpaceAR(cc.p(0, 0))
	slot3.x = slot3.x + 200
	slot4 = "right"

	if not slot1 and slot2 <= 4 and slot2 >= 2 then
		slot4 = "left"
	end

	slot0.details = gGameUI:stackUI("city.card.gem.details", nil, {
		clickClose = true,
		dispatchNodes = {
			slot0.list,
			slot0.left
		}
	}, {
		cardID = slot0.carddbid,
		slotIdx = slot2,
		dbid = slot1,
		pos = slot3,
		align = slot4
	})
end

function slot7.closeDetails(slot0)
	slot0.details:onClose()
end

function slot7.oneKeyEquip(slot0)
	slot2 = {}

	for slot6, slot7 in pairs(gGameModel.role:read("gems")) do
		slot8 = gGameModel.gems:find(slot7)
		slot9 = dataEasy.getCfgByKey(slot8:read("gem_id"))

		if slot8:read("card_db_id") == nil or slot8:read("card_db_id") == slot0.carddbid then
			uv10 = "gGameModel"

			slot10(slot2, {
				dbid = slot7,
				quality = slot9.quality,
				level = slot8:read("level"),
				suitID = slot9.suitID,
				suitNo = slot9.suitNo,
				gem_id = slot8:read("gem_id")
			})
		end
	end

	table.sort(slot2, function (slot0, slot1)
		if slot0.quality ~= slot1.quality then
			return slot1.quality < slot0.quality
		end

		return slot1.level < slot0.level
	end)

	if #slot2 == 0 then
		gGameUI:showTip(gLanguageCsv.noGemTip)

		return
	end

	slot3 = {}
	slot4 = {}

	for slot9, slot10 in pairs(slot2) do
		if (not slot3[slot10.suitID] or not slot3[slot10.suitID][slot10.suitNo]) and not ({})[slot10.gem_id] then
			if slot10.suitID and slot10.suitNo then
				slot3[slot10.suitID] = slot3[slot10.suitID] or {}
				slot3[slot10.suitID][slot10.suitNo] = true
			else
				slot5[slot10.gem_id] = true
			end

			uv11 = "gGameModel"

			slot11(slot4, slot10.dbid)

			if #slot4 == 9 then
				break
			end
		end
	end

	for slot11 = 1, 9 do
		uv12 = "role"
		slot12, slot13 = slot12.isSlotLocked(slot0.carddbid, slot11)

		if not slot12 then
			-- Nothing
		end
	end

	gGameApp:requestServer("/game/gem/onekey/equip", function (slot0)
		gGameUI:showTip(gLanguageCsv.inlaySuccess)
	end, slot0.carddbid, {
		[slot11] = slot4[0 + 1]
	})
end

function slot7.initModel(slot0)
	slot0.items = gGameModel.role:getIdler("items")
	slot0.gems = gGameModel.role:getIdler("gems")
	slot0.goldFreeCount = gGameModel.daily_record:getIdler("gem_gold_dc1_free_count")
	slot0.rmbFreeCount = gGameModel.daily_record:getIdler("gem_rmb_dc1_free_count")
end

function slot7.onCleanup(slot0)
	uv1 = "onCleanup"

	slot1.onCleanup(slot0)
	slot0.selectItem:destroy()
end

return slot7
