slot0 = require("app.views.city.card.star_swap.tools")
slot1 = class("StarSwapOverView", Dialog)
slot1.RESOURCE_FILENAME = "swap_over.json"
slot1.RESOURCE_BINDING = {
	starItem = "starItem",
	leftPanel = "leftPanel",
	rightPanel = "rightPanel",
	spinePanel = {
		varname = "spinePanel",
		binds = {
			event = "click",
			method = bindHelper.self("onClose")
		}
	},
	["leftPanel.name"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(66, 61, 66, 255)
				}
			}
		}
	},
	["leftPanel.leftLevel"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(66, 61, 66, 255)
				}
			}
		}
	},
	["leftPanel.leftStarList"] = {
		varname = "leftStarList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 6,
				data = bindHelper.self("starLeftDatas"),
				item = bindHelper.self("starItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("img"):texture(slot3.icon)
				end
			}
		}
	},
	["rightPanel.rightStarList"] = {
		varname = "rightStarList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 6,
				data = bindHelper.self("starRightDatas"),
				item = bindHelper.self("starItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("img"):texture(slot3.icon)
				end
			}
		}
	},
	["rightPanel.rightLevel"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(66, 61, 66, 255)
				}
			}
		}
	},
	["rightPanel.name"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(66, 61, 66, 255)
				}
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.leftDbId = slot1.leftDbId
	slot0.rightDbId = slot1.rightDbId
	slot0.starLeftDatas = idlertable.new({})
	slot0.starRightDatas = idlertable.new({})

	widget.addAnimation(slot0.spinePanel, "level/jiesuanshengli.skel", "jiesuan_shenglitu", 99):anchorPoint(cc.p(0.5, 0.5)):name("textSpine"):xy(slot0.spinePanel:width() / 2, slot0.spinePanel:height() / 2 - 55):addPlay("jiesuan_shenglitu_loop")
	widget.addAnimation(slot0.spinePanel, "level/jiesuanshengli.skel", "xjiesuan_jiaohuan", 100):anchorPoint(cc.p(0.5, 0.5)):name("textSpine"):xy(slot0.spinePanel:width() / 2, slot0.spinePanel:height() / 2 - 55):addPlay("xjiesuan_jiaohuan_loop")
	slot0:cardStarChanged()
	slot0:updateBottom()
	Dialog.onCreate(slot0, {
		clearFast = true
	})
end

function slot1.updateBottom(slot0)
	for slot7, slot8 in ipairs({
		{
			name = slot0.leftPanel:get("name"),
			level = slot0.leftPanel:get("leftLevel"),
			icon = slot0.leftPanel:get("leftIcon"),
			sprite = slot0.leftPanel:get("leftSprite")
		},
		{
			name = slot0.rightPanel:get("name"),
			level = slot0.rightPanel:get("rightLevel"),
			icon = slot0.rightPanel:get("rightIcon"),
			sprite = slot0.rightPanel:get("rightSprite")
		}
	}) do
		slot10 = gGameModel.cards:find(({
			slot0.leftDbId,
			slot0.rightDbId
		})[slot7]):read("card_id", "skin_id", "star", "advance", "level")
		slot11 = slot10.card_id
		slot12 = dataEasy.getUnitCsv(slot11, slot10.skin_id)

		uiEasy.setIconName("card", slot11, {
			noColor = true,
			space = true,
			node = slot8.name,
			name = csv.cards[slot11].name,
			advance = slot10.cardData
		})
		slot8.sprite:texture(slot12.iconSimple)
		slot8.icon:show():texture(ui.RARITY_ICON[slot12.rarity])
		slot8.level:show():text(string.format(gLanguageCsv.starLevel, slot10.level))
		adapt.oneLinePos(slot8.level, slot8.icon, cc.p(10, 0))
	end
end

function slot1.cardStarChanged(slot0)
	for slot7, slot8 in ipairs({
		gGameModel.cards:find(slot0.leftDbId):read("star"),
		gGameModel.cards:find(slot0.rightDbId):read("star")
	}) do
		uv11 = "gGameModel"

		({
			slot0.starLeftDatas,
			slot0.starRightDatas
		})[slot7]:set(slot11.getStarData(slot8))
	end
end

return slot1
