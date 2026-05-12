slot0 = class("DrawcardPropertyDetailView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "drawcard_property_detail.json"
slot0.RESOURCE_BINDING = {
	subList = "subList",
	["previewPanel.img1"] = "img",
	icon = "icon",
	previewPanel = "previewPanel",
	["previewPanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				yMargin = 0,
				asyncPreload = 12,
				xMargin = 30,
				topPadding = 15,
				leftPadding = 0,
				data = bindHelper.self("showDatas"),
				columnSize = bindHelper.self("midColumnSize"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("icon"),
				onCell = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "icon_key",
						props = {
							simpleShow = true,
							data = slot3,
							specialKey = {
								maxStar = true
							}
						}
					})
					slot1:scale(0.8)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot1, slot2, slot3)
						}
					})
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		table.insert(slot2, {
			key = "card",
			num = slot7
		})
	end

	slot3 = math.ceil(table.getn(slot1) / 3)

	slot0.img:height(slot3 * 185 - (slot3 - 2) * 14)

	slot0.midColumnSize = 3
	slot0.showDatas = idlers.new()

	slot0.showDatas:update(slot2)
end

return slot0
