print("Game Main working...")
require("exception_handler")
require("battle_report")

slot0 = nil

function __G__TRACKBACK__()
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
end

function __G__GCCOUNT__()
	return collectgarbage("count")
end

slot2, slot3 = xpcall(function ()
	require("lib")
	sdk.trackEvent(1)

	if device.platform == "windows" then
		slot0 = io.open(".args", "rb")

		slot0:close()
		require("json")

		globals.MainArgs = json.decode(slot0:read("*a"))

		print("MainArgs", dumps(MainArgs))
	end

	cc.FileUtils:getInstance():setPopupNotify(true)

	if device.platform == "windows" or device.platform == "mac" or APP_CHANNEL == "none" then
		DEBUG = 2
		CC_SHOW_FPS = false
	else
		log.disable()
	end

	if device.platform ~= "windows" and device.platform ~= "mac" then
		EDITOR_ENABLE = false
	end

	EDITOR_ENABLE = false
	DEBUG = 1

	log.log({
		"log is enabled"
	})
	logf.log("logf is enabled")
	printDebug("printDebug is enabled")
	printInfo("printInfo is enabled")
	print("gc stop", collectgarbage("stop"))
	require("app.game_app"):create():run("login.view")

	if MainArgs and MainArgs.robot then
		cc.FileUtils:getInstance():addSearchResolutionsOrder("robot")
		require("robot.main")
	end
end, __G__TRACKBACK__)

if not slot2 then
	print("xpcall game main error", slot2, slot3)
end
