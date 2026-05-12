slot1 = class("BattleEndlessFailView", require("battle.app_views.battle.battle_end.pve_fail"))
slot1.RESOURCE_FILENAME = "battle_end_pve_fail.json"
slot1.RESOURCE_BINDING = {
	exitText = "exitText",
	["eggBtn.text"] = BTN_TEXT_OUTLINE,
	["promoteBtn.text"] = BTN_TEXT_OUTLINE,
	["strengthBtn.text"] = BTN_TEXT_OUTLINE,
	["backBtn.text"] = BTN_TEXT_GLOW,
	["againBtn.text"] = BTN_TEXT_GLOW,
	["dungeonsBtn.text"] = BTN_TEXT_GLOW,
	["reStartBtn.text"] = BTN_TEXT_GLOW,
	["backCityBtn.text"] = BTN_TEXT_GLOW,
	eggBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onEggBtnClick")
			}
		}
	},
	promoteBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPromoteBtnClick")
			}
		}
	},
	strengthBtn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onStrengthBtnClick")
			}
		}
	},
	backBtn = {
		varname = "backBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBackBtnClick")
			}
		}
	},
	againBtn = {
		varname = "againBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAgainBtnClick")
			}
		}
	},
	dungeonsBtn = {
		varname = "dungeonsBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onDungeonsBtnClick")
			}
		}
	},
	reStartBtn = {
		varname = "reStartBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onReStartBtnClick")
			}
		}
	},
	backCityBtn = {
		varname = "backCityBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBackCityBtnClick")
			}
		}
	},
	bkg = {
		varname = "bkg",
		binds = {
			event = "click",
			method = bindHelper.self("onBgClick")
		}
	}
}

function slot1.playRecord(slot0)
	slot0.battleView.entrance:restart()
end

return slot1
