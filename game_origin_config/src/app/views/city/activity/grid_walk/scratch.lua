slot0 = require("app.views.city.activity.grid_walk.tools")
slot1 = class("GridWalkScratch", Dialog)
slot1.RESOURCE_FILENAME = "grid_walk_scratch.json"
slot1.RESOURCE_BINDING = {
	["imgBG.drawPanel"] = "drawPanel",
	imgBG = "imgBG",
	["imgBG.resultPanel.text"] = "panelText",
	["imgBG.imgGJ"] = "imgGJ",
	["imgBG.resultPanel.text1"] = "text1",
	["imgBG.resultPanel"] = "resultPanel",
	["imgBG.touchPanel"] = {
		binds = {
			event = "touch",
			scaletype = 0,
			method = bindHelper.self("onScratchClick")
		}
	},
	["imgBG.textNum"] = {
		varname = "textNum",
		binds = {
			{
				event = "text",
				idler = bindHelper.self("num")
			},
			{
				event = "effect",
				data = {
					outline = {
						size = 6,
						color = ui.COLORS.NORMAL.DEFAULT
					}
				}
			}
		}
	},
	["imgBG.icon"] = {
		varname = "icon",
		binds = {
			event = "texture",
			idler = bindHelper.self("img")
		}
	},
	textNote = {
		binds = {
			event = "visible",
			idler = bindHelper.self("opened")
		}
	},
	["imgBG.resultPanel.num"] = {
		varname = "leftNum",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.callBack = slot1.callBack
	slot3 = slot1.event
	slot6 = csv.yunying.grid_walk_events[slot3.csv_id].params.items[slot3.params.outcome + 1]
	slot7 = dataEasy.getNumByKey(slot6[1])
	uv9 = "callBack"

	if slot6[1] == slot9.BADGE_ID then
		slot0.badgeNum = slot6[2]
		slot7 = math.max(slot1.iconNum - slot0.badgeNum, 0)
	end

	slot0.leftNum:text(slot7)
	adapt.oneLinePos(slot0.panelText, {
		slot0.leftNum,
		slot0.text1
	}, cc.p(10, 0))
	slot0.imgGJ:show()

	slot0.img = idler.new(dataEasy.getCfgByKey(slot6[1]).icon)
	slot0.num = idler.new(-slot6[2])
	slot0.opened = idler.new(false)
	slot0.moveLength = 0
	slot0.lastX = 0
	slot0.lastY = 0
	slot0.showType = 0

	slot0.resultPanel:hide()
	Dialog.onCreate(slot0)
end

function slot1.onScratchClick(slot0, slot1, slot2)
	if slot2.name == "began" then
		slot0.lastX = slot2.x
		slot0.lastY = slot2.y
	elseif slot2.name == "moved" then
		slot0.moveLength = slot0.moveLength + math.sqrt(math.pow(slot0.lastX - slot2.x, 2) + math.pow(slot0.lastY - slot2.y, 2))
		slot0.lastX = slot2.x
		slot0.lastY = slot2.y

		if slot0.moveLength > 2000 then
			slot0:showMask(3)
		elseif slot0.moveLength > 1350 then
			slot0:showMask(2)
		elseif slot0.moveLength > 600 then
			slot0:showMask(1)
		end
	elseif slot2.name == "ended" and slot0.moveLength > 2000 then
		performWithDelay(slot0, function ()
			uv0 = "opened"
			slot0 = slot0.opened
			slot0 = slot0.set

			slot0(slot0, true)

			uv0 = "opened"
			slot0 = slot0.drawPanel
			slot0 = slot0.hide

			slot0(slot0)

			uv0 = "opened"
			slot0 = slot0.resultPanel
			slot0 = slot0.show

			slot0(slot0)

			uv0 = "set"

			slot0:hide()
		end, 0)
	end
end

function slot1.showMask(slot0, slot1)
	if slot1 <= slot0.showType then
		return
	end

	slot0.imgGJ:hide()

	slot0.showType = slot1

	slot0.drawPanel:removeAllChildren()
	cc.RenderTexture:create(slot0.drawPanel:width(), slot0.drawPanel:height()):addTo(slot0.drawPanel, 5, "bgRender"):begin()

	slot6 = slot0.imgGJ
	slot7 = slot6

	ccui.ImageView:create("activity/grid_walk/img_eyk5.png"):xy(slot0.imgGJ:x(), slot6.y(slot7)):visit()

	for slot7 = 1, 3 do
		ccui.ImageView:create("activity/grid_walk/img_eyk_mask.png"):xy(slot0.imgGJ:x(), slot0.imgGJ:y() - 100 + 50 * slot7):setBlendFunc({
			src = GL_DST_ALPHA,
			dst = GL_SRC_ALPHA
		})

		if slot1 == 2 then
			slot8:scale(1.1)
		elseif slot1 == 3 then
			slot8:scale(1.3)
		end

		slot8:visit()

		if slot1 == slot7 then
			break
		end
	end

	slot2:endToLua()
end

function slot1.onClose(slot0)
	if slot0.opened:read() == true then
		slot0:addCallbackOnExit(functools.partial(slot0.callBack, slot0.badgeNum))
		Dialog.onClose(slot0)
	end
end

return slot1
