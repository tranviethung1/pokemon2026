if cc.CCBProxy == nil then
	return
end

DeprecatedCocosBuilderClass = {} or DeprecatedCocosBuilderClass

function slot0(slot0, slot1)
end

function DeprecatedCocosBuilderClass.CCBReader()
	uv0 = "CCBReader"

	slot0("CCBReader", "cc.BReader")

	return cc.BReader
end

_G.CCBReader = DeprecatedCocosBuilderClass.CCBReader()

function DeprecatedCocosBuilderClass.CCBAnimationManager()
	uv0 = "CCBAnimationManager"

	slot0("CCBAnimationManager", "cc.BAnimationManager")

	return cc.BAnimationManager
end

_G.CCBAnimationManager = DeprecatedCocosBuilderClass.CCBAnimationManager()

function DeprecatedCocosBuilderClass.CCBProxy()
	uv0 = "CCBProxy"

	slot0("CCBProxy", "cc.CCBProxy")

	return cc.CCBProxy
end

_G.CCBProxy = DeprecatedCocosBuilderClass.CCBProxy()
