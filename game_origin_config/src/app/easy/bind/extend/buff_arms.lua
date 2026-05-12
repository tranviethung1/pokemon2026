slot0 = require("easy.bind.helper")

function slot1(slot0)
	if isIdler(slot0) then
		return slot0:get_()
	end

	return slot0
end

slot2 = class("buffArms", cc.load("mvc").ViewBase)
slot2.defaultProps = {}

function slot2.initExtend(slot0)
	if slot0.panel then
		slot0.panel:removeFromParent()
	end

	slot1 = cc.size(150, 150)
	slot2 = ccui.Layout:create():anchorPoint(cc.p(0.5, 0.5)):size(slot1):xy(slot0:width() / 2, slot0:height() / 2):addTo(slot0, 1, "_buffArms_")
	slot0.panel = slot2
	slot0.buffImg = ccui.ImageView:create("config/embattle/icon_gh.png"):addTo(slot2, 10, "buffImg"):alignCenter(slot1):scale(2)
	slot4 = slot0.checkTeamBuffOpen

	slot4(slot0)

	uv4 = "panel"
	slot4 = slot4.callOrWhen

	slot4(slot0.battleCards, function (slot0)
		uv1 = "setBuff"

		slot1:setBuff()
	end, slot0, "battleCards")

	uv4 = "panel"
	slot4 = slot4.callOrWhen

	slot4(slot0.arms, function (slot0)
		uv1 = "setArms"

		slot1:setArms()
	end, slot0, "arms")

	uv4 = "panel"

	slot4.callOrWhen(slot0.idx, function ()
		uv0 = "setBuff"
		slot0 = slot0.setBuff

		slot0(slot0)

		uv0 = "setBuff"

		slot0:setArms()
	end, slot0, "idx")

	if slot0.onNode then
		slot0.onNode(slot2)
	end

	if slot0.panel:visible() and not slot0.noListener then
		slot0.panel:setTouchEnabled(true)
		bind.touch(slot0, slot0.panel, {
			methods = {
				ended = function ()
					uv0 = "onTeamBuffClick"

					slot0:onTeamBuffClick()
				end
			}
		})
	else
		slot0.panel:setTouchEnabled(false)
	end

	return slot0
end

function slot2.setBuff(slot0)
	if not slot0.buffOpen then
		return
	end

	uv1 = "buffOpen"
	slot2 = slot0.battleCards
	slot1 = slot1(slot2)
	uv2 = "buffOpen"
	slot2 = slot2(slot0.idx)

	if slot0.getBattleCardsEx then
		slot1 = slot0.getBattleCardsEx(dbid)
		slot2 = nil
	end

	for slot8 = 1, 6 do
		if slot0:getCardAttrsEx_(slot1[(slot2 and (slot2 - 1) * 6 or 0) + slot8]) then
			slot12 = csv.unit[csv.cards[slot10.card_id].unitID]
		end
	end

	slot5 = dataEasy.getTeamBuffBest({
		[slot8] = {
			slot12.natureType,
			slot12.natureType2
		}
	})

	slot0.buffImg:texture(slot5.buf.imgPath)

	slot0.teamBuffs = slot5

	if slot0.isRefresh then
		performWithDelay(slot0, function ()
			uv0 = "isRefresh"

			slot0.isRefresh:notify()
		end, 0.016666666666666666)
	end

	if slot0.redHintTag then
		slot0:setRedHint()
	end
end

function slot2.setArms(slot0)
	if not dataEasy.isUnlock(gUnlockCsv.arms) and not slot0.enemyData then
		return
	end

	uv1 = "dataEasy"

	if slot1(slot0.arms) == nil then
		return
	end

	uv2 = "dataEasy"

	if slot2(slot0.idx) and slot1[slot2] == nil then
		return
	end

	slot0.buffImg:scale(1.35)

	slot3 = slot0.panel

	slot3:show()

	if not slot3:get("armsBg") then
		ccui.ImageView:create("city/arms/di.png"):addTo(slot3, 11, "armsBg"):alignCenter(slot3:size())
	end

	if not slot3:get("arms1") then
		ccui.ImageView:create("city/arms/none.png"):addTo(slot3, 12, "arms1"):xy(33, 117)
	end

	if not slot3:get("arms2") then
		ccui.ImageView:create("city/arms/none.png"):addTo(slot3, 12, "arms2"):xy(117, 33)
	end

	slot4 = slot1[1] and slot1[1][1] or 0
	slot5 = slot1[2] and slot1[2][1] or 0
	slot5 = slot0:isHasArm(slot5) and slot5 or 0

	if (slot0:isHasArm(slot4) and slot4 or 0) == 0 then
		slot5 = slot4
		slot4 = slot5
	end

	if slot4 ~= 0 then
		slot3:get("arms1"):texture(string.format("city/arms/icon_%s.png", game.NATURE_TABLE[slot4]))
	else
		slot3:get("arms1"):texture("city/arms/none.png")
	end

	if slot5 ~= 0 then
		slot3:get("arms2"):texture(string.format("city/arms/icon_%s.png", game.NATURE_TABLE[slot5]))
	else
		slot3:get("arms2"):texture("city/arms/none.png")
	end
end

function slot2.isHasArm(slot0, slot1)
	if slot0.noListener then
		return true
	end

	if (gGameModel.role:read("arms_stage") or {})[slot1] then
		for slot7 = 1, slot3 do
			if gArmStage[slot1][slot7].skillID ~= 0 then
				return true
			end
		end
	end

	return false
end

function slot2.getCardAttrsEx_(slot0, slot1)
	if slot0.getCardAttrsEx then
		return slot0.getCardAttrsEx(slot1)
	end

	if gGameModel.cards:find(slot1) then
		slot3 = slot2:read("card_id", "skin_id", "fighting_point", "level", "star", "advance")
		slot3.dbid = slot1

		return slot3
	end

	return nil
end

function slot2.checkTeamBuffOpen(slot0)
	slot0.buffOpen = true

	for slot4, slot5 in csvPairs(csv.battle_card_halo) do
		if itertools.include(slot5.invalidScenes, slot0.sceneType) then
			slot0.buffOpen = false

			break
		end
	end

	slot0.panel:visible(slot0.buffOpen)
end

function slot2.onTeamBuffClick(slot0)
	slot1 = slot0.teamBuffs and slot0.teamBuffs.buf.teamBuffs or {}
	slot2 = slot0.arms

	if slot0.noTeamBuff then
		slot1 = nil
	end

	if slot0.noTeamArm then
		slot2 = nil
	end

	if slot0.redHintTag and slot0:isArmCanUp() then
		gGameModel.forever_dispatch:getIdlerOrigin("armRedHintTag"):modify(function (slot0)
			uv1 = "redHintTag"
			slot0[slot1.redHintTag] = true

			return true, slot0
		end, true)
	end

	uv9 = "teamBuffs"

	gGameUI:stackUI("city.card.embattle.attr_dialog", nil, {}, {
		teamBuffs = slot1,
		teamArms = slot2,
		idx = slot9(slot0.idx)
	})
end

function slot2.setRedHint(slot0)
	if not slot0:isArmCanUp() then
		return
	end

	uv1 = "isArmCanUp"

	if slot1(slot0.arms) == nil then
		return
	end

	if (slot1[1] and slot1[1][1] or 0) ~= 0 or (slot1[2] and slot1[2][1] or 0) ~= 0 then
		return
	end

	bind.extend(slot0, slot0.panel, {
		class = "red_hint",
		props = {
			specialTag = "armTag",
			listenData = {
				armTagName = slot0.redHintTag
			}
		}
	})
end

function slot2.isArmCanUp(slot0)
	if itertools.size(gGameModel.role:read("arms_stage") or {}) == 0 then
		return false
	end

	for slot5, slot6 in pairs(slot1) do
		for slot10, slot11 in orderCsvPairs(csv.arms.stage) do
			if slot11.armID == slot5 and slot11.stage <= slot6 and slot11.skillID ~= 0 then
				return true
			end
		end
	end

	return false
end

return slot2
