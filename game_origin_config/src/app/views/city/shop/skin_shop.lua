function slot0(slot0, slot1, slot2, slot3)
	slot4 = slot1:multiget("bg", "btnBuy", "imageAdd", "maskPanel", "txtName")

	nodetools.map({
		slot4.imageAdd,
		slot4.maskPanel
	}, "visible", false)

	slot5 = slot4.bg:size()
	slot6 = 80
	slot7 = ccui.Scale9Sprite:create()

	slot7:initWithFile(cc.rect(82, 82, 1, 1), "common/icon/mask_card.png")
	slot7:size(slot5.width - 39, slot5.height - 39):alignCenter(slot5)

	slot8 = gSkinCsv[slot3.skinId]
	slot10 = csv.unit[dataEasy.getUnitId(nil, slot3.skinId)]
	slot11 = cc.Sprite:create(slot10.cardShow)
	slot12 = slot11:size()
	slot13 = cc.p(slot10.cardShowPosC.x / slot10.cardShowScale, -slot10.cardShowPosC.y / slot10.cardShowScale)
	slot14 = cc.size(slot5.width / slot10.cardShowScale, slot5.height / slot10.cardShowScale)

	slot11:alignCenter(slot5):scale(slot10.cardShowScale + 0.2):setTextureRect(cc.rect((slot12.width - slot14.width) / 2 - slot13.x, (slot12.height - slot14.height) / 2 - slot13.y, slot14.width, slot14.height))
	slot4.bg:removeChildByName("clipping")
	cc.ClippingNode:create(slot7):setAlphaThreshold(0.1):size(slot5):alignCenter(slot4.bg:size()):add(slot11):addTo(slot4.bg, 1, "clipping")
	slot4.txtName:text(slot8.name)
	slot4.bg:texture(slot8.skinFrameRes)

	slot16 = slot4.btnBuy:multiget("txt", "icon")
	slot17, slot18 = csvNext(slot3.costMap)
	slot19 = dataEasy.getCfgByKey(slot17)

	slot16.icon:texture(dataEasy.getIconResByKey(slot17))
	slot16.txt:text(slot18)
	slot16.icon:x(slot4.btnBuy:width() / 2 - slot16.icon:getBoundingBox().width - slot16.txt:size().width / 2 + 20)
	adapt.oneLinePos(slot16.icon, slot16.txt, cc.p(10, 0), "left")

	if slot3.isHave then
		slot4.maskPanel:visible(true)
		cache.setShader(slot4.btnBuy, false, "hsl_gray")
		cache.setShader(slot16.icon, false, "hsl_gray")
		slot4.bg:texture("city/drawcard/draw/panel_card_gh.png")

		return
	end

	if slot3.extraItem and csvSize(slot3.extraItem) == 1 then
		slot4.imageAdd:visible(true)

		slot22, slot23 = csvNext(slot3.extraItem)
		slot25 = cc.Sprite:create(csv.items[slot22].icon)

		slot25:alignCenter(slot25:size()):scale(1.2):xy(cc.p(80, 80)):addTo(slot4.imageAdd)
	end

	bind.touch(slot0, slot1, {
		methods = {
			ended = functools.partial(slot0.itemSkinClick, slot2, slot3)
		}
	})
end

slot1 = require("app.views.city.shop.base_shop")
slot2 = class("PVPShopItem", slot1)
slot2.RESOURCE_FILENAME = slot1.RESOURCE_FILENAME
slot2.RESOURCE_BINDING = clone(slot1.RESOURCE_BINDING)
slot2.RESOURCE_BINDING["rightPanel.list"] = {
	varname = "list",
	binds = {
		event = "extend",
		class = "tableview",
		props = {
			data = bindHelper.self("shopData"),
			columnSize = bindHelper.self("rightColumnSize"),
			sliderBg = bindHelper.self("slider"),
			item = bindHelper.self("subList"),
			cell = bindHelper.self("item"),
			btnIdx = bindHelper.self("showTab"),
			asyncPreload = bindHelper.self("rightAsyncPreload"),
			itemAction = {
				actionTime = 0.2,
				duration = 0.1,
				isAction = true
			},
			onCell = function (slot0, slot1, slot2, slot3)
				slot4 = slot1:multiget("item1", "item2")
				slot5 = slot3.type == game.SHOP_INIT.SKIN_SHOP

				slot4.item1:visible(not slot5)

				slot6 = slot4.item2
				slot6 = slot6.visible

				slot6(slot6, slot5)

				uv6 = "multiget"

				slot6(slot0, slot4.item2, slot2, slot3)
			end,
			onBeforeBuild = function (slot0)
				if slot0.sliderBg:visible() then
					slot0.sliderShow = true

					slot0.sliderBg:hide()
				end

				if #slot0.data <= 2 * slot0.columnSize then
					slot0:setScrollBarEnabled(false)
					slot0:setTouchEnabled(false)
				else
					slot0:setTouchEnabled(true)
				end
			end,
			onAfterBuild = function (slot0)
				if slot0.sliderShow then
					slot0.sliderBg:show()

					slot0.sliderShow = false
				end

				if #slot0.data <= 2 * slot0.columnSize then
					slot0.sliderBg:hide()
					slot0:setScrollBarEnabled(false)
					slot0:setTouchEnabled(false)
				else
					slot0.sliderBg:show()
					slot0:setTouchEnabled(true)

					slot1, slot2 = slot0:xy()
					slot3 = slot0:size()
					slot4, slot5 = slot0.sliderBg:xy()
					slot6 = slot0.sliderBg:size()

					slot0:setScrollBarEnabled(true)
					slot0:setScrollBarColor(cc.c3b(241, 59, 84))
					slot0:setScrollBarOpacity(255)
					slot0:setScrollBarAutoHideEnabled(false)
					slot0:setScrollBarPositionFromCorner(cc.p(25, (slot3.height - slot6.height) / 2 + 5))
					slot0.sliderBg:x(slot1 + slot3.width - 25)
					slot0:setScrollBarWidth(slot6.width)
					slot0:refreshView()
				end
			end
		},
		handlers = {
			itemClick = bindHelper.self("onItemClick"),
			itemSkinClick = bindHelper.self("onItemSkinClick")
		}
	}
}

function slot2.onCreate(slot0, slot1)
	uv2 = "onCreate"

	slot2.onCreate(slot0, slot1)
	slot0.func()
	slot0:initBottomPanel()
end

function slot2.initIdler(slot0, slot1, slot2)
	slot0:initCommonIdler(slot1)
end

function slot2.initCommonIdler(slot0)
	slot0.skins = gGameModel.role:getIdler("skins")

	idlereasy.any({
		slot0.skins,
		slot0.vipLevel
	}, function (slot0, slot1, slot2)
		slot3 = {}

		for slot7, slot8 in pairs(gSkinShopCsv) do
			slot9 = csvNext(slot8.itemMap)
			slot11 = csv.items[slot9].specialArgsMap.skinID
			slot3[#slot3 + 1] = {
				id = slot7,
				skinId = slot11,
				itemId = slot9,
				costMap = slot8.costMap,
				litSkinNum = slot8.litSkinNum,
				vipStart = slot8.vipStart,
				startTime = slot8.beginDate,
				endTime = slot8.endDate,
				extraItem = slot8.extraItem,
				isHave = slot1[slot11] == 0,
				type = game.SHOP_INIT.SKIN_SHOP,
				showUnable = slot8.showUnable,
				rank = gSkinCsv[slot11].rank
			}
		end

		slot5 = slot3

		table.sort(slot5, function (slot0, slot1)
			return (slot0.isHave and 1 or 0) * 100000 + slot0.rank < (slot1.isHave and 1 or 0) * 100000 + slot1.rank
		end)

		slot4 = dataEasy.tryCallFunc
		uv5 = "pairs"

		slot4(slot5.list, "updatePreloadCenterIndex")

		uv4 = "pairs"

		slot4.shopData:update(slot3)
	end):anonyOnly(slot0)
end

function slot2.onItemSkinClick(slot0, slot1, slot2, slot3)
	slot5, slot6 = csvNext(slot3.costMap)
	slot7 = true
	slot4 = gLanguageCsv.skinTip01 .. string.format("%d#I%s-56-56#", slot6, dataEasy.getIconResByKey(slot5))

	if dataEasy.getNumByKey(slot5) < slot6 then
		slot7 = false
	end

	slot8 = gSkinCsv[slot3.skinId]
	slot9, slot10 = csvNext(slot3.extraItem)
	slot11 = {
		{
			slot3.itemId,
			1
		}
	}

	if slot9 then
		slot11[#slot11 + 1] = {
			slot9,
			slot10
		}
	end

	if slot7 then
		gGameUI:showDialog({
			isRich = true,
			btnType = 2,
			strs = string.format(gLanguageCsv.skinTip02, slot4, slot8.name),
			cb = function ()
				uv4 = "requestServer"

				gGameApp:requestServer("/game/card/skin/shop/buy", function (slot0)
					uv3 = "gGameUI"

					gGameUI:showGainDisplay(slot3, {
						raw = false
					})
				end, slot4.id, 1)
			end,
			dialogParams = {
				clickClose = false
			}
		})
	else
		uiEasy.showDialog(slot5)
	end
end

return slot2
