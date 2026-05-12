slot0 = cc.load("mvc").ViewBase
slot1 = class("ChipPlanEquipView", Dialog)
slot1.RESOURCE_FILENAME = "chip_plan_equip_tip.json"
slot1.RESOURCE_BINDING = {
	item = "item",
	tip = "tip",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnCancel = {
		varname = "btnCancel",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnOk = {
		varname = "btnOk",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClickOk")
			}
		}
	},
	["btnOk.title"] = {
		varname = "btnText",
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	list = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("data"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1:get("chip"), {
						class = "icon_key",
						props = {
							noListener = true,
							data = {
								key = slot3.chipId,
								dbId = slot3.dbId
							},
							specialKey = {
								lv = slot3.level
							},
							onNode = function (slot0)
								slot0:get("box"):hide()
								slot0:get("imgFG"):hide()
								slot0:get("defaultLv"):anchorPoint(0.5, 0):xy(slot0:width() / 2, 30)
								slot0:scale(1.1)
							end
						}
					})

					if slot3.cardDBID then
						slot1:get("line"):texture("city/card/chip/bar_1.png")
						slot1:get("card.icon"):hide()
						slot1:get("card.txt"):hide()

						slot5 = gGameModel.cards:find(slot3.cardDBID):read("card_id", "skin_id", "level", "star", "advance")

						bind.extend(slot0, slot1:get("card"), {
							class = "card_icon",
							props = {
								unitId = dataEasy.getUnitId(slot5.card_id, slot5.skin_id),
								advance = slot5.advance,
								rarity = csv.unit[csv.cards[slot5.card_id].unitID].rarity,
								dbid = slot3.cardDBID,
								star = slot5.star,
								levelProps = {
									data = slot5.level
								},
								onNode = function (slot0)
									uv3 = "alignCenter"

									slot0:alignCenter(slot3:get("card"):size()):scale(0.9)
								end
							}
						})
					else
						slot1:get("line"):texture("city/card/chip/bar_0.png")
						slot1:get("card.icon"):show()
						slot1:get("card.txt"):show()
					end
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.params = slot1
	slot2 = {}

	for slot7 = 1, table.maxn(slot1.chips) do
		if slot1.chips[slot7] then
			if gGameModel.chips:find(slot8):read("chip_id", "card_db_id", "level").card_db_id then
				slot3 = 0 + 1
			end

			table.insert(slot2, {
				dbId = slot8,
				chipId = slot10.chip_id,
				level = slot10.level,
				cardDBID = slot10.card_db_id
			})
		end
	end

	slot0.data = slot2

	slot0.tip:text(string.format(gLanguageCsv.chipPlanUsedTip, slot3))
	Dialog.onCreate(slot0)
end

function slot1.onClickOk(slot0)
	slot0:addCallbackOnExit(slot0.params.cb)
	slot0:onCloseFast()

	return slot0
end

return slot1
