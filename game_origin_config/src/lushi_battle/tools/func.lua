function AutoChessEasy.getRoleDataFromCards(slot0)
	slot1, slot2 = nil

	if lushi.EventBaseId < slot0 then
		slot1 = lushi.ObjectType.event
		slot2 = csv.auto_chess.event[slot0]
	elseif lushi.EquipBaseId < slot0 then
		slot1 = lushi.ObjectType.equip
		slot2 = csv.auto_chess.equip[slot0]
	else
		slot1 = lushi.ObjectType.normal
		slot2 = csv.auto_chess.cards[slot0]
	end

	if slot1 == lushi.ObjectType.normal then
		-- Nothing
	end

	for slot7, slot8 in pairs(AutoChessAttrs.AttrsTable) do
		if slot7 == "hpMax" then
			slot7 = "hp"
		end

		slot3[slot7] = slot2[slot7] or 0
	end

	return {
		star = 1,
		roleId = slot0,
		rarity = slot2.rarity,
		type = slot1,
		initBuffs = csvClone(slot2.buffid)
	}
end

function AutoChessEasy.getRoleDataFromMonsterFix(slot0, slot1)
	if not csv.auto_chess.monster_fix[slot0] then
		errorInWindows("no id:%s in auto_chess.monster_fix", slot0)
	end

	slot4, slot5 = nil

	if lushi.EquipBaseId < slot2.roleId then
		slot4 = lushi.ObjectType.equip
		slot5 = csv.auto_chess.equip[slot3]
	else
		slot4 = lushi.ObjectType.normal
		slot5 = csv.auto_chess.cards[slot3]
	end

	slot6 = nil

	if slot4 == lushi.ObjectType.normal then
		-- Nothing
	end

	for slot11, slot12 in pairs(AutoChessAttrs.AttrsTable) do
		if slot11 == "hpMax" then
			slot11 = "hp"
		end

		slot7[slot11] = string.format("(%s)+%s", slot5[slot11] or 0, slot2[slot11] or 0)
	end

	return {
		roleId = slot3,
		star = (not slot1 or slot2.starMin) and ymrand.random(slot2.starMin, slot2.starMax),
		rarity = slot5.rarity,
		type = slot4,
		initBuffs = arraytools.merge({
			csvClone(slot5.buffid),
			csvClone(slot2.exBuff)
		})
	}, csvClone(slot2.equip)
end

function AutoChessEasy.ifElse(slot0, slot1, slot2)
	if slot0 then
		return slot1
	end

	return slot2
end

function AutoChessEasy.valueTypeTable()
	for slot5, slot6 in pairs(lushi.ValueType) do
		({}).value[slot6] = 0
	end

	return {
		__valueTypeTable = true,
		value = table.salttable({}),
		__tostring = function ()
			if device.platform == "windows" then
				uv2 = "device"
				slot3 = slot2
				uv4 = "platform"
				uv3 = "device"
				slot4 = slot3
				uv5 = "platform"
				uv4 = "device"
				uv6 = "platform"

				return string.format("%s/%s/%s", slot2.get(slot3, slot4.normal), slot3.get(slot4, slot5.overFlow), slot4:get(slot6.valid))
			end
		end,
		get = function (slot0, slot1)
			if not slot1 then
				uv2 = "normal"
				slot1 = slot2.normal
			end

			return slot0.value[slot1]
		end,
		set = function (slot0, slot1, slot2)
			if not slot1 then
				uv3 = "normal"
				slot1 = slot3.normal
			end

			slot0.value[slot1] = math.floor(slot2)
		end,
		add = function (slot0, slot1, slot2)
			if type(slot1) == "table" then
				uv4 = "type"

				for slot6, slot7 in pairs(slot4) do
					slot0:set(slot7, slot0:get(slot7) + (slot1.__valueTypeTable and slot1:get(slot7) or slot1[slot7]))
				end
			else
				if not slot2 then
					uv3 = "type"
					slot2 = slot3.normal
				end

				slot0:set(slot2, slot0:get(slot2) + slot1)
			end
		end,
		addTable = function (slot0, slot1, ...)
			if type(slot1) ~= "table" or not slot1.__valueTypeTable then
				errorInWindows("valueTypeTable addTable type error, data is %s, need __valueTypeTable", slot1)
			end

			if table.length({
				...
			}) <= 0 or not slot2 then
				uv2 = "type"
			end

			for slot6, slot7 in pairs(slot2) do
				slot0:set(slot7, slot0:get(slot7) + slot1:get(slot7))
			end
		end
	}
end

function AutoChessEasy.createFakeObj(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot0) do
		slot8 = AutoChessEasy.getRoleDataFromCards(slot7)
		slot8.readyState = lushi.ObjectReadyState.find
		slot9 = slot1.play:createObjectModel(-1, slot8.type)

		slot1.allObjects:erase(slot9.id)
		slot9:init(slot8)
		table.insert(slot2, slot9)
	end

	return slot2
end

function AutoChessEasy.gainHandObj(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot0) do
		slot8 = AutoChessEasy.getRoleDataFromCards(slot7)
		slot8.readyState = lushi.ObjectReadyState.hand
		slot9 = slot1.play:createObjectModel(1, slot8.type)

		slot9:init(slot8)

		if slot1:setObjInHand(slot9) then
			slot1:afterGainCard(slot9)
		end

		table.insert(slot2, slot9)
	end

	return slot2
end

function slot0(slot0)
	slot0.buffImmuneCache = {
		immuneBuff = CMap.new(),
		immuneGroup = CMap.new()
	}

	for slot4, slot5 in slot0:iterBuffs() do
		if slot5.isInited and not slot5.isOver then
			slot0:onBuffImmuneChange(slot5)
		end
	end
end

function slot1(slot0, slot1, slot2)
	if not slot0.buffImmuneCache then
		slot0:newBuffImmune()
	end

	for slot9, slot10 in ipairs(slot1.csvCfg.immuneBuff) do
		if slot1.csvCfg.immuneType == 1 then
			function (slot0, slot1)
				if not slot0:find(slot1) then
					slot0:insert(slot1, {})

					slot2 = slot0:find(slot1)
				end

				uv4 = "find"
				slot4 = slot4.id
				uv4 = "find"
				slot4 = slot4.cfgId
				uv4 = "find"
				slot4 = slot4:group()
				uv4 = "find"
				slot4 = slot4.triggerPriority
				uv4 = "find"
				uv6 = "insert"
				slot2[slot4.id] = AutoChessEasy.ifElse(slot6, nil, {
					id = slot4,
					cfgId = slot4,
					group = slot4,
					triggerPriority = slot4
				})

				if not next(slot2) then
					slot0:erase(slot1)
				end
			end(slot0.buffImmuneCache.immuneBuff, slot10)
		elseif slot5 == 2 then
			slot3(slot0.buffImmuneCache.immuneGroup, slot10)
		end
	end
end

function slot2(slot0, slot1, slot2)
	if not slot0.buffImmuneCache then
		slot0:newBuffImmune()
	end

	slot3 = true
	slot4 = {}

	for slot8, slot9 in ipairs(slot2) do
		if slot0.buffImmuneCache.immuneGroup:find(slot9) and next(slot10) then
			for slot14, slot15 in pairs(slot10) do
				table.insert(slot4, slot15)

				slot3 = false
			end
		end
	end

	if slot0.buffImmuneCache.immuneBuff:find(slot1) and next(slot5) then
		for slot9, slot10 in pairs(slot5) do
			table.insert(slot4, slot10)

			slot3 = false
		end
	end

	if not slot3 then
		table.sort(slot4, function (slot0, slot1)
			if slot0.triggerPriority ~= slot1.triggerPriority then
				return slot0.triggerPriority < slot1.triggerPriority
			end

			return slot0.id < slot1.id
		end)

		slot6 = slot0.scene.allBuffs:find(slot4[1].id)

		slot6:triggerByMoment(lushi.BuffTriggerPoint.onBuffTrigger, {
			buffId = slot6.id
		})
	end

	return slot3
end

function AutoChessEasy.registImmune(slot0)
	uv1 = "newBuffImmune"
	slot0.newBuffImmune = slot1
	uv1 = "onBuffImmuneChange"
	slot0.onBuffImmuneChange = slot1
	uv1 = "buffImmuneEffect"
	slot0.buffImmuneEffect = slot1
end

function AutoChessEasy.randomCards(slot0, slot1, slot2, slot3, slot4)
	slot5 = {}
	slot6 = clone(slot1)
	slot7 = AutoChessEasy.ifElse(slot3 == 0, false, true)
	slot8 = AutoChessEasy.ifElse(slot4 == 0, false, true)
	slot9 = slot0.trainer[1]
	slot10 = slot9.cfg.style
	slot11 = slot9:getEventByKey(lushi.ExRecordEvent.trainerWeight)

	function slot12(slot0)
		slot1 = nil

		return (lushi.EventBaseId >= slot0 or csv.auto_chess.event[slot0]) and (lushi.EquipBaseId >= slot0 or csv.auto_chess.equip[slot0]) and csv.auto_chess.cards[slot0]
	end

	function slot13(slot0)
		for slot5 = 1, 2 do
			uv6 = "nature"
			slot1 = 0 + (slot6[slot0["nature" .. slot5]] or 0)
		end

		return slot1
	end

	function slot14(slot0, slot1)
		for slot6 = 1, 2 do
			uv7 = "nature"
			slot2 = 0 + (slot7[1][slot1["nature" .. slot6]] or 0)
		end

		uv3 = "nature"

		return slot2 + (slot3[2][slot0] or 0)
	end

	for slot18 = 1, slot2 or 1 do
		if table.length(slot6) == 0 then
			break
		end

		slot20 = {}

		for slot24, slot25 in ipairs(slot6) do
			slot26 = nil

			if slot8 then
				slot27 = slot12(slot25)
				slot28 = 0
				slot26 = slot13(slot27) + slot27.weight + slot14(slot25, slot27)
			else
				slot26 = 1
			end

			slot20[slot24] = (slot20[slot24 - 1] or 0) + slot26
		end

		slot25 = 1

		for slot25 = 1, slot19 do
			if ymrand.random(1, math.max(slot20[slot19], slot25)) <= slot20[slot25] then
				table.insert(slot5, slot6[slot25])

				if not slot7 then
					table.remove(slot6, slot25)
				end

				break
			end
		end
	end

	return slot5
end

function AutoChessEasy.getEncounterViewData(slot0, slot1, slot2)
	for slot7, slot8 in pairs(slot2) do
		-- Nothing
	end

	return {
		id = slot0.id,
		name = slot1.name,
		icon = slot1.icon,
		iconScale = slot1.iconScale,
		iconOffset = slot1.iconOffset,
		canDelete = slot1.close,
		canReturn = slot1.back,
		[slot7] = slot8
	}
end
