slot0 = class("AutoChessEndAccountsView", cc.load("mvc").ViewBase)
slot1 = require("app.views.city.adventure.auto_chess.tools")
slot0.RESOURCE_FILENAME = "auto_chess_end_accounts.json"
slot0.RESOURCE_BINDING = {
	title = "title",
	losePanel = "losePanel",
	achievementTips = "achievementTips",
	victoryPanel = "victoryPanel",
	bg1 = "bg1",
	bg = {
		binds = {
			event = "touch",
			method = bindHelper.self("onClose")
		}
	},
	["achievementTips.num"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(201, 140, 60, 255)
				}
			}
		}
	},
	["achievementTips.txtTips"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(224, 106, 85, 255)
				}
			}
		}
	},
	["achievementTips.txtTitle"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(224, 106, 85, 255)
				}
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	uv2 = "getBattleResult"
	slot3 = slot2.getBattleResult(slot1) == "win" and "effect" or "effect_shibai"

	slot0.bg1:texture("city/adventure/auto_chess/img_zzq_" .. slot2 .. ".png")

	slot4 = widget.addAnimation(slot0:getResourceNode(), "lushi/result_effect.skel", slot3, 100):anchorPoint(cc.p(0.5, 0.5)):xy(slot0.title:getPosition()):addPlay(slot3 .. "_loop")

	slot0.victoryPanel:visible(slot2 == "win")
	slot0.losePanel:visible(slot2 ~= "win")

	if slot2 == "win" then
		slot6 = (slot2 == "win" and slot0.victoryPanel or slot0.losePanel):multiget("txt1", "txt1Num", "txt3", "txt3Num", "txt4", "subTxt1", "subTxtNum1", "subTxt2", "subTxtNum2", "subTxt3", "subTxtNum3", "subTxt4", "subTxtNum4", "subTxt5", "subTxtNum5", "awardsList", "awardEmptyTips")

		slot6.txt1Num:text(slot1.exp)
		slot6.txt3Num:text(slot1.pvp_win_point + slot1.pvp_damage_point + slot1.pve_hp_point + slot1.pve_coin_point + slot1.special_point)
		slot6.subTxtNum1:text(slot1.pvp_win_point)
		slot6.subTxtNum2:text(slot1.pvp_damage_point)
		slot6.subTxtNum3:text(slot1.pve_hp_point)
		slot6.subTxtNum4:text(slot1.pve_coin_point)
		slot6.subTxtNum5:text(slot1.special_point)
		adapt.setTextScaleWithWidth(slot6.txt1, nil, 550)
		adapt.setTextScaleWithWidth(slot6.txt3, nil, 550)
		adapt.setTextScaleWithWidth(slot6.subTxt1, nil, 550)
		adapt.setTextScaleWithWidth(slot6.subTxt2, nil, 550)
		adapt.setTextScaleWithWidth(slot6.subTxt3, nil, 550)
		adapt.setTextScaleWithWidth(slot6.subTxt4, nil, 550)
		adapt.setTextScaleWithWidth(slot6.subTxt5, nil, 550)
		slot6.awardEmptyTips:visible(itertools.isempty(slot1.awards))
		uiEasy.createItemsToList(slot0, slot6.awardsList, slot1.awards or {}, {
			margin = 20,
			scale = 0.9,
			onAfterBuild = function ()
				uv0 = "awardsList"

				slot0.awardsList:setItemAlignCenter()
			end
		})
	else
		slot6 = slot5:multiget("txt1", "txt1Num", "txt4", "awardsList", "awardEmptyTips")

		slot6.txt1Num:text(slot1.exp)
		adapt.setTextScaleWithWidth(slot6.txt1, nil, 550)
		slot6.awardEmptyTips:visible(itertools.isempty(slot1.awards))
		uiEasy.createItemsToList(slot0, slot6.awardsList, slot1.awards or {}, {
			margin = 20,
			scale = 0.9,
			onAfterBuild = function ()
				uv0 = "awardsList"

				slot0.awardsList:setItemAlignCenter()
			end
		})
	end

	uv6 = "getBattleResult"

	slot6.showAchievementTips(slot0.achievementTips)
end

function slot0.onClose(slot0)
	gGameUI:switchUI("city.view")
end

return slot0
