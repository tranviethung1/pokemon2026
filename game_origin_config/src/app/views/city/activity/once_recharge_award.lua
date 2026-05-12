slot0 = {
	count = 1
}
slot1 = 7
slot2 = {
	get = 1,
	got = 0,
	none = 2
}
slot3 = class("OnceRechargeAwardView", Dialog)
slot3.RESOURCE_FILENAME = "activity_once_recharge_award.json"
slot3.RESOURCE_BINDING = {
	time = "countTime",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnRules = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRules")
			}
		}
	},
	tips = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c4b(25, 85, 168, 255)
				}
			}
		}
	}
}

function slot3.onCreate(slot0, slot1)
	slot0.yyCfg = csv.yunying.yyhuodong[slot1]
	slot0.activityId = slot1

	slot0:enableSchedule()
	slot0:initModel()
	slot0:initRecharge()
	slot0:initCountTime()
	slot0:initSkel()
	Dialog.onCreate(slot0, {
		blackType = 1
	})
end

function slot3.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.yyEndtime = gGameModel.role:getIdler("yy_endtime")
end

function slot3.initRecharge(slot0)
	slot1 = csv.yunying.oncerechage

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "activityId"
		slot3 = (slot1[slot2.activityId] or {}).stamps or {}
		slot4 = {}

		for slot8, slot9 in orderCsvPairs(csv.yunying.oncerechage) do
			uv10 = "activityId"

			if slot10.yyCfg.huodongID == slot9.huodongID then
				slot10 = {
					csvId = slot8,
					cfg = slot9
				}

				if not slot3[slot8] or not slot3[slot8] then
					uv11 = "stamps"
					slot11 = slot11.none
				end

				slot10.state = slot11

				table.insert(slot4, slot10)
			end
		end

		uv6 = "orderCsvPairs"

		for slot8 = 1, slot6 do
			uv10 = "activityId"
			slot10 = slot10:getResourceNode():get("rechargeItem" .. slot8)

			slot10:visible(slot4[slot8] ~= nil)

			slot11 = slot10:multiget("txtTitleNode", "rechargeNum", "iconDiamondTtitle", "icon", "txtDescNode", "awardNum", "btnRecharge", "txtGot")

			if slot9 then
				slot11.rechargeNum:text(slot9.cfg.needRmb)
				slot11.icon:texture(slot9.cfg.icon)

				slot12, slot13 = csvNext(slot9.cfg.award)

				slot11.awardNum:text(slot13)

				slot15 = slot11.txtDescNode

				text.addEffect(slot15, {
					outline = {
						size = 3,
						color = cc.c4b(61, 133, 204, 255)
					}
				})

				uv15 = "activityId"
				slot17 = {
					methods = {
						ended = function ()
							uv0 = "onRechargeClick"
							uv2 = "state"
							uv3 = "state"

							slot0:onRechargeClick(slot2.state, slot3.csvId)
						end
					}
				}

				bind.touch(slot15, slot11.btnRecharge, slot17)

				uv17 = "stamps"

				slot11.btnRecharge:get("txtNode"):text(slot9.state == slot17.none and gLanguageCsv.goRecharge .. "!" or gLanguageCsv.onlineGiftGet)

				uv17 = "stamps"

				slot11.btnRecharge:visible(slot9.state ~= slot17.got)

				uv17 = "stamps"

				slot11.txtGot:visible(slot9.state == slot17.got)
				adapt.oneLineCenterPos(cc.p(213, 504), {
					slot11.txtTitleNode,
					slot11.rechargeNum,
					slot11.iconDiamondTtitle
				}, cc.p(5, 0))

				slot15 = slot10

				slot10.removeChildByName(slot15, "rechargeAndGotSkel")

				uv15 = "stamps"

				if slot9.state ~= slot15.got then
					slot15 = widget.addAnimationByKey(slot10, "chongzhifanzuan/chongzhifanzuan.skel", "rechargeAndGotSkel", "effect_kechongzhi_loop", 99):anchorPoint(cc.p(0.5, 0.5)):xy(slot11.btnRecharge:x(), slot11.btnRecharge:y())
					slot16 = slot15

					slot15.scale(slot16, 2)

					uv16 = "stamps"

					if slot9.state == slot16.get then
						slot14:play("effect_kelingqu_loop")
					end
				end
			end
		end
	end)
end

function slot3.onRechargeClick(slot0, slot1, slot2)
	uv3 = "none"

	if slot1 == slot3.none then
		jumpEasy.jumpTo("recharge")
	else
		uv3 = "none"

		if slot1 == slot3.get then
			gGameApp:requestServer("/game/yy/award/get", function (slot0)
				gGameUI:showGainDisplay(slot0)
			end, slot0.activityId, slot2)
		else
			printWarn("error state")
		end
	end
end

function slot3.initCountTime(slot0)
	uv2 = "activityId"

	slot0:unSchedule(slot2.count)

	slot4 = 0

	if slot0.yyEndtime:read()[slot0.activityId] then
		slot4 = slot3[slot1] - time.getTime()
	end

	slot0:schedule(function ()
		uv0 = "countTime"
		uv0 = 1
		uv0 = "text"
		slot0 = (slot0 - 1).countTime
		slot0 = slot0.text
		uv3 = "countTime"

		slot0(slot0, time.getCutDown(slot3, true).str)

		uv0 = "countTime"

		if slot0 <= 0 then
			uv0 = "text"

			slot0:onClose()

			return false
		end
	end, 1, 0, slot2)
end

function slot3.initSkel(slot0)
	slot1 = slot0:getResourceNode()

	widget.addAnimationByKey(slot1, "chongzhifanzuan/chongzhifanzuan.skel", "bgSkel", "effect_shanguang_loop", 99):anchorPoint(cc.p(0.5, 0.5)):xy(slot1:width() / 2, slot1:height() / 2):scale(2)
end

function slot3.onRules(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 750
	})
end

function slot3.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.rules)
		end),
		slot2.noteText(71001, 71004)
	}
end

return slot3
