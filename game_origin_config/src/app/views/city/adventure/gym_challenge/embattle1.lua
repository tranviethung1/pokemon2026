slot0 = cc.load("mvc").ViewBase
slot2 = class("GymChallengeEmbattleView", require("app.views.city.card.embattle.base"))
slot2.RESOURCE_FILENAME = "gym_embattle1.json"
slot2.RESOURCE_BINDING = {
	spritePanel = "spriteItem",
	fightNote = "fightNote",
	rightTop = "rightTop",
	attrItem = "attrItem",
	rightDown = "rightDown",
	["rightTop.textNote"] = "textNote",
	battlePanel = "battlePanel",
	textNotRole = "emptyTxt",
	bottomPanel = "bottomPanel",
	["rightTop.imgBg"] = "attrBg",
	btnGHimg = {
		varname = "btnGHimg",
		binds = {
			event = "extend",
			class = "buff_arms",
			props = {
				redHintTag = "gymChallenge",
				battleCards = bindHelper.self("clientBattleCards"),
				arms = bindHelper.self("selectArms"),
				sceneType = bindHelper.self("sceneType"),
				getCardAttrsEx = bindHelper.self("getCardAttrsEx", true),
				isRefresh = bindHelper.self("isRefresh")
			}
		}
	},
	btnWeather = {
		varname = "btnWeather",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onTeamWeatherClick")
			}
		}
	},
	["fightNote.textFightPoint"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("fightSumNum")
		}
	},
	["battlePanel.ahead.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["battlePanel.back.txt"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["rightDown.btnChallenge"] = {
		varname = "btnChallenge",
		binds = {
			event = "touch",
			clicksafe = true,
			methods = {
				ended = bindHelper.self("fightBtn")
			}
		}
	},
	["rightDown.btnChallenge.textNote"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["rightDown.btnSave"] = {
		varname = "btnSave",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("saveBtn")
			}
		}
	},
	["rightDown.btnSave.textNote"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["rightDown.btnOneKeySet"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("oneKeyEmbattleBtn")
			}
		}
	},
	["rightDown.btnOneKeySet.textNote"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["rightTop.arrList"] = {
		varname = "arrList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("limitInfo"),
				item = bindHelper.self("attrItem"),
				textNote = bindHelper.self("textNote"),
				attrBg = bindHelper.self("attrBg"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("imgIcon"):texture(ui.ATTR_ICON[slot3])
				end,
				onAfterBuild = function (slot0)
					slot2 = csvSize(slot0.data)
					slot3 = slot0.item:size().width * slot2 + slot0:getItemsMargin() * (slot2 - 1)

					slot0:setAnchorPoint(cc.p(1, 0.5))
					slot0:width(slot3)
					slot0:xy(cc.p(600, 50))
					adapt.oneLinePos(slot0, slot0.textNote, cc.p(0, 0), "right")
					slot0.attrBg:width(slot3 + slot0.textNote:width() + 40)
					slot0.attrBg:x(slot0.textNote:x() - 40)
				end
			}
		}
	},
	["textPanel.textNum"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("battleNum")
		}
	}
}

function slot2.onCreate(slot0, slot1)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose", false)
	}):init({
		subTitle = "FORMATION",
		title = gLanguageCsv.formation
	})
	slot0.spriteItem:get("attrBg"):hide()
	slot0:initDefine(slot1)
	slot0:initParams(slot1)
	slot0:initModel(slot1)
	slot0:initRoundUIPanel()
	slot0:initHeroSprite()
	slot0:initBottomList()

	slot0.haveSaved = false

	if slot0.from == game.EMBATTLE_FROM_TABLE.gymChallenge then
		if itertools.size(slot0.battleCardsData:read()) == 0 then
			slot0.battleCardsData:set(slot0:getOneKeyCardDatas())
		end
	elseif slot0.from == game.EMBATTLE_FROM_TABLE.onekey then
		slot0.battleCardsData:set(slot0:getOneKeyCardDatas())
	end

	slot0:initBattleChange()
end

function slot2.initDefine(slot0, slot1)
	if slot1.gateId then
		slot0.embattleMax = csv.gym.gate[slot1.gateId].deployCardNumLimit
		slot0.deployType = csv.gym.gate[slot1.gateId].deployType
	else
		slot0.embattleMax = 6
		slot0.deployType = 1
	end

	slot0.panelNum = 6
	slot0.gymId = slot1.gymId
end

function slot2.initParams(slot0, slot1)
	slot1 = slot1 or {}
	slot0.from = slot1.from
	slot0.sceneType = game.SCENE_TYPE.gym
	slot0.fightCb = slot1.fightCb
	slot0.saveCb = slot1.saveCb

	if slot1.gateId then
		slot0.limitInfo = csv.gym.gate[slot1.gateId].deployNatureLimit
	else
		slot0.limitInfo = slot1.limitInfo
	end

	slot0.checkBattleArr = slot1.checkBattleArr or function ()
		return true
	end
end

function slot2.initRoundUIPanel(slot0)
	adapt.centerWithScreen("left", "right", nil, {
		{
			slot0.fightNote,
			"pos",
			"right"
		},
		{
			slot0.rightDown,
			"pos",
			"right"
		},
		{
			slot0.rightTop,
			"pos",
			"right"
		}
	})

	if itertools.size(slot0.limitInfo) == 0 then
		slot0.rightTop:hide()
	end

	slot0.btnChallenge:visible(slot0.fightCb and true or false)
	slot0.btnSave:visible(slot0.saveCb and true or false)
end

function slot2.limtFunc(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	slot10 = itertools.map(slot0.limitInfo or {}, function (slot0, slot1)
		return slot1, 1
	end)
	slot12 = csv.unit[csv.cards[slot2].unitID]

	if csvSize(slot0.limitInfo) == 0 or slot10[slot12.natureType] or slot10[slot12.natureType2] then
		uv13 = "itertools"

		return slot13.limtFunc(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	else
		return nil
	end
end

function slot2.whichEmbattleTargetPos(slot0, slot1)
	for slot5, slot6 in pairs(slot0.heroSprite) do
		slot7 = slot0.battlePanel:get("item" .. slot5)
		slot8 = slot7:box()
		slot9 = slot7:getParent():convertToWorldSpace(cc.p(slot8.x, slot8.y))
		slot8.y = slot9.y
		slot8.x = slot9.x

		if cc.rectContainsPoint(slot8, slot1) then
			return slot5
		end
	end
end

function slot2.saveBtn(slot0, slot1, slot2)
	slot0:saveCb(slot0.clientBattleCards, slot0.battleCardsData, slot2, {
		weather = slot0.selectWeatherID:read(),
		arms = table.deepcopy(slot0.selectArms:read(), true)
	})
end

function slot2.onClose(slot0, slot1)
	if slot1 ~= true then
		if slot0.saveCb then
			if not slot0.haveSaved or not itertools.equal(slot0.clientBattleCards:read(), slot0.battleCardsData:read()) then
				gGameUI:showDialog({
					btnType = 2,
					clearFast = true,
					cb = function ()
						uv0 = "saveBtn"

						slot0:saveBtn(nil, true)
					end,
					cancelCb = function ()
						uv0 = "onClose"
						uv1 = "onClose"

						slot0.onClose(slot1)
					end,
					content = gLanguageCsv.gymOutCanNotChangeEmbattle
				})
			else
				uv2 = "saveCb"

				slot2.onClose(slot0)
			end
		else
			if slot0.from == game.EMBATTLE_FROM_TABLE.gymChallenge then
				slot2 = gGameModel.gym:read("date")

				for slot8, slot9 in pairs(slot0.clientBattleCards:read()) do
					-- Nothing
				end

				userDefault.setForeverLocalKey("gym_emabttle" .. slot0.gymId, {
					[slot8] = stringz.bintohex(slot9)
				}, {
					new = true
				})
				userDefault.setForeverLocalKey("gym_emabttle_weather" .. slot0.gymId, slot0.selectWeatherID:read(), {
					new = true
				})
				userDefault.setForeverLocalKey("gym_emabttle_arms" .. slot0.gymId, table.deepcopy(slot0.selectArms:read(), true), {
					new = true
				})
			end

			uv2 = "saveCb"

			slot2.onClose(slot0)
		end
	end
end

return slot2
