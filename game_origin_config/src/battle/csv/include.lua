globals.battleCsv = {}

function battleCsv.exportToCsvCls(slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if slot6 == 0 then
			assert(slot0[slot5] == nil, "exportToCsvCls function " .. slot5 .. " is in csv")

			slot0[slot5] = function (slot0, ...)
				uv2 = "model"

				return slot0.model[slot2](slot0.model, ...)
			end
		else
			slot0[slot5] = function (slot0, ...)
				uv2 = "model"

				if battleCsv.Model2CsvCls[type(slot0.model[slot2](slot0.model, ...))] then
					return slot2.new(slot1)
				end

				return slot1
			end
		end
	end
end

function battleCsv.newCsvCls(slot0)
	slot1 = setmetatable({}, {
		__newindex = function (slot0, slot1, slot2)
			if type(slot2) == "function" then
				slot2 = functools.wrap(slot2, function (slot0, slot1, ...)
					if not slot1.model then
						uv2 = "model"
						uv3 = "ignoreModelCheck"

						if slot2.ignoreModelCheck[slot3] then
							return slot0(slot1, ...)
						end
					end

					return 0
				end)
			end

			rawset(slot0, slot1, slot2)
		end
	})
	slot1.__cname = slot0
	slot1.__index = slot1
	slot1.ignoreModelCheck = {}

	rawset(slot1, "newWithCache", function (slot0)
		if slot0 and slot0:getCsvObject() then
			return slot1
		end

		slot1 = {
			model = slot0
		}

		if slot0 then
			slot0:setCsvObject(slot1)
		end

		uv4 = "getCsvObject"

		return setmetatable(slot1, slot4)
	end)

	return slot1
end

require("battle.csv.data")
require("battle.csv.buff")
require("battle.csv.scene")
require("battle.csv.skill")
require("battle.csv.object")
require("battle.csv.export")

battleCsv.NilBuff = battleCsv.CsvBuff.newWithCache()
battleCsv.NilSkill = battleCsv.CsvSkill.newWithCache()
battleCsv.NilObject = battleCsv.CsvObject.newWithCache()
