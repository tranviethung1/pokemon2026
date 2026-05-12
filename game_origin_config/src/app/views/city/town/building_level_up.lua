slot0 = game.TOWN_BUILDING_ID
slot1 = class("TownBuildingLevelUpView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "town_building_level_up.json"
slot1.RESOURCE_BINDING = {
	umlockTip = "umlockTip",
	textName = "textName",
	spine = "spine",
	textLv = {
		varname = "textLv",
		binds = {
			event = "effect",
			data = {
				shadow = {
					size = 8,
					color = cc.c3b(155, 77, 33),
					offset = cc.size(0, -8)
				},
				outline = {
					size = 4,
					color = cc.c4b(255, 198, 53, 255)
				}
			}
		}
	}
}
slot1.RESOURCE_STYLES = {
	blackLayer = true,
	clickClose = true
}

function slot1.onCreate(slot0, slot1)
	slot2 = gGameModel.town:read("buildings")[slot1].level

	slot0.textLv:text(slot2)
	userDefault.setForeverLocalKey("townBuildingLevel", {
		[slot1] = slot2
	})
	slot0.textName:text(gTownBuildingCsv[slot1] and gTownBuildingCsv[slot1][1].name or "")
	widget.addAnimationByKey(slot0.spine, "town/shengjichenggong.skel", "spine", "effect_loop", 10):anchorPoint(cc.p(0.5, 0.5)):xy(slot0.spine:width() / 2, slot0.spine:height() - 200):scale(2)

	slot3 = 0.75
	slot4, slot5 = slot0.textLv:xy()
	slot8 = slot0.textLv
	slot8 = slot8.runAction

	slot8(slot8, cc.RepeatForever:create(cc.Sequence:create(cc.MoveTo:create(slot3, cc.p(slot4, slot5 + 20)), cc.MoveTo:create(slot3, cc.p(slot4, slot5)))))

	uv8 = "gGameModel"

	if slot1 == slot8.CENTER then
		slot0.umlockTip:visible(townDataEasy.nextLevelUnlockBuilding(slot2 - 1) ~= "")
		slot0.umlockTip:text(gLanguageCsv.townCenterUnlockBuilding .. slot8)
	else
		uv8 = "gGameModel"

		if slot1 == slot8.HOME then
			slot0.umlockTip:text(townDataEasy.getHomeUnlockTipInfo(slot2))
		else
			slot0.umlockTip:hide()
		end
	end
end

return slot1
