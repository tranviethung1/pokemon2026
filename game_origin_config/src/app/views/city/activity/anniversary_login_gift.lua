slot0 = class("ActivityAnniversaryLoginGiftView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "activity_anniversary_login_gift.json"
slot0.RESOURCE_BINDING = {
	bg = "bg",
	list = "list",
	["btn.lable"] = {
		binds = {
			event = "effect",
			data = {
				glow = {
					color = ui.COLORS.GLOW.WHITE
				}
			}
		}
	},
	btn = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	uiEasy.createItemsToList(slot0, slot0.list, slot1.data, {
		margin = 20,
		onAfterBuild = function ()
			uv0 = "list"

			slot0.list:setItemAlignCenter()
		end
	})

	slot0.cb = slot1.cb

	if slot1.yyid and csv.yunying.yyhuodong[slot1.yyid].clientParam.resBg then
		slot0.bg:texture(slot2)
	end
end

function slot0.onBtnClick(slot0)
	slot0:addCallbackOnExit(slot0.cb)
	slot0:onClose()
end

return slot0
