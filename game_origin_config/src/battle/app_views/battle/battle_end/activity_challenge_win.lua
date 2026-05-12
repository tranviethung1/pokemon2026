slot0 = class("ActivityChallengeWin", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "battle_end_brave_challenge_win.json"
slot0.RESOURCE_BINDING = {
	awardsList = "awardsList",
	awardsItem = "awardsItem",
	bkg = {
		binds = {
			event = "click",
			method = bindHelper.self("onQuitClick")
		}
	},
	roundNums = {
		binds = {
			event = "extend",
			class = "text_atlas",
			props = {
				isEqualDist = false,
				align = "center",
				pathName = "frhd_num",
				data = bindHelper.self("roundNums")
			}
		}
	}
}

function slot0.playEndEffect(slot0)
	slot1 = slot0:getResourceNode()
	slot2 = CSprite.new("level/jiesuanshengli.skel")

	slot2:addTo(slot1, 100)
	slot2:setAnchorPoint(cc.p(0.5, 1))
	slot2:setPosition(slot1:get("title"):getPosition())
	slot2:visible(true)
	slot2:play("jiesuan_shenglizi")
	slot2:addPlay("jiesuan_shenglizi_loop")
	slot2:retain()

	slot3 = CSprite.new("level/jiesuanshengli.skel")

	slot3:addTo(slot1, 99)
	slot3:setAnchorPoint(cc.p(0.5, 1))
	slot3:setPosition(slot1:get("title"):getPosition())
	slot3:visible(true)
	slot3:play("jiesuan_shenglitu")
	slot3:addPlay("jiesuan_shenglitu_loop")
	slot3:retain()
end

function slot0.onCreate(slot0, slot1, slot2, slot3)
	audio.playEffectWithWeekBGM("gate_win.mp3")

	slot0.data = slot2
	slot0.results = slot3
	slot0.sceneID = slot1
	slot5 = slot0:getAward()
	slot6 = slot0:getFirstAward()
	slot7 = csv.scene_conf[slot1]

	if slot3.round then
		slot0:getResourceNode():get("round"):text(gLanguageCsv.round .. " :")

		slot0.roundNums = slot3.round
	else
		slot4:get("round"):visible(false)
	end

	slot0:playEndEffect()
	slot4:get("awardsText"):text(gLanguageCsv.getAwards .. " :")

	slot9 = {}

	for slot13, slot14 in pairs(slot5) do
		slot15 = slot6[slot13] ~= nil

		table.insert(slot9, battleEasy.ifElse(slot15, 1, table.length(slot9) + 1), {
			key = slot13,
			num = slot14,
			isFirst = slot15
		})
	end

	if next(slot9) then
		slot0:showItem(1, slot9)
	else
		slot10, slot11 = slot8:xy()

		slot8:xy(slot10 + 325, slot11)
		slot8:text(gLanguageCsv.passAwardsAlreadyToplimit)
		slot0.awardsList:hide()
	end
end

function slot0.showItem(slot0, slot1, slot2)
	function slot3(slot0, slot1)
		slot2 = slot0:size()
		slot3 = cc.Sprite:create(slot1):addTo(slot0, 999):anchorPoint(1, 1):xy(slot2.width, slot2.height)
	end

	slot4 = slot0.awardsItem:clone()

	slot4:show()
	bind.extend(slot0, slot4, {
		class = "icon_key",
		props = {
			data = {
				key = slot2[slot1].key,
				num = slot2[slot1].num
			},
			isDouble = dataEasy.isGateIdDoubleDrop(slot0.sceneID),
			specialKey = {
				maxLimit = true
			},
			onNode = function (slot0)
				slot1, slot2 = slot0:xy()

				slot0:xy(slot1, slot2 + 3)
				slot0:hide():z(2)

				slot3 = transition.executeSequence(slot0, true):delay(0.5):func(function ()
					uv0 = "show"

					slot0:show()
				end)
				slot4 = slot3
				slot3 = slot3.done

				slot3(slot4)

				uv3 = "xy"
				uv4 = "hide"

				if slot3[slot4].isFirst then
					uv3 = "z"

					slot3(slot0, "city/adventure/endless_tower/icon_st.png")
				end
			end
		}
	})
	slot0.awardsList:setItemsMargin(25)
	slot0.awardsList:pushBackCustomItem(slot4)
	slot0.awardsList:setScrollBarEnabled(false)
	transition.executeSequence(slot0.awardsList):delay(0.1):func(function ()
		uv0 = "table"
		uv2 = "length"

		if slot0 < table.length(slot2) then
			uv0 = "showItem"
			uv2 = "table"
			uv3 = "length"

			slot0:showItem(slot2 + 1, slot3)
		end
	end):done()
end

function slot0.getAward(slot0)
	slot1 = {}

	for slot8, slot9 in pairs(slot0.results.serverData.view) do
		-- Nothing
	end

	return {
		[slot8] = slot9 + (({})[slot8] or 0)
	}
end

function slot0.getFirstAward(slot0)
	return {}
end

function slot0.onQuitClick(slot0)
	gGameUI:switchUI("city.view")
end

return slot0
