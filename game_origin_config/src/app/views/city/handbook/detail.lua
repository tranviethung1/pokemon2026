slot0 = cc.load("mvc").ViewBase
slot1 = require("app.views.city.handbook.tools")
slot2 = class("HandbookDetailView", Dialog)
slot2.RESOURCE_FILENAME = "handbook_detail.json"
slot2.RESOURCE_BINDING = {
	starItem = "starItem",
	pageItem = "pageItem",
	mask = "mask",
	leftPanel = "leftPanel",
	rightPanel = "rightPanel",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["leftPanel.pageList"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 15,
				data = bindHelper.self("evolutionDatas"),
				item = bindHelper.self("pageItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("normal"):visible(slot3.select ~= true)
					slot1:get("select"):visible(slot3.select == true)
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	},
	["rightPanel.btnDetail"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnDetail")
			}
		}
	},
	["rightPanel.addPanel.list"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("starDatas"),
				item = bindHelper.self("starItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("icon"):texture(slot3.icon)
				end
			}
		}
	},
	["rightPanel.nextAddPanel.list"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("nextStarDatas"),
				item = bindHelper.self("starItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("icon"):texture(slot3.icon)
				end
			}
		}
	},
	["rightPanel.nextAddPanel.btnGoto"] = {
		varname = "btnGoto",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnGotoClick")
			}
		}
	},
	["rightPanel.nextAddPanel.btnGoto.textTitle"] = {
		binds = {
			event = "effect",
			data = {
				color = ui.COLORS.NORMAL.WHITE,
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	}
}

function slot2.onCreate(slot0, slot1, slot2)
	slot0.cb = slot2

	slot0:initModel()

	slot0.cardId = slot1 or gGameModel.cards:find(slot0.cards:read()[1]):read("card_id")
	slot0.cardMarkID = csv.cards[slot0.cardId].cardMarkID
	slot0.starDatas = idlertable.new({})
	slot0.nextStarDatas = idlertable.new({})

	slot0:setRightPanel()

	slot4, slot5, slot6 = dataEasy.getCardMaxStar(slot0.cardMarkID)
	slot0.evolutionDatas = idlers.new({})
	slot7 = {}

	for slot11, slot12 in orderCsvPairs(csv.cards) do
		if matchLanguageForce(slot12.languages) and slot12.cardMarkID == slot3.cardMarkID and slot12.canDevelop then
			table.insert(slot7, {
				existCards = slot5,
				selectDevelop = slot12.develop,
				cfg = slot12,
				id = slot11
			})
		end
	end

	table.sort(slot7, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	slot0.evolutionDatas:update(slot7)

	slot8 = 0

	for slot12, slot13 in ipairs(slot7) do
		if slot13.id == slot3.id then
			slot8 = slot12
		end
	end

	slot0.selectEvolution = idler.new(slot8)

	slot0.selectEvolution:addListener(function (slot0, slot1)
		uv2 = "evolutionDatas"
		slot2 = slot2.evolutionDatas
		slot3 = slot2
		slot2 = slot2.atproxy(slot3, slot0)
		uv3 = "evolutionDatas"

		if slot3.evolutionDatas:atproxy(slot1) then
			slot3.select = false
		end

		if slot2 then
			uv4 = "evolutionDatas"

			slot4:setLeftPanel(slot2)

			slot2.select = true
		end
	end)
	slot0:initPrivilegeListener()
	Dialog.onCreate(slot0)
end

function slot2.initModel(slot0)
	slot0.items = gGameModel.role:getIdler("items")
	slot0.cards = gGameModel.role:getIdler("cards")
	slot0.cardFeels = gGameModel.role:getIdler("card_feels")
	slot0.gold = gGameModel.role:getIdler("gold")
end

function slot2.setLeftPanel(slot0, slot1)
	slot2 = slot0.leftPanel:multiget("cardIcon", "iconRarity", "textCardName", "iconAttr1", "iconAttr2", "btnSelectItem")
	slot3 = csv.unit[slot1.cfg.unitID]

	slot2.cardIcon:removeAllChildren()
	widget.addAnimation(slot2.cardIcon, slot3.unitRes, ({
		"standby_loop",
		"attack",
		"win_loop",
		"run_loop"
	})[1], 5):xy(slot2.cardIcon:size().width / 2, 0):scale(slot3.scaleU * 2.3):setSkin(slot3.skin)
	slot2.iconAttr1:texture(ui.ATTR_ICON[slot3.natureType])
	slot2.iconAttr2:hide()

	if slot3.natureType2 then
		slot2.iconAttr2:texture(ui.ATTR_ICON[slot3.natureType2]):show()
	end

	slot2.textCardName:text(slot1.cfg.name)
	slot2.iconRarity:texture(ui.RARITY_ICON[slot3.rarity])
	adapt.oneLinePos(slot2.textCardName, slot2.iconRarity, cc.p(8, 0), "right")
	adapt.oneLinePos(slot2.textCardName, {
		slot2.iconAttr1,
		slot2.iconAttr2
	}, cc.p(8, 0))
end

function slot2.setRightPanel(slot0)
	slot1, slot2, slot0.dbid = dataEasy.getCardMaxStar(slot0.cardMarkID)
	uv4 = "dataEasy"
	slot4, slot5, slot6 = slot4.getStarAttrData(slot0.cardMarkID)
	slot7 = nil
	slot8 = 0

	for slot12, slot13 in orderCsvPairs(gPokedexDevelop[slot0.cardMarkID]) do
		if slot6 ~= slot13.attrValue1 and slot1 < slot12 then
			slot7 = slot13.attrValue1
			slot8 = slot12

			break
		end
	end

	uv9 = "dataEasy"

	slot9.setAttrPanel(slot0.rightPanel:get("addPanel"), slot4, slot5 .. ":", slot6)

	if slot7 ~= nil then
		uv9 = "dataEasy"

		slot9.setAttrPanel(slot0.rightPanel:get("nextAddPanel"), slot4, slot5 .. ":", slot7)
	end

	slot0.rightPanel:get("nextAddPanel"):visible(slot7 ~= nil)
	slot0.rightPanel:get("ImgMax"):scale(2):visible(slot7 == nil)
	slot0.btnGoto:visible(slot1 > 0)
	slot0.starDatas:set(dataEasy.getStarData(slot1))
	slot0.nextStarDatas:set(dataEasy.getStarData(slot8))
end

function slot2.initPrivilegeListener(slot0)
	uiEasy.addTouchOneByOne(slot0.mask, {
		ended = function (slot0, slot1, slot2)
			if math.abs(slot1) > 100 and math.abs(slot2) < math.abs(slot1) then
				slot3 = slot1 > 0 and -1 or 1
				uv4 = "math"

				slot4.selectEvolution:modify(function (slot0)
					uv2 = "cc"
					uv4 = "clampf"

					return true, cc.clampf(slot0 + slot2, 1, slot4.evolutionDatas:size())
				end)
			end
		end
	})
end

function slot2.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

function slot2.onBtnGotoClick(slot0)
	gGameUI:stackUI("city.card.strengthen", nil, , 1, slot0.dbid, slot0:createHandler("setRightPanel"))
end

function slot2.onBtnDetail(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1220
	})
end

function slot2.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.descriptionCultureAddition)
		end),
		slot2.noteText(72001, 72004)
	}
end

return slot2
