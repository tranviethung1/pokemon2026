slot0 = cc.load("mvc").ViewBase
slot1 = class("ContractStrengthSuccessView", cc.load("mvc").ViewBase)
slot2 = require("app.views.city.develop.contract.tools")
slot3 = 0.08
slot1.RESOURCE_FILENAME = "contract_strength_success.json"
slot1.RESOURCE_BINDING = {
	icon = "icon",
	name = {
		varname = "iconName",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 5,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0.cb = slot2

	slot0:enableSchedule()
	widget.addAnimation(slot0:getResourceNode(), "qiyuezhizhang/tupo.skel", "effect_loop", 0):name("strengthEffect"):scale(2):alignCenter(display.sizeInView)

	slot3 = csv.contract.contract[slot1]

	slot0.icon:texture(slot3.icon)
	slot0.iconName:text(slot3.name)

	slot4 = time.getTime() + 1.5

	slot0:schedule(function ()
		uv1 = "math"

		if math.max(slot1 - time.getTime(), 0) <= 0 then
			uv2 = "max"

			performWithDelay(slot2, function ()
				uv0 = "onClose"

				slot0:onClose()
			end, 0)

			return false
		end
	end, 1, 0, "closeCutDown")
end

function slot1.onClose(slot0)
	if slot0.cb then
		slot0:addCallbackOnExit(slot0.cb)
	end

	uv1 = "cb"

	slot1.onClose(slot0)
end

return slot1
