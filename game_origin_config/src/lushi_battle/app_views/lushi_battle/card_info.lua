slot1 = class("CardInfo", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "auto_chess_battle_info.json"
slot1.RESOURCE_BINDING = {
	card = "card",
	bg = "bg"
}
slot2 = {
	{
		80
	},
	{
		53,
		107
	},
	{
		40,
		80,
		120
	}
}
slot3 = 1280
slot4 = {
	nameText = -50,
	attr2 = -50,
	baseDesc = -95,
	attr1 = -50,
	buffDesc = -430
}

function slot1.onCreate(slot0, slot1)
	slot0.parent = slot1
	slot0.spr = nil

	slot0:hide()
	slot0.bg:addTouchEventListener(function (slot0, slot1)
		if slot1 == ccui.TouchEventType.ended or slot1 == ccui.TouchEventType.canceled then
			uv2 = "ccui"

			if slot2.spr then
				uv2 = "ccui"

				if slot2.spr.isDrawOut then
					uv2 = "ccui"

					if slot2.spr:isDrawOut() then
						uv5 = "ccui"

						gRootViewProxy:proxy():onHandCardDrawOut(true, slot5.spr)
					end
				end
			end

			uv2 = "ccui"

			slot2:onHideCardInfo()
		end
	end)
end

function slot1.onShowCardInfo(slot0, slot1, slot2)
	slot0.spr = slot2

	if slot2 then
		slot2.holdingHaloVisible:set(true, "info")
		slot2:onHoldingHalo()
	end

	bind.extend(slot0, slot0.card, {
		class = "auto_chess_card2",
		props = {
			showKeyWords = true,
			id = slot1.unitID,
			star = slot1.star,
			onNode = function (slot0)
				slot0:z(5)
			end
		}
	})
	slot0:setAttrs(slot1)
	slot0:setKeyWords(slot1)
	slot0:setAttrBuffData(slot1)
	slot0:setBattleDesc(slot1)
	slot0:show()
end

function slot1.onHideCardInfo(slot0)
	if slot0.spr and slot0.spr.onHoldingHalo then
		slot0.spr.holdingHaloVisible:set(nil, "info", true)
		slot0.spr:onHoldingHalo()
	end

	slot0.spr = nil

	slot0:hide()
end

function slot1.setAttrs(slot0, slot1)
	if slot1.type ~= lushi.ObjectType.normal then
		return
	end

	slot0.card:setData({
		attack = slot1:attack(),
		hp = slot1:hp(),
		defence = slot1:shieldHp(),
		broken = slot1:brokenHp()
	})
end

function slot1.setKeyWords(slot0, slot1)
	if slot1.type ~= lushi.ObjectType.normal then
		return
	end

	slot2 = {}
	slot3 = {}

	function (slot0)
		if not slot0.unitCfg then
			return
		end

		for slot4, slot5 in csvPairs(slot0.unitCfg.keyWords) do
			uv6 = "unitCfg"

			if not slot6[slot5] then
				slot6 = table.insert
				uv7 = "csvPairs"

				slot6(slot7, slot5)

				uv6 = "unitCfg"
				slot6[slot5] = true
			end
		end
	end(slot1)

	for slot8, slot9 in ipairs(slot1.equipMents) do
		slot4(slot9)
	end

	for slot8, slot9 in slot1:iterBuffs() do
		-- Nothing
	end

	slot0.card:setKeyWords(slot3)
end

function slot1.setAttrBuffData(slot0, slot1)
	if slot1.type ~= lushi.ObjectType.normal then
		return
	end

	slot2 = {}

	for slot7, slot8 in ipairs(slot1:getEquipmentViewData()) do
		slot9 = ""

		if csv.auto_chess.equip[slot8.equipUnitID] and slot10.cardEffect ~= "" then
			slot9 = uiEasy.autoChessDesc(slot10.cardEffect, slot10.keyWords, {
				noOutLine = true,
				defaultColor = "#C0x5B545B#"
			}) .. "\n"
		end

		for slot14, slot15 in pairs(AutoChessAttrs.AttrsTable) do
			if slot8.attrs[slot14] and slot16 > 0 then
				slot9 = slot9 .. lushi.AttrToName[slot14] .. " +" .. slot16 .. " "
			end
		end

		table.insert(slot2, {
			isEquip = true,
			title = slot8.name,
			desc = slot9
		})
	end

	slot4, slot5 = slot1:getCardInfoBuffData()

	for slot9, slot10 in pairs(slot5) do
		table.insert(slot2, {
			title = "",
			desc = lushi.AttrToName[slot9] .. " +" .. slot10 .. " "
		})
	end

	for slot9, slot10 in pairs(slot4) do
		slot11 = ""

		for slot15, slot16 in pairs(AutoChessAttrs.AttrsTable) do
			if slot10[slot15] then
				slot18 = nil

				if slot17 > 0 then
					slot18 = " +"
				elseif slot17 < 0 then
					slot18 = " "
				end

				if slot18 then
					slot11 = slot11 .. lushi.AttrToName[slot15] .. slot18 .. slot17 .. " "
				end
			end
		end

		if slot11 ~= "" then
			table.insert(slot2, {
				title = slot9,
				desc = slot11
			})
		end
	end

	slot0.card:setBuffs(slot2)
end

function slot1.setBattleDesc(slot0, slot1)
	slot6, slot3, slot4 = slot0.parent:getSceneRaw():getCardInfoEnv(slot1.id)

	rawset(slot6, "star", slot1.star or 0)
	slot0.card:setBattleDesc(uiEasy.autoChessDesc(slot3, slot4, {
		fromBattle = true,
		env = slot2
	}))
end

return slot1
