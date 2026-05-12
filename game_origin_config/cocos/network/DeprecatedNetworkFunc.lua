if cc.XMLHttpRequest == nil then
	return
end

function slot0(slot0, slot1)
end

if kTargetIphone == CCApplication:getInstance():getTargetPlatform() or kTargetIpad == slot1 or kTargetAndroid == slot1 or kTargetWindows == slot1 then
	slot2 = {
		sendTextMsg = function (slot0, slot1)
			uv2 = "WebSocket:sendTextMsg"

			slot2("WebSocket:sendTextMsg", "WebSocket:sendString")

			return slot0:sendString(slot1)
		end
	}
	WebSocket.sendTextMsg = slot2.sendTextMsg

	function slot2.sendBinaryMsg(slot0, slot1, slot2)
		uv3 = "WebSocket:sendBinaryMsg"

		slot3("WebSocket:sendBinaryMsg", "WebSocket:sendString")
		string.char(unpack(slot1))

		return slot0:sendString(string.char(unpack(slot1)))
	end

	WebSocket.sendBinaryMsg = slot2.sendBinaryMsg
end
