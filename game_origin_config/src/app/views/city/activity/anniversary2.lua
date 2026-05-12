slot0 = require("app.views.city.activity.anniversary")
slot1 = class("ActivityAnniversary2View", slot0)
slot2 = game.YYHUODONG_TYPE_ENUM_TABLE
slot1.RESOURCE_FILENAME = slot0.RESOURCE_FILENAME
slot1.RESOURCE_BINDING = slot0.RESOURCE_BINDING
slot1.RESOURCE_STYLES = slot0.RESOURCE_STYLES

function slot1.onCreate(slot0, slot1)
	slot1.spineName = "activityheji2/znqrk.skel"
	slot2 = slot0.braveChallenge:get("icon"):texture("activity/anniversary/btn_bksytz.png")
	slot2 = slot2.xy

	slot2(slot2, 350, 560)

	uv2 = "spineName"

	slot2.onCreate(slot0, slot1)
end

function slot1.createTable(slot0)
	uv2 = "tb"
	slot2 = slot2.gridWalk
	uv2 = "tb"
	slot2 = slot2.summerChallenge
	uv2 = "tb"
	slot2 = slot2.horseRace
	uv2 = "tb"
	slot2 = slot2.itemBuy2
	uv2 = "tb"
	slot0.tb = {
		[slot2] = {
			node = slot0.gridWalk,
			redHintPos = cc.p(155, 82)
		},
		[slot2] = {
			node = slot0.braveChallenge,
			redHintPos = cc.p(170, 86)
		},
		[slot2] = {
			node = slot0.horseRace,
			redHintPos = cc.p(170, 88)
		},
		[slot2] = {
			node = slot0.shop,
			redHintPos = cc.p(154, 78)
		},
		[slot2.playPassport] = {
			node = slot0.signIn,
			redHintPos = cc.p(162, 74)
		}
	}
end

return slot1
