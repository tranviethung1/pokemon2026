slot0 = require("app.views.city.adventure.dispatch_task.tools")
slot1 = {
	"city/adventure/dispatchtask/icon_rarity1.png",
	"city/adventure/dispatchtask/icon_rarity2.png",
	"city/adventure/dispatchtask/icon_rarity3.png",
	"city/adventure/dispatchtask/icon_rarity4.png",
	"city/adventure/dispatchtask/icon_rarity5.png"
}
slot2 = {
	cc.c4b(92, 153, 112, 255),
	cc.c4b(61, 138, 153, 255),
	cc.c4b(138, 92, 153, 255),
	cc.c4b(230, 153, 0, 255),
	cc.c4b(241, 59, 84, 255)
}
slot3 = class("DispatchTaskOneKeyDetailView", Dialog)
slot3.RESOURCE_FILENAME = "dispatch_task_reward_detail.json"
slot3.RESOURCE_BINDING = {
	item = "item",
	list = "list",
	sureBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSureBtnClick")
			}
		}
	},
	["sureBtn.text"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot3.onCreate(slot0, slot1)
	Dialog.onCreate(slot0)

	slot0.taskDatas = {}
	slot2 = {}

	for slot6, slot7 in ipairs(slot1) do
		slot8 = csv.dispatch_task.tasks[slot7.csvID]
		slot9 = slot7.ending_time or 0

		for slot14, slot15 in pairs(slot7.result or {}) do
			table.insert({}, {
				extra = false,
				key = slot14,
				num = slot15
			})
		end

		for slot14, slot15 in pairs(slot7.extra or {}) do
			table.insert(slot10, {
				extra = true,
				key = slot14,
				num = slot15
			})
		end

		table.insert(slot2, {
			name = slot8.name,
			award = slot10,
			quality = slot8.quality
		})
	end

	table.sort(slot2, function (slot0, slot1)
		return slot1.quality < slot0.quality
	end)

	slot0.taskDatas = slot2

	slot0.list:setScrollBarEnabled(false)
	slot0:sweepAction()
end

function slot3.sweepAction(slot0)
	slot1 = 1
	slot2 = 0
	slot3 = 0.3

	slot0:enableSchedule():schedule(function (slot0)
		uv1 = "taskDatas"
		uv0 = 4503599627370499.0
		uv1 = "taskDatas"
		uv2 = "item"

		if slot1 + slot0 < slot2 then
			return
		end

		uv0 = slot0
		uv1 = "clone"
		uv2 = "show"
		slot1 = slot1.taskDatas[slot2]
		uv2 = "show"
		uv3 = "clone"

		if slot2 <= #slot3.taskDatas then
			uv2 = "clone"
			slot2 = slot2.item:clone():show()
			slot6 = "name"
			slot3 = slot2:multiget("list", slot6, "icon")
			uv6 = "multiget"
			slot6 = slot6[slot1.quality]

			slot3.icon:texture(slot6)

			uv6 = "list"

			slot3.name:color(slot6[slot1.quality]):text(slot1.name)

			slot5 = slot3.name

			adapt.oneLinePos(slot5, slot3.icon, cc.p(10, 0))

			slot4 = uiEasy.createItemsToList
			uv5 = "clone"

			slot4(slot5, slot3.list, slot1.award, {
				onAfterBuild = function ()
					uv0 = "list"

					slot0.list:setItemAlignCenter()
				end,
				sortFunc = function (slot0, slot1)
					if slot0.extra ~= slot1.extra then
						return not slot0.extra
					end

					return dataEasy.sortItemCmp(slot0, slot1)
				end
			})

			uv4 = "clone"

			slot4.list:pushBackCustomItem(slot2)
		else
			uv2 = "clone"
			slot2 = slot2.item:clone():show()
			slot3 = slot2:multiget("list", "name", "icon")

			itertools.invoke({
				slot2:get("list"),
				slot2:get("name"),
				slot2:get("icon")
			}, "hide")

			slot4 = widget.addAnimationByKey(slot2, "level/saodangchenggong.skel", "paiqianwancheng", "paiqianwancheng", 100)

			slot4:alignCenter(slot2:size())

			slot5 = slot4.addPlay

			slot5(slot4, "paiqianwancheng_loop")

			uv5 = "clone"

			slot5.list:pushBackCustomItem(slot2)
		end

		slot2 = performWithDelay
		uv3 = "clone"

		slot2(slot3, function ()
			uv0 = "list"

			slot0.list:scrollToBottom(0.15, true)
		end, 0.016666666666666666)

		uv2 = "show"
		uv3 = "clone"

		if slot2 == #slot3.taskDatas + 1 then
			uv2 = "clone"

			slot2:unSchedule("detailView")
		end

		uv2 = "show"
		slot2 = slot2 + 1
		uv3 = 0.016666666666666666
	end, 0.016666666666666666, 0, "detailView")
end

function slot3.onSureBtnClick(slot0)
	slot0:onClose()
end

return slot3
