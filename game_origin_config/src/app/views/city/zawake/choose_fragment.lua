slot0 = cc.load("mvc").ViewBase
slot1 = class("ZawakeChoosFragmentView", Dialog)
slot1.RESOURCE_FILENAME = "zawake_choose_frag.json"
slot1.RESOURCE_BINDING = {
	["tipPanel.imgTextBg"] = "textBg",
	item = "item",
	title = "title",
	innerList = "innerList",
	["tipPanel.textTip"] = "textTip",
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
				dataOrderCmp = function (slot0, slot1)
					if slot0.cardType ~= slot1.cardType then
						return slot1.cardType < slot0.cardType
					end

					if slot0.num ~= slot1.num then
						return slot1.num < slot0.num
					end

					return slot0.id < slot1.id
				end,
				onCell = function (slot0, slot1, slot2, slot3)
					uiEasy.setIconName(slot3.id, nil, {
						node = slot1:get("name")
					})
					adapt.setTextScaleWithWidth(slot1:get("name"), nil, 260)
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

function slot1.onCreate(slot0, slot1)
	slot0.selectedFragId = slot1.selectedFragId
	slot0.isAutoSelect = slot1.isAutoSelect
	slot0.showData = idlers.new({})
	slot0.showTip = idler.new(false)
	slot3 = csv.zawake.exchange[slot1.fragID]

	idlereasy.any({
		gGameModel.role:getIdler("frags"),
		gGameModel.role:getIdler("items")
	}, function (slot0, slot1, slot2)
		slot3 = {}

		for slot7, slot8 in pairs(slot1) do
			if dataEasy.isFragmentCard(slot7) and csv.fragments[slot7].type == 1 then
				uv11 = "pairs"

				if not itertools.include(slot11.roriFrags, slot7) then
					slot11 = csv.unit[csv.cards[slot9.combID].unitID]
					uv14 = "pairs"

					for slot16, slot17 in csvMapPairs(slot14.needFrags) do
						if slot17[1] == dataEasy.getCfgByKey(slot7).quality and (slot17[2] == -1 or slot11.natureType == slot17[2] or slot11.natureType2 and slot11.natureType2 == slot17[2]) then
							slot3[slot7] = {
								id = slot7,
								num = slot8,
								itemNum = slot17[3],
								cardType = slot10.cardType
							}
						end
					end

					uv14 = "pairs"

					for slot16, slot17 in csvMapPairs(slot14.needSpecialFrags) do
						if slot7 == slot17[1] then
							slot3[slot7] = {
								id = slot7,
								num = slot8,
								itemNum = slot17[2],
								cardType = slot10.cardType
							}
						end
					end
				end
			end
		end

		uv5 = "pairs"

		for slot7, slot8 in csvMapPairs(slot5.needSpecialFrags) do
			if not dataEasy.isFragmentCard(slot8[1]) and dataEasy.getNumByKey(slot8[1]) > 0 then
				slot3[slot8[1]] = {
					cardType = 0,
					id = slot8[1],
					num = slot9,
					itemNum = slot8[2]
				}
			end
		end

		uv4 = "dataEasy"
		slot4 = slot4.showData
		slot4 = slot4.update

		slot4(slot4, slot3)

		uv4 = "dataEasy"
		slot4 = slot4.textTip
		slot5 = slot4

		slot4.text(slot5, gLanguageCsv.fragMentNotNum)

		slot4 = adapt.setTextScaleWithWidth
		uv5 = "dataEasy"
		uv7 = "dataEasy"

		slot4(slot5.textTip, nil, slot7.textBg:width() - 20)

		uv4 = "dataEasy"

		slot4.showTip:set(itertools.size(slot3) == 0)
	end)
	Dialog.onCreate(slot0)
end

function slot1.onItemClick(slot0, slot1, slot2, slot3)
	slot0.selectedFragId:set(slot3.id)

	slot4 = slot0.isAutoSelect
	slot4 = slot4.set

	slot4(slot4, false)

	uv4 = "selectedFragId"

	slot4.onClose(slot0)
end

return slot1
