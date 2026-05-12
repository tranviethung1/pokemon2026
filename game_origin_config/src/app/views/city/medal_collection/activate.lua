slot0 = 0.08
slot1 = class("medalActivateView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "medal_collection_activate.json"
slot1.RESOURCE_BINDING = {
	["activate.attr"] = "item",
	["activate.innerList"] = "innerList",
	activate = "activatePanel",
	["activate.title"] = "title",
	["activate.bg"] = {
		binds = {
			event = "click",
			method = bindHelper.self("onClose")
		}
	},
	["activate.bg0"] = {
		binds = {
			event = "click",
			method = bindHelper.self("onClose")
		}
	},
	["activate.list"] = {
		varname = "activateList",
		binds = {
			event = "extend",
			class = "tableview",
			props = {
				columnSize = 3,
				data = bindHelper.self("attrData"),
				item = bindHelper.self("innerList"),
				cell = bindHelper.self("item"),
				onCell = function (slot0, slot1, slot2, slot3)
					slot6 = slot1:get("img")
					slot8 = slot1:get("textNum")
					slot10 = slot0
					uv10 = "game"
					slot10 = slot10 * (3 + slot0.getIdx(slot10, slot2).k)

					if game.ATTRDEF_SIMPLE_TABLE[game.ATTRDEF_SIMPLE_ENUM_TABLE[game.ATTRDEF_TABLE[slot3.attrId]]] then
						slot6:texture(ui.ATTR_LOGO[slot5])
						adapt.oneLinePos(slot6, slot1:get("text"), cc.p(10, 0))
					else
						slot6:hide()
						slot7:x(slot1:get("text"):x() - 50)
					end

					slot7:text(getLanguageAttr(slot3.attrId) .. "：")
					adapt.setTextScaleWithWidth(slot7, nil, math.max(slot7:width(), 240))
					slot8:text("+" .. slot3.val)
					adapt.oneLinePos(slot7, slot8, nil)

					if slot5 then
						uv14 = "game"

						uiEasy.setExecuteSequence(slot6, {
							delayTime = slot10 + slot14
						})
					end

					uv14 = "game"
					slot14 = slot10 + slot14 * 2

					uiEasy.setExecuteSequence(slot7, {
						delayTime = slot14
					})

					uv14 = "game"

					uiEasy.setExecuteSequence(slot8, {
						delayTime = slot10 + slot14 * 3
					})
				end
			}
		}
	}
}

function slot1.onCreate(slot0, slot1)
	slot0.attrData = idlertable.new({})
	slot3 = {}

	for slot7, slot8 in pairs(slot1) do
		table.insert(slot3, {
			attrId = slot7,
			val = dataEasy.getAttrValueString(slot7, slot8)
		})
	end

	slot0.attrData:set(slot3)

	slot4 = math.min(100 * math.ceil(itertools.size(slot3) / 3), 380)

	slot0.activateList:height(slot4):y(341 + 380 - slot4):setTouchEnabled(itertools.size(slot3) > 3 and true or false)
	slot0.title:get("text"):text(gLanguageCsv.randomTowerJumpBUff1 .. "：")
	slot0.title:get("img"):hide()
	uiEasy.setExecuteSequence(slot0.title:get("text"), {
		delayTime = baseDelay
	})
	adapt.oneLinePos(slot0.title:get("text"), slot0.title:get("img"), nil, "left")
	slot0:playEffect("jihuo")
end

function slot1.playEffect(slot0, slot1)
	slot2 = slot0.activatePanel
	slot3, slot4 = slot2:get("spine"):getPosition()
	slot5 = widget.addAnimationByKey(slot2, "level/jiesuanshengli.skel", "effect", "jiesuan_shuxinghuode", 100):setAnchorPoint(cc.p(0.5, 0.5)):xy(slot3, slot4)

	slot5:addPlay(string.format("jiesuan_shuxinghuode_loop", slot1))
	slot5:retain()

	slot6 = widget.addAnimationByKey(slot2, "level/jiesuanshengli.skel", "effect_loop", "jiesuan_shenglitu", 99):setAnchorPoint(cc.p(0.5, 0.5)):xy(slot3, slot4)

	slot6:addPlay("jiesuan_shenglitu_loop")
	slot6:retain()
	slot5:release()
	slot6:release()
end

function slot1.onClose(slot0)
	cc.load("mvc").ViewBase.onClose(slot0)
end

return slot1
