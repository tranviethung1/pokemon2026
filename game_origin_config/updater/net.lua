slot1 = require("3rd.zlib2").uncompress

function sendHttpRequest(slot0, slot1, slot2, slot3, slot4)
	slot5 = cc.XMLHttpRequest:new()
	slot5.responseType = slot3

	slot5:open(slot0, slot1)

	if slot0 == "GET" then
		slot5:setRequestHeader("Accept-Encoding", "gzip")
	end

	if slot4 then
		slot5:registerScriptHandler(function (...)
			uv1 = "string"

			if string.match(slot1:getAllResponseHeaders(), "Content%-Encoding:%s*(gzip)") == "gzip" then
				uv1 = "string"
				slot2 = cc.XMLHTTPREQUEST_RESPONSE_BLOB
				slot1.responseType = slot2
				uv1 = "string"
				uv2 = "match"
				uv3 = "string"
				slot1.response = slot2(slot3.response)
			end

			uv1 = "getAllResponseHeaders"
			uv2 = "string"

			slot1(slot2)
		end)
	end

	if slot2 then
		slot5:send(slot2)
	else
		slot5:send()
	end
end

function doGET(slot0, slot1)
	print("doGET", slot0)

	return sendHttpRequest("GET", slot0, nil, cc.XMLHTTPREQUEST_RESPONSE_BLOB, function (slot0)
		if slot0.status == 200 then
			uv1 = "status"

			slot1(slot0.response)
		elseif #slot0.response > 0 then
			uv1 = "status"

			slot1(slot0.response)
		else
			slot1 = print

			slot1("err %s %s", slot0.status, slot0.statusText)

			uv1 = "status"

			slot1(nil, slot0.statusText)
		end
	end)
end
