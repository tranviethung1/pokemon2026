slot0 = class("CaptureHandbook", cc.load("mvc").ViewBase)
slot1 = 9

function slot2(slot0, slot1, slot2, slot3)
	slot1:size(1950, 90)
	slot1:get("list"):hide()
	slot1:get("title"):y(45):show()

	slot5 = slot1:get("title.imgRight")
	slot6 = slot1:get("title.imgLeft")

	if slot3.gate == 0 then
		slot1:get("title.textTitle"):text(gLanguageCsv.card)
	else
		slot4:text(string.format(gLanguageCsv.unlockGateToCapture, slot3.gate, csv.world_map[slot3.gate + 10].name))
	end

	slot4:x(975)
	slot5:x(slot4:width() / 2 + 40 + 975)
	slot6:x(-slot4:width() / 2 - 40 + 975)
end

function slot3(slot0, slot1, slot2, slot3)
	slot4 = {}

	for slot8, slot9 in ipairs(slot3) do
		table.insert(slot4, {
			key = "card",
			num = slot9.cardID
		})
	end

	slot1:get("title"):hide()
	slot1:size(cc.size(1950, 195))
	bind.extend(slot0, slot1:get("list"):y(0), {
		class = "listview",
		props = {
			data = slot4,
			item = slot0.spriteItem,
			onItem = function (slot0, slot1, slot2, slot3)
				bind.extend(slot0, slot1, {
					class = "icon_key",
					props = {
						data = slot3
					}
				})
				slot1:visible(true)
			end
		}
	})
end

slot0.RESOURCE_FILENAME = "capture_handbook.json"
slot0.RESOURCE_BINDING = {
	spriteItem = "spriteItem",
	item = "item",
	list = {
		varname = "listview",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 7,
				data = bindHelper.self("showDatas"),
				item = bindHelper.self("item"),
				spriteItem = bindHelper.self("spriteItem"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					if slot3.type == "title" then
						uv4 = "type"

						slot4(slot0, slot1, slot2, slot3)
					else
						uv4 = "title"

						slot4(slot0, slot1, slot2, slot3)
					end
				end
			}
		}
	}
}

function slot0.onCreate(slot0)
	slot1 = gGameModel.role:read("gate_open")
	slot0.showDatas = {}
	slot2 = {
		[0] = {}
	}

	for slot6, slot7 in orderCsvPairs(csv.capture.sprite) do
		if slot7.type == 2 and slot7.weight ~= 0 then
			slot9 = false

			if slot2[math.floor(slot7.gate % 10000 / 100)] then
				for slot13, slot14 in ipairs(slot2[slot8]) do
					if slot7.cardID == slot14.cardID then
						slot9 = true

						break
					end
				end
			end

			if slot9 == false then
				if itertools.include(slot1, slot7.gate) or slot7.gate == 0 then
					table.insert(slot2[0], slot7)
				else
					slot2[slot8] = slot2[slot8] or {}

					table.insert(slot2[slot8], slot7)
				end
			end
		end
	end

	for slot6, slot7 in pairs(slot2) do
		table.sort(slot7, function (slot0, slot1)
			return csv.unit[csv.cards[slot1.cardID].unitID].rarity < csv.unit[csv.cards[slot0.cardID].unitID].rarity
		end)
	end

	for slot7, slot8 in pairs(slot2) do
		slot3 = math.max(0, slot7)
	end

	slot4 = 1

	for slot8 = 0, slot3 do
		if slot2[slot8] ~= nil then
			slot0.showDatas[slot4] = {
				type = "title",
				gate = slot8
			}

			for slot14, slot15 in ipairs(slot9) do
				uv17 = "gGameModel"
				slot16 = math.ceil(slot14 / slot17)
				uv18 = "gGameModel"
				slot0.showDatas[slot16 + slot4] = slot0.showDatas[slot16 + slot4] or {}
				slot0.showDatas[slot16 + slot4][(slot14 - 1) % slot18 + 1] = slot15
				slot10 = 0 + 1
			end

			uv12 = "gGameModel"
			slot4 = math.ceil(slot10 / slot12) + slot4 + 1
		end
	end
end

return slot0
