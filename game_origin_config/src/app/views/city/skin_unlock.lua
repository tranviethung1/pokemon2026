slot0 = class("skinUnlockView", Dialog)
slot0.RESOURCE_FILENAME = "skin_unlock.json"
slot0.RESOURCE_BINDING = {
	textPanel = "textPanel",
	list = "list",
	["btnConfirm.textNote"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	btnConfirm = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("btnConfirmClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot2 = {}
	slot3 = {}
	slot4 = {}

	for slot8, slot9 in ipairs(slot1) do
		table.insert(slot2, gSkinCsv[slot9.gain].name)

		slot13 = slot9.src

		table.insert(slot3, gSkinCsv[slot13].name)

		for slot13, slot14 in orderCsvPairs(csv.items) do
			if slot14.specialArgsMap.skinID == slot9.gain and slot14.specialArgsMap.days == 0 then
				slot4[slot14.id] = 1

				break
			end
		end
	end

	rich.createWithWidth("#C0x5B545B#" .. string.format(gLanguageCsv.skinGive, table.concat(slot3, ","), table.concat(slot2, ",")), 40, nil, 800):addTo(slot0.textPanel):alignCenter(slot0.textPanel:size())

	slot0.skinGiveData = slot1

	adapt.setTextAdaptWithSize(slot0.text, {
		maxLine = 2,
		size = cc.size(960, 200)
	})

	if itertools.size(slot4) > 0 then
		uiEasy.createItemsToList(slot0, slot0.list, slot4, {
			margin = 40,
			onAfterBuild = function (slot0)
				slot0:setItemAlignCenter()
			end
		})
	end

	Dialog.onCreate(slot0)

	game.SKIN_GIVE = true
end

function slot0.btnConfirmClick(slot0)
	slot0:onClose()
end

function slot0.onClose(slot0)
	Dialog.onClose(slot0)
end

return slot0
