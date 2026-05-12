slot0 = require("app.views.city.shop.base_shop")
slot1 = class("PVPShopItem", slot0)
slot1.RESOURCE_FILENAME = slot0.RESOURCE_FILENAME
slot1.RESOURCE_BINDING = slot0.RESOURCE_BINDING

function slot1.onCreate(slot0, slot1)
	uv2 = "onCreate"

	slot2.onCreate(slot0, slot1)
end

function slot1.initIdler(slot0, slot1, slot2)
	slot0.shopInfo.shopItems = idlertable.new(slot0:getShopItems(slot0.shopInfo.csvPath, slot0.shopID, slot0.shopInfo.refreshTime))

	idlereasy.any({
		gGameModel.role:getIdler(slot0.shopInfo.modelName),
		slot0.shopInfo.shopItems,
		slot0.shopLimit,
		slot0.vipLevel,
		slot0.level
	}, function (slot0, slot1, slot2, slot3, slot4, slot5)
		uv6 = "func"
		slot6 = slot6.func

		slot6()

		uv6 = "func"

		slot6:initBottomPanel()

		slot7 = nil

		for slot11 = 1, #clone(slot2) do
			slot13 = slot6[slot11].csvID
			uv15 = "initBottomPanel"

			if gShopType[slot15] then
				uv15 = "initBottomPanel"

				if gShopType[slot15][slot13] then
					uv15 = "initBottomPanel"

					if gShopType[slot15][slot13].sortValue then
						uv15 = "initBottomPanel"
						slot12.sortValue = gShopType[slot15][slot13].sortValue
						slot7 = true
					end
				end
			end

			if slot1[slot13] then
				slot14 = slot1[slot13]
				slot12.buyTimes = slot14[1]
				slot12.lastRecoverTime = slot14[2]

				if slot12.lastRecoverTime then
					slot17 = slot12.buyTimes or 0
					slot12.lastRecoverTime = math.floor(slot12.lastRecoverTime)

					if slot15.exchangeLimit <= math.floor((time.getTime() - slot12.lastRecoverTime) / (gShopType[slot12.type][slot12.csvID].regainHour * 60 * 60)) + slot15.exchangeLimit - slot12.buyTimes then
						slot12.timeStr = nil
					else
						slot12.timeStr = time.getCutDown(math.abs(math.floor((slot20 + 1) * slot16 - slot19))).str
					end

					if slot12.recoverTimes ~= slot21 then
						slot12.recoverTimes = slot21
					end
				end
			end

			uv14 = "func"

			if slot3[slot14.shopInfo.modelName] and slot3[slot14][slot13] then
				slot12.shopLimit = slot3[slot14][slot13]
			end
		end

		if slot7 then
			table.sort(slot6, function (slot0, slot1)
				if slot0.sortValue ~= slot1.sortValue then
					return slot0.sortValue < slot1.sortValue
				end

				return slot0.csvID < slot1.csvID
			end)
		end

		slot8 = dataEasy.tryCallFunc
		uv9 = "func"

		slot8(slot9.list, "updatePreloadCenterIndex")

		uv8 = "func"

		slot8.shopData:update(slot6)
	end)
end

function slot1.getstartBuyInfo(slot0, slot1, slot2)
	slot4 = 1

	return "num", (slot1.exchangeLimit ~= -1 or math.huge) and math.min(slot2.recoverTimes or slot1.exchangeLimit - (slot2.buyTimes or 0), slot1.exchangeLimit)
end

return slot1
