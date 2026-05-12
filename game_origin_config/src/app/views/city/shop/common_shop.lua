slot0 = require("app.views.city.shop.base_shop")
slot1 = class("PVPShopItem", slot0)
slot1.RESOURCE_FILENAME = slot0.RESOURCE_FILENAME
slot1.RESOURCE_BINDING = slot0.RESOURCE_BINDING

function slot1.onCreate(slot0, slot1)
	uv2 = "onCreate"

	slot2.onCreate(slot0, slot1)
end

function slot1.initIdler(slot0, slot1, slot2)
	if game.SHOP_GET_PROTOL[slot1] and not slot2 then
		gGameApp:requestServer(game.SHOP_GET_PROTOL[slot1], function ()
			uv0 = "initCommonIdler"
			uv2 = "initCommonIdler"

			slot0:initCommonIdler(slot2)
		end)
	else
		slot0:initCommonIdler(slot1)
	end
end

function slot1.initCommonIdler(slot0, slot1)
	slot0.func()
	slot0:initBottomPanel()

	slot2 = gGameModel[slot0.shopInfo.modelName]
	slot5 = itertools.map(game.SHOP_INIT, function (slot0, slot1)
		return slot1, slot0
	end)

	idlereasy.any({
		slot2:getIdler("items"),
		slot2:getIdler("buy"),
		slot0.shopLimit,
		slot0.vipLevel,
		slot0.level,
		slot0.fishLevel
	}, function (slot0, slot1, slot2, slot3, slot4, slot5)
		uv7 = "string"
		uv8 = "lower"
		slot7 = slot7[slot8]
		uv7 = "initData"
		uv9 = "lower"

		slot7:initData(slot9, slot1, slot2, slot3[string.lower(slot7)], slot4, slot5)
	end):anonyOnly(slot0)
end

return slot1
