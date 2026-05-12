slot0 = cc.load("mvc").ViewBase
slot1 = class("ActivityGamePassportBuyView", Dialog)
slot1.RESOURCE_FILENAME = "activity_game_passport_buy.json"
slot1.RESOURCE_BINDING = {
	subList = "subList",
	item = "item",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				xMargin = 0,
				yMargin = 0,
				data = bindHelper.self("itemDatas1"),
				columnSize = bindHelper.self("midColumnSize"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							data = {
								key = slot3.key,
								num = slot3.num
							}
						}
					})
				end
			}
		}
	},
	list1 = {
		varname = "list1",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				xMargin = 0,
				yMargin = 0,
				data = bindHelper.self("itemDatas2"),
				columnSize = bindHelper.self("midColumnSize"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							data = {
								key = slot3.key,
								num = slot3.num
							},
							onNode = function (slot0)
								slot1 = ccui.ImageView:create("common/btn/btn_lock1.png"):addTo(slot0, 1000, "img"):xy(160, 160)
							end
						}
					})
				end
			}
		}
	},
	btn = {
		varname = "btn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBuyClick")
			}
		}
	},
	text = {
		varname = "text1",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 8,
					color = cc.c4b(251, 110, 70, 255)
				}
			}
		}
	},
	text1 = {
		varname = "text2",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(97, 91, 97, 255)
				}
			}
		}
	},
	text2 = {
		varname = "text3",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(97, 91, 97, 255)
				}
			}
		}
	},
	text3 = {
		varname = "text4",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(97, 91, 97, 255)
				}
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0:initModel()

	slot0.cb = slot2
	slot0.endDate = csv.yunying.yyhuodong[slot1].endDate
	slot0.activityId = slot1
	slot0.itemDatas1 = idlers.newWithMap({})
	slot0.itemDatas2 = idlers.newWithMap({})
	slot0.midColumnSize = 4
	slot4 = {}
	slot5 = {}

	for slot10, slot11 in csvMapPairs(csv.yunying.playpassport_recharge) do
		if slot11.huodongID == slot3.huodongID then
			slot0.csvId = slot10
		end
	end

	slot12 = slot6[slot0.csvId].rechargeID

	slot0.btn:get("txt"):text(string.format(gLanguageCsv.symbolMoney, csv.recharges[slot12].rmbDisplay))

	slot8 = false

	for slot12, slot13 in csvPairs(csv.yunying.playpassport_award) do
		if slot13.huodongID == slot3.huodongID and slot13.level <= slot0.yyhuodongs:read()[slot0.activityId].info.level then
			for slot17, slot18 in csvMapPairs(slot13.eliteAward) do
				for slot22, slot23 in ipairs(slot4) do
					if slot23.key == slot17 then
						slot23.num = slot23.num + slot18
						slot8 = true

						break
					end
				end

				if slot8 == false then
					table.insert(slot4, {
						key = slot17,
						num = slot18
					})
				else
					slot8 = false
				end
			end
		end
	end

	slot0.itemDatas1:update(slot4)

	for slot12, slot13 in csvPairs(csv.yunying.playpassport_award) do
		if slot13.huodongID == slot3.huodongID and slot7 < slot13.level then
			for slot17, slot18 in csvMapPairs(slot13.eliteAward) do
				for slot22, slot23 in ipairs(slot5) do
					if slot23.key == slot17 then
						slot23.num = slot23.num + slot18
						slot8 = true

						break
					end
				end

				if slot8 == false then
					table.insert(slot5, {
						key = slot17,
						num = slot18
					})
				else
					slot8 = false
				end
			end
		end
	end

	slot0.itemDatas2:update(slot5)

	if itertools.isempty(slot5) then
		slot0.list1:hide()
		slot0.text4:show()
		slot0.text4:text(gLanguageCsv.gamePassportBuyText)
	else
		slot0.list1:show()
		slot0.text4:hide()
	end

	Dialog.onCreate(slot0)
end

function slot1.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
end

function slot1.onBuyClick(slot0)
	slot1 = time.getNumTimestamp(slot0.endDate) - time.getTime()
	slot2, slot3 = math.modf(slot1 / 86400)
	slot4 = gLanguageCsv.passwordTitleTip
	slot5 = gLanguageCsv.passwordBuyVipNote

	function slot7()
		slot0 = csv.yunying.playpassport_recharge
		uv3 = "csv"
		uv5 = "csv"
		slot5 = slot0[slot5.csvId].rechargeID
		uv5 = "csv"
		slot5 = slot5.activityId
		uv5 = "csv"
		slot5 = slot5.csvId
		uv5 = "csv"

		gGameApp:payDirect(slot3, {
			buyTimes = 0,
			rechargeId = slot5,
			yyID = slot5,
			csvID = slot5,
			name = slot0[slot5.csvId].name
		}):sdkLongTimeCb():serverCb(function ()
			uv0 = "onCloseFast"

			slot0:onCloseFast()
		end):doit()
	end

	if slot1 < 7 * 24 * 3600 then
		slot5 = string.format(gLanguageCsv.playPasswordBuyVipTips, slot2)

		if slot2 < 1 then
			slot5 = gLanguageCsv.passwordLastdayNote
		end

		gGameUI:showDialog({
			isRich = false,
			btnType = 2,
			title = slot4,
			cb = slot7,
			content = slot5,
			dialogParams = {
				clickClose = false
			}
		})
	else
		slot7()
	end
end

function slot1.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

return slot1
