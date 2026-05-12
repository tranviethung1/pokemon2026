if cc.SimpleAudioEngine == nil then
	return
end

DeprecatedCocosDenshionClass = {} or DeprecatedCocosDenshionClass

function slot0(slot0, slot1)
end

function DeprecatedCocosDenshionClass.SimpleAudioEngine()
	uv0 = "SimpleAudioEngine"

	slot0("SimpleAudioEngine", "cc.SimpleAudioEngine")

	return cc.SimpleAudioEngine
end

_G.SimpleAudioEngine = DeprecatedCocosDenshionClass.SimpleAudioEngine()
