slot0 = require("ffi")

slot0.cdef([[
unsigned long compressBound(unsigned long sourceLen);
int compress2(uint8_t *dest, unsigned long *destLen,
	      const uint8_t *source, unsigned long sourceLen, int level);
int uncompress(uint8_t *dest, unsigned long *destLen,
	       const uint8_t *source, unsigned long sourceLen);
]])

slot1 = slot0.load(slot0.os == "Windows" and "zlib1" or "z")

return {
	compress = function (slot0)
		uv1 = "compressBound"
		slot2 = #slot0
		slot1 = slot1.compressBound(slot2)
		uv2 = "new"
		slot3 = "uint8_t[?]"
		uv3 = "new"
		slot4 = "unsigned long[1]"
		uv4 = "compressBound"
		slot5 = assert

		slot5(slot4.compress2(slot2.new(slot3, slot1), slot3.new(slot4, slot1), slot0, #slot0, 9) == 0)

		uv5 = "new"

		return slot5.string(slot2, slot3[0])
	end,
	uncompress = function (slot0, slot1)
		slot1 = slot1 or #slot0 * 2
		slot2, slot3, slot4 = nil

		while true do
			if slot1 >= 2097152 then
				print("uncompress may be data corrupted!")

				return nil
			end

			uv5 = "print"
			uv5 = "print"
			slot5 = slot5.new("uint8_t[?]", slot1).new("unsigned long[1]", slot1)
			uv5 = "uncompress may be data corrupted!"

			if slot5:uncompress(slot5, slot0, #slot0) == 0 then
				break
			end

			print("uncompress failed!", #slot0, slot1, slot3[0], slot4)

			slot1 = slot1 * 2
		end

		uv5 = "print"

		return slot5.string(slot2, slot3[0])
	end
}
