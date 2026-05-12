slot0 = require("easy.bind.helper")
slot1 = class("equipIcon", cc.load("mvc").ViewBase)
slot1.defaultProps = {
	selected = false
}

function slot1.initExtend(slot0)
	if slot0.panel then
		slot0.panel:removeFromParent()
	end

	slot1 = cc.size(198, 198)
	slot2 = ccui.Layout:create():size(198, 198):addTo(slot0, 1, "_equip_")
	slot3 = ccui.ImageView:create(ui.QUALITY_BOX[1]):alignCenter(slot1):addTo(slot2, 1)
	slot4 = ccui.ImageView:create("common/box/box_selected.png"):alignCenter(slot1):visible(slot0.selected):addTo(slot2, -1, "imgSel")
	slot5 = ccui.ImageView:create("common/icon/icon_up.png"):alignCenter(slot1):xy(150, 150):visible(true):addTo(slot2, 5, "imgArrow")
	slot0.panel = slot2
	slot6 = slot2:size()
	slot7 = ccui.ImageView:create():xy(30, 99):addTo(slot2, 3, "frame")
	slot8 = ccui.ImageView:create():alignCenter(slot1):scale(2):addTo(slot2, 2, "icon")

	if not slot2:get("txtLv") then
		text.addEffect(cc.Label:createWithTTF(gLanguageCsv.textLv1, ui.FONT_PATH, 24):align(cc.p(0, 0), 90, 30):addTo(slot2, 2, "txtLv"), {
			outline = {
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		})
	end

	if not slot2:get("txtLvNum") then
		text.addEffect(cc.Label:createWithTTF("", ui.FONT_PATH, 30):align(cc.p(0, 0), 25, 30):addTo(slot2, 2, "txtLvNum"), {
			outline = {
				color = ui.COLORS.OUTLINE.DEFAULT
			}
		})
	end

	uv11 = "panel"

	slot11.callOrWhen(slot0.data, function (slot0)
		uv1 = "panel"
		slot2 = csv.equips[slot0.equip_id]
		slot3 = dataEasy.getQuality(slot0.advance)
		slot5 = ui.QUALITY_FRAME[slot3]
		uv6 = "csv"
		slot6 = slot6.texture

		slot6(slot6, ui.QUALITY_BOX[slot3])

		uv6 = "equips"

		slot6:texture(slot0.awake ~= 0 and slot2.icon2 or slot2.icon)

		slot6 = slot1.panel:get("txtLvNum")
		slot7 = slot6
		slot8 = slot0.level

		slot6.text(slot7, slot8)

		uv7 = "equip_id"
		uv8 = "dataEasy"

		adapt.oneLinePos(slot7, slot8, cc.p(0, 0), "left")

		if matchLanguage({
			"en"
		}) then
			uv6 = "dataEasy"
			slot7 = slot6
			slot8 = 25

			slot6.x(slot7, slot8)

			uv7 = "dataEasy"
			uv8 = "equip_id"

			adapt.oneLinePos(slot7, slot8, cc.p(0, 0), "left")
		end

		if slot0.ability and slot0.ability > 0 then
			uv6 = "panel"

			slot6:setAbility(slot1, slot0.ability)
		else
			uv6 = "panel"

			slot6:setStar(slot1, slot0.star)
		end

		if slot0.awake_ability and slot0.awake_ability > 0 then
			uv6 = "panel"

			slot6:setAwakeAbilityInfo(slot1, slot0.awake_ability)
		else
			uv6 = "panel"

			slot6:setAwakeInfo(slot1, slot0.awake)
		end
	end)

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

function slot1.setStar(slot0, slot1, slot2)
	slot7 = 4

	ccui.Layout:create():size(slot1:size().width, 70):align(cc.p(0, 0), 0, 0):addTo(slot1, slot7, "star")
	slot1:get("star"):removeAllChildren()

	for slot7 = 1, slot2 do
		ccui.ImageView:create("city/card/equip/icon_star.png"):xy(99 - 12 * (slot2 + 1 - 2 * slot7), 25):addTo(slot1:get("star"), 4, "star"):scale(0.8)
	end
end

function slot1.setAbility(slot0, slot1, slot2)
	ccui.Layout:create():size(slot1:size().width, 70):align(cc.p(0, 0), 0, 0):addTo(slot1, 4, "star")
	slot1:get("star"):removeAllChildren()
	ccui.ImageView:create("city/card/equip/icon_xx_d.png"):xy(100, 25):addTo(slot1:get("star"), 4, "starbg"):scale(0.8)
	text.addEffect(cc.Label:createWithTTF(slot2, "font/youmi1.ttf", 30):align(cc.p(1, 0), slot2 >= 10 and 116 or 108, 5):addTo(slot1:get("star"), 4, "starnum"), {
		outline = {
			size = 2,
			color = cc.c3b(179, 68, 48)
		}
	})
end

function slot1.setAwakeInfo(slot0, slot1, slot2)
	if slot2 <= 0 then
		slot1:removeChildByName("_awakeInfo")

		return
	end

	if not slot1:getChildByName("_awakeInfo") then
		slot4 = ccui.Layout:create():size(128, 48):anchorPoint(0.5, 0.5):xy(50, slot1:size().height - 18):addTo(slot1, 6, "_awakeInfo")

		ccui.ImageView:create("city/card/equip/logo_jxbs.png"):xy(80, 24):addTo(slot4, 1)
		cc.Label:createWithTTF(str, "font/youmi1.ttf", 34):color(cc.c4b(252, 249, 203, 255)):xy(80, 24):addTo(slot4, 2, "_awakeStr")
	end

	slot5 = slot4:getChildByName("_awakeStr")

	slot5:text(string.format(gLanguageCsv.awakeLevel, gLanguageCsv["symbolRome" .. slot2] or ""))
	adapt.setTextScaleWithWidth(slot5, nil, 100)
end

function slot1.setAwakeAbilityInfo(slot0, slot1, slot2)
	if slot2 <= 0 then
		slot1:removeChildByName("_awakeAbilityInfo")

		return
	end

	if not slot1:getChildByName("_awakeAbilityInfo") then
		slot4 = ccui.Layout:create():size(128, 48):anchorPoint(0.5, 0.5):xy(50, slot1:size().height - 18):addTo(slot1, 6, "_awakeAbilityInfo")
		slot5 = ccui.Scale9Sprite:create()

		slot5:initWithFile(cc.rect(36, 24, 1, 1), "city/card/equip/box_spjx_d.png")
		slot5:size(150, 50):anchorPoint(0.5, 0.5):xy(90, 24):addTo(slot4)
		cc.Label:createWithTTF(str, "font/youmi1.ttf", 34):color(cc.c4b(252, 249, 203, 255)):xy(85, 24):addTo(slot4, 2, "_awakeAbilityStr")
	end

	slot5 = slot4:getChildByName("_awakeAbilityStr")

	slot5:text(gLanguageCsv.awake .. " +" .. slot2)
	text.addEffect(slot5, {
		outline = {
			size = 2,
			color = cc.c4b(188, 70, 49, 255)
		}
	})
end

return slot1
