slot0 = class("ContractSelectCardView", Dialog)
slot1 = require("app.views.city.develop.contract.tools")
slot2 = {
	[3] = {
		cc.p(65, 40),
		cc.p(175, 40),
		cc.p(0, 130)
	},
	[4] = {
		cc.p(65, 40),
		cc.p(175, 40),
		cc.p(0, 130),
		cc.p(240, 130)
	},
	[5] = {
		cc.p(65, 40),
		cc.p(175, 40),
		cc.p(0, 130),
		cc.p(240, 130),
		cc.p(65, 220)
	},
	[6] = {
		cc.p(65, 40),
		cc.p(175, 40),
		cc.p(0, 130),
		cc.p(240, 130),
		cc.p(65, 220),
		cc.p(175, 220)
	}
}
slot0.RESOURCE_FILENAME = "contract_card_select.json"
slot0.RESOURCE_BINDING = {
	panel404 = "emptyPanel",
	titleTxt1 = "titleTxt1",
	item = "item",
	titleTxt2 = "titleTxt2",
	innerList = "innerList",
	closeBtn = {
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
				columnSize = 3,
				asyncPreload = 12,
				data = bindHelper.self("cardDatas"),
				item = bindHelper.self("innerList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					slot10 = slot3.level

					bind.extend(slot0, slot1:get("item"), {
						class = "card_icon",
						props = {
							unitId = slot3.unitID,
							advance = slot3.advance,
							star = slot3.star,
							dbid = slot3.dbid,
							rarity = slot3.rarity,
							levelProps = {
								data = slot10
							}
						}
					})
					slot1:get("isCur"):visible(slot3.isSel)
					slot1:get("mask"):visible(slot3.isSel)

					slot4 = gGameModel.cards
					slot5 = slot4
					slot4 = slot4.find(slot5, slot3.dbid)
					uv5 = "bind"
					slot6 = slot3.dbid
					uv6 = "extend"

					for slot10 = 1, #slot6[#slot5.getCardPlan(slot6)] do
						slot11 = slot1:get("contractItem"):clone():scale(1.3):show():anchorPoint(0.5, 0.5):xy(slot6[slot10]):addTo(slot1:get("contractPanel"), 10)

						if #slot6 <= 4 then
							slot11:y(slot11:y() + 40)
						end

						slot11:get("lock"):visible(not slot5[slot10].unlock)
						slot11:get("icon"):hide()

						if gGameModel.contracts:find(slot5[slot10].contractDBID) then
							slot11:get("icon"):texture(csv.contract.contract[slot12:read("contract_id")].icon):show():scale(0.48)
						end
					end

					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot0:getIdx(slot2), slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onCellClick")
			}
		}
	},
	["down.btnOk"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSure")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	Dialog.onCreate(slot0)

	slot0.cardDatas = idlers.new()
	slot0.selectCardDBID = slot1.selectCardDBID

	slot0:initCardData()
	slot0.emptyPanel:visible(slot0.cardDatas:size() == 0)
end

function slot0.initCardData(slot0)
	slot2 = {}

	for slot6, slot7 in pairs(gGameModel.role:read("cards")) do
		if gGameModel.cards:find(slot7) then
			slot9 = slot8:read("card_id", "skin_id", "fighting_point", "level", "star", "advance")
			slot11 = csv.unit[dataEasy.getUnitId(slot9.card_id, slot9.skin_id)]
			slot12 = csv.cards[slot9.card_id]
			slot13 = slot0.selectCardDBID:read() == slot7
			uv14 = "gGameModel"

			for slot20 = 1, #slot14.getCardPlan(slot7) do
				if gGameModel.contracts:find(slot14[slot20].contractDBID) then
					slot16 = 0 + 1
				end
			end

			slot17 = 0

			if slot16 == slot15 then
				slot17 = 3
			elseif slot16 > 0 then
				slot17 = 2
			elseif slot16 == 0 then
				slot17 = 1
			end

			if slot12.contractPlan > 0 then
				table.insert(slot2, {
					star = slot9.star,
					rarity = slot11.rarity,
					fightPoint = slot9.fighting_point,
					cardID = slot9.card_id,
					advance = slot9.advance,
					skinID = slot9.skin_id,
					level = slot9.level,
					dbid = slot7,
					unitID = slot10,
					markID = slot12.cardMarkID,
					contractPlan = slot12.contractPlan,
					isSel = slot13,
					type = slot17
				})
			end
		end
	end

	table.sort(slot2, function (slot0, slot1)
		if slot0.type ~= slot1.type then
			return slot1.type < slot0.type
		end

		if slot0.fightPoint ~= slot1.fightPoint then
			return slot1.fightPoint < slot0.fightPoint
		end

		return slot0.cardID < slot1.cardID
	end)
	slot0.cardDatas:update(slot2)
end

function slot0.onCellClick(slot0, slot1, slot2, slot3)
	if not slot3.isSel then
		slot0.cardDatas:atproxy(slot2.k).isSel = true

		slot0.selectCardDBID:set(slot3.dbid)
		slot0:onClose()
	end
end

function slot0.onSure(slot0)
	slot0:onClose()
end

return slot0
