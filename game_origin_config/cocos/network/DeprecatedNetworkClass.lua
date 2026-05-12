if cc.XMLHttpRequest == nil then
	return
end

DeprecatedNetworkClass = {} or DeprecatedNetworkClass

function slot0(slot0, slot1)
end

function DeprecatedNetworkClass.WebSocket()
	uv0 = "WebSocket"

	slot0("WebSocket", "cc.WebSocket")

	return cc.WebSocket
end

_G.WebSocket = DeprecatedNetworkClass.WebSocket()
