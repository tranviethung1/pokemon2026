slot0 = require("app.views.city.zawake.tools")
slot1 = cc.load("mvc").ViewBase
slot2 = class("ZawakeReplaceView", Dialog)
slot2.RESOURCE_FILENAME = "zawake_choose_card.json"
slot2.RESOURCE_BINDING = {
	tipPanel = "tipPanel",
	["title.textNote1"] = "textNote1",
	item = "item",
	["title.textNote2"] = "textNote2",
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
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 3,
				asyncPreload = 12,
				data = bindHelper.self("cardDatas"),
				item = bindHelper.self("innerList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot1:multiget("icon", "textFightPoint", "textLevel", "textStage", "txt1", "maskPanel").maskPanel:visible(slot3.isSelf)

					if slot3.isSelf then
						adapt.setTextScaleWithWidth(slot4.maskPanel:get("txt"), nil, 240)
					end

					slot4.textFightPoint:text(slot3.maxFightPoint)
					slot4.textLevel:text(string.format("(%s/8)", slot3.level))
					slot4.textStage:text(gLanguageCsv.effortAdvance .. gLanguageCsv["symbolRome" .. slot3.stage])
					adapt.oneLinePos(slot4.textStage, slot4.textLevel, cc.p(10, 0))
					bind.extend(slot0, slot4.icon, {
						class = "card_icon",
						props = {
							cardId = slot3.cfg.id,
							rarity = csv.unit[csv.cards[slot3.cfg.id].unitID].rarity
						}
					})
					slot1:onClick(functools.partial(slot0.clickSelect, slot2, slot3))
				end
			},
			handlers = {
				clickSelect = bindHelper.self("onSelectClick")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1)
	Dialog.onCreate(slot0)

	slot0.zawakeID = slot1.zawakeID

	slot0:initModel()
	slot0:updateCards()
	adapt.oneLinePos(slot0.textNote1, slot0.textNote2, cc.p(4, 0))
end

function slot2.updateCards(slot0)
	uv1 = "getAllCards"
	slot2 = {}

	for slot6, slot7 in pairs(slot1.getAllCards()) do
		uv8 = "getAllCards"
		slot8, slot9 = slot8.getMaxStageLevel(slot6)

		if not slot8 then
			slot8 = 1
			slot9 = 0
		end

		table.insert(slot2, {
			zawakeID = slot6,
			stage = slot8,
			level = slot9,
			cfg = slot7.cfg,
			maxFightPoint = slot7.maxFightPoint,
			isSelf = slot0.zawakeID:read() == slot6
		})
	end

	table.sort(slot2, function (slot0, slot1)
		return slot1.maxFightPoint < slot0.maxFightPoint
	end)
	slot0.tipPanel:visible(#slot2 == 0)
	slot0.cardDatas:update(slot2)
end

function slot2.initModel(slot0)
	slot0.zawake = gGameModel.role:read("zawake") or {}
	slot0.cardDatas = idlers.newWithMap({})
end

function slot2.onSelectClick(slot0, slot1, slot2, slot3)
	slot0.zawakeID:set(slot3.zawakeID)
	slot0:onClose()
end

return slot2
