slot0 = {}
slot1 = require("luacov.runner")
slot2 = require("luacov.util")

function slot3(slot0, slot1, slot2)
	return slot0:gsub(slot1:gsub("%p", "%%%0"), slot2:gsub("%%", "%%%%"))
end

slot4 = {
	{
		"=",
		" ?= ?"
	},
	{
		"(",
		" ?%( ?"
	},
	{
		")",
		" ?%) ?"
	},
	{
		"<FULLID>",
		"x ?[%[%.]? ?[ntfx0']* ?%]?"
	},
	{
		"<IDS>",
		"x ?, ?x[x, ]*"
	},
	{
		"<FIELDNAME>",
		"%[? ?[ntfx0']+ ?%]?"
	},
	{
		"<PARENS>",
		"[ %(]*"
	}
}

function slot5(slot0)
	uv2 = "ipairs"

	for slot4, slot5 in ipairs(slot2) do
		uv6 = "ipairs"
		slot0 = slot6(slot0, slot5[1], slot5[2])
	end

	return slot0
end

slot6 = {
	"",
	"end[,; %)]*",
	"else",
	"repeat",
	"do",
	"if",
	"then",
	"while t do",
	"if t then",
	"local x",
	slot5("local x="),
	slot5("local <IDS>"),
	slot5("local <IDS>="),
	"local function x"
}
slot7 = {
	"[ntfx0',= ]+,",
	"{ ?} ?,",
	slot5("<FIELDNAME>=.+[,;]"),
	slot5("<FIELDNAME>=function"),
	slot5("<FIELDNAME>=<PARENS>'"),
	"return function",
	"function",
	"function x",
	"function x.x",
	"[ntfx0]",
	"''",
	"{ ?}",
	slot5("<FULLID>"),
	slot5("local x=function"),
	slot5("local x=<PARENS>'"),
	slot5("local x=(<PARENS>"),
	slot5("local <IDS>=(<PARENS>"),
	slot5("local x=n"),
	slot5("<FULLID>=<PARENS>'"),
	slot5("<FULLID>=function"),
	"} ?,",
	"} ?, ?function",
	"break",
	"{",
	"}?[ %)]*",
	"[ntf0']+ ?}[ %)]*"
}

function slot8(slot0, slot1)
	for slot5, slot6 in ipairs(slot0) do
		if slot1:match("^ *" .. slot6 .. " *$") then
			return true
		end
	end

	return false
end

slot9 = {
	__index = slot9,
	new = function (slot0)
		return setmetatable({
			first = true,
			comment = false,
			after_function = false
		}, slot0)
	end,
	find = function (slot0, slot1)
		return slot0.line:find(slot1, slot0.i)
	end,
	skip_string = function (slot0)
		slot1, slot2 = slot0:find("^(\\*)%1" .. slot0.quote)

		if not slot2 then
			slot1, slot2 = slot0:find("[^\\](\\*)%1" .. slot0.quote)
		end

		if slot2 then
			slot0.i = slot2 + 1
			slot0.quote = nil

			table.insert(slot0.simple_line_buffer, "'")

			return true
		else
			return false
		end
	end,
	skip_long_string = function (slot0)
		slot1, slot2 = slot0:find("%]" .. slot0.equals .. "%]")

		if slot2 then
			slot0.i = slot2 + 1
			slot0.equals = nil

			if slot0.comment then
				slot0.comment = false
			else
				table.insert(slot0.simple_line_buffer, "'")
			end

			return true
		else
			return false
		end
	end,
	skip_args = function (slot0)
		slot1, slot2 = slot0:find("%)")

		if slot2 then
			slot0.i = slot2 + 1
			slot0.args = nil

			return true
		else
			return false
		end
	end,
	skip_whitespace = function (slot0)
		if (slot0:find("%S") or #slot0.line + 1) ~= slot0.i then
			slot0.i = slot1

			table.insert(slot0.simple_line_buffer, " ")
		end
	end,
	skip_number = function (slot0)
		if slot0:find("^0[xX]") then
			slot0.i = slot0.i + 2
		end

		slot1 = nil
		slot1, slot1, slot0.i = slot0:find("^[%x%.]*()")

		if slot0:find("^[eEpP][%+%-]") then
			slot0.i = slot0.i + 2
			slot1, slot1, slot0.i = slot0:find("^[%x%.]*()")
		end

		slot1, slot1, slot0.i = slot0:find("^[iull]*()")

		table.insert(slot0.simple_line_buffer, "0")
	end
}
slot10 = {
	["false"] = "f",
	["nil"] = "n",
	["true"] = "t",
	[slot15] = slot15
}

for slot14, slot15 in ipairs({
	"and",
	"break",
	"do",
	"else",
	"elseif",
	"end",
	"for",
	"function",
	"goto",
	"if",
	"in",
	"local",
	"not",
	"or",
	"repeat",
	"return",
	"then",
	"until",
	"while"
}) do
	-- Nothing
end

function slot9.skip_name(slot0)
	slot1, slot2, slot3 = slot0:find("^([%w_]*)")
	slot4 = slot0.i + #slot3
	slot0.i = slot4
	uv4 = "find"

	if slot4[slot3] then
		uv4 = "find"
		slot3 = slot4[slot3]
	else
		slot3 = "x"
	end

	table.insert(slot0.simple_line_buffer, slot3)

	if slot3 == "function" then
		slot0.after_function = true
	end
end

function slot9.consume(slot0, slot1)
	if slot0.first then
		slot0.first = false

		if slot1:match("^#!") then
			return true, true
		end
	end

	slot0.line = slot1
	slot0.simple_line_buffer = {}
	slot0.i = 1

	while slot0.i <= #slot1 do
		if slot0.quote then
			if not slot0:skip_string() then
				break
			end
		elseif slot0.equals then
			if not slot0:skip_long_string() then
				break
			end
		elseif slot0.args then
			if not slot0:skip_args() then
				break
			end
		else
			slot0:skip_whitespace()

			if slot0:find("^%.%d") then
				slot0.i = slot0.i + 1
			end

			if slot0:find("^%d") then
				slot0:skip_number()
			elseif slot0:find("^[%a_]") then
				slot0:skip_name()
			else
				if slot0:find("^%-%-") then
					slot0.comment = true
					slot0.i = slot0.i + 2
				end

				slot2, slot3, slot4 = slot0:find("^%[(=*)%[")

				if slot4 then
					slot0.i = slot3 + 1
					slot0.equals = slot4

					if not slot0.comment then
						table.insert(slot0.simple_line_buffer, "'")
					end
				elseif slot0.comment then
					slot0.comment = false

					break
				elseif slot1:sub(slot0.i, slot0.i) == "." then
					slot6, slot7, slot8 = slot0:find("^(%.*)")
					slot0.i = slot0.i + #slot8

					table.insert(slot0.simple_line_buffer, slot8)
				else
					slot0.i = slot0.i + 1

					if slot5 == "'" or slot5 == "\"" then
						table.insert(slot0.simple_line_buffer, "'")

						slot0.quote = slot5
					elseif slot0.after_function and slot5 == "(" then
						slot0.after_function = false
						slot0.args = true
					else
						table.insert(slot0.simple_line_buffer, slot5)
					end
				end
			end
		end
	end

	slot3 = slot0.simple_line_buffer
	slot2 = table.concat(slot3)
	uv3 = "first"
	uv4 = "match"
	slot5 = slot2
	uv4 = "first"
	uv5 = "^#!"

	return slot3(slot4, slot5), slot4(slot5, slot2)
end

slot10 = {
	__index = slot10
}

function slot10.new(slot0, slot1)
	if not require("luacov.stats").load(slot1.statsfile) then
		return nil, "Could not load stats file " .. slot1.statsfile .. "."
	end

	slot4 = {}
	slot5 = {}
	slot6 = 0

	for slot10, slot11 in pairs(slot3) do
		uv12 = "require"

		if slot12.file_included(slot10) then
			uv12 = "require"

			if slot5[slot12.real_name(slot10)] then
				uv12 = "require"

				slot12.update_stats(slot5[slot10], slot11)
			else
				table.insert(slot4, slot10)

				slot5[slot10] = slot11
			end

			slot6 = math.max(slot6, slot5[slot10].max_hits)
		end
	end

	table.sort(slot4)

	slot7, slot8 = io.open(slot1.reportfile, "w")

	if not slot7 then
		return nil, slot8
	end

	print("=== LuaCov report to", slot1.reportfile)

	return setmetatable({
		_out = slot7,
		_cfg = slot1,
		_data = slot5,
		_files = slot4,
		_mhit = slot6
	}, slot0)
end

function slot10.config(slot0)
	return slot0._cfg
end

function slot10.max_hits(slot0)
	return slot0._mhit
end

function slot10.write(slot0, ...)
	return slot0._out:write(...)
end

function slot10.close(slot0)
	slot0._out:close()

	slot0._private = nil
end

function slot10.files(slot0)
	return slot0._files
end

function slot10.stats(slot0, slot1)
	return slot0._data[slot1]
end

function slot10.on_start(slot0)
end

function slot10.on_new_file(slot0, slot1)
end

function slot10.on_file_error(slot0, slot1, slot2, slot3)
end

function slot10.on_empty_line(slot0, slot1, slot2, slot3)
end

function slot10.on_mis_line(slot0, slot1, slot2, slot3)
end

function slot10.on_hit_line(slot0, slot1, slot2, slot3, slot4)
end

function slot10.on_end_file(slot0, slot1, slot2, slot3)
end

function slot10.on_end(slot0)
end

slot12 = nil

if pcall(require, "cluacov.version") then
	slot12 = require("cluacov.deepactivelines")
end

function slot10._run_file(slot0, slot1)
	slot2, slot3 = io.open(slot1)

	if not slot2 then
		uv8 = "io"

		slot0:on_file_error(slot1, "open", slot8.unprefix(slot3, slot1 .. ": "))

		return
	end

	slot4 = nil
	uv5 = "open"

	if slot5 then
		slot5, slot6 = slot2:read("*a")

		if not slot5 then
			slot0:on_file_error(slot1, "read", slot6)

			return
		end

		uv7 = "io"
		slot7, slot8 = slot7.load_string(slot5, nil, "@file")

		if not slot7 then
			uv14 = "io"

			slot0:on_file_error(slot1, "load", "line " .. slot14.unprefix(slot8, "file:"))

			return
		end

		uv9 = "on_file_error"
		slot4 = slot9.get(slot7)

		slot2:seek("set")
	end

	slot0:on_new_file(slot1)

	slot5 = 0
	slot6 = 0
	slot9 = slot1
	slot7 = slot0:stats(slot9)
	slot8 = 1
	uv9 = "unprefix"
	slot9 = slot9:new()

	while true do
		if not slot2:read("*l") then
			break
		end

		slot11, slot12 = slot9:consume(slot10)
		uv15 = "open"

		if slot15 then
			slot14 = not slot11 and (not slot12 or (slot7[slot8] or 0) ~= 0) and slot4[slot8]
		end

		if slot14 then
			if slot13 == 0 then
				slot0:on_mis_line(slot1, slot8, slot10)

				slot6 = slot6 + 1
			else
				slot0:on_hit_line(slot1, slot8, slot10, slot13)

				slot5 = slot5 + 1
			end
		else
			slot0:on_empty_line(slot1, slot8, slot10)
		end

		slot8 = slot8 + 1
	end

	slot2:close()
	slot0:on_end_file(slot1, slot5, slot6)
end

function slot10.run(slot0)
	slot0:on_start()

	for slot4, slot5 in ipairs(slot0:files()) do
		slot0:_run_file(slot5)
	end

	slot0:on_end()
end

slot11 = setmetatable({}, slot10)
slot11.__index = slot11

function slot11.on_start(slot0)
	slot2 = #("%d"):format(slot0:max_hits())
	slot0._summary = {}
	slot0._empty_format = (" "):rep(slot2 + 1)
	slot0._zero_format = ("*"):rep(slot2) .. "0"
	slot0._count_format = ("%% %dd"):format(slot2 + 1)
	slot0._printed_first_header = false
end

function slot11.on_new_file(slot0, slot1)
	if slot0._cfg.onlysummary then
		return
	end

	slot0:write(("="):rep(78), "\n")
	slot0:write(slot1, "\n")

	if slot0:stats(slot1).version then
		slot0:write(slot2.version, "\n")
	end

	slot0:write(("="):rep(78), "\n")
end

function slot11.on_file_error(slot0, slot1, slot2, slot3)
	io.stderr:write(("Couldn't %s %s: %s\n"):format(slot2, slot1, slot3))
end

function slot11.on_empty_line(slot0, slot1, slot2, slot3)
	if slot0._cfg.onlysummary then
		return
	end

	if slot3 == "" then
		slot0:write("\n")
	else
		slot0:write(slot0._empty_format, " ", slot3, "\n")
	end
end

function slot11.on_mis_line(slot0, slot1, slot2, slot3)
	if slot0._cfg.onlysummary then
		return
	end

	slot0:write(slot0._zero_format, " ", slot3, "\n")
end

function slot11.on_hit_line(slot0, slot1, slot2, slot3, slot4)
	if slot0._cfg.onlysummary then
		return
	end

	slot0:write(slot0._count_format:format(slot4), " ", slot3, "\n")
end

function slot11.on_end_file(slot0, slot1, slot2, slot3)
	slot0._summary[slot1] = {
		hits = slot2,
		miss = slot3
	}

	if slot0._cfg.onlysummary then
		return
	end

	slot0:write("\n")
end

function slot12(slot0, slot1)
	if slot0 + slot1 == 0 then
		slot2 = 1
	end

	return ("%.2f%%"):format(slot0 / slot2 * 100)
end

function slot11.on_end(slot0)
	slot0:write(("="):rep(78), "\n")
	slot0:write("Summary\n")
	slot0:write(("="):rep(78), "\n")
	slot0:write("\n")

	slot1 = {
		{
			"File",
			"Hits",
			"Missed",
			"Coverage"
		}
	}

	for slot7, slot8 in ipairs(slot0:files()) do
		if slot0._summary[slot8] then
			slot10 = slot9.hits
			slot11 = slot9.miss
			slot15 = tostring(slot9.miss)
			uv15 = "write"

			table.insert(slot1, {
				slot8,
				tostring(slot9.hits),
				slot15,
				slot15(slot10, slot11)
			})

			slot2 = 0 + slot10
			slot3 = 0 + slot11
		end
	end

	slot7 = tostring(slot3)
	uv7 = "write"
	slot8 = slot2
	slot9 = slot3

	table.insert(slot1, {
		"Total",
		tostring(slot2),
		slot7,
		slot7(slot8, slot9)
	})

	slot4 = {}

	for slot8, slot9 in ipairs(slot1) do
		for slot13, slot14 in ipairs(slot9) do
			slot4[slot13] = math.max(slot4[slot13] or -1, #slot14)
		end
	end

	for slot9, slot10 in ipairs(slot4) do
		slot5 = #slot4 - 1 + slot10
	end

	for slot9, slot10 in ipairs(slot1) do
		if slot9 == #slot1 or slot9 == 2 then
			slot0:write(("-"):rep(slot5), "\n")
		end

		for slot14, slot15 in ipairs(slot10) do
			slot0:write(slot15)

			if slot14 == #slot10 then
				slot0:write("\n")
			else
				slot0:write((" "):rep(slot4[slot14] - #slot15 + 1))
			end
		end
	end
end

function slot0.report(slot0)
	uv1 = "load_config"
	slot1 = slot1.load_config()

	if not slot0 then
		uv0 = "new"
	end

	slot2, slot3 = slot0:new(slot1)

	if not slot2 then
		print(slot3)
		print("Run your Lua program with -lluacov and then rerun luacov.")
		os.exit(1)
	end

	slot2:run()
	slot2:close()

	if slot1.deletestats then
		os.remove(slot1.statsfile)
	end
end

slot0.ReporterBase = slot10
slot0.DefaultReporter = slot11
slot0.LineScanner = slot9

return slot0
