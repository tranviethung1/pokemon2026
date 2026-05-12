slot0 = class("BattleEndMimicryView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "battle_end_mimicry_win.json"
slot0.RESOURCE_BINDING = {
	scoreNum = "scoreNum",
	["bkg.exitText"] = "exitText",
	pjNum = "pjNum",
	cardItem = "awardsItem",
	awardsList = "awardsList",
	newBuffText = "newBuffText",
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

	slot4 = slot2.serverData.view
	slot5 = slot4.boss_scores
	slot6 = slot4.buff_scores
	slot7 = slot4.new_buff

	slot0.exitText:text(gLanguageCsv.click2Exit)

	slot9 = rich.createByStr(string.format(gLanguageCsv.mimicryEndScore, slot5 + slot6, slot5, slot6), 50):anchorPoint(0, 0.5):xy(slot0.scoreNum:x(), slot0.scoreNum:y()):addTo(slot0.scoreNum:parent()):z(10)

	slot0.pjNum:setString(slot2.finalDamage)
	slot0.awardsList:setItemsMargin(25)
	slot0.awardsList:setScrollBarEnabled(false)

	if next(slot4.drop) ~= nil then
		slot10 = {}

		for slot14, slot15 in pairs(slot4.drop) do
			table.insert(slot10, {
				key = slot14,
				num = slot15
			})
		end

		slot0:showItem(1, slot10)
	end

	if slot7 then
		slot0.newBuffText:setString(gLanguageCsv.mimicryEndNewBuff)
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
