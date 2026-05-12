slot0 = class("CloneBattleSpriteList", Dialog)
slot0.RESOURCE_FILENAME = "clone_battle_spr_show.json"
slot0.RESOURCE_BINDING = {
	item = "item",
	showPanel = "showPanel",
	["item.spr1.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["item.spr2.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["item.spr3.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	},
	["showPanel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("natureDatas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot3.natureId
					slot11 = "spr3"
					slot5 = slot1:multiget("natureImg", "text", "spr1", "spr2", slot11)

					slot5.natureImg:texture(ui.SKILL_ICON[slot4])
					slot5.text:text(gLanguageCsv[game.NATURE_TABLE[slot4]] .. gLanguageCsv.talentElement)
					text.addEffect(slot5.text, {
						outline = {
							size = 4,
							color = ui.COLORS.OUTLINE.WHITE
						},
						color = ui.COLORS.ATTR[slot4]
					})

					slot7 = {
						[csv.cards[slot11].cardMarkID] = true
					}

					for slot11, slot12 in pairs(gGameModel.role:read("pokedex")) do
						-- Nothing
					end

					for slot11 = 1, 3 do
						slot5["spr" .. slot11]:visible(slot3.spriteTb[slot11] and true or false)

						if slot12 then
							slot13:texture(slot12.config.iconSimple)
							slot13:get("text"):text(slot12.config.name)

							if not slot12.inBox then
								cache.setShader(slot13, false, "hsl_gray")
							end
						end
					end
				end
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2, slot3)
	slot0.natureDatas = slot1
	slot5 = slot0.item:size().height
	slot6 = (slot5 + 20) * #slot1 - 20

	slot0.list:height(slot6):xy(50, 50)
	slot0.showPanel:height(slot6 + 98):xy(slot2 - slot0.showPanel:size().width - 70, 1000 - (slot6 - slot5 - 20))
	Dialog.onCreate(slot0, {
		noBlackLayer = true,
		clickClose = true
	})
end

return slot0
