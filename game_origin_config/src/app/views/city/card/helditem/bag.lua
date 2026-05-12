slot0 = require("app.views.city.card.helditem.tools")
slot1 = {
	dress = 1,
	down = 2
}
slot2 = 450
slot3 = class("HeldItemBagView", Dialog)
slot3.RESOURCE_FILENAME = "held_item_bag.json"
slot3.RESOURCE_BINDING = {
	roleItem = "roleItem",
	["right.center.list"] = "rightCenterList",
	innweList = "innweList",
	["left.title.textNote1"] = "textNote1",
	attrInnerList = "attrInnerList",
	["right.center"] = "rightCenter",
	["left.title.textNote2"] = "textNote2",
	item1 = "item1",
	["right.roleInfo.roleItem"] = "roleInfoItem",
	item = "item",
	left = "left",
	["right.item"] = "rightItem",
	["left.title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["left.btnLeft"] = {
		varname = "btnLeft",
		binds = {
			event = "extend",
			class = "sort_menus",
			props = {
				btnHeight = 80,
				btnType = 2,
				btnWidth = 260,
				width = 240,
				data = bindHelper.self("leftSortData"),
				btnClick = bindHelper.self("onSortLeftMenusBtnClick", true),
				btnTouch = bindHelper.self("onCloseLeftOtherView", true),
				showSortList = bindHelper.self("isLeftDownListShow"),
				showSelected = bindHelper.self("showLeftSelected"),
				onNode = function (slot0)
					slot0:xy(-1150, -528)
				end
			}
		}
	},
	["left.btnRight"] = {
		varname = "btnRight",
		binds = {
			event = "extend",
			class = "sort_menus",
			props = {
				btnHeight = 80,
				btnType = 2,
				btnWidth = 260,
				width = 240,
				data = bindHelper.self("rightSortData"),
				btnClick = bindHelper.self("onSortRightMenusBtnClick", true),
				btnTouch = bindHelper.self("onCloseRightOtherView", true),
				showSortList = bindHelper.self("isRightDownListShow"),
				showSelected = bindHelper.self("showRightSelected"),
				onNode = function (slot0)
					slot0:xy(-1150, -528)
				end
			}
		}
	},
	["left.noItem"] = {
		varname = "noItem",
		binds = {
			event = "visible",
			idler = bindHelper.self("hasItem")
		}
	},
	["left.handbook"] = {
		varname = "handbook",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("bagHandbook")
			}
		}
	},
	right = {
		varname = "rightPanel",
		binds = {
			event = "visible",
			idler = bindHelper.self("isVisibleRight")
		}
	},
	["left.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				leftPadding = 10,
				asyncPreload = 25,
				topPadding = 10,
				columnSize = 5,
				data = bindHelper.self("heldItems"),
				item = bindHelper.self("innweList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true,
					alwaysShow = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot3.inMeteor and 1 or 0

					slot1:get("imgSel"):visible(slot3.isSel)
					slot1:get("tips"):text(gLanguageCsv.inMeteor):visible(slot4 == 1)
					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							noListener = true,
							data = {
								key = slot3.csvId,
								num = slot3.num,
								dbId = slot3.dbId[1]
							},
							grayState = slot4,
							specialKey = {
								lv = slot3.lv
							},
							onNode = function (slot0)
								uv1 = "getIdx"
								uv3 = "bind"
								uv3 = "getIdx"
								uv7 = "getIdx"
								uv9 = "click"

								bind.click(slot3, slot0, {
									method = functools.partial(slot7.clickCell, slot1:getIdx(slot3), slot9)
								})
							end
						}
					})

					if gGameModel.held_items:find(slot3.dbId[1]) and slot6:read("exist_flag", "card_db_id") and slot7.card_db_id then
						bind.extend(slot0, slot1:get("redHint"), {
							class = "red_hint",
							props = {
								listenData = {
									curDbId = idler.new(slot5)
								},
								specialTag = {
									"heldItemLevelUp",
									"heldItemAdvanceUp"
								}
							}
						})
					end
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	},
	["right.textName"] = {
		varname = "heldItemName",
		binds = {
			event = "text",
			idler = bindHelper.self("itemName")
		}
	},
	["right.textLv"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("itemLv")
		}
	},
	["right.roleInfo"] = {
		binds = {
			event = "visible",
			idler = bindHelper.self("hasRoleDress")
		}
	},
	["right.list"] = {
		varname = "rightlist",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				data = bindHelper.self("attrs"),
				item = bindHelper.self("attrInnerList"),
				cell = bindHelper.self("item1"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = game.ATTRDEF_TABLE[slot3.attr]

					slot1:get("imgIcon"):texture(ui.ATTR_LOGO[slot4])
					slot1:get("textAttrName"):text(gLanguageCsv["attr" .. string.caption(slot4)])
					slot1:get("textAttrNum"):text("+" .. slot3.val)
					adapt.oneLinePos(slot1:get("textAttrName"), slot1:get("textAttrNum"), cc.p(10, 0), "left")
				end
			}
		}
	},
	["right.center.btnInfo"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onInfoClick")
			}
		}
	},
	["right.down.list"] = {
		varname = "downlist",
		binds = {
			{
				event = "visible",
				idler = bindHelper.self("hasShowCards")
			},
			{
				event = "extend",
				class = "listview",
				props = {
					data = bindHelper.self("tabCards"),
					item = bindHelper.self("roleItem"),
					itemAction = {
						isAction = true,
						alwaysShow = true
					},
					onItem = function (slot0, slot1, slot2, slot3)
						bind.extend(slot0, slot1, {
							class = "card_icon",
							props = {
								rarity = slot3.rarity,
								cardId = slot3.card.id,
								onNode = function (slot0)
									slot0:scale(0.9)
								end
							}
						})
					end
				}
			}
		}
	},
	["right.down"] = {
		binds = {
			event = "visible",
			idler = bindHelper.self("hasShowCards")
		}
	},
	["right.btnStrengthen"] = {
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onStrengthenClick")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					state = bindHelper.self("curItemOnCard"),
					listenData = {
						curDbId = bindHelper.self("curSelDbId")
					},
					specialTag = {
						"heldItemLevelUp",
						"heldItemAdvanceUp"
					}
				}
			}
		}
	},
	["right.btnDress"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onDressClick")
			}
		}
	},
	["right.btnDress.textNote"] = {
		binds = {
			{
				event = "text",
				idler = bindHelper.self("btnText")
			},
			{
				event = "effect",
				data = {
					glow = {
						color = ui.COLORS.GLOW.WHITE
					}
				}
			}
		}
	}
}

function slot3.onCreate(slot0, slot1, slot2)
	slot0:initModel()
	Dialog.onCreate(slot0)
	dataEasy.getListenUnlock(gUnlockCsv.propHandbook, function (slot0)
		uv1 = "handbook"

		slot1.handbook:visible(slot0)
	end)

	slot0.cardDbId = slot1 or slot0.cards:read()[1]
	slot0.handlers = slot2

	adapt.oneLinePos(slot0.textNote1, slot0.textNote2)

	slot0.isVisibleRight = idler.new(false)
	slot0.curSelDbId = idler.new()
	slot0.curItemOnCard = idler.new(true)
	slot0.heldItems = idlers.newWithMap({})
	slot0.hasItem = idler.new(false)
	slot0.leftSortData = idlertable.new({
		gLanguageCsv.spaceAll,
		gLanguageCsv.aleardyDress,
		gLanguageCsv.notDress
	})
	slot0.isLeftDownListShow = idler.new(false)
	slot0.showLeftSelected = idler.new(1)
	slot0.rightSortData = idlertable.new({
		gLanguageCsv.spaceQuality,
		gLanguageCsv.strengthenLv,
		gLanguageCsv.breachLv
	})
	slot0.isRightDownListShow = idler.new(false)
	slot0.showRightSelected = idler.new(1)
	slot0.itemName = idler.new("")
	slot0.itemLv = idler.new("")
	slot0.curBtnState = idler.new(1)
	slot0.attrs = idlers.newWithMap({})
	slot0.tabCards = idlers.newWithMap({})
	slot0.hasShowCards = idler.new(false)
	slot0.btnText = idler.new(gLanguageCsv.spaceEquip)
	slot0.hasRoleDress = idler.new(false)

	idlereasy.when(slot0.curSelDbId, function (slot0, slot1)
		if not slot1 then
			uv2 = "curItemOnCard"

			slot2.curItemOnCard:set(false)
		end

		if type(slot1) == "table" then
			slot1 = slot1[1]
		end

		if gGameModel.held_items:find(slot1) and slot2:read("exist_flag", "card_db_id") and slot3.card_db_id then
			uv4 = "curItemOnCard"

			slot4.curItemOnCard:set(true)
		else
			uv4 = "curItemOnCard"

			slot4.curItemOnCard:set(false)
		end
	end)
	idlereasy.when(slot0.isVisibleRight, function (slot0, slot1, slot2)
		slot3 = display.sizeInView.width / 2
		uv4 = "display"
		uv6 = "display"

		slot6.left:x(slot1 and slot3 - slot4.left:size().width / 2 - 17 or slot3)
	end)
	idlereasy.any({
		slot0.showLeftSelected,
		slot0.showRightSelected,
		slot0.refreshFlag
	}, function (slot0, slot1, slot2, slot3)
		uv4 = "refreshData"

		slot4:refreshData()

		slot4 = {}
		uv7 = "refreshData"

		for slot9, slot10 in ipairs(slot7.tableDatas) do
			if slot1 == 2 and slot10.cardDbID then
				slot5 = 0 + 1

				table.insert(slot4, clone(slot10))
			elseif slot1 == 3 and not slot10.cardDbID then
				slot5 = slot5 + 1

				table.insert(slot4, clone(slot10))
			elseif slot1 == 1 then
				slot5 = slot5 + 1

				table.insert(slot4, clone(slot10))
			end
		end

		function slot8(slot0, slot1)
			uv2 = "dataEasy"

			if slot2 == 1 then
				return dataEasy.sortHelditemCmp(slot0, slot1)
			else
				uv2 = "dataEasy"

				if slot2 == 2 then
					if slot0.lv ~= slot1.lv then
						return slot1.lv < slot0.lv
					end

					return dataEasy.sortHelditemCmp(slot0, slot1)
				else
					uv2 = "dataEasy"

					if slot2 == 3 then
						if slot0.advance ~= slot1.advance then
							return slot1.advance < slot0.advance
						end

						return dataEasy.sortHelditemCmp(slot0, slot1)
					end
				end
			end
		end

		table.sort(slot4, slot8)

		slot6 = gGameModel.cards
		slot7 = slot6
		uv8 = "refreshData"
		uv7 = "refreshData"
		slot8 = nil

		if slot7.curDbId or slot6.find(slot7, slot8.cardDbId):read("held_item") then
			for slot12, slot13 in ipairs(slot4) do
				if slot13.dbId[1] == slot7 then
					slot8 = slot12

					break
				end
			end
		end

		if slot5 < (slot8 or 1) then
			slot9 = 1
		end

		uv10 = "refreshData"

		if slot10.selIdx:read() ~= -1 and slot4[slot9] or false then
			slot4[slot9].isSel = true
		end

		uv11 = "refreshData"
		slot11 = slot11.selIdx
		slot11 = slot11.set

		slot11(slot11, slot9)

		uv11 = "refreshData"
		slot11 = slot11.heldItems
		slot11 = slot11.update

		slot11(slot11, slot4)

		uv11 = "refreshData"
		slot11 = slot11.hasItem
		slot11 = slot11.set

		slot11(slot11, slot5 <= 0)

		uv11 = "refreshData"
		slot11 = slot11.selIdx
		slot11 = slot11.notify

		slot11(slot11)

		uv11 = "refreshData"
		slot11 = slot11.isVisibleRight
		slot11 = slot11.set

		slot11(slot11, slot10 ~= false)

		uv11 = "refreshData"
		slot11.curDbId = nil
	end)
	slot0.selIdx:addListener(function (slot0, slot1)
		uv2 = "heldItems"

		if slot2.heldItems:size() <= 0 then
			uv3 = "heldItems"

			slot3.isVisibleRight:set(false)

			return
		end

		if slot1 ~= -1 and slot0 ~= slot1 then
			uv3 = "heldItems"

			if slot3.heldItems:atproxy(slot1) then
				uv3 = "heldItems"

				if slot3.heldItems:atproxy(slot1).isSel ~= false then
					uv3 = "heldItems"
					slot3.heldItems:atproxy(slot1).isSel = false
				end
			end
		end

		uv3 = "heldItems"

		if not slot3.heldItems:atproxy(slot0) then
			uv3 = "heldItems"

			slot3.curSelDbId:set(nil)

			return
		end

		if slot0 ~= slot1 then
			uv3 = "heldItems"

			if slot3.heldItems:atproxy(slot0).isSel ~= true then
				uv3 = "heldItems"
				slot3.heldItems:atproxy(slot0).isSel = true
			end
		end

		uv3 = "heldItems"
		uv5 = "heldItems"
		slot5 = slot5.heldItems:atproxy(slot0).dbId

		slot3.curSelDbId:set(slot5)

		slot4 = csv.held_item.effect
		uv5 = "heldItems"
		slot5 = slot5.heldItems:atproxy(slot0)
		slot6 = csv.held_item.items[slot5.csvId]
		slot8 = 1
		slot9 = gLanguageCsv.spaceEquip
		uv10 = "size"
		slot10, slot11 = slot10.isExclusive(slot5)

		if slot5.cardDbID then
			uv12 = "heldItems"

			if slot7 == slot12.cardDbId then
				slot8 = 2
				slot9 = gLanguageCsv.dressDown
			end

			slot18 = "star"
			slot12 = gGameModel.cards:find(slot7):read("card_id", "skin_id", "advance", "level", slot18)
			slot17 = slot12.skin_id
			uv17 = "heldItems"
			uv18 = "heldItems"

			bind.extend(slot17, slot18.roleInfoItem, {
				class = "card_icon",
				props = {
					levelProps = {
						data = slot12.level
					},
					rarity = csv.unit[csv.cards[slot12.card_id].unitID].rarity,
					dbid = slot7,
					unitId = dataEasy.getUnitId(slot12.card_id, slot17),
					advance = slot12.advance,
					star = slot12.star,
					onNode = function (slot0)
					end
				}
			})
		end

		uv12 = "heldItems"
		slot12 = slot12.hasRoleDress
		slot12 = slot12.set

		slot12(slot12, slot10)

		uv12 = "heldItems"
		slot12 = slot12.curBtnState
		slot12 = slot12.set

		slot12(slot12, slot8)

		uv12 = "heldItems"

		slot12.btnText:set(slot9)

		slot12 = slot5.cfg.name

		if slot5.advance > 0 then
			slot12 = string.format("%s +%d", slot5.cfg.name, slot5.advance)
		end

		uv13 = "heldItems"
		slot13 = slot13.itemName
		slot14 = slot13

		slot13.set(slot14, slot12)

		slot13 = text.addEffect
		uv14 = "heldItems"

		slot13(slot14.heldItemName, {
			color = slot5.cfg.quality == 1 and ui.COLORS.NORMAL.DEFAULT or ui.COLORS.QUALITY[slot5.cfg.quality]
		})

		uv13 = "heldItems"
		slot13 = slot13.itemLv
		slot14 = slot13
		slot15 = gLanguageCsv.textLv .. slot5.lv

		slot13.set(slot14, slot15)

		uv14 = "heldItems"
		uv15 = "heldItems"

		bind.extend(slot14, slot15.rightItem, {
			class = "icon_key",
			props = {
				noListener = true,
				data = {
					key = slot5.csvId,
					num = slot5.num,
					dbId = slot5.dbId[1]
				}
			}
		})

		slot13 = slot4[slot6.effect1]

		if slot6 and itertools.size(slot6.exclusiveCards) > 0 then
			slot13 = slot4[slot6.effect2]
		end

		slot14 = {}

		for slot18, slot19 in csvMapPairs(slot13.exclusiveCards) do
			for slot23, slot24 in pairs(gCardsCsv[slot19]) do
				for slot28, slot29 in pairs(slot24) do
					table.insert(slot14, {
						card = slot29,
						rarity = csv.unit[slot29.unitID].rarity
					})
				end
			end
		end

		uv15 = "heldItems"

		slot15.tabCards:update(slot14)

		slot15 = #slot14 > 0
		uv16 = "heldItems"

		slot16.hasShowCards:set(itertools.size(slot13.exclusiveCards) > 0)

		slot18 = csv.held_item.advance_attrs[slot5.advance]
		slot22 = {}

		for slot26, slot27 in ipairs(slot5.cfg.attrTypes) do
			table.insert(slot22, {
				attr = slot27,
				val = math.floor(slot5.cfg.attrNumRates[slot26] * slot18["attrRate" .. slot5.cfg.advanceAttrSeq][slot26] * (csv.held_item.level_attrs[slot5.lv]["attrNum" .. slot5.cfg.strengthAttrSeq][slot26] + slot18["attrNum" .. slot5.cfg.advanceAttrSeq][slot26]))
			})
		end

		uv23 = "heldItems"

		slot23.attrs:update(slot22)

		if gGameModel.held_items:find(slot5.dbId[1]) then
			slot23 = {}

			for slot27 = 1, 100 do
				slot28 = slot5.cfg[string.format("effect%dLevelAdvSeq", slot27)]

				if not slot5.cfg["effect" .. slot27] or slot5.cfg["effect" .. slot27] == 0 or not slot28 or gGameModel.held_items:find(slot5.dbId[1]):read("advance") < slot28[1] then
					break
				end

				uv30 = "size"

				table.insert(slot23, slot30.getStrinigByData(slot27, slot5))
			end

			slot27 = "\n"
			slot26 = {
				fontSize = 40,
				isRich = true,
				list = slot27.rightCenterList,
				strs = "#C0x5B545B#" .. table.concat(slot23, slot27)
			}
			uv27 = "heldItems"
			slot25 = beauty.textScroll(slot26)
			uv26 = "heldItems"

			slot26:setRightCenterListSize()
		end
	end)
end

function slot3.initModel(slot0)
	slot0.myHeldItem = gGameModel.role:getIdler("held_items")
	slot0.cards = gGameModel.role:getIdler("cards")
	slot0.refreshFlag = idler.new(false)
	slot0.selIdx = idler.new(1)
end

function slot3.setRightCenterListSize(slot0)
	slot1 = slot0.hasShowCards:read()
	slot3 = slot0.rightCenterList:size()
	uv5 = "hasShowCards"

	if slot5 < slot0.rightCenterList:getInnerContainerSize().height then
		uv4 = "hasShowCards"

		if not slot4 then
			slot4 = slot2.height
		end
	end

	slot2.height = slot4

	if not slot1 then
		slot0.rightCenterList:size(slot2)
		slot0.rightCenterList:y(slot0.rightCenterList:y() - (slot2.height - slot3.height))
	end
end

function slot3.refreshData(slot0)
	slot0.tableDatas = {}
	slot0.dataIdx = {}
	slot1 = {}
	slot2 = {}
	slot3 = 0

	for slot9, slot10 in pairs(slot0.myHeldItem:read()) do
		if gGameModel.held_items:find(slot10) and slot11:read("exist_flag", "card_db_id", "advance", "level", "sum_exp", "held_item_id").exist_flag then
			if not dataEasy.getInMeteorHelditemsHash()[slot10] and slot12.sum_exp == 0 and slot12.advance == 0 and not slot12.card_db_id then
				if not slot1[slot12.held_item_id] then
					slot1[slot12.held_item_id] = {
						num = 0,
						maxNum = csv.held_item.items[slot12.held_item_id].stackShow,
						dbIds = {}
					}
				end

				slot1[slot12.held_item_id].num = slot1[slot12.held_item_id].num + 1

				table.insert(slot1[slot12.held_item_id].dbIds, slot10)
			else
				slot14 = {
					cfg = slot13,
					csvId = slot12.held_item_id,
					dbId = {
						slot10
					},
					num = 1,
					isSel = false,
					lv = slot12.level,
					cardDbID = slot12.card_db_id,
					advance = slot15
				}
				uv15 = "tableDatas"
				slot14.isDress, slot14.isExc = slot12.advance.isExclusive(slot14)
				slot14.inMeteor = slot5[slot10]

				table.insert(slot2, slot14)

				slot0.dataIdx[slot10] = slot3 + 1
			end
		end
	end

	for slot9, slot10 in pairs(slot1) do
		for slot16 = 1, math.ceil(slot10.num / slot10.maxNum) do
			slot3 = slot3 + 1
			slot17 = {
				cfg = slot4[slot9],
				csvId = slot9,
				num = slot18
			}
			slot19 = {}

			for slot23 = 1, math.min(slot12, slot11) do
				table.insert(slot19, slot10.dbIds[slot23])
			end

			slot17.dbId = slot19
			slot17.isSel = false
			slot17.lv = 1
			slot20 = 0
			slot17.advance = slot20
			uv20 = "tableDatas"
			slot20, slot17.isExc = slot20.isExclusive(slot17)
			slot17.isDress = false

			table.insert(slot2, slot17)

			slot11 = slot11 - slot12
			slot0.dataIdx[slot9] = slot3
		end
	end

	slot0.tableDatas = slot2
end

function slot3.onDressClick(slot0)
	slot3 = slot0.heldItems
	slot4 = slot3
	slot3 = slot3.atproxy(slot4, slot0.selIdx:read())
	uv4 = "curBtnState"

	if slot0.curBtnState:read() == slot4.dress then
		if slot3.inMeteor then
			gGameUI:showTip(gLanguageCsv.inMeteorites)

			return
		end

		slot4 = false

		if slot3.cardDbID then
			slot4 = true
			slot12 = "%%s"
			slot10, slot11 = string.find(gLanguageCsv.heldItemReDress, slot12)
			uv12 = "read"
			slot12, slot13 = slot12.getCardNameColor(slot5)
			uv14 = "read"

			gGameUI:showDialog({
				btnType = 2,
				isRich = true,
				cb = function ()
					uv0 = "dbId"
					uv5 = "gGameApp"

					gGameApp:requestServer("/game/helditem/equip", function ()
						uv0 = "selIdx"
						slot0 = slot0.selIdx
						slot0 = slot0.set

						slot0(slot0, -1)

						uv0 = "selIdx"
						slot0 = slot0.refreshFlag
						slot0 = slot0.notify

						slot0(slot0)

						uv0 = "selIdx"

						if slot0.handlers then
							uv0 = "selIdx"
							uv1 = "set"

							slot0.handlers(slot1)
						end

						audio.playEffectWithWeekBGM("equip.mp3")
						gGameUI:showTip(gLanguageCsv.dressSuccess)
					end, slot5.cardDbId, slot0.dbId[1])
				end,
				content = string.format("#C0x5B545B#" .. slot14.insertColor(gLanguageCsv.heldItemReDress, slot12, false, 1, false), csv.cards[gGameModel.cards:find(slot5):read("card_id")].name .. slot13)
			})
		else
			slot6()
		end
	else
		uv4 = "curBtnState"

		if slot1 == slot4.down then
			gGameApp:requestServer("/game/helditem/unload", function ()
				uv0 = "selIdx"
				slot0 = slot0.selIdx
				slot0 = slot0.set

				slot0(slot0, -1)

				uv0 = "selIdx"
				slot0 = slot0.refreshFlag
				slot0 = slot0.notify

				slot0(slot0)

				uv0 = "selIdx"

				if slot0.handlers then
					uv0 = "selIdx"

					slot0.handlers()
				end

				gGameUI:showTip(gLanguageCsv.dressDownSuccess)
			end, slot3.dbId[1])
		end
	end
end

function slot3.callBackData(slot0, slot1)
	slot0.curDbId = slot1

	slot0.refreshFlag:notify()
end

function slot3.onStrengthenClick(slot0)
	gGameUI:stackUI("city.card.helditem.advance", {
		refreshData = slot0:createHandler("callBackData")
	}, {
		full = true
	}, slot0.heldItems:atproxy(slot0.selIdx:read()).dbId)
end

function slot3.onSortLeftMenusBtnClick(slot0, slot1, slot2, slot3, slot4)
	slot0.showLeftSelected:set(slot3)
end

function slot3.onCloseLeftOtherView(slot0, slot1, slot2)
	slot0.isRightDownListShow:set(false)
end

function slot3.onSortRightMenusBtnClick(slot0, slot1, slot2, slot3, slot4)
	slot0.showRightSelected:set(slot3)
end

function slot3.onCloseRightOtherView(slot0, slot1, slot2)
	slot0.isLeftDownListShow:set(false)
end

function slot3.onInfoClick(slot0, slot1, slot2)
	slot4, slot5 = slot1:getPosition()
	slot6 = slot1:getParent():convertToWorldSpace(cc.p(slot4, slot5))

	gGameUI:stackUI("city.card.helditem.advance_detail", nil, , {
		offy = 120,
		offx = 256,
		data = slot0.heldItems:atproxy(slot0.selIdx:read()),
		target = slot1,
		x = slot6.x,
		y = slot6.y
	})
end

function slot3.onItemClick(slot0, slot1, slot2, slot3)
	slot0.selIdx:set(slot2.k, true)

	if slot0.heldItems:atproxy(slot2.k) and slot0.heldItems:atproxy(slot2.k).isSel ~= true then
		slot0.heldItems:atproxy(slot2.k).isSel = true
	end

	slot0.isVisibleRight:set(true)
end

function slot3.bagHandbook(slot0)
	gGameUI:stackUI("city.card.helditem.bag_handbook", nil, , slot0.cardDbId)
end

function slot3.onClose(slot0)
	if slot0.handlers then
		slot0.handlers(gGameModel.cards:find(slot0.cardDbId):read("held_item"))
	end

	Dialog.onClose(slot0)
end

return slot3
