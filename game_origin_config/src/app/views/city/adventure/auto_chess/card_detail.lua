slot0 = class("AutoChessCardDetailView", cc.load("mvc").ViewBase)
slot1 = require("app.views.city.adventure.auto_chess.tools")
slot2 = {
	GET = 0,
	CAN = 1,
	CANNOT = 2,
	NO_AWARD = 3
}
slot0.RESOURCE_FILENAME = "auto_chess_sprite_detail.json"
slot0.RESOURCE_BINDING = {
	["cardPanel.nodeStar1"] = "nodeStar1",
	cardPanel = "cardPanel",
	["cardPanel.nodeStar2"] = "nodeStar2",
	["cardPanel.btnAward2"] = "btnAward2",
	exitText = "exitText",
	["cardPanel.nodeStar4"] = "nodeStar4",
	["cardPanel.btnAward1"] = "btnAward1",
	["cardPanel.btnAward4"] = "btnAward4",
	["cardPanel.cardNode"] = "cardNode",
	unlockTips = {
		varname = "unlockTips",
		binds = {
			event = "effect",
			data = {
				outline = {
					size = 4,
					color = ui.COLORS.NORMAL.DEFAULT
				}
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	slot0.actionPos = {
		cc.p(slot0.nodeStar1:xy()),
		cc.p(slot0.nodeStar2:xy()),
		[4] = cc.p(slot0.nodeStar4:xy())
	}
	slot0.type = slot2
	slot0.data = slot1

	slot0.unlockTips:hide()

	if slot2 == 1 then
		slot0.cardID = slot1.id
		slot0.cardStar = slot1.star

		if not slot1.unlock then
			slot0.unlockTips:text(string.format(gLanguageCsv.autoChessCardUnlockTips, slot1.unlockLevel)):show()
		end

		slot0.exitText:show()
		slot0.cardNode:y(slot0.cardNode:y() - 100)
		slot0.nodeStar1:y(slot0.nodeStar1:y() - 100)
		slot0.nodeStar2:y(slot0.nodeStar2:y() - 100)
		slot0.nodeStar4:y(slot0.nodeStar4:y() - 100)
	else
		slot0.cardID = slot1.cfg.id
		slot0.cardStar = slot1.maxStar
		slot0.maxStar = slot1.maxStar

		if slot1.maxStar == 0 then
			slot0.cardStar = 1
		end

		slot0.exitText:hide()
	end

	slot0:updateNode()
end

function slot0.updateNode(slot0)
	slot1 = csv.auto_chess.cards[slot0.cardID]
	slot2 = 0

	slot0.cardNode:get("btnAward"):hide()

	if slot0.type == 2 then
		slot2 = slot0.cardStar <= slot0.maxStar and 0 or 2

		if slot0.data.cardType ~= 1 then
			slot0.cardNode:get("btnAward"):show()
			slot0:setBtnState(slot0.cardNode:get("btnAward"), 1)
			bind.touch(slot0, slot0.cardNode:get("btnAward"), {
				methods = {
					ended = function ()
						uv0 = "onItemAwardClick"

						slot0:onItemAwardClick(1)
					end
				}
			})
		end
	end

	bind.extend(slot0, slot0.cardNode:get("node"), {
		class = "auto_chess_card2",
		props = {
			cardResScale = 1.5,
			showKeyWords = true,
			id = slot0.cardID,
			star = slot0.cardStar,
			grayState = slot2,
			onNode = function (slot0)
				slot1 = slot0.scale

				slot1(slot0, 0.88)

				uv1 = "scale"
				slot1 = slot1.cardNode:get("node")
				slot1 = slot1.size

				slot1(slot1, slot0:box())

				uv1 = "scale"
				slot3 = true

				slot1.cardNode:get("node"):setTouchEnabled(slot3)

				uv3 = "scale"

				slot0:alignCenter(slot3.cardNode:get("node"):size())
			end
		}
	})

	slot3 = slot0.cardNode
	slot3 = slot3.visible

	slot3(slot3, slot0.data.cardType ~= 1)

	uv3 = "csv"
	slot3, slot4, slot5 = slot3.getCardType(slot0.cardID)
	slot6 = csvSize(slot5.keyWords) == 0
	slot7 = {
		330,
		1000,
		nil,
		1670
	}

	for slot11, slot12 in pairs(slot0.actionPos) do
		slot14 = 0

		slot0["nodeStar" .. slot11]:get("btnAward" .. slot11):hide()

		if slot0.type == 2 then
			slot14 = slot11 <= slot0.maxStar and 0 or 2
			slot15 = slot13:get("btnAward" .. slot11):show()

			slot0:setBtnState(slot15, slot11)
			bind.touch(slot0, slot15, {
				methods = {
					ended = function ()
						uv0 = "onItemAwardClick"
						uv2 = "onItemAwardClick"

						slot0:onItemAwardClick(slot2)
					end
				}
			})
		end

		bind.extend(slot0, slot13:get("node"), {
			class = "auto_chess_card2",
			props = {
				cardResScale = 1.5,
				id = slot0.cardID,
				star = slot11,
				showKeyWords = slot11 == 4,
				grayState = slot14,
				onNode = function (slot0)
					slot1 = slot0.scale

					slot1(slot0, 0.88)

					uv1 = "scale"
					slot1 = slot1:get("node")
					slot1 = slot1.size

					slot1(slot1, slot0:box())

					uv1 = "scale"
					slot3 = true

					slot1:get("node"):setTouchEnabled(slot3)

					uv3 = "scale"

					slot0:alignCenter(slot3:get("node"):size())
				end
			}
		})
		slot13:visible(slot0.data.cardType == 1)

		if slot6 then
			slot13:x(slot7[slot11])
		end
	end
end

function slot0.onItemAwardClick(slot0, slot1)
	slot3 = slot0
	uv3 = "isAwardCanGet"

	if slot0.isAwardCanGet(slot3, slot1) == slot3.CAN then
		gGameApp:requestServer("/game/auto_chess/handbook/award/get", function (slot0)
			gGameUI:showGainDisplay(slot0, {
				cb = function ()
					uv0 = "updateNode"

					slot0:updateNode()
				end
			})
		end, slot0.cardID, slot1)
	else
		slot3 = slot0
		uv3 = "isAwardCanGet"

		if slot0.isAwardCanGet(slot3, slot1) ~= slot3.NO_AWARD then
			gGameUI:stackUI("city.adventure.auto_chess.handbook_award_preview", nil, , {
				cardID = slot0.cardID,
				star = slot1,
				cardType = slot0.data.cardType
			})
		end
	end
end

function slot0.isAwardCanGet(slot0, slot1)
	slot2 = gGameModel.auto_chess:read("handbook")

	if slot0.data.cardType ~= 1 then
		slot1 = 4
	end

	uv3 = "gGameModel"
	slot3, slot4, slot5 = slot3.getCardType(slot0.cardID)

	if csvSize(csv.auto_chess.handbook_award[slot5.rarity]["star" .. slot1 .. "_award"]) == 0 then
		uv8 = "auto_chess"

		return slot8.NO_AWARD
	end

	if slot2[slot0.cardID] and slot2[slot0.cardID].award[slot1] then
		uv8 = "auto_chess"

		return slot8.GET
	end

	if slot2[slot0.cardID] and not slot2[slot0.cardID].award[slot1] then
		if slot0.data.cardType == 1 and slot0.maxStar < slot1 then
			uv8 = "auto_chess"

			return slot8.CANNOT
		end

		if csvSize(slot7["star" .. slot1 .. "_award"]) > 0 then
			uv8 = "auto_chess"

			return slot8.CAN
		end
	end

	uv8 = "auto_chess"

	return slot8.CANNOT
end

function slot0.setBtnState(slot0, slot1, slot2)
	slot1:hide()

	slot4 = slot0
	uv4 = "hide"

	if slot0.isAwardCanGet(slot4, slot2) == slot4.NO_AWARD then
		return
	end

	slot1:show()

	slot4 = slot1:get("spineNode")
	slot4 = slot4.removeChildByName

	slot4(slot4, "awardEffect" .. slot2)

	uv4 = "hide"

	if slot3 == slot4.CAN then
		slot4 = slot1:get("spineNode"):size()
		slot9 = "effect_loop"
		slot5 = widget.addAnimationByKey(slot1:get("spineNode"), "effect/jiedianjiangli.skel", "awardEffect" .. slot2, slot9, 100):xy(slot4.width / 2, slot4.height / 2 - 50):scale(0.5)
		uv9 = "hide"

		uiEasy.addVibrateToNode(slot0, slot1, slot3 == slot9.CAN, "btnAwardAction" .. slot2)
		slot1:get("imgGet"):hide()
	else
		uv4 = "hide"

		if slot3 == slot4.CANNOT then
			slot1:get("imgGet"):hide()
		else
			slot4 = slot1:get("imgGet")
			slot4 = slot4.show

			slot4(slot4)

			uv4 = "hide"

			slot1:get("bg"):show():color(slot3 == slot4.GET and cc.c3b(128, 128, 128) or cc.c3b(255, 255, 255))

			uv8 = "hide"

			uiEasy.addVibrateToNode(slot0, slot1, slot3 == slot8.CAN, "btnAwardAction" .. slot2)
		end
	end
end

return slot0
