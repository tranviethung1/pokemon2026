slot0 = cc.load("mvc").ViewBase
slot1 = class("BoxDetailView", Dialog)
slot1.RESOURCE_FILENAME = "common_box_detail.json"
slot1.RESOURCE_BINDING = {
	content = "contentLabel",
	list = "list",
	title = "titleLabel",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	btnOk = {
		varname = "btnOk",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClickOk")
			}
		}
	},
	["btnOk.title"] = {
		varname = "btnText",
		binds = {
			{
				event = "effect",
				data = {
					glow = {
						color = ui.COLORS.GLOW.WHITE
					}
				}
			},
			{
				event = "text",
				idler = bindHelper.self("btnText")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.cb = slot1.cb
	slot0.data = slot1.data
	slot0.state = slot1.state or 1
	slot0.clearFast = slot1.clearFast

	cache.setShader(slot0.btnOk, false, slot0.state == 1 and "normal" or "hsl_gray")

	slot0.btnText = idler.new(slot1.btnText or gLanguageCsv.commonTextOk)

	if slot0.state ~= 1 then
		slot0.btnText:set(slot1.btnText or gLanguageCsv.received)
	end

	slot0.btnOk:setTouchEnabled(slot0.state == 1)

	if slot1.title then
		slot0.titleLabel:text(slot1.title)
	end

	if slot1.content then
		adapt.setTextAdaptWithSize(slot0.contentLabel, {
			horizontal = "center",
			vertical = "center",
			str = slot1.content,
			size = cc.size(1000, 168)
		})
	end

	uiEasy.createItemsToList(slot0, slot0.list, slot0.data, {
		onAfterBuild = function (slot0)
			slot0:adaptTouchEnabled():setItemAlignCenter()
		end
	})
	Dialog.onCreate(slot0)
end

function slot1.onClickOk(slot0)
	if slot0.state ~= 1 then
		return
	end

	slot0:addCallbackOnExit(slot0.cb)

	if slot0.clearFast then
		uv1 = "state"

		slot1.onClose(slot0)
	else
		Dialog.onClose(slot0)
	end

	return slot0
end

return slot1
