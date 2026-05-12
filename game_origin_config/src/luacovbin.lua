slot1 = {}
slot2, slot3 = nil
slot4 = ([[
LuaCov %s - coverage analyzer for Lua scripts

Usage:
   luacov [options] [pattern...]

   Launch your Lua programs with -lluacov to perform accounting.
   Launch this script to generate a report from collected stats.
   By default it reports on every Lua file encountered running your
   script. To filter filenames, pass one or more Lua patterns matching
   files to be included in the command line, or use a config.

Options:
   -c filename, --config filename

      Use a config file, .luacov by default. For details see
      luacov.defaults module.

   -r name, --reporter name

      Use a custom reporter - a module in luacov.reporter.* namespace.

   -h, --help

      Show this help message and exit.

Examples:
   luacov foo/bar

      This will report only on modules in the foo/bar subtree.
]]):format(require("luacov.runner").version)

function slot5(slot0)
	if arg[slot0]:sub(1, 1) ~= "-" or #arg[slot0] == 1 then
		return nil, arg[slot0], slot0 + 1
	end

	if arg[slot0]:sub(2, 2) == "-" then
		slot1, slot2 = arg[slot0]:match("^%-%-([^=]+)=(.*)$")

		if slot1 then
			return slot1, slot2, slot0 + 1
		else
			return arg[slot0]:sub(3), arg[slot0 + 1], slot0 + 2
		end
	else
		slot1 = arg[slot0]:sub(2, 2)

		if #arg[slot0]:sub(3) == 0 then
			slot2 = arg[slot0 + 1]
		elseif slot2:sub(1, 1) == "=" then
			slot2 = slot2:sub(2)
		end

		return slot1, slot2, slot0 + 1
	end
end

function slot6(slot0)
	return slot0:gsub("\\", "/"):gsub("%.lua$", "")
end

slot7 = 1

while arg[slot7] do
	slot8, slot9 = nil
	slot10, slot9, slot7 = slot5(slot7)

	if slot10 then
		if slot8 == "h" or slot8 == "help" then
			print(slot4)
			os.exit(0)
		elseif slot8 == "c" or slot8 == "config" then
			slot2 = slot9
		elseif slot8 == "r" or slot8 == "reporter" then
			slot3 = slot9
		end
	else
		table.insert(slot1, slot6(slot9))
	end
end

slot8.include = slot0.load_config(slot2).include or {}
slot8.exclude = slot8.exclude or {}

for slot12, slot13 in ipairs(slot1) do
	table.insert(slot8.include, slot13)
end

slot8.reporter = slot3 or slot8.reporter

slot0.run_report(slot8)
