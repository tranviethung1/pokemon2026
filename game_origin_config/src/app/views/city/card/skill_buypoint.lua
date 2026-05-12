slot0 = cc.load("mvc").ViewBase
slot1 = class("CardSkillBuyPointView", Dialog)
slot1.RESOURCE_FILENAME = "card_skill_buypoint.json"
slot1.RESOURCE_BINDING = {
	pointNum = "pointNum",
	rmbNum = "rmbNum",
	vip = "vip",
	note2 = "note2",
	note5 = "note5",
	bg = "bg",
	rmbIcon = "rmbIcon",
	note3 = "note3",
	note6 = "note6",
	note1 = "note1",
	note4 = "note4",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	cancelBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	sureBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSureBtnClick")
			}
		}
	},
	surplusNum = {
		varname = "surplusNum",
		binds = {
			event = "text",
			idler = bindHelper.self("surplusNumTxt")
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.cb = slot1

	slot0:initModel()

	slot2 = slot0.vipLevel:read()
	slot4 = slot0.buySkillPointTimes:read()
	slot0.surplusNumTxt = idler.new(gVipCsv[slot2].buySkillPointTimes - slot4)
	slot5 = gCostCsv.skill_point_buy_cost
	slot0.cost = slot5[cc.clampf(slot4 + 1, 1, table.length(slot5))]

	slot0.rmbNum:text(slot0.cost)
	slot0.pointNum:text(20)

	if slot2 == 0 then
		slot0.vip:hide()
		slot0.note1:text(gLanguageCsv.youAreNotVIP)
		adapt.oneLineCenterPos(cc.p(slot0.bg:x(), slot0.note1:y()), {
			slot0.note1,
			slot0.note2,
			slot0.surplusNum,
			slot0.note3
		}, cc.p(15, 0))
	else
		slot0.vip:texture("common/icon/vip/icon_vip" .. slot2 .. ".png"):show()
		adapt.oneLineCenterPos(cc.p(slot0.bg:x(), slot0.note1:y()), {
			slot0.note1,
			slot0.vip,
			slot0.note2,
			slot0.surplusNum,
			slot0.note3
		}, cc.p(15, 0))
	end

	slot0.note4:anchorPoint(0, 0.5)
	slot0.note4:x(slot0.note1:x() - slot0.note1:width() * slot0.note1:anchorPoint().x)
	adapt.oneLinePos(slot0.note4, {
		slot0.pointNum,
		slot0.note5,
		slot0.rmbNum,
		slot0.rmbIcon
	}, cc.p(10, 0), "left")
	slot0.note6:x(slot0.bg:x())
	Dialog.onCreate(slot0, {
		clickClose = false
	})
end

function slot1.initModel(slot0)
	slot0.vipLevel = gGameModel.role:getIdler("vip_level")
	slot0.buySkillPointTimes = gGameModel.daily_record:getIdler("buy_skill_point_times")
	slot0.rmb = gGameModel.role:getIdler("rmb")
end

function slot1.onSureBtnClick(slot0)
	if slot0.surplusNumTxt:read() <= 0 then
		gGameUI:showTip(gLanguageCsv.insufficientPurchaseTimes)

		return
	end

	if slot0.rmb:read() < slot0.cost then
		gGameUI:showTip(gLanguageCsv.buyRMBNotEnough)

		return
	end

	sdk.trackEvent("buy_skillpt")

	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "surplusNumTxt"

	slot1.onClose(slot0)
end

return slot1
