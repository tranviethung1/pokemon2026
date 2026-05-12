slot0 = require("easy.bind.helper")
slot1 = class("cardIcon", cc.load("mvc").ViewBase)
slot1.defaultProps = {
	isBoss = false,
	space = false,
	frame = true,
	grayState = 0,
	selected = false,
	isNew = false,
	showAttribute = false
}

function slot1.initExtend(slot0)
	if slot0.panel then
		slot0.panel:removeFromParent()
	end

	slot1 = cc.size(198, 198)
	slot2 = ccui.Layout:create():size(198, 198):addTo(slot0, 1, "_card_")

	if not slot0.advance then
		ccui.ImageView:create(ui.QUALITY_BOX[1]):alignCenter(slot1):addTo(slot2, 1, "imgBG"):texture("common/icon/panel_icon.png")
		ccui.ImageView:create("common/icon/panel_icon_k1.png"):alignCenter(slot1):addTo(slot2, 3, "imgFG"):hide()
	end

	if slot0.selected ~= nil then
		ccui.ImageView:create("common/box/box_selected.png"):alignCenter(slot1):addTo(slot2, -1, "imgSel"):hide():visible(slot0.selected)
	end

	slot0.panel = slot2
	slot0.params = slot0.params or {}
	slot6 = slot2:size()
	slot9 = text.addEffect

	slot9(cc.Label:createWithTTF("", ui.FONT_PATH, 24):align(cc.p(0, 0.5), 2, 15):addTo(ccui.ImageView:create():align(cc.p(0, 0.5)):xy(15, 99):addTo(slot2, 4, "frame"), 4, "num"), {
		outline = {
			size = 3,
			color = ui.COLORS.OUTLINE.DEFAULT
		}
	})

	uv9 = "panel"

	slot9.callOrWhen(slot0.advance, function (slot0)
		uv1 = "panel"
		uv2 = "hide"

		slot2:hide()
		slot1.panel:get("frame"):hide()

		if not tonumber(slot0) then
			uv3 = "panel"

			if isIdler(slot3.rarity) then
				uv2 = "panel"

				if not slot2.rarity:read() then
					uv2 = "panel"
					slot2 = slot2.rarity
				end
			end

			if tonumber(slot2) then
				uv3 = "panel"
				slot3 = slot3.panel:get("imgBG")
				slot3 = slot3.texture

				slot3(slot3, ui.QUALITY_BOX[slot2 + 2])

				uv3 = "panel"

				slot3.panel:get("imgFG"):show():texture(string.format("common/icon/panel_icon_k%d.png", slot2 + 2)):show()
			end

			return
		end

		uv4 = "panel"
		slot2, slot3 = dataEasy.getQuality(slot0, slot4.space)
		slot5 = ui.QUALITY_FRAME[slot2]
		uv6 = "get"
		slot6 = slot6.texture

		slot6(slot6, ui.QUALITY_BOX[slot2])

		uv6 = "hide"
		slot6 = slot6:texture(string.format("common/icon/panel_icon_k%d.png", slot2))
		slot6 = slot6.show

		slot6(slot6)

		uv6 = "panel"

		if not slot6.cardId then
			uv6 = "panel"
			slot6 = slot6.unitId
		end

		if isIdler(slot6) then
			slot6 = slot6:read() or slot6
		end

		slot8 = csv.unit[slot6]

		if csv.cards[slot6] then
			slot8 = csv.unit[slot7.unitID]
		end

		if slot8 and slot8.shiny then
			uv9 = "get"
			slot9 = slot9.texture

			slot9(slot9, string.format("common/icon/panel_shiny_icon_%d.png", slot2))

			uv9 = "hide"

			slot9:texture(string.format("common/icon/panel_shiny_icon_k%d.png", slot2))
		end

		slot9 = slot1:get("frame"):texture(slot5)
		slot9 = slot9.show

		slot9(slot9)

		uv9 = "frame"

		slot9:text(slot3)

		slot11 = "frame"
		slot9 = slot1:get(slot11)
		slot10 = slot9
		uv11 = "panel"

		slot9.visible(slot10, slot11.frame ~= false and slot3 ~= "")

		uv10 = "frame"

		text.addEffect(slot10, {
			outline = {
				color = ui.COLORS.QUALITY_OUTLINE[slot2]
			}
		})
	end)

	slot9 = ccui.ImageView:create():alignCenter(slot1):scale(2)
	slot10 = slot9
	slot9 = slot9.addTo(slot10, slot2, 2, "icon")
	uv10 = "panel"

	slot10.callOrWhen(slot0.unitId or slot0.cardId, function (slot0)
		slot1 = slot0

		if slot0 == -1 then
			uv2 = "texture"

			slot2:texture("common/icon/icon_empty.png"):scale(1)
		else
			uv2 = "common/icon/icon_empty.png"

			if not slot2.unitId then
				slot1 = csv.cards[slot0].unitID
			end

			uv2 = "texture"
			slot2 = slot2:texture(csv.unit[slot1].cardIcon)
			slot2 = slot2.scale

			slot2(slot2, 2)

			uv2 = "common/icon/icon_empty.png"

			slot2:testShowMaxStar(slot1)
		end

		uv2 = "common/icon/icon_empty.png"

		slot2:setKey(slot0)
	end)
	slot0:setLock(slot2)
	slot0:setStar(slot2)
	slot0:setRarity(slot2)
	slot0:setMaterial(slot2)
	slot0:setShiny(slot2)
	slot0:setNew(slot2)

	if slot0.levelProps and slot0.levelProps.data then
		bind.extend(slot0, slot2, {
			class = "card_level",
			props = {
				data = slot0.levelProps.data,
				onNode = function (slot0)
					slot1 = slot0:xy(90, 35)
					slot1 = slot1.z

					slot1(slot1, 4)

					uv1 = "xy"

					if slot1.levelProps.onNode then
						uv1 = "xy"

						slot1.levelProps.onNode(slot0)
					end
				end
			}
		})
	end

	uv10 = "panel"
	slot10 = slot10.callOrWhen

	slot10(slot0.isBoss, function (slot0)
		uv1 = "panel"

		if not slot1.panel:get("boosIcon") then
			slot5 = 1
			uv5 = "get"
			slot2 = ccui.ImageView:create("common/icon/txt_boss.png"):anchorPoint(slot5, 0.5):xy(slot5.width - 18, 24):addTo(slot1, 14, "boosIcon")
		end

		slot2:visible(slot0)
	end)

	uv10 = "panel"
	slot10 = slot10.callOrWhen

	slot10(slot0.showAttribute, function (slot0)
		uv1 = "panel"
		slot2 = slot1.panel:get("attrPanel")

		if not slot0 then
			if slot2 then
				slot2:visible(slot0)
			end

			return
		end

		slot2 = slot2 or ccui.Layout:create():size(150, 70):align(cc.p(0, 0.5), 10, 32):addTo(slot1, 14, "attrPanel")
		slot4 = slot2

		slot2.removeAllChildren(slot4)

		slot3 = nil
		uv4 = "panel"

		if not slot4.cardId then
			uv5 = "panel"
			slot3 = csv.unit[slot5.unitId]
		else
			uv5 = "panel"
			slot3 = csv.unit[csv.cards[slot5.cardId].unitID]
		end

		if slot3.natureType2 then
			adapt.oneLinePos(ccui.ImageView:create(ui.ATTR_ICON[slot3.natureType]):xy(23, 35):scale(0.5):addTo(slot2, 1), ccui.ImageView:create(ui.ATTR_ICON[slot3.natureType2]):xy(23, 35):scale(0.5):addTo(slot2, 1), nil, "left")
		end
	end)

	uv10 = "panel"

	slot10.callOrWhen(slot0.maxStar, function (slot0)
		if slot0 and dataEasy.isUnlock(gUnlockCsv.fragShopMaxStar) then
			uv2 = "dataEasy"
			uv4 = "dataEasy"

			uiEasy.setMaxStar(slot2.panel, {
				cardId = slot4.cardId:read()
			})
		end
	end)

	slot10 = slot0.grayState == 1 and cc.c3b(128, 128, 128) or cc.c3b(255, 255, 255)

	slot3:color(slot10)
	slot9:color(slot10)

	slot11 = slot0.grayState == 2 and "hsl_gray" or "normal"

	cache.setShader(slot3, false, slot11)
	cache.setShader(slot9, false, slot11)

	if slot0.onNode then
		slot0.onNode(slot2)
	end

	if slot0.onNodeClick then
		slot2:setTouchEnabled(true)
		bind.touch(slot0, slot2, {
			methods = {
				ended = function ()
					uv0 = "onNodeClick"
					uv1 = "onNodeClick"

					slot0.onNodeClick(slot1)
				end
			}
		})
	end

	return slot0
end

function slot1.setLock(slot0, slot1)
	if slot0.lock ~= nil then
		slot2 = slot1:size()
		slot3 = ccui.ImageView:create("common/btn/btn_lock.png"):scale(0.74):align(cc.p(0.5, 0.5), slot2.width - 10, slot2.height - 7)
		slot3 = slot3.addTo

		slot3(slot3, slot1, 5, "lock")

		uv3 = "lock"

		slot3.callOrWhen(slot0.lock, function (slot0)
			uv1 = "panel"

			slot1.panel:get("lock"):visible(slot0)
		end)
	end
end

function slot1.setNew(slot0, slot1)
	if slot0.isNew ~= nil then
		slot2 = slot1:size()
		slot3 = ccui.ImageView:create("other/gain_sprite/txt_new.png"):scale(0.5):align(cc.p(0.5, 0.5), slot2.width - 50, slot2.height - 20)
		slot3 = slot3.addTo

		slot3(slot3, slot1, 5, "new")

		uv3 = "isNew"

		slot3.callOrWhen(slot0.isNew, function (slot0)
			uv1 = "panel"

			slot1.panel:get("new"):visible(slot0)
		end)
	end
end

function slot1.setStar(slot0, slot1)
	slot3 = ccui.Layout:create():size(slot1:size().width, 70):align(cc.p(0, 0), 0, 0)
	slot3 = slot3.addTo

	slot3(slot3, slot1, 5, "star")

	uv3 = "size"

	slot3.callOrWhen(slot0.star, function (slot0)
		uv1 = "panel"

		slot1.panel:get("star"):removeAllChildren()

		if tonumber(slot0) then
			uv2 = "panel"
			slot2 = slot2.params.starInterval or 12
			slot3 = slot0 > 6 and 6 or slot0

			for slot7 = 1, slot3 do
				slot9 = "city/card/equip/icon_star.png"

				if slot7 <= slot0 - 6 then
					slot9 = "common/icon/icon_star_z1.png"
				end

				slot10 = dataEasy.getIsStarAidState
				uv12 = "panel"

				if isIdler(slot12.dbid) then
					uv11 = "panel"

					if not slot11.dbid:read() then
						uv11 = "panel"
						slot11 = slot11.dbid
					end
				end

				if slot10(slot11) then
					slot12 = 99 - slot2 * (slot3 + 1 - 2 * slot7)
					uv12 = "panel"

					widget.addAnimationByKey(slot1, "starswap/xingji.skel", "effctStar" .. slot7, "effect_loop", 10):xy(slot12, 20):scale(slot12.params.starScale or 0.75):setCascadeOpacityEnabled(true):opacity(204)
				end

				slot12 = slot1
				uv12 = "panel"

				ccui.ImageView:create(slot9):xy(99 - slot2 * (slot3 + 1 - 2 * slot7), 20):addTo(slot12, 4, "star"):scale(slot12.params.starScale or 0.75)
			end
		end
	end)
end

function slot1.setRarity(slot0, slot1)
	slot2 = ccui.ImageView:create():align(cc.p(0.5, 0.5), 36, 164):addTo(slot1, 14, "rarity")
	slot2 = slot2.scale

	slot2(slot2, 0.62)

	uv2 = "ccui"

	slot2.callOrWhen(slot0.rarity, function (slot0)
		uv1 = "panel"
		slot1 = slot1.panel

		if not tonumber(slot0) then
			slot1:get("rarity"):hide()

			return
		end

		slot2 = slot1:get("rarity"):texture(ui.RARITY_ICON[slot0])
		slot2 = slot2.show

		slot2(slot2)

		uv2 = "panel"

		if not slot2.cardId then
			uv2 = "panel"
			slot2 = slot2.unitId
		end

		if isIdler(slot2) then
			slot2 = slot2:read() or slot2
		end

		slot4 = csv.unit[slot2]

		if csv.cards[slot2] then
			slot4 = csv.unit[slot3.unitID]
		end

		uv6 = "panel"

		if isIdler(slot6.advance) then
			uv5 = "panel"

			if not slot5.advance:read() then
				uv5 = "panel"
				slot5 = slot5.advance
			end
		end

		if not tonumber(slot5) then
			uv6 = "panel"
			slot6 = slot6.panel:get("imgBG")
			slot6 = slot6.texture

			slot6(slot6, ui.QUALITY_BOX[slot0 + 2])

			uv6 = "panel"

			slot6.panel:get("imgFG"):show():texture(string.format("common/icon/panel_icon_k%d.png", slot0 + 2))

			if slot4 and slot4.shiny then
				uv6 = "panel"
				slot6 = slot6.panel:get("imgBG")
				slot6 = slot6.texture

				slot6(slot6, string.format("common/icon/panel_shiny_icon_%d.png", slot0 + 2))

				uv6 = "panel"

				slot6.panel:get("imgFG"):texture(string.format("common/icon/panel_shiny_icon_k%d.png", slot0 + 2))
			end
		end
	end)
end

function slot1.setMaterial(slot0, slot1)
	slot2 = ccui.ImageView:create("common/txt/txt_sc.png"):align(cc.p(0.5, 0.5), 108, 178):addTo(slot1, 14, "material"):scale(0.64)
	slot2 = slot2.hide

	slot2(slot2)

	uv2 = "ccui"

	slot2.callOrWhen(slot0.unitId or slot0.cardId, function (slot0)
		slot2 = csv.cards[slot0]

		if csv.unit[slot0] then
			slot2 = csv.cards[slot1.cardID]
		end

		uv3 = "csv"

		slot3:get("material"):visible(slot2 and slot2.cardType == 2)
	end)
end

function slot1.setShiny(slot0, slot1)
	slot2 = ccui.ImageView:create("common/txt/txt_sg.png"):align(cc.p(0.5, 0.5), 108, 178):addTo(slot1, 14, "shiny"):scale(0.64)
	slot2 = slot2.hide

	slot2(slot2)

	uv2 = "ccui"

	slot2.callOrWhen(slot0.unitId or slot0.cardId, function (slot0)
		slot2 = csv.unit[slot0]

		if csv.cards[slot0] then
			slot2 = csv.unit[slot1.unitID]
		end

		uv3 = "csv"

		slot3:get("shiny"):visible(slot2 and slot2.shiny)
	end)
end

function slot1.testShowMaxStar(slot0, slot1)
	if not dev.DEBUG_SHOW then
		return
	end

	slot0.panel:removeChildByName("_maxStar_")

	if gGameModel.role:read("cards") then
		for slot9, slot10 in ipairs(slot3) do
			if gGameModel.cards:find(slot10) and csv.cards[slot11:read("card_id")].cardMarkID == (csv.unit[slot1] and csv.cards[csv.unit[slot1].cardID] and csv.cards[csv.unit[slot1].cardID].cardMarkID) then
				slot4 = math.max(0, slot11:read("star"))
			end
		end

		if slot4 > 0 then
			label.create(slot4 .. "星", {
				fontSize = 30,
				fontPath = "font/youmi1.ttf",
				color = ui.COLORS.NORMAL.DEFAULT,
				effect = {
					outline = {
						size = 3,
						color = ui.COLORS.NORMAL.WHITE
					}
				}
			}):addTo(slot2, 111, "_maxStar_"):xy(slot2:width() / 2, slot2:height() * 0.8):opacity(200)
		end
	end
end

function slot1.setKey(slot0, slot1)
	if not dev.SHOW_ITEM_ID then
		return
	end

	slot2 = slot0.panel
	slot3 = slot2:size()

	text.addEffect(slot2:get("_key_") or ccui.Text:create(slot1, ui.FONT_PATH, 32):align(cc.p(0.5, 1), slot3.width / 2, slot3.height - 15):addTo(slot2, 999, "_key_"), {
		outline = {
			size = 1,
			color = ui.COLORS.BLACK
		}
	})
end

return slot1
