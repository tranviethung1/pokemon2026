slot0 = require("app.views.city.card.star_swap.tools")
slot1 = class("StarSwapChooseCardView", Dialog)
slot1.RESOURCE_FILENAME = "star_select_role.json"
slot1.RESOURCE_BINDING = {
	item = "item",
	["down.textNote"] = "textNote",
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
				columnSize = 7,
				asyncPreload = 28,
				data = bindHelper.self("cardDatas"),
				item = bindHelper.self("innerList"),
				cell = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onCell = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1:get("head"), {
						class = "card_icon",
						props = {
							unitId = slot3.unitId,
							advance = slot3.advance,
							star = slot3.star,
							rarity = slot3.rarity,
							grayState = slot3.isSel and 1 or 0,
							levelProps = {
								data = slot3.level
							},
							onNode = function (slot0)
							end
						}
					})
					slot1:get("imgTick"):visible(slot3.isSel)
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
	tipPanel = {
		binds = {
			event = "visible",
			idler = bindHelper.self("showTip")
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

function slot1.onCreate(slot0, slot1)
	slot0.from = slot1.from
	slot0.selDbIds = slot1.selDbIds
	slot0.curSelDbId = slot1.curSelDbId
	slot0.handlers = slot1.handlers
	slot0.seatRarity = slot1.seatRarity
	slot0.cardDatas = idlers.newWithMap({})
	slot2 = idler.new(false)
	slot0.showTip = slot2
	uv2 = "from"
	slot2 = slot2.getSelectCard(slot0.from, slot0.selDbIds, slot0.curSelDbId, slot0.seatRarity)

	table.sort(slot2, function (slot0, slot1)
		if slot0.rarity ~= slot1.rarity then
			return slot1.rarity < slot0.rarity
		end

		if slot0.star ~= slot1.star then
			return slot1.star < slot0.star
		end

		return slot1.fight < slot0.fight
	end)
	slot0.cardDatas:update(slot2)
	slot0.showTip:set(slot0.cardDatas:size() == 0)
	slot0.textNote:text(slot0.from == 1 and gLanguageCsv.starAidChooseCard or gLanguageCsv.starExchangeChooseCard)
	Dialog.onCreate(slot0)
end

function slot1.onCellClick(slot0, slot1, slot2, slot3)
	if slot0.lastClickIndex == slot2.k then
		if slot0.cardDatas:atproxy(slot2.k).isSel then
			slot0.cardDatas:atproxy(slot0.lastClickIndex).isSel = false
			slot0.selected = nil
			slot0.lastClickIndex = nil
		else
			slot0.cardDatas:atproxy(slot2.k).isSel = true
			slot0.selected = slot3
			slot0.lastClickIndex = slot2.k
		end
	else
		if slot0.lastClickIndex then
			slot0.cardDatas:atproxy(slot0.lastClickIndex).isSel = false
		end

		slot0.cardDatas:atproxy(slot2.k).isSel = true
		slot0.selected = slot3
		slot0.lastClickIndex = slot2.k
	end
end

function slot1.onSure(slot0)
	if slot0.cardDatas:size() == 0 then
		gGameUI:showTip(gLanguageCsv.noCardChoose)

		return
	end

	slot0:addCallbackOnExit(functools.partial(slot0.handlers, slot0.selected))
	slot0:onClose()
end

return slot1
