slot0 = cc.load("mvc").ViewBase
slot1 = require("app.views.city.card.chip.bag")
slot2 = class("ChipPlanView", slot1)
slot3 = require("app.views.city.card.chip.tools")
slot4 = slot1.ATTR_FILTER_TYPE
slot2.RESOURCE_FILENAME = "chip_plan.json"
slot2.RESOURCE_BINDING = clone(slot1.RESOURCE_BINDING)

table.merge(slot2.RESOURCE_BINDING, {
	["right.btnEditPanel"] = "planBtnEditPanel",
	planSuitFilterPanel = "planSuitFilterPanel",
	["planOrderPanel.panel.subList"] = "planOrderSubList",
	["planOrderPanel.panel.item"] = "planOrderItem",
	["leftPlan.item"] = "planItem",
	["leftPlan.subList"] = "planSubList",
	planOrderPanel = "planOrderPanel",
	["right.btnSavePanel"] = "planBtnSavePanel",
	leftPlan = "leftPlan",
	["planSuitFilterPanel.panel.item"] = "planSuitFilterItem",
	["leftPlan.empty"] = "planEmpty",
	["right.btnEquipPanel"] = "planBtnEquipPanel",
	["right.btnNewPanel"] = "planBtnNewPanel",
	["planSuitFilterPanel.panel.subList"] = "planSuitFilterSubList",
	["left.btnEquip"] = {
		varname = "btnEquipShow",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onEquipShowClick")
			}
		}
	},
	["leftPlan.btnNewPlan"] = {
		varname = "btnLeftPlanNew",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onLeftPlanNewClick")
			}
		}
	},
	["leftPlan.btnNewPlan.txt"] = {
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
	["leftPlan.btnSuitFilter"] = {
		varname = "btnPlanSuitFilter",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPlanSuitFilterClick")
			}
		}
	},
	["leftPlan.btnOrder"] = {
		varname = "btnPlanOrder",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPlanOrderClick")
			}
		}
	},
	["leftPlan.list"] = {
		varname = "planList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				asyncPreload = 12,
				data = bindHelper.self("planData"),
				item = bindHelper.self("planSubList"),
				cell = bindHelper.self("planItem"),
				onCell = function (slot0, slot1, slot2, slot3)
					itertools.invoke(slot1:multiget("bg", "icon", "name", "curName", "newName", "inEquip", "chipPanel", "equipPanel", "inEquipPanel"), "hide")

					slot5 = slot3.data or {}

					if slot3.suitId then
						uv8 = "multiget"

						slot4.icon:show():texture(slot8.getSuitRes(slot3.suitId)):scale(0.9)
					else
						slot4.chipPanel:show()

						slot6 = slot4.chipPanel:get("add")

						slot6:visible(slot3.addNew and not slot3.id or false)

						for slot9 = 1, 6 do
							if slot5.chips and slot5.chips[slot9] then
								slot4.chipPanel:get("chip" .. slot9):show():texture(string.format("city/card/chip/img_dw_%d.png", csv.chip.chips[gGameModel.chips:find(slot5.chips[slot9]):read("chip_id")].quality))
							else
								slot10:hide()
							end
						end
					end

					if slot5.name then
						slot4.name:show():text(slot5.name)
						adapt.setTextScaleWithWidth(slot4.name, nil, 300)
					elseif slot3.addNew then
						slot4.newName:show()
					else
						slot4.curName:show()
					end

					slot4.inEquip:hide()
					slot1:removeChildByName("inEquipRich")

					if slot3.cardDBID ~= nil then
						rich.createWithWidth("#C0x5B545B#" .. gLanguageCsv.chipInEquip .. uiEasy.getCardName(slot3.cardDBID), 26, nil, 300):addTo(slot1, 5, "inEquipRich"):anchorPoint(0, 0.5):xy(slot4.inEquip:xy())
					end

					idlereasy.when(slot0.selectPlanId(), function (slot0, slot1)
						uv3 = "tolua"

						if not tolua.isnull(slot3.bg) then
							uv2 = "tolua"
							slot2 = slot2.bg
							slot2 = slot2.show

							slot2(slot2)

							uv2 = "isnull"

							if not slot2.addNew then
								uv2 = "isnull"

								if slot1 == slot2.id then
									uv2 = "tolua"

									slot2.bg:texture("city/card/chip/panel_sl.png")
								end
							else
								uv2 = "tolua"

								slot2.bg:texture("city/card/chip/panel_up.png")
							end
						end
					end):anonyOnly(slot0, slot3.id)

					if slot3.addNew then
						bind.touch(slot0, slot1, {
							methods = {
								ended = functools.partial(slot0.itemNewClick, slot1, slot2, slot3)
							}
						})
					else
						if slot3.curCard then
							slot4.inEquipPanel:show()
							text.addEffect(slot4.inEquipPanel:get("name"), {
								outline = {
									size = 3,
									color = cc.c4b(250, 88, 103, 255)
								}
							})
						else
							slot4.equipPanel:show()
							text.addEffect(slot4.equipPanel:get("name"), {
								outline = {
									size = 3,
									color = cc.c4b(204, 163, 122, 255)
								}
							})
						end

						bind.touch(slot0, slot1, {
							methods = {
								ended = functools.partial(slot0.itemClick, slot1, slot2, slot3)
							}
						})
						bind.touch(slot0, slot4.equipPanel, {
							methods = {
								ended = functools.partial(slot0.equipClick, slot1, slot2, slot3)
							}
						})
					end
				end
			},
			handlers = {
				itemNewClick = bindHelper.self("onPlanItemNewClick"),
				itemClick = bindHelper.self("onPlanItemClick"),
				equipClick = bindHelper.self("onPlanItemEquipClick"),
				selectPlanId = bindHelper.self("selectPlanId")
			}
		}
	},
	["right.namePanel"] = {
		varname = "planNamePanel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPlanNameClick")
			}
		}
	},
	["right.btnNewPanel.btnNew"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRightPlanNewClick")
			}
		}
	},
	["right.btnNewPanel.btnNew.txt"] = {
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
	["right.btnSavePanel.btnSave"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPlanSaveClick")
			}
		}
	},
	["right.btnSavePanel.btnSave.txt"] = {
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
	["right.btnEditPanel.btnDelete"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPlanDeleteClick")
			}
		}
	},
	["right.btnEditPanel.btnTop"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPlanTopClick")
			}
		}
	},
	["right.btnEditPanel.btnEdit"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPlanEditClick")
			}
		}
	},
	["right.btnEditPanel.btnEdit.txt"] = {
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
	["right.btnEquipPanel.btnDelete"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPlanDeleteClick")
			}
		}
	},
	["right.btnEquipPanel.btnTop"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPlanTopClick")
			}
		}
	},
	["right.btnEquipPanel.btnEdit"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPlanEditClick")
			}
		}
	},
	["right.btnEquipPanel.btnEdit.txt"] = {
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
	["right.btnEquipPanel.btnEquip"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPlanEquipClick")
			}
		}
	},
	["right.btnEquipPanel.btnEquip.txt"] = {
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
	["planSuitFilterPanel.panel.list"] = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				data = bindHelper.self("planSuitFilterData"),
				item = bindHelper.self("planSuitFilterSubList"),
				cell = bindHelper.self("planSuitFilterItem"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:get("bg"):visible(slot3.selected ~= true)
					slot1:get("bgSelected"):visible(slot3.selected == true)

					slot4, slot5 = nil
					slot6 = 1

					if slot3.suitId == -1 then
						slot4 = "city/card/chip/icon_qb.png"
						slot5 = gLanguageCsv.all
					elseif slot3.suitId == 0 then
						slot4 = "city/card/chip/icon_wtz.png"
						slot5 = gLanguageCsv.noSuit
					else
						slot4 = slot3.cfg.suitIcon
						slot5 = slot3.cfg.suitName
						slot6 = 0.9
					end

					slot1:get("icon"):texture(slot4):scale(slot6)
					slot1:get("name"):text(slot5)
					adapt.setTextScaleWithWidth(slot1:get("name"), nil, 170)
					slot1:get("count"):text(gLanguageCsv.have .. ": " .. slot3.count)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.itemClick, slot1, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onPlanSuitFilterItemClick")
			}
		}
	},
	["planOrderPanel.panel.list"] = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 3,
				data = bindHelper.self("planOrderData"),
				item = bindHelper.self("planOrderSubList"),
				cell = bindHelper.self("planOrderItem"),
				onCell = function (slot0, slot1, slot2, slot3)
					adapt.setTextScaleWithWidth(slot1:get("name"), slot3.name, 240)

					if slot3.selected then
						slot1:get("icon"):texture("city/card/chip/btn_r.png")
						text.addEffect(slot1:get("name"), {
							color = ui.COLORS.NORMAL.WHITE
						})
					else
						slot1:get("icon"):texture("city/card/chip/btn_w.png")
						text.addEffect(slot1:get("name"), {
							color = ui.COLORS.NORMAL.RED
						})
					end

					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.itemClick, slot1, slot0:getIdx(slot2), slot3)
						}
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onPlanOrderItemClick")
			}
		}
	},
	["right.chipPanel"] = {
		varname = "chipPanel",
		binds = {
			event = "extend",
			class = "chips_panel",
			props = {
				panelIdx = 2,
				showSuitEffect = true,
				data = bindHelper.self("curChipPlan"),
				slotFlags = bindHelper.self("slotFlags"),
				selected = bindHelper.self("selectRightPos"),
				onItem = function (slot0, slot1, slot2, slot3)
					if slot3 then
						slot1:get("defaultLv"):y(0)
					end
				end
			}
		}
	},
	["right.baseAttrPanel.list"] = {
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				data = bindHelper.self("baseAttrData"),
				item = bindHelper.self("baseAttrSubList"),
				cell = bindHelper.self("baseAttrItem"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("icon", "text", "val", "up1", "upVal", "upIcon", "up2")

					slot4.icon:texture(ui.ATTR_LOGO[slot3.attr])
					slot4.text:text(getLanguageAttr(slot3.key))

					if type(slot3.val) == "table" then
						itertools.invoke({
							slot4.up1,
							slot4.upVal,
							slot4.upIcon,
							slot4.up2
						}, "show")
						slot4.val:text(slot3.val[1])
						slot4.upVal:text(slot3.val[4])

						if slot3.val[3] == 0 then
							slot4.upIcon:hide()
							text.addEffect(slot4.upVal, {
								color = cc.c4b(183, 176, 158, 255)
							})
						elseif slot3.val[3] > 0 then
							slot4.upIcon:texture("common/icon/logo_arrow_green.png")
							text.addEffect(slot4.upVal, {
								color = ui.COLORS.NORMAL.FRIEND_GREEN
							})
						else
							slot4.upIcon:texture("common/icon/logo_arrow_red.png")
							text.addEffect(slot4.upVal, {
								color = ui.COLORS.NORMAL.ALERT_ORANGE
							})
						end

						adapt.oneLinePos(slot4.text, {
							slot4.val,
							slot4.up1
						})
						adapt.oneLinePos(slot4.up1, {
							slot4.upVal,
							slot4.upIcon,
							slot4.up2
						})
					else
						itertools.invoke({
							slot4.up1,
							slot4.upVal,
							slot4.upIcon,
							slot4.up2
						}, "hide")
						slot4.val:text("+" .. slot3.val)
						adapt.oneLinePos(slot4.text, slot4.val)
					end
				end
			}
		}
	},
	["right.baseAttrPanel.btnDetail"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBaseAttrDetailClick")
			}
		}
	},
	["right.suitAttrPanel.btnDetail"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSuitAttrDetailClick")
			}
		}
	}
})

slot2.RESOURCE_STYLES = {
	full = true
}

function slot2.onCreate(slot0, slot1)
	slot1 = slot1 or {}
	slot1.itemWidthExtra = 40
	slot0.page = slot1.page or 1
	slot0.selectPlanId = idler.new()
	slot0.curChipPlan = idlereasy.new({})
	slot0.planData = idlers.newWithMap({})
	slot0.planSuitFilterData = idlers.newWithMap({})
	slot0.planOrderData = idlers.newWithMap({})
	slot2 = idler.new(false)
	slot0.showCard = slot2
	uv2 = "itemWidthExtra"

	slot2.onCreate(slot0, slot1)

	slot2 = gLanguageCsv.chipPlan
	slot3 = "CHIP PLAN"

	if slot0.page == 2 then
		slot2 = gLanguageCsv.chipPlanBag
		slot3 = "CHIP PLAN BAG"
	end

	slot0.topuiView:updateTitle(slot2, slot3)
	slot0.right:stopAllActions()
	slot0.right:x(slot0.originRightPos.x)

	slot0.midColumnSize = slot0.midColumnSize + 1
	slot0.asyncPreload = slot0.midColumnSize * 5
	slot4 = cc.p(slot0.leftPlan:xy())

	slot0.leftPlan:x(slot4.x - slot0.leftPlan:width() - 100)
	slot0.leftPlan:runAction(cc.MoveTo:create(0.4, slot4))
	slot0.left:visible(slot0.page == 2)
	slot0.leftPlan:visible(slot0.page == 1)
	adapt.dockWithScreen(slot0.leftPlan, "left")
	adapt.dockWithScreen(slot0.planSuitFilterPanel:get("panel"), "left")
	adapt.dockWithScreen(slot0.planOrderPanel:get("panel"), "left")

	slot0.chipPlans = gGameModel.role:getIdler("chip_plans")

	slot0.selectPlanId:set(slot1.planId)

	if slot0.page == 2 then
		slot0.curChipPlan:set(table.deepcopy(slot0.chipPlans:read()[slot0.selectPlanId:read()] and slot5[slot6].chips or {}, true))
	end

	idlereasy.any({
		slot0.selectPlanId,
		slot0.cardChips,
		slot0.chipPlans,
		slot0.isRefreshBagPanel
	}, function (slot0, slot1, slot2, slot3)
		uv4 = "setPlanName"

		slot4:setPlanName()

		slot5 = {
			slot6,
			slot6,
			slot6,
			slot6.planBtnEquipPanel
		}
		uv6 = "setPlanName"
		uv6 = "setPlanName"
		uv6 = "setPlanName"
		slot6 = slot6.planBtnNewPanel.planBtnSavePanel.planBtnEditPanel
		uv6 = "setPlanName"

		itertools.invoke(slot5, "hide")

		slot4 = false
		uv5 = "setPlanName"

		if slot5.page == 2 then
			uv5 = "setPlanName"

			slot5.planBtnSavePanel:show()
		elseif not slot1 then
			slot4 = true
			uv5 = "setPlanName"
			slot5 = slot5.curChipPlan
			slot5 = slot5.set

			slot5(slot5, table.deepcopy(slot2, true))

			uv5 = "setPlanName"

			slot5.planBtnNewPanel:show()
		else
			uv5 = "setPlanName"
			slot5 = slot5.curChipPlan
			slot5 = slot5.set

			slot5(slot5, table.deepcopy(slot3[slot1] and slot3[slot1].chips or {}, true))

			uv5 = "setPlanName"

			if slot5.cardChipsPlanId == slot1 then
				slot4 = true
				uv5 = "setPlanName"

				slot5.planBtnEditPanel:show()
			else
				uv5 = "setPlanName"

				slot5.planBtnEquipPanel:show()
			end
		end

		uv5 = "setPlanName"

		slot5.showCard:set(slot4, true)
	end)

	slot0.curChipPlanIdler_ = {}

	idlereasy.when(slot0.showCard, function ()
		uv1 = "pairs"

		for slot3, slot4 in pairs(slot1.curChipPlanIdler_) do
			slot4:destroy()
		end

		uv0 = "pairs"
		slot0.curChipPlanIdler_ = {}
		uv0 = "pairs"

		for slot4 = 1, 6 do
			if slot0.curChipPlan:read()[slot4] then
				slot6 = gGameModel.chips:find(slot5)
				slot8 = slot6
				uv8 = "pairs"

				function slot11()
					uv0 = "showPanel"

					slot0:showPanel()
				end

				uv11 = "pairs"
				slot8.curChipPlanIdler_[slot5] = idlereasy.any(slot6.multigetIdler(slot8, "level", "now"), slot11, true):anonyOnly(slot11, stringz.bintohex(slot5))
			end
		end

		uv1 = "pairs"

		slot1:showPanel()
	end)
	slot0.planSuitFilterPanel:hide()
	bind.click(slot0, slot0.planSuitFilterPanel, {
		method = function ()
			uv0 = "planSuitFilterPanel"
			slot0 = slot0.planSuitFilterPanel
			slot0 = slot0.hide

			slot0(slot0)

			uv0 = "planSuitFilterPanel"

			slot0.btnPlanSuitFilter:get("arrow"):setFlippedY(false)
		end
	})

	slot0.selectPlanSuitId = idler.new(-1)

	idlereasy.when(slot0.selectPlanSuitId, function (slot0, slot1)
		uv2 = "planList"
		slot2 = slot2.planList
		slot2 = slot2.jumpToTop

		slot2(slot2)

		uv2 = "planList"
		slot2 = slot2.planSuitFilterPanel
		slot2 = slot2.hide

		slot2(slot2)

		uv2 = "planList"

		slot2.btnPlanSuitFilter:get("arrow"):setFlippedY(false)

		slot2 = gLanguageCsv.chipPlanSuitFilter

		if slot1 == 0 then
			slot2 = gLanguageCsv.noSuit
		elseif slot1 > 0 then
			slot2 = gChipSuitCsv[slot1][2][2].suitName
		end

		uv3 = "planList"
		slot3 = slot3.btnPlanSuitFilter:get("txt")
		slot4 = slot3

		slot3.text(slot4, slot2)

		uv4 = "planList"

		adapt.setTextScaleWithWidth(slot4.btnPlanSuitFilter:get("txt"), nil, 200)
	end)
	slot0.planOrderPanel:hide()
	bind.click(slot0, slot0.planOrderPanel, {
		method = function ()
			uv0 = "planOrderPanel"
			slot0 = slot0.planOrderPanel
			slot0 = slot0.hide

			slot0(slot0)

			uv0 = "planOrderPanel"

			slot0.btnPlanOrder:get("arrow"):setFlippedY(false)
		end
	})

	slot0.selectPlanOrder = idler.new()

	idlereasy.when(slot0.selectPlanOrder, function (slot0, slot1)
		uv2 = "planList"
		slot2 = slot2.planList
		slot2 = slot2.jumpToTop

		slot2(slot2)

		uv2 = "planList"
		slot2 = slot2.planOrderPanel
		slot2 = slot2.hide

		slot2(slot2)

		uv2 = "planList"

		slot2.btnPlanOrder:get("arrow"):setFlippedY(false)

		if slot1 then
			uv2 = "jumpToTop"

			if not slot2.getAttrName(slot1) then
				slot2 = gLanguageCsv.chipPlanOrderDefault
			end
		end

		uv4 = "planList"

		adapt.setTextScaleWithWidth(slot4.btnPlanOrder:get("txt"), slot2, 200)
	end)

	slot0.isRefreshPlanPanel = idler.new(true)

	if slot0.page == 1 then
		slot5 = 0

		idlereasy.any({
			slot0.isRefreshPlanPanel,
			slot0.selectPlanSuitId,
			slot0.selectPlanOrder,
			slot0.chipPlans,
			slot0.cardChips
		}, function ()
			uv0 = "refreshLeftPlanPanel"
			uv0 = 1
			uv0 = "refreshLeftPlanPanel"

			if slot0 + 1 > 0 then
				uv0 = slot1
				uv0 = "refreshLeftPlanPanel"

				slot0:refreshLeftPlanPanel()
			end
		end)
	end

	slot0.equipShow = idler.new(true)

	idlereasy.when(slot0.equipShow, function (slot0, slot1)
		if slot1 then
			uv2 = "btnEquipShow"
			slot2 = slot2.btnEquipShow:get("img")
			slot2 = slot2.texture

			slot2(slot2, "common/btn/btn_nomal_3.png")

			uv2 = "btnEquipShow"
			slot2 = slot2.btnEquipShow:get("icon")
			slot2 = slot2.texture

			slot2(slot2, "city/card/chip/icon_xs.png")

			uv2 = "btnEquipShow"
			slot2 = slot2.btnEquipShow:get("txt")
			slot3 = slot2

			slot2.text(slot3, gLanguageCsv.chipPlanEquipShow)

			uv3 = "btnEquipShow"

			text.addEffect(slot3.btnEquipShow:get("txt"), {
				color = ui.COLORS.NORMAL.RED
			})
		else
			uv2 = "btnEquipShow"
			slot2 = slot2.btnEquipShow:get("img")
			slot2 = slot2.texture

			slot2(slot2, "common/btn/btn_nomal_2.png")

			uv2 = "btnEquipShow"
			slot2 = slot2.btnEquipShow:get("icon")
			slot2 = slot2.texture

			slot2(slot2, "city/card/chip/icon_yc.png")

			uv2 = "btnEquipShow"
			slot2 = slot2.btnEquipShow:get("txt")
			slot3 = slot2

			slot2.text(slot3, gLanguageCsv.chipPlanEquipHide)

			uv3 = "btnEquipShow"

			text.addEffect(slot3.btnEquipShow:get("txt"), {
				color = ui.COLORS.NORMAL.WHITE
			})
		end

		slot2 = adapt.setTextScaleWithWidth
		uv3 = "btnEquipShow"

		slot2(slot3.btnEquipShow:get("txt"), nil, 200)

		uv2 = "btnEquipShow"

		slot2.isRefreshBagPanel:notify()
	end)
end

function slot2.refreshLeftPlanPanel(slot0)
	slot2 = slot0.chipPlans:read()

	if slot0.isPlanAddNew or not slot2[slot0.selectPlanId:read()] then
		slot1 = nil
	end

	slot3 = {}
	slot4 = nil
	slot5 = slot0.selectCardDBID:read()
	slot6 = slot0.cardChips:read()

	if slot1 and itertools.size(slot6) > 0 and itertools.equal(slot6, slot2[slot1].chips) then
		slot4 = slot1
	end

	for slot10, slot11 in pairs(slot2) do
		slot12 = nil
		uv13 = "selectPlanId"

		for slot17, slot18 in pairs(slot13.getSuitAttrByCard(slot11.chips)) do
			if slot18[2] and slot18[2][3] == true then
				slot12 = slot17
			end
		end

		uv14 = "selectPlanId"
		slot14 = slot14.getCardDBID(slot11.chips)

		if not slot4 and slot14 == slot5 then
			slot4 = slot10
		end

		slot18 = slot4 == slot10
		uv18 = "selectPlanId"

		table.insert(slot3, {
			id = slot10,
			data = slot11,
			suitId = slot12,
			addNew = slot0.isPlanAddNew,
			cardDBID = slot14,
			curCard = slot18,
			attrsValue = slot18.getAttrsValue(slot11.chips)
		})
	end

	slot0.cardChipsPlanId = slot4

	if slot0.isPlanAddNew then
		slot10 = slot0.isPlanAddNew
		uv10 = "selectPlanId"

		table.insert(slot3, {
			addNew = slot10,
			attrsValue = slot10.getAttrsValue()
		})
	else
		if not slot4 then
			slot7 = nil
			uv8 = "selectPlanId"

			for slot12, slot13 in pairs(slot8.getSuitAttrByCard(slot6)) do
				if slot13[2] and slot13[2][3] == true then
					slot7 = slot12
				end
			end

			slot12 = slot0.isPlanAddNew
			uv12 = "selectPlanId"

			table.insert(slot3, {
				curCard = true,
				data = {
					chips = slot6
				},
				suitId = slot7,
				addNew = slot12,
				attrsValue = slot12.getAttrsValue(slot6)
			})
		end

		slot1 = slot1 or slot4
	end

	slot0.planDataAll = slot3

	if slot0.selectPlanSuitId:read() >= 0 then
		slot9 = {}

		for slot14, slot15 in ipairs(slot3) do
			if function (slot0)
				if slot0.id then
					uv1 = "id"

					if slot1 == 0 then
						if slot0.suitId then
							return false
						end
					else
						uv1 = "id"

						if slot1 > 0 then
							uv1 = "id"

							if slot1 ~= slot0.suitId then
								return false
							end
						end
					end
				end

				return true, id
			end(slot15) then
				table.insert(slot9, slot15)

				if slot15.id then
					-- Nothing
				end
			end
		end

		slot3 = slot9

		if not ({
			[slot15.id] = true
		})[slot1] then
			slot1 = nil
		end
	end

	slot8 = slot0.selectPlanOrder:read()

	table.sort(slot3, function (slot0, slot1)
		if not slot0.id or not slot1.id then
			return not slot0.id
		end

		uv2 = "id"

		if slot2 then
			uv3 = "id"
			uv4 = "id"
			slot3 = slot1.attrsValue[1][slot4]

			if slot0.attrsValue[1][slot3] and slot3 then
				if slot2 ~= slot3 then
					return tonumber(slot3) < tonumber(slot2)
				end
			elseif slot2 or slot3 then
				return slot2
			end

			uv5 = "id"
			uv6 = "id"
			slot5 = slot1.attrsValue[2][slot6]

			if slot0.attrsValue[2][slot5] and slot5 then
				if slot4 ~= slot5 then
					return tonumber(string.sub(slot5, 1, #slot5 - 1)) < tonumber(string.sub(slot4, 1, #slot4 - 1))
				end
			elseif slot4 or slot5 then
				return slot4
			end
		end

		return slot1.data.created_time < slot0.data.created_time
	end)
	slot0.selectPlanId:set(slot1 or slot3[1].id, true)
	dataEasy.tryCallFunc(slot0.planList, "updatePreloadCenterIndexAdaptFirst")
	slot0.planData:update(slot3)
end

function slot2.onLeftPlanNewClick(slot0)
	slot2 = 0

	for slot6 = 1, table.maxn(slot0.chipPlans:read()) + 1 do
		if not slot1[slot6] then
			slot2 = slot6

			break
		end
	end

	gGameApp:requestServer("/game/chip/plan/new", function ()
		uv0 = "planList"
		slot0 = slot0.planList
		slot0 = slot0.jumpToTop

		slot0(slot0)

		uv0 = "planList"
		slot0 = slot0.selectPlanId
		slot0 = slot0.set
		uv2 = "jumpToTop"

		slot0(slot0, slot2)

		uv0 = "planList"

		slot0.isRefreshPlanPanel:notify()
	end, {}, gLanguageCsv.planNew)
end

function slot2.onSuitFilterClick(slot0)
	uv1 = "onSuitFilterClick"

	slot1.onSuitFilterClick(slot0, true)
end

function slot2.onPlanSuitFilterClick(slot0)
	slot0.btnPlanSuitFilter:get("arrow"):setFlippedY(true)

	slot1 = {
		[-1.0] = 0
	}

	for slot5, slot6 in pairs(slot0.planDataAll) do
		slot1[-1] = slot1[-1] + 1

		if slot6.id then
			slot7 = slot6.suitId or 0
			slot1[slot7] = slot1[slot7] or 0
			slot1[slot7] = slot1[slot7] + 1
		end
	end

	slot3 = {}

	for slot7, slot8 in pairs(slot1) do
		table.insert(slot3, {
			suitId = slot7,
			count = slot8,
			selected = slot0.selectPlanSuitId:read() == slot7,
			cfg = slot7 > 0 and gChipSuitCsv[slot7][2][2]
		})
	end

	table.sort(slot3, function (slot0, slot1)
		return slot0.suitId < slot1.suitId
	end)
	slot0.planSuitFilterData:update(slot3)
	slot0.planSuitFilterPanel:show()
end

function slot2.onPlanOrderClick(slot0)
	slot0.btnPlanOrder:get("arrow"):setFlippedY(true)

	slot2 = {
		{
			name = gLanguageCsv.default,
			selected = slot0.selectPlanOrder:read() == nil
		}
	}
	uv4 = "btnPlanOrder"

	for slot6, slot7 in ipairs(slot4) do
		slot8 = game.ATTRDEF_ENUM_TABLE[slot7]
		uv12 = "get"

		table.insert(slot2, {
			id = slot8,
			name = slot12.getAttrName(slot8),
			selected = slot1 == slot8
		})
	end

	slot0.planOrderData:update(slot2)
	slot0.planOrderPanel:show()
end

function slot2.onPlanItemNewClick(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0.curChipPlan:read()

	if slot4.id then
		function slot6()
			uv4 = "requestServer"
			uv5 = "/game/chip/plan/edit"

			gGameApp:requestServer("/game/chip/plan/edit", function ()
				uv0 = "selectPlanId"
				slot0 = slot0.selectPlanId
				slot0 = slot0.set
				uv2 = "set"

				slot0(slot0, slot2.id)

				uv0 = "selectPlanId"

				slot0:onPlanMaskClose()
			end, slot4.id, slot5)
		end

		if userDefault.getCurrDayKey("chipPlanItemNewTip", "first") == "first" then
			userDefault.setCurrDayKey(slot7, "true")
		end

		if (slot8 == "first" or slot8 == "true") and not itertools.isempty(slot4.data.chips) then
			gGameUI:showDialog({
				isRich = true,
				selectType = 2,
				btnType = 2,
				content = {
					"#C0x5B545B#" .. gLanguageCsv.chipPlanItemNewTip,
					"#C0xF76B45#(" .. slot4.data.name .. ")"
				},
				cb = slot6,
				selectKey = slot7,
				selectTip = gLanguageCsv.todayNoTip
			})
		else
			slot6()
		end
	else
		slot7 = 0

		for slot11 = 1, table.maxn(slot0.chipPlans:read()) + 1 do
			if not slot6[slot11] then
				slot7 = slot11

				break
			end
		end

		gGameApp:requestServer("/game/chip/plan/new", function ()
			uv0 = "onPlanMaskClose"

			slot0:onPlanMaskClose()
		end, slot5, gLanguageCsv.planNew)
	end
end

function slot2.onPlanItemClick(slot0, slot1, slot2, slot3, slot4)
	slot0.selectPlanId:set(slot4.id)
end

function slot2.onPlanItemEquipClick(slot0, slot1, slot2, slot3, slot4)
	slot0:onPlanEquipClick(slot4.data)
end

function slot2.setPlanName(slot0, slot1)
	slot3 = slot0.chipPlans:read()

	if slot0.selectPlanId:read() and slot3[slot2] then
		slot0.planNamePanel:show()
		slot0.planNamePanel:get("name"):text(slot3[slot2].name)
		adapt.oneLineCenterPos(cc.p(slot0.planNamePanel:width() / 2, slot0.planNamePanel:height() / 2), {
			slot0.planNamePanel:get("name"),
			slot0.planNamePanel:get("icon")
		}, cc.p(10, 0))
	else
		slot0.planNamePanel:hide()
	end
end

function slot2.onPlanNameClick(slot0)
	slot1 = nil
	slot3 = slot0.chipPlans:read()

	if slot0.selectPlanId:read() and slot3[slot2] then
		slot1 = slot3[slot2].name
	end

	gGameUI:stackUI("city.card.changename", nil, , {
		typ = "plan",
		noBlackList = true,
		requestParamsCount = 2,
		name = slot1,
		titleTxt = gLanguageCsv.changPlanName,
		requestParams = {
			slot0.selectPlanId:read()
		},
		customCheck = function (slot0)
			uv2 = "pairs"

			for slot4, slot5 in pairs(slot2) do
				if slot0 == slot5.name then
					gGameUI:showTip(gLanguageCsv.planNameSame)

					return false
				end
			end

			return true
		end
	})
end

function slot2.onRightPlanNewClick(slot0)
	slot0.isPlanAddNew = true

	slot0.isRefreshPlanPanel:notify()

	slot0.planMaskView = gGameUI:createView("city.card.chip.plan_mask", slot0):init({
		onClose = slot0:createHandler("onPlanMaskClose")
	})
end

function slot2.onPlanMaskClose(slot0)
	if slot0.planMaskView then
		slot0.planMaskView:onClose()

		slot0.planMaskView = nil
	end

	slot0.isPlanAddNew = false

	slot0.isRefreshPlanPanel:notify()
end

function slot2.onPlanSaveClick(slot0)
	gGameApp:requestServer("/game/chip/plan/edit", function ()
		slot0 = gGameUI
		slot0 = slot0.showTip

		slot0(slot0, gLanguageCsv.planSaved)

		uv0 = "gGameUI"

		if slot0.page == 2 then
			uv0 = "gGameUI"

			slot0:onClose()
		else
			uv0 = "gGameUI"

			slot0.isRefreshPlanPanel:notify()
		end
	end, slot0.selectPlanId:read(), slot0.curChipPlan:read())
end

function slot2.onPlanDeleteClick(slot0)
	slot1 = slot0.selectPlanId:read()

	function slot2()
		uv4 = "requestServer"

		gGameApp:requestServer("/game/chip/plan/delete", function ()
			uv0 = "selectPlanId"
			slot0 = slot0.selectPlanId
			slot0 = slot0.set

			slot0(slot0, nil)

			uv0 = "selectPlanId"

			slot0.isRefreshPlanPanel:notify()
		end, slot4)
	end

	slot3 = slot0.chipPlans:read()

	if userDefault.getCurrDayKey("chipPlanDeleteTip", "first") == "first" then
		userDefault.setCurrDayKey(slot4, "true")
	end

	if (slot5 == "first" or slot5 == "true") and slot3[slot1] and not itertools.isempty(slot3[slot1].chips) then
		gGameUI:showDialog({
			isRich = true,
			selectType = 2,
			btnType = 2,
			content = {
				"#C0x5B545B#" .. gLanguageCsv.chipPlanDeleteTip,
				"#C0xF76B45#(" .. slot3[slot1].name .. ")"
			},
			cb = slot2,
			selectKey = slot4,
			selectTip = gLanguageCsv.todayNoTip
		})
	else
		slot2()
	end
end

function slot2.onPlanTopClick(slot0)
	gGameApp:requestServer("/game/chip/plan/edit", function ()
		uv0 = "isRefreshPlanPanel"

		slot0.isRefreshPlanPanel:notify()
	end, slot0.selectPlanId:read(), nil, , true)
end

function slot2.onPlanEditClick(slot0)
	gGameUI:stackUI("city.card.chip.plan", nil, , {
		page = 2,
		planId = slot0.selectPlanId:read(),
		cb = slot0:createHandler("planEditCb")
	})
end

function slot2.planEditCb(slot0)
	slot0.isRefreshPlanPanel:notify()
end

function slot2.onPlanEquipClick(slot0, slot1)
	if not slot0.cardChipsPlanId and not itertools.isempty(slot0.cardChips:read()) then
		gGameUI:showDialog({
			btnType = 1,
			clearFast = true,
			content = gLanguageCsv.chipPlanEquipTip,
			cb = function ()
				uv0 = "selectCardDBID"
				slot0 = slot0.selectCardDBID:read()
				slot1 = nil
				uv3 = "read"

				if type(slot3) ~= "table" then
					uv2 = "selectCardDBID"
					slot1 = slot2.curChipPlan:read()
				else
					uv2 = "read"
					slot1 = slot2.chips
				end

				function slot2()
					for slot3 = 1, 6 do
						uv4 = "gGameApp"

						if not slot4[slot3] then
							uv4 = "gGameApp"
							slot4[slot3] = -1
						end
					end

					uv4 = "/game/card/chip/change"
					uv5 = "gGameApp"

					gGameApp:requestServer("/game/card/chip/change", function (slot0)
						slot1 = gGameUI
						slot1 = slot1.showTip

						slot1(slot1, gLanguageCsv.exchange2Success)

						uv1 = "gGameUI"
						slot1 = slot1.selectPlanId
						slot1 = slot1.set

						slot1(slot1, nil)

						uv1 = "gGameUI"

						slot1.isRefreshPlanPanel:notify()
					end, slot4, slot5)
				end

				for slot6, slot7 in pairs(table.deepcopy(slot1, true)) do
					if gGameModel.chips:find(slot7):read("card_db_id") and slot9 ~= slot0 then
						gGameUI:stackUI("city.card.chip.plan_equip_tip", nil, , {
							chips = slot1,
							cb = slot2
						})

						return
					end
				end

				slot2()
			end
		})
	else
		slot2()
	end
end

function slot2.onPlanSuitFilterItemClick(slot0, slot1, slot2, slot3, slot4)
	slot0.selectPlanSuitId:set(slot4.suitId, true)
end

function slot2.onPlanOrderItemClick(slot0, slot1, slot2, slot3, slot4)
	slot0.selectPlanOrder:set(slot4.id, true)
end

function slot2.onEquipShowClick(slot0)
	slot0.equipShow:modify(function (slot0)
		return true, not slot0
	end)
end

function slot2.onClose(slot0)
	if slot0.page == 2 and not itertools.equal(slot0.chipPlans:read()[slot0.selectPlanId:read()].chips, slot0.curChipPlan:read()) then
		gGameUI:showDialog({
			btnType = 1,
			clearFast = true,
			content = gLanguageCsv.chipPlanBagCloseTip,
			cb = function ()
				uv0 = "onClose"
				uv1 = "onClose"

				slot0.onClose(slot1)
			end
		})

		return
	end

	uv1 = "page"

	slot1.onClose(slot0)
end

function slot2.showPanel(slot0)
	slot2 = nil

	if slot0.page == 1 and not slot0.showCard:read() then
		uv3 = "curChipPlan"
		slot2 = slot3.getAttrsValueCmp(slot0.curChipPlan:read(), slot0.cardChips:read())
	else
		uv3 = "curChipPlan"
		slot2 = slot3.getAttrsValue(slot1)
	end

	slot3 = {}

	for slot7, slot8 in ipairs(game.ATTRDEF_SIMPLE_TABLE) do
		if slot2[1][game.ATTRDEF_ENUM_TABLE[slot8]] then
			table.insert(slot3, {
				attr = slot8,
				key = slot9,
				val = slot2[1][slot9]
			})
		end
	end

	slot0.baseAttrData:set(slot3)
	slot0.baseAttrTip:visible(#slot3 == 0)

	slot4 = {}
	uv5 = "curChipPlan"

	for slot9, slot10 in pairs(slot5.getComplateSuitAttrByCard(slot1)) do
		for slot15, slot16 in ipairs(slot10.data) do
			if slot16[3] then
				slot11 = math.max(0, slot16[1])
			end
		end

		if slot11 > 0 then
			table.insert(slot4, {
				suitId = slot10.suitId,
				maxActiveNum = slot11,
				data = slot10.data
			})
		end
	end

	slot0.suitAttrData:set(slot4)
	slot0.suitAttrTip:visible(#slot4 == 0)
end

function slot2.setCardDBID(slot0, slot1)
	if not slot1 then
		return
	end

	slot3 = gGameModel.cards:find(slot1):read("card_id", "skin_id", "level", "star", "advance")

	bind.extend(slot0, slot0.cardPanel, {
		class = "card_icon",
		props = {
			unitId = dataEasy.getUnitId(slot3.card_id, slot3.skin_id),
			advance = slot3.advance,
			rarity = csv.unit[csv.cards[slot3.card_id].unitID].rarity,
			dbid = slot1,
			star = slot3.star,
			levelProps = {
				data = slot3.level
			},
			onNode = function (slot0)
				uv3 = "alignCenter"

				slot0:alignCenter(slot3.cardPanel:size()):scale(0.9)
			end
		}
	})
	slot0.selectPlanId:set(nil)
	slot0.selectCardDBID:set(slot1)
	performWithDelay(slot0, function ()
		uv1 = "idlereasy"

		function slot2(slot0, slot1)
			uv2 = "cardPanel"

			slot2.cardPanel:visible(slot1)

			for slot5 = 1, 6 do
				uv6 = "cardPanel"

				slot6.chipPanel:getItem(slot5):get("effect_line"):visible(not slot1):scale(1.2)
			end
		end

		slot0 = idlereasy.when(slot1.showCard, slot2)
		slot1 = slot0
		uv2 = "idlereasy"

		slot0.anonyOnly(slot1, slot2)

		uv1 = "idlereasy"

		function slot2(slot0, slot1)
			for slot5 = 1, 6 do
				uv6 = "chipPanel"

				slot6.chipPanel:getItem(slot5):setTouchEnabled(false)

				if slot1[slot5] then
					slot9 = gGameModel.chips:find(slot7):read("chip_id", "card_db_id", "level")

					slot6:setTouchEnabled(true)

					uv14 = "chipPanel"
					uv15 = "chipPanel"

					slot6:onTouch(functools.partial(slot14.onCardChipClick, slot15, slot6, slot5, {
						dbId = slot7,
						chipId = slot9.chip_id,
						level = slot9.level,
						cfg = csv.chip.chips[slot9.chip_id]
					}))
				else
					uv8 = "chipPanel"

					if slot8.page == 2 then
						slot6:setTouchEnabled(true)
						slot6:onTouch(function (slot0)
							if slot0.name == "ended" then
								uv1 = "name"
								slot1 = slot1.selectLeftPos
								slot1 = slot1.set
								uv3 = "ended"

								slot1(slot1, slot3)

								uv1 = "name"
								uv3 = "ended"

								slot1.selectRightPos:set(slot3)
							end
						end)
					end
				end
			end
		end

		uv2 = "idlereasy"

		idlereasy.when(slot1.curChipPlan, slot2):anonyOnly(slot2)
	end, 0)
end

function slot2.refreshLeftPanel(slot0)
	if slot0.page == 1 then
		return
	end

	slot2 = slot0.selectLeftPos:read()
	slot3 = slot0.selectSuitId:read()
	slot4 = slot0.selectAttrIds:read()
	slot5 = slot0.equipShow:read()
	slot6 = {}
	slot7 = {}

	function slot8(slot0, slot1)
		uv2 = "pos"

		if slot2 then
			uv2 = "pos"

			if slot2 ~= slot0.pos then
				return false
			end
		end

		uv2 = "suitID"

		if slot2 then
			uv2 = "suitID"

			if slot2 ~= slot0.suitID then
				return false
			end
		end

		uv3 = "itertools"

		if itertools.size(slot3) > 0 then
			uv2 = "size"
			slot2, slot3 = slot2.getAttrs({
				slot1
			})
			uv5 = "itertools"

			for slot7, slot8 in pairs(slot5) do
				if not slot3[1][slot7] and not slot3[2][slot7] then
					return false
				end
			end
		end

		return true
	end

	slot9 = itertools.map(slot0.curChipPlan:read(), function (slot0, slot1)
		return slot1, true
	end)

	for slot13, slot14 in ipairs(slot0.roleChips:read()) do
		slot16 = gGameModel.chips:find(slot14):read("chip_id", "card_db_id", "level", "locked")
		slot17 = csv.chip.chips[slot16.chip_id]
		slot18 = nil

		if slot16.card_db_id then
			slot19 = gGameModel.cards:find(slot16.card_db_id)
			slot18 = dataEasy.getUnitId(slot19:read("card_id"), slot19:read("skin_id"))
		end

		if slot8(slot17, slot14) then
			slot6[slot14] = {
				idx = slot13,
				dbId = slot14,
				unitId = slot18,
				chipId = slot16.chip_id,
				level = slot16.level,
				locked = slot16.locked,
				equipShow = slot5,
				cfg = slot17,
				grayState = slot9[slot14] and 1 or 0
			}

			if slot3 then
				slot7[slot17.pos] = true
			end
		end
	end

	dataEasy.tryCallFunc(slot0.bagList, "updatePreloadCenterIndexAdaptFirst")
	slot0.bagData:update(slot6)
	slot0.slotFlags:set(slot7)
	slot0.empty:visible(itertools.size(slot6) == 0)
end

function slot2.onItemTouch(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot5.name == "ended" or slot5.name == "cancelled" then
		if not slot0.moved then
			slot0:showDetails(slot1, slot2, nil, slot4.dbId, nil, slot0.curChipPlan)

			return
		end

		slot0:resetSelected()

		if slot0.movePanel then
			slot0:deleteMovingItem()

			for slot9 = 1, 6 do
				slot10 = slot0.chipPanel:getItem(slot9)
				slot11 = slot10:box()
				slot12 = slot10:getParent():convertToWorldSpace(cc.p(slot11.x, slot11.y))
				slot11.y = slot12.y
				slot11.x = slot12.x
				slot11.height = slot11.height * slot0.chipPanel:scale()
				slot11.width = slot11.width * slot0.chipPanel:scale()

				if cc.rectContainsPoint(slot11, slot5) then
					if slot9 == slot4.cfg.pos then
						slot0.curChipPlan:modify(function (slot0)
							uv1 = "dbId"
							uv2 = "dbId"
							slot0[slot1] = slot2.dbId

							return true, slot0
						end)
						slot0.isRefreshBagPanel:notify()
					else
						gGameUI:showTip(gLanguageCsv.chipSlotError)
					end

					return
				end
			end
		end
	else
		uv6 = "name"

		slot6.onItemTouch(slot0, slot1, slot2, slot3, slot4, slot5)
	end
end

function slot2.onCardChipClick(slot0, slot1, slot2, slot3, slot4)
	if slot0.page == 1 then
		if slot4.name == "ended" then
			slot0.selectRightPos:set(slot2)
			slot0:showDetails(list, slot1, slot2, slot3.dbId)
		end

		return
	end

	if slot4.name == "ended" or slot4.name == "cancelled" then
		if not slot0.moved then
			slot0.selectLeftPos:set(slot2)
			slot0.selectRightPos:set(slot2)
			slot0:showDetails(list, slot1, slot2, slot3.dbId, nil, slot0.curChipPlan)

			return
		end

		slot0:resetSelected()

		if slot0.movePanel then
			slot0:deleteMovingItem()

			slot5 = slot0.bagList:box()
			slot6 = slot0.bagList:getParent():convertToWorldSpace(cc.p(slot5.x, slot5.y))
			slot5.y = slot6.y
			slot5.x = slot6.x

			if cc.rectContainsPoint(slot5, slot4) then
				slot0.curChipPlan:modify(function ()
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
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
					--     return _build_string_constant(state, instruction.CD)
					--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
					--     node.value = state.constants.complex_constants[index]
					--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
					-- IndexError: list index out of range
				end)
				slot0.isRefreshBagPanel:notify()
			end
		end
	else
		uv5 = "page"

		slot5.onCardChipClick(slot0, slot1, slot2, slot3, slot4)
	end
end

function slot2.onBaseAttrDetailClick(slot0)
	if slot0.page == 1 and not slot0.showCard:read() then
		gGameUI:stackUI("city.card.chip.total_detail", nil, , {
			typ = 2,
			curPlan = slot0.curChipPlan:read(),
			cardPlan = slot0.cardChips:read()
		})
	else
		gGameUI:stackUI("city.card.chip.total_detail", nil, , {
			typ = 1,
			cardPlan = slot1
		})
	end
end

function slot2.onSuitAttrDetailClick(slot0)
	gGameUI:stackUI("city.card.chip.suit_detail", nil, , slot0.curChipPlan:read())
end

return slot2
