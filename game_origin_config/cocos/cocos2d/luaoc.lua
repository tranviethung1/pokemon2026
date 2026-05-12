slot1 = LuaObjcBridge.callStaticMethod

return {
	callStaticMethod = function (slot0, slot1, slot2)
		uv3 = "string"
		slot3, slot4 = slot3(slot0, slot1, slot2)

		if not slot3 then
			if slot4 == -1 then
				print(string.format("luaoc.callStaticMethod(\"%s\", \"%s\", \"%s\") - error: [%s] ", slot0, slot1, tostring(slot2), tostring(slot4)) .. "INVALID PARAMETERS")
			elseif slot4 == -2 then
				print(slot5 .. "CLASS NOT FOUND")
			elseif slot4 == -3 then
				print(slot5 .. "METHOD NOT FOUND")
			elseif slot4 == -4 then
				print(slot5 .. "EXCEPTION OCCURRED")
			elseif slot4 == -5 then
				print(slot5 .. "INVALID METHOD SIGNATURE")
			else
				print(slot5 .. "UNKNOWN")
			end
		end

		return slot3, slot4
	end
}
