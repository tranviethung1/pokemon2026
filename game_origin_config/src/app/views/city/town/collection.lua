slot0 = {
	collectionLevel = 1,
	bonuses = 3,
	rule = 4,
	level = 2
}
slot1 = {
	furniture = 1,
	floor = 2,
	wall = 3
}
slot2 = {
	percent = 2,
	number = 1
}

function slot3(slot0, slot1, slot2)
	slot0:setTouchEnabled(slot2)
	cache.setShader(slot0, false, slot1 and "normal" or "hsl_gray")

	if slot1 then
		text.addEffect(slot0:get("txt"), {
			glow = {
				color = ui.COLORS.GLOW.WHITE
			}
		})
	else
		text.deleteAllEffect(slot0:get("txt"))
		text.addEffect(slot0:get("txt"), {
			color = ui.COLORS.DISABLED.WHITE
		})
	end
end

slot4 = class("TownCollectionView", Dialog)
slot5 = {
	event = "effect",
	data = {
		outline = {
			size = 4,
			color = cc.c4b(255, 252, 237, 255)
		}
	}
}
slot4.RESOURCE_FILENAME = "town_collection.json"
slot4.RESOURCE_BINDING = {
	["rolePanel.rightPanel.rulePanel.slider"] = "ruleSlider",
	["rolePanel.rightPanel.rulePanel"] = "rulePanel",
	["rolePanel.rightPanel.collectionLevelPanel"] = "collectionLevelPanel",
	["seriesPanel.rightItem"] = "seriesRightItem",
	seriesPanel = "seriesPanel",
	["seriesPanel.addDecorate"] = "addDecorate",
	["rolePanel.rightPanel.levelPanel"] = "levelPanel",
	["furniturePanel.centerItem"] = "centerItem",
	["furniturePanel.topItem"] = "topItem",
	["rolePanel.rightPanel.bonusesPanel"] = "bonusesPanel",
	["rolePanel.roleLevelPanel"] = "roleLevelPanel",
	bg = "bg",
	["leftTabPanel.item"] = "tabItem",
	furniturePanel = "furniturePanel",
	["furniturePanel.rightPanel"] = "furnitureRightPanel",
	["rolePanel.rightPanel"] = "roleRightPanel",
	["seriesPanel.collected"] = "seriesCollected",
	rolePanel = "rolePanel",
	["furniturePanel.collected"] = "furnitureCollected",
	["furniturePanel.rightPanel.bottomPanel.btnGo"] = "btnGoto",
	leftTabPanel = "leftTabPanel",
	["rolePanel.bottomPanel"] = "roleBottomPanel",
	["furniturePanel.subList"] = "subList",
	["rolePanel.titlePanel"] = "titlePanel",
	["rolePanel.rightPanel.rulePanel.list"] = "ruleList",
	["rolePanel.rightPanel.bonusesPanel.attrItem"] = "bonusesAttrItem",
	["rolePanel.rightPanel.levelPanel.item"] = "levelPanelItem",
	["seriesPanel.item"] = "seriesItem",
	close = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["leftTabPanel.list"] = {
		varname = "tabList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("leftTab"),
				item = bindHelper.self("tabItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()
						slot1:get("select"):show():get("img"):texture(slot3.res .. "1.png")
					else
						slot5:hide()

						slot6 = slot4:show()

						slot6:x(220)
						slot6:get("img"):texture(slot3.res .. ".png")
					end

					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCellItem, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCellItem = bindHelper.self("onLeftItemClick")
			}
		}
	},
	["rolePanel.roleLevelPanel.bar"] = {
		binds = {
			event = "extend",
			class = "loadingbar",
			props = {
				data = bindHelper.self("roleLevelBar")
			}
		}
	},
	["rolePanel.bottomPanel.collectionLevel.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(255, 252, 237, 255)
				}
			}
		}
	},
	["rolePanel.bottomPanel.collectionLevel"] = {
		varname = "btnCollectionLevel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					uv3 = "updateRoleBottomAndRightPanel"

					return slot0:updateRoleBottomAndRightPanel(slot3.collectionLevel)
				end)
			}
		}
	},
	["rolePanel.bottomPanel.level.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(255, 252, 237, 255)
				}
			}
		}
	},
	["rolePanel.bottomPanel.level"] = {
		varname = "btnLevel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					uv3 = "updateRoleBottomAndRightPanel"

					return slot0:updateRoleBottomAndRightPanel(slot3.level)
				end)
			}
		}
	},
	["rolePanel.bottomPanel.bonuses.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(255, 252, 237, 255)
				}
			}
		}
	},
	["rolePanel.bottomPanel.bonuses"] = {
		varname = "btnBonuses",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					uv3 = "updateRoleBottomAndRightPanel"

					return slot0:updateRoleBottomAndRightPanel(slot3.bonuses)
				end)
			}
		}
	},
	["rolePanel.bottomPanel.rule.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(255, 252, 237, 255)
				}
			}
		}
	},
	["rolePanel.bottomPanel.rule"] = {
		varname = "btnRule",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					uv3 = "updateRoleBottomAndRightPanel"

					return slot0:updateRoleBottomAndRightPanel(slot3.rule)
				end)
			}
		}
	},
	["rolePanel.rightPanel.collectionLevelPanel.normalPanel.bar"] = {
		binds = {
			event = "extend",
			class = "loadingbar",
			props = {
				data = bindHelper.self("normalBar")
			}
		}
	},
	["rolePanel.rightPanel.collectionLevelPanel.rarePanel.bar"] = {
		binds = {
			event = "extend",
			class = "loadingbar",
			props = {
				data = bindHelper.self("rareBar")
			}
		}
	},
	["rolePanel.rightPanel.collectionLevelPanel.normalSeriesPanel.bar"] = {
		binds = {
			event = "extend",
			class = "loadingbar",
			props = {
				data = bindHelper.self("normalSeriesBar")
			}
		}
	},
	["rolePanel.rightPanel.collectionLevelPanel.rareSeriesPanel.bar"] = {
		binds = {
			event = "extend",
			class = "loadingbar",
			props = {
				data = bindHelper.self("rareSeriesBar")
			}
		}
	},
	["rolePanel.rightPanel.levelPanel.list"] = {
		varname = "levelPanelList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 15,
				data = bindHelper.self("levelPanelDatas"),
				item = bindHelper.self("levelPanelItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot10 = "subItem"
					slot9 = slot3.level

					slot1:multiget("titleText", "text", "list", "subList", slot10, "item1").titleText:text(string.format(gLanguageCsv.townCollectionLevel, slot9))

					for slot9, slot10 in csvPairs(slot3.attr) do
						-- Nothing
					end

					slot4.subItem:hide()

					slot6 = 0
					slot7 = 0

					if itertools.size({
						[slot9] = {
							key = slot9,
							val = slot10
						}
					}) == 1 then
						slot6 = slot4.subItem:width()
						slot7 = slot4.subItem:height() / 2
					elseif itertools.size(slot5) == 2 then
						slot6 = slot4.subItem:width() / 2
						slot7 = slot4.subItem:height() / 2
					elseif itertools.size(slot5) == 3 then
						slot7 = slot4.subItem:height() / 2
					end

					bind.extend(slot0, slot4.list, {
						class = "tableview",
						props = {
							columnSize = 3,
							data = slot5,
							item = slot4.subList,
							cell = slot4.subItem,
							leftPadding = matchLanguage({
								"kr"
							}) and 10 or 40,
							onCell = function (slot0, slot1, slot2, slot3)
								uv6 = "getIdx"
								slot4 = slot0:getIdx(slot6)
								uv5 = "ui"

								if ui.ATTR_LOGO[game.ATTRDEF_TABLE[slot3.key]] then
									slot6 = slot1:get("icon")
									slot6 = slot6.texture

									slot6(slot6, ui.ATTR_LOGO[game.ATTRDEF_TABLE[slot3.key]])

									uv6 = "ui"
									slot5 = slot6 + slot1:get("icon"):width() + 5
								else
									slot1:get("icon"):hide()
								end

								slot8 = slot1:get("icon")
								slot9 = slot8
								uv9 = "ui"
								slot8 = slot1:get("icon")
								slot9 = slot8
								uv9 = "ATTR_LOGO"

								slot1:get("icon"):x(slot8.x(slot9) + slot9):y(slot8.y(slot9) - slot9)

								slot8 = slot1:get("txt")
								slot9 = slot8
								uv9 = "ATTR_LOGO"

								slot1:get("txt"):x(slot1:get("txt"):x() + slot5):y(slot8.y(slot9) - slot9):text(getLanguageAttr(slot3.key))

								slot8 = slot1:get("num")
								slot9 = slot8
								uv9 = "ATTR_LOGO"

								slot1:get("num"):x(slot1:get("txt"):x() + slot1:get("txt"):width()):y(slot8.y(slot9) - slot9):text(":+" .. slot3.val)
							end
						}
					})
				end
			}
		}
	},
	["rolePanel.rightPanel.bonusesPanel.btnNumer"] = {
		varname = "btnNumer",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					uv3 = "updateRoleLevelPanel"

					return slot0:updateRoleLevelPanel(slot3.number)
				end)
			}
		}
	},
	["rolePanel.rightPanel.bonusesPanel.btnPercent"] = {
		varname = "btnPercent",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.defer(function (slot0)
					uv3 = "updateRoleLevelPanel"

					return slot0:updateRoleLevelPanel(slot3.percent)
				end)
			}
		}
	},
	["rolePanel.rightPanel.bonusesPanel.list"] = {
		varname = "bonusesList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("bonusesPanelDatas"),
				item = bindHelper.self("bonusesAttrItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:multiget("img", "name", "all", "level", "series").name:text(getLanguageAttr(slot2) .. ":")

					if string.find(slot3.collection, "%%") then
						slot4.all:text(dataEasy.attrAddition(slot3.collection, slot3.series))
					else
						slot4.all:text(slot3.collection + slot3.series)
					end

					slot4.level:text(slot3.collection)
					slot4.series:text(slot3.series)

					if ui.ATTR_LOGO[game.ATTRDEF_TABLE[slot2]] then
						slot4.img:texture(ui.ATTR_LOGO[game.ATTRDEF_TABLE[slot2]]):show()
						adapt.oneLinePos(slot4.img, {
							slot4.name,
							slot4.all
						}, {
							cc.p(5, 0),
							cc.p(5, 0)
						})
					else
						slot4.img:hide()
						adapt.oneLinePos(slot4.name, slot4.all, cc.p(5, 0))
					end
				end
			}
		}
	},
	["furniturePanel.rightPanel.bottomPanel.btnGo.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = cc.c4b(255, 255, 255, 255)
				}
			}
		}
	},
	["furniturePanel.topList"] = {
		varname = "topList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				padding = 20,
				data = bindHelper.self("topTab"),
				item = bindHelper.self("topItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()

						slot6 = slot1:get("select"):show()
					else
						slot5:hide()

						slot6 = slot4:show()
					end

					if matchLanguage({
						"en"
					}) then
						adapt.setTextScaleWithWidth(slot6:get("txt"), slot3.name, 350)
					else
						slot6:get("txt"):text(slot3.name)
					end

					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCellItem, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCellItem = bindHelper.self("onTopItemClick")
			}
		}
	},
	["furniturePanel.centerList"] = {
		varname = "centerList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 4,
				leftPadding = 20,
				asyncPreload = 16,
				data = bindHelper.self("furnitureDatas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("centerItem"),
				itemAction = {
					isAction = true
				},
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:multiget("bg", "iconPanel", "num", "mask", "rare", "rareText", "select").rare:visible(slot3.rare == 1)
					slot4.rareText:visible(slot3.rare == 1)
					slot4.iconPanel:get("icon"):texture(slot3.icon):scale(0.8)
					slot1:removeChildByName("spineRes")

					if csv.town.home_furniture[slot3.furID].spineRes ~= "" then
						ccui.ImageView:create("city/town/logo_hd2.png"):xy(170, 120):scale(0.7):addTo(slot1, 10, "spineRes")
					end

					slot4.num:text(slot3.myNum)
					slot4.select:visible(slot3.select)

					if slot3.myNum == 0 then
						cache.setShader(slot1, false, "hsl_gray_white")
						cache.setShader(slot4.select, false, "normal")
						cache.setShader(slot4.iconPanel, false, "hsl_gray")
					end

					slot0:setRenderHint(0)
					bind.touch(slot0, slot1, {
						clicksafe = true,
						methods = {
							ended = functools.partial(slot0.clickCell, slot0:getIdx(slot2), slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onFurnitureClick")
			}
		}
	},
	["seriesPanel.leftList"] = {
		varname = "seriesList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 10,
				padding = 20,
				data = bindHelper.self("seriesDatas"),
				item = bindHelper.self("seriesItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot10 = "attrAdd"
					slot11 = "got"
					slot4 = slot1:multiget("normal", "select", "name", "had", slot10, slot11, "expAdd")

					slot4.select:visible(slot3.select)
					slot4.normal:visible(not slot3.select)
					slot4.name:text(slot3.name)

					for slot10, slot11 in pairs(slot3.furniture) do
						slot5 = 0 + 1

						if slot11.myNum > 0 then
							slot6 = 0 + 1
						end
					end

					slot4.had:text(string.format(gLanguageCsv.townCollected, slot6, slot5)):visible(slot6 < slot5)
					slot4.got:visible(slot5 <= slot6)
					slot4.expAdd:visible(slot6 < slot5):text(string.format(gLanguageCsv.townCollectionFirstAddSeries, slot3.expAdd))
					adapt.oneLinePos(slot4.name, slot4.expAdd, cc.p(5, 0))
					adapt.setTextScaleWithWidth(slot4.expAdd, nil, slot4.had:x() - slot4.name:x() - slot4.had:width() - slot4.name:width() - 10)

					for slot11, slot12 in csvPairs(slot3.addAttrs) do
						slot7 = "" .. getLanguageAttr(slot11) .. "+" .. dataEasy.getAttrValueString(slot11, slot12) .. "    "
					end

					adapt.setTextScaleWithWidth(slot4.attrAdd, slot7, 800)
					bind.touch(slot0, slot1, {
						clicksafe = true,
						methods = {
							ended = functools.partial(slot0.clickCellItem, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCellItem = bindHelper.self("onSeriesItemClick")
			}
		}
	},
	["seriesPanel.rightList"] = {
		varname = "seriesRightList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 10,
				padding = 20,
				data = bindHelper.self("seriesFurnitureDatas"),
				item = bindHelper.self("seriesRightItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:get("leftPanel")

					if slot2 % 2 == 0 then
						slot1:get("leftPanel"):hide()
						slot1:get("rightPanel"):show()
					else
						slot1:get("rightPanel"):hide()
						slot4:show()
					end

					slot5 = slot4:multiget("iconPanel", "num", "rareText", "rare", "name", "fontType")

					adapt.setTextScaleWithWidth(slot5.name, slot3.name, 400)
					slot5.num:text(slot3.myNum)
					slot5.rare:visible(slot3.rare == 1)
					slot5.rareText:visible(slot3.rare == 1)
					slot5.iconPanel:get("icon"):texture(slot3.icon)
					adapt.setTextScaleWithWidth(slot5.fontType, string.format(gLanguageCsv.townCollectionBelong, slot3.firstName, slot3.fontName), 400)
					slot4:removeChildByName("spineRes")

					if csv.town.home_furniture[slot3.furID].spineRes ~= "" then
						ccui.ImageView:create("city/town/logo_hd2.png"):xy(slot5.iconPanel:x() + 240, 170):scale(1):addTo(slot4, 10, "spineRes")
					end
				end
			}
		}
	}
}

function slot4.onCreate(slot0, slot1)
	slot0.cb = slot1.goAssignFurn

	slot0:initModel()
	slot0:initTabData()
	slot0:initRolePanelDatas()
	slot0:initFurniturePanel()
	slot0:initSeriesPanelDatas()
	slot0:initUI()
	slot0.levelPanelItem:get("subList"):setScrollBarEnabled(false)
	Dialog.onCreate(slot0)
end

function slot4.initModel(slot0)
	slot0.myFurniture = gGameModel.role:getIdler("furniture")
	slot0.mycollectionData = gGameModel.role:getIdler("town_home")
	slot0.leftTab = idlers.newWithMap({})
	slot0.showLeftTab = idler.new(1)
	slot0.roleLevelBar = idler.new(0)
	slot0.normalBar = idler.new(0)
	slot0.rareBar = idler.new(0)
	slot0.normalSeriesBar = idler.new(0)
	slot0.rareSeriesBar = idler.new(0)
	slot0.topTab = idlers.newWithMap({})
	slot0.showTopTab = idler.new(0)
	slot0.furnitureDatas = idlers.newWithMap({})
	slot0.seriesDatas = idlers.newWithMap({})
	slot0.seriesFurnitureDatas = idlers.newWithMap({})
	slot0.bonusesPanelDatas = idlers.newWithMap({})
	slot0.levelPanelDatas = idlers.newWithMap({})
end

function slot4.initTabData(slot0)
	slot1 = {
		{
			name = "role",
			res = "city/town/collection/icon_zl",
			id = 1,
			select = true,
			panel = slot0.rolePanel
		},
		{
			name = "furniture",
			res = "city/town/collection/icon_js",
			id = 2,
			select = false,
			panel = slot0.furniturePanel
		},
		{
			name = "floor",
			res = "city/town/collection/icon_dm",
			id = 3,
			select = false,
			panel = slot0.furniturePanel
		},
		{
			name = "wall",
			res = "city/town/collection/icon_qm",
			id = 4,
			select = false,
			panel = slot0.furniturePanel
		},
		{
			name = "yard",
			res = "city/town/collection/icon_yz",
			id = 5,
			select = false,
			panel = slot0.furniturePanel
		},
		{
			name = "series",
			res = "city/town/collection/icon_zsxl",
			id = 6,
			select = false,
			panel = slot0.seriesPanel
		}
	}

	table.sort(slot1, function (slot0, slot1)
		return slot0.id < slot1.id
	end)

	slot0.leftTabDatas = slot1

	slot0.leftTab:update(slot1)
	slot0.showLeftTab:addListener(function (slot0, slot1, slot2)
		if slot0 ~= slot1 then
			uv3 = "leftTab"
			slot3 = slot3.leftTab:atproxy(slot1)
			slot3.select = false
			uv3 = "leftTab"
			slot3 = slot3.leftTab:atproxy(slot0)
			slot3.select = true
			uv3 = "leftTab"

			slot3:updateLeftPanel(slot0)
		end
	end)
	slot0:updateLeftPanel(1)
end

function slot4.initUI(slot0)
	adapt.setTextScaleWithWidth(slot0.btnPercent:get("normal.txt"), nil, 250)
	adapt.setTextScaleWithWidth(slot0.btnPercent:get("select.txt"), nil, 250)
	adapt.setTextScaleWithWidth(slot0.btnNumer:get("normal.txt"), nil, 250)
	adapt.setTextScaleWithWidth(slot0.btnNumer:get("select.txt"), nil, 250)
end

function slot4.onLeftItemClick(slot0, slot1, slot2, slot3)
	slot0.showLeftTab:set(slot2)
end

function slot4.updateLeftPanel(slot0, slot1)
	slot2 = nil

	for slot6, slot7 in pairs(slot0.leftTabDatas) do
		slot7.panel:visible(false)

		if slot7.id == slot1 then
			slot2 = slot7.panel

			if slot7.id >= 2 and slot7.id <= 5 then
				slot0:updateFurniturePanel(slot7.id)
				slot0.showTopTab:set(1)
				slot0:updateFurnitureData()
			end
		end
	end

	slot2:visible(true)
end

function slot4.initRolePanelDatas(slot0)
	slot0.rolePanel:get("roleImg"):texture(csv.role_figure[gGameModel.role:read("figure")].qFigureres):scale(2)

	slot1 = slot0.mycollectionData:read()

	slot0.roleLevelPanel:get("level"):text(gLanguageCsv.textLv .. slot1.collection_level)

	slot2 = slot1.collection_exp or 0
	slot3 = 0
	slot4 = 0
	slot5 = 0

	for slot9, slot10 in orderCsvPairs(csv.town.home_collection) do
		if slot4 <= slot10.level then
			slot4 = slot10.level or slot4
		end

		if slot5 <= slot10.needExp then
			slot5 = slot10.needExp or slot5
		end

		if slot10.level <= slot1.collection_level then
			slot2 = slot2 - slot10.needExp
		elseif slot1.collection_level + 1 == slot10.level then
			slot3 = slot10.needExp
		end
	end

	if slot3 == 0 then
		slot3 = slot5 or slot3
	end

	slot0.roleLevelBar:set(slot2 / slot3 * 100)
	slot0.roleLevelPanel:get("exp"):text(slot2 .. "/" .. slot3)

	if slot1.collection_level == slot4 then
		slot0.roleLevelBar:set(100)
		slot0.roleLevelPanel:get("exp"):text(gLanguageCsv.levelMax)
	end

	slot0:initCollectionLevelPanel(slot1)

	slot8 = slot1

	slot0:initLevelPanel(slot8)
	slot0:initRulePanel()

	uv8 = "rolePanel"

	slot0:updateRoleBottomAndRightPanel(slot8.collectionLevel)
end

function slot4.initCollectionLevelPanel(slot0, slot1)
	slot2 = {
		normalSeries = 0,
		myNormal = 0,
		myRare = 0,
		myRareSeries = 0,
		rareSeries = 0,
		rare = 0,
		myNormalSeries = 0,
		normal = 0
	}
	slot4 = csv.town.home_furniture_series

	for slot8, slot9 in orderCsvPairs(csv.town.home_furniture) do
		if slot9.quality == 1 then
			slot2.rare = slot2.rare + 1
		else
			slot2.normal = slot2.normal + 1
		end
	end

	for slot8, slot9 in orderCsvPairs(slot4) do
		if slot9.rarity == 1 then
			slot2.rareSeries = slot2.rareSeries + 1
		else
			slot2.normalSeries = slot2.normalSeries + 1
		end
	end

	for slot9, slot10 in pairs(slot0.myFurniture:read() or {}) do
		if slot3[slot9].quality == 1 then
			slot2.myRare = slot2.myRare + 1
		else
			slot2.myNormal = slot2.myNormal + 1
		end
	end

	for slot9, slot10 in pairs(slot1.furniture_series or {}) do
		if slot4[slot9].rarity == 1 then
			slot2.myRareSeries = slot2.myRareSeries + 1
		else
			slot2.myNormalSeries = slot2.myNormalSeries + 1
		end
	end

	slot0.normalBar:set(slot2.myNormal / slot2.normal * 100)
	slot0.rareBar:set(slot2.myRare / slot2.rare * 100)
	slot0.normalSeriesBar:set(slot2.myNormalSeries / slot2.normalSeries * 100)
	slot0.rareSeriesBar:set(slot2.myRareSeries / slot2.rareSeries * 100)
	slot0.collectionLevelPanel:get("normalPanel.num"):text(slot2.myNormal .. gLanguageCsv.townCollectionHaveNum)
	slot0.collectionLevelPanel:get("rarePanel.num"):text(slot2.myRare .. gLanguageCsv.townCollectionHaveNum)
	slot0.collectionLevelPanel:get("normalSeriesPanel.num"):text(slot2.myNormalSeries .. gLanguageCsv.townCollectionHaveNum)
	slot0.collectionLevelPanel:get("rareSeriesPanel.num"):text(slot2.myRareSeries .. gLanguageCsv.townCollectionHaveNum)
end

function slot4.initLevelPanel(slot0, slot1)
	slot2 = slot0.mycollectionData:read().collection_level or 1
	slot5 = {}
	slot6 = {}

	for slot10, slot11 in orderCsvPairs(csv.town.home_collection) do
		if csvSize(slot11.addAttrs) ~= 0 then
			-- Nothing
		end

		if slot11.level <= slot2 then
			for slot15, slot16 in csvPairs(slot11.addAttrs) do
				if string.find(dataEasy.getAttrValueString(slot15, slot16), "%%") then
					if slot6[slot15] then
						slot6[slot15].collection = dataEasy.attrAddition(slot6[slot15].collection, slot17)
					else
						slot6[slot15] = {
							series = "0%",
							collection = slot17
						}
					end
				elseif slot5[slot15] then
					slot5[slot15].collection = slot5[slot15].collection + slot17
				else
					slot5[slot15] = {
						series = 0,
						collection = slot17
					}
				end
			end
		end
	end

	slot0:initBonusesPanel(slot5, slot6)
	slot0.levelPanelDatas:update({
		[slot10] = {
			level = slot11.level,
			attr = slot11.addAttrs
		}
	})
end

function slot4.initBonusesPanel(slot0, slot1, slot2)
	slot4 = csv.town.home_furniture_series

	for slot8, slot9 in pairs(slot0.mycollectionData:read().furniture_series or {} or {}) do
		for slot13, slot14 in csvPairs(slot4[slot8].addAttrs) do
			if string.find(dataEasy.getAttrValueString(slot13, slot14), "%%") then
				if slot2[slot13] then
					slot2[slot13].series = dataEasy.attrAddition(slot2[slot13].series, slot15)
				else
					slot2[slot13] = {
						collection = "0%",
						series = slot15
					}
				end
			elseif slot1[slot13] then
				slot1[slot13].series = slot1[slot13].series + slot15
			else
				slot1[slot13] = {
					collection = 0,
					series = slot15
				}
			end
		end
	end

	slot0.addAttrsPercentDatas = slot2
	slot0.addAttrsNumDatas = slot1
	uv7 = "mycollectionData"

	slot0:updateBonusesDatas(slot7.number)
end

function slot4.initRulePanel(slot0)
	for slot5 = 125200, 125300 do
		if csv.note[slot5] and csv.note[slot5].fmt ~= "" then
			slot1 = "" .. csv.note[slot5].fmt .. "\n"
		end
	end

	slot0.ruleList:removeAllChildren()

	slot2 = "#C0x625C61#"
	slot3, slot4 = beauty.textScroll({
		fontSize = 40,
		topPadding = 80,
		rightPadding = 80,
		isRich = true,
		align = "left",
		list = slot0.ruleList,
		strs = slot2 .. slot1 .. slot2
	})

	if slot3:size().height < slot4 then
		slot5, slot6 = slot0.ruleList:xy()
		slot7 = slot0.ruleList:size()

		slot0.ruleSlider:visible(true)

		slot8, slot9 = slot0.ruleSlider:xy()
		slot10 = slot0.ruleSlider:size()

		slot0.ruleList:setScrollBarEnabled(true)
		slot0.ruleList:setScrollBarColor(cc.c3b(241, 59, 84))
		slot0.ruleList:setScrollBarOpacity(255)
		slot0.ruleList:setScrollBarAutoHideEnabled(false)
		slot0.ruleList:setScrollBarPositionFromCorner(cc.p(slot5 + slot7.width - slot8, (slot7.height - slot10.height) / 2 + 15))
		slot0.ruleList:setScrollBarWidth(slot10.width)
		slot0.ruleList:jumpToPercentVertical(0)
		slot0.ruleList:refreshView()
	else
		slot0.ruleList:setScrollBarEnabled(false)
		slot0.ruleSlider:visible(false)
	end
end

function slot4.updateRoleBottomAndRightPanel(slot0, slot1)
	slot3 = "city/town/collection/btn_normal1.png"
	slot4 = "city/town/collection/"

	slot0.btnCollectionLevel:get("bg"):texture(slot3)
	slot0.btnLevel:get("bg"):texture(slot3)
	slot0.btnBonuses:get("bg"):texture(slot3)
	slot0.btnRule:get("bg"):texture(slot3)
	slot0.btnCollectionLevel:get("icon"):texture(slot4 .. "icon_scdj1.png")
	slot0.btnLevel:get("icon"):texture(slot4 .. "icon_djyl1.png")
	slot0.btnBonuses:get("icon"):texture(slot4 .. "icon_sxjc1.png")

	slot5 = slot0.btnRule:get("icon")
	slot5 = slot5.texture

	slot5(slot5, slot4 .. "icon_gz1.png")

	uv5 = "city/town/collection/btn_selected1.png"

	if slot1 == slot5.collectionLevel then
		slot0.btnCollectionLevel:get("bg"):texture("city/town/collection/btn_selected1.png")
		slot0.btnCollectionLevel:get("icon"):texture(slot4 .. "icon_scdj.png")
	else
		uv5 = "city/town/collection/btn_selected1.png"

		if slot1 == slot5.level then
			slot0.btnLevel:get("bg"):texture(slot2)
			slot0.btnLevel:get("icon"):texture(slot4 .. "icon_djyl.png")
		else
			uv5 = "city/town/collection/btn_selected1.png"

			if slot1 == slot5.bonuses then
				slot0.btnBonuses:get("bg"):texture(slot2)
				slot0.btnBonuses:get("icon"):texture(slot4 .. "icon_sxjc.png")
			else
				uv5 = "city/town/collection/btn_selected1.png"

				if slot1 == slot5.rule then
					slot0.btnRule:get("bg"):texture(slot2)
					slot0.btnRule:get("icon"):texture(slot4 .. "icon_gz.png")
				end
			end
		end
	end

	uv7 = "city/town/collection/btn_selected1.png"
	slot7 = slot1 == slot7.collectionLevel

	slot0.collectionLevelPanel:visible(slot7)

	uv7 = "city/town/collection/btn_selected1.png"
	slot7 = slot1 == slot7.level

	slot0.levelPanel:visible(slot7)

	uv7 = "city/town/collection/btn_selected1.png"
	slot7 = slot1 == slot7.bonuses

	slot0.bonusesPanel:visible(slot7)

	uv7 = "city/town/collection/btn_selected1.png"

	slot0.rulePanel:visible(slot1 == slot7.rule)
end

function slot4.updateRoleLevelPanel(slot0, slot1)
	slot4 = "select"
	uv4 = "btnNumer"

	slot0.btnNumer:get(slot4):visible(slot1 == slot4.number)

	slot4 = "normal"
	uv4 = "btnNumer"

	slot0.btnNumer:get(slot4):visible(slot1 ~= slot4.number)

	slot4 = "select"
	uv4 = "btnNumer"

	slot0.btnPercent:get(slot4):visible(slot1 == slot4.percent)

	slot4 = "normal"
	uv4 = "btnNumer"

	slot0.btnPercent:get(slot4):visible(slot1 ~= slot4.percent)
	slot0:updateBonusesDatas(slot1)
end

function slot4.updateBonusesDatas(slot0, slot1)
	slot2 = slot0.addAttrsNumDatas
	uv3 = "addAttrsNumDatas"

	if slot1 == slot3.percent then
		slot2 = slot0.addAttrsPercentDatas
	end

	slot0.bonusesPanelDatas:update(slot2)
	slot0.bonusesList:visible(itertools.size(slot2) ~= 0)
	slot0.bonusesPanel:get("noData"):visible(itertools.size(slot2) == 0)
end

function slot4.initFurniturePanel(slot0)
	slot1 = csv.town.home_furniture
	slot2 = {
		[slot8] = {}
	}
	slot3 = {
		[slot8] = {
			name = slot9.name,
			showType = slot9.showType
		}
	}
	slot4 = slot0.myFurniture:read()

	for slot8, slot9 in orderCsvPairs(csv.town.home_furniture_type) do
		if slot9.showType == 0 then
			-- Nothing
		else
			slot2[slot9.showType][slot8] = {}
		end
	end

	slot6 = {}
	slot7 = true
	slot8 = -1

	for slot12, slot13 in orderCsvPairs(csv.town.home_furniture_series) do
		if slot8 == -1 then
			slot8 = slot12 or slot8
		end

		if slot12 < slot8 then
			slot8 = slot12 or slot8
		end

		slot6[slot12] = {
			id = slot12,
			name = slot13.name,
			rare = slot13.rarity,
			furniture = {},
			addAttrs = slot13.addAttrs,
			select = slot7,
			expAdd = slot13.expAdd,
			addDrecorate = slot13.addDrecorate
		}
		slot7 = false
	end

	for slot12, slot13 in csvPairs(slot1) do
		if not slot13.showTest and slot3[slot13.type] ~= nil then
			table.insert(slot2[slot3[slot13.type].showType][slot13.type], {
				select = false,
				furID = slot12,
				name = slot13.name,
				rare = slot13.quality,
				max = slot13.stackMax,
				type = slot13.type,
				res = slot13.res,
				icon = slot13.icon,
				cost = slot13.costMap,
				language = slot13.language,
				series = slot5[slot13.series],
				myNum = slot4[slot12] or 0,
				desc = slot13.desc,
				expAdd = slot13.expAdd,
				repeatExpAdd = slot13.repeatExpAdd,
				decorate = slot13.decorativeness
			})

			if slot13.series ~= 0 then
				table.insert(slot6[slot13.series].furniture, {
					furID = slot12,
					name = slot13.name,
					myNum = slot15,
					icon = slot13.icon,
					rare = slot13.quality,
					fontName = slot3[slot13.type].name,
					firstName = slot3[slot14].name,
					decorate = slot13.decorativeness,
					addDrecorate = slot6[slot13.series].addDrecorate,
					seriesId = slot13.series
				})
			end
		end
	end

	slot0:updateSeriesRightPanel(slot6[slot8].furniture)

	slot11 = slot6

	slot0.seriesDatas:update(slot11)

	slot0.furnituresType = slot3
	slot0.furniture = slot2
	uv11 = "csv"

	slot0:initTopTab(slot11.furniture)
	slot0.showTopTab:addListener(function (slot0, slot1, slot2)
		if slot0 ~= slot1 then
			uv3 = "topTab"

			if slot3.topTab:atproxy(slot1) then
				uv3 = "topTab"
				slot3.topTab:atproxy(slot1).select = false
			end

			uv3 = "topTab"
			slot3 = slot3.topTab:atproxy(slot0)
			slot3.select = true
			uv3 = "topTab"

			slot3:updateFurnitureData()
		end
	end)
end

function slot4.initTopTab(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.furniture[slot1]) do
		table.insert(slot2, {
			select = false,
			id = slot6,
			name = slot0.furnituresType[slot6].name
		})
	end

	table.sort(slot2, function (slot0, slot1)
		return slot0.id < slot1.id
	end)

	slot2[1].select = true
	slot0.topTabDatas = slot2

	slot0.topTab:update(slot2)
end

function slot4.updateFurniturePanel(slot0, slot1)
	slot0:initTopTab(slot1 - 1)
end

function slot4.onTopItemClick(slot0, slot1, slot2, slot3)
	slot0.showTopTab:set(slot2)
end

function slot4.updateFurnitureData(slot0)
	slot3 = {}

	table.sort(slot0.furniture[slot0.showLeftTab:read() - 1][slot0.topTabDatas[slot0.showTopTab:read() or 1].id] or {}, function (slot0, slot1)
		if slot0.rare ~= slot1.rare then
			return slot1.rare < slot0.rare
		end

		return slot0.furID < slot1.furID
	end)

	for slot8, slot9 in pairs(slot3) do
		slot9.select = false

		if slot9.myNum > 0 then
			slot4 = 0 + 1
		end
	end

	slot0.furnitureCollected:text(gLanguageCsv.townCollectionHad .. slot4)

	if slot3[1] then
		slot3[1].select = true

		slot0:updateFurnitureRightPanel(slot3[1])
	end

	slot0.furnitureDatas:update(slot3)
end

function slot4.onFurnitureClick(slot0, slot1, slot2, slot3)
	for slot7 = 1, slot0.furnitureDatas:size() do
		slot0.furnitureDatas:atproxy(slot7).select = false
	end

	slot0.furnitureDatas:atproxy(slot2.k).select = true

	slot0:updateFurnitureRightPanel(slot3)
end

function slot4.updateFurnitureRightPanel(slot0, slot1)
	slot2 = slot0.furnitureRightPanel:get("imgPanel")
	slot3 = slot0.furnitureRightPanel:get("bottomPanel")

	slot2:get("iconPanel.icon"):texture(slot1.icon):scale(1.6)
	slot2:get("num"):text(slot1.myNum)
	slot2:get("rare"):visible(slot1.rare == 1)
	slot2:get("rareText"):visible(slot1.rare == 1)
	slot2:removeChildByName("spineRes")

	if csv.town.home_furniture[slot1.furID].spineRes ~= "" then
		ccui.ImageView:create("city/town/logo_hd2.png"):xy(440, 270):scale(1.2):addTo(slot2, 10, "spineRes")
	end

	if slot1.myNum == 0 then
		cache.setShader(slot2, false, "hsl_gray_white")
		cache.setShader(slot2:get("iconPanel.icon"), false, "hsl_gray")
	else
		cache.setShader(slot2, false, "normal")
	end

	slot4 = slot1.series

	slot3:get("name"):text(slot1.name)
	beauty.textScroll({
		isRich = false,
		list = slot3:get("text"),
		strs = slot1.desc
	})
	uiEasy.setBtnShader(slot0.btnGoto, false, slot1.myNum == 0 and 2 or 1)

	slot5 = nil

	if slot1.expAdd ~= 0 then
		slot3:get("firstAdd"):text((slot1.repeatExpAdd == 0 or string.format(gLanguageCsv.townCollectionExpFirstAndRepeat, slot1.expAdd, slot1.repeatExpAdd)) and string.format(gLanguageCsv.townCollectionExpFirst, slot1.expAdd)):show()
	else
		slot3:get("firstAdd"):hide()
		slot3:get("text"):height(150)
	end

	if slot1.myNum == 0 then
		text.deleteAllEffect(slot0.btnGoto:get("txt"))
		slot0.btnGoto:setTouchEnabled(false)
	else
		slot0.btnGoto:setTouchEnabled(true)
		bind.touch(slot0, slot0.btnGoto, {
			methods = {
				ended = function ()
					uv0 = "onGoClick"
					uv2 = "onGoClick"

					slot0:onGoClick(slot2)
				end
			}
		})
	end

	if slot4 then
		slot3:get("series"):text(string.format(gLanguageCsv.townCollectionSeriesName, slot4.name)):show()
		slot3:get("name"):y(slot3:get("series"):y() + 70)
	else
		slot3:get("name"):y(slot3:get("series"):y() + 5)
		slot3:get("series"):hide()
	end

	slot3:removeChildByName("decorate")

	if dataEasy.isTownVisitUnlock() then
		rich.createByStr(string.format("#C0x5B545B#%s#L10#%d", gLanguageCsv.townHomeDecorate, slot1.decorate), 40):anchorPoint(1, 0.5):xy(slot3:get("name"):x() + 800, slot3:get("name"):y()):addTo(slot3, 10, "decorate"):formatText()
	end
end

function slot4.onGoClick(slot0, slot1)
	if slot0.cb then
		slot0.cb(slot1.furID)
		slot0:onClose()
	end
end

function slot4.initSeriesPanelDatas(slot0)
	slot0.seriesCollected:text(gLanguageCsv.townCollectionHad .. itertools.size(slot0.mycollectionData:read().furniture_series))
end

function slot4.onSeriesItemClick(slot0, slot1, slot2, slot3)
	for slot7, slot8 in slot0.seriesDatas:pairs() do
		slot0.seriesDatas:atproxy(slot7).select = false
	end

	slot0.seriesDatas:atproxy(slot3.id).select = true

	slot0:updateSeriesRightPanel(slot3.furniture)
end

function slot4.updateSeriesRightPanel(slot0, slot1)
	for slot6, slot7 in ipairs(slot1) do
		slot2 = 0 + slot7.decorate
	end

	slot0.addDecorate:text(string.format(gLanguageCsv.townAddDecorate, math.ceil(slot1[1].addDrecorate * slot2)))
	slot0.addDecorate:setVisible(slot1[1].addDrecorate ~= 0)
	slot0.seriesFurnitureDatas:update(slot1)
end

return slot4
