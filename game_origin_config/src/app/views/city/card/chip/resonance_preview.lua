slot0 = require("app.views.city.card.chip.tools")
slot1 = {
	{
		name = gLanguageCsv.chipResonanceDetail03,
		getStrFunc = function (slot0, slot1, slot2)
			return "        " .. string.format(gLanguageCsv.chipResonanceDetail01, slot0, slot1[1], ui.QUALITYCOLOR[slot1[2]], gLanguageCsv[ui.QUALITY_COLOR_TEXT[slot1[2]]], slot2)
		end
	},
	{
		name = gLanguageCsv.chipResonanceDetail04,
		getStrFunc = function (slot0, slot1, slot2)
			return "        " .. string.format(gLanguageCsv.chipResonanceDetail02, slot0, slot1[1], slot1[2], slot2)
		end
	}
}
slot2 = class("ChipResonancePreviewView", Dialog)
slot2.RESOURCE_FILENAME = "chip_resonance_detail.json"
slot2.RESOURCE_BINDING = {
	list = "list",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot2.onCreate(slot0)
	slot0:getResourceNode():get("img01"):hide()
	table.insert({}, "")

	for slot5, slot6 in pairs(gChipResonanceCsv) do
		uv7 = "getResourceNode"

		if slot7[slot5] then
			uv9 = "getResourceNode"

			table.insert(slot1, slot9[slot5].name)

			for slot10, slot11 in pairs(slot6) do
				slot12 = {}

				for slot16, slot17 in ipairs(slot11) do
					table.insert(slot12, slot17)
				end

				table.sort(slot12, function (slot0, slot1)
					return slot0.priority < slot1.priority
				end)

				for slot16, slot17 in ipairs(slot12) do
					slot18 = {}

					for slot22 = 1, math.huge do
						if slot17["attrType" .. slot22] and slot23 ~= 0 then
							table.insert(slot18, {
								key = slot23,
								val = dataEasy.getAttrValueString(slot23, slot17["attrNum" .. slot22])
							})
						else
							break
						end
					end

					uv19 = "get"
					slot19 = slot19.getBaseAttr(slot18)

					table.sort(slot19, function (slot0, slot1)
						return slot0.key < slot1.key
					end)

					for slot24, slot25 in ipairs(slot19) do
						uv26 = "get"

						if slot19[slot24 + 1] then
							slot20 = "" .. string.format("#C0x5B545B##F34#%s#C0x5C9970##F40#+%s", slot26.getAttrName(slot25.key), slot25.val) .. "#C0x5B545B##F34#, "
						end
					end

					uv21 = "getResourceNode"

					table.insert(slot1, slot21[slot5].getStrFunc(slot16, slot17.param, slot20))
				end
			end

			table.insert(slot1, "")
		end
	end

	beauty.textScroll({
		isRich = true,
		list = slot0.list,
		strs = slot1
	})
	Dialog.onCreate(slot0)
end

return slot2
