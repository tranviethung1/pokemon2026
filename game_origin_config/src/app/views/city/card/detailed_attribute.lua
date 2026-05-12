slot0 = class("CardDetailedAttributeView", Dialog)
slot0.RESOURCE_FILENAME = "card_detailed_attribute.json"
slot0.RESOURCE_BINDING = {
	list = "list",
	closeBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot0.onCreate(slot0)
	slot1 = {}

	for slot5 = 1, 100 do
		if not csv.note[slot5] then
			break
		end

		slot6 = csv.note[slot5].fmt or ""
		slot7, slot8, slot9 = nil
		slot9 = string.find(slot6, "|") or 1

		table.insert(slot1, {
			str = "#C0x5B545B##L10#" .. string.sub(slot6, 0, slot9 - 1) .. "#L00#" .. string.sub(slot6, slot9 + 1, string.len(slot6))
		})
	end

	beauty.textScroll({
		margin = 21,
		align = "left",
		isRich = true,
		list = slot0.list,
		strs = slot1
	})
	Dialog.onCreate(slot0)
end

function slot0.onClose(slot0)
	Dialog.onClose(slot0)
end

return slot0
