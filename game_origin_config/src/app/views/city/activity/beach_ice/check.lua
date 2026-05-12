slot0 = {
	"activity/beach_ice/logo_wm.png",
	"activity/beach_ice/logo_lh.png",
	"activity/beach_ice/logo_xc.png",
	"activity/beach_ice/logo_xc.png",
	"activity/beach_ice/logo_xc.png"
}
slot1 = {
	gLanguageCsv.perfectService,
	gLanguageCsv.goodService,
	gLanguageCsv.defectiveService,
	gLanguageCsv.defectiveService,
	gLanguageCsv.defectiveService
}
slot3 = class("BeachIceCheckView", cc.load("mvc").ViewBase)
slot3.RESOURCE_FILENAME = "beach_ice_check.json"
slot3.RESOURCE_BINDING = {
	score = "score",
	bg = "bg",
	item = "item",
	title = "title",
	cardIcon = "cardIcon",
	resImg = "resImg",
	demandList = {
		varname = "demandList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("demand"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("icon"):texture(csv.yunying.shaved_ice_items[slot3].icon1)
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			}
		}
	},
	mineList = {
		varname = "mineList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("mineChoose"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("icon"):texture(csv.yunying.shaved_ice_items[slot3].icon1)
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			}
		}
	}
}

function slot3.onCreate(slot0, slot1)
	slot0.cb = slot1.cb

	slot0.cardIcon:texture(csv.unit[slot1.unitID].iconSimple)

	slot4 = 2

	slot0.cardIcon:scale(slot4)

	slot0.mineChoose = idlers.newWithMap(slot1.mineChoose)
	slot0.demand = idlers.newWithMap(slot1.demand)
	uv4 = "cb"
	slot4 = slot4[slot1.type]

	slot0.resImg:texture(slot4)

	uv4 = "cardIcon"

	slot0.title:text(slot4[slot1.type])
	slot0.score:text(string.format(gLanguageCsv.bonusPoints, slot1.score))
	adapt.oneLinePos(slot0.cardIcon, slot0.title, cc.p(10, 0))
	performWithDelay(slot0, function ()
		uv0 = "onClose"

		slot0:onClose()
	end, 2)
end

function slot3.onClose(slot0)
	if slot0.cb then
		slot0:addCallbackOnExit(slot0.cb)
	end

	uv1 = "cb"

	slot1.onClose(slot0)

	slot0 = nil
end

return slot3
