function bind.animation(slot0, slot1, slot2)
	if slot2.pos then
		widget.addAnimationByKey(slot1, slot2.res, slot2.name or slot2.res, slot2.action, slot2.zOrder):xy(slot2.pos)
	end

	if slot2.scale then
		if type(slot2.scale) == "table" then
			slot4:scale(slot2.scale[1], slot2.scale[2])
		else
			slot4:scale(slot2.scale)
		end
	end
end
