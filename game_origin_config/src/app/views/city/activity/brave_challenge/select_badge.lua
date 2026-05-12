slot0 = require("app.views.city.activity.brave_challenge.adapt")
slot1 = {
	normal = 1,
	rare = 2,
	forever = 3
}
slot3 = class("BraveChallengeSelectBadgeView", cc.load("mvc").ViewBase)
slot3.RESOURCE_FILENAME = "activity_brave_challenge_select_badge.json"
slot3.RESOURCE_BINDING = {
	forever = "forever",
	panel1 = "panel1",
	panel3 = "panel3",
	rare = "rare",
	panel2 = "panel2",
	normal = "normal",
	["rare.title"] = {
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						size = 4,
						color = cc.c4b(244, 144, 15, 255)
					}
				}
			}
		}
	},
	["rare.rarity"] = {
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						size = 4,
						color = cc.c4b(244, 144, 15, 255)
					}
				}
			}
		}
	},
	["forever.title"] = {
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						size = 4,
						color = cc.c4b(210, 68, 73, 255)
					}
				}
			}
		}
	},
	["forever.rarity"] = {
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						size = 4,
						color = cc.c4b(210, 68, 73, 255)
					}
				}
			}
		}
	},
	btnSure = {
		varname = "btnSure",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onSure")
			}
		}
	}
}

function slot3.onCreate(slot0, slot1)
	slot0.activityId = gGameModel.brave_challenge:read("yyID")
	slot0.selectNum = idler.new(0)
	slot0.badges = slot1 or {}
	slot0.selectBadge = {}
	slot0.panelCell = {
		slot0.normal,
		slot0.rare,
		slot0.forever
	}

	for slot5, slot6 in ipairs(slot0.badges) do
		table.insert(slot0.selectBadge, slot6[1])
	end

	slot2 = csv.brave_challenge.badge

	for slot6, slot7 in ipairs(slot0.selectBadge) do
		slot8 = slot0.panelCell[slot2[slot7].rarity]:clone():show()

		slot8:get("title"):text(slot2[slot7].name)
		adapt.setTextScaleWithWidth(slot8:get("title"), nil, slot8:get("bg"):width() - 30)
		beauty.textScroll({
			align = "center",
			isRich = true,
			list = slot8:get("desc"),
			strs = "#C0x5B545B#" .. slot2[slot7].desc,
			fontSize = ui.FONT_SIZE
		})
		slot8:get("desc"):setItemAlignCenter()
		slot8:get("icon"):texture(slot2[slot7].iconResPath)
		slot8:get("select"):visible(false)
		bind.touch(slot0, slot8, {
			methods = {
				ended = functools.partial(slot0.onBadgeClick, slot0, slot6)
			}
		})
		slot8:addTo(slot0["panel" .. slot6], 2, "item"):xy(slot0["panel" .. slot6]:width() / 2, slot0["panel" .. slot6]:height() / 2)
	end

	idlereasy.when(slot0.selectNum, function (slot0, slot1)
		for slot5 = 1, 3 do
			uv6 = "panel"

			slot6["panel" .. slot5]:get("item"):get("select"):visible(false)

			if checkLanguage("en") then
				uv6 = "panel"

				slot6["panel" .. slot5]:get("item.rarity"):scale(0.9)
			end
		end

		if slot1 ~= 0 then
			uv2 = "panel"

			slot2["panel" .. slot1]:get("item"):get("select"):visible(true)
		end

		uv2 = "panel"

		slot2.btnSure:setEnabled(slot1 ~= 0)
	end)
end

function slot3.onBadgeClick(slot0, slot1)
	slot0.selectNum:set(slot1)
end

function slot3.onSure(slot0)
	if slot0.selectNum:read() == 0 then
		gGameUI:showTip(gLanguageCsv.braveChallengeTip05)

		return
	end

	gGameUI:disableTouchDispatch(nil, false)

	slot1 = widget.addAnimationByKey(slot0["panel" .. slot0.selectNum:read()], "effect/xunzhangxuanze.skel", "select", "effect", 100):xy(slot0["panel" .. slot0.selectNum:read()]:width() / 2, slot0["panel" .. slot0.selectNum:read()]:height() / 2):scale(2)

	slot0:runAction(cc.Sequence:create(cc.DelayTime:create(0.3), cc.CallFunc:create(function ()
		slot2 = nil

		gGameUI:disableTouchDispatch(slot2, true)

		uv2 = "gGameUI"
		uv4 = "disableTouchDispatch"
		uv5 = "disableTouchDispatch"
		slot5 = slot5.selectNum:read()
		uv5 = "disableTouchDispatch"

		gGameApp:requestServer(slot2.url("choose"), function (slot0)
			uv1 = "onClose"

			slot1:onClose()
		end, slot4.selectBadge[slot5], slot5.activityId)
	end), nil))
end

return slot3
