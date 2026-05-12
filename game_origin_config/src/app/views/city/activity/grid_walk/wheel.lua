slot0 = 8
slot1 = 2
slot2 = 1
slot3 = 720
slot4 = require("app.views.city.activity.grid_walk.tools")
slot6 = class("GridWalkWheelView", cc.load("mvc").ViewBase)
slot6.RESOURCE_FILENAME = "grid_walk_wheel.json"
slot6.RESOURCE_BINDING = {
	wheelPanel = "wheelPanel",
	["wheelPanel.wheel"] = "wheel",
	["wheelPanel.wheelPointer"] = {
		varname = "wheelPointer",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onDraw")
			}
		}
	}
}

function slot6.onCreate(slot0, slot1)
	slot0.event = slot1.event
	slot0.callBack = slot1.callBack

	slot0:initModel()
	slot0:initReward()
	slot0:initSkel()
end

function slot6.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.yyId = gGameModel.role:read("grid_walk").yy_id
	slot0.opened = idler.new(false)
end

function slot6.initReward(slot0)
	slot0.rewardDatas = {}
	slot2 = slot0.yyId
	uv2 = "rewardDatas"
	uv3 = "rewardDatas"

	for slot6, slot7 in csvMapPairs(slot2.getCfgByEventFromEvents(slot3.EVENTS.goodLuck, csv.yunying.yyhuodong[slot2].huodongID).params.items) do
		table.insert(slot0.rewardDatas, {
			key = slot7[1],
			num = slot7[2]
		})
	end

	uv4 = "csv"

	for slot6 = 1, slot4 do
		slot8 = slot0.wheel:get("icon" .. slot6)

		if slot0.wheel:get("name" .. slot6) then
			slot7:text("")

			slot9 = slot0.rewardDatas[slot6]

			uiEasy.setIconName(slot9.key, slot9.num, {
				node = slot7
			})
			adapt.setTextAdaptWithSize(slot7, {
				vertical = "center",
				horizontal = "center",
				size = cc.size(260, 200)
			})

			slot10 = true

			if slot9.key == "card" then
				slot10 = false
			end

			bind.extend(slot0, slot8, {
				class = "icon_key",
				props = {
					data = slot9,
					simpleShow = slot10,
					onNode = function (slot0)
						slot0:scale(0.9)
					end
				}
			})
		end
	end
end

function slot6.onDraw(slot0)
	slot0.wheelPointer:setTouchEnabled(false)
	slot0.wheelSkel:play("effect_chou")

	slot1 = 0
	slot2 = 0
	slot3 = 0
	slot1, slot5, slot6 = slot0:getAniParams()

	slot0:wheelAni(slot1, slot5, slot6)
	performWithDelay(slot0, function ()
		slot0 = {
			[slot1.key] = slot3
		}
		uv1 = "rewardDatas"
		uv2 = "rewardDatas"
		slot1 = slot1.rewardDatas[slot2.event.params.outcome + 1]
		uv3 = "event"

		if slot1.key == slot1.num.BADGE_ID then
			uv2 = "rewardDatas"
			slot2.badgeNum = slot1.num
		end

		slot3 = gGameUI
		slot3 = slot3.showGainDisplay

		slot3(slot3, slot0, {
			cb = function ()
				uv0 = "opened"
				slot0 = slot0.opened
				slot0 = slot0.set

				slot0(slot0, true)

				uv0 = "opened"

				slot0:onClose()
			end
		})

		uv3 = "rewardDatas"
		slot3 = slot3.wheelSkel
		slot3 = slot3.play

		slot3(slot3, "effect_loop")

		uv3 = "rewardDatas"

		slot3.wheelPointer:setTouchEnabled(true)
	end, slot1)
end

function slot6.wheelAni(slot0, slot1, slot2, slot3)
	slot0.wheel:setRotation(0)

	slot6 = "EXPONENTIALOUT"
	uv6 = "wheel"
	slot6 = slot1 - slot6
	uv6 = "wheel"

	transition.executeSequence(slot0.wheel, true):easeBegin(slot6):rotateBy(slot6, slot2 - slot3):rotateBy(slot6, slot3 + 360):easeEnd():done()
end

function slot6.getAniParams(slot0)
	uv1 = "event"
	uv2 = "params"
	uv4 = "outcome"
	uv5 = "outcome"
	slot4 = (slot4 - (slot0.event.params.outcome + 1) + 1) / slot5 * 360

	return slot1, slot2 + slot4, slot4
end

function slot6.initSkel(slot0)
	slot0.wheelSkel = widget.addAnimationByKey(slot0.wheelPanel, "gridwalk/jianglidzp.skel", "wheelSkel", "effect_loop", 2)

	slot0.wheelSkel:anchorPoint(cc.p(0.5, 0.5)):xy(slot0.wheelPointer:x(), slot0.wheelPointer:y() - 10):scale(2)
end

function slot6.onClose(slot0)
	if slot0.opened:read() == true then
		slot1 = slot0.addCallbackOnExit

		slot1(slot0, functools.partial(slot0.callBack, slot0.badgeNum))

		uv1 = "opened"

		slot1.onClose(slot0)
	end
end

return slot6
