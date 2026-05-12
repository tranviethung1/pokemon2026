slot0 = cc.load("mvc").ViewBase
slot1 = class("HistoryView", Dialog)
slot1.RESOURCE_FILENAME = "clone_battle_history.json"
slot1.RESOURCE_BINDING = {
	title = "title",
	["showPanel.list"] = "list",
	["showPanel.item"] = "item",
	allPanel = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}
slot2 = {
	gLanguageCsv.cloneBattleRecord1,
	gLanguageCsv.cloneBattleRecord2,
	gLanguageCsv.cloneBattleRecord3,
	gLanguageCsv.cloneBattleRecord4,
	gLanguageCsv.cloneBattleRecord5,
	gLanguageCsv.cloneBattleRecord6,
	gLanguageCsv.cloneBattleRecord7
}

function slot1.onCreate(slot0, slot1)
	Dialog.onCreate(slot0)
	gGameModel.forever_dispatch:getIdlerOrigin("cloneBattleLookHistory"):set(gGameModel.forever_dispatch:getIdlerOrigin("cloneBattleLookHistory"):read() + 1)
	slot0.list:setScrollBarEnabled(false)
	slot0.list:setItemsMargin(0)

	slot0.refreshNumber = slot1.refreshNumber

	userDefault.setForeverLocalKey("cloneBattleHistory", slot1.historyTab or {}, {
		new = true
	})

	slot4 = {}

	for slot8, slot9 in ipairs(slot3) do
		slot10 = time.getDate(slot9.time)
		slot4[slot11] = slot4[string.formatex(gLanguageCsv.timeMonthDay, {
			month = slot10.month,
			day = slot10.day
		})] or {}

		table.insert(slot4[slot11], slot9)
	end

	for slot8, slot9 in pairs(slot4) do
		slot10 = slot0.item:clone()
		slot11 = rich.createByStr("#Pfont/youmi1.ttf##C0x5B545B#" .. slot8, 40):addTo(slot10):anchorPoint(0, 0.5):xy(10, 32):height(45)

		slot0.list:pushBackCustomItem(slot10)

		slot12 = ""

		for slot16, slot17 in ipairs(slot9) do
			slot18 = slot0.item:clone()
			slot19 = time.getDate(slot17.time)
			slot23 = slot19.hour
			uv23 = "Dialog"
			slot23 = rich.createWithWidth(string.formatex("#C0x5B545B#" .. slot23[slot17.type], {
				name = "#C0x5FC355#" .. slot17.name .. "#C0x5B545B#"
			}), 40, nil, 730):addTo(slot18):anchorPoint(0, 1):xy(280, 32)
			slot24 = slot23:height()

			slot18:height(slot24)
			rich.createByStr("#C0xB2ABB2##Pfont/youmi1.ttf#" .. string.format("%02d:%02d", slot23, slot19.min), 40):addTo(slot18):anchorPoint(0, 1):xy(160, 32):xy(160, slot24)
			slot23:xy(280, slot24)
			slot0.list:pushBackCustomItem(slot18)
		end
	end

	slot0.list:jumpToBottom()
end

return slot1
