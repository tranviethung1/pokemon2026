slot0 = game.SHOP_INIT

function slot1()
	uv1 = "PVP_SHOP"
	uv1 = "PVP_SHOP"
	uv1 = "PVP_SHOP"
	slot3 = gGameModel.role
	slot4 = slot3
	slot5 = "union_db_id"
	uv1 = "PVP_SHOP"
	uv1 = "PVP_SHOP"
	uv1 = "PVP_SHOP"
	slot1 = slot1.PVP_SHOP.CRAFT_SHOP.UNION_FIGHT_SHOP.CROSS_CRAFT_SHOP.ONLINE_FIGHT_SHOP.CROSS_MINE_SHOP
	uv1 = "PVP_SHOP"

	for slot4, slot5 in pairs({
		[slot1] = {
			itemsName = "pvpShopItems",
			unlockKey = "arenaShop",
			shopProtocal = "/game/pw/shop/buy",
			topui = "arena",
			subName = "Arena",
			viewName = "city.shop.pvp_shop",
			modelName = "pvp_shop",
			sortValue = 1,
			name = gLanguageCsv.spacePvp,
			csvPath = csv.pwshop
		},
		[slot1] = {
			itemsName = "craftShopItems",
			unlockKey = "craft",
			shopProtocal = "/game/craft/shop/buy",
			topui = "craft",
			subName = "Craft",
			viewName = "city.shop.pvp_shop",
			modelName = "craft_shop",
			sortValue = 3,
			name = gLanguageCsv.craft,
			csvPath = csv.craft.shop
		},
		[slot1] = {
			shopProtocal = "/game/union/fight/shop/buy",
			unlockKey = "unionFight",
			itemsName = "unionItems",
			topui = "union_combet",
			subName = "UnionCombet",
			viewName = "city.shop.pvp_shop",
			modelName = "union_fight_shop",
			sortValue = 4,
			name = gLanguageCsv.unionCombet,
			isLocked = not slot3.read(slot4, slot5),
			csvPath = csv.union_fight.shop
		},
		[slot1] = {
			itemsName = "crossCraftShopItems",
			unlockKey = "crossCraft",
			shopProtocal = "/game/cross/craft/shop/buy",
			topui = "cross_craft",
			subName = "CrossCraft",
			viewName = "city.shop.pvp_shop",
			modelName = "cross_craft_shop",
			sortValue = 5,
			name = gLanguageCsv.crossCraft,
			csvPath = csv.cross.craft.shop
		},
		[slot1] = {
			itemsName = "onlineFightShopItems",
			timesRefreshType = 1,
			unlockKey = "onlineFight",
			shopProtocal = "/game/cross/online/shop/buy",
			viewName = "city.shop.pvp_shop",
			subName = "battleArena",
			topui = "online_fight",
			modelName = "cross_online_fight_shop",
			sortValue = 7,
			name = gLanguageCsv.onlineFight,
			csvPath = csv.cross.online_fight.shop
		},
		[slot1] = {
			itemsName = "crossMineShopItems",
			unlockKey = "crossMine",
			shopProtocal = "/game/cross/mine/shop",
			topui = "cross_mine",
			subName = "CrossMine",
			viewName = "city.shop.pvp_shop",
			modelName = "cross_mine_shop",
			sortValue = 8,
			name = gLanguageCsv.crossMine,
			csvPath = csv.cross.mine.shop
		},
		[slot1.HUNTING_SHOP] = {
			itemsName = "huntingShopItems",
			unlockKey = "hunting",
			shopProtocal = "/game/hunting/shop",
			topui = "hunting",
			subName = "Hunting",
			viewName = "city.shop.pvp_shop",
			modelName = "hunting_shop",
			sortValue = 9,
			name = gLanguageCsv.huntingArea,
			csvPath = csv.cross.hunting.shop
		}
	}) do
		slot5.tabIndex = slot4
		slot5.isPvpShop = true
	end

	return slot0
end

function slot2()
	uv1 = "FIX_SHOP"
	uv1 = "FIX_SHOP"
	uv1 = "FIX_SHOP"
	uv1 = "FIX_SHOP"
	uv1 = "FIX_SHOP"
	uv1 = "FIX_SHOP"
	uv1 = "FIX_SHOP"
	uv1 = "FIX_SHOP"
	slot1 = slot1.FIX_SHOP.SIGNIN_SHOP.UNION_SHOP.FRAG_SHOP.EXPLORER_SHOP.RANDOM_TOWER_SHOP.EQUIP_SHOP.FISHING_SHOP
	slot3 = gGameModel.daily_record
	slot4 = slot3
	slot5 = "fishing_shop_refresh_times"
	uv1 = "FIX_SHOP"

	for slot4, slot5 in pairs({
		[slot1] = {
			shopProtocal = "/game/fixshop/buy",
			timesRefreshType = 2,
			viewName = "city.shop.common_shop",
			shopRefreshProtol = "/game/fixshop/refresh",
			subName = "HandPick",
			refreshLimit = "shopRefreshLimit",
			topui = "default",
			modelName = "fix_shop",
			sortValue = 1,
			name = gLanguageCsv.spaceHandpick,
			refreshShopTime = gGameModel.daily_record:getIdler("fix_shop_refresh_times"),
			refreshCost = gCostCsv.fixshop_refresh_cost
		},
		[slot1] = {
			shopProtocal = "/game/sign_in/shop/buy",
			unlockKey = "signInShop",
			isPvpShop = true,
			timesRefreshType = 1,
			viewName = "city.shop.sign_in_shop",
			subName = "SignInShop",
			topui = "sign_in",
			sortValue = 2,
			name = gLanguageCsv.signInShop
		},
		[slot1] = {
			shopProtocal = "/game/union/shop/buy",
			timesRefreshType = 2,
			unlockKey = "unionShop",
			viewName = "city.shop.common_shop",
			subName = "Union",
			refreshLimit = "shopRefreshLimit",
			shopRefreshProtol = "/game/union/shop/refresh",
			topui = "union",
			modelName = "union_shop",
			sortValue = 3,
			name = gLanguageCsv.spaceGuild,
			isLocked = not gGameModel.role:read("union_db_id"),
			refreshShopTime = gGameModel.daily_record:getIdler("union_shop_refresh_times"),
			refreshCost = gCostCsv.unionshop_refresh_cost
		},
		[slot1] = {
			shopProtocal = "/game/frag/shop/buy",
			timesRefreshType = 2,
			refreshLimit = "fragShopRefreshLimit",
			topui = "fragment",
			subName = "Fragment",
			unlockKey = "fragmentShop",
			mouthCardRefreshKeys = "fragShopRefreshLimit",
			shopRefreshProtol = "/game/frag/shop/refresh",
			viewName = "city.shop.common_shop",
			modelName = "frag_shop",
			sortValue = 4,
			name = gLanguageCsv.spaceFragment,
			refreshShopTime = gGameModel.daily_record:getIdler("frag_shop_refresh_times"),
			refreshCost = gCostCsv.fragshop_refresh_cost
		},
		[slot1] = {
			shopProtocal = "/game/explorer/shop/buy",
			timesRefreshType = 2,
			unlockKey = "explorer",
			viewName = "city.shop.common_shop",
			subName = "Explorer",
			refreshLimit = "explorerShopRefreshLimit",
			shopRefreshProtol = "/game/explorer/shop/refresh",
			topui = "explorer",
			modelName = "explorer_shop",
			sortValue = 5,
			name = gLanguageCsv.explorer,
			refreshShopTime = gGameModel.daily_record:getIdler("explorer_shop_refresh_times"),
			refreshCost = gCostCsv.explorershop_refresh_cost
		},
		[slot1] = {
			shopProtocal = "/game/random_tower/shop/buy",
			timesRefreshType = 2,
			unlockKey = "randomTower",
			viewName = "city.shop.common_shop",
			subName = "AetherParadise",
			refreshLimit = "shopRefreshLimit",
			shopRefreshProtol = "/game/random_tower/shop/refresh",
			topui = "random_tower",
			modelName = "random_tower_shop",
			sortValue = 2,
			name = gLanguageCsv.randomTower,
			refreshShopTime = gGameModel.daily_record:getIdler("randomTower_shop_refresh_times"),
			refreshCost = gCostCsv.randomTowerShop_refresh_cost
		},
		[slot1] = {
			shopProtocal = "/game/equipshop/buy",
			timesRefreshType = 1,
			unlockKey = "drawEquip",
			viewName = "city.shop.equip_shop",
			subName = "Accessories",
			refreshLimit = "shopRefreshLimit",
			topui = "drawcard",
			modelName = "equip_shop",
			sortValue = 6,
			name = gLanguageCsv.equipShop
		},
		[slot1] = {
			shopProtocal = "/game/fishing/shop/buy",
			timesRefreshType = 2,
			unlockKey = "fishing",
			viewName = "city.shop.common_shop",
			subName = "fishing",
			refreshLimit = "fishingShopRefreshLimit",
			shopRefreshProtol = "/game/fishing/shop/refresh",
			topui = "fishing",
			modelName = "fishing_shop",
			sortValue = 6,
			name = gLanguageCsv.fishing,
			refreshShopTime = slot3.getIdler(slot4, slot5),
			refreshCost = gCostCsv.fishingshop_refresh_cost
		},
		[slot1.TOTEM_SHOP] = {
			shopProtocal = "/game/totem/shop/buy",
			timesRefreshType = 1,
			rightBottomShow = true,
			unlockKey = "totem",
			topui = "totem",
			subName = "Accessories",
			refreshLimit = "shopRefreshLimit",
			viewName = "city.shop.totem_shop",
			modelName = "totem_shop",
			sortValue = 7,
			name = gLanguageCsv.totem
		}
	}) do
		slot5.tabIndex = slot4
	end

	return slot0
end

function slot3(slot0, slot1, slot2)
	slot1:removeChildByName("_lock_res_")

	if not slot0 then
		return
	end

	slot3 = slot1:size()
	slot2 = slot2 or {}

	return ccui.ImageView:create(slot2.res or "common/btn/btn_lock1.png"):xy(slot2.pos or cc.p(slot3.width * 0.5, slot3.height * 0.5)):scale(slot2.scale or 1):addTo(slot1, slot2.zOrder or 10, "_lock_res_")
end

function slot4(slot0, slot1, slot2, slot3)
	slot4 = slot1:get("list")

	if slot3.select == true then
		slot9 = slot0.childItem:size().height * #slot3.data

		slot1:size(slot1:size().width, slot9 + 160)
		slot1:get("img1"):y(slot9)
		slot1:get("normal"):hide()
		slot1:get("selected"):y(slot9 + 80)
		slot4:size(slot0.childItem:size().width, slot9)
		slot4:anchorPoint(cc.p(0, 1))
		slot4:y(slot9)
		bind.extend(slot0, slot4, {
			event = "extend",
			class = "listview",
			props = {
				data = slot3.data,
				item = slot0.childItem,
				onItem = function (slot0, slot1, slot2, slot3)
					uv5 = "idlereasy"

					function slot6(slot0, slot1)
						uv3 = "tolua"

						if not tolua.isnull(slot3) then
							uv2 = "tolua"
							slot3 = slot2
							uv3 = "tolua"
							slot5 = "selected"
							slot3 = slot3:get(slot5)
							slot4 = nil
							uv5 = "isnull"

							if slot5.tabIndex == slot1 then
								slot2.get(slot3, "normal"):hide()

								slot6 = slot3
								slot4 = slot3.show(slot6)
								uv6 = "get"

								performWithDelay(slot6, function ()
									uv0 = "size"
									slot1 = slot0
									uv1 = "size"
									slot2 = slot1
									uv2 = "size"
									slot4 = slot2:getInnerContainerPosition().y
									uv5 = "height"
									uv4 = "size"

									slot4:setInnerContainerPosition(cc.p(0, cc.clampf(math.max(slot4, -slot5:box().y), slot0.size(slot1).height - slot1.getInnerContainerSize(slot2).height, 0)))
								end, 0)
							else
								slot3:hide()

								slot4 = slot2:show()
							end

							slot4:scale(1)

							slot7 = "txt"
							uv7 = "isnull"

							slot4:get(slot7):setFontSize(slot7.fontSize)

							slot7 = "txt"
							uv7 = "isnull"

							slot4:get(slot7):text(slot7.name)
							slot4:get("txt"):getVirtualRenderer():setLineSpacing(-10)

							slot6 = slot3
							slot5 = slot3.setTouchEnabled

							slot5(slot6, false)

							uv5 = "selected"
							uv6 = "tabIndex"

							if slot5 == #slot6.data then
								slot2:loadTextureNormal("city/shop/btn_w_3.png")
								slot3:loadTextureNormal("city/shop/btn_r_3.png")
							end

							uv5 = "hide"
							uv6 = "isnull"

							if slot6.isLocked then
								uv6 = "isnull"
								slot6 = not slot6.select
							end

							slot11 = 105

							slot5(slot6, slot2, {
								pos = cc.p(300, slot11)
							})

							uv6 = "tabIndex"
							uv11 = "normal"
							uv12 = "isnull"
							uv13 = "isnull"

							bind.touch(slot6, slot2, {
								methods = {
									ended = functools.partial(slot11.clickChildCell, slot12.tabIndex, slot13)
								}
							})
						end
					end

					uv6 = "idlereasy"

					idlereasy.when(slot5.showTab, slot6):anonyOnly(slot6, "childItem" .. slot3.tabIndex)
				end
			}
		})
	else
		slot4:hide()
		slot5:hide()
		slot1:size(slot1:size().width, 160)
		slot6:y(80)
		slot7:hide()
	end
end

slot6 = class("ShopView", cc.load("mvc").ViewBase)
slot6.RESOURCE_FILENAME = "shop.json"
slot6.RESOURCE_BINDING = {
	["leftPanel.itemChild"] = "itemChild",
	leftPanel = "leftPanel",
	item = "item",
	["leftPanel.item"] = "leftItem",
	["leftPanel.itemParent"] = "itemParent",
	["leftPanel.list"] = {
		binds = {
			{
				event = "extend",
				class = "listview",
				props = {
					data = bindHelper.self("leftDatas"),
					item = bindHelper.self("leftItem"),
					preloadCenter = bindHelper.self("showTab"),
					itemAction = {
						isAction = true
					},
					onItem = function (slot0, slot1, slot2, slot3)
						slot6 = nil

						if slot3.select then
							slot1:get("normal"):hide()

							slot6 = slot1:get("selected"):show()
						else
							slot5:hide()
							slot4:show():get("subTxt"):text(slot3.subName)
						end

						slot6:scale(1)
						adapt.setTextScaleWithWidth(slot6:get("txt"), slot3.name, slot6:size().width - 50)
						slot5:setTouchEnabled(false)

						uv8 = "get"

						slot8(slot3.isLocked and not slot3.select, slot4, {
							pos = cc.p(300, 130)
						})
						bind.touch(slot0, slot4, {
							methods = {
								ended = functools.partial(slot0.clickCell, slot2, slot3)
							}
						})
					end
				},
				handlers = {
					clickCell = bindHelper.self("onLeftItemClick")
				}
			},
			{
				event = "visible",
				idler = bindHelper.self("isShopClassity"),
				method = function (slot0)
					return slot0 == false
				end
			}
		}
	},
	["leftPanel.listClassify"] = {
		varname = "leftList",
		binds = {
			{
				class = "listview",
				event = "extend",
				itemAction = {
					isAction = true
				},
				props = {
					data = bindHelper.self("newLeftDatas"),
					item = bindHelper.self("itemParent"),
					childItem = bindHelper.self("itemChild"),
					preloadCenter = bindHelper.self("classifyShowTab"),
					showTab = bindHelper.self("showTab"),
					onItem = function (slot0, slot1, slot2, slot3)
						uv4 = "select"

						slot4(slot0, slot1, slot2, slot3)

						if slot3.select == true then
							bind.touch(slot0, slot1:get("selected"), {
								methods = {
									ended = functools.partial(slot0.clickCell, slot2, slot3)
								}
							})
						else
							bind.touch(slot0, slot1:get("normal"), {
								methods = {
									ended = functools.partial(slot0.clickCell, slot2, slot3)
								}
							})
						end

						adapt.setTextScaleWithWidth(slot1:get("selected"):get("txt"), slot3.name, slot1:get("selected"):width() - 20)
						adapt.setTextScaleWithWidth(slot1:get("normal"):get("txt"), slot3.name, slot1:get("normal"):width() - 20)
						slot0:forceDoLayout()
					end
				},
				handlers = {
					clickCell = bindHelper.self("onNewLeftItemClick"),
					clickChildCell = bindHelper.self("onLeftItemClick")
				}
			},
			{
				event = "visible",
				idler = bindHelper.self("isShopClassity")
			}
		}
	}
}

function slot6.onCreate(slot0, slot1)
	slot0.firstReset = true

	slot0:initModel()

	slot0.originLeftPanelX = slot0.leftPanel:x()

	slot0:initShopData()

	slot0.isRefresh = idler.new(true)
	slot0.isShopClassity = dataEasy.getListenShow(gUnlockCsv.shopClassity)
	slot0.shopData = idlers.new()
	slot0.textFixShopRefreshCost = idler.new(0)
	slot0.textRefreshTimes = idler.new(0)
	slot2 = {
		[1.0] = true
	}

	for slot6, slot7 in pairs(slot0.shopDatas) do
		if slot7.unlockKey then
			dataEasy.getListenUnlock(slot7.unlockKey, functools.partial(function (slot0, slot1)
				if slot1 then
					uv2 = "unlockKey"

					if slot2.unlockKey == "totem" and not dataEasy.isTotemUnlock() then
						uv2 = "totem"
						slot2[slot0] = false

						return
					end

					uv2 = "unlockKey"

					if slot2.unlockKey == "signInShop" and not gGameModel.role:read("sign_in_shop_open") then
						uv2 = "totem"
						slot2[slot0] = false

						return
					end

					uv3 = "unlockKey"

					if dataEasy.judgeServerOpen(slot3.unlockKey) then
						uv2 = "totem"
						slot2[slot0] = true

						return
					end
				end

				uv2 = "totem"
				slot2[slot0] = false
			end, slot6))
		end
	end

	for slot7, slot8 in pairs(slot2) do
		if slot8 == true then
			-- Nothing
		end
	end

	slot0.leftDatas = idlers.new()

	slot0.leftDatas:update({
		[slot7] = slot0.shopDatas[slot7]
	})

	slot4 = {}

	for slot8, slot9 in orderCsvPairs(csv.shop) do
		if slot0.shopDatas[slot8] then
			slot0.shopDatas[slot8].shopType = slot9.group
			slot0.shopDatas[slot8].fontSize = slot9.fontSize
		end
	end

	for slot8, slot9 in pairs(slot2) do
		if slot9 == true then
			slot10 = slot0.shopDatas[slot8].shopType or 1
			slot4[slot10] = slot4[slot10] or {
				name = gLanguageCsv["shopTab" .. slot10]
			}
			slot4[slot10].data = slot4[slot10].data or {}

			table.insert(slot4[slot10].data, slot0.shopDatas[slot8])
		end
	end

	for slot8, slot9 in pairs(slot4) do
		table.sort(slot9.data, function (slot0, slot1)
			return slot0.sortValue < slot1.sortValue
		end)
	end

	slot0.newLeftDatas = idlers.new()

	slot0.newLeftDatas:update(slot4)

	slot5 = 1
	slot0.pageIdx = slot0._pageIdx or slot1 or 1

	if not slot2[slot0.pageIdx] then
		slot0.pageIdx = 1
	end

	for slot9, slot10 in pairs(slot0.shopDatas) do
		if slot9 == slot0.pageIdx then
			slot5 = slot10.shopType

			break
		end
	end

	slot0.classifyShowTab = idler.new(slot5)

	slot0.classifyShowTab:addListener(function (slot0, slot1, slot2)
		if slot1 ~= 0 then
			uv3 = "newLeftDatas"
			slot3.newLeftDatas:atproxy(slot1).select = false
		end

		if slot0 ~= 0 then
			uv3 = "newLeftDatas"
			slot3.newLeftDatas:atproxy(slot0).select = true
		end

		uv4 = "newLeftDatas"

		performWithDelay(slot4, function ()
			uv0 = "leftList"
			slot0 = slot0.leftList
			slot0 = slot0.refreshView

			slot0(slot0)

			uv0 = "leftList"
			slot0 = slot0.leftList
			slot1 = slot0
			uv1 = "leftList"
			slot1 = slot1.leftList
			slot2 = slot1
			uv2 = "leftList"
			slot2 = slot2.leftList
			slot3 = slot2
			uv3 = "leftList"

			slot3.leftList:setInnerContainerPosition(cc.p(0, cc.clampf(slot2.getInnerContainerPosition(slot3).y, slot0.size(slot1).height - slot1.getInnerContainerSize(slot2).height, 0)))
		end, 0.01)
	end)

	slot0.showTab = idler.new(slot0.pageIdx)

	slot0.showTab:addListener(function (slot0, slot1, slot2)
		uv3 = "topView"

		if slot3.topView then
			uv5 = "topView"

			gGameUI.topuiManager:removeView(slot5.topView)
		end

		uv3 = "topView"
		uv6 = "topView"
		slot6 = slot6.leftDatas
		slot7 = slot6
		uv7 = "topView"
		uv9 = "topView"
		slot3.topView = gGameUI.topuiManager:createView(slot6.atproxy(slot7, slot0).topui, slot7, {
			onClose = slot9:createHandler("onClose")
		}):init({
			subTitle = "SUPERMARKET",
			title = gLanguageCsv.supermarket
		})
		uv3 = "topView"

		if slot3.lastShowShopView then
			uv3 = "topView"

			slot3.lastShowShopView:removeFromParent()
		end

		uv3 = "topView"
		uv4 = "topView"
		slot3.lastShowShopView = slot4.curShowShopView
		uv3 = "topView"
		uv4 = "topView"
		uv8 = "topView"
		slot8 = slot8.getResourceNode
		uv8 = "topView"
		uv8 = "topView"
		slot8 = slot8.firstReset
		uv8 = "topView"
		slot4.curShowShopView = gGameUI:createView(slot3.shopDatas[slot0].viewName or "city.shop.base_shop", slot8(slot8)):init({
			view = slot8,
			firstReset = slot8,
			index = slot0,
			info = slot8.shopDatas[slot0],
			func = function ()
				uv0 = "lastShowShopView"

				if slot0.lastShowShopView then
					uv0 = "lastShowShopView"

					slot0.lastShowShopView:hide()
				end
			end
		})
		uv4 = "topView"
		slot4 = slot4.curShowShopView:x(display.uiOrigin.x)
		slot4 = slot4.z

		slot4(slot4, 100)

		uv4 = "topView"
		slot4 = slot4.leftDatas:atproxy(slot1)
		slot4.select = false
		uv4 = "topView"
		slot4.leftDatas:atproxy(slot0).select = true
	end)

	slot0.firstReset = false
end

function slot6.onCleanup(slot0)
	slot0._pageIdx = slot0.showTab:read()

	if slot0.topView then
		gGameUI.topuiManager:removeView(slot0.topView)
	end

	slot0.topView = nil

	if slot0.lastShowShopView then
		slot0.lastShowShopView:removeFromParent()
	end

	slot0.lastShowShopView = nil

	if slot0.curShowShopView then
		slot0.curShowShopView:removeFromParent()
	end

	slot1 = nil
	slot0.curShowShopView = slot1
	uv1 = "_pageIdx"

	slot1.onCleanup(slot0)
end

function slot6.initModel(slot0)
	slot0.rmb = gGameModel.role:getIdler("rmb")
	slot0.gold = gGameModel.role:getIdler("gold")
	slot0.skins = gGameModel.role:getIdler("skins")
	slot0.equipAwakeFrag = gGameModel.role:getIdler("equip_awake_frag")
	slot0.vipLevel = gGameModel.role:getIdler("vip_level")
	slot0.level = gGameModel.role:getIdler("level")
	slot0.shopLimit = gGameModel.role:getIdler("shop_limit")
	slot0.items = gGameModel.role:getIdler("items")
	slot0.equipShopRefresh = gGameModel.global_record:read("equip_shop_refresh")
	slot0.totemShopRefresh = gGameModel.global_record:read("totem_shop_refresh")
	slot0.fishLevel = gGameModel.fishing:getIdler("level")
end

function slot6.initShopData(slot0)
	uv1 = "shopDatas"
	slot0.shopDatas = slot1()

	for slot4, slot5 in pairs(slot0.shopDatas) do
		slot5.refreshTime = {}
	end

	uv1 = "pairs"

	for slot5, slot6 in pairs(slot1()) do
		slot0.shopDatas[slot5] = slot6
	end
end

function slot6.onLeftItemClick(slot0, slot1, slot2, slot3)
	uv4 = "UNION_SHOP"

	if slot2 ~= slot4.UNION_SHOP then
		uv4 = "UNION_SHOP"

		if slot2 == slot4.UNION_FIGHT_SHOP and slot3.isLocked then
			gGameUI:showTip(gLanguageCsv.canUsedEnteringGuild)

			return
		end
	end

	slot0.showTab:set(slot2)
end

function slot6.onNewLeftItemClick(slot0, slot1, slot2, slot3)
	if not slot3.select then
		slot0.classifyShowTab:set(slot2)

		for slot7, slot8 in pairs(slot3.data) do
			slot0.showTab:set(slot8.tabIndex)

			break
		end
	else
		slot0.classifyShowTab:set(0)
	end
end

return slot6
