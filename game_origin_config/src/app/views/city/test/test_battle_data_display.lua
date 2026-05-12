slot0 = class("TestBattleDataDisplay", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "test_battle_data_display.json"
slot0.RESOURCE_BINDING = {
	["leftPanel.item"] = "item",
	leftPanel = "leftPanel",
	rightPanel = "rightPanel",
	btnState = {
		varname = "btnState",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnStateClick")
			}
		}
	}
}

function slot0.onCreate(slot0)
	slot0.leftPanel:setSwallowTouches(true)
	slot0.rightPanel:setSwallowTouches(true)
	slot0:onBtnStateClick(true)
	slot0.item:hide()

	for slot4 = 1, 2 do
		slot5 = slot4 == 1 and slot0.leftPanel or slot0.rightPanel
		slot6 = slot5:get("title")

		slot5:get("list"):setScrollBarEnabled(false)
		slot5:setCascadeOpacityEnabled(true)
		slot5:opacity(200)
		text.addEffect(slot6:get("card"), {
			outline = {
				size = 2,
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		})
		text.addEffect(slot6:get("damage"), {
			outline = {
				size = 2,
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		})
		text.addEffect(slot6:get("recover"), {
			outline = {
				size = 2,
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		})
		text.addEffect(slot6:get("takeDamage"), {
			outline = {
				size = 2,
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		})
		text.addEffect(slot6:get("bigSkill"), {
			outline = {
				size = 2,
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		})
		text.addEffect(slot6:get("damageEx"), {
			outline = {
				size = 2,
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		})
		text.addEffect(slot6:get("groupShield"), {
			outline = {
				size = 2,
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		})
		slot6:get("bigSkill"):setFontSize(41)
		slot6:get("damageEx"):setFontSize(41)
	end

	slot0.obj = {}

	function slot1(slot0, slot1)
		slot2 = slot0:get(slot1):hide()

		text.addEffect(slot2:get("num"), {
			outline = {
				size = 2,
				color = ui.COLORS.OUTLINE.WHITE
			}
		})

		slot4 = slot2:get("percent")

		text.addEffect(slot4, {
			outline = {
				size = 2,
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		})

		uv4 = "get"

		bind.extend(slot4, slot2:get("progress"), {
			class = "loadingbar"
		})
		slot2:get("num"):getVirtualRenderer():setLineSpacing(-5)
	end

	for slot5 = 1, 12 do
		slot6 = slot0.item:clone():show()

		(slot5 <= 6 and slot0.leftPanel:get("list") or slot0.rightPanel:get("list")):pushBackCustomItem(slot6)
		slot1(slot6, "damage")
		slot1(slot6, "recover")
		slot1(slot6, "takeDamage")
		text.addEffect(slot6:get("bigSkill"), {
			outline = {
				size = 2,
				color = ui.COLORS.OUTLINE.WHITE
			}
		})
		slot6:get("bigSkill"):hide()
		text.addEffect(slot6:get("damageEx"), {
			outline = {
				size = 2,
				color = ui.COLORS.OUTLINE.WHITE
			}
		})

		slot0.obj[slot5] = {
			item = slot6
		}
	end

	slot0.datas = {
		{},
		{}
	}
end

function slot1(slot0)
	if not slot0 then
		return nil
	end

	return slot0.dbID or slot0.id
end

function slot0.setData(slot0, slot1, slot2, slot3, slot4)
	for slot8 = slot2, slot3 do
		if slot1[slot8] then
			uv10 = "datas"

			if not slot0.datas[slot4][slot10(slot1[slot8])] then
				slot0.datas[slot4] = {}

				break
			end
		end
	end

	for slot8 = slot2, slot3 do
		if slot1[slot8] then
			uv9 = "datas"
			slot0.datas[slot4][slot9] = clone(slot1[slot8])
			slot0.datas[slot4][slot9].seat = slot0.datas[slot4][slot9(slot1[slot8])] and slot0.datas[slot4][slot9].seat or slot1[slot8].seat
		end
	end

	if not slot0:visible() then
		return
	end

	slot5 = 0
	slot6 = 0
	slot7 = 0
	slot8 = 0

	for slot12, slot13 in pairs(slot0.datas[slot4]) do
		slot14 = 0
		slot15 = 0
		slot16 = 0

		if slot13.seat <= slot3 and slot13.totalDamage then
			for slot20, slot21 in pairs(slot13.totalDamage) do
				slot14 = slot14 + slot21:get(battle.ValueType.normal)
			end

			for slot20, slot21 in pairs(slot13.totalResumeHp) do
				slot15 = slot15 + slot21:get(battle.ValueType.normal)
			end

			for slot20, slot21 in pairs(slot13.totalTakeDamage) do
				slot16 = slot16 + slot21:get(battle.ValueType.normal)
			end

			slot18 = 0
			slot19 = 0

			for slot23, slot24 in pairs(slot13.totalDamage) do
				slot17 = 0 + slot24:get(battle.ValueType.valid)
			end

			for slot23, slot24 in pairs(slot13.totalResumeHp) do
				slot18 = slot18 + slot24:get(battle.ValueType.valid)
			end

			for slot23, slot24 in pairs(slot13.totalTakeDamage) do
				slot19 = slot19 + slot24:get(battle.ValueType.valid)
			end

			slot13.damage = slot14
			slot13.recover = slot15
			slot13.takeDamage = slot16
			slot13.damageValid = slot17
			slot13.recoverValid = slot18
			slot13.takeDamageValid = slot19
			slot13.bigSkill = slot13.bigSkillUseTimes or 0
			slot13.damageEx = slot13.totalDamageEx or 0
			slot5 = slot5 + slot13.damage
			slot6 = slot6 + slot13.recover
			slot7 = slot7 + slot13.takeDamage
			slot8 = slot8 + slot13.damageEx
		end
	end

	slot9 = {
		[slot16] = true
	}

	function slot10(slot0, slot1, slot2, slot3)
		slot5 = slot0:get(slot1):show():get("num")
		slot6 = slot5

		slot5.text(slot6, mathEasy.getShortNumber(slot2[slot1], 2))

		slot5 = 0
		uv6 = "get"

		if slot6.state == 1 then
			slot5 = slot3 == 0 and 0 or math.floor(slot2[slot1] * 100 / slot3)
		else
			uv6 = "get"

			if slot6.state == 2 then
				slot5 = slot2[slot1] == 0 and 100 or math.floor(100 * slot2[slot1 .. "Valid"] / slot2[slot1])
			end
		end

		slot4:get("progress"):percent(slot5)
		slot4:get("percent"):text(slot5 .. "%")
	end

	for slot14, slot15 in pairs(slot0.datas[slot4]) do
		slot16 = slot15.seat

		if slot15.seat <= slot3 then
			slot17 = slot0.obj[slot16].item

			slot17:get("bigSkill"):show()
			slot17:get("damageEx"):show()

			if slot17:get("_card_") then
				slot17:get("_card_"):show()
			end

			slot10(slot17, "damage", slot15, slot5)
			slot10(slot17, "recover", slot15, slot6)
			slot10(slot17, "takeDamage", slot15, slot7)
			slot17:get("bigSkill"):text(slot15.bigSkill .. "次")

			slot18 = slot17:get("damageEx")
			slot18 = slot18.text

			slot18(slot18, slot15.damageEx)

			uv18 = "datas"

			if slot0.obj[slot16].dbID ~= slot18(slot15) then
				slot0.obj[slot16].dbID = slot18
				slot19 = slot15.unitID

				bind.extend(slot0, slot17, {
					class = "card_icon",
					props = {
						unitId = slot19,
						advance = slot15.advance,
						star = slot15.star,
						rarity = csv.unit[slot19].rarity,
						onNode = function (slot0)
							slot1 = slot0.scale

							slot1(slot0, 0.3)

							uv1 = "scale"
							slot2 = slot1
							uv2 = "scale"

							slot0:xy((slot1.width(slot2) - slot0:box().width) / 2, slot2:height() - slot0:box().height)
						end
					}
				})
			end
		end
	end

	for slot14 = slot2, slot3 do
		if not slot9[slot14] then
			slot15 = slot0.obj[slot14].item

			slot15:get("damage"):hide()
			slot15:get("recover"):hide()
			slot15:get("takeDamage"):hide()
			slot15:get("bigSkill"):hide()
			slot15:get("damageEx"):hide()

			if slot15:get("_card_") then
				slot15:get("_card_"):hide()
			end
		end
	end
end

function slot0.setSpecialData(slot0, slot1)
	if not slot1 then
		return
	end

	slot1 = slot1.force

	for slot5 = 1, 2 do
		for slot9, slot10 in pairs(battle.SpecialObjectId) do
			if slot1[slot5][slot10] then
				slot0.datas[slot5][slot10] = clone(slot1[slot5][slot10])
			end
		end

		if not slot0:visible() then
			return
		end

		slot8 = slot0.datas[slot5][battle.SpecialObjectId.teamShiled]

		function (slot0, slot1, slot2, slot3)
			slot5 = slot0:get(slot1):show():get("num")
			slot6 = slot5

			slot5.text(slot6, mathEasy.getShortNumber(slot2[slot1], 2))

			slot5 = 0
			uv6 = "get"

			if slot6.state == 1 then
				slot5 = slot3 == 0 and 0 or math.floor(slot2[slot1] * 100 / slot3)
			end

			slot4:get("progress"):percent(slot5)
			slot4:get("percent"):text(slot5 .. "%")
			slot4:setVisible(slot2[slot1] > 0)
		end(slot5 == 1 and slot0.leftPanel or slot0.rightPanel, "groupShield", slot8, slot8.groupShieldMax)
	end
end

slot2 = {
	[1.0] = "队伍数值占比",
	[2.0] = "有效值比"
}

function slot0.onBtnStateClick(slot0, slot1)
	if slot1 == true then
		slot0.state = 1
		slot4 = "label"
		uv4 = "state"

		slot0.btnState:get(slot4):text(slot4[slot0.state])

		return
	end

	uv3 = "state"
	slot0.state = slot0.state % #slot3 + 1
	slot4 = "label"
	uv4 = "state"

	slot0.btnState:get(slot4):text(slot4[slot0.state])
	slot0:setData({}, 1, 6, 1)
	slot0:setData({}, 7, 12, 2)
	slot0:setSpecialData()
end

function slot0.refresh(slot0, slot1)
	if slot1 then
		slot0:setData(slot1, 1, 6, 1)
		slot0:setData(slot1, 7, 12, 2)
		slot0:setSpecialData(slot1)
	end
end

return slot0
