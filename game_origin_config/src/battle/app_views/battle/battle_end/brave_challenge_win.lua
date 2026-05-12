slot0 = class("BraveChallengeWinView", cc.load("mvc").ViewBase)
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
	slot4 = slot0:getResourceNode()
	slot5 = slot2.preData or {}
	slot6 = slot5.roleInfo or {}
	slot6 = slot5.cardsInfo or {}
	slot7 = slot3.serverData.view.award or {}
	slot9 = csv.brave_challenge.floor[slot0.data.floorID].firstAward
	slot10 = slot3.serverData.view.first_pass
	slot11 = {
		[slot15] = slot16
	}

	for slot15, slot16 in pairs(slot3.serverData.view.drop or {}) do
		-- Nothing
	end

	for slot15, slot16 in pairs(slot7) do
		if not slot11[slot15] then
			slot11[slot15] = slot16
		else
			slot11[slot15] = slot11[slot15] + slot16
		end
	end

	slot12 = csv.scene_conf[slot1]

	if slot3.round then
		slot4:get("round"):text(gLanguageCsv.round .. " :")

		slot0.roundNums = slot3.round
	else
		slot4:get("round"):visible(false)
	end

	slot0:playEndEffect()
	slot4:get("awardsText"):text(gLanguageCsv.getAwards .. " :")

	slot14 = {}

	for slot18, slot19 in pairs(slot11) do
		table.insert(slot14, battleEasy.ifElse(slot10, 1, table.length(slot14) + 1), {
			key = slot18,
			num = slot19,
			isFirst = slot10
		})
	end

	if next(slot14) then
		slot0:showItem(1, slot14)
	else
		if matchLanguage({
			"kr"
		}) then
			slot13:x(slot13:x() + 740)
		else
			slot13:x(slot13:x() + 325)
		end

		slot13:text(gLanguageCsv.passAwardsAlreadyToplimit)
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

function slot0.onQuitClick(slot0)
	gGameUI:switchUI("city.view")
end

return slot0
