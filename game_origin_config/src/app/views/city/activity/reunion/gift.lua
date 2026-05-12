slot0 = {
	received = 2,
	noReach = 0,
	canReceive = 1
}
slot1 = {
	reunion = 2,
	gift = 1
}
slot2 = {
	ReunionGift = 1,
	TaskAward = 3,
	BindAward = 2,
	PointAward = 4
}
slot3 = class("ReunionGiftView", cc.load("mvc").ViewBase)
slot3.RESOURCE_FILENAME = "reunion_gift.json"
slot3.RESOURCE_BINDING = {
	["rightPanel.list"] = "list",
	["rightPanel.textList"] = "textList",
	["rightPanel.receivebtn.label"] = "receivebtnLabel",
	["rightPanel.title"] = {
		varname = "title",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(242, 122, 96, 255)
				},
				shadow = {
					size = 6,
					color = cc.c4b(195, 109, 72, 255),
					offset = cc.size(0, -6)
				}
			}
		}
	},
	["rightPanel.receivebtn"] = {
		varname = "receivebtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onReceiveClick")
			}
		}
	}
}

function slot3.onCreate(slot0, slot1)
	slot0.yyID = slot1

	slot0:initModel()

	for slot6, slot7 in csvPairs(csv.yunying.reunion_gift) do
		if slot7.huodongID == csv.yunying.yyhuodong[slot1].huodongID then
			uv9 = "yyID"

			if slot7.type == slot9.gift then
				uiEasy.createItemsToList(slot0, slot0.list, slot7.item)

				slot0.csvID = slot6
			end
		end
	end

	beauty.textScroll({
		fontSize = 40,
		isRich = true,
		verticalSpace = 20,
		list = slot0.textList,
		strs = string.format(gLanguageCsv.reunionGiftText, slot0.reunion:read().info.days, csv.scene_conf[slot0.reunion:read().info.gate].sceneName or "")
	})

	slot0.datas = idlers.new()

	idlereasy.when(slot0.reunion, function (slot0, slot1)
		uv3 = "text"

		text.deleteAllEffect(slot3.receivebtnLabel)

		if not slot1.gift then
			slot2 = cache.setShader
			uv3 = "text"

			slot2(slot3.receivebtn, false, "hsl_gray")

			uv2 = "text"
			slot2 = slot2.receivebtnLabel
			slot2 = slot2.text

			slot2(slot2, gLanguageCsv.notReach)

			uv2 = "text"

			slot2.receivebtn:setTouchEnabled(false)
		elseif slot1.gift.reunion then
			uv3 = "text"

			if slot1.gift.reunion[1] == slot3.csvID then
				uv3 = "deleteAllEffect"

				if slot1.gift.reunion[2] == slot3.canReceive then
					slot2 = cache.setShader
					uv3 = "text"

					slot2(slot3.receivebtn, false, "normal")

					uv2 = "text"
					slot2 = slot2.receivebtnLabel
					slot3 = slot2

					slot2.text(slot3, gLanguageCsv.spaceReceive)

					slot2 = text.addEffect
					uv3 = "text"

					slot2(slot3.receivebtnLabel, {
						glow = {
							color = ui.COLORS.GLOW.WHITE
						}
					})

					uv2 = "text"

					slot2.receivebtn:setTouchEnabled(true)
				end
			end
		elseif slot1.gift.reunion then
			uv3 = "text"

			if slot1.gift.reunion[1] == slot3.csvID then
				uv3 = "deleteAllEffect"

				if slot1.gift.reunion[2] == slot3.received then
					slot2 = cache.setShader
					uv3 = "text"

					slot2(slot3.receivebtn, false, "hsl_gray")

					uv2 = "text"
					slot2 = slot2.receivebtnLabel
					slot2 = slot2.text

					slot2(slot2, gLanguageCsv.received)

					uv2 = "text"

					slot2.receivebtn:setTouchEnabled(false)
				end
			end
		end
	end)
end

function slot3.initModel(slot0)
	slot0.reunion = gGameModel.role:getIdler("reunion")
end

function slot3.onReceiveClick(slot0)
	if slot0.reunion:read().info.end_time - time.getTime() < 0 then
		gGameUI:showTip(gLanguageCsv.activityOver)

		return
	end

	uv7 = "reunion"

	gGameApp:requestServer("/game/yy/reunion/award/get", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.yyID, slot0.csvID, slot7.ReunionGift)
end

return slot3
