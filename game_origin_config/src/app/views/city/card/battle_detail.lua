function slot0(slot0, slot1, slot2, slot3, slot4)
	if slot3:get("richText") then
		slot3:removeChildByName("richText")
	end

	return rich.createWithWidth(slot0, 40, nil, slot4):anchorPoint(0, 1):xy(slot1, slot2):addTo(slot3, 6, "richText")
end

slot1 = cc.load("mvc").ViewBase
slot2 = class("CardBattleDetailView", Dialog)
slot2.RESOURCE_FILENAME = "card_battle_detail.json"
slot2.RESOURCE_BINDING = {
	leftPanel = "leftPanel",
	cardItem = "cardItem",
	rightPanel = "rightPanel",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	cardList = {
		varname = "cardList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 7,
				backupCached = false,
				data = bindHelper.self("datas"),
				item = bindHelper.self("cardItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("textName", "maskPanel")

					bind.extend(slot0, slot1, {
						class = "card_icon",
						props = {
							levelProps = {
								data = slot3.level
							},
							rarity = slot3.rarity,
							cardId = slot3.cardId,
							dbid = slot3.dbid,
							advance = slot3.advance,
							star = slot3.star,
							grayState = slot3.fight and 0 or 2,
							onNode = function (slot0)
								slot0:y(52):scale(0.8)
							end
						}
					})
					slot4.textName:text("")
					slot4.maskPanel:visible(not slot3.fight)
					slot4.maskPanel:get("iconMask"):hide()
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.itemClick, slot1, t, slot3)
						}
					})
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	},
	leftBtn = {
		varname = "subBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onLeftClick")
			}
		}
	},
	rightBtn = {
		varname = "addBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRightClick")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1, slot2, slot3)
	slot0.count = itertools.size(slot1)

	slot0:initModel()

	slot0.selectId = idler.new(slot2)
	slot0.datas = idlertable.new({})

	idlereasy.when(slot0.selectId, function (slot0, slot1)
		uv2 = "csv"
		slot4 = {}

		for slot8, slot9 in ipairs(csv.card_battle_recommend[slot2[slot1].csvId].cards) do
			uv12 = "card_battle_recommend"

			if slot12[csv.cards[slot9].cardMarkID] then
				uv12 = "card_battle_recommend"

				if not slot12[slot11][slot10.branch] then
					uv12 = "card_battle_recommend"
					slot12 = slot12[slot11][0]
				end
			end

			slot13 = slot12 and slot12.cardId or slot9
			slot16 = slot12 or {
				cardId = slot13,
				name = slot14.name,
				rarity = csv.unit[csv.cards[slot13].unitID].rarity
			}
			slot16.isCoreMark = slot3.coreMark[slot8] == 1

			table.insert(slot4, slot16)
		end

		uv5 = "csvId"
		slot5 = slot5.datas
		slot5 = slot5.set

		slot5(slot5, slot4)

		uv5 = "csvId"
		slot5 = slot5.setLeftPanel

		slot5(slot5, slot2)

		uv5 = "csvId"

		slot5:setRightPanel(slot2)
	end)
	Dialog.onCreate(slot0)
end

function slot2.initModel(slot0)
	slot0.cards = gGameModel.role:getIdler("cards")
	slot0.battleCards = gGameModel.role:getIdler("battle_cards")
	slot0.vipLevel = gGameModel.role:getIdler("vip_level")
	slot0.roleLv = gGameModel.role:getIdler("level")
end

function slot2.onRightClick(slot0)
	slot0.selectId:set(slot0.count < slot0.selectId:read() + 1 and 1 or slot1)
end

function slot2.onLeftClick(slot0)
	slot0.selectId:set(slot0.selectId:read() - 1 < 1 and slot0.count or slot1)
end

function slot2.setLeftPanel(slot0, slot1)
	slot2 = slot1.cardData
	slot3 = slot0.leftPanel:multiget("cardIcon", "rarityIcon", "imgSpecialMark", "textName", "bg")
	slot4 = slot3.bg:size()
	slot5 = ccui.Scale9Sprite:create()

	slot5:initWithFile(cc.rect(0, 0, 0, 0), "city/card/battle_recommend/mask_jlzs.png")
	slot5:size(slot4.width - 5, slot4.height):alignCenter(slot4):xy(slot3.bg:x() - 160, slot3.bg:y() - 414):scale(2)

	slot6 = cc.Sprite:create(slot2.icon)
	slot7 = slot6:size()

	slot6:alignCenter(slot4):scale(2):setTextureRect(cc.rect((slot7.width - slot4.width) / 2, (slot7.height - slot4.height) / 2, slot4.width, slot4.height))
	slot0.leftPanel:removeChildByName("clipping")
	cc.ClippingNode:create(slot5):setAlphaThreshold(0.1):size(slot4):alignCenter(slot0.leftPanel:size()):xy(slot3.cardIcon:x(), slot3.cardIcon:y()):add(slot6):addTo(slot0.leftPanel, 1, "clipping")
	slot3.cardIcon:texture(slot2.icon):hide()
	slot3.rarityIcon:texture(ui.RARITY_ICON[slot2.rarity])
	slot3.imgSpecialMark:hide()
	slot3.textName:text(slot2.name)
end

function slot2.setRightPanel(slot0, slot1)
	slot0.rightPanel:multiget("attrIcon", "attrText", "titleBg1", "titleBg2", "titleBg3", "list").attrText:text(csv.card_battle_recommend[slot1.csvId].name)

	if checkLanguage("en") or checkLanguage("en_us") then
		slot2.attrText:parent():removeChildByName("attrTextName")
		slot2.attrText:hide()

		slot5, slot6 = slot2.attrText:xy()

		beauty.textScroll({
			align = "left",
			size = cc.size(200, 40),
			strs = {
				fontPath = "font/youmi1.ttf",
				str = slot3.name
			},
			effect = {
				color = ui.COLORS.NORMAL.WHITE
			}
		}):xy(slot5 - 100, slot6 - 10):addTo(slot2.attrText:parent(), 10, "attrTextName")
	end

	slot2.attrIcon:texture(slot1.attrIcon)

	slot4 = slot2.titleBg2:get("textTitle")
	slot4 = slot4.text

	slot4(slot4, slot3.coreEffectName)

	uv4 = "rightPanel"
	slot5 = "#C0x5B545B#" .. slot3.features
	slot4 = slot4(slot5, 40, -15, slot2.titleBg1, 1160)
	uv5 = "rightPanel"
	slot5 = slot5("#C0x5B545B#" .. slot3.coreEffect, 40, -15, slot2.titleBg2, 1160)

	slot2.titleBg2:y(slot2.titleBg1:y() - 104 - slot4:size().height)
	slot2.titleBg3:y(slot2.titleBg2:y() - 104 - slot5:size().height)

	slot10 = slot5:size().height

	slot2.list:size(1160, 578 - slot4:size().height - slot10)

	slot6 = {}

	for slot10 = 1, 10 do
		if slot3["matchEffect" .. slot10] and slot3["matchEffect" .. slot10] ~= "" then
			table.insert(slot6, {
				verticalSpace = 10,
				str = "#C0x5B545B#" .. slot3["matchEffect" .. slot10]
			})
		end
	end

	beauty.textScroll({
		isRich = true,
		list = slot2.list,
		strs = slot6
	})
	slot2.titleBg1:width(math.max(slot2.titleBg1:get("textTitle"):width(), slot2.titleBg1:width()))
	slot2.titleBg2:width(math.max(slot2.titleBg2:get("textTitle"):width(), slot2.titleBg2:width()))
	slot2.titleBg3:width(math.max(slot2.titleBg3:get("textTitle"):width(), slot2.titleBg3:width()))
	slot2.titleBg1:get("textTitle"):x(slot2.titleBg1:width() / 2)
	slot2.titleBg2:get("textTitle"):x(slot2.titleBg2:width() / 2)
	slot2.titleBg3:get("textTitle"):x(slot2.titleBg3:width() / 2)
end

function slot2.onItemClick(slot0, slot1, slot2, slot3, slot4)
	gGameUI:stackUI("city.handbook.view", nil, {
		full = true
	}, {
		cardId = slot4.cardId
	})
end

return slot2
