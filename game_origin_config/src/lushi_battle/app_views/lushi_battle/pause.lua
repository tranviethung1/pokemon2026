slot1 = class("AutoChessPauseView", cc.load("mvc").ViewBase)

function slot2(slot0, slot1)
	slot1:scale(0.95)
end

function slot3(slot0, slot1)
	slot1:scale(1)
end

slot1.RESOURCE_FILENAME = "auto_chess_battle_pause.json"
slot1.RESOURCE_BINDING = {
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
	abandonBtn = {
		binds = {
			event = "touch",
			methods = {
				began = slot2,
				ended = bindHelper.self("onAbandonBtnClick"),
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
	["abandonBtn.text"] = {
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
	abandonBtn = "abandonBtn",
	backBtn = "backBtn",
	continueBtn = "continueBtn"
}

function slot1.onCreate(slot0, slot1)
	display.director:pause()

	slot0.battleView = slot1
	uv4 = "display"

	for slot6, slot7 in pairs(slot4) do
		text.addEffect(slot0:getResourceNode():get(slot6 .. ".text"), {
			outline = {
				size = 4,
				color = ui.COLORS.NORMAL.WHITE
			}
		})
	end
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
	display.director:getScheduler():setTimeScale(1)
	gGameUI:cleanStash()
	gGameUI:switchUI("city.view")
end

function slot1.onAbandonBtnClick(slot0)
	if not slot0.battleView.isFighting then
		slot0.battleView:handleOperation(lushi.OperateTable.abandonGame)
	else
		gRootViewProxy:proxy():showTip(gLanguageCsv.autoChessNoAbandon)
	end

	display.director:resume()

	slot1 = audio.resumeAllSounds

	slot1()

	uv1 = "battleView"

	slot1.onClose(slot0)
end

return slot1
