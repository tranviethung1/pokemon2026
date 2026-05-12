globals.CStageLayerModel = class("CStageLayerModel")

function CStageLayerModel.ctor(slot0, slot1, slot2)
	slot0.battleView = slot1
	slot0.csv = slot2
	slot0.x = 0
	slot0.y = 0
	slot0.xloopCount = 1
	slot0.yloopCount = 1
	slot0.lastAddCount = 0
end

function CStageLayerModel.init(slot0)
	slot0.xtileSize = 1
	slot0.ytileSize = 1
	slot0.x = slot0.csv.x
	slot0.y = slot0.csv.y
	slot2 = math.ceil(CC_DESIGN_RESOLUTION.height / slot0.csv.ylength) + 1

	if slot0.csv.xloop == 0 then
		slot0.xtileSize = math.ceil(CC_DESIGN_RESOLUTION.width / slot0.csv.xlength) + 1
		slot0.xloopCount = -99999999
	elseif slot0.csv.xloop > 2 then
		slot3 = slot1 <= slot0.csv.xloop and slot1 or slot0.csv.xloop
		slot0.xtileSize = slot3
		slot0.xloopCount = slot3
	elseif slot0.csv.xloop == 2 then
		slot0.xtileSize = 2
		slot0.xloopCount = 2
	end

	if slot0.csv.yloop == 0 then
		slot0.ytileSize = slot2
		slot0.yloopCount = -99999999
	elseif slot0.csv.yloop > 2 then
		slot3 = slot2 <= slot0.csv.yloop and slot2 or slot0.csv.yloop
		slot0.ytileSize = slot3
		slot0.yloopCount = slot3
	elseif slot0.csv.yloop == 2 then
		slot0.ytileSize = 2
		slot0.yloopCount = 2
	end

	slot0.battleView:onViewProxyNotify("AddGround", {
		id = tostring(slot0),
		config = slot0.csv,
		x = slot0.x,
		y = slot0.y,
		xtileSize = slot0.xtileSize,
		xlength = slot0.csv.xlength,
		ytileSize = slot0.ytileSize,
		ylength = slot0.csv.ylength
	})
end

function CStageLayerModel.updateSelf(slot0, slot1)
	slot3 = -slot0.csv.y_speed * slot1 / 1000

	if -slot0.csv.x_speed * slot1 / 1000 == 0 and slot3 == 0 then
		return
	end

	slot0.x = slot0.x + slot2
	slot0.y = slot0.y + slot3

	if slot0.xloopCount < slot0.csv.xloop and slot0.csv.xlength <= -slot0.x then
		slot0.x = slot0.csv.xlength + slot0.x
		slot0.xloopCount = slot0.xloopCount + 1
	elseif slot0.xloopCount < slot0.csv.xloop and slot0.csv.x_speed < 0 and slot0.csv.xlength <= slot0.x then
		slot0.x = slot0.x - slot0.csv.xlength
		slot0.xloopCount = slot0.xloopCount + 1
	end

	if slot0.yloopCount < slot0.csv.yloop and slot0.csv.ylength <= -slot0.y then
		slot0.y = slot0.csv.ylength + slot0.y
		slot0.yloopCount = slot0.yloopCount + 1
	elseif slot0.yloopCount < slot0.csv.yloop and slot0.csv.y_speed < 0 and slot0.csv.ylength <= slot0.y then
		slot0.y = slot0.y - slot0.csv.ylength
		slot0.yloopCount = slot0.yloopCount + 1
	end

	slot0.battleView:onViewProxyNotify("MoveGround", {
		id = tostring(slot0),
		config = slot0.csv,
		x = slot0.x,
		y = slot0.y,
		xtileSize = slot0.xtileSize,
		xlength = slot0.csv.xlength,
		ytileSize = slot0.ytileSize,
		ylength = slot0.csv.ylength
	})
end
