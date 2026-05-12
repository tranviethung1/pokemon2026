slot0 = class("BattleEndlessWinView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "battle_end_endless_win.json"
slot0.RESOURCE_BINDING = {
	["cardItem.card"] = "awardsItem",
	di = "di",
	awardsList = "awardsList",
	gateNum = "gateNum",
	guan = "guan",
	["backBtn.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	["againBtn.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	["dungeonsBtn.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	backBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBackBtnClick")
			}
		}
	},
	againBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAgainBtnClick")
			}
		}
	},
	dungeonsBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onDungeonsBtnClick")
			}
		}
	}
}

function slot0.playEndEffect(slot0)
	slot1 = slot0:getResourceNode()

	widget.addAnimation(slot1, "level/newzhandoushengli.skel", "effect", 100):anchorPoint(cc.p(0.5, 0.5)):xy(slot1:get("title"):getPosition()):addPlay("effect_loop")
end

function slot0.onCreate(slot0, slot1, slot2, slot3)
	audio.playEffectWithWeekBGM("gate_win.mp3")

	slot0.data = slot2
	slot0.results = slot3
	slot4 = slot0:getResourceNode()

	for slot9, slot10 in pairs({
		backBtn = "back2City",
		againBtn = "nextGate",
		dungeonsBtn = "dungeonList"
	}) do
		slot4:get(slot9 .. ".text"):text(gLanguageCsv[slot10])
	end

	slot3 = slot3 or {}
	slot7 = slot2.preData or {}
	slot8 = slot7.roleInfo or {}
	slot8 = slot7.cardsInfo or {}
	slot8 = (slot3.serverData or {}).view.drop or {}
	slot0.gateIdx = slot3.gateIdx or 1

	slot0:playEndEffect()
	slot4:get("curGate"):text(gLanguageCsv.curEndlessGateIdx .. " :")
	slot4:get("gateNum"):text(slot0.gateIdx)
	slot4:get("awardsText"):text(gLanguageCsv.getAwards .. " :")

	slot9 = dataEasy.isGateIdDoubleDrop(slot1)

	if slot2.preData.isFirst then
		slot9 = false
	end

	if next(slot8) ~= nil then
		slot10 = {}

		for slot14, slot15 in csvMapPairs(slot8) do
			table.insert(slot10, {
				key = slot14,
				num = slot15,
				isDouble = slot9
			})
		end

		slot0:showItem(1, slot10)
	end

	adapt.oneLinePos(slot0.di, {
		slot0.gateNum,
		slot0.guan
	}, {
		cc.p(5, 0),
		cc.p(5, 0)
	})
end

function slot0.showItem(slot0, slot1, slot2)
	slot3 = slot0.awardsItem:clone()

	slot3:show()
	bind.extend(slot0, slot3, {
		class = "icon_key",
		props = {
			data = {
				key = slot2[slot1].key,
				num = slot2[slot1].num
			},
			isDouble = slot2[slot1].isDouble,
			specialKey = {
				maxLimit = true
			},
			onNode = function (slot0)
				slot1, slot2 = slot0:xy()

				slot0:xy(slot1, slot2 + 3)
				slot0:hide():z(2)
				transition.executeSequence(slot0, true):delay(0.5):func(function ()
					uv0 = "show"

					slot0:show()
				end):done()
			end
		}
	})
	slot0.awardsList:setItemsMargin(25)
	slot0.awardsList:pushBackCustomItem(slot3)
	slot0.awardsList:setScrollBarEnabled(false)
	transition.executeSequence(slot0.awardsList, true):delay(0.25):func(function ()
		uv0 = "csvSize"
		uv2 = "showItem"

		if slot0 < csvSize(slot2) then
			uv0 = "csvSize"
			uv2 = "csvSize"
			uv3 = "showItem"

			slot0:showItem(slot2 + 1, slot3)
		end
	end):done()
end

function slot0.onBackBtnClick(slot0)
	gGameUI:cleanStash()
	gGameUI:switchUI("city.view")
end

function slot0.onAgainBtnClick(slot0)
	slot2 = slot0.gateIdx + 1

	if csvSize(csv.endless_tower_scene) <= slot0.gateIdx then
		slot0:onDungeonsBtnClick()
		gGameUI:showTip(gLanguageCsv.allCheckpointscleared)
	else
		slot3 = gGameUI:switchUI("city.view")

		gGameUI:sendMessage("nextGate", slot2)
	end
end

function slot0.onDungeonsBtnClick(slot0)
	gGameUI:switchUI("city.view")
end

return slot0
