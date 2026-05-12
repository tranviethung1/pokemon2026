slot0 = cc.load("mvc").ViewBase
slot1 = class("ActivityPassportBuyView", Dialog)
slot2 = {
	[0] = {
		logo = "common/icon/sign_blue.png",
		name = gLanguageCsv.discountSingle
	},
	{
		logo = "common/icon/sign_orange.png",
		name = gLanguageCsv.hotness
	},
	{
		logo = "common/icon/sign_purple.png",
		name = gLanguageCsv.limit
	},
	{
		logo = "common/icon/sign_green.png",
		name = gLanguageCsv.new
	}
}
slot1.RESOURCE_FILENAME = "activity_passport_buy.json"
slot1.RESOURCE_BINDING = {
	item = "item",
	bg4 = "bg4",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	itemList = {
		varname = "itemList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				backupCached = false,
				data = bindHelper.self("itemDatas"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:multiget("imgTitle", "btnBuy", "txtList", "imgState", "txtDiscount", "line", "originalPrice", "icon").imgTitle:texture(slot3.cfg.res)

					if matchLanguage({
						"kr"
					}) then
						slot5.imgTitle:scale(1.9)
					end

					slot5.icon:texture(slot4.icon)

					slot7 = 0

					for slot11, slot12 in orderCsvPairs(csv.recharges) do
						if slot11 == slot4.rechargeID then
							slot7 = slot12.rmbDisplay

							slot5.btnBuy:getChildByName("txtNode"):text(string.format(gLanguageCsv.symbolMoney, slot12.rmbDisplay))

							break
						end
					end

					slot5.originalPrice:visible(slot4.logo == 0)
					slot5.line:visible(slot4.logo == 0)

					if slot4.logo then
						uv10 = "cfg"
						slot10 = slot10[slot4.logo].logo

						slot5.imgState:texture(slot10)

						uv10 = "cfg"

						slot5.txtDiscount:text(slot10[slot4.logo].name)
					else
						slot5.imgState:hide()
						slot5.txtDiscount:hide()
					end

					beauty.textScroll({
						align = "left",
						verticalSpace = 20,
						isRich = true,
						list = slot5.txtList,
						strs = slot4.desc
					})
					bind.touch(slot0, slot5.btnBuy, {
						clicksafe = true,
						methods = {
							ended = functools.partial(slot0.clickCell, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onBuyClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0:initModel()

	slot0.cb = slot2
	slot0.endDate = csv.yunying.yyhuodong[slot1].endDate
	slot0.activityId = slot1
	slot0.itemDatas = idlers.newWithMap({})
	slot5 = {}

	for slot9, slot10 in orderCsvPairs(csv.yunying.passport_recharge) do
		if slot10.type == 1 then
			table.insert(slot5, {
				cfg = slot10,
				csvId = slot9
			})
		end
	end

	slot0.itemDatas:update(slot5)

	slot6 = rich.createWithWidth(gLanguageCsv.passportBuyText, 35, nil, 1250):addTo(slot0.bg4, 10):anchorPoint(0.5, 0.5):xy(345, 48):scale(0.5):formatText()

	if matchLanguage({
		"kr"
	}) then
		slot6:scale(0.44)
		slot6:xy(290, 48)
	end

	Dialog.onCreate(slot0, {
		blackType = 1
	})
end

function slot1.initModel(slot0)
end

function slot1.onBuyClick(slot0, slot1, slot2)
	slot3 = time.getNumTimestamp(slot0.endDate) - time.getTime()
	slot4, slot5 = math.modf(slot3 / 86400)
	slot6 = gLanguageCsv.passwordTitleTip
	slot7 = gLanguageCsv.passwordBuyVipNote

	function slot8()
		uv2 = "gGameApp"
		uv4 = "payDirect"
		slot4 = slot4.cfg.rechargeID
		uv4 = "gGameApp"
		slot4 = slot4.activityId
		uv4 = "payDirect"
		slot4 = slot4.csvId
		uv4 = "payDirect"

		gGameApp:payDirect(slot2, {
			buyTimes = 0,
			rechargeId = slot4,
			yyID = slot4,
			csvID = slot4,
			name = slot4.cfg.name
		}):sdkLongTimeCb():serverCb(function ()
			slot0 = sdk.trackEvent

			slot0("tap_buypass")

			uv0 = "sdk"

			slot0:onCloseFast()
		end):doit()
	end

	if slot3 < 1209600 then
		slot7 = string.format(gLanguageCsv.passwordBuyVipTips, slot4)

		if slot4 < 1 then
			slot7 = gLanguageCsv.passwordLastdayNote
		end

		gGameUI:showDialog({
			isRich = false,
			btnType = 2,
			title = slot6,
			cb = slot8,
			content = slot7,
			dialogParams = {
				clickClose = false
			}
		})
	else
		slot8()
	end
end

function slot1.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

return slot1
