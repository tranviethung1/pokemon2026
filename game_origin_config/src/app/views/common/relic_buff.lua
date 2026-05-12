slot1 = class("RelicBuffView", cc.load("mvc").ViewBase)
slot2 = 55
slot1.RESOURCE_FILENAME = "town_sprite_benediction.json"
slot1.RESOURCE_BINDING = {
	["baseNode.bg.txt2"] = "txt2",
	["baseNode.bg.list"] = "list",
	["baseNode.bg"] = "bg",
	["baseNode.bg.item"] = "item",
	baseNode = "baseNode",
	["baseNode.bg.txt1"] = "txt1",
	["baseNode.bg.title"] = "title"
}

function slot1.onCreate(slot0, slot1)
	slot1 = slot1 or {}
	slot0.params = slot1

	slot0.baseNode:x(slot0.baseNode:x() + (slot1.offsetX or 0))
	slot0.baseNode:y(slot0.baseNode:y() + (slot1.offsetY or 0))
	slot0:enableSchedule()
	slot0:initModel()
	slot0.list:setScrollBarEnabled(false)
	idlereasy.when(slot0.relicBuff, function (slot0, slot1)
		uv2 = "list"

		slot2.list:removeAllChildren()

		slot2 = 0
		slot4 = {}
		slot6 = slot1 or {}

		for slot8, slot9 in pairs(slot6) do
			if slot8 ~= 0 then
				uv10 = "removeAllChildren"

				if slot10.type then
					uv10 = "removeAllChildren"

					if slot10.type == slot8 then
						for slot13 = 2, math.huge do
							slot4[slot8] = slot4[slot8] or {}

							if slot9[slot13] then
								slot2 = slot2 + 1

								table.insert(slot4[slot8], slot9[slot13])
							else
								break
							end
						end
					end
				end
			end
		end

		uv6 = "list"
		slot6 = slot6.txt1:clone()
		slot7 = slot6
		slot6 = slot6.show(slot7)
		uv7 = "list"

		slot7.list:pushBackCustomItem(slot6)

		for slot11, slot12 in pairs({
			[slot8] = slot9[1]
		}) do
			slot7 = 0 + 1
			uv13 = "list"
			uv17 = "list"
			slot5 = slot13:stringJoint(slot11, slot12, slot17.list, true, 0 + slot6:height())
		end

		if slot2 > 0 then
			uv8 = "list"
			slot8 = slot8.txt2:clone()
			slot9 = slot8
			slot8 = slot8.show(slot9)
			uv9 = "list"

			slot9.list:pushBackCustomItem(slot8)

			slot5 = slot5 + slot8:height()

			for slot12, slot13 in pairs(slot4) do
				for slot17, slot18 in ipairs(slot13) do
					uv19 = "list"
					uv23 = "list"
					slot5 = slot19:stringJoint(slot12, slot18, slot23.list, false, slot5)
				end
			end

			uv9 = "list"
			uv11 = "list"

			slot9.baseNode:y(slot11.baseNode:y() - 50)
		end

		uv9 = "list"

		slot9:setAdaptUI(slot5, slot7 + slot2)

		if slot1 then
			uv9 = "removeAllChildren"

			if not slot1[slot9.type] then
				uv9 = "removeAllChildren"

				if slot9.relicCb then
					uv9 = "removeAllChildren"

					slot9.relicCb()
				end
			end
		end
	end)
end

function slot1.initModel(slot0)
	slot0.relicBuff = gGameModel.town:getIdler("relic_buff")
end

function slot1.stringJoint(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = csv.town.relic_buff[slot2.buff_id]
	slot7 = ""

	if itertools.include({
		1,
		2,
		3,
		4,
		7,
		8,
		9,
		13
	}, slot1) then
		slot10 = slot6.param * 100 .. "%"

		if slot1 == 4 then
			slot7 = string.format(slot6.desc, slot10, slot10, slot6.effectiveTimes) .. (slot4 and " (" .. slot6.effectiveTimes - slot2.used_times .. "/" .. slot6.effectiveTimes .. ")" or "")
		else
			slot7 = string.format(slot6.desc, slot10, slot6.effectiveTimes) .. slot8
		end
	elseif slot1 == 5 then
		slot10 = slot6.param * 100 .. "%"
		slot11 = ""
		slot13 = slot6.duration * 60 * 60 + slot2.effect_time

		if slot4 and time.getTime() < slot13 then
			slot13 = slot13 - time.getTime()
			slot11 = " (" .. gLanguageCsv.exclusiveIconTime .. time.getCutDown(slot13).str .. ")"

			slot0:countDown(slot13)
		end

		slot7 = string.format(slot6.desc, slot10) .. slot11
	elseif slot1 == 6 then
		slot7 = string.format(slot6.desc, slot6.effectiveTimes) .. slot8
	elseif slot1 >= 10 and slot1 <= 12 then
		slot7 = string.format(slot6.desc, slot6.param * 100 .. "%", slot6.duration)
	end

	slot10 = 1150
	slot11 = slot0.item:clone()
	slot12 = rich.createWithWidth(slot7, 40, nil, slot10):anchorPoint(0.5, 0.5)

	slot11:height(slot12:height())
	slot12:addTo(slot11)
	slot3:pushBackCustomItem(slot11)
	slot12:xy(slot10 / 2 + 10, 20)

	slot13 = time.getDate(slot2.gotten_time)
	slot15 = rich.createByStr("#C0x5B545B#" .. ("--" .. string.format(gLanguageCsv.worldcupTime, slot13.month, slot13.day, slot13.hour, slot13.min) .. gLanguageCsv.homeVisitGain), 40)

	slot15:anchorPoint(cc.p(1, 0.5))
	slot15:formatText()

	slot16 = slot15:getContentSize()
	slot16.height = slot16.height + 15

	slot15:addTo(ccui.Layout:create():size(slot10, slot16.height):anchorPoint(0.5, 0.5):addTo(slot3, 100, "relicIcon"))
	slot15:xy(slot10, 20)
	ccui.Layout:create():size(slot10, 30):anchorPoint(0.5, 0.5):addTo(slot3, 100)

	return slot5 + slot11:height() + slot16.height + 30
end

function slot1.countDown(slot0, slot1)
	uv4 = "unSchedule"

	slot0:unSchedule(slot4)

	slot2 = slot1
	uv8 = "unSchedule"

	slot0:schedule(function ()
		uv0 = "unSchedule"
		uv0 = 1
		uv0 = "unSchedule"

		if slot0 - 1 < 0 then
			uv0 = "gGameApp"
			uv2 = "requestServer"

			slot0:unSchedule(slot2)
			gGameApp:requestServer("/town/relic/buff/refresh", function (slot0)
			end)
		end
	end, 1, 0, slot8)
end

function slot1.setAdaptUI(slot0, slot1, slot2)
	slot3 = slot0.list:height()
	slot4 = 980

	if slot0.params.dir == "down" then
		if slot1 < slot3 then
			slot5 = slot3 - slot1

			slot0.list:height(slot1)
			slot0.bg:height(slot0.bg:height() - slot5)
			slot0.bg:y(slot0.baseNode:height())
			slot0.title:y(slot0.title:y() - slot5)
		end
	elseif slot1 < slot3 then
		slot5 = slot3 - slot1

		slot0.list:height(slot1)
		slot0.bg:height(slot0.bg:height() - slot5)
		slot0.baseNode:height(slot0.bg:height())
		slot0.bg:y(slot0.baseNode:height())
		slot0.baseNode:y(slot0.baseNode:y() - slot5)
		slot0.title:y(slot0.title:y() - slot5)

		if slot0.params.dir == "top" then
			slot0.baseNode:y(520 - (({
				0,
				100,
				150,
				220
			})[slot2] or 0) + slot0.bg:height())
		end
	elseif slot0.params.dir == "top" then
		slot0.baseNode:y(220 + slot0.bg:height())
	end
end

function slot1.hitTestPanel(slot0, slot1)
	if slot0.list:isTouchEnabled() then
		slot2 = slot0.baseNode
		slot3 = slot2:box()
		slot4 = slot2:parent():convertToWorldSpace(cc.p(slot3.x, slot3.y))
		slot3.x = slot4.x
		slot3.y = slot4.y

		return cc.rectContainsPoint(slot3, slot1)
	end

	return false
end

return slot1
