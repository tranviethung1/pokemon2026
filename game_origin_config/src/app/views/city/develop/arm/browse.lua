slot1 = class("ArmBrowseView", cc.load("mvc").ViewBase)
slot2 = require("app.views.city.develop.arm.tools")
slot1.RESOURCE_FILENAME = "arm_overview.json"
slot1.RESOURCE_BINDING = {
	item = "item",
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 10,
				data = bindHelper.self("data"),
				item = bindHelper.self("item"),
				armID = bindHelper.self("armID"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:anchorPoint(0.5, 1)

					slot4 = slot1:multiget("title", "descList", "item")

					slot4.title:text(string.format(gLanguageCsv.armActiveTitle, slot3.stage))
					slot4.item:hide()
					bind.extend(slot0, slot4.descList, {
						class = "listview",
						props = {
							data = slot3.data,
							item = slot4.item,
							itemAction = {
								isAction = false
							},
							onItem = function (slot0, slot1, slot2, slot3)
								uv9 = "string"

								slot1:get("desc"):text(string.format(gLanguageCsv.armStageUnlockDesc, gLanguageCsv[game.NATURE_TABLE[slot9.armID]], slot3.needStar, gLanguageTxtRarity[slot3.needRarity]))
								adapt.setTextScaleWithWidth(slot1:get("desc"), nil, 600)

								slot6 = slot1:get("desc"):box().width
								slot8 = uiEasy.createTexParameters("city/arms/main/point.png", cc.rect(0, 0, 700 - slot6 - 70, 0), {
									autoHeight = true
								})

								slot8:addTo(slot1, 100)
								slot8:anchorPoint(0, 0.5)
								slot8:xy(slot1:get("desc"):x() + slot6 + 35, slot1:get("desc"):y())
								adapt.setTextScaleWithWidth(slot1:get("desc"), nil, 450)
								slot1:get("textNum"):text(string.format("%s/%s", slot3.hasNum, slot3.needNum)):setTextColor(slot3.hasNum < slot3.needNum and cc.c3b(241, 59, 84) or cc.c3b(0, 194, 32))
							end
						}
					})

					slot5 = math.min(#slot3.data * 60, 120)

					slot4.descList:setContentSize(slot4.descList:width(), slot5)
					slot4.descList:y(slot4.descList:y() + 120 - slot5)
					slot4.descList:refreshView()
					setContentSizeOfAnchor(slot1, cc.size(slot1:width(), slot1:height() - (120 - slot5)))
				end
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot2 = {}
	uv4 = "getArmMaxStage"

	for slot6 = 0, slot4.getArmMaxStage(slot1) - 1 do
		uv7 = "getArmMaxStage"

		table.insert(slot2, {
			data = slot7.getNextStageUnlockData(slot1, slot6),
			stage = slot6 + 1
		})
	end

	slot0.data = slot2
	slot0.armID = slot1

	Dialog.onCreate(slot0)
end

return slot1
