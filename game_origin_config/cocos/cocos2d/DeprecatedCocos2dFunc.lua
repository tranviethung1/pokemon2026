function slot0(slot0, slot1)
end

CCDirector.sharedDirector = ({
	sharedDirector = function ()
		uv0 = "CCDirector:sharedDirector"

		slot0("CCDirector:sharedDirector", "cc.Director:getInstance")

		return cc.Director:getInstance()
	end
}).sharedDirector
slot2 = {
	getInstance = function (slot0)
		uv1 = "cc.TextureCache:getInstance"

		slot1("cc.TextureCache:getInstance", "cc.Director:getInstance():getTextureCache")

		return cc.Director:getInstance():getTextureCache()
	end
}
cc.TextureCache.getInstance = slot2.getInstance

function slot2.destroyInstance(slot0)
	uv1 = "cc.TextureCache:destroyInstance"

	slot1("cc.TextureCache:destroyInstance", "cc.Director:getInstance():destroyTextureCache")

	return cc.Director:getInstance():destroyTextureCache()
end

cc.TextureCache.destroyInstance = slot2.destroyInstance

function slot2.dumpCachedTextureInfo(slot0)
	uv1 = "self:dumpCachedTextureInfo"

	slot1("self:dumpCachedTextureInfo", "self:getCachedTextureInfo")

	return print(slot0:getCachedTextureInfo())
end

cc.TextureCache.dumpCachedTextureInfo = slot2.dumpCachedTextureInfo
slot3 = {
	sharedTextureCache = function ()
		uv0 = "CCTextureCache:sharedTextureCache"

		slot0("CCTextureCache:sharedTextureCache", "CCTextureCache:getInstance")

		return cc.TextureCache:getInstance()
	end
}

rawset(CCTextureCache, "sharedTextureCache", slot3.sharedTextureCache)

function slot3.purgeSharedTextureCache()
	uv0 = "CCTextureCache:purgeSharedTextureCache"

	slot0("CCTextureCache:purgeSharedTextureCache", "CCTextureCache:destroyInstance")

	return cc.TextureCache:destroyInstance()
end

rawset(CCTextureCache, "purgeSharedTextureCache", slot3.purgeSharedTextureCache)

function slot3.addUIImage(slot0, slot1, slot2)
	uv3 = "CCTextureCache:addUIImage"

	slot3("CCTextureCache:addUIImage", "CCTextureCache:addImage")

	return slot0:addImage(slot1, slot2)
end

CCTextureCache.addUIImage = slot3.addUIImage
CCAnimation.addSpriteFrameWithFileName = ({
	addSpriteFrameWithFileName = function (slot0, ...)
		uv1 = "CCAnimationDeprecated:addSpriteFrameWithFileName"

		slot1("CCAnimationDeprecated:addSpriteFrameWithFileName", "cc.Animation:addSpriteFrameWithFile")

		return slot0:addSpriteFrameWithFile(...)
	end
}).addSpriteFrameWithFileName
slot5 = {
	sharedAnimationCache = function ()
		uv0 = "CCAnimationCache:sharedAnimationCache"

		slot0("CCAnimationCache:sharedAnimationCache", "CCAnimationCache:getInstance")

		return CCAnimationCache:getInstance()
	end
}
CCAnimationCache.sharedAnimationCache = slot5.sharedAnimationCache

function slot5.purgeSharedAnimationCache()
	uv0 = "CCAnimationCache:purgeSharedAnimationCache"

	slot0("CCAnimationCache:purgeSharedAnimationCache", "CCAnimationCache:destroyInstance")

	return CCAnimationCache:destroyInstance()
end

CCAnimationCache.purgeSharedAnimationCache = slot5.purgeSharedAnimationCache

function slot5.addAnimationsWithFile(slot0, ...)
	uv1 = "CCAnimationCache:addAnimationsWithFile"

	slot1("CCAnimationCache:addAnimationsWithFile", "cc.AnimationCache:addAnimations")

	return slot0:addAnimations(...)
end

CCAnimationCache.addAnimationsWithFile = slot5.addAnimationsWithFile

function slot5.animationByName(slot0, ...)
	uv1 = "CCAnimationCache:animationByName"

	slot1("CCAnimationCache:animationByName", "cc.AnimationCache:getAnimation")

	return slot0:getAnimation(...)
end

CCAnimationCache.animationByName = slot5.animationByName

function slot5.removeAnimationByName(slot0)
	uv1 = "CCAnimationCache:removeAnimationByName"

	slot1("CCAnimationCache:removeAnimationByName", "cc.AnimationCache:removeAnimation")

	return slot0:removeAnimation()
end

CCAnimationCache.removeAnimationByName = slot5.removeAnimationByName
slot6 = {
	sharedFileUtils = function ()
		uv0 = "CCFileUtils:sharedFileUtils"

		slot0("CCFileUtils:sharedFileUtils", "CCFileUtils:getInstance")

		return cc.FileUtils:getInstance()
	end
}
CCFileUtils.sharedFileUtils = slot6.sharedFileUtils

function slot6.purgeFileUtils()
	uv0 = "CCFileUtils:purgeFileUtils"

	slot0("CCFileUtils:purgeFileUtils", "CCFileUtils:destroyInstance")

	return cc.FileUtils:destroyInstance()
end

CCFileUtils.purgeFileUtils = slot6.purgeFileUtils
slot7 = {
	createWithItem = function (slot0, ...)
		uv1 = "CCMenuDeprecated:createWithItem"

		slot1("CCMenuDeprecated:createWithItem", "cc.Menu:createWithItem")

		return slot0:create(...)
	end
}
CCMenu.createWithItem = slot7.createWithItem

function slot7.setHandlerPriority(slot0)
	print("\n********** \n" .. "setHandlerPriority was deprecated in 3.0. \n**********")
end

CCMenu.setHandlerPriority = slot7.setHandlerPriority
slot8 = {
	boundingBox = function (slot0)
		uv1 = "CCNode:boundingBox"

		slot1("CCNode:boundingBox", "cc.Node:getBoundingBox")

		return slot0:getBoundingBox()
	end
}
CCNode.boundingBox = slot8.boundingBox

function slot8.numberOfRunningActions(slot0)
	uv1 = "CCNode:numberOfRunningActions"

	slot1("CCNode:numberOfRunningActions", "cc.Node:getNumberOfRunningActions")

	return slot0:getNumberOfRunningActions()
end

CCNode.numberOfRunningActions = slot8.numberOfRunningActions

function slot8.removeFromParentAndCleanup(slot0, ...)
	uv1 = "CCNode:removeFromParentAndCleanup"

	slot1("CCNode:removeFromParentAndCleanup", "cc.Node:removeFromParent")

	return slot0:removeFromParent(...)
end

CCNode.removeFromParentAndCleanup = slot8.removeFromParentAndCleanup
_G.CCDrawPrimitives = function ()
	uv0 = "CCDrawPrimitives"

	slot0("CCDrawPrimitives", "cc.DrawPrimitives")

	return cc.DrawPrimitives
end()
slot10 = {
	ccDrawPoint = function (slot0)
		uv1 = "ccDrawPoint"

		slot1("ccDrawPoint", "cc.DrawPrimitives.drawPoint")

		return cc.DrawPrimitives.drawPoint(slot0)
	end
}
_G.ccDrawPoint = slot10.ccDrawPoint

function slot10.ccDrawLine(slot0, slot1)
	uv2 = "ccDrawLine"

	slot2("ccDrawLine", "cc.DrawPrimitives.drawLine")

	return cc.DrawPrimitives.drawLine(slot0, slot1)
end

_G.ccDrawLine = slot10.ccDrawLine

function slot10.ccDrawRect(slot0, slot1)
	uv2 = "ccDrawRect"

	slot2("ccDrawRect", "cc.DrawPrimitives.drawRect")

	return cc.DrawPrimitives.drawRect(slot0, slot1)
end

_G.ccDrawRect = slot10.ccDrawRect

function slot10.ccDrawSolidRect(slot0, slot1, slot2)
	uv3 = "ccDrawSolidRect"

	slot3("ccDrawSolidRect", "cc.DrawPrimitives.drawSolidRect")

	return cc.DrawPrimitives.drawSolidRect(slot0, slot1, slot2)
end

_G.ccDrawSolidRect = slot10.ccDrawSolidRect

function slot10.ccDrawCircle(slot0, slot1, slot2, slot3, slot4, ...)
	uv5 = "ccDrawCircle"

	slot5("ccDrawCircle", "cc.DrawPrimitives.drawCircle")

	return cc.DrawPrimitives.drawCircle(slot0, slot1, slot2, slot3, slot4, ...)
end

_G.ccDrawCircle = slot10.ccDrawCircle

function slot10.ccDrawSolidCircle(slot0, slot1, slot2, slot3, ...)
	uv4 = "ccDrawSolidCircle"

	slot4("ccDrawSolidCircle", "cc.DrawPrimitives.drawSolidCircle")

	return cc.DrawPrimitives.drawSolidCircle(slot0, slot1, slot2, slot3, ...)
end

_G.ccDrawSolidCircle = slot10.ccDrawSolidCircle

function slot10.ccDrawQuadBezier(slot0, slot1, slot2, slot3)
	uv4 = "ccDrawQuadBezier"

	slot4("ccDrawQuadBezier", "cc.DrawPrimitives.drawQuadBezier")

	return cc.DrawPrimitives.drawQuadBezier(slot0, slot1, slot2, slot3)
end

_G.ccDrawQuadBezier = slot10.ccDrawQuadBezier

function slot10.ccDrawCubicBezier(slot0, slot1, slot2, slot3, slot4)
	uv5 = "ccDrawCubicBezier"

	slot5("ccDrawCubicBezier", "cc.DrawPrimitives.drawCubicBezier")

	return cc.DrawPrimitives.drawCubicBezier(slot0, slot1, slot2, slot3, slot4)
end

_G.ccDrawCubicBezier = slot10.ccDrawCubicBezier

function slot10.ccDrawCatmullRom(slot0, slot1)
	uv2 = "ccDrawCatmullRom"

	slot2("ccDrawCatmullRom", "cc.DrawPrimitives.drawCatmullRom")

	return cc.DrawPrimitives.drawCatmullRom(slot0, slot1)
end

_G.ccDrawCatmullRom = slot10.ccDrawCatmullRom

function slot10.ccDrawCardinalSpline(slot0, slot1, slot2)
	uv3 = "ccDrawCardinalSpline"

	slot3("ccDrawCardinalSpline", "cc.DrawPrimitives.drawCardinalSpline")

	return cc.DrawPrimitives.drawCardinalSpline(slot0, slot1, slot2)
end

_G.ccDrawCardinalSpline = slot10.ccDrawCardinalSpline

function slot10.ccDrawColor4B(slot0, slot1, slot2, slot3)
	uv4 = "ccDrawColor4B"

	slot4("ccDrawColor4B", "cc.DrawPrimitives.drawColor4B")

	return cc.DrawPrimitives.drawColor4B(slot0, slot1, slot2, slot3)
end

_G.ccDrawColor4B = slot10.ccDrawColor4B

function slot10.ccDrawColor4F(slot0, slot1, slot2, slot3)
	uv4 = "ccDrawColor4F"

	slot4("ccDrawColor4F", "cc.DrawPrimitives.drawColor4F")

	return cc.DrawPrimitives.drawColor4F(slot0, slot1, slot2, slot3)
end

_G.ccDrawColor4F = slot10.ccDrawColor4F

function slot10.ccPointSize(slot0)
	uv1 = "ccPointSize"

	slot1("ccPointSize", "cc.DrawPrimitives.setPointSize")

	return cc.DrawPrimitives.setPointSize(slot0)
end

_G.ccPointSize = slot10.ccPointSize
CCProgressTimer.setReverseProgress = ({
	setReverseProgress = function (slot0, ...)
		uv1 = "CCProgressTimer"

		slot1("CCProgressTimer", "CCProgressTimer:setReverseDirection")

		return slot0:setReverseDirection(...)
	end
}).setReverseProgress
slot12 = {
	spriteFrameByName = function (slot0, slot1)
		uv2 = "CCSpriteFrameCache:spriteFrameByName"

		slot2("CCSpriteFrameCache:spriteFrameByName", "CCSpriteFrameCache:getSpriteFrameByName")

		return slot0:getSpriteFrameByName(slot1)
	end
}
CCSpriteFrameCache.spriteFrameByName = slot12.spriteFrameByName

function slot12.sharedSpriteFrameCache()
	uv0 = "CCSpriteFrameCache:sharedSpriteFrameCache"

	slot0("CCSpriteFrameCache:sharedSpriteFrameCache", "CCSpriteFrameCache:getInstance")

	return CCSpriteFrameCache:getInstance()
end

CCSpriteFrameCache.sharedSpriteFrameCache = slot12.sharedSpriteFrameCache

function slot12.purgeSharedSpriteFrameCache()
	uv0 = "CCSpriteFrameCache:purgeSharedSpriteFrameCache"

	slot0("CCSpriteFrameCache:purgeSharedSpriteFrameCache", "CCSpriteFrameCache:destroyInstance")

	return CCSpriteFrameCache:destroyInstance()
end

CCSpriteFrameCache.purgeSharedSpriteFrameCache = slot12.purgeSharedSpriteFrameCache

function slot12.addSpriteFramesWithFile(slot0, ...)
	uv1 = "CCSpriteFrameCache:addSpriteFramesWithFile"

	slot1("CCSpriteFrameCache:addSpriteFramesWithFile", "CCSpriteFrameCache:addSpriteFrames")

	return slot0:addSpriteFrames(...)
end

rawset(CCSpriteFrameCache, "addSpriteFramesWithFile", slot12.addSpriteFramesWithFile)

function slot12.getSpriteFrameByName(slot0, ...)
	uv1 = "CCSpriteFrameCache:getSpriteFrameByName"

	slot1("CCSpriteFrameCache:getSpriteFrameByName", "CCSpriteFrameCache:getSpriteFrame")

	return slot0:getSpriteFrame(...)
end

CCSpriteFrameCache.getSpriteFrameByName = slot12.getSpriteFrameByName
CCLabelAtlas.create = ({
	create = function (slot0, ...)
		uv1 = "CCLabelAtlas:create"

		slot1("CCLabelAtlas:create", "CCLabelAtlas:_create")

		return slot0:_create(...)
	end
}).create

function _G.CCRectMake(slot0, slot1, slot2, slot3)
	uv4 = "CCRectMake(x,y,width,height)"

	slot4("CCRectMake(x,y,width,height)", "cc.rect(x,y,width,height) in lua")

	return cc.rect(slot0, slot1, slot2, slot3)
end

function _G.ccc3(slot0, slot1, slot2)
	uv3 = "ccc3(r,g,b)"

	slot3("ccc3(r,g,b)", "cc.c3b(r,g,b)")

	return cc.c3b(slot0, slot1, slot2)
end

function _G.ccp(slot0, slot1)
	uv2 = "ccp(x,y)"

	slot2("ccp(x,y)", "cc.p(x,y)")

	return cc.p(slot0, slot1)
end

function _G.CCSizeMake(slot0, slot1)
	uv2 = "CCSizeMake(width,height)"

	slot2("CCSizeMake(width,height)", "cc.size(width,height)")

	return cc.size(slot0, slot1)
end

function _G.ccc4(slot0, slot1, slot2, slot3)
	uv4 = "ccc4(r,g,b,a)"

	slot4("ccc4(r,g,b,a)", "cc.c4b(r,g,b,a)")

	return cc.c4b(slot0, slot1, slot2, slot3)
end

function _G.ccc4FFromccc3B(slot0)
	uv1 = "ccc4FFromccc3B(color3B)"

	slot1("ccc4FFromccc3B(color3B)", "cc.c4f(color3B.r / 255.0,color3B.g / 255.0,color3B.b / 255.0,1.0)")

	return cc.c4f(slot0.r / 255, slot0.g / 255, slot0.b / 255, 1)
end

function _G.ccc4f(slot0, slot1, slot2, slot3)
	uv4 = "ccc4f(r,g,b,a)"

	slot4("ccc4f(r,g,b,a)", "cc.c4f(r,g,b,a)")

	return cc.c4f(slot0, slot1, slot2, slot3)
end

function _G.ccc4FFromccc4B(slot0)
	uv1 = "ccc4FFromccc4B(color4B)"

	slot1("ccc4FFromccc4B(color4B)", "cc.c4f(color4B.r/255.0, color4B.g/255.0, color4B.b/255.0, color4B.a/255.0)")

	return cc.c4f(slot0.r / 255, slot0.g / 255, slot0.b / 255, slot0.a / 255)
end

function _G.ccc4FEqual(slot0, slot1)
	uv2 = "ccc4FEqual(a,b)"

	slot2("ccc4FEqual(a,b)", "a:equals(b)")

	return slot0:equals(slot1)
end

function _G.ccpLineIntersect(slot0, slot1, slot2, slot3, slot4, slot5)
	uv6 = "ccpLineIntersect"

	slot6("ccpLineIntersect", "cc.pIsLineIntersect")

	return cc.pIsLineIntersect(slot0, slot1, slot2, slot3, slot4, slot5)
end

function _G.CCPointMake(slot0, slot1)
	uv2 = "CCPointMake(x,y)"

	slot2("CCPointMake(x,y)", "cc.p(x,y)")

	return cc.p(slot0, slot1)
end

function _G.ccpNeg(slot0)
	uv1 = "ccpNeg"

	slot1("ccpNeg", "cc.pSub")

	return cc.pSub({
		x = 0,
		y = 0
	}, slot0)
end

function _G.ccpAdd(slot0, slot1)
	uv2 = "ccpAdd"

	slot2("ccpAdd", "cc.pAdd")

	return cc.pAdd(slot0, slot1)
end

function _G.ccpSub(slot0, slot1)
	uv2 = "ccpSub"

	slot2("ccpSub", "cc.pSub")

	return cc.pSub(slot0, slot1)
end

function _G.ccpMult(slot0, slot1)
	uv2 = "ccpMult"

	slot2("ccpMult", "cc.pMul")

	return cc.pMul(slot0, slot1)
end

function _G.ccpMidpoint(slot0, slot1)
	uv2 = "ccpMidpoint"

	slot2("ccpMidpoint", "cc.pMidpoint")

	return cc.pMidpoint(slot0, slot1)
end

function _G.ccpDot(slot0, slot1)
	uv2 = "ccpDot"

	slot2("ccpDot", "cc.pDot")

	return cc.pDot(slot0, slot1)
end

function _G.ccpCross(slot0, slot1)
	uv2 = "ccpCross"

	slot2("ccpCross", "cc.pCross")

	return cc.pCross(slot0, slot1)
end

function _G.ccpPerp(slot0)
	uv1 = "ccpPerp"

	slot1("ccpPerp", "cc.pPerp")

	return cc.pPerp(slot0)
end

function _G.ccpRPerp(slot0)
	uv1 = "ccpRPerp"

	slot1("ccpRPerp", "cc.RPerp")

	return cc.RPerp(slot0)
end

function _G.ccpProject(slot0, slot1)
	uv2 = "ccpProject"

	slot2("ccpProject", "cc.pProject")

	return cc.pProject(slot0, slot1)
end

function _G.ccpRotate(slot0, slot1)
	uv2 = "ccpRotate"

	slot2("ccpRotate", "cc.pRotate")

	return cc.pRotate(slot0, slot1)
end

function _G.ccpUnrotate(slot0, slot1)
	uv2 = "ccpUnrotate"

	slot2("ccpUnrotate", "cc.pUnrotate")

	return cc.pUnrotate(slot0, slot1)
end

function _G.ccpLengthSQ(slot0)
	uv1 = "ccpLengthSQ"

	slot1("ccpLengthSQ", "cc.pLengthSQ")

	return cc.pLengthSQ(slot0)
end

function _G.ccpDistanceSQ(slot0, slot1)
	uv2 = "ccpDistanceSQ"

	slot2("ccpDistanceSQ", "cc.pDistanceSQ")

	return cc.pDistanceSQ(slot0, slot1)
end

function _G.ccpLength(slot0)
	uv1 = "ccpLength"

	slot1("ccpLength", "cc.pGetLength")

	return cc.pGetLength(slot0)
end

function _G.ccpDistance(slot0, slot1)
	uv2 = "ccpDistance"

	slot2("ccpDistance", "cc.pGetDistance")

	return cc.pGetDistance(slot0, slot1)
end

function _G.ccpNormalize(slot0)
	uv1 = "ccpNormalize"

	slot1("ccpNormalize", "cc.pNormalize")

	return cc.pNormalize(slot0)
end

function _G.ccpForAngle(slot0)
	uv1 = "ccpForAngle"

	slot1("ccpForAngle", "cc.pForAngle")

	return cc.pForAngle(slot0)
end

function _G.ccpToAngle(slot0)
	uv1 = "ccpToAngle"

	slot1("ccpToAngle", "cc.pToAngleSelf")

	return cc.pToAngleSelf(slot0)
end

function _G.ccpClamp(slot0, slot1, slot2)
	uv3 = "ccpClamp"

	slot3("ccpClamp", "cc.pGetClampPoint")

	return cc.pGetClampPoint(slot0, slot1, slot2)
end

function _G.ccpFromSize(slot0)
	uv1 = "ccpFromSize(sz)"

	slot1("ccpFromSize(sz)", "cc.pFromSize")

	return cc.pFromSize(slot0)
end

function _G.ccpLerp(slot0, slot1, slot2)
	uv3 = "ccpLerp"

	slot3("ccpLerp", "cc.pLerp")

	return cc.pLerp(slot0, slot1, slot2)
end

function _G.ccpFuzzyEqual(slot0, slot1, slot2)
	uv3 = "ccpFuzzyEqual"

	slot3("ccpFuzzyEqual", "cc.pFuzzyEqual")

	return cc.pFuzzyEqual(slot0, slot1, slot2)
end

function _G.ccpCompMult(slot0, slot1)
	uv2 = "ccpCompMult"

	slot2("ccpCompMult", "cc.p")

	return cc.p(slot0.x * slot1.x, slot0.y * slot1.y)
end

function _G.ccpAngleSigned(slot0, slot1)
	uv2 = "ccpAngleSigned"

	slot2("ccpAngleSigned", "cc.pGetAngle")

	return cc.pGetAngle(slot0, slot1)
end

function _G.ccpAngle(slot0, slot1)
	uv2 = "ccpAngle"

	slot2("ccpAngle", "cc.pGetAngle")

	return cc.pGetAngle(slot0, ptw)
end

function _G.ccpRotateByAngle(slot0, slot1, slot2)
	uv3 = "ccpRotateByAngle"

	slot3("ccpRotateByAngle", "cc.pRotateByAngle")

	return cc.pRotateByAngle(slot0, slot1, slot2)
end

function _G.ccpSegmentIntersect(slot0, slot1, slot2, slot3)
	uv4 = "ccpSegmentIntersect"

	slot4("ccpSegmentIntersect", "cc.pIsSegmentIntersect")

	return cc.pIsSegmentIntersect(slot0, slot1, slot2, slot3)
end

function _G.ccpIntersectPoint(slot0, slot1, slot2, slot3)
	uv4 = "ccpIntersectPoint"

	slot4("ccpIntersectPoint", "cc.pGetIntersectPoint")

	return cc.pGetIntersectPoint(slot0, slot1, slot2, slot3)
end

function _G.vertex2(slot0, slot1)
	uv2 = "vertex2(x,y)"

	slot2("vertex2(x,y)", "cc.vertex2F(x,y)")

	return cc.vertex2F(slot0, slot1)
end

function _G.vertex3(slot0, slot1, slot2)
	uv3 = "vertex3(x,y,z)"

	slot3("vertex3(x,y,z)", "cc.Vertex3F(x,y,z)")

	return cc.Vertex3F(slot0, slot1, slot2)
end

function _G.tex2(slot0, slot1)
	uv2 = "tex2(u,v)"

	slot2("tex2(u,v)", "cc.tex2f(u,v)")

	return cc.tex2f(slot0, slot1)
end

function _G.ccc4BFromccc4F(slot0)
	uv1 = "ccc4BFromccc4F(color4F)"

	slot1("ccc4BFromccc4F(color4F)", "Color4B(color4F.r * 255.0, color4F.g * 255.0, color4F.b * 255.0, color4B.a * 255.0)")

	return Color4B(slot0.r * 255, slot0.g * 255, slot0.b * 255, color4B.a * 255)
end

function _G.ccColor3B()
	uv0 = "ccColor3B"

	slot0("ccColor3B", "cc.c3b(0,0,0)")

	return cc.c3b(0, 0, 0)
end

function _G.ccColor4B()
	uv0 = "ccColor4B"

	slot0("ccColor4B", "cc.c4b(0,0,0,0)")

	return cc.c4b(0, 0, 0, 0)
end

function _G.ccColor4F()
	uv0 = "ccColor4F"

	slot0("ccColor4F", "cc.c4f(0.0,0.0,0.0,0.0)")

	return cc.c4f(0, 0, 0, 0)
end

function _G.ccVertex2F()
	uv0 = "ccVertex2F"

	slot0("ccVertex2F", "cc.vertex2F(0.0,0.0)")

	return cc.vertex2F(0, 0)
end

function _G.ccVertex3F()
	uv0 = "ccVertex3F"

	slot0("ccVertex3F", "cc.Vertex3F(0.0, 0.0, 0.0)")

	return cc.Vertex3F(0, 0, 0)
end

function _G.ccTex2F()
	uv0 = "ccTex2F"

	slot0("ccTex2F", "cc.tex2F(0.0, 0.0)")

	return cc.tex2F(0, 0)
end

function _G.ccPointSprite()
	uv0 = "ccPointSprite"

	slot0("ccPointSprite", "cc.PointSprite(cc.vertex2F(0.0, 0.0),cc.c4b(0.0, 0.0, 0.0),0)")

	return cc.PointSprite(cc.vertex2F(0, 0), cc.c4b(0, 0, 0), 0)
end

function _G.ccQuad2()
	uv0 = "ccQuad2"

	slot0("ccQuad2", "cc.Quad2(cc.vertex2F(0.0, 0.0), cc.vertex2F(0.0, 0.0), cc.vertex2F(0.0, 0.0), cc.vertex2F(0.0, 0.0))")

	return cc.Quad2(cc.vertex2F(0, 0), cc.vertex2F(0, 0), cc.vertex2F(0, 0), cc.vertex2F(0, 0))
end

function _G.ccQuad3()
	uv0 = "ccQuad3"

	slot0("ccQuad3", "cc.Quad3(cc.Vertex3F(0.0, 0.0 ,0.0), cc.Vertex3F(0.0, 0.0 ,0.0), cc.Vertex3F(0.0, 0.0 ,0.0), cc.Vertex3F(0.0, 0.0 ,0.0))")

	return cc.Quad3(cc.Vertex3F(0, 0, 0), cc.Vertex3F(0, 0, 0), cc.Vertex3F(0, 0, 0), cc.Vertex3F(0, 0, 0))
end

function _G.ccV2F_C4B_T2F()
	uv0 = "ccV2F_C4B_T2F"

	slot0("ccV2F_C4B_T2F", "cc.V2F_C4B_T2F(cc.vertex2F(0.0, 0.0), cc.c4b(0 , 0, 0, 0 ), cc.tex2F(0.0, 0.0))")

	return cc.V2F_C4B_T2F(cc.vertex2F(0, 0), cc.c4b(0, 0, 0, 0), cc.tex2F(0, 0))
end

function _G.ccV2F_C4F_T2F()
	uv0 = "ccV2F_C4F_T2F"

	slot0("ccV2F_C4F_T2F", "cc.V2F_C4F_T2F(cc.vertex2F(0.0, 0.0), cc.c4f(0.0 , 0.0 , 0.0 , 0.0 ), cc.tex2F(0.0, 0.0))")

	return cc.V2F_C4F_T2F(cc.vertex2F(0, 0), cc.c4f(0, 0, 0, 0), cc.tex2F(0, 0))
end

function _G.ccV3F_C4B_T2F()
	uv0 = "ccV3F_C4B_T2F"

	slot0("ccV3F_C4B_T2F", "cc.V3F_C4B_T2F(cc.vertex3F(0.0, 0.0, 0.0), cc.c4b(0 , 0 , 0, 0 ), cc.tex2F(0.0, 0.0))")

	return cc.V3F_C4B_T2F(cc.vertex3F(0, 0, 0), cc.c4b(0, 0, 0, 0), cc.tex2F(0, 0))
end

function _G.ccV2F_C4B_T2F_Quad()
	uv0 = "ccV2F_C4B_T2F_Quad"

	slot0("ccV2F_C4B_T2F_Quad", "cc.V2F_C4B_T2F_Quad(cc.V2F_C4B_T2F(cc.vertex2F(0.0, 0.0), cc.c4b(0 , 0, 0, 0 ), cc.tex2F(0.0, 0.0)), cc.V2F_C4B_T2F(cc.vertex2F(0.0, 0.0), cc.c4b(0 , 0, 0, 0 ), cc.tex2F(0.0, 0.0)), cc.V2F_C4B_T2F(cc.vertex2F(0.0, 0.0), cc.c4b(0 , 0, 0, 0 ), cc.tex2F(0.0, 0.0)), cc.V2F_C4B_T2F(cc.vertex2F(0.0, 0.0), cc.c4b(0 , 0, 0, 0 ), cc.tex2F(0.0, 0.0)))")

	return cc.V2F_C4B_T2F_Quad(cc.V2F_C4B_T2F(cc.vertex2F(0, 0), cc.c4b(0, 0, 0, 0), cc.tex2F(0, 0)), cc.V2F_C4B_T2F(cc.vertex2F(0, 0), cc.c4b(0, 0, 0, 0), cc.tex2F(0, 0)), cc.V2F_C4B_T2F(cc.vertex2F(0, 0), cc.c4b(0, 0, 0, 0), cc.tex2F(0, 0)), cc.V2F_C4B_T2F(cc.vertex2F(0, 0), cc.c4b(0, 0, 0, 0), cc.tex2F(0, 0)))
end

function _G.ccV3F_C4B_T2F_Quad()
	uv0 = "ccV3F_C4B_T2F_Quad"

	slot0("ccV3F_C4B_T2F_Quad", "cc.V3F_C4B_T2F_Quad(_tl, _bl, _tr, _br)")

	return cc.V3F_C4B_T2F_Quad(cc.V3F_C4B_T2F(cc.vertex3F(0, 0, 0), cc.c4b(0, 0, 0, 0), cc.tex2F(0, 0)), cc.V3F_C4B_T2F(cc.vertex3F(0, 0, 0), cc.c4b(0, 0, 0, 0), cc.tex2F(0, 0)), cc.V3F_C4B_T2F(cc.vertex3F(0, 0, 0), cc.c4b(0, 0, 0, 0), cc.tex2F(0, 0)), cc.V3F_C4B_T2F(cc.vertex3F(0, 0, 0), cc.c4b(0, 0, 0, 0), cc.tex2F(0, 0)))
end

function _G.ccV2F_C4F_T2F_Quad()
	uv0 = "ccV2F_C4F_T2F_Quad"

	slot0("ccV2F_C4F_T2F_Quad", "cc.V2F_C4F_T2F_Quad(_bl, _br, _tl, _tr)")

	return cc.V2F_C4F_T2F_Quad(cc.V2F_C4F_T2F(cc.vertex2F(0, 0), cc.c4f(0, 0, 0, 0), cc.tex2F(0, 0)), cc.V2F_C4F_T2F(cc.vertex2F(0, 0), cc.c4f(0, 0, 0, 0), cc.tex2F(0, 0)), cc.V3F_C4B_T2F(cc.vertex2F(0, 0), cc.c4f(0, 0, 0, 0), cc.tex2F(0, 0)), cc.V2F_C4F_T2F(cc.vertex2F(0, 0), cc.c4f(0, 0, 0, 0), cc.tex2F(0, 0)))
end

function _G.ccT2F_Quad()
	uv0 = "ccT2F_Quad"

	slot0("ccT2F_Quad", "cc.T2F_Quad(_bl, _br, _tl, _tr)")

	return cc.T2F_Quad(cc.tex2F(0, 0), cc.tex2F(0, 0), cc.tex2F(0, 0), cc.tex2F(0, 0))
end

function _G.ccAnimationFrameData()
	uv0 = "ccAnimationFrameData"

	slot0("ccAnimationFrameData", "cc.AnimationFrameData( _texCoords, _delay, _size)")

	return cc.AnimationFrameData(cc.T2F_Quad(cc.tex2F(0, 0), cc.tex2F(0, 0), cc.tex2F(0, 0), cc.tex2F(0, 0)), 0, cc.size(0, 0))
end

function _G.tex2(slot0, slot1)
	uv2 = "tex2(u,v)"

	slot2("tex2(u,v)", "cc.tex2f(u,v)")

	return cc.tex2f(slot0, slot1)
end

CCApplication.sharedApplication = ({
	sharedApplication = function ()
		uv0 = "CCApplication:sharedApplication"

		slot0("CCApplication:sharedApplication", "CCApplication:getInstance")

		return CCApplication:getInstance()
	end
}).sharedApplication
CCDirector.sharedDirector = ({
	sharedDirector = function ()
		uv0 = "CCDirector:sharedDirector"

		slot0("CCDirector:sharedDirector", "CCDirector:getInstance")

		return CCDirector:getInstance()
	end
}).sharedDirector
slot78 = {
	sharedUserDefault = function ()
		uv0 = "CCUserDefault:sharedUserDefault"

		slot0("CCUserDefault:sharedUserDefault", "CCUserDefault:getInstance")

		return CCUserDefault:getInstance()
	end
}
CCUserDefault.sharedUserDefault = slot78.sharedUserDefault

function slot78.purgeSharedUserDefault()
	uv0 = "CCUserDefault:purgeSharedUserDefault"

	slot0("CCUserDefault:purgeSharedUserDefault", "CCUserDefault:destroyInstance")

	return CCUserDefault:destroyInstance()
end

CCUserDefault.purgeSharedUserDefault = slot78.purgeSharedUserDefault
slot79 = {
	vertex = function (slot0, slot1)
		uv2 = "vertex"

		slot2("vertex", "CCGrid3DAction:getVertex")

		return slot0:getVertex(slot1)
	end
}
CCGrid3DAction.vertex = slot79.vertex

function slot79.originalVertex(slot0, slot1)
	uv2 = "originalVertex"

	slot2("originalVertex", "CCGrid3DAction:getOriginalVertex")

	return slot0:getOriginalVertex(slot1)
end

CCGrid3DAction.originalVertex = slot79.originalVertex
slot80 = {
	tile = function (slot0, slot1)
		uv2 = "tile"

		slot2("tile", "CCTiledGrid3DAction:getTile")

		return slot0:getTile(slot1)
	end
}
CCTiledGrid3DAction.tile = slot80.tile

function slot80.originalTile(slot0, slot1)
	uv2 = "originalTile"

	slot2("originalTile", "CCTiledGrid3DAction:getOriginalTile")

	return slot0:getOriginalTile(slot1)
end

CCTiledGrid3DAction.originalTile = slot80.originalTile
slot81 = {
	stringForFormat = function (slot0)
		uv1 = "Texture2D:stringForFormat"

		slot1("Texture2D:stringForFormat", "Texture2D:getStringForFormat")

		return slot0:getStringForFormat()
	end
}
CCTexture2D.stringForFormat = slot81.stringForFormat

function slot81.bitsPerPixelForFormat(slot0)
	uv1 = "Texture2D:bitsPerPixelForFormat"

	slot1("Texture2D:bitsPerPixelForFormat", "Texture2D:getBitsPerPixelForFormat")

	return slot0:getBitsPerPixelForFormat()
end

CCTexture2D.bitsPerPixelForFormat = slot81.bitsPerPixelForFormat

function slot81.bitsPerPixelForFormat(slot0, slot1)
	uv2 = "Texture2D:bitsPerPixelForFormat"

	slot2("Texture2D:bitsPerPixelForFormat", "Texture2D:getBitsPerPixelForFormat")

	return slot0:getBitsPerPixelForFormat(slot1)
end

CCTexture2D.bitsPerPixelForFormat = slot81.bitsPerPixelForFormat

function slot81.defaultAlphaPixelFormat(slot0)
	uv1 = "Texture2D:defaultAlphaPixelFormat"

	slot1("Texture2D:defaultAlphaPixelFormat", "Texture2D:getDefaultAlphaPixelFormat")

	return slot0:getDefaultAlphaPixelFormat()
end

CCTexture2D.defaultAlphaPixelFormat = slot81.defaultAlphaPixelFormat
slot82 = {
	timerWithScriptHandler = function (slot0, slot1)
		uv2 = "CCTimer:timerWithScriptHandler"

		slot2("CCTimer:timerWithScriptHandler", "CCTimer:createWithScriptHandler")

		return CCTimer:createWithScriptHandler(slot0, slot1)
	end
}
CCTimer.timerWithScriptHandler = slot82.timerWithScriptHandler

function slot82.numberOfRunningActionsInTarget(slot0, slot1)
	uv2 = "CCActionManager:numberOfRunningActionsInTarget"

	slot2("CCActionManager:numberOfRunningActionsInTarget", "CCActionManager:getNumberOfRunningActionsInTarget")

	return slot0:getNumberOfRunningActionsInTarget(slot1)
end

CCTimer.numberOfRunningActionsInTarget = slot82.numberOfRunningActionsInTarget
slot83 = {
	fontSize = function ()
		uv0 = "CCMenuItemFont:fontSize"

		slot0("CCMenuItemFont:fontSize", "CCMenuItemFont:getFontSize")

		return CCMenuItemFont:getFontSize()
	end
}
CCMenuItemFont.fontSize = slot83.fontSize

function slot83.fontName()
	uv0 = "CCMenuItemFont:fontName"

	slot0("CCMenuItemFont:fontName", "CCMenuItemFont:getFontName")

	return CCMenuItemFont:getFontName()
end

CCMenuItemFont.fontName = slot83.fontName

function slot83.fontSizeObj(slot0)
	uv1 = "CCMenuItemFont:fontSizeObj"

	slot1("CCMenuItemFont:fontSizeObj", "CCMenuItemFont:getFontSizeObj")

	return slot0:getFontSizeObj()
end

CCMenuItemFont.fontSizeObj = slot83.fontSizeObj

function slot83.fontNameObj(slot0)
	uv1 = "CCMenuItemFont:fontNameObj"

	slot1("CCMenuItemFont:fontNameObj", "CCMenuItemFont:getFontNameObj")

	return slot0:getFontNameObj()
end

CCMenuItemFont.fontNameObj = slot83.fontNameObj
CCMenuItemToggle.selectedItem = ({
	selectedItem = function (slot0)
		uv1 = "CCMenuItemToggle:selectedItem"

		slot1("CCMenuItemToggle:selectedItem", "CCMenuItemToggle:getSelectedItem")

		return slot0:getSelectedItem()
	end
}).selectedItem
CCTileMapAtlas.tileAt = ({
	tileAt = function (slot0, slot1)
		uv2 = "CCTileMapAtlas:tileAt"

		slot2("CCTileMapAtlas:tileAt", "CCTileMapAtlas:getTileAt")

		return slot0:getTileAt(slot1)
	end
}).tileAt
slot86 = {
	tileAt = function (slot0, slot1)
		uv2 = "CCTMXLayer:tileAt"

		slot2("CCTMXLayer:tileAt", "CCTMXLayer:getTileAt")

		return slot0:getTileAt(slot1)
	end
}
CCTMXLayer.tileAt = slot86.tileAt

function slot86.tileGIDAt(slot0, slot1)
	uv2 = "CCTMXLayer:tileGIDAt"

	slot2("CCTMXLayer:tileGIDAt", "CCTMXLayer:getTileGIDAt")

	return slot0:getTileGIDAt(slot1)
end

CCTMXLayer.tileGIDAt = slot86.tileGIDAt

function slot86.positionAt(slot0, slot1)
	uv2 = "CCTMXLayer:positionAt"

	slot2("CCTMXLayer:positionAt", "CCTMXLayer:getPositionAt")

	return slot0:getPositionAt(slot1)
end

CCTMXLayer.positionAt = slot86.positionAt

function slot86.propertyNamed(slot0, slot1)
	uv2 = "CCTMXLayer:propertyNamed"

	slot2("CCTMXLayer:propertyNamed", "CCTMXLayer:getProperty")

	return slot0:getProperty(slot1)
end

CCTMXLayer.propertyNamed = slot86.propertyNamed
slot87 = {
	layerNamed = function (slot0, slot1)
		uv2 = "CCTMXTiledMap:layerNamed"

		slot2("CCTMXTiledMap:layerNamed", "CCTMXTiledMap:getLayer")

		return slot0:getLayer(slot1)
	end
}
CCTMXTiledMap.layerNamed = slot87.layerNamed

function slot87.propertyNamed(slot0, slot1)
	uv2 = "CCTMXTiledMap:propertyNamed"

	slot2("CCTMXTiledMap:propertyNamed", "CCTMXTiledMap:getProperty")

	return slot0:getProperty(slot1)
end

CCTMXTiledMap.propertyNamed = slot87.propertyNamed

function slot87.propertiesForGID(slot0, slot1)
	uv2 = "CCTMXTiledMap:propertiesForGID"

	slot2("CCTMXTiledMap:propertiesForGID", "CCTMXTiledMap:getPropertiesForGID")

	return slot0:getPropertiesForGID(slot1)
end

CCTMXTiledMap.propertiesForGID = slot87.propertiesForGID

function slot87.objectGroupNamed(slot0, slot1)
	uv2 = "CCTMXTiledMap:objectGroupNamed"

	slot2("CCTMXTiledMap:objectGroupNamed", "CCTMXTiledMap:getObjectGroup")

	return slot0:getObjectGroup(slot1)
end

CCTMXTiledMap.objectGroupNamed = slot87.objectGroupNamed
slot88 = {
	getStoringCharacters = function (slot0)
		uv1 = "CCTMXMapInfo:getStoringCharacters"

		slot1("CCTMXMapInfo:getStoringCharacters", "CCTMXMapInfo:isStoringCharacters")

		return slot0:isStoringCharacters()
	end
}
CCTMXMapInfo.getStoringCharacters = slot88.getStoringCharacters

function slot88.formatWithTMXFile(slot0, slot1)
	uv2 = "CCTMXMapInfo:formatWithTMXFile"

	slot2("CCTMXMapInfo:formatWithTMXFile", "CCTMXMapInfo:create")

	return CCTMXMapInfo:create(slot1)
end

CCTMXMapInfo.formatWithTMXFile = slot88.formatWithTMXFile

function slot88.formatWithXML(slot0, slot1, slot2)
	uv3 = "CCTMXMapInfo:formatWithXML"

	slot3("CCTMXMapInfo:formatWithXML", "TMXMapInfo:createWithXML")

	return CCTMXMapInfo:createWithXML(slot1, slot2)
end

CCTMXMapInfo.formatWithXML = slot88.formatWithXML
slot89 = {
	propertyNamed = function (slot0, slot1)
		uv2 = "CCTMXObjectGroup:propertyNamed"

		slot2("CCTMXObjectGroup:propertyNamed", "CCTMXObjectGroup:getProperty")

		return slot0:getProperty(slot1)
	end
}
CCTMXObjectGroup.propertyNamed = slot89.propertyNamed

function slot89.objectNamed(slot0, slot1)
	uv2 = "CCTMXObjectGroup:objectNamed"

	slot2("CCTMXObjectGroup:objectNamed", "CCTMXObjectGroup:getObject")

	return slot0:getObject(slot1)
end

CCTMXObjectGroup.objectNamed = slot89.objectNamed
CCRenderTexture.newCCImage = ({
	newCCImage = function (slot0)
		uv1 = "CCRenderTexture:newCCImage"

		slot1("CCRenderTexture:newCCImage", "CCRenderTexture:newImage")

		return slot0:newImage()
	end
}).newCCImage
slot91 = {
	setFlipX = function (slot0, slot1)
		uv2 = "CCSpriteDeprecated:setFlipX"

		slot2("CCSpriteDeprecated:setFlipX", "CCSpriteDeprecated:setFlippedX")

		return slot0:setFlippedX(slot1)
	end
}
cc.Sprite.setFlipX = slot91.setFlipX

function slot91.setFlipY(slot0, slot1)
	uv2 = "CCSpriteDeprecated:setFlipY"

	slot2("CCSpriteDeprecated:setFlipY", "CCSpriteDeprecated:setFlippedY")

	return slot0:setFlippedY(slot1)
end

cc.Sprite.setFlipY = slot91.setFlipY
slot92 = {
	setKeypadEnabled = function (slot0, slot1)
		return slot0:setKeyboardEnabled(slot1)
	end
}
cc.Layer.setKeypadEnabled = slot92.setKeypadEnabled

function slot92.isKeypadEnabled(slot0)
	return slot0:isKeyboardEnabled()
end

cc.Layer.isKeypadEnabled = slot92.isKeypadEnabled
slot93 = {
	setZOrder = function (slot0, slot1)
		uv2 = "cc.Node:setZOrder"

		slot2("cc.Node:setZOrder", "cc.Node:setLocalZOrder")

		return slot0:setLocalZOrder(slot1)
	end
}
cc.Node.setZOrder = slot93.setZOrder

function slot93.getZOrder(slot0)
	uv1 = "cc.Node:getZOrder"

	slot1("cc.Node:getZOrder", "cc.Node:getLocalZOrder")

	return slot0:getLocalZOrder()
end

cc.Node.getZOrder = slot93.getZOrder

function slot93.setVertexZ(slot0, slot1)
	uv2 = "cc.Node:setVertexZ"

	slot2("cc.Node:setVertexZ", "cc.Node:setPositionZ")

	return slot0:setPositionZ(slot1)
end

cc.Node.setVertexZ = slot93.setVertexZ

function slot93.getVertexZ(slot0)
	uv1 = "cc.Node:getVertexZ"

	slot1("cc.Node:getVertexZ", "cc.Node:getPositionZ")

	return slot0:getPositionZ()
end

cc.Node.getVertexZ = slot93.getVertexZ

function slot93.ignoreAnchorPointForPosition(slot0, slot1)
	uv2 = "cc.Node:ignoreAnchorPointForPosition"

	slot2("cc.Node:ignoreAnchorPointForPosition", "cc.Node:setIgnoreAnchorPointForPosition")

	return slot0:setIgnoreAnchorPointForPosition(slot1)
end

cc.Node.ignoreAnchorPointForPosition = slot93.ignoreAnchorPointForPosition
slot94 = {
	initWithVertexShaderByteArray = function (slot0, slot1, slot2)
		uv3 = "cc.GLProgram:initWithVertexShaderByteArray"

		slot3("cc.GLProgram:initWithVertexShaderByteArray", "cc.GLProgram:initWithByteArrays")

		return slot0:initWithByteArrays(slot1, slot2)
	end
}
cc.GLProgram.initWithVertexShaderByteArray = slot94.initWithVertexShaderByteArray

function slot94.initWithVertexShaderFilename(slot0, slot1, slot2)
	uv3 = "cc.GLProgram:initWithVertexShaderFilename"

	slot3("cc.GLProgram:initWithVertexShaderFilename", "cc.GLProgram:initWithFilenames")

	return slot0:initWithFilenames(slot1, slot2)
end

cc.GLProgram.initWithVertexShaderFilename = slot94.initWithVertexShaderFilename

function slot94.addAttribute(slot0, slot1, slot2)
	uv3 = "cc.GLProgram:addAttribute"

	slot3("cc.GLProgram:addAttribute", "cc.GLProgram:bindAttribLocation")

	return slot0:bindAttribLocation(slot1, slot2)
end

cc.GLProgram.addAttribute = slot94.addAttribute
