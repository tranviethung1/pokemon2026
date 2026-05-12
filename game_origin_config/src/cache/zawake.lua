slot1 = class("ZawakeCache", require("cache.kv"))

function slot1.init(slot0)
	cc.load("message").registerMessageListener("idlersystem.endIntercept/begin", function ()
		uv0 = "clean"

		slot0:clean()
	end)
end

return slot1
