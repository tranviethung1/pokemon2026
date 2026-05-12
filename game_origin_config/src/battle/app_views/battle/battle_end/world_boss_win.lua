slot0 = class("BattleEndWorldBossView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "battle_end_world_boss_win.json"
slot0.RESOURCE_BINDING = {
	["awardBg.awardText"] = "awardText",
	["bkg.exitText"] = "exitText",
	["awardBg.awardNewText"] = "awardNewText",
	awardsList = "awardsList",
	["awardBg.awardNewImg"] = "awardNewImg",
	cardItem = "awardsItem",
	awardBg = "awardBg",
	bkg = {
		binds = {
			event = "click",
			method = bindHelper.self("onPanelClick")
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	audio.playEffectWithWeekBGM("pve_win.mp3")

	slot3 = slot0:getResourceNode()

	widget.addAnimation(slot3, "level/newzhandoushengli.skel", "effect2", 100):anchorPoint(cc.p(0.5, 0.5)):xy(slot3:get("title"):getPosition()):addPlay("effect2_loop")
	slot0.exitText:text(gLanguageCsv.click2Exit)
	slot0.awardText:setString(slot2.damage)
	slot0.awardsList:setItemsMargin(25)
	slot0.awardsList:setScrollBarEnabled(false)

	if next(slot2.award) ~= nil then
		slot4 = {}

		for slot8, slot9 in pairs(slot2.award) do
			table.insert(slot4, {
				key = slot8,
				num = slot9
			})
		end

		slot0:showItem(1, slot4)
	end

	slot0.awardNewImg:setVisible(slot2.isNewRecordDamage)
	slot0.awardNewText:setVisible(slot2.isNewRecordDamage)

	if slot2.isNewRecordDamage then
		slot0.awardNewText:setString(gLanguageCsv.worldBossDamageMaxTip)
	end
end

function slot0.showItem(slot0, slot1, slot2)
	slot3 = slot0.awardsItem:clone()

	slot3:show()
	bind.extend(slot0, slot3, {
		class = "icon_key",
		props = {
			data = {
				key = slot2[slot1].key,
				num = slot2[slot1].num
			},
			isDouble = slot2[slot1].isDouble,
			specialKey = {
				maxLimit = true
			},
			onNode = function (slot0)
				slot1, slot2 = slot0:xy()

				slot0:xy(slot1, slot2 + 3)
				slot0:hide():z(2)
				transition.executeSequence(slot0, true):delay(0.5):func(function ()
					uv0 = "show"

					slot0:show()
				end):done()
			end
		}
	})
	slot0.awardsList:pushBackCustomItem(slot3)
	transition.executeSequence(slot0.awardsList, true):delay(0.25):func(function ()
		uv0 = "csvSize"
		uv2 = "showItem"

		if slot0 < csvSize(slot2) then
			uv0 = "csvSize"
			uv2 = "csvSize"
			uv3 = "showItem"

			slot0:showItem(slot2 + 1, slot3)
		end
	end):done()
end

function slot0.onPanelClick(slot0)
	gGameUI:switchUI("city.view")
end

return slot0
