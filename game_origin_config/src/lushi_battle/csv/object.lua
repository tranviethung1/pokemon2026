slot0 = {
	getBuffOverlayCount = 0
}
slot1 = AutoChessCsv.newCsvCls("CsvObject")
slot1.ignoreModelCheck = {
	getBuff = true,
	selectCsvTarget = true
}
AutoChessCsv.CsvObject = slot1

function slot2(slot0)
	if slot0.type == lushi.ObjectType.event then
		errorInWindows("CsvObject use wrong from event")

		return true
	end

	return false
end

function slot3(slot0)
	if slot0.type == lushi.ObjectType.equip then
		errorInWindows("CsvObject use wrong from equip")

		return true
	end

	return false
end

function slot4(slot0)
	if slot0.type == lushi.ObjectType.normal then
		errorInWindows("CsvObject use wrong from normal")

		return true
	end

	return false
end

function slot1.id(slot0)
	return slot0.model.id
end

function slot1.seat(slot0)
	return slot0.model.seat
end

function slot1.hasNature(slot0, slot1)
	uv2 = "model"

	if not slot2(slot0.model) then
		uv2 = "hasNature"

		if slot2(slot0.model) then
			return
		end
	end

	return slot0.model:hasNature(slot1)
end

function slot1.shield(slot0)
	uv1 = "model"

	if slot1(slot0.model) then
		return
	end

	return slot0.model:shieldHp()
end

function slot1.broken(slot0)
	uv1 = "model"

	if slot1(slot0.model) then
		return
	end

	return slot0.model:brokenHp()
end

function slot1.hp(slot0)
	uv1 = "model"

	if slot1(slot0.model) then
		return
	end

	return slot0.model:hp()
end

function slot1.star(slot0)
	return slot0.model:getStar()
end

function slot1.inField(slot0)
	return slot0.model:isInEmbattle()
end

function slot1.inHand(slot0)
	return slot0.model:isInHand()
end

function slot1.unitID(slot0)
	return slot0.model.unitID
end

function slot1.team(slot0)
	return slot0.model.team
end

function slot1.price(slot0)
	return slot0.model:price()
end

function slot1.rarity(slot0)
	return slot0.model.rarity
end

function slot1.type(slot0)
	return slot0.model.type
end

function slot1.eventType(slot0)
	uv1 = "model"

	if not slot1(slot0.model) then
		uv1 = "eventType"

		if slot1(slot0.model) then
			return
		end
	end

	return slot0.model.eventType
end

function slot1.selectCsvTarget(slot0)
	uv1 = "model"

	if not slot1(slot0.model) then
		uv1 = "getCurTarget"

		if slot1(slot0.model) then
			return
		end
	end

	if slot0.model and slot0.model:getCurTarget() then
		return AutoChessCsv.CsvObject.new(slot1)
	end

	return AutoChessCsv.NilObject
end

function slot1.getBuff(slot0, slot1)
	uv2 = "model"

	if not slot2(slot0.model) then
		uv2 = "getBuff"

		if slot2(slot0.model) then
			return
		end
	end

	if slot0.model then
		if slot0.model:getBuff(slot1) == nil then
			return AutoChessCsv.NilBuff
		end

		if slot2:getCsvObject() == nil then
			AutoChessCsv.CsvBuff.new(slot2)
			assert(slot2:getCsvObject(), "buff csv object was nil")
		end

		return slot2:getCsvObject()
	end

	return AutoChessCsv.NilBuff
end

function slot1.hasBuff(slot0, ...)
	uv1 = "model"

	if not slot1(slot0.model) then
		uv1 = "ipairs"

		if slot1(slot0.model) then
			return
		end
	end

	for slot4, slot5 in ipairs({
		...
	}) do
		if slot0.model:hasBuff(slot5) then
			return true
		end
	end

	return false
end

function slot1.hasBuffGroup(slot0, ...)
	uv1 = "model"

	if not slot1(slot0.model) then
		uv1 = "ipairs"

		if slot1(slot0.model) then
			return
		end
	end

	for slot4, slot5 in ipairs({
		...
	}) do
		if slot0.model:hasBuffGroup(slot5) then
			return true
		end
	end

	return false
end

function slot1.isTrainer(slot0)
	return slot0.model.isTrainer and true or false
end

for slot8, slot9 in pairs(AutoChessAttrs.AttrsTable) do
	slot1["B" .. slot8] = function (slot0)
		uv1 = "model"

		if slot1(slot0.model) then
			return
		end

		uv3 = "getBaseAttr"

		return slot0.model:getBaseAttr(slot3)
	end

	slot1["A" .. slot8] = function (slot0)
		uv1 = "model"

		if slot1(slot0.model) then
			return
		end

		uv2 = "attrs"

		return slot0.model.attrs.buff[slot2]
	end

	slot1["BA" .. slot8] = function (slot0)
		uv1 = "model"

		if slot1(slot0.model) then
			return
		end

		uv3 = "getRealFinalAttr"

		return slot0.model:getRealFinalAttr(slot3)
	end

	slot1[slot8] = function (slot0)
		uv1 = "model"

		if slot1(slot0.model) then
			return
		end

		uv2 = "model"

		return slot0.model[slot2](slot0.model)
	end
end

AutoChessCsv.exportToCsvCls(slot1, slot0)
