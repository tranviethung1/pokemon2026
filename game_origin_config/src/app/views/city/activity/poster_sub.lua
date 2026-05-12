slot0 = cc.load("mvc").ViewBase
slot2 = class("ActivityPosterSubView", require("app.views.city.activity.poster"))
slot2.RESOURCE_FILENAME = "activity_poster_sub.json"
slot2.RESOURCE_BINDING = {
	["timeNode.activityTime"] = "activityTime",
	btnClose = {
		varname = "btnClose",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnSkip = {
		varname = "btnSkip",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("jumpToActivity")
			}
		}
	},
	btnRule = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRules")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1, slot2)
	slot2.cfg.clientParam.hideHour = true
	slot2.cfg.clientParam.countInfo = {
		posY = 440,
		outlineSize = 8,
		posX = 200,
		color = cc.c4b(203, 255, 251, 255),
		outline = cc.c4b(72, 124, 255, 255)
	}
	slot0.cb = slot2.cb
	slot0.yyID = slot1
	slot0.jumpTo = slot2.cfg.clientParam.jumpTo

	slot0:initEndTime(slot2, gLanguageCsv.activityEndTimeTo)
	Dialog.onCreate(slot0, {
		blackType = 1,
		blackOpacity = 204
	})
end

function slot2.onRules(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1500
	})
end

function slot2.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.activityRule)
		end),
		slot2.noteText(135101, 135199)
	}
end

return slot2
