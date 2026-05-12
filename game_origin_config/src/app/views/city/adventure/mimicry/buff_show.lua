slot0 = {
	"lv",
	"lan",
	"zi",
	"cheng"
}
slot1 = {
	"#C0x91FFB1#",
	"#C0x70A1E3#",
	"#C0xB187FE#",
	"#C0xECB72A#"
}
slot2 = csv.mimicry.boss
slot3 = class("MimicryBuffShowView", Dialog)
slot3.RESOURCE_FILENAME = "mimicry_buff_show.json"
slot3.RESOURCE_BINDING = {
	item = "item",
	anima = "anima",
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 60,
				asyncPreload = 5,
				data = bindHelper.self("showBuffData"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					uv6 = "string"
					slot9 = "list"

					beauty.textScroll({
						isRich = true,
						list = slot1:get(slot9),
						strs = string.format("#F44#%s%s#C0xFFFCED#   %s%s", slot6[slot3.quality], slot3.name, gLanguageCsv.buffEffect, slot3.desc)
					})
					slot1:get("icon"):texture(slot3.icon1)

					uv9 = "format"

					slot1:get("iconBg"):texture(string.format("city/adventure/mimicry/icon_ntdz_%s.png", slot9[slot3.quality]))
				end,
				onAfterBuild = function (slot0)
					if slot0:getInnerContainerSize().height <= slot0:getContentSize().height then
						slot0:setTouchEnabled(false)
					end
				end
			}
		}
	},
	["topPanel.text"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = cc.c4b(215, 18, 65, 255)
				}
			}
		}
	}
}

function slot3.onCreate(slot0, slot1)
	slot0.showBuffData = slot1.showBuffData or {}
	slot0.cb = slot1.cb

	widget.addAnimation(slot0.anima, "mimicry/qiangdilaixi.skel", "gaonengyujing_loop", 10):xy(slot0.anima:size().width / 2, slot0.anima:size().height / 2):scale(1.75)
	Dialog.onCreate(slot0)
end

function slot3.onClose(slot0)
	if slot0.cb then
		slot0:addCallbackOnExit(slot0.cb)
	end

	Dialog.onClose(slot0)
end

return slot3
