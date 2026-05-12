slot0 = {
	start = function (slot0, slot1)
		if slot1 == "once" then
			if slot0:shouldReturn() then
				return
			else
				slot0.should_run_once = true
			end
		end

		slot0.has_started = true
		slot0.has_finished = false

		slot0:resetReports(slot0.reports)

		slot2 = slot0.startHooks

		slot2(slot0)

		uv2 = "once"
		slot0.startTime = slot2()
	end,
	stop = function (slot0)
		if slot0:shouldReturn() then
			return
		end

		uv1 = "shouldReturn"
		slot0.stopTime = slot1()

		slot0:stopHooks()

		slot0.has_finished = true
	end,
	pause = function (slot0)
		uv1 = "stopTime"
		slot0.stopTime = slot1()
		slot0.runTime = slot0.runTime + slot0.stopTime - slot0.startTime

		slot0:stopHooks()
	end,
	resume = function (slot0)
		slot0:startHooks()

		slot1 = slot0.runTime + slot0.stopTime - slot0.startTime
		slot0.runTime = slot1
		uv1 = "startHooks"
		slot0.startTime = slot1()
	end,
	checkMemory = function (slot0, slot1, slot2)
		uv3 = "lastCheckMemoryTime"
		slot3 = slot3()

		if slot0.lastCheckMemoryTime and slot3 < slot0.lastCheckMemoryTime + (slot1 or 0) then
			return
		end

		slot0.lastCheckMemoryTime = slot3
		slot5 = {
			time = slot3,
			memory = collectgarbage("count"),
			note = slot2 or ""
		}

		table.insert(slot0.memoryReports, slot5)
		slot0:setHighestMemoryReport(slot5)
		slot0:setLowestMemoryReport(slot5)
	end,
	writeReport = function (slot0, slot1)
		if #slot0.reports > 0 or #slot0.memoryReports > 0 then
			slot1 = slot1 or "ProFi.txt"

			slot0:sortReportsWithSortMethod(slot0.reports, slot0.sortMethod)
			slot0:writeReportsToFilename(slot1)
			print(string.format("[ProFi]\t Report written to %s", slot1))
		end
	end,
	reset = function (slot0)
		slot0.reports = {}
		slot0.reportsByTitle = {}
		slot0.memoryReports = {}
		slot0.highestMemoryReport = nil
		slot0.lowestMemoryReport = nil
		slot0.has_started = false
		slot0.has_finished = false
		slot0.should_run_once = false
		slot0.lastCheckMemoryTime = nil

		if not slot0.hookCount then
			uv1 = "reports"
		end

		slot0.hookCount = slot1

		if not slot0.sortMethod then
			uv1 = "reportsByTitle"
		end

		slot0.sortMethod = slot1
		slot0.inspect = nil
		slot0.runTime = 0
		slot0.deepMode = false
		slot0.flameMode = false
	end,
	setHookCount = function (slot0, slot1)
		slot0.hookCount = slot1
	end,
	setSortMethod = function (slot0, slot1)
		if slot1 == "duration" then
			uv2 = "duration"
			slot0.sortMethod = slot2
		elseif slot1 == "count" then
			uv2 = "sortMethod"
			slot0.sortMethod = slot2
		end
	end,
	setGetTimeMethod = function ()
		error("Decompilation failed")
		-- Exception in function building!
		-- Traceback (most recent call last):
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
		--     return _build_function_definition(prototype, state.header)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
		--     node.statements.contents = _build_function_blocks(state, instructions)
		--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
		--     statement, line_marked_elements = _build_statement(state, addr, instruction)
		--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
		--     return _build_var_assignment(state, addr, instruction)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
		--     assn = func(*args, **kwargs)
		--            ^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
		--     expression = _build_const_expression(state, addr, instruction)
		--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 834, in _build_const_expression
		--     return _build_numeric_constant(state, instruction.CD)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1027, in _build_numeric_constant
		--     number = state.constants.numeric_constants[index]
		--              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
		-- IndexError: list index out of range
	end,
	setInspect = function (slot0, slot1, slot2)
		if slot0.inspect then
			slot0.inspect.methodName = slot1
			slot0.inspect.levels = slot2 or 1
		else
			slot0.inspect = {
				methodName = slot1,
				levels = slot2 or 1
			}
		end
	end,
	setCallDeepMode = function (slot0, slot1)
		slot0.deepMode = slot1
	end,
	setFlameMode = function (slot0, slot1)
		slot0.flameMode = slot1
	end,
	shouldReturn = function (slot0)
		return slot0.should_run_once and slot0.has_finished
	end,
	getFuncReport = function (slot0, slot1)
		if not slot0.reportsByTitle[slot0:getTitleFromFuncInfo(slot1)] then
			slot3 = slot0:createFuncReport(slot1)
			slot0.reportsByTitle[slot2] = slot3

			table.insert(slot0.reports, slot3)
		end

		return slot3
	end,
	getTitleFromFuncInfo = function (slot0, slot1)
		uv6 = "name"
		uv6 = "anonymous"

		return string.format(slot6, slot1.short_src or "C_FUNC", slot1.name or "anonymous", string.format(slot6, slot1.linedefined or 0))
	end,
	createFuncReport = function (slot0, slot1)
		return {
			sampleDeep = 5,
			timer = 0,
			count = 0,
			selftimer = 0,
			maxDeep = 0,
			title = slot0:getTitleFromFuncInfo(slot1)
		}
	end,
	startHooks = function (slot0)
		uv2 = "debug"

		debug.sethook(slot2, "cr", slot0.hookCount)
	end,
	stopHooks = function (slot0)
		debug.sethook()
	end,
	sortReportsWithSortMethod = function (slot0, slot1, slot2)
		if slot1 then
			table.sort(slot1, slot2)
		end
	end,
	writeReportsToFilename = function (slot0, slot1)
		slot2, slot3 = io.open(slot1, "w")

		assert(slot2, slot3)
		slot0:writeBannerToFile(slot2)

		if #slot0.reports > 0 then
			slot0:writeProfilingReportsToFile(slot0.reports, slot2)
		end

		if #slot0.memoryReports > 0 then
			slot0:writeMemoryReportsToFile(slot0.memoryReports, slot2)
		end

		slot2:close()
	end,
	writeProfilingReportsToFile = function (slot0, slot1, slot2)
		uv5 = "stopTime"
		slot6 = slot2

		slot2.write(slot6, string.format(slot5, slot0.stopTime - slot0.startTime + slot0.runTime))

		uv6 = "startTime"
		slot9 = "LINE"
		slot10 = "SELFTIME"

		slot2:write(string.format(slot6, "FILE", "FUNCTION", slot9, slot10, "TIME", "RELATIVE", "CALLED", "DEEP"))

		for slot9, slot10 in ipairs(slot1) do
			uv12 = "runTime"
			slot13 = slot10.timer
			uv13 = "string"
			slot14 = slot10.selftimer
			uv14 = "format"
			slot15 = slot10.count
			uv15 = "write"
			slot16 = slot10.maxDeep
			uv16 = "FILE"
			slot17 = slot10.timer / slot3 * 100
			uv17 = "FUNCTION"

			slot2:write(string.format(slot17, slot10.title, string.format(slot13, slot14), string.format(slot12, slot13), string.format(slot16, slot17), string.format(slot14, slot15), string.format(slot15, slot16)))

			if slot10.inspections then
				slot0:writeInpsectionsToFile(slot10.inspections, slot2)
			end
		end
	end,
	writeMemoryReportsToFile = function (slot0, slot1, slot2)
		uv5 = "write"

		slot2:write(slot5)
		slot0:writeHighestMemoryReportToFile(slot2)

		slot5 = slot2

		slot0:writeLowestMemoryReportToFile(slot5)

		uv5 = "writeHighestMemoryReportToFile"

		slot2:write(slot5)

		for slot6, slot7 in ipairs(slot1) do
			uv11 = "writeLowestMemoryReportToFile"

			slot2:write(slot0:formatMemoryReportWithFormatter(slot7, slot11))
		end
	end,
	writeHighestMemoryReportToFile = function (slot0, slot1)
		uv6 = "highestMemoryReport"

		slot1:write(slot0:formatMemoryReportWithFormatter(slot0.highestMemoryReport, slot6))
	end,
	writeLowestMemoryReportToFile = function (slot0, slot1)
		uv6 = "lowestMemoryReport"

		slot1:write(slot0:formatMemoryReportWithFormatter(slot0.lowestMemoryReport, slot6))
	end,
	formatMemoryReportWithFormatter = function (slot0, slot1, slot2)
		uv4 = "string"
		slot5 = slot1.time
		uv5 = "format"
		slot6 = slot1.memory
		uv6 = "time"

		return string.format(slot2, string.format(slot4, slot5), string.format(slot5, slot6), string.format(slot6, slot1.memory / 1024), slot1.note)
	end,
	writeBannerToFile = function (slot0, slot1)
		uv3 = "string"

		slot1:write(string.format(slot3, os.date()))
	end,
	writeInpsectionsToFile = function (slot0, slot1, slot2)
		slot2:write("\n==^ INSPECT ^======================================================================================================== COUNT ===\n")

		for slot7, slot8 in ipairs(slot0:sortInspectionsIntoList(slot1)) do
			uv10 = "sortInspectionsIntoList"
			slot11 = slot8.line
			uv11 = "write"
			slot12 = slot8.source
			uv12 = "\n==^ INSPECT ^======================================================================================================== COUNT ===\n"
			slot13 = slot8.count
			uv13 = "ipairs"

			slot2:write(string.format(slot13, string.format(slot11, slot12, slot8.name, string.format(slot10, slot11)), string.format(slot12, slot13)))
		end

		slot2:write("===============================================================================================================================\n\n")
	end,
	sortInspectionsIntoList = function (slot0, slot1)
		slot2 = {}

		for slot6, slot7 in pairs(slot1) do
			slot2[#slot2 + 1] = slot7
		end

		uv5 = "pairs"

		table.sort(slot2, slot5)

		return slot2
	end,
	resetReports = function (slot0, slot1)
		for slot5, slot6 in ipairs(slot1) do
			slot6.timer = 0
			slot6.selftimer = 0
			slot6.count = 0
			slot6.inspections = nil
		end
	end,
	shouldInspect = function (slot0, slot1)
		return slot0.inspect and slot0.inspect.methodName == slot1.name
	end,
	getInspectionsFromReport = function (slot0, slot1)
		if not slot1.inspections then
			slot1.inspections = {}
		end

		return slot2
	end,
	getInspectionWithKeyFromInspections = function (slot0, slot1, slot2)
		if not slot2[slot1] then
			slot2[slot1] = {
				count = 0
			}
		end

		return slot3
	end,
	doInspection = function (slot0, slot1, slot2)
		slot3 = slot0:getInspectionsFromReport(slot2)
		slot5 = 5

		while 5 + slot1.levels > slot5 do
			if debug.getinfo(slot5, "nS") then
				slot7 = slot6.short_src or "[C]"
				slot8 = slot6.name or "anonymous"
				slot9 = slot6.linedefined
				slot11 = slot0:getInspectionWithKeyFromInspections(slot7 .. slot8 .. slot9, slot3)
				slot11.source = slot7
				slot11.name = slot8
				slot11.line = slot9
				slot11.count = slot11.count + 1
				slot5 = slot5 + 1
			else
				break
			end
		end
	end,
	getCallDeep = function (slot0, slot1)
		while debug.getinfo(slot1 or 3, "nS") == nil do
			slot2 = debug.getinfo(slot1 - 1, "nS")
		end

		while slot2 do
			slot2 = debug.getinfo(slot1 + 1, "nS")
		end

		return slot1
	end,
	onFunctionCall = function (slot0, slot1)
		uv2 = "getFuncReport"
		slot3 = slot2
		slot2 = slot2.getFuncReport(slot3, slot1)
		uv3 = "callTime"
		slot2.callTime = slot3()
		slot2.count = slot2.count + 1

		if slot0:shouldInspect(slot1) then
			slot0:doInspection(slot0.inspect, slot2)
		end

		if slot0.flameMode then
			-- Nothing
		end
	end,
	onFunctionReturn = function (slot0, slot1, slot2)
		uv3 = "getFuncReport"
		slot3 = slot3:getFuncReport(slot1)
		slot4 = nil

		if slot2 then
			uv5 = "getFuncReport"
			slot4 = slot5:getFuncReport(slot2)
		end

		if slot3.callTime then
			uv5 = "callTime"
			slot5 = slot5() - slot3.callTime
			slot3.timer = slot3.timer + slot5
			slot3.selftimer = slot3.selftimer + slot5

			if slot4 then
				slot4.selftimer = slot4.selftimer - slot5
			end

			if slot0.deepMode and slot3.sampleDeep > 0 then
				slot3.sampleDeep = slot3.sampleDeep - 1
				slot3.maxDeep = math.max(slot3.maxDeep, slot0:getCallDeep(slot3.sampleDeep))
			end
		end
	end,
	setHighestMemoryReport = function (slot0, slot1)
		if not slot0.highestMemoryReport then
			slot0.highestMemoryReport = slot1
		elseif slot0.highestMemoryReport.memory < slot1.memory then
			slot0.highestMemoryReport = slot1
		end
	end,
	setLowestMemoryReport = function (slot0, slot1)
		if not slot0.lowestMemoryReport then
			slot0.lowestMemoryReport = slot1
		elseif slot1.memory < slot0.lowestMemoryReport.memory then
			slot0.lowestMemoryReport = slot1
		end
	end
}
slot1, slot2, slot3, slot4 = nil
slot5 = 0
slot6 = "| %-60s: %-40s: %-20s: %-12s: %-12s: %-12s: %-12s: %-12s|\n"
slot7 = "| %s: %-12s: %-12s: %-12s: %-12s: %-12s|\n"
slot8 = "> %s: %-12s\n"
slot9 = "| TOTAL TIME = %f\n"
slot10 = "| %-20s: %-16s: %-16s| %s\n"
slot11 = "H %-20s: %-16s: %-16sH %s\n"
slot12 = "L %-20s: %-16s: %-16sL %s\n"
slot13 = "%-60.60s: %-40.40s: %-20s"
slot14 = "%4i"
slot15 = "%04.3f"
slot16 = "%04.3f"
slot17 = "%03.2f%%"
slot18 = "%7i"
slot19 = "%7i"
slot20 = "%7i Kbytes"
slot21 = "%7.1f Mbytes"
slot22 = "\n=== HIGH & LOW MEMORY USAGE ===============================\n"
slot23 = "=== MEMORY USAGE ==========================================\n"
slot24 = [[
###############################################################################################################
#####  ProFi, a lua profiler. This profile was generated on: %s
#####  ProFi is created by Luke Perkin 2012 under the MIT Licence, www.locofilm.co.uk
#####  Version 1.3. Get the most recent version at this gist: https://gist.github.com/2838755
###############################################################################################################

]]
slot4 = os.clock

if socket and socket.gettime then
	slot4 = socket.gettime
end

if cc.utils and cc.utils.gettime then
	function slot4()
		return cc.utils:gettime()
	end
end

function slot1(slot0)
	if slot0 == "call" then
		uv2 = "debug"

		slot2:onFunctionCall(debug.getinfo(2, "nS"))
	elseif slot0 == "return" then
		slot3 = 3
		uv3 = "debug"

		slot3:onFunctionReturn(slot1, debug.getinfo(slot3, "nS"))
	end
end

function slot2(slot0, slot1)
	if slot0.timer == slot1.timer then
		return slot1.count < slot0.count
	end

	return slot1.timer < slot0.timer
end

function slot3(slot0, slot1)
	return slot1.count < slot0.count
end

slot0:reset()

return slot0
