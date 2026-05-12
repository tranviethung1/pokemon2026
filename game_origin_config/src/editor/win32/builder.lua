require("iuplua")

slot0 = {
	init = function (slot0, slot1)
		print("iupeditor:init")

		if slot0.scene == nil then
			slot0.scene = slot1

			slot0:initNodeStack()
			slot0:initBattleStack()
		end
	end,
	[slot5] = slot6
}

for slot5, slot6 in pairs(require("editor.win32.nodestack")) do
	-- Nothing
end

for slot6, slot7 in pairs(require("editor.win32.battlestack")) do
	slot0[slot6] = slot7
end

return slot0
