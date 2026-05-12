slot0 = class("RechargeVipView", Dialog)
slot0.RESOURCE_FILENAME = "recharge_vip.json"
slot0.RESOURCE_BINDING = {
	name = "panelName",
	list = "list",
	animation = "animation",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnGo = {
		varname = "btnGo",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onGoClick")
			}
		}
	},
	icon = {
		varname = "icon",
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onIconClick")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "onHonourableVip",
					onNode = function (slot0)
						slot0:xy(70, 65):scale(0.3)
					end
				}
			}
		}
	}
}

function slot0.onCreate(slot0)
	Dialog.onCreate(slot0, {
		clickClose = false
	})

	slot1 = slot0.btnGo:size()
	slot6 = "effect_loop"
	slot7 = 6

	widget.addAnimationByKey(slot0.btnGo, "effect/jiantou.skel", "efc1", slot6, slot7):xy(slot1.width / 2 - 60 + 20, slot1.height / 2)

	slot2 = nil

	for slot6, slot7 in orderCsvPairs(csv.gift) do
		if slot7.type == 100 then
			slot2 = slot6

			break
		end
	end

	if slot2 then
		uiEasy.createItemsToList(slot0, slot0.list, csv.gift[slot2].award, {
			margin = 40,
			onAfterBuild = function (slot0)
				slot0:setItemAlignCenter()
			end
		})
	end

	if csvSize(gVipCsv[gGameModel.monthly_record:read("vip")].monthGift) >= 1 then
		slot0:animationUpdata(true)
	else
		slot0:boxState(false)
	end

	userDefault.setForeverLocalKey("rechargeVip", true)
end

function slot0.onGoClick(slot0)
	cc.Application:getInstance():openURL("https://wpa1.qq.com/uHFUG3Gs?_type=wpa&qidian=true")
end

function slot0.animationUpdata(slot0, slot1)
	if slot1 then
		slot3, slot4 = csvNext(gGameModel.monthly_record:read("vip_gift"))

		if not slot4 or slot4 ~= 0 then
			widget.addAnimation(slot0.animation, "effect/jiedianjiangli.skel", "effect_loop", 1):xy(100, 40):scale(0.7)
			slot0:boxState(true)
		else
			slot0:boxState(false)
		end
	else
		slot0.animation:removeAllChildren()
		slot0:boxState(false)
	end
end

function slot0.boxState(slot0, slot1)
	slot0.panelName:visible(slot1)
	slot0.icon:setEnabled(slot1)
	slot0.icon:scale(slot1 and 3 or 1)
	slot0.icon:texture(slot1 and "config/item/box/icon_fslh_2_5.png" or "city/recharge/icon_vip_gbbz.png")
end

function slot0.onIconClick(slot0)
	gGameUI:stackUI("city.vip_distinguished", nil, , slot0:createHandler("animationUpdata"))
end

return slot0
