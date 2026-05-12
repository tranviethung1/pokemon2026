slot0 = class("TownFactoryAddEffectDetailView", cc.load("mvc").ViewBase)
slot0.RESOURCE_FILENAME = "town_factory_add_detail.json"
slot0.RESOURCE_BINDING = {
	["baseNode.txt"] = "txt",
	baseNode = "baseNode",
	["baseNode.bg"] = "bg"
}

function slot0.onCreate(slot0, slot1)
	slot2 = ""

	if slot1.normal > 0 and slot1.skill > 0 then
		slot2 = gLanguageCsv.townFactoryNormalAndSkillAddEffect .. time.getCutDown(slot1.normal + slot1.skill).str
	elseif slot1.normal > 0 then
		slot2 = gLanguageCsv.townFactoryNormalAddEffect .. time.getCutDown(slot1.normal).str
	elseif slot1.skill > 0 then
		slot2 = gLanguageCsv.townFactorySkillAddEffect .. time.getCutDown(slot1.skill).str
	end

	slot0.txt:text(slot2)
	slot0.bg:width(slot0.txt:width() + 50)
end

return slot0
