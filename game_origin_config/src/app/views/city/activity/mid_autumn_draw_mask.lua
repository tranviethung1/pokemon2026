slot0 = {
	"activity/midautumn_draw/txt_yyqf_fs.png",
	"activity/midautumn_draw/txt_yyqf_zj.png",
	"activity/midautumn_draw/txt_yyqf_gc.png",
	"activity/midautumn_draw/txt_yyqf_rd.png",
	"activity/midautumn_draw/txt_yyqf_sy.png"
}
slot2 = class("MidAutumnDrawMask", cc.load("mvc").ViewBase)
slot2.RESOURCE_FILENAME = "activity_midautumn_maks.json"
slot2.RESOURCE_BINDING = {
	["mask.txtPlane"] = "txtPlane",
	["mask.spine.img"] = "img",
	btnClose = {
		varname = "btnClose",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1, slot2)
	slot0.cb = slot2.cb

	rich.createByStr(string.format(gLanguageCsv.midAutumnGetTicket, gLanguageCsv["midAutumnTicket" .. slot2.times - 1]), 40):xy(405, 124):anchorPoint(0.5, 0.5):addTo(slot0.txtPlane, 5)

	slot5 = slot0.txtPlane

	rich.createByStr(string.format(gLanguageCsv.midAutumnGetTicketInfo, slot2.num), 40):xy(405, 45):anchorPoint(0.5, 0.5):addTo(slot5, 5)

	uv5 = "cb"
	slot3 = ccui.ImageView:create(slot5[slot2.times - 1]):anchorPoint(0.5, 0.5):xy(210, 420):addTo(slot0.img)

	slot0.img:texture("activity/midautumn_draw/icon_yyqf_whd2.png")
end

function slot2.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

return slot2
