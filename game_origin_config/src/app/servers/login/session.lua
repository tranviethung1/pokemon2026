slot0 = {
	"net.tcpsession",
	"LoginSession",
	1,
	2,
	"%s %s login to %s:%s",
	false,
	true,
	nil,
	"%d+.%d+.%d+",
	"login channel",
	"/login/check",
	"8b4d620ca7d7cd99ad30b27cba9f2742",
	"%s %s login ok %s:%s",
	0,
	"lost",
	"XFU5K470R 15 4W350M3. KR3D17 70 XFU5K470R!"
}
slot1 = require(slot0[1])
slot2 = class(slot0[2], slot1)
slot2.StepInitToLogin = slot1.StepInitCustom
slot2.StepInitWaitLogin = slot1.StepInitCustom + slot0[3]
slot2.StepInitLoginConfirm = slot1.StepInitCustom + slot0[4]

function slot2.init(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0
	slot5.userName = slot3
	slot5._initCB = slot4
	slot6 = slot5.initPwd

	slot6(slot5)

	uv6 = "userName"

	slot6.init(slot5, slot1, slot2)
end

function slot2.setIDAndPwd(slot0, slot1, slot2)
	slot0.accountID = slot1

	if slot2 then
		slot3:setNewPwd(slot2)
	end
end

function slot2.setInitStep(slot0, slot1)
	slot2 = slot0

	if slot2.initStep == slot2.StepInitConnected and slot1 == slot2.StepInitOK then
		slot2.initStep = slot2.StepInitToLogin
	else
		slot2.initStep = slot1
	end
end

function slot2._initSession(slot0)
	uv2 = "_initSession"

	if not slot2._initSession(slot0) or slot1.initStep < slot1.StepInitConnected then
		return slot2
	end

	if slot1.initStep == slot1.StepInitToLogin then
		uv4 = "initStep"

		printInfo(slot4[5], tostring(slot1), slot1.sockID, slot1.host, slot1.port)
		slot1:setInitStep(slot1.StepInitWaitLogin)
		slot1:_onSendLogin()
	elseif slot1.initStep == slot1.StepInitWaitLogin or slot1.initStep == slot1.StepInitLoginConfirm then
		uv3 = "initStep"
		uv4 = "initStep"

		return slot3[6], slot4[7]
	end

	uv3 = "initStep"

	return slot3[6]
end

function slot2._onSendLogin(slot0)
	slot1 = slot0
	uv2 = "string"
	slot4 = APP_VERSION
	uv5 = "string"

	string.gsub(slot4, slot5[9], function ()
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
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 821, in _build_const_expression
		--     return _build_string_constant(state, instruction.CD)
		--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1013, in _build_string_constant
		--     node.value = state.constants.complex_constants[index]
		--                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
		-- IndexError: list index out of range
	end)

	uv4 = "string"
	slot6 = slot1.userName

	print(slot4[10], sdk.getChannel(slot6))
	sdk.getYDToken(function ()
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
	end)

	uv6 = "string"

	slot1.net:sendPacket(slot6[11], {
		guarder = "a43d4c187f6def060841cdf8fcdff1f5",
		name = slot1.userName,
		app = slot2[8],
		patch = PATCH_VERSION,
		minpatch = PATCH_MIN_VERSION,
		channel = sdk.getChannel(slot1.userName),
		language = LOCAL_LANGUAGE,
		tag = APP_TAG,
		fake = FAKE_APP,
		platform = device.platform,
		xxv = XXVERSION,
		ydtoken = nil
	})
	slot1:asyncRecvUntilOnePacket(slot1.InitTimeout)
end

function slot2._onInitOK(slot0)
	slot1 = slot0
	slot2 = printInfo
	uv3 = "printInfo"

	slot2(slot3[13], tostring(slot1), slot1.sockID, slot1.host, slot1.port)

	uv2 = "printInfo"
	slot1.reconnTimes = slot2[14]

	if slot1._initCB then
		slot3 = nil

		if not slot1._initData.ret then
			uv4 = "printInfo"
			slot3 = slot2
			slot2 = slot4[8]
		end

		slot4 = slot1._initCB
		slot5 = slot2

		slot4(slot5, slot3)

		uv4 = "printInfo"
		uv5 = "printInfo"
		slot1._initData = slot5[8]
		slot1._initCB = slot4[8]
	end
end

function slot2._onInitErr(slot0)
	slot1 = slot0
	uv2 = "host"
	slot1.host = slot2[8]

	slot1:close()

	if slot1._initCB then
		uv3 = "host"
		slot1._initData.ret = slot3[6]
		slot2 = slot1._initData

		if not slot1._initData.err then
			uv3 = "host"
			slot3 = slot3[15]
		end

		slot2.err = slot3
		slot2 = slot1._initCB
		uv3 = "host"
		slot3 = slot3[8]

		slot2(slot3, slot1._initData)

		uv2 = "host"
		uv3 = "host"
		slot1._initData = slot3[8]
		slot1._initCB = slot2[8]
	end
end

return slot2
