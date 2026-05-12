slot1 = class("ArmView", cc.load("mvc").ViewBase)
slot2 = require("app.views.city.develop.arm.tools")
slot1.RESOURCE_FILENAME = "arm.json"
slot1.RESOURCE_BINDING = {
	naturePanel = "naturePanel",
	["naturePanel.item"] = "item",
	["naturePanel.natureSubList"] = "subList",
	["naturePanel.natureList"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 6,
				asyncPreload = 18,
				padding = 20,
				data = bindHelper.self("data"),
				item = bindHelper.self("subList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot5 = slot1
					slot4 = slot1.multiget(slot5, "aniNode", "stage")
					uv5 = "multiget"
					slot7 = widget.addAnimation(slot4.aniNode, slot3.cfg.spine, string.format(slot5.getFirstSkillStage(slot3.cfg.id) <= slot3.stage and "effect2_%s_loop" or "effect_%s_loop", slot3.cfg.natureType), 1):scale(0.9):xy(slot1:size().width / 2, -10)

					slot4.stage:get("textStage"):text(gLanguageCsv["symbolRome" .. slot3.stage])
					slot4.stage:visible(slot0.isShowStage():read() and slot3.stage > 0)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot1, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick"),
				isShowStage = bindHelper.self("isShowStage")
			}
		}
	},
	btnRule = {
		varname = "btnRule",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onRuleClick")
			}
		}
	},
	btnOverView = {
		varname = "btnOverView",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onOverViewClick")
			}
		}
	},
	["btnOverView.name"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.DEFAULT
				},
				glow = {
					color = ui.COLORS.OUTLINE.DEFAULT
				}
			}
		}
	}
}

function slot1.onCreate(slot0)
	gGameUI.topuiManager:createView("default", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "ARM",
		title = gLanguageCsv.arm
	})
	gGameModel.forever_dispatch:getIdlerOrigin("armClick"):set(true)
	slot0:initModel()

	slot0.isShowStage = idler.new(true)

	slot0.btnOverView:hide()

	slot0.data = idlers.new()

	idlereasy.any({
		slot0.armMarkIDs,
		slot0.armStage,
		slot0.isShowStage
	}, function ()
		uv0 = "updateData"

		slot0:updateData()
	end)
end

function slot1.initModel(slot0)
	slot0.armMarkIDs = gGameModel.role:getIdler("arms")
	slot0.armStage = gGameModel.role:getIdler("arms_stage")
end

function slot1.updateData(slot0)
	slot1 = {}
	slot2 = slot0.armStage:read()

	for slot6, slot7 in orderCsvPairs(csv.arms.arms) do
		table.insert(slot1, {
			cfg = slot7,
			stage = slot2 and slot2[slot6] or 0
		})
	end

	slot0.data:update(slot1)
end

function slot1.onRuleClick(slot0)
	gGameUI:stackUI("common.rule", nil, , slot0:createHandler("getRuleContext"), {
		width = 1350
	})
end

function slot1.getRuleContext(slot0, slot1)
	slot2 = adaptContext

	return {
		slot2.clone(slot1.title, function (slot0)
			slot0:get("text"):text(gLanguageCsv.armRules)
		end),
		slot2.noteText(135001, 135100)
	}
end

function slot1.onItemClick(slot0, slot1, slot2, slot3)
	gGameUI:stackUI("city.develop.arm.detail", nil, {
		full = true
	}, slot3)
end

function slot1.onOverViewClick(slot0)
	slot0.isShowStage:set(not slot0.isShowStage:read())
end

return slot1
