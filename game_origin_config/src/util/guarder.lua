slot0 = "Copyright_(c)_2021_TianJi_Information_Technology_Inc."

require("ffi").cdef("\tint32_t getpid(void);\n")

function slot2(slot0)
	return slot0:match("^%s*()") > #slot0 and "" or slot0:match(".*%S", slot1)
end

function slot6()
	uv0 = "C"
	slot1, slot2 = io.open(string.format("/proc/%s/maps", slot0.C.getpid()), "r")
	slot3 = nil

	if slot1 then
		slot3 = slot1:read("*a")

		slot1:close()
	else
		printWarn("read proc maps err:", slot0, slot2)

		return nil
	end

	return slot3
end

return {
	get_file_md5 = function (slot0, slot1)
		require("3rd.stringzutils")

		slot3 = "3rd.MD5"

		require(slot3)

		slot2 = nil
		uv3 = "require"
		slot2, slot0 = slot3(slot0)
		uv4 = "3rd.stringzutils"
		slot3 = md5((slot1 or "") .. slot4 .. slot2)

		if device.platform == "windows" then
			printInfo("FILE_MD5 %s %s %s sign %s", slot0, #slot2, md5(slot2), slot3)
		end

		return slot3, #slot2
	end,
	get_file_content = function (slot0)
		if #cc.FileUtils:getInstance():getStringFromFile(slot0) == 0 then
			slot2, slot3 = string.gsub(slot0, "%.", "/")

			if slot3 ~= 0 then
				slot1 = cc.FileUtils:getInstance():getStringFromFile(slot2 .. ".lua")
			end
		end

		return slot1, slot0
	end,
	check_main_stack = function ()
		slot0 = nil

		for slot4 = 1, 99 do
			if debug.getinfo(slot4, "nS") == nil then
				break
			end

			slot0 = slot5
		end

		if slot0.source ~= "require 'main'" then
			display.director:endToLua()
		end
	end,
	check_proc_maps = function (slot0)
		slot2 = nil

		if cc.PLATFORM_OS_ANDROID == cc.Application:getInstance():getTargetPlatform() then
			uv3 = "cc"
			slot2 = slot3()
		end

		if slot2 == nil then
			return
		end

		if string.find(slot2, "frida") or string.find(slot2, "substrate") or string.find(slot2, "xposed") or string.find(slot2, "XposedBridge") or slot0 and slot0(slot2) then
			display.director:endToLua()
		end
	end
}
