slot0 = class("VipDistinguishedView", Dialog)
slot0.RESOURCE_FILENAME = "vip_distinguished.json"
slot0.RESOURCE_BINDING = {
	text1 = "text1",
	text2 = "text2",
	list = "list",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnSell = {
		varname = "btnSell",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("btnSellClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.roleVip = gGameModel.monthly_record:read("vip")
	slot0.cb = slot1
	slot0.isHas = true
	slot3, slot4 = csvNext(gGameModel.monthly_record:read("vip_gift"))

	if slot4 and slot4 == 0 then
		uiEasy.setBtnShader(slot0.btnSell, false, 2)
		slot0.btnSell:get("textNote"):text(gLanguageCsv.received)
	end

	slot0.text1:text(gLanguageCsv.giftsHint1)
	slot0.text2:text(gLanguageCsv.giftsHint2)

	if matchLanguage({
		"en"
	}) then
		adapt.setTextAdaptWithSize(slot0.text1, {
			margin = -5,
			vertical = "center",
			horizontal = "center",
			maxLine = 2,
			size = cc.size(960, 200)
		})
		slot0.text2:setPositionY(885)
	end

	uiEasy.createItemsToList(slot0, slot0.list, gVipCsv[slot0.roleVip].monthGift, {
		margin = 40,
		onAfterBuild = function (slot0)
			slot0:setItemAlignCenter()
		end
	})
	Dialog.onCreate(slot0)
end

function slot0.btnSellClick(slot0)
	gGameApp:requestServer("/game/role/vip/month/gift", function (slot0)
		uv1 = "isHas"
		slot1.isHas = false

		gGameUI:showGainDisplay(slot0.view, {
			raw = false,
			cb = function ()
				slot0 = uiEasy.setBtnShader
				uv1 = "uiEasy"

				slot0(slot1.btnSell, false, 2)

				uv0 = "uiEasy"

				slot0.btnSell:get("textNote"):text(gLanguageCsv.received)
			end
		})
	end)
end

function slot0.onClose(slot0)
	if slot0.cb then
		slot0.cb(slot0.isHas)
	end

	Dialog.onClose(slot0)
end

return slot0
