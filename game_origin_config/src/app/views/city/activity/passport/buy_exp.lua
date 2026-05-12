slot0 = {
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
slot1 = class("ActivityPassportBuyExpView", Dialog)
slot1.RESOURCE_FILENAME = "activity_passport_buy_exp.json"
slot1.RESOURCE_BINDING = {
	itemList = "itemList",
	item = "item",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	expList = {
		varname = "expList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				asyncPreload = 6,
				backupCached = false,
				data = bindHelper.self("expDatas"),
				item = bindHelper.self("itemList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot3.cfg

					slot1:multiget("btnBuy", "txtExp", "imgState", "txtDiscount", "txtNode").txtExp:text("+" .. slot4.exp)

					if slot4.logo then
						uv8 = "cfg"
						slot8 = slot8[slot4.logo].logo

						slot5.imgState:texture(slot8)

						uv8 = "cfg"

						slot5.txtDiscount:text(slot8[slot4.logo].name)
					else
						slot5.imgState:visible(false)
						slot5.txtDiscount:visible(false)
					end

					for slot9, slot10 in orderCsvPairs(csv.recharges) do
						if slot9 == slot4.rechargeID then
							slot5.btnBuy:getChildByName("txtNode"):text(string.format(gLanguageCsv.symbolMoney, slot10.rmbDisplay))

							break
						end
					end

					slot7 = 1

					for slot12, slot13 in orderCsvPairs(csv.yunying.passport_award) do
						if slot13.huodongID == csv.yunying.yyhuodong[slot0.activityId()].huodongID then
							slot7 = slot13.level

							if 0 + slot13.needExp > slot3.currentExp + slot4.exp then
								break
							end
						end
					end

					slot5.txtNode:text(string.format(gLanguageCsv.buyToLevel, slot7))
					bind.touch(slot0, slot5.btnBuy, {
						clicksafe = true,
						methods = {
							ended = functools.partial(slot0.clickCell, slot3, slot3.currentExp + slot4.exp)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onBuyClick"),
				activityId = bindHelper.self("activityId")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0:initModel()

	slot0.activityId = slot1
	slot0.expDatas = idlers.newWithMap({})

	idlereasy.when(slot0.passport, function (slot0, slot1)
		slot2 = {}

		for slot6, slot7 in orderCsvPairs(csv.yunying.passport_recharge) do
			if slot7.type == 2 then
				table.insert(slot2, {
					cfg = slot7,
					currentExp = slot1.exp,
					csvId = slot6
				})
			end
		end

		uv3 = "orderCsvPairs"

		slot3.expDatas:update(slot2)
	end)
	Dialog.onCreate(slot0, {
		blackType = 1
	})
end

function slot1.initModel(slot0)
	slot0.passport = gGameModel.role:getIdler("passport")
end

function slot1.onBuyClick(slot0, slot1, slot2, slot3)
	for slot9, slot10 in orderCsvPairs(csv.yunying.passport_award) do
		if slot10.huodongID == csv.yunying.yyhuodong[slot0.activityId].huodongID then
			slot4 = 0 + slot10.needExp
		end
	end

	if slot4 < slot3 then
		gGameUI:showDialog({
			btnType = 2,
			title = "",
			content = gLanguageCsv.passportBuyExpOverflow,
			cb = function ()
				uv2 = "gGameApp"
				uv3 = "payCustom"
				slot3 = slot3.cfg.rechargeID
				uv3 = "gGameApp"
				slot3 = slot3.activityId
				uv3 = "payCustom"
				slot3 = slot3.csvId
				uv3 = "payCustom"

				gGameApp:payCustom(slot2):params({
					rechargeId = slot3,
					yyID = slot3,
					csvID = slot3,
					name = slot3.cfg.name
				}):serverCb(function ()
					uv0 = "onCloseFast"

					slot0:onCloseFast()
				end):doit()
			end
		})
	else
		slot6()
	end
end

function slot1.onClose(slot0)
	Dialog.onClose(slot0)
end

return slot1
