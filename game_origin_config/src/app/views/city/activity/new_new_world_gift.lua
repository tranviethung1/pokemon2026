slot1 = class("NewNewWorldGiftView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "new_new_world_gift.json"
slot1.RESOURCE_BINDING = {
	["panel.item1.txt1"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(245, 131, 29, 255)
				}
			}
		}
	},
	["panel.item2.txt1"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(245, 131, 29, 255)
				}
			}
		}
	},
	["panel.item3.txt1"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(245, 131, 29, 255)
				}
			}
		}
	},
	["panel.btnAward.desc"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 3,
					color = cc.c4b(255, 252, 237, 255)
				}
			}
		}
	},
	["panel.btnAward"] = {
		varname = "btnAward",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAwardClick")
			}
		}
	},
	["panel.btnUpdate.desc"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	["panel.btnUpdate"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onUpdateClick")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	gGameModel.currday_dispatch:getIdlerOrigin("newNewWorld2Click"):set(true)

	slot0.activityID = slot1
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")

	idlereasy.when(slot0.yyhuodongs, function (slot0, slot1)
		uv2 = "activityID"
		uv4 = "activityID"

		for slot8, slot9 in csvPairs(csv.yunying.generaltask) do
			if slot9.huodongID == csv.yunying.yyhuodong[slot4.activityID].huodongID then
				uv10 = "activityID"
				slot10.csvID = slot8
				slot10 = (slot1[slot2.activityID] or {}).stamps or {}
				uv12 = "activityID"
				slot12 = slot12.btnAward:get("bg")
				slot12 = slot12.texture

				slot12(slot12, slot10[slot8] == 1 and "activity/new_new_world/icon_hxyl_bx1.png" or "activity/new_new_world/icon_hxyl_bx2.png")

				uv12 = "activityID"
				slot12 = slot12.btnAward
				slot12 = slot12.setTouchEnabled

				slot12(slot12, slot10[slot8] == 1)

				uv12 = "activityID"

				slot12.btnAward:get("bg"):removeChildByName("effect")

				if slot10[slot8] == 1 then
					uv13 = "activityID"
					slot14 = "effect/jiedianjiangli.skel"
					uv14 = "activityID"
					slot14 = slot14.btnAward
					slot15 = slot14
					uv15 = "activityID"

					widget.addAnimation(slot13.btnAward:get("bg"), slot14, "effect_loop", -1):xy(slot14.width(slot15) / 2 - 30, slot15.btnAward:height() / 2 - 60):scale(0.8):name("effect")
				end

				uv13 = "activityID"
				uv14 = "activityID"

				uiEasy.addVibrateToNode(slot13, slot14.btnAward, slot10[slot8] == 1, "btnAwardAction")
			end
		end
	end)
end

function slot1.onAwardClick(slot0)
	gGameApp:requestServer("/game/yy/award/get", function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityID, slot0.csvID)
end

function slot1.onUpdateClick(slot0)
	cc.Application:getInstance():openURL(dataEasy.getPacketUrl())
end

return slot1
