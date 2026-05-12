slot0 = AutoChessCsv.newCsvCls("CsvBuff")
AutoChessCsv.CsvBuff = slot0

function slot0.getValue(slot0)
	return slot0.model.value
end

function slot0.group(slot0)
	return slot0.model:group()
end

function slot0.getCfgId(slot0)
	return slot0.model.cfgId
end
