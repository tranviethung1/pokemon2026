slot0 = cc.load("mvc").ViewBase
slot1 = class("MegaFragmentSelectView", Dialog)
slot1.RESOURCE_FILENAME = "card_mega_fragment_select.json"
slot1.RESOURCE_BINDING = {
	["tipPanel.textTip"] = "textTip",
	item = "item",
	title = "title",
	innerList = "innerList",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 6,
				data = bindHelper.self("showData"),
				item = bindHelper.self("innerList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					uiEasy.setIconName(slot3.id, nil, {
						node = slot1:get("name")
					})
					adapt.setTextScaleWithWidth(slot1:get("name"), nil, 240)
					bind.extend(slot0, slot1:get("icon"), {
						class = "icon_key",
						props = {
							data = {
								key = slot3.id,
								num = slot3.num
							},
							onNode = function (slot0)
								slot0:setTouchEnabled(false)
							end
						}
					})
					bind.touch(slot0, slot1:get("icon"), {
						methods = {
							ended = functools.partial(slot0.itemClick, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	},
	tipPanel = {
		binds = {
			event = "visible",
			idler = bindHelper.self("showTip")
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0.data = slot1

	slot0.item:visible(false)
	slot0.list:setScrollBarEnabled(false)
	slot0.innerList:setScrollBarEnabled(false)

	slot0.showData = idlers.new({})
	slot0.cb = slot2
	slot0.showTip = idler.new(false)
	slot3 = csv.card_mega_convert[slot1.csvId]

	idlereasy.any({
		gGameModel.role:getIdler("frags"),
		gGameModel.role:getIdler("zfrags")
	}, function (slot0, slot1, slot2)
		slot3 = {}

		for slot7, slot8 in pairs(slot1) do
			if csv.fragments[slot7].type == 1 then
				uv11 = "pairs"

				if not itertools.include(slot11.roriFrags, slot7) then
					slot11 = csv.unit[csv.cards[slot9.combID].unitID]
					slot13 = slot7
					uv13 = "pairs"

					if slot13.needFrags1[1] == dataEasy.getCfgByKey(slot13).quality then
						for slot16 = 1, math.huge do
							uv17 = "pairs"

							if itertools.isempty(slot17["needFrags" .. slot16]) then
								break
							end

							if slot17[2] == -1 or slot11.natureType == slot17[2] or slot11.natureType2 and slot11.natureType2 == slot17[2] then
								table.insert(slot3, {
									id = slot7,
									num = slot8,
									itemNum = slot17[3],
									cardType = slot10.cardType
								})

								break
							end
						end
					end
				end
			end
		end

		for slot7, slot8 in pairs(slot2 or {}) do
			uv11 = "pairs"

			if slot11.type == 1 and slot9.type == 5 or slot9.type == 6 then
				uv11 = "pairs"

				if slot11.needFrags1[1] == csv.zawake.zawake_fragments[slot7].quality then
					for slot14 = 1, math.huge do
						uv15 = "pairs"

						if itertools.isempty(slot15["needFrags" .. slot14]) then
							break
						end

						if slot15[2] == -1 then
							table.insert(slot3, {
								cardType = 0,
								id = slot7,
								num = slot8,
								itemNum = slot15[3]
							})

							break
						end
					end
				end
			else
				uv11 = "pairs"

				if slot11.type == 2 and slot9.type == 5 then
					uv11 = "pairs"

					if slot11.needFrags1[1] == slot10 then
						slot12 = csv.unit[csv.cards[slot9.cardID].unitID]

						for slot16 = 1, math.huge do
							uv17 = "pairs"

							if itertools.isempty(slot17["needFrags" .. slot16]) then
								break
							end

							if slot17[2] == -1 or slot12.natureType == slot17[2] or slot12.natureType2 and slot12.natureType2 == slot17[2] then
								table.insert(slot3, {
									cardType = 0,
									id = slot7,
									num = slot8,
									itemNum = slot17[3]
								})

								break
							end
						end
					end
				end
			end
		end

		slot4 = table.sort

		slot4(slot3, function (slot0, slot1)
			if slot0.cardType ~= slot1.cardType then
				return slot1.cardType < slot0.cardType
			end

			if slot0.num ~= slot1.num then
				return slot1.num < slot0.num
			end

			return slot0.id < slot1.id
		end)

		uv4 = "csv"
		slot4 = slot4.showData
		slot4 = slot4.update

		slot4(slot4, slot3)

		uv4 = "csv"
		slot4 = slot4.textTip
		slot4 = slot4.text

		slot4(slot4, gLanguageCsv.fragMentNotNum)

		uv4 = "csv"

		slot4.showTip:set(#slot3 == 0)
	end)
	slot0.title:get("textNote2"):text(gLanguageCsv.fragment)
	Dialog.onCreate(slot0)
end

function slot1.onItemClick(slot0, slot1, slot2, slot3)
	slot0.data.selectId = slot3.id
	slot4 = slot0.addCallbackOnExit

	slot4(slot0, slot0.cb)

	uv4 = "data"

	slot4.onClose(slot0)
end

return slot1
