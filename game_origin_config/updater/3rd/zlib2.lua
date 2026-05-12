slot0 = require("ffi")
slot1 = slot0.new
slot2 = slot0.string
slot3 = slot0.sizeof
slot4 = slot0.copy
slot5 = tonumber
slot6 = table.insert
slot7 = table.concat
slot8 = string.sub
slot10 = {
	__index = {
		_VERSION = "0.01"
	}
}

slot0.cdef([[
enum {
    Z_NO_FLUSH           = 0,
    Z_PARTIAL_FLUSH      = 1,
    Z_SYNC_FLUSH         = 2,
    Z_FULL_FLUSH         = 3,
    Z_FINISH             = 4,
    Z_BLOCK              = 5,
    Z_TREES              = 6,
    /* Allowed flush values; see deflate() and inflate() below for details */
    Z_OK                 = 0,
    Z_STREAM_END         = 1,
    Z_NEED_DICT          = 2,
    Z_ERRNO              = -1,
    Z_STREAM_ERROR       = -2,
    Z_DATA_ERROR         = -3,
    Z_MEM_ERROR          = -4,
    Z_BUF_ERROR          = -5,
    Z_VERSION_ERROR      = -6,
    /* Return codes for the compression/decompression functions. Negative values
    * are errors, positive values are used for special but normal events.
    */
    Z_NO_COMPRESSION      =  0,
    Z_BEST_SPEED          =  1,
    Z_BEST_COMPRESSION    =  9,
    Z_DEFAULT_COMPRESSION = -1,
    /* compression levels */
    Z_FILTERED            =  1,
    Z_HUFFMAN_ONLY        =  2,
    Z_RLE                 =  3,
    Z_FIXED               =  4,
    Z_DEFAULT_STRATEGY    =  0,
    /* compression strategy; see deflateInit2() below for details */
    Z_BINARY              =  0,
    Z_TEXT                =  1,
    Z_ASCII               =  Z_TEXT,   /* for compatibility with 1.2.2 and earlier */
    Z_UNKNOWN             =  2,
    /* Possible values of the data_type field (though see inflate()) */
    Z_DEFLATED            =  8,
    /* The deflate compression method (the only one supported in this version) */
    Z_NULL                =  0,  /* for initializing zalloc, zfree, opaque */
};
typedef void*    (* z_alloc_func)( void* opaque, unsigned items, unsigned size );
typedef void     (* z_free_func) ( void* opaque, void* address );
typedef struct z_stream_s {
   char*         next_in;
   unsigned      avail_in;
   unsigned long total_in;
   char*         next_out;
   unsigned      avail_out;
   unsigned long total_out;
   char*         msg;
   void*         state;
   z_alloc_func  zalloc;
   z_free_func   zfree;
   void*         opaque;
   int           data_type;
   unsigned long adler;
   unsigned long reserved;
} z_stream;
const char*   zlibVersion();
const char*   zError(int);
int inflate(z_stream*, int flush);
int inflateEnd(z_stream*);
int inflateInit2_(z_stream*, int windowBits, const char* version, int stream_size);
int deflate(z_stream*, int flush);
int deflateEnd(z_stream* );
int deflateInit2_(z_stream*, int level, int method, int windowBits, int memLevel,int strategy, const char *version, int stream_size);
unsigned long adler32(unsigned long adler, const char *buf, unsigned len);
unsigned long crc32(unsigned long crc,   const char *buf, unsigned len);
unsigned long adler32_combine(unsigned long, unsigned long, long);
unsigned long crc32_combine(unsigned long, unsigned long, long);
]])

slot11 = slot0.load(slot0.os == "Windows" and "zlib1" or "z")
slot9.zlib = slot11
slot12 = 16384
slot13 = slot11.Z_OK
slot14 = slot11.Z_NO_FLUSH
slot15 = slot11.Z_STREAM_END
slot16 = slot11.Z_FINISH

function slot9.zlib_err(slot0)
	uv1 = "zError"
	uv2 = "zError"

	return slot1(slot2.zError(slot0))
end

function slot9.createStream(slot0)
	uv1 = "z_stream"
	slot2 = "z_stream"
	slot1 = slot1(slot2)
	uv2 = "z_stream"
	slot2 = slot2("char[?]", slot0 + 1)
	slot3 = slot2
	slot1.avail_in = 0
	slot1.next_in = slot3
	uv3 = "z_stream"
	slot3 = slot3("char[?]", slot0)
	slot1.avail_out = 0
	slot1.next_out = slot3

	return slot1, slot2, slot3
end

function slot9.initInflate(slot0, slot1)
	uv3 = "zlibVersion"
	uv4 = "inflateInit2_"
	slot4 = slot4.zlibVersion
	uv4 = "inflateInit2_"
	uv8 = "zlibVersion"

	return slot4.inflateInit2_(slot0, slot1 or 47, slot3(slot4()), slot8(slot0))
end

function slot9.initDeflate(slot0, slot1)
	uv2 = "Z_DEFLATED"
	slot2 = slot2.Z_DEFLATED

	if not slot1.level then
		uv3 = "Z_DEFLATED"
		slot3 = slot3.Z_DEFAULT_COMPRESSION
	end

	slot4 = slot1.memLevel or 8

	if not slot1.strategy then
		uv5 = "Z_DEFLATED"
		slot5 = slot5.Z_DEFAULT_STRATEGY
	end

	uv7 = "level"
	uv8 = "Z_DEFLATED"
	slot8 = slot8.zlibVersion
	uv8 = "Z_DEFLATED"
	uv16 = "Z_DEFAULT_COMPRESSION"

	return slot8.deflateInit2_(slot0, slot3, slot2, slot1.windowBits or 31, slot4, slot5, slot7(slot8()), slot16(slot0))
end

function slot21(slot0, slot1, slot2, slot3)
	if slot1 - slot0.avail_out == 0 then
		return
	end

	uv6 = "avail_out"

	slot2(slot6(slot3, slot4))
end

function slot9.flate(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot8 = 0
	uv9 = "next_in"

	repeat
		if slot2(slot4) ~= nil then
			uv11 = "avail_in"

			slot11(slot6, slot10)

			slot5.avail_in = #slot10
			slot5.next_in = slot6
		else
			uv9 = "next_out"
			slot5.avail_in = 0
		end

		repeat
			slot5.next_out = slot7
			slot5.avail_out = slot4
			slot11 = slot0(slot5, slot9)
			uv11 = "avail_out"

			if slot11 < slot11 then
				slot1(slot5)

				uv13 = "FLATE: "

				return false, "FLATE: " .. slot13(slot8), slot5
			end

			uv11 = "next_in"

			slot11(slot5, slot4, slot3, slot7)
		until slot5.avail_out ~= 0

		uv11 = "avail_in"
	until slot8 == slot11

	slot11 = slot5

	slot1(slot11)

	uv11 = "FLATE: "

	return true, slot11(slot8)
end

function slot9.adler(slot0, slot1)
	slot3 = slot0 or ""
	uv4 = ""

	return slot4.adler32(slot1 or 0, slot3, #slot3)
end

function slot9.crc(slot0, slot1)
	slot3 = slot0 or ""
	uv4 = ""

	return slot4.crc32(slot1 or 0, slot3, #slot3)
end

function slot9.inflateGzip()
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
end

function slot9.deflateGzip()
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
end

function slot9.version()
	uv0 = "zlibVersion"
	uv1 = "zlibVersion"

	return slot0(slot1.zlibVersion())
end

function slot9.uncompress(slot0)
	slot1 = 1
	slot3 = {}
	uv5 = "print"
	slot5, slot6 = slot5(function ()
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
	end, function ()
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

	if not slot5 then
		print("uncompress failed!", #slot0, slot6)

		return
	end

	uv7 = "uncompress failed!"

	return slot7(slot3, "")
end

return slot9
