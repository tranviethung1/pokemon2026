return {
	setAttrPanel = function (slot0, slot1, slot2, slot3)
		slot4 = slot0:multiget("imgAttr", "textName", "textNum")

		slot4.imgAttr:texture(slot1)
		slot4.textName:text(slot2)
		slot4.textNum:text("+" .. slot3)
		adapt.oneLinePos(slot4.imgAttr, slot4.textName, cc.p(25, 0))
		adapt.oneLinePos(slot4.textName, slot4.textNum, cc.p(15, 0))
	end,
	getStarAttrData = function (slot0)
		slot1 = gPokedexDevelop[slot0][1].attrType1
		slot3 = gLanguageCsv["attr" .. string.caption(game.ATTRDEF_TABLE[slot1])]
		slot4 = ui.ATTR_LOGO[game.ATTRDEF_TABLE[slot1]]
		slot5 = "0%"
		slot6, slot7, slot8 = dataEasy.getCardMaxStar(slot0)

		if slot6 > 0 then
			slot5 = gPokedexDevelop[slot0][slot6].attrValue1
		end

		return slot4, slot3, slot5
	end
}
