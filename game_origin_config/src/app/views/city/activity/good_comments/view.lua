slot0 = game.YYHUODONG_TYPE_ENUM_TABLE
slot1 = class("ActivityGoodComments", Dialog)
slot1.RESOURCE_FILENAME = "activity_good_comments.json"
slot1.RESOURCE_BINDING = {
	list = "list",
	btnClose = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	goBtn = {
		varname = "goBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onGoClick")
			}
		}
	},
	refuseBtn = {
		varname = "refuseBtn",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.url = slot1.url
	slot0.tag = slot1.tag
	slot0.award = slot1.award
	slot0.yyID = slot1.yyID

	uiEasy.createItemsToList(slot0, slot0.list, slot0.award, {
		onAfterBuild = function ()
			uv0 = "list"

			slot0.list:setItemAlignCenter()
		end
	})
	userDefault.setForeverLocalKey("goodComments", true)
	Dialog.onCreate(slot0, {
		blackType = 1
	})
end

function slot1.onGoClick(slot0)
	cc.Application:getInstance():openURL(slot0.url)
	gGameApp:requestServer("/game/yy/praise/award/get", function (slot0)
		gGameUI:showGainDisplay(slot0, {
			cb = function ()
				uv0 = "onClose"

				slot0:onClose()
			end
		})
	end, slot0.yyID, slot0.tag)
end

return slot1
