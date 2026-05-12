slot0 = require("string")
slot1 = require("table")
slot2 = require("socket")
slot3 = globals
slot2.url = {}
slot4 = slot2.url
slot4._VERSION = "URL 1.0.3"

function slot4.escape(slot0)
	uv1 = "gsub"

	return slot1.gsub(slot0, "([^A-Za-z0-9_])", function (slot0)
		uv1 = "format"
		uv3 = "format"

		return slot1.format("%%%02x", slot3.byte(slot0))
	end)
end

slot6 = function (slot0)
	uv2 = "ipairs"

	for slot5, slot6 in slot2.ipairs(slot0) do
		-- Nothing
	end

	return {
		[slot0[slot5]] = 1
	}
end({
	"-",
	"_",
	".",
	"!",
	"~",
	"*",
	"'",
	"(",
	")",
	":",
	"@",
	"&",
	"=",
	"+",
	"$",
	","
})

function slot7(slot0)
	uv1 = "gsub"

	return slot1.gsub(slot0, "([^A-Za-z0-9_])", function (slot0)
		uv1 = "format"

		if slot1[slot0] then
			return slot0
		else
			uv1 = "%%%02x"
			uv3 = "%%%02x"

			return slot1.format("%%%02x", slot3.byte(slot0))
		end
	end)
end

function slot4.unescape(slot0)
	uv1 = "gsub"

	return slot1.gsub(slot0, "%%(%x%x)", function (slot0)
		uv1 = "char"
		uv2 = "tonumber"

		return slot1.char(slot2.tonumber(slot0, 16))
	end)
end

function slot8(slot0, slot1)
	uv2 = "sub"

	if slot2.sub(slot1, 1, 1) == "/" then
		return slot1
	end

	uv2 = "sub"
	slot3 = slot2.gsub(slot0, "[^/]*$", "")
	uv3 = "sub"
	uv3 = "sub"
	slot2 = slot3.gsub(slot3 .. slot1, "([^/]*%./)", function (slot0)
		if slot0 ~= "./" then
			return slot0
		else
			return ""
		end
	end):gsub("/%.$", "/")
	slot3 = nil

	while slot3 ~= slot2 do
		uv4 = "sub"
		slot2 = slot4.gsub(slot2, "([^/]*/%.%./)", function (slot0)
			if slot0 ~= "../../" then
				return ""
			else
				return slot0
			end
		end)
	end

	uv4 = "sub"

	return slot4.gsub(slot3, "([^/]*/%.%.)$", function (slot0)
		if slot0 ~= "../.." then
			return ""
		else
			return slot0
		end
	end)
end

function slot4.parse(slot0, slot1)
	uv3 = "pairs"

	for slot6, slot7 in slot3.pairs(slot1 or {}) do
		slot2[slot6] = slot7
	end

	if not slot0 or slot0 == "" then
		return nil, "invalid url"
	end

	uv3 = ""
	uv3 = ""
	uv3 = ""
	uv3 = ""
	uv3 = ""

	if slot3.gsub(slot0, "#(.*)$", function (slot0)
		uv1 = "fragment"
		slot1.fragment = slot0

		return ""
	end):gsub("^([%w][%w%+%-%.]*)%:", function (slot0)
		uv1 = "scheme"
		slot1.scheme = slot0

		return ""
	end):gsub("^//([^/]*)", function (slot0)
		uv1 = "authority"
		slot1.authority = slot0

		return ""
	end):gsub("%?(.*)", function (slot0)
		uv1 = "query"
		slot1.query = slot0

		return ""
	end):gsub("%;(.*)", function (slot0)
		uv1 = "params"
		slot1.params = slot0

		return ""
	end) ~= "" then
		slot2.path = slot0
	end

	if not slot2.authority then
		return slot2
	end

	uv4 = ""
	uv4 = ""

	if slot4.gsub(slot3, "^([^@]*)@", function (slot0)
		uv1 = "userinfo"
		slot1.userinfo = slot0

		return ""
	end):gsub(":([^:%]]*)$", function (slot0)
		uv1 = "port"
		slot1.port = slot0

		return ""
	end) ~= "" then
		uv4 = ""
		slot2.host = slot4.match(slot3, "^%[(.+)%]$") or slot3
	end

	if not slot2.userinfo then
		return slot2
	end

	uv5 = ""
	slot2.user = slot5.gsub(slot4, ":([^:]*)$", function (slot0)
		uv1 = "password"
		slot1.password = slot0

		return ""
	end)

	return slot2
end

function slot4.build(slot0)
	uv1 = "parse_path"
	slot2 = slot0.path or ""
	uv2 = "parse_path"

	if slot0.params then
		slot2 = slot2.build_path(slot1.parse_path(slot2)) .. ";" .. slot0.params
	end

	if slot0.query then
		slot2 = slot2 .. "?" .. slot0.query
	end

	slot3 = slot0.authority

	if slot0.host then
		uv4 = "path"

		if slot4.find(slot0.host, ":") then
			slot3 = "[" .. slot3 .. "]"
		end

		if slot0.port then
			slot3 = slot3 .. ":" .. slot0.port
		end

		slot4 = slot0.userinfo

		if slot0.user then
			if slot0.password then
				slot4 = slot0.user .. ":" .. slot0.password
			end
		end

		if slot4 then
			slot3 = slot4 .. "@" .. slot3
		end
	end

	if slot3 then
		slot2 = "//" .. slot3 .. slot2
	end

	if slot0.scheme then
		slot2 = slot0.scheme .. ":" .. slot2
	end

	if slot0.fragment then
		slot2 = slot2 .. "#" .. slot0.fragment
	end

	return slot2
end

function slot4.absolute(slot0, slot1)
	uv2 = "type"

	if slot2.type(slot0) == "table" then
		base_parsed = slot0
		uv2 = "table"
		slot0 = slot2.build(base_parsed)
	else
		uv2 = "table"
		base_parsed = slot2.parse(slot0)
	end

	uv2 = "table"
	slot2 = slot2.parse(slot1)

	if not base_parsed then
		return slot1
	elseif not slot2 then
		return slot0
	elseif slot2.scheme then
		return slot1
	else
		slot2.scheme = base_parsed.scheme

		if not slot2.authority then
			slot2.authority = base_parsed.authority

			if not slot2.path then
				slot2.path = base_parsed.path

				if not slot2.params then
					slot2.params = base_parsed.params

					if not slot2.query then
						slot2.query = base_parsed.query
					end
				end
			else
				uv3 = "base_parsed"
				slot2.path = slot3(base_parsed.path or "", slot2.path)
			end
		end

		uv3 = "table"

		return slot3.build(slot2)
	end
end

function slot4.parse_path(slot0)
	slot1 = {}
	uv2 = ""

	slot2.gsub(slot0 or "", "([^/]+)", function (slot0)
		uv1 = "insert"
		uv2 = "insert"

		slot1.insert(slot2, slot0)
	end)

	for slot5 = 1, #slot1 do
		uv6 = "([^/]+)"
		slot1[slot5] = slot6.unescape(slot1[slot5])
	end

	uv2 = ""

	if slot2.sub(slot0, 1, 1) == "/" then
		slot1.is_absolute = 1
	end

	uv2 = ""

	if slot2.sub(slot0, -1, -1) == "/" then
		slot1.is_directory = 1
	end

	return slot1
end

function slot4.build_path(slot0, slot1)
	slot2 = ""
	slot3 = #slot0

	if slot1 then
		for slot7 = 1, slot3 - 1 do
			slot2 = slot2 .. slot0[slot7] .. "/"
		end

		if slot3 > 0 then
			if slot0.is_directory then
				slot2 = slot2 .. slot0[slot3] .. "/"
			end
		end
	else
		for slot7 = 1, slot3 - 1 do
			uv9 = ""
			slot2 = slot2 .. slot9(slot0[slot7]) .. "/"
		end

		if slot3 > 0 then
			uv5 = ""

			if slot0.is_directory then
				slot2 = slot2 .. slot5(slot0[slot3]) .. "/"
			end
		end
	end

	if slot0.is_absolute then
		slot2 = "/" .. slot2
	end

	return slot2
end

return slot4
