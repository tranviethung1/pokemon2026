slot0 = 380
slot1 = 900
slot3 = class("ZawakeUnlockTipsView", cc.load("mvc").ViewBase)
slot3.RESOURCE_FILENAME = "zawake_unlock_tips.json"
slot3.RESOURCE_BINDING = {
	["panel.title"] = "title",
	item = "item",
	["panel.bg"] = "bg",
	panel = "panel",
	closePanel = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["panel.list"] = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("listDatas"),
				listHeight = bindHelper.self("listHeight"),
				item = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = rich.createWithWidth(slot3, 42, nil, 920):anchorPoint(0, 0.5):x(0):addTo(slot1)

					slot1:height(math.ceil((slot4:size().height + 6) / 72) * 72)
					slot4:y(slot1:height() / 2)
					slot0.listHeight:set(slot0.listHeight:read() + slot1:height())
				end,
				onAfterBuild = function (slot0)
					slot0.afterBuild()
				end
			},
			handlers = {
				afterBuild = bindHelper.self("onAfterBuild")
			}
		}
	}
}

function slot3.onCreate(slot0, slot1)
	slot2 = slot1.labelDatas
	slot4 = slot1.stageID
	slot5 = slot1.pos
	slot6 = slot0.panel:width()
	slot8 = math.min(display.sizeInViewRect.width / 2 - slot6 / 2, display.sizeInViewRect.width - slot6)

	if (slot1.align or "center") == "right" then
		slot8 = slot7 - 1000
	elseif slot3 == "left" then
		slot8 = slot7 - 700
	end

	if slot5 then
		if slot3 == "right" then
			slot8 = slot5.x
		elseif slot3 == "left" then
			slot8 = slot5.x - slot6
		end
	end

	slot0.panel:x(slot8)

	slot0.listHeight = idler.new(0)
	slot0.listDatas = idlers.newWithMap(slot2)

	slot0.title:text(string.format(slot1.title or gLanguageCsv.zawakeStageAwake, gLanguageCsv["symbolRome" .. slot4]))
end

function slot3.onAfterBuild(slot0)
	slot2 = slot0.listHeight
	slot3 = slot2
	uv3 = "cc"
	uv4 = "clampf"
	slot1 = cc.clampf(slot2.read(slot3), slot3, slot4)

	slot0.list:height(slot1)
	slot0.bg:height(slot1 + 170)
	slot0.title:y(slot1 + 80)
	slot0.panel:y((1260 - slot1) / 2)
end

return slot3
