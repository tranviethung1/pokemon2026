slot0 = class("ChooseDetailView", Dialog)
slot0.RESOURCE_FILENAME = "common_choose_detail.json"
slot0.RESOURCE_BINDING = {
	textNum = "textNum",
	subList = "subList",
	bg = "bg",
	awardItem = "awardItem",
	text = "panelText",
	textName = "textName",
	textTip = "textTip",
	icon = {
		varname = "icon",
		binds = {
			event = "extend",
			class = "icon_key",
			props = {
				noListener = true,
				data = bindHelper.self("data"),
				onNode = function (slot0)
					slot0:alignCenter(slot0:size())
				end
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 5,
				data = bindHelper.self("itemDatas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("awardItem"),
				onCell = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							data = {
								key = slot3.key,
								num = slot3.num
							},
							onNode = function (slot0)
								uv2 = "bind"
								uv6 = "bind"
								uv8 = "click"
								uv9 = "functools"

								bind.click(slot2, slot0, {
									method = functools.partial(slot6.itemClick, slot0, slot8, slot9)
								})
							end
						}
					})
				end,
				onAfterBuild = function (slot0)
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	Dialog.onCreate(slot0)
	slot0.subList:setScrollBarEnabled(false)

	slot0.itemDatas = idlers.newWithMap({})
	slot0.data = {
		key = slot1.key,
		num = slot1.num
	}
	slot2 = {}
	slot5 = dataEasy.getNumByKey(slot1.key)

	for slot9, slot10 in csvMapPairs(dataEasy.getCfgByKey(slot1.key).specialArgsMap) do
		slot3 = 0 + 1

		if not slot10.card then
			for slot14, slot15 in csvMapPairs(slot10) do
				table.insert(slot2, {
					isSel = false,
					key = slot14,
					num = slot15
				})
			end
		end

		if slot10.card then
			for slot14, slot15 in csvMapPairs(slot10.card) do
				table.insert(slot2, {
					isSel = false,
					key = "card",
					num = slot15
				})
			end
		end
	end

	table.sort(slot2, dataEasy.sortItemCmp)
	slot0.itemDatas:update(slot2)
	slot0.textName:text(slot4.name)
	slot0.textNum:text(gLanguageCsv.have .. ":" .. slot5)

	if math.floor((slot3 - 1) / 5) > 3 then
		slot6 = 3
	end

	slot8 = (4 - slot6 - 1) * math.floor(slot0.list:height() / 4)

	slot0.bg:height(slot0.bg:height() - slot8)
	slot0.list:height(slot0.list:height() - slot8)
	slot0.list:y(slot0.list:y() + slot8 / 2)
	slot0.panelText:y(slot0.panelText:y() - slot8 / 2)
	slot0.textTip:y(slot0.textTip:y() - slot8 / 2)
	slot0.icon:y(slot0.icon:y() - slot8 / 2)
	slot0.textNum:y(slot0.textNum:y() - slot8 / 2)
	slot0.textName:y(slot0.textName:y() - slot8 / 2)
end

function slot0.onItemClick(slot0, slot1, slot2, slot3, slot4)
	gGameUI:showItemDetail(slot2, {
		key = slot4.key,
		num = slot4.num
	})
end

return slot0
