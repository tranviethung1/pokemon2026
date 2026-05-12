slot0 = require("bit")
slot1 = slot0.bnot
slot2 = slot0.band
slot3 = slot0.bor
slot4 = slot0.bxor
slot5 = slot0.lshift
slot6 = slot0.rshift
slot7 = slot0.rol

if not globals._fs_cdefined_ then
	require("ffi").cdef([[
typedef struct _FILETIME {
	uint32_t dwLowDateTime;
	uint32_t dwHighDateTime;
} FILETIME, *PFILETIME, *LPFILETIME;

typedef struct _SYSTEMTIME {
	int16_t wYear;
	int16_t wMonth;
	int16_t wDayOfWeek;
	int16_t wDay;
	int16_t wHour;
	int16_t wMinute;
	int16_t wSecond;
	int16_t wMilliseconds;
} SYSTEMTIME, *PSYSTEMTIME, *LPSYSTEMTIME;

int32_t FileTimeToSystemTime(
  const FILETIME     *lpFileTime,
  LPSYSTEMTIME lpSystemTime
);

typedef struct _WIN32_FIND_DATAA {
	uint32_t dwFileAttributes;
	FILETIME ftCreationTime;
	FILETIME ftLastAccessTime;
	FILETIME ftLastWriteTime;
	uint32_t nFileSizeHigh;
	uint32_t nFileSizeLow;
	uint32_t dwReserved0;
	uint32_t dwReserved1;
	char   cFileName[ 260 ];
	char   cAlternateFileName[ 14 ];
} WIN32_FIND_DATAA, *PWIN32_FIND_DATAA, *LPWIN32_FIND_DATAA;

int32_t FindFirstFileA(
	char* lpFileName,
	LPWIN32_FIND_DATAA lpFindFileData
);

int32_t FindNextFileA(
	int32_t hFindFile,
	LPWIN32_FIND_DATAA lpFindFileData
);

int32_t FindClose(
	int32_t hFindFile
);

uint32_t GetLastError();

]])

	globals._fs_cdefined_ = true
end

return {
	listAllFiles = function (slot0, slot1, slot2)
		uv3 = "new"
		slot4 = "WIN32_FIND_DATAA[1]"
		slot3 = slot3.new(slot4, {})
		uv4 = "new"
		slot5 = slot3[0]
		slot6 = slot4.new("SYSTEMTIME[1]", {})[0]
		uv8 = "new"
		uv9 = "new"

		if slot8.C.FindFirstFileA(slot9.cast("char*", slot0 .. "/*"), slot3) == -1 then
			uv11 = "new"

			print("FindFirstFileA GetLastError", slot11.C.GetLastError())

			return {}
		end

		while true do
			uv9 = "new"

			if slot9.C.FindNextFileA(slot8, slot3) == 0 then
				break
			end

			uv10 = "new"
			slot11 = slot5.cFileName
			slot10 = slot10.string(slot11)
			uv11 = "WIN32_FIND_DATAA[1]"

			if slot11(slot5.dwFileAttributes, 16) == 16 and slot2 then
				if slot10 ~= "." then
					if slot10 ~= ".." then
						uv11 = "SYSTEMTIME[1]"
						slot15 = slot10

						for slot15, slot16 in pairs(slot11.listAllFiles(string.format("%s/%s", slot0, slot15), slot1, slot2)) do
							slot7[slot15] = slot16
						end
					end
				end
			elseif slot1(slot10) then
				slot7[string.format("%s/%s", slot0, slot10)] = {
					slot5.ftLastWriteTime.dwLowDateTime,
					slot5.ftLastWriteTime.dwHighDateTime
				}
			end
		end

		uv9 = "new"

		slot9.C.FindClose(slot8)

		return slot7
	end
}
