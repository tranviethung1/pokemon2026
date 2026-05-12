slot0 = 50
slot1 = 50
slot2 = {
	TIP = 2,
	NORMAL = 1,
	HIDE = 3
}
slot3 = {
	24,
	25,
	92,
	93
}
slot4 = class("MedalCollectionTipView", cc.load("mvc").ViewBase)
slot4.RESOURCE_FILENAME = "medal_collection_tip.json"
slot4.RESOURCE_BINDING = {
	["baseNode.tipPanel"] = "tipPanel",
	["baseNode.attrPanel.item"] = "item",
	["baseNode.attrPanel"] = "attrPanel",
	["baseNode.attrPanel.subList"] = "subList",
	baseNode = "baseNode",
	["baseNode.attrPanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 2,
				data = bindHelper.self("attrDatas"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("img", "text", "num")
					slot5 = slot0:getIdx(slot2)

					slot4.num:text("+" .. slot3.num)
					slot4.text:text(string.format("%s:", gLanguageCsv["attr" .. string.caption(game.ATTRDEF_TABLE[slot3.id])]))

					if ui.ATTR_LOGO[game.ATTRDEF_TABLE[slot3.id]] then
						slot4.img:texture(slot6):show()
						adapt.oneLinePos(slot4.img, {
							slot4.text,
							slot4.num
						}, {
							cc.p(10, 0),
							cc.p(10, 0)
						})
					else
						slot4.img:texture(slot6):hide()
						adapt.oneLinePos(slot4.text, slot4.num, cc.p(10, 0))
					end
				end
			}
		}
	}
}

function slot4.onCreate(slot0, slot1)
	slot0.attrDatas = idlers.new({})

	slot0.attrPanel:visible(slot1.isAttr)
	slot0.tipPanel:visible(not slot1.isAttr)

	if slot1.isAttr then
		slot2 = false

		for slot6, slot7 in pairs(slot1.data) do
			uv9 = "attrDatas"

			if itertools.include(slot9, slot7.id) then
				slot2 = true

				break
			end
		end

		if slot2 then
			slot0.baseNode:get("bg"):width(900)
			slot0.list:x(70)
		else
			slot0.baseNode:get("bg"):width(800)
			slot0.list:x(140)
		end

		slot0.attrDatas:update(slot1.data)
		slot0.list:height(math.ceil(itertools.size(slot1.data) / 2) * 70)
		slot0.list:y(slot0.attrPanel:get("title"):y() - slot0.list:height() - 50)
		slot0.baseNode:get("bg"):height(180 + slot0.list:height())
	else
		slot2 = slot1.data.cfg.desc
		uv4 = "idlers"

		if slot1.data.cfg.type == slot4.HIDE then
			slot2 = gLanguageCsv.tipMedalDetail
		else
			uv4 = "idlers"

			if slot1.data.cfg.type == slot4.TIP then
				slot2 = slot1.data.cfg.hidedesc
			end
		end

		slot5 = slot2

		slot0.tipPanel:get("content"):text(slot5)

		uv5 = "new"
		slot6 = "content"
		uv6 = "attrPanel"

		slot0.tipPanel:get(slot6):height(slot6 * math.ceil(#slot2 / slot5))
		slot0.tipPanel:get("tip"):xy(880, slot0.tipPanel:get("content"):y() - slot0.tipPanel:get("content"):height() - 40)
		slot0.baseNode:get("bg"):width(900)
		slot0.baseNode:get("bg"):height(240 + slot0.tipPanel:get("content"):height())
	end
end

return slot4
