for slot4, slot5 in pairs({
	schedule = require("packages.components.schedule"),
	asyncload = require("packages.components.asyncload"),
	message = require("packages.components.message")
}) do
	cc.register(slot4, slot5)
end

return slot0
