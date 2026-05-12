slot1 = class("BattlePauseView", cc.load("mvc").ViewBase)

function slot2(slot0, slot1)
	slot1:scale(0.95)
end

function slot3(slot0, slot1)
	slot1:scale(1)
end

slot1.RESOURCE_FILENAME = "battle_pause.json"
slot1.RESOURCE_BINDING = {
	text2 = "text2",
	setBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSetBtnClick")
			}
		}
	},
	backBtn = {
		binds = {
			event = "touch",
			methods = {
				began = slot2,
				ended = bindHelper.self("onBackBtnClick"),
				cancelled = slot3
			}
		}
	},
	restartBtn = {
		binds = {
			event = "touch",
			methods = {
				began = slot2,
				ended = bindHelper.self("onRestartBtnClick"),
				cancelled = slot3
			}
		}
	},
	continueBtn = {
		binds = {
			event = "touch",
			methods = {
				began = slot2,
				ended = bindHelper.self("onClose"),
				cancelled = slot3
			}
		}
	},
	["setBtn.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
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
	["restartBtn.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	["continueBtn.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	}
}
slot4 = {
	setBtn = "battleSet",
	backBtn = "battleBack",
	restartBtn = "battleRestart",
	continueBtn = "battleContinue"
}

function slot1.onCreate(slot0, slot1)
	display.director:pause()
	slot0.text2:ignoreContentAdaptWithSize(false)

	slot6 = 200

	slot0.text2:setContentSize(cc.size(410, slot6))
	slot0.text2:setTextVerticalAlignment(cc.VERTICAL_TEXT_ALIGNMENT_CENTER)
	slot0.text2:setTextHorizontalAlignment(cc.TEXT_ALIGNMENT_LEFT)

	slot4 = -8

	slot0.text2:getVirtualRenderer():setLineSpacing(slot4)

	slot0.battleView = slot1
	slot2 = slot0:getResourceNode()
	uv4 = "display"

	for slot6, slot7 in pairs(slot4) do
		slot8 = slot2:get(slot6 .. ".text")

		slot8:setString(gLanguageCsv[slot7])
		text.addEffect(slot8, {
			outline = {
				size = 4,
				color = ui.COLORS.NORMAL.WHITE
			}
		})
	end

	slot2:get("setBtn"):setVisible(false)

	if not battle.PauseNoShowStarConditionsGateType[slot1.gateType] then
		if not slot0.battleView:getPlayModel():getStarConditions() then
			return
		end

		slot0.conditionTb = slot3

		for slot7 = 1, 3 do
			slot9 = slot3[slot7][2]
			slot10 = slot2:get("text" .. slot7)

			slot10:setString(string.format(gLanguageCsv["starCondition" .. slot3[slot7][1]], slot9))
			text.addEffect(slot10, {
				color = ui.COLORS.NORMAL.LIGHT_GREEN
			})

			slot11 = slot2:get("count" .. slot7)

			slot11:setString(string.format("(%s/%s)", 0, slot9))
			text.addEffect(slot11, {
				color = ui.COLORS.NORMAL.LIGHT_GREEN
			})
		end
	else
		for slot6 = 1, 3 do
			slot2:get("text" .. slot6):hide()
			slot2:get("count" .. slot6):hide()
			slot2:get("star" .. slot6):hide()
		end

		uv4 = "display"

		for slot6, slot7 in pairs(slot4) do
			slot8 = slot2:get(slot6)
			slot9, slot10 = slot8:xy()

			slot8:xy(slot9, slot10 + 300)
		end
	end

	slot0:showPanel()
end

function slot1.showPanel(slot0)
	if not slot0.conditionTb then
		return
	end

	slot1 = slot0:getResourceNode()
	slot2, slot3 = slot0.battleView:getPlayModel():getGateStar()

	for slot7 = 1, 3 do
		slot1:get("count" .. slot7):setString(string.format("(%s/%s)", slot3[slot7][2] or 0, slot0.conditionTb[slot7][2]))

		if not slot3[slot7][1] then
			text.addEffect(slot1:get("text" .. slot7), {
				color = cc.c4b(236, 183, 42, 255)
			})
			text.addEffect(slot11, {
				color = cc.c4b(236, 183, 42, 255)
			})
		end

		slot1:get("star" .. slot7 .. ".achieve"):setVisible(slot8)
	end
end

function slot1.onSetBtnClick(slot0)
end

function slot1.onClose(slot0)
	display.director:resume()

	slot1 = audio.resumeAllSounds

	slot1()

	uv1 = "display"

	slot1.onClose(slot0)
end

function slot1.onBackBtnClick(slot0)
	audio.stopAllSounds()
	display.director:resume()
	gGameUI:switchUI("city.view")
end

slot5 = {
	[game.GATE_TYPE.normal] = true,
	[game.GATE_TYPE.endlessTower] = false,
	[game.GATE_TYPE.randomTower] = true,
	[game.GATE_TYPE.dailyGold] = true,
	[game.GATE_TYPE.dailyExp] = true,
	[game.GATE_TYPE.fragment] = true,
	[game.GATE_TYPE.simpleActivity] = true,
	[game.GATE_TYPE.gift] = true,
	[game.GATE_TYPE.unionFuben] = true,
	[game.GATE_TYPE.gym] = true,
	[game.GATE_TYPE.huoDongBoss] = true,
	[game.GATE_TYPE.braveChallenge] = false,
	[game.GATE_TYPE.summerChallenge] = false,
	[game.GATE_TYPE.hunting] = true
}

function slot1.onRestartBtnClick(slot0)
	display.director:resume()
	display.director:getScheduler():setTimeScale(1)
	assert(slot0.battleView.data and slot0.battleView.entrance, "data and entrance was nil !")

	if slot1.play_record_id and slot1.cross_key and slot1.record_url then
		gGameModel:playRecordBattle(slot1.play_record_id, slot1.cross_key, slot1.record_url, 0)

		return
	end

	if slot0.battleView.modes.isRecord then
		battleEntrance.battleRecord(slot1, {}):show()
	elseif slot1.randSeed then
		uv3 = "display"

		if slot3[slot1.gateType] then
			slot1.randSeed = math.random(1, 99999999)
			slot3 = string.format([[


		battle reseed - gate=%s, new_seed=%s, scene=%s

]], slot1.gateType, slot1.randSeed, slot1.sceneID)

			printInfo(slot3)
			log.battle(slot3)
			gGameUI:switchUI("battle.loading", slot1, slot1.sceneID, nil, slot2)
		else
			slot2:restart()
		end
	end
end

return slot1
