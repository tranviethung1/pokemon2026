slot0 = class("CBase")
battleModule.CBase = slot0

function slot0.ctor(slot0, slot1)
	slot0.parent = slot1
	slot0.subModuleNotify = slot1.subModuleNotify
end

function slot0.notify(slot0, slot1, ...)
	return slot0.subModuleNotify:notify(slot1, ...)
end

function slot0.call(slot0, slot1, ...)
	return slot0.subModuleNotify:call(slot1, ...)
end

function slot0.onClose(slot0)
end

return slot0
