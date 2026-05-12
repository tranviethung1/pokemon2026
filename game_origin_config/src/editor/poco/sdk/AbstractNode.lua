slot0 = {
	__index = slot0,
	__isPocoNodeWrapper__ = true,
	getParent = function (slot0)
		return nil
	end,
	getChildren = function (slot0)
	end,
	getAvailableAttributeNames = function (slot0)
		return {
			"name",
			"type",
			"visible",
			"xy",
			"pos",
			"size",
			"scale",
			"anchorPoint",
			"zOrders"
		}
	end,
	getAttr = function (slot0, slot1)
		return ({
			name = "<Root>",
			type = "Root",
			visible = true,
			xy = {
				0,
				0
			},
			pos = {
				0,
				0
			},
			size = {
				0,
				0
			},
			scale = {
				1,
				1
			},
			anchorPoint = {
				0.5,
				0.5
			},
			zOrders = {
				global = 0,
				["local"] = 0
			}
		})[slot1]
	end,
	setAttr = function (slot0, slot1, slot2)
		assert(false, string.format("unable to set attributes \"%s\" on this node", slot1))

		return false
	end
}

function slot0.enumerateAttrs(slot0)
	for slot5, slot6 in ipairs(slot0:getAvailableAttributeNames()) do
		if slot0:getAttr(slot6) ~= nil then
			-- Nothing
		end
	end

	return {
		[slot6] = slot7
	}
end

return slot0
