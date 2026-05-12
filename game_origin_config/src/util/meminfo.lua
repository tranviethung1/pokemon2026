require("ffi").cdef([[
    typedef struct _MEMORYSTATUSEX {
      uint32_t     dwLength;
      uint32_t     dwMemoryLoad;
      uint64_t ullTotalPhys;
      uint64_t ullAvailPhys;
      uint64_t ullTotalPageFile;
      uint64_t ullAvailPageFile;
      uint64_t ullTotalVirtual;
      uint64_t ullAvailVirtual;
      uint64_t ullAvailExtendedVirtual;
    } MEMORYSTATUSEX, *LPMEMORYSTATUSEX;

    int32_t GlobalMemoryStatusEx(
      LPMEMORYSTATUSEX lpBuffer
    );

    uint32_t GetLastError();

    int32_t getpid(void);

    typedef struct _PROCESS_MEMORY_COUNTERS_EX {
      uint32_t  cb;
      uint32_t  PageFaultCount;
      uint32_t PeakWorkingSetSize;
      uint32_t WorkingSetSize;
      uint32_t QuotaPeakPagedPoolUsage;
      uint32_t QuotaPagedPoolUsage;
      uint32_t QuotaPeakNonPagedPoolUsage;
      uint32_t QuotaNonPagedPoolUsage;
      uint32_t PagefileUsage;
      uint32_t PeakPagefileUsage;
      uint32_t PrivateUsage;
    } PROCESS_MEMORY_COUNTERS_EX, *PPROCESS_MEMORY_COUNTERS_EX;

    uint32_t GetCurrentProcess(void);

    int32_t GetProcessMemoryInfo(
      uint32_t                   Process,
      PPROCESS_MEMORY_COUNTERS_EX ppsmemCounters,
      uint32_t                    cb
    );
]])

function slot1(slot0)
	return slot0:match("^%s*()") > #slot0 and "" or slot0:match(".*%S", slot1)
end

function slot2()
	slot0, slot1 = io.open("/proc/meminfo", "r")
	slot2 = nil
	slot3 = {}

	if slot0 then
		slot2 = slot0:read("*a")

		slot0:close()
	else
		print("read meminfo err:", slot1)

		return nil
	end

	for slot7, slot8 in string.gmatch(slot2, "([^:]+):%s+(%S+)%s+kB") do
		uv9 = "io"
		slot3[slot9(slot7)] = tonumber(slot8) / 1024
	end

	if slot3.MemAvailable == nil then
		slot3.MemAvailable = slot3.MemFree + slot3.Cached + slot3.SReclaimable
	end

	return slot3.MemAvailable
end

function slot3()
	uv0 = "new"
	slot2 = {}
	slot0 = slot0.new("MEMORYSTATUSEX[1]", slot2)
	slot1 = slot0[0]
	uv2 = "new"
	slot2 = slot2.sizeof(slot1)
	slot1.dwLength = slot2
	uv2 = "new"

	if slot2.C.GlobalMemoryStatusEx(slot0) == 0 then
		uv5 = "new"

		print("winMeminfo GetLastError", slot5.C.GetLastError())

		return nil
	end

	return tonumber(slot1.ullAvailPhys) / 1024 / 1024
end

slot4 = true

function getMeminfo()
	uv0 = "cc"

	if not slot0 then
		return 0
	end

	slot0 = nil

	if cc.PLATFORM_OS_ANDROID == cc.Application:getInstance():getTargetPlatform() then
		uv2 = "Application"
		slot0 = slot2()
	elseif cc.PLATFORM_OS_WINDOWS == slot1 then
		uv2 = "getInstance"
		slot0 = slot2()
	end

	return slot0 or 0
end

function slot5()
	uv0 = "C"
	slot1, slot2 = io.open(string.format("/proc/%s/status", slot0.C.getpid()), "r")
	slot3 = nil
	slot4 = {}

	if slot1 then
		slot3 = slot1:read("*a")

		slot1:close()
	else
		print("read proc status err:", slot2)

		return nil
	end

	for slot8, slot9 in string.gmatch(slot3, "([^:]+):%s+(%S+)%s+kB") do
		uv10 = "getpid"
		slot4[slot10(slot8)] = tonumber(slot9) / 1024
	end

	return slot4.VmRSS
end

function slot6()
	uv0 = "C"
	slot0 = slot0.C.getpid()
	slot1 = io.popen("dumpsys meminfo " .. slot0)
	slot2 = nil

	print("!!! andoridProcMeminfo2 pid=", slot0, ", fp=", slot1)

	if slot1 then
		slot1:close()
		print(slot1:read("*a"))
	else
		return nil
	end

	slot3 = {}
	slot5 = slot2:match("(Pss):([^\n]+)\n")

	if slot2:match("TOTAL([^\n]+)\n") then
		for slot9 in string.gmatch(slot4, "(%S+)") do
			table.insert(slot3, slot9)
		end

		return tonumber(slot3[1]) / 1024
	elseif slot5 then
		for slot9 in string.gmatch(slot4, "(%S+)") do
			table.insert(slot3, slot9)
		end

		return tonumber(slot3[#slot3]) / 1024
	end

	return nil
end

function slot7()
	uv0 = "load"
	slot1 = "Psapi"
	uv1 = "load"
	slot3 = {}
	slot1 = slot1.new("PROCESS_MEMORY_COUNTERS_EX[1]", slot3)
	slot2 = slot1[0]
	uv3 = "load"
	slot3 = slot3.sizeof(slot2)
	slot2.cb = slot3
	uv3 = "load"
	uv7 = "load"

	if slot0.load(slot1).GetProcessMemoryInfo(slot3.C.GetCurrentProcess(), slot1, slot7.sizeof(slot2)) == 0 then
		uv7 = "load"

		print("winProcMeminfo GetLastError", slot7.C.GetLastError())

		return nil
	end

	return tonumber(slot2.WorkingSetSize) / 1024 / 1024
end

slot8 = true

function getProcMeminfo()
	uv0 = "cc"

	if not slot0 then
		return 0
	end

	slot0 = nil

	if cc.PLATFORM_OS_ANDROID == cc.Application:getInstance():getTargetPlatform() then
		uv2 = "Application"
		slot0 = slot2()
	elseif cc.PLATFORM_OS_WINDOWS == slot1 then
		uv2 = "getInstance"
		slot0 = slot2()
	end

	return slot0 or 0
end

if getMeminfo() == 0 then
	slot4 = false
end

if getProcMeminfo() == 0 then
	slot8 = false
end
