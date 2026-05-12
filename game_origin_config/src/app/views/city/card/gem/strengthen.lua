slot0 = class("GemStrengthenView", Dialog)
slot1 = table.insert
slot0.RESOURCE_FILENAME = "gem_strengthen.json"
slot0.RESOURCE_BINDING = {
	["gemPanel.gemName"] = "gemName",
	["gemPanel.cardName"] = "cardName",
	subList = "subList",
	["gemPanel.lvBg"] = "lvBg",
	["gemPanel.icon"] = "icon",
	acquire = "acquire",
	["detail.lvNum"] = "detailLv",
	["detail.lvNum2"] = "detailLv2",
	["acquire.num"] = "acquireNum",
	["gemPanel.equipOn"] = "equipOn",
	["gemPanel.gemIconBg"] = "gemIconBg",
	["detail.lvMax"] = "detailLvMax",
	gemPanel = "gemPanel",
	imgLvMax = "imgLvMax",
	item = "item",
	btnPanel = "btnPanel",
	["detail.arrow"] = "detailArrow",
	["btnPanel.txtCost"] = "txtCost",
	["detail.attr"] = "attr",
	detail = "detail",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["gemPanel.lv"] = {
		varname = "lv",
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						color = ui.COLORS.OUTLINE.DEFAULT
					}
				}
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 5,
				asyncPreload = 15,
				topPadding = 10,
				leftPadding = 10,
				preloadCenterIndex = bindHelper.self("curIdx"),
				data = bindHelper.self("gems"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							noListener = true,
							data = {
								key = slot3.key,
								num = slot3.num
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

								slot0:stopAllActions()

								slot2 = slot0

								slot0.scale(slot2, 1)

								uv2 = "removeSelf"
								uv7 = "removeSelf"
								uv9 = "alignCenter"
								uv10 = "selectEffect"

								bind.touch(slot2, slot0, {
									methods = {
										ended = functools.partial(slot7.itemClick, slot0, slot9, slot10)
									}
								})
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
	["btnPanel.btnStrengthen"] = {
		varname = "btnStrengthen",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onStrengthen")
			}
		}
	},
	["btnPanel.btnStrengthen.title"] = {
		varname = "btnStrengthenTxt",
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
	["btnPanel.btnOneKeyStrengthen"] = {
		varname = "btnOneKeyStrengthen",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("oneKeyStrengthen")
			}
		}
	},
	["btnPanel.btnOneKeyStrengthen.title"] = {
		varname = "btnOneKeyStrengthenTxt",
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
	["detail.attrList"] = {
		varname = "attrList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("attrData"),
				item = bindHelper.self("attr"),
				onItem = function (slot0, slot1, slot2, slot3)
					if slot3.type == "special" then
						slot1:get("attrTxt"):text(gLanguageCsv.attrIndexPoint)
						slot1:get("attrNum"):text("+" .. slot3.num)
					else
						slot1:get("attrTxt"):text(gLanguageCsv["attr" .. string.caption(game.ATTRDEF_TABLE[slot3.type])])
						slot1:get("attrNum"):text("+" .. dataEasy.getAttrValueString(slot3.type, slot3.num))
					end

					adapt.oneLinePos(slot1:get("attrTxt"), slot1:get("attrNum"), cc.p(10, 0))
					slot1:get("arrowUp"):visible(false)
					slot1:get("attrNum3"):visible(false)

					if not slot3.isMaxLv then
						if not (slot3.num == slot3.nextNum) then
							if slot3.type == "special" then
								slot1:get("attrNum2"):text("+" .. slot3.nextNum .. "(+" .. slot3.nextNum - slot3.num)
							else
								slot1:get("attrNum2"):text("+" .. dataEasy.getAttrValueString(slot3.type, slot3.nextNum) .. "(+" .. dataEasy.getAttrValueString(slot3.type, slot3.nextNum - slot3.num))
							end

							slot1:get("arrowUp"):visible(true)
							slot1:get("attrNum3"):visible(true)
							adapt.oneLinePos(slot1:get("attrNum"), {
								slot1:get("arrow"),
								slot1:get("attrNum2")
							}, cc.p(40, 0))
							adapt.oneLinePos(slot1:get("attrNum2"), {
								slot1:get("arrowUp"),
								slot1:get("attrNum3")
							})
						elseif slot3.nextLevel then
							slot1:get("tip"):text(string.format(gLanguageCsv.strengthenWhenlvN, slot3.nextLevel))
							adapt.oneLinePos(slot1:get("attrNum"), slot1:get("tip"))
						end
					end

					slot1:get("tip"):visible(slot4 and not slot3.isMaxLv and slot3.nextLevel and true or false)
					slot1:get("attrNum2"):visible(not slot4 and not slot3.isMaxLv)
					slot1:get("arrow"):visible(not slot4 and not slot3.isMaxLv)
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.attr:visible(false)
	slot0:initModel()

	slot0.costNodes = {}

	dataEasy.getListenUnlock(gUnlockCsv.gemOnekeyStrengthen, function (slot0)
		uv1 = "btnOneKeyStrengthen"
		slot1 = slot1.btnOneKeyStrengthen
		slot1 = slot1.visible

		slot1(slot1, slot0)

		uv1 = "btnOneKeyStrengthen"
		slot1 = slot1.btnStrengthen
		slot1 = slot1.x

		slot1(slot1, slot0 and 587 or 357)

		uv1 = "btnOneKeyStrengthen"
		slot1.unlock = slot0
		uv1 = "btnOneKeyStrengthen"

		slot1:resetCostNodesXY()
	end)

	slot0.gemIdler = idler.new()
	slot0.attrData = idlers.newWithMap({})

	if slot1 then
		slot0.gemIdler:set(slot1)
	end

	slot0.selectEffect = ccui.ImageView:create("common/box/box_selected.png"):alignCenter(slot0.item:size()):retain()

	idlereasy.when(slot0.gemIdler, function (slot0, slot1)
		uv2 = "firstDetail"
		slot2.firstDetail = false
		slot2 = gGameModel.gems:find(slot1)
		slot4 = slot2.read
		slot3 = dataEasy.getCfgByKey(slot4(slot2, "gem_id"))
		uv4 = "firstDetail"

		slot4.icon:texture(slot3.icon)

		slot6 = slot2
		slot4, slot5 = uiEasy.setIconName(slot2.read(slot6, "gem_id"))
		uv6 = "firstDetail"
		slot6 = slot6.gemName
		slot7 = slot6

		slot6.text(slot7, slot4)

		slot6 = text.addEffect
		uv7 = "firstDetail"

		slot6(slot7.gemName, slot5)

		uv6 = "firstDetail"
		slot6 = slot6.gemIconBg
		slot6 = slot6.texture

		slot6(slot6, "city/card/helditem/strengthen/img_dt" .. slot3.quality .. ".png")

		uv6 = "firstDetail"
		slot9 = slot2
		uv9 = "firstDetail"
		slot6.gemlevel = idlereasy.assign(slot2.getIdler(slot9, "level"), slot9.gemlevel)
	end)
	idlereasy.any({
		slot0.gemlevel,
		slot0.gold
	}, function (slot0, slot1)
		uv2 = "setDetail"

		slot2:setDetail()
	end)

	if not gGameModel.gems:find(slot1):read("card_db_id") then
		slot0.equipOn:visible(false)
		slot0.cardName:visible(false)
	else
		slot3 = gGameModel.cards:find(slot2)

		uiEasy.setIconName("card", slot3:read("card_id"), {
			space = true,
			node = slot0.cardName,
			name = slot3:read("name"),
			advance = slot3:read("advance")
		})
		adapt.oneLineCenterPos(cc.p(241, 0), {
			slot0.equipOn,
			slot0.cardName
		})
	end

	slot0.gems = idlers.new()
	slot4 = {}
	slot5 = nil

	for slot9, slot10 in pairs((not slot2 or gGameModel.cards:find(slot2):read("gems")) and gGameModel.role:read("gems")) do
		slot11 = gGameModel.gems:find(slot10)

		if slot2 or not slot11:read("card_db_id") then
			slot3 = 0 + 1
			slot12 = dataEasy.getCfgByKey(slot11:read("gem_id"))

			table.insert(slot4, {
				gemdbid = slot10,
				key = slot11:read("gem_id"),
				quality = slot12.quality,
				suitID = slot12.suitID,
				suitNo = slot12.suitNo,
				level = slot11:read("level")
			})
		end
	end

	table.sort(slot4, function (slot0, slot1)
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

	for slot9, slot10 in ipairs(slot4) do
		if slot10.gemdbid == slot1 then
			slot0.curIdx = math.ceil(slot9 / 5)
			slot10.selectEffect = slot0.selectEffect
		end

		slot10.idx = slot9

		idlereasy.when(gGameModel.gems:find(slot10.gemdbid):getIdler("level"), function (slot0, slot1)
			uv2 = "gems"
			uv4 = "atproxy"
			slot2.gems:atproxy(slot4).level = slot1
		end, true):anonyOnly(slot0, stringz.bintohex(slot10.gemdbid))
	end

	slot0.gems:update(slot4)

	if #slot4 <= 10 then
		performWithDelay(slot0, function ()
			uv0 = "list"

			slot0.list:setItemAlignCenter()
		end, 0)
	end

	slot0.selectItem = idler.new()

	slot0.selectItem:addListener(function (slot0, slot1)
		if slot0 then
			uv2 = "gems"
			slot2 = slot2.gems
			slot3 = slot2
			uv3 = "gems"
			slot2.atproxy(slot3, slot0).selectEffect = slot3.selectEffect
		end
	end)

	slot0.item529 = idler.new(0)

	idlereasy.when(gGameModel.role:getIdler("items"), function (slot0, slot1)
		uv2 = "item529"

		slot2.item529:set(slot1[529] or 0)
	end)
	idlereasy.when(slot0.item529, function (slot0, slot1)
		uv2 = "acquireNum"
		slot2 = slot2.acquireNum
		slot2 = slot2.text

		slot2(slot2, slot1)

		uv2 = "acquireNum"
		slot3 = math.max(slot2.acquireNum:width() + 50, 187)
		slot2 = slot3
		uv3 = "acquireNum"
		slot3 = slot3.acquire:get("bg")
		slot3 = slot3.width
		slot5 = slot2

		slot3(slot3, slot5)

		uv3 = "acquireNum"
		uv5 = "acquireNum"

		slot3.acquireNum:x(slot5.acquire:get("bg"):x() + slot2 / 2)
	end)
	Dialog.onCreate(slot0)
end

function slot0.setDetail(slot0)
	slot1 = gGameModel.gems:find(slot0.gemIdler:read())
	slot2 = slot1:read("level")

	slot0.lv:text("Lv" .. slot2)
	slot0.detailLv:text("Lv" .. slot2)
	slot0.detailLv2:text("Lv" .. slot2 + 1)
	slot0.lvBg:visible(false)

	slot4 = slot2 == dataEasy.getCfgByKey(slot1:read("gem_id")).strengthMax

	slot0.detailLvMax:visible(slot4)
	slot0.detailLv2:visible(not slot4)
	slot0.imgLvMax:visible(slot4)
	slot0.detailArrow:visible(not slot4)
	adapt.oneLinePos(slot0.detailLv, {
		slot0.detailLvMax
	})
	slot0.btnPanel:visible(not slot4)

	slot5 = csv.gem.cost[slot2]["costItemMap" .. slot3.strengthCostSeq]

	for slot9, slot10 in pairs(slot0.costNodes) do
		slot10:removeSelf()
	end

	slot0.costNodes = {}
	slot0.needCost = nil

	for slot9, slot10 in csvMapPairs(slot5) do
		slot12 = ccui.ImageView:create(dataEasy.getIconResByKey(slot9)):addTo(slot0.btnPanel, 100)
		slot13 = slot12
		uv13 = "gGameModel"

		slot13(slot0.costNodes, cc.Label:createWithTTF(slot10, ui.FONT_PATH, 40):addTo(slot0.btnPanel, 100):setTextColor(ui.COLORS.NORMAL.BLACK))

		uv13 = "gGameModel"

		slot13(slot0.costNodes, slot12.scale(slot13, 0.8))

		if dataEasy.getNumByKey(slot9) < slot10 then
			text.addEffect(slot11, {
				color = ui.COLORS.NORMAL.RED
			})

			slot0.needCost = slot9
		end
	end

	slot0:resetCostNodesXY()

	slot0.curCost = slot5
	slot6 = {}

	for slot10 = 1, math.huge do
		if slot3["attrType" .. slot10] and slot3["attrType" .. slot10] ~= 0 then
			slot11 = slot3["attrNum" .. slot10]
			slot12 = {
				type = slot3["attrType" .. slot10],
				num = slot11[slot2],
				nextNum = slot11[slot2 + 1],
				level = slot2,
				isMaxLv = slot4
			}

			for slot16 = slot2, slot3.strengthMax do
				if not slot11[slot16] then
					break
				elseif slot11[slot16] ~= slot11[slot2] then
					slot12.nextLevel = slot16

					break
				end
			end

			table.insert(slot6, slot12)
		else
			break
		end
	end

	if csv.gem.quality[slot2 + 1] then
		-- Nothing
	end

	for slot14 = slot2, slot3.strengthMax do
		if not slot7[slot14] then
			break
		elseif slot7[slot14] and slot7[slot2][slot9] ~= slot7[slot14][slot9] then
			slot10.nextLevel = slot14

			break
		end
	end

	table.insert(slot6, {
		type = "special",
		num = slot7[slot2]["qualityNum" .. slot3.quality],
		isMaxLv = slot4,
		nextNum = slot7[slot2 + 1][slot9]
	})
	slot0.attrData:update(slot6)

	if not slot0.firstDetail then
		slot0.firstDetail = true
	else
		slot0:showLvUpEffects()
	end
end

function slot0.resetCostNodesXY(slot0)
	slot1, slot2 = slot0.btnStrengthen:xy()
	slot3 = {
		slot0.txtCost,
		unpack(slot0.costNodes)
	}
	slot4 = {}

	if slot0.unlock then
		slot5 = {}
		slot6 = false

		for slot10 = #slot3 - 1, 1, -1 do
			slot11 = slot3[slot10]
			slot11 = slot11.y

			slot11(slot11, slot2 + 100)

			uv11 = "btnStrengthen"

			slot11(slot5, slot3[slot10])

			uv11 = "btnStrengthen"

			slot11(slot4, slot6 and cc.p(15, 0) or cc.p(0, 0))

			slot6 = not slot6
		end

		slot3[#slot3]:xy(slot1 + 120, slot2 + 100)
		adapt.oneLinePos(slot3[#slot3], slot5, slot4, "right")
	else
		slot5 = true

		for slot9 = 1, #slot3 do
			uv10 = "btnStrengthen"

			slot10(slot4, slot5 and cc.p(15, 0) or cc.p(0, 0))

			slot5 = not slot5
		end

		adapt.oneLineCenterPos(cc.p(slot1, slot2 + 100), slot3, slot4)
	end
end

function slot0.showLvUpEffects(slot0)
	for slot5, slot6 in ipairs(slot0.attrList:getItems()) do
		if slot6:get("effect") then
			slot6:get("effect"):removeSelf()
		end

		widget.addAnimationByKey(slot6, "haogandujiesuo/shuzhibianhua.skel ", "effect", "effect", 10):alignCenter(slot6:size()):xy(320, 40)
	end

	if slot0.gemPanel:get("effect") then
		slot0.gemPanel:get("effect"):removeSelf()
	end

	widget.addAnimationByKey(slot0.gemPanel, "koudai_gonghuixunlian/gonghuixunlian.skel", "effect", "fangguang2", 100):xy(241, 150)
	gGameUI:showTip(gLanguageCsv.strengthenSuccess)
end

function slot0.onItemClick(slot0, slot1, slot2, slot3, slot4)
	slot0.selectItem:set(slot4.idx)
	slot0.gemIdler:set(slot4.gemdbid)
end

function slot0.onStrengthen(slot0)
	if slot0.needCost then
		if slot0.needCost == "gold" or slot0.needCost == "rmb" then
			uiEasy.showDialog(slot0.needCost)
		else
			gGameUI:showTip(gLanguageCsv.materialsNotEnough)
		end

		return
	end

	slot1 = slot0.gemIdler:read()

	gGameApp:requestServer("/game/gem/strength", function ()
	end, slot1, gGameModel.gems:find(slot1):read("level") + 1)
end

function slot0.oneKeyStrengthen(slot0)
	if slot0.needCost then
		if slot0.needCost == "gold" or slot0.needCost == "rmb" then
			uiEasy.showDialog(slot0.needCost)
		else
			gGameUI:showTip(gLanguageCsv.materialsNotEnough)
		end

		return
	end

	gGameUI:stackUI("city.card.gem.onekey_strengthen", nil, , slot0.gemIdler:read())
end

function slot0.initModel(slot0)
	slot0.gold = gGameModel.role:getIdler("gold")
end

return slot0
