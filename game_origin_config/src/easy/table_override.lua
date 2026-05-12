globals = globals or _G
globals.lua_unpack = unpack
globals.lua_table_getn = table.getn
globals.lua_table_maxn = table.maxn
globals.lua_table_sort = table.sort
globals.lua_table_concat = table.concat
globals.lua_table_insert = table.insert
globals.lua_table_remove = table.remove

require("easy.table")

slot0 = table.getraw

print("table lib override for protected")

function unpack(slot0, ...)
	uv2 = "lua_unpack"

	return lua_unpack(slot2(slot0), ...)
end

function table.getn(slot0)
	uv2 = "lua_table_getn"

	return lua_table_getn(slot2(slot0))
end

function table.maxn(slot0)
	uv2 = "lua_table_maxn"

	return lua_table_maxn(slot2(slot0))
end

function table.concat(slot0, ...)
	uv2 = "lua_table_concat"

	return lua_table_concat(slot2(slot0), ...)
end
