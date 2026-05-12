slot1 = require("3rd.zlib2").uncompress
slot2 = require("ffi")
slot3 = {
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	"X",
	"2",
	"F",
	"g",
	"I",
	"0",
	"L",
	"V",
	"4",
	"R",
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	"Z",
	"G",
	"y",
	"j",
	"v",
	"O",
	"B",
	"n",
	"f",
	"5",
	"d",
	"z",
	"h",
	"x",
	"8",
	"l",
	"P",
	"r",
	"E",
	"e",
	"s",
	"N",
	"3",
	"o",
	"6",
	"7",
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	"J",
	"S",
	"c",
	"u",
	"b",
	"w",
	"q",
	"H",
	"i",
	"T",
	"1",
	"m",
	"K",
	"Y",
	"W",
	"D",
	"C",
	"k",
	"Q",
	"M",
	"t",
	"U",
	"A",
	"9",
	"p",
	"a"
}

function slot4(slot0)
	uv1 = "new"
	slot2 = slot0
	slot1 = slot1(slot2)
	uv2 = "unsigned char[?]"
	slot3 = "unsigned char[?]"
	slot2 = slot2.new(slot3, #slot1 + 1)
	uv3 = "unsigned char[?]"
	slot6 = #slot1

	slot3.copy(slot2, slot1, slot6)

	slot2[#slot1] = 0

	for slot6 = 0, #slot1 - 1 do
		uv8 = "copy"

		if slot8[slot2[slot6]] then
			slot2[slot6] = string.byte(slot8)
		end
	end

	uv3 = "unsigned char[?]"

	return loadstring(slot3.string(slot2, #slot1), "battle__defines")
end

function globals.LoadPngData(slot0)
	xpcall(function ()
		uv0 = "hack"
		uv1 = "collectgarbage"

		slot0(slot1.hack)()
		collectgarbage()
	end, function (slot0)
		sendExceptionInMobile(slot0)
	end)
end
