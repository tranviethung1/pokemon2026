slot0 = 13
slot2 = class("VolleyballView", cc.load("mvc").ViewBase)

function slot3(slot0)
	return ({
		"Jan",
		"Feb",
		"Mar",
		"Apr",
		"May",
		"Jun",
		"Jul",
		"Aug",
		"Sept",
		"Oct",
		"Nov",
		"Dec"
	})[tonumber(slot0)]
end

slot2.RESOURCE_FILENAME = "volleyball_main.json"
slot2.RESOURCE_BINDING = {
	prepareBg = "prepareBg",
	ruleItem = "ruleItem",
	["rightPanel.btnStart"] = {
		varname = "btnStart",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPlayGameClick")
			}
		}
	},
	textTipTime = {
		varname = "textTipTime",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(82, 76, 85, 255)
				}
			}
		}
	},
	["leftPanel.btnAward"] = {
		binds = {
			{
				event = "touch",
				methods = {
					ended = bindHelper.self("onRewardClick")
				}
			},
			{
				event = "extend",
				class = "red_hint",
				props = {
					state = bindHelper.self("awardRedHint"),
					onNode = function (slot0)
						slot0:xy(150, 150)
					end
				}
			}
		}
	},
	["leftPanel.btnRank"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRankClick")
			}
		}
	},
	["leftPanel.btnRule"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRuleClick")
			}
		}
	},
	["leftPanel.btnAward.award"] = {
		varname = "award",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.NORMAL.WHITE
				},
				color = ui.COLORS.NORMAL.DEFAULT
			}
		}
	},
	["leftPanel.btnRank.rank"] = {
		varname = "rank",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.NORMAL.WHITE
				},
				color = ui.COLORS.NORMAL.DEFAULT
			}
		}
	},
	["leftPanel.btnRule.rule"] = {
		varname = "rule",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.NORMAL.WHITE
				},
				color = ui.COLORS.NORMAL.DEFAULT
			}
		}
	}
}

function slot2.onCreate(slot0, slot1, slot2)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "VOLLEYBALL GAME",
		title = gLanguageCsv.volleyballGame
	})
	slot0:enableSchedule()
	slot0.prepareBg:hide()
	slot0:initModel()

	slot0.activityId = slot1
	slot0.yyCfg = csv.yunying.yyhuodong[slot0.activityId]

	slot0:initGameTime()
	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "activityId"
		slot2 = slot1[slot2.activityId] or {}
		uv3 = "activityId"
		slot3.roleData = slot2.valsums and slot2.valsums[201] or 0
		slot3 = pairs

		for slot6, slot7 in slot3(slot2.stamps or {}) do
			if slot7 == 1 then
				uv8 = "activityId"

				slot8.awardRedHint:set(true)

				return
			end
		end

		uv3 = "activityId"

		slot3.awardRedHint:set(false)
	end)
end

function slot2.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.awardRedHint = idler.new(false)
	slot0.yyEndtime = gGameModel.role:read("yy_endtime")
end

function slot2.initGameTime(slot0)
	uv3 = "unSchedule"

	slot0:unSchedule(slot3)

	slot1 = 0

	if slot0.yyEndtime[slot0.activityId] then
		slot1 = slot0.yyEndtime[slot0.activityId] - time.getTime()
	end

	uv7 = "unSchedule"

	slot0:schedule(function ()
		uv0 = "textTipTime"
		uv0 = 1
		uv0 = "text"
		slot0 = (slot0 - 1).textTipTime
		slot0 = slot0.text
		uv6 = "textTipTime"

		slot0(slot0, string.format("%s%s", gLanguageCsv.volleyballOpenTime, time.getCutDown(slot6, true).str))

		uv0 = "textTipTime"

		if slot0 <= 0 then
			uv0 = "text"
			slot0 = slot0.textTipTime
			slot0 = slot0.text
			slot2 = gLanguageCsv.activityOver

			slot0(slot0, slot2)

			uv0 = "text"
			uv2 = "string"

			slot0:unSchedule(slot2)

			return false
		end
	end, 1, 0, slot7)
end

function slot2.onPlayGameClick(slot0)
	gGameUI:stackUI("city.activity.volleyball.game", nil, , slot0.activityId, slot0.roleData)
end

function slot2.onRewardClick(slot0)
	gGameUI:stackUI("city.activity.volleyball.reward", nil, {
		blackLayer = true
	}, slot0.activityId)
end

function slot2.onRankClick(slot0)
	gGameApp:requestServer("/game/yy/volleyball/rank", function (slot0)
		uv7 = "gGameUI"

		gGameUI:stackUI("city.activity.volleyball.rank", nil, , slot0.view, slot7.roleData)
	end, slot0.activityId)
end

function slot2.onRuleClick(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1500
	})
end

function slot2.getRuleContext(slot0, slot1)
	slot2 = adaptContext
	slot3 = {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.rules)
		end),
		slot2.noteText(124901, 124907)
	}

	for slot8, slot9 in pairs({
		"btn_t.png",
		"btn_xl.png",
		"btn_jn.png",
		"btn_jn_3.png",
		"btn_jn_m.png"
	}) do
		table.insert(slot3, slot2.clone(slot0.ruleItem, function (slot0)
			uv5 = "multiget"

			slot0:multiget("skill", "textDesc").skill:texture("activity/volleyball/" .. slot5)

			uv5 = "skill"

			rich.createWithWidth(gLanguageCsv["volleyballSkill" .. slot5], 40, nil, 1000, 0):anchorPoint(0, 0.5):addTo(slot0):y(slot0:height() / 2):x(350)
		end))
	end

	table.insert(slot3, slot2.noteText(124908, 125000))

	return slot3
end

return slot2
