slot0 = class("CaptureOver", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "capture_failed.json"
slot0.RESOURCE_BINDING = {
	btn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["iconBg2.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	},
	["iconBg.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.WHITE
				}
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0.cb = slot1
	slot2 = slot0:getResourceNode()
	slot3 = CSprite.new("level/jiesuanshengli.skel")

	slot3:addTo(slot2, 100)
	slot3:setAnchorPoint(cc.p(0.5, 1))
	slot3:setPosition(slot2:get("titlePos"):getPosition())
	slot3:visible(true)
	slot3:play("jiesuan_buzhuoshibai")
	slot3:addPlay("jiesuan_buzhuoshibai_loop")
	slot3:retain()
end

function slot0.onClose(slot0)
	if slot0.cb then
		slot0.cb(true)
	end
end

return slot0
