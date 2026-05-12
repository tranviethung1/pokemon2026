slot0 = 2
slot1 = game.TOWN_CARD_STATE
slot2 = class("CardAttributeEnergyDetailView", cc.load("mvc").ViewBase)
slot2.RESOURCE_FILENAME = "card_town_energy_detail.json"
slot2.RESOURCE_BINDING = {
	["baseNode.detaill.allTimeNum"] = "allTimeNum",
	["baseNode.scroll"] = "scroll",
	["baseNode.detaill.tip"] = "tip",
	["baseNode.detaill"] = "detail",
	baseNode = "baseNode",
	["baseNode.detaill.speedNum"] = "speedNum"
}

function slot2.onCreate(slot0, slot1)
	slot3 = gGameModel.cards:find(slot1):read("card_id", "level", "star", "advance", "name")
	slot4 = nil
	slot6, slot7 = townDataEasy.getSkillCfg(csv.cards[slot3.card_id].townSkill, slot3.advance, slot3.star)
	slot8 = slot6 == nil

	slot0.scroll:visible(slot8)
	slot0.detail:visible(not slot8)

	if slot8 then
		slot0:initScroll()
	else
		slot0:initData(slot1)
	end
end

function slot2.initScroll(slot0)
	slot2 = beauty.textScroll({
		fontSize = 40,
		isRich = true,
		list = slot0.scroll,
		strs = gLanguageCsv.townHomeNoSkillInfo01 .. gLanguageCsv.townHomeNoSkillInfo02
	})

	slot0.scroll:y(slot0.scroll:y() - 20)

	slot3 = slot0.baseNode:size()

	slot0.baseNode:size(cc.size(slot3.width, slot3.height - 20))
end

function slot2.initData(slot0, slot1)
	slot2 = nil
	slot3 = 0
	slot4 = 0

	if gGameModel.town and gGameModel.town:read("cards")[slot1] then
		slot6 = gGameModel.town
		slot7 = slot6
		uv7 = "gGameModel"
		slot11 = 0
		uv11 = "town"

		if slot5[slot1].status <= slot11.REST then
			slot2 = gLanguageCsv.townHomeCardStatus02
			uv11 = "town"
			slot3 = math.floor(math.max(slot5[slot1].max_energy - slot5[slot1].energy - math.floor((time.getTime() - slot5[slot1].energy_refresh_time) / 3600 * slot4), slot11) / (slot5[slot1].status == slot11.REST and csv.town.home[slot6.read(slot7, "buildings")[slot7] and slot6.level or 1].reply or gCommonConfigCsv.townHomeEnergyRecovery) * 3600)
		else
			slot2 = gLanguageCsv.townRestWorking
			slot4 = gCommonConfigCsv.townHomeEnergyRecovery
			slot3 = -1
		end

		if slot3 >= 0 then
			bind.extend(slot0, slot0.allTimeNum, {
				class = "cutdown_label",
				props = {
					endTime = slot3 + time.getTime(),
					endFunc = function ()
					end
				}
			})
		else
			slot0.allTimeNum:text(gLanguageCsv.townHomeCardStatus03)
		end

		slot0.tip:visible(slot2 ~= nil)

		if slot2 then
			slot0.tip:text(string.format("(%s)", slot2))
		end

		slot0.speedNum:text(slot4 .. gLanguageCsv.townRestHour)

		return
	end

	slot0.speedNum:text(gCommonConfigCsv.townHomeEnergyRecovery .. gLanguageCsv.townRestHour)
	slot0.allTimeNum:text(time.getCutDown(0).str)
	slot0.tip:hide()
end

return slot2
