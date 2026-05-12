function globals.writeQRcodeImage(slot0)
	slot1 = require("3rd.bmp")
	slot3 = "qrcode.png"
	slot4 = 230
	slot5 = {
		255,
		255,
		255
	}
	slot6 = {
		0,
		0,
		0
	}
	slot7, slot8 = require("3rd.qrencode").qrcode(slot0)

	if not slot7 then
		print("qrencode error:", slot8)
	else
		slot10 = require("3rd.pngencoder")(slot4, slot4)

		for slot14, slot15 in ipairs(slot1.format_data(slot8, slot4)) do
			for slot19, slot20 in ipairs(slot15) do
				if slot20 > 0 then
					slot10:write(slot6)
				elseif slot20 < 0 then
					slot10:write(slot5)
				else
					slot10:write(slot5)
				end
			end
		end

		assert(slot10.done)

		slot12 = cc.FileUtils:getInstance():getWritablePath() .. slot3
		slot13 = io.open(slot12, "wb")

		slot13:write(table.concat(slot10.output, ""))
		slot13:close()

		return slot12
	end
end
