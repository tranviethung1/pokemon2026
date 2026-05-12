slot1 = class("RandomTowerMainView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "random_tower_main.json"
slot1.RESOURCE_BINDING = {
	hell = "hell",
	normal = "normal",
	["normal.title"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["normal.btn"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onNormalClick")
			}
		}
	},
	["hell.title"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["hell.btn"] = {
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onHellClick")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					specialTag = "hellRandomTower",
					onNode = function (slot0)
						slot0:xy(510, 200)
					end
				}
			}
		}
	},
	["hell.rule"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onThemeRuleClick")
			}
		}
	},
	themeTip = {
		varname = "themeTip",
		binds = {
			event = "click",
			method = bindHelper.self("onThemeTipClick")
		}
	}
}
slot1.RESOURCE_STYLES = {
	full = true
}

function slot1.onCreate(slot0)
	gGameUI.topuiManager:createView("random_tower", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "AETHER PARADISE",
		title = gLanguageCsv.randomTower
	})

	if not dataEasy.isShow(gUnlockCsv.hellRandomTower) then
		slot0.hell:hide()
		slot0.normal:get("playing"):hide()
		slot0.normal:get("btn.passed"):hide()
		slot0.normal:x(display.sizeInView.width / 2)
		gGameUI:stackUI("city.adventure.random_tower.normal", {
			cb = slot0:createHandler("onClose")
		})

		return
	end

	slot0:enableSchedule()
	idlereasy.any({
		gGameModel.random_tower:getIdler("room_info"),
		gGameModel.hell_random_tower:getIdler("round"),
		gGameModel.hell_random_tower:getIdler("room_info")
	}, function ()
		uv0 = "setPanel"

		slot0:setPanel()
	end)
end

function slot1.setPanel(slot0)
	slot0.themeTip:hide()

	slot1 = gGameModel.random_tower:read("room")

	slot0.normal:get("playing"):hide()
	slot0.normal:get("btn.passed"):hide()

	if gGameModel.random_tower:read("room_info").pass then
		slot0.normal:get("btn.passed"):show()
	elseif slot1 > 1 then
		slot0.normal:get("playing"):show()
		text.addEffect(slot0.normal:get("playing.txt1"), {
			outline = {
				size = 6,
				color = cc.c4b(255, 84, 0, 255)
			}
		})
		text.addEffect(slot0.normal:get("playing.txt2"), {
			outline = {
				size = 6,
				color = cc.c4b(255, 84, 0, 255)
			}
		})
	end

	slot3 = dataEasy.isUnlock(gUnlockCsv.hellRandomTower)
	slot4 = gGameModel.hell_random_tower:read("round")
	slot5 = gGameModel.hell_random_tower:read("room")
	slot6 = gGameModel.hell_random_tower:read("room_info")

	nodetools.invoke(slot0.hell, {
		"playing",
		"notStart",
		"theme",
		"rule"
	}, "hide")
	slot0.hell:get("btn.passed"):hide()
	slot0.hell:get("btn.lock"):hide()

	if not dataEasy.isInServer("hellRandomTower") then
		slot0.hell:get("btn.lock"):show()
		slot0.hell:get("notStart"):text(gLanguageCsv.comingSoon)
	elseif not slot3 then
		slot0.hell:get("btn.lock"):show()
	elseif slot6.pass then
		slot0.hell:get("btn.passed"):show()
	elseif slot5 > 1 and slot4 == "start" then
		slot0.hell:get("playing"):show()
		text.addEffect(slot0.hell:get("playing.txt1"), {
			outline = {
				size = 6,
				color = cc.c4b(255, 84, 0, 255)
			}
		})
		text.addEffect(slot0.hell:get("playing.txt2"), {
			outline = {
				size = 6,
				color = cc.c4b(255, 84, 0, 255)
			}
		})
	end

	if slot4 ~= "start" or not slot7 then
		slot0.hell:get("notStart"):show()
		text.addEffect(slot0.hell:get("notStart"), {
			outline = {
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		})
	else
		slot8 = gGameModel.hell_random_tower:read("theme")
		slot9 = csv.hell_random_tower.theme[slot8]

		if slot8 > 1 and slot9 then
			slot0.hell:get("theme"):show():text(gLanguageCsv.onlineFightTheme .. slot9.name)
			slot0.hell:get("rule"):show()
			text.addEffect(slot0.hell:get("theme"), {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			})
			adapt.oneLineCenterPos(cc.p(slot0.hell:get("btn"):x(), slot0.hell:get("btn"):y() - 220), {
				slot0.hell:get("theme"),
				slot0.hell:get("rule")
			}, cc.p(20, 0))
			slot0.themeTip:get("box"):removeAllChildren()

			slot11 = slot9.desc

			if csvSize(slot9.validRarity) > 0 then
				slot12 = {}

				for slot16, slot17 in orderCsvPairs(slot9.validRarity) do
					table.insert(slot12, string.format("#I%s-0.6#", ui.RARITY_ICON[slot17]))
				end

				slot11 = string.format(slot11, table.concat(slot12))
			elseif slot9.actionPoint > 0 then
				slot11 = string.format(slot11, slot9.actionPoint)
			end

			slot13 = rich.createWithWidth(string.format("#L10##C0x5B545B#%s\n#F15# #F40#\n%s", slot9.name, slot11), 40, nil, slot10:width() - 80):anchorPoint(0, 1):addTo(slot10, 888)

			slot10:height(slot13:height() + 100)
			slot13:xy(40, slot10:height() - 40)
		end
	end

	slot8 = time.getNextdayStrInClock()
	slot10 = dataEasy.getCrossServiceData("crosshellrandomtower", nil, slot4 == "start" and -(time.getTime() - time.getNumTimestamp(gGameModel.hell_random_tower:read("date"), 5) + 86400) or 0)

	function ()
		uv0 = "normal"
		slot2 = "time"

		slot0.normal:removeChildByName(slot2)

		uv2 = "removeChildByName"
		slot0 = math.max(time.getNumTimestamp(slot2, time.getRefreshHour()) - time.getTime(), 0)
		slot5 = 0.5
		uv5 = "normal"
		slot5 = slot5.normal:get("btn")
		slot6 = slot5
		slot5 = slot5.x(slot6)
		uv6 = "normal"
		slot3 = rich.createByStr(string.format(gLanguageCsv.hellRandomTowerTip1, time.getCutDown(slot0).clock_str), 40):anchorPoint(slot5, 0.5):xy(slot5, slot6.normal:get("btn"):y() - 140)
		slot3 = slot3.addTo
		uv5 = "normal"

		slot3(slot3, slot5.normal, 10, "time")

		uv3 = "time"

		if slot3 then
			uv3 = "normal"
			slot3 = slot3.hell
			slot4 = slot3

			slot3.removeChildByName(slot4, "time")

			slot3 = nil
			uv4 = "math"

			if slot4 then
				uv5 = "math"
				uv5 = "max"

				if slot5 == "start" then
					slot3 = string.format(gLanguageCsv.hellRandomTowerTip2, (time.getCutDown(math.max(time.getNumTimestamp(csv.cross.service[slot5].endDate, 5) - time.getTime(), 0)).day > 0 and slot6.head_date_str or "") .. slot6.clock_str)
					slot1 = math.min(slot0, slot5)
				else
					slot3 = string.format(gLanguageCsv.hellRandomTowerTip3, (time.getCutDown(math.max(time.getNumTimestamp(slot4.date, 5) - time.getTime(), 0)).day > 0 and slot6.head_date_str or "") .. slot6.clock_str)
					slot1 = math.min(slot1, slot5)
				end
			else
				uv4 = "getNumTimestamp"

				if not slot4 then
					slot3 = string.format(gLanguageCsv.hellRandomTowerTip4, csv.unlock[gUnlockCsv.hellRandomTower].startLevel)
				end
			end

			if slot3 then
				slot6 = 0.5
				uv6 = "normal"
				slot6 = slot6.hell:get("btn")
				slot7 = slot6
				slot6 = slot6.x(slot7)
				uv7 = "normal"
				uv6 = "normal"

				rich.createByStr(slot3, 40):anchorPoint(slot6, 0.5):xy(slot6, slot7.hell:get("btn"):y() - 140):addTo(slot6.hell, 10, "time")
			end
		end

		return slot1
	end()
	slot0:schedule(function ()
		uv0 = "gGameApp"

		if slot0() <= 0 then
			gGameApp:requestServer("/game/random_tower/prepare", function (slot0)
				uv1 = "setPanel"

				slot1:setPanel()
			end)
		end
	end, 1, 1, 1)
end

function slot1.onThemeRuleClick(slot0)
	slot0.themeTip:show()
end

function slot1.onThemeTipClick(slot0)
	slot0.themeTip:hide()
end

function slot1.onNormalClick(slot0)
	gGameUI:stackUI("city.adventure.random_tower.normal")
end

function slot1.onStartGame(slot0)
	gGameUI:stackUI("city.adventure.random_tower.hell")
end

function slot1.onHellClick(slot0)
	if not dataEasy.isUnlock(gUnlockCsv.hellRandomTower) then
		gGameUI:showTip(dataEasy.getUnlockTip(gUnlockCsv.hellRandomTower))

		return
	end

	if gGameModel.hell_random_tower:read("round") == "start" and itertools.size(gGameModel.hell_random_tower:read("prepare_cards")) == 0 then
		gGameUI:stackUI("city.adventure.random_tower.hell_ready_embattle", nil, , {
			from = game.EMBATTLE_FROM_TABLE.hellRandomTowerReady,
			startGameCb = slot0:createHandler("onStartGame")
		})
	else
		slot0:onStartGame()
	end
end

return slot1
