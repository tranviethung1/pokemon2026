slot0 = class("Double11Scratch", Dialog)
slot0.RESOURCE_FILENAME = "double_11_scratch.json"
slot0.RESOURCE_BINDING = {
	["imgBG.imgGJ"] = {
		varname = "imgGJ",
		binds = {
			event = "touch",
			scaletype = 0,
			method = bindHelper.self("onScratchClick")
		}
	},
	["imgBG.textNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("num")
		}
	},
	btnClose = {
		binds = {
			{
				event = "touch",
				method = bindHelper.self("onClose")
			},
			{
				event = "visible",
				idler = bindHelper.self("opened")
			}
		}
	},
	textNote = {
		binds = {
			event = "visible",
			idler = bindHelper.self("opened")
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2, slot3)
	slot0.opened = idler.new(false)
	slot0.csvId = slot2
	slot0.num = idler.new(string.format(gLanguageCsv.double11Num, slot3))

	Dialog.onCreate(slot0)

	slot0.activityId = slot1
	slot0.moveLength = 0
	slot0.lastX = 0
	slot0.lastY = 0
end

function slot0.onScratchClick(slot0, slot1, slot2)
	if slot2.name == "began" then
		slot0.lastX = slot2.x
		slot0.lastY = slot2.y
	elseif slot2.name == "moved" then
		slot0.moveLength = slot0.moveLength + math.sqrt(math.pow(slot0.lastX - slot2.x, 2) + math.pow(slot0.lastY - slot2.y, 2))
		slot0.lastX = slot2.x
		slot0.lastY = slot2.y

		if slot0.moveLength > 2000 then
			slot1:texture("activity/double_11/img_guakai_3.png")
		elseif slot0.moveLength > 1350 then
			slot1:texture("activity/double_11/img_guakai_2.png")
		elseif slot0.moveLength > 600 then
			slot1:texture("activity/double_11/img_guakai_1.png")
		end
	elseif slot2.name == "ended" and slot0.moveLength > 2000 then
		gGameApp:requestServer("/game/yy/double11/card/open", function (slot0)
			uv1 = "opened"
			slot1 = slot1.opened
			slot1 = slot1.set

			slot1(slot1, true)

			uv1 = "set"

			slot1:hide()
		end, slot0.activityId, slot0.csvId)
	end
end

function slot0.onClose(slot0)
	if slot0.opened:read() == true then
		Dialog.onClose(slot0)
	end
end

return slot0
