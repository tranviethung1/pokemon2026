if not gl then
	return
end

function gl.createTexture()
	return {
		texture_id = gl._createTexture()
	}
end

function gl.createBuffer()
	return {
		buffer_id = gl._createBuffer()
	}
end

function gl.createRenderbuffer()
	return {
		renderbuffer_id = gl._createRenderuffer()
	}
end

function gl.createFramebuffer()
	return {
		framebuffer_id = gl._createFramebuffer()
	}
end

function gl.createProgram()
	return {
		program_id = gl._createProgram()
	}
end

function gl.createShader(slot0)
	return {
		shader_id = gl._createShader(slot0)
	}
end

function gl.deleteTexture(slot0)
	slot1 = 0

	if type(slot0) == "number" then
		slot1 = slot0
	elseif type(slot0) == "table" then
		slot1 = slot0.texture_id
	end

	gl._deleteTexture(slot1)
end

function gl.deleteBuffer(slot0)
	slot1 = 0

	if type(slot0) == "number" then
		slot1 = slot0
	elseif type(slot0) == "table" then
		slot1 = slot0.buffer_id
	end

	gl._deleteBuffer(slot1)
end

function gl.deleteRenderbuffer(slot0)
	slot1 = 0

	if type(slot0) == "number" then
		slot1 = slot0
	elseif type(slot0) == "table" then
		slot1 = slot0.renderbuffer_id
	end

	gl._deleteRenderbuffer(slot1)
end

function gl.deleteFramebuffer(slot0)
	slot1 = 0

	if type(slot0) == "number" then
		slot1 = slot0
	elseif type(slot0) == "table" then
		slot1 = slot0.framebuffer_id
	end

	gl._deleteFramebuffer(slot1)
end

function gl.deleteProgram(slot0)
	slot1 = 0

	if type(buffer) == "number" then
		slot1 = slot0
	elseif type(slot0) == "table" then
		slot1 = slot0.program_id
	end

	gl._deleteProgram(slot1)
end

function gl.deleteShader(slot0)
	slot1 = 0

	if type(slot0) == "number" then
		slot1 = slot0
	elseif type(slot0) == "table" then
		slot1 = slot0.shader_id
	end

	gl._deleteShader(slot1)
end

function gl.bindTexture(slot0, slot1)
	slot2 = 0

	if type(slot1) == "number" then
		slot2 = slot1
	elseif type(slot1) == "table" then
		slot2 = slot1.texture_id
	end

	gl._bindTexture(slot0, slot2)
end

function gl.bindBuffer(slot0, slot1)
	slot2 = 0

	if type(slot1) == "number" then
		slot2 = slot1
	elseif type(slot1) == "table" then
		slot2 = slot1.buffer_id
	end

	gl._bindBuffer(slot0, slot2)
end

function gl.bindRenderBuffer(slot0, slot1)
	slot2 = 0

	if type(slot1) == "number" then
		slot2 = slot1
	elseif type(slot1) == "table" then
		slot2 = slot1.buffer_id
	end

	gl._bindRenderbuffer(slot0, slot2)
end

function gl.bindFramebuffer(slot0, slot1)
	slot2 = 0

	if type(slot1) == "number" then
		slot2 = slot1
	elseif type(slot1) == "table" then
		slot2 = slot1.buffer_id
	end

	gl._bindFramebuffer(slot0, slot2)
end

function gl.getUniform(slot0, slot1)
	slot2 = 0
	slot3 = 0

	return gl._getUniform(type(slot0) == "number" and slot0 or slot0.program_id, type(slot1) == "number" and slot1 or slot1.location_id)
end

function gl.compileShader(slot0)
	gl._compileShader(slot0.shader_id)
end

function gl.shaderSource(slot0, slot1)
	gl._shaderSource(slot0.shader_id, slot1)
end

function gl.getShaderParameter(slot0, slot1)
	return gl._getShaderParameter(slot0.shader_id, slot1)
end

function gl.getShaderInfoLog(slot0)
	return gl._getShaderInfoLog(slot0.shader_id)
end

function gl.attachShader(slot0, slot1)
	slot2 = 0

	if type(slot0) == "number" then
		slot2 = slot0
	elseif type(slot0) == "table" then
		slot2 = slot0.program_id
	end

	gl._attachShader(slot2, slot1.shader_id)
end

function gl.linkProgram(slot0)
	slot1 = 0

	if type(slot0) == "number" then
		slot1 = slot0
	elseif type(slot0) == "table" then
		slot1 = slot0.program_id
	end

	gl._linkProgram(slot1)
end

function gl.getProgramParameter(slot0, slot1)
	slot2 = 0

	if type(slot0) == "number" then
		slot2 = slot0
	elseif type(slot0) == "table" then
		slot2 = slot0.program_id
	end

	return gl._getProgramParameter(slot2, slot1)
end

function gl.useProgram(slot0)
	slot1 = 0

	if type(slot0) == "number" then
		slot1 = slot0
	elseif type(slot0) == "table" then
		slot1 = slot0.program_id
	end

	gl._useProgram(slot1)
end

function gl.getAttribLocation(slot0, slot1)
	slot2 = 0

	if type(slot0) == "number" then
		slot2 = slot0
	elseif type(slot0) == "table" then
		slot2 = slot0.program_id
	end

	return gl._getAttribLocation(slot2, slot1)
end

function gl.getUniformLocation(slot0, slot1)
	slot2 = 0

	if type(slot0) == "number" then
		slot2 = slot0
	elseif type(slot0) == "table" then
		slot2 = slot0.program_id
	end

	return gl._getUniformLocation(slot2, slot1)
end

function gl.getActiveAttrib(slot0, slot1)
	slot2 = 0

	if type(slot0) == "number" then
		slot2 = slot0
	elseif type(slot0) == "table" then
		slot2 = slot0.program_id
	end

	return gl._getActiveAttrib(slot2, slot1)
end

function gl.getActiveUniform(slot0, slot1)
	slot2 = 0

	if type(slot0) == "number" then
		slot2 = slot0
	elseif type(slot0) == "table" then
		slot2 = slot0.program_id
	end

	return gl._getActiveUniform(slot2, slot1)
end

function gl.getAttachedShaders(slot0)
	slot1 = 0

	if type(slot0) == "number" then
		slot1 = slot0
	elseif type(slot0) == "table" then
		slot1 = slot0.program_id
	end

	return gl._getAttachedShaders(slot1)
end

function gl.glNodeCreate()
	return cc.GLNode:create()
end
