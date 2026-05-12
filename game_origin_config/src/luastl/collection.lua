slot0 = isRef
slot2 = class("CCollection", require("luastl.stlbase"))
globals.CCollection = slot2
slot2.debugMode = false

require("luastl.collection_index")
require("luastl.collection_query")
require("luastl.collection_result")

function slot3(slot0, slot1)
	return slot0 < slot1
end

function slot2.ctor(slot0)
	uv1 = "ctor"

	slot1.ctor(slot0)

	slot0.indexs = {}
	uv3 = "indexs"
	uv5 = "add_index"

	slot0:add_index(slot3.index.new("_default_key_index_"):order_bykey(slot5))

	slot1 = slot0.indexs._default_key_index_
	slot0.defaultindex = slot1
	uv1 = "indexs"
	slot2 = slot0
	slot1 = slot1.query.new(slot2)
	uv2 = "indexs"
	slot2 = slot2.inner_result.new()

	function slot0.single_result_(slot0, slot1)
		uv2 = "resetSingle"

		return slot2:resetSingle(slot1)
	end

	function slot0.hash_result_(slot0, slot1, slot2)
		uv3 = "resetHash"

		return slot3:resetHash(slot1, slot2)
	end

	function slot0.self_hash_result_(slot0)
		uv1 = "resetHash"
		uv3 = "m"
		uv4 = "m"

		return slot1:resetHash(slot3.m, slot4.msize)
	end

	function slot0.getQuery(slot0)
		uv1 = "resetSingle"
		slot1 = slot1.resetSingle

		slot1(slot1)

		uv1 = "reset"

		return slot1:reset(slot0)
	end

	slot0:clear()
end

function slot2.clear(slot0)
	if slot0.m then
		for slot4, slot5 in pairs(slot0.m) do
			uv6 = "m"

			if slot6(slot5) then
				slot5:autorelease()
			end
		end
	end

	slot0.m = {}
	slot0.msize = 0

	slot0:clear_indexs_()
end

function slot2.size(slot0)
	return slot0.msize
end

function slot2.empty(slot0)
	return slot0:size() == 0
end

function slot2.insert(slot0, slot1, slot2)
	assert(type(slot1) == "number" or type(slot1) == "string", "only number or string key")

	slot3 = assert

	slot3(slot2 ~= nil, "value is nil")

	uv3 = "assert"

	if slot3(slot2) then
		slot2:retain()
	end

	if slot0.m[slot1] ~= nil then
		uv4 = "assert"

		if slot4(slot3) then
			slot3:autorelease()
		end

		slot0.msize = slot0.msize - 1

		slot0:update_indexs_("erase", slot1, slot3)
	end

	slot0.msize = slot0.msize + 1
	slot0.m[slot1] = slot2

	if device.platform == "windows" then
		assert(slot0.msize == table.nums(slot0.m), "size error")
	end

	slot0:update_indexs_("insert", slot1, slot2)
end

function slot2.erase(slot0, slot1)
	if slot0.m[slot1] ~= nil then
		uv3 = "m"

		if slot3(slot2) then
			slot2:autorelease()
		end

		slot0.m[slot1] = nil
		slot0.msize = slot0.msize - 1

		if device.platform == "windows" then
			assert(slot0.msize == table.nums(slot0.m), string.format("erase size error %s %s", slot0.msize, table.nums(slot0.m)))
		end

		slot0:update_indexs_("erase", slot1, slot2)

		return slot2
	end

	return nil
end

slot2.pop = slot2.erase

function slot2.count(slot0, slot1)
	if slot0.m[slot1] ~= nil then
		return 1
	end

	return 0
end

function slot2.find(slot0, slot1, slot2)
	if slot0.m[slot1] ~= nil then
		return slot3
	end

	return slot2
end

function slot2.data(slot0)
	return slot0.m
end

function slot2.pairs(slot0)
	return pairs(slot0.m)
end

function slot2.equal(slot0, slot1)
	if slot0.msize ~= slot1.msize then
		return false
	end

	for slot5, slot6 in pairs(slot0.m) do
		if slot6 ~= slot1:find(slot5) then
			return false
		end
	end

	return true
end

function slot2.order_pairs(slot0, slot1)
	assert(slot1 == nil, "cmp must be nil")

	return maptools.pairs_with_order(slot0.m, slot0.defaultindex:get_order())
end

function slot2.order_pairs_byindex(slot0, slot1)
	slot2 = slot0.indexs[slot1]

	assert(slot2, "no such index " .. slot1)
	assert(slot2:is_order(), "the index no order " .. slot1)
end

function slot2.on_value_change(slot0, slot1)
	if slot0.m[slot1] == nil then
		return
	end

	slot0:update_indexs_("change", slot1, slot2)
end

function slot2.add_index(slot0, slot1)
	slot0.indexs[slot1.name] = slot1:build_(slot0)
end

function slot2.delete_index(slot0, slot1)
	slot0.indexs[slot1.name] = nil
end

function slot2.update_index(slot0, slot1, slot2)
	assert(slot0.indexs[slot1], "no such index " .. slot1)

	if slot0.m[slot2] == nil then
		return
	end

	slot3:update("change", slot2, slot4)
end

function slot2.update_indexs_(slot0, slot1, slot2, slot3)
	for slot7, slot8 in pairs(slot0.indexs) do
		slot8:update(slot1, slot2, slot3)
	end
end

function slot2.clear_indexs_(slot0)
	for slot4, slot5 in pairs(slot0.indexs) do
		slot5:clear()
	end
end

function slot2.fill_values_(slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		slot7 = slot0.m[slot6]

		assert(slot7, "CCollection lost key " .. slot6)

		slot1[slot5] = slot7
	end

	return slot1
end

function slot2.customQuery(slot0)
	uv1 = "query"

	return slot1.query.new(slot0)
end

function slot2.stats()
	uv0 = "index"
	slot0 = slot0.index.stats()
	uv1 = "index"
	slot1 = slot1.query.stats()
	slot0.query = slot1
	uv1 = "index"
	slot0.result = slot1.inner_result.stats()

	return slot0
end

return slot2
