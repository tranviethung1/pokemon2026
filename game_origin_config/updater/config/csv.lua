slot1 = {}
globals.csv = slot1

require("config.huodong_display_replace")
require("config.loading_tips")
function (slot0)
	for slot5, slot6 in pairs(slot0) do
		if type(slot5) == "string" and type(slot6) == "table" then
			if string.sub(slot5, 1, 2) ~= "__" then
				uv7 = "string"

				slot7(slot6)
			end
		elseif slot0.__default and type(slot5) == "number" and type(slot6) == "table" then
			setmetatable(slot6, slot0.__default)
		end
	end
end(slot1)
