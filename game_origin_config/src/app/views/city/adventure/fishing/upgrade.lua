slot1 = class("FishingUpgradeView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "fishing_upgrade.json"
slot1.RESOURCE_BINDING = {
	back = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	top = {
		varname = "imgInfo",
		binds = {
			event = "extend",
			class = "text_atlas",
			props = {
				isEqualDist = false,
				pathName = "lv_big",
				align = "center",
				data = bindHelper.self("fishLevel"),
				onNode = function (slot0)
					slot0:xy(415, 200)
				end
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.cb = slot1

	audio.playEffectWithWeekBGM("role_levelup.mp3")
	slot0:initModel()

	slot2 = slot0.fishLevel:read()
	slot3 = slot0.imgInfo
	slot4 = slot3:size()
	slot5 = CSprite.new("level/jiesuanshengli.skel")

	slot5:addTo(slot3, 1)
	slot5:setAnchorPoint(cc.p(0.5, 0.5))
	slot5:xy(slot3:width() / 2 + 15, -345)
	slot5:play("shengji_loop")
end

function slot1.initModel(slot0)
	slot0.fishLevel = gGameModel.fishing:getIdler("level")
end

function slot1.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

return slot1
