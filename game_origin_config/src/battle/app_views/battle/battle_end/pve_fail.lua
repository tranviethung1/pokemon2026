slot0 = class("BattleEndFailView", cc.load("mvc").ViewBase)
slot1 = {
	binds = {
		event = "effect",
		data = {
			glow = {
				color = ui.COLORS.GLOW.WHITE
			}
		}
	}
}
slot2 = {
	binds = {
		event = "effect",
		data = {
			outline = {
				color = ui.COLORS.NORMAL.WHITE
			}
		}
	}
}
slot0.RESOURCE_FILENAME = "battle_end_pve_fail.json"
slot0.RESOURCE_BINDING = {
	exitText = "exitText",
	["eggBtn.text"] = slot2,
	["promoteBtn.text"] = slot2,
	["strengthBtn.text"] = slot2,
	["backBtn.text"] = slot1,
	["againBtn.text"] = slot1,
	["dungeonsBtn.text"] = slot1,
	["reStartBtn.text"] = slot1,
	["backCityBtn.text"] = slot1,
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
	},
	roundNums = {
		varname = "roundNums",
		binds = {
			event = "extend",
			class = "text_atlas",
			props = {
				isEqualDist = false,
				align = "center",
				pathName = "frhd_num",
				data = bindHelper.self("rounds")
			}
		}
	}
}

function slot0.playEndEffect(slot0)
	slot1 = slot0:getResourceNode()
	slot2 = CSprite.new("level/jiesuanshengli.skel")

	slot2:addTo(slot1, 100)
	slot2:setAnchorPoint(cc.p(0.5, 1))
	slot2:setPosition(slot1:get("title"):getPosition())
	slot2:visible(true)
	slot2:play("jiesuan_shibaizi")
	slot2:addPlay("jiesuan_shibaizi_loop")
	slot2:retain()

	slot3 = CSprite.new("level/jiesuanshengli.skel")

	slot3:addTo(slot1, 99)
	slot3:setAnchorPoint(cc.p(0.5, 1))
	slot3:setPosition(slot1:get("title"):getPosition())
	slot3:visible(true)
	slot3:play("jiesuan_shibaitu")
	slot3:addPlay("jiesuan_shibaitu_loop")
	slot3:retain()
end

function slot0.initMode(slot0, slot1)
	slot1 = slot1 or 1

	for slot6, slot7 in pairs(({
		{
			slot0.backBtn,
			slot0.againBtn,
			slot0.dungeonsBtn
		},
		{
			slot0.reStartBtn,
			slot0.backCityBtn
		},
		{
			slot0.bkg,
			slot0.exitText
		}
	})[slot1]) do
		slot7:show()
	end

	slot0.bkg:setTouchEnabled(slot1 == 3)
end

function slot0.onCreate(slot0, slot1, slot2, slot3)
	audio.playEffectWithWeekBGM("battle_false.mp3")

	slot0.battleView = slot1
	slot0.sceneID = slot1.sceneID
	slot0.data = slot1.data
	slot0.results = slot2

	slot0:initMode(slot3)

	if slot0.data.gateType == game.GATE_TYPE.braveChallenge then
		slot0:getResourceNode():get("round"):text(gLanguageCsv.round .. " :"):show()

		slot0.rounds = slot2.round

		slot0.roundNums:show()
	end

	slot0:playEndEffect()
end

function slot0.playRecord(slot0)
	if slot0.data.gateType == game.GATE_TYPE.normal then
		slot0.battleView.entrance:restart()
	end
end

function slot0.backToCity(slot0)
	gGameUI:cleanStash()
	gGameUI:switchUI("city.view")
end

function slot0.backToList(slot0)
	gGameUI:switchUI("city.view")
end

function slot0.onEggBtnClick(slot0)
	gGameUI:switchUI("city.view")
	gGameUI:stackUI("city.drawcard.view")
	sdk.trackEvent("fail_draw")
end

function slot0.onPromoteBtnClick(slot0)
	gGameUI:cleanStash()
	gGameUI:switchUI("city.view")
	jumpEasy.jumpTo("strengthen")
	sdk.trackEvent("fail_pokeenhance")
end

function slot0.onStrengthBtnClick(slot0)
	gGameUI:cleanStash()
	gGameUI:switchUI("city.view")
	jumpEasy.jumpTo("strengthen")
	sdk.trackEvent("fail_trinketenhance")
end

function slot0.onBackBtnClick(slot0)
	slot0:backToCity()
end

function slot0.onAgainBtnClick(slot0)
	slot0:playRecord()
	sdk.trackEvent("fail_again")
end

function slot0.onDungeonsBtnClick(slot0)
	slot0:backToList()
end

function slot0.onReStartBtnClick(slot0)
	slot0:playRecord()
end

function slot0.onBackCityBtnClick(slot0)
	slot0:backToList()
end

function slot0.onBgClick(slot0)
	slot0:backToList()
end

return slot0
