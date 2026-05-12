slot0 = class("BattleEndJFView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "battle_end_jf.json"
slot0.RESOURCE_BINDING = {
	["imgRankBg.imgUp"] = "upIcon",
	["imgRankBg.bg"] = "rankBg",
	["imgRankBg.rank"] = "myNum",
	["imgRankBg.rankUp"] = "changeNum",
	["imgRankBg.tip"] = "numTipType",
	playBackPanel = "playBackPanel",
	imgRankBg = "imgRankRoot",
	exitPanel = "exitPanel",
	["playBackPanel.playBackBg"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onPlayBackClick")
			}
		}
	},
	["playBackPanel.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	["exitPanel.exitBg"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onQuitClick")
			}
		}
	},
	["exitPanel.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	imgBg = {
		varname = "imgBg",
		binds = {
			event = "click",
			method = bindHelper.self("onQuitClick")
		}
	}
}

function slot0.playEffect(slot0)
	slot2 = slot0:getResourceNode()
	slot3, slot4 = slot2:get("title"):xy()

	widget.addAnimation(slot2, "level/zhandoujiangli.skel", slot0.isFail and "zhandoushibai" or "zhandoushengli", 100):anchorPoint(cc.p(0.5, 1)):xy(slot3, slot4):addPlay(slot1 and "zhandoushibai_loop" or "zhandoushengli_loop")
end

function slot0.onCreate(slot0, slot1, slot2, slot3, slot4)
	slot0.cb = slot4
	slot0.data = slot2
	slot0.results = slot3
	slot0.isFail = slot0.results.result ~= "win"

	if slot0.isFail then
		slot0.imgBg:texture("city/pvp/reward/bg_pvp_lose.png")
		slot0.rankBg:texture("battle/online_fight/img_lose_bg.png")
		text.addEffect(slot0.numTipType, {
			italic = {},
			outline = {
				color = cc.c4b(97, 117, 156, 255)
			}
		})
	else
		slot0.imgBg:texture("city/pvp/reward/bg_pvp_win.png")
		slot0.rankBg:texture("battle/online_fight/img_win_bg.png")
		text.addEffect(slot0.numTipType, {
			italic = {},
			outline = {
				color = cc.c4b(235, 99, 54, 255)
			}
		})
	end

	if slot0.results.fromRecord then
		slot0.imgRankRoot:visible(false)
		slot0.playBackPanel:y(slot0.playBackPanel:y() + 70)
		slot0.exitPanel:y(slot0.exitPanel:y() + 70)
	else
		slot0.changeNum:visible(true)
		slot0.upIcon:visible(true)

		if slot3.serverData.view.rank_move >= 0 then
			slot0.upIcon:texture("common/icon/logo_arrow_green.png")
		else
			slot0.upIcon:texture("common/icon/logo_arrow_red.png")
		end

		slot0.myNum:text(slot5.rank)
		slot0.changeNum:text(math.abs(slot5.rank_move))
	end

	slot0:playEffect()

	if slot3.from == "ban_embattle" then
		ccui.ImageView:create("battle/scene/bg_dzjjc.png"):scale(2):xy(display.sizeInView.width / 2, display.sizeInView.height / 2):addTo(slot0:getResourceNode(), 0)
	end
end

function slot0.onPlayBackClick(slot0)
	if slot0.results.from == "ban_embattle" then
		gGameUI:showTip(gLanguageCsv.noPlayBack)

		return
	end

	slot1 = slot0.data

	if not slot0.data.play_record_id or not slot0.data.cross_key then
		slot2 = nil
		slot2 = (slot0.results.serverData.view.pattern ~= 1 or table.deepcopy(gGameModel.cross_online_fight:read("unlimited_history"), true)) and table.deepcopy(gGameModel.cross_online_fight:read("limited_history"), true)

		table.sort(slot2, function (slot0, slot1)
			return slot1.time < slot0.time
		end)

		slot1 = slot2[1]
	end

	gGameModel:playRecordBattle(slot1.play_record_id, slot1.cross_key, "/game/cross/online/playrecord/get", 0)
end

function slot0.onQuitClick(slot0)
	if slot0.cb then
		slot0:addCallbackOnExit(slot0.cb)
		slot0:onClose()
	else
		gGameUI:switchUI("city.view")
	end
end

return slot0
