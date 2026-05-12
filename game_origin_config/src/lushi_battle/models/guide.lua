globals.AutoChessGuideModel = class("AutoChessGuideModel")

function AutoChessGuideModel.ctor(slot0, slot1)
	slot0.scene = slot1
	slot0.storys = {}
end

function AutoChessGuideModel.init(slot0, slot1)
	slot0.play = slot1
	slot0.storys = csvClone(slot0.scene.trainer[1].cfg.storys) or {}
end

function AutoChessGuideModel.checkGuide(slot0, slot1, slot2, slot3)
	slot3 = slot3 or {}

	if not slot0.storys[1] or slot4[1] ~= slot2 then
		slot1 or function ()
		end()

		return false
	end

	slot5 = {}

	for slot9 = 2, table.length(slot4) do
		if csv.auto_chess.chess_guide[slot4[slot9]] then
			table.insert(slot5, slot10)
		end
	end

	table.remove(slot0.storys, 1)

	if next(slot5) then
		gRootViewProxy:proxy():setGuideData(slot5)
		slot0.scene:modelWait("guiding", slot1)

		return true
	end

	slot1()

	return false
end
