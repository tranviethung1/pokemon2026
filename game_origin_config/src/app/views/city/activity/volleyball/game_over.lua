slot0 = {
	[0] = {
		animation = "standby_loop",
		bg = "city/pvp/reward/bg_pvp_lose.png",
		bg2 = "activity/volleyball/bg_sb.png",
		result = "effect_shibai_loop"
	},
	{
		animation = "win_loop",
		bg = "city/pvp/reward/bg_pvp_win.png",
		bg2 = "city/pvp/reward/bg_role.png",
		result = "effect_chenggong_loop"
	}
}
slot2 = class("VolleyballGameOver", cc.load("mvc").ViewBase)
slot2.RESOURCE_FILENAME = "volleyball_end.json"
slot2.RESOURCE_BINDING = {
	bg2 = "bg2",
	bg = "bg",
	img = "img",
	result = "result",
	btnBack = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBackClick")
			}
		}
	},
	btnAgain = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onAgainClick")
			}
		}
	},
	score = {
		varname = "score",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 8,
					color = cc.c4b(0, 0, 0, 30)
				},
				color = ui.COLORS.WHITE
			}
		}
	},
	["btnBack.back"] = {
		varname = "back",
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
	["btnAgain.again"] = {
		varname = "again",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(82, 76, 85, 255)
				}
			}
		}
	}
}

function slot2.onCreate(slot0, slot1, slot2)
	slot0.parent = slot1
	uv3 = "parent"
	slot3 = slot3[slot2.result]

	widget.addAnimationByKey(slot0.result, "volleyball_result/tiaozhan.skel", "resultEffect", slot3.result, 5):alignCenter(slot0.result:size()):scale(1)
	slot0.bg2:texture(slot3.bg2)
	slot0.bg:texture(slot3.bg)
	widget.addAnimationByKey(slot0.img, csv.unit[slot2.unitId].unitRes, nil, slot3.animation, 5):alignCenter(slot0.img:size()):scale(4)
	slot0.score:text(string.format("%d : %d", slot2.score[1], slot2.score[2]))
end

function slot2.onPanelClick(slot0)
	slot0.parent:onClose()
end

function slot2.onBackClick(slot0)
	slot0.parent:onClose()
end

function slot2.onAgainClick(slot0)
	slot1 = slot0.parent
	slot1 = slot1.resetGame

	slot1(slot1)

	uv1 = "parent"

	slot1.onClose(slot0)
end

return slot2
