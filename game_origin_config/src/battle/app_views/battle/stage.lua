require("battle.app_views.battle.stage_layer")

globals.CStageModel = class("CStageModel")

function CStageModel.ctor(slot0, slot1)
	slot0.battleView = slot1
	slot0.bkLayerMap = CMap.new()
end

function CStageModel.init(slot0, slot1)
	slot0.bkLayerMap:clear()

	for slot6, slot7 in orderCsvPairs(getCsv(slot1)) do
		if slot7.resType == 1 or slot7.resType == 2 then
			slot8 = CStageLayerModel.new(slot0.battleView, slot7)

			slot8:init()
			slot0.bkLayerMap:insert(slot6, slot8)
		end
	end
end

function CStageModel.update(slot0, slot1)
	for slot5, slot6 in pairs(slot0.bkLayerMap) do
		slot6:updateSelf(slot1)
	end
end
