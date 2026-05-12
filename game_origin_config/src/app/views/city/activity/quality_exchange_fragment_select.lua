slot0 = class("ActivityQualityExchangeFragmentSelectView", Dialog)
slot0.RESOURCE_FILENAME = "activity_quality_exchange_helditem_select.json"
slot0.RESOURCE_BINDING = {
	tipPanel = "tipPanel",
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
				data = bindHelper.self("datas"),
				item = bindHelper.self("innerList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				dataOrderCmp = function (slot0, slot1)
					if slot0.num ~= slot1.num then
						return slot1.num < slot0.num
					end

					return slot0.key < slot1.key
				end,
				onCell = function (slot0, slot1, slot2, slot3)
					slot4, slot5 = uiEasy.setIconName(slot3.key, slot3.num)

					slot1:get("name"):hide()
					slot1:get("tips"):hide()
					slot1:removeChildByName("richName")
					text.addEffect(beauty.singleTextLimitWord(slot4, {
						fontSize = 40
					}, {
						width = 240
					}):xy(slot1:get("name"):xy()):addTo(slot1, 10, "richName"), slot5)
					bind.extend(slot0, slot1:get("icon"), {
						class = "icon_key",
						props = {
							data = {
								key = slot3.key,
								num = slot3.num
							},
							onNode = function (slot0)
								uv1 = "hasItemCb"

								if slot1.hasItemCb() then
									slot0:setTouchEnabled(false)
								end
							end
						}
					})

					if slot0.hasItemCb() then
						bind.touch(slot0, slot1:get("icon"), {
							methods = {
								ended = functools.partial(slot0.itemClick, slot2, slot3)
							}
						})
					end
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick"),
				hasItemCb = bindHelper.self("hasItemCb")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.params = slot1

	if slot0.params.title then
		slot0.title:get("textNote1"):text(slot0.params.title[1])
		slot0.title:get("textNote2"):text(slot0.params.title[2])
		adapt.oneLinePos(slot0.title:get("textNote1"), slot0.title:get("textNote2"))
	end

	slot0.datas = {}

	for slot5, slot6 in ipairs(slot0.params.data) do
		if dataEasy.isFragmentCard(slot6.key) then
			table.insert(slot0.datas, slot6)
		end
	end

	slot0.hasItemCb = slot0.params.cb ~= nil

	slot0.tipPanel:visible(itertools.size(slot0.datas) == 0)

	if slot1.tip then
		slot0.tipPanel:get("textTip"):text(slot1.tip)
	end

	Dialog.onCreate(slot0)
end

function slot0.onItemClick(slot0, slot1, slot2, slot3)
	if slot0.params.cb then
		slot0.params.cb(slot3.key)
	end

	slot0:onClose()
end

return slot0
