slot0 = {
	gLanguageCsv.skinBuff1,
	gLanguageCsv.skinBuff2
}
slot1 = class("SkinAwardView", Dialog)
slot1.RESOURCE_FILENAME = "card_skin_reward.json"
slot1.RESOURCE_BINDING = {
	item = "item",
	itemAttr = "itemAttr",
	heroNode = "heroNode",
	imgLimitBg = "imgLimitBg",
	textName = "txtName",
	labelInfo = "labelInfo",
	panelNature = "panelNature",
	["panelNature.txtBuffObj"] = "txtBuffObj",
	["panelNature.infoList"] = {
		varname = "attrList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("skinNativeDatas"),
				item = bindHelper.self("itemAttr"),
				itemCell = bindHelper.self("item"),
				onItem = function (slot0, slot1, slot2, slot3)
					bind.extend(slot0, slot1, {
						class = "listview",
						props = {
							data = slot3,
							item = slot0.itemCell,
							onItem = function (slot0, slot1, slot2, slot3)
								slot4 = slot1:multiget("title", "num")

								slot4.title:text(getLanguageAttr(slot3.attrType))
								slot4.num:text("+" .. dataEasy.getAttrValueString(slot3.attrType, slot3.attrValue))
								adapt.oneLinePos(slot4.title, slot4.num, cc.p(5, 0), "left")

								if slot1:width() < slot4.title:width() + slot4.num:width() + 5 then
									slot1:width(slot8)
								end
							end
						}
					})
				end
			}
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2)
	slot0.skinID = slot1
	slot0.time = slot2 or 0
	slot0.skinNativeDatas = idlers.new({})
	slot0.skins = gGameModel.role:getIdler("skins")

	slot0:setSkinInfo()

	slot3 = slot0:getResourceNode()

	widget.addAnimationByKey(slot3, "effect/pifuhuoqu.skel", "pifuhuoqu", "effect", 1):anchorPoint(cc.p(0.5, 0.5)):scale(2):xy(slot3:width() / 2, slot3:height() / 2 - 40):addPlay("effect_loop")
	Dialog.onCreate(slot0)
end

function slot1.setSkinInfo(slot0)
	slot2 = {}
	slot3 = 0
	uv6 = "gSkinCsv"

	slot0.txtBuffObj:text(slot6[gSkinCsv[slot0.skinID].attrAddType])

	slot4 = {}

	for slot8 = 1, 6 do
		if slot8 % 3 == 1 then
			if slot8 > 3 then
				slot2[#slot2 + 1] = slot4
			end

			slot4 = {}
		end

		if slot1["attrType" .. slot8] and slot9 ~= 0 then
			table.insert(slot4, {
				attrType = slot9,
				attrValue = slot1["attrNum" .. slot8]
			})
		end
	end

	if #slot4 > 0 then
		slot2[#slot2 + 1] = slot4
	end

	slot0.skinNativeDatas:update(slot2)
	slot0.txtName:text(slot1.name)

	slot6 = csv.unit[dataEasy.getUnitId(nil, slot0.skinID)]
	slot0.cardSprite = widget.addAnimation(slot0.heroNode, slot6.unitRes, "standby_loop", 5):xy(slot0.heroNode:getContentSize().width / 2, 0)

	slot0.cardSprite:scale(slot6.scaleU * 3)
	slot0.cardSprite:setSkin(slot6.skin)

	slot8 = slot0.time ~= 0

	slot0.imgLimitBg:visible(slot8)
	slot0.labelInfo:visible(slot8)
	slot0.labelInfo:text(string.format(gLanguageCsv.skinTip04, slot0.time))

	if slot8 and slot0.skins:read()[slot0.skinID] == 0 then
		gGameUI:showTip(gLanguageCsv.skinTip08)
	end
end

function slot1.onClose(slot0)
	slot0:addCallbackOnExit(slot0.cb)
	Dialog.onClose(slot0)
end

return slot1
