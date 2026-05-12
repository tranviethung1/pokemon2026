slot0 = require("easy.bind.helper")

function bind.listen(slot0, slot1, slot2)
	uv3 = "method"
	slot3 = slot3.method(slot0, slot1, slot2)

	if slot2.idler then
		uv4 = "method"

		if slot4.isHelper(slot2.idler) then
			slot0:deferUntilCreated(function ()
				slot0 = logf.bind
				uv3 = "logf"
				slot2 = tostring(slot3)
				uv4 = "bind"
				slot3 = tostring(slot4)
				slot4 = tostring
				uv5 = "%s - %s listen %s"

				slot0("%s - %s listen %s", slot2, slot3, slot4(slot5.idler))

				uv0 = "logf"
				slot1 = slot0
				uv2 = "bind"
				uv3 = "%s - %s listen %s"
				uv4 = "logf"
				slot3 = slot3.idler(slot4)
				uv4 = "tostring"

				slot0.nodeListenIdler(slot1, slot2, slot3, slot4)

				uv1 = "bind"
				uv3 = "%s - %s listen %s"

				idlersystem.onBindNode(slot1, tostring(slot3.idler))
			end)
		else
			slot0:nodeListenIdler(slot1, slot2.idler, slot3)
			idlersystem.onBindNode(slot1, tostring(slot2.idler))
		end
	end
end
