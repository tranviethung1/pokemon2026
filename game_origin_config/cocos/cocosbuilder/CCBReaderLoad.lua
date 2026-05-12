if cc.CCBReader == nil then
	return
end

ccb = ccb or {}

function CCBReaderLoad(slot0, slot1, slot2)
	if slot1 == nil then
		return nil
	end

	slot4 = slot1:createCCBReader():load(slot0)
	slot5 = ""

	if slot2 ~= nil then
		slot9 = 1

		for slot13 = 1, table.getn(slot3:getOwnerCallbackNames()) do
			if type(slot2[slot6[slot13]]) == "function" then
				slot1:setCallback(tolua.cast(slot3:getOwnerCallbackNodes()[slot13], "cc.Node"), slot2[slot14], slot3:getOwnerCallbackControlEvents()[slot13])
			else
				print("Warning: Cannot find owner's lua function:" .. ":" .. slot14 .. " for ownerVar selector")
			end
		end

		for slot15 = 1, table.getn(slot3:getOwnerOutletNames()) do
			slot2[slot10[slot15]] = tolua.cast(slot3:getOwnerOutletNodes()[slot15], "cc.Node")
		end
	end

	for slot11 = 1, table.getn(slot3:getNodesWithAnimationManagers()) do
		slot12 = tolua.cast(slot6[slot11], "cc.Node")

		if tolua.cast(slot3:getAnimationManagersForNodes()[slot11], "cc.CCBAnimationManager"):getDocumentControllerName() == "" then
			-- Nothing
		end

		if ccb[slot14] ~= nil then
			ccb[slot14].mAnimationManager = slot13
		end

		for slot21 = 1, table.getn(slot13:getDocumentCallbackNames()) do
			slot22 = slot15[slot21]

			if slot14 ~= "" and ccb[slot14] ~= nil then
				if type(ccb[slot14][slot22]) == "function" then
					slot1:setCallback(tolua.cast(slot13:getDocumentCallbackNodes()[slot21], "cc.Node"), ccb[slot14][slot22], slot13:getDocumentCallbackControlEvents()[slot21])
				else
					print("Warning: Cannot found lua function [" .. slot14 .. ":" .. slot22 .. "] for docRoot selector")
				end
			end
		end

		for slot23 = 1, table.getn(slot13:getDocumentOutletNames()) do
			slot25 = tolua.cast(slot13:getDocumentOutletNodes()[slot23], "cc.Node")

			if ccb[slot14] ~= nil then
				ccb[slot14][slot18[slot23]] = tolua.cast(slot25, slot1:getNodeTypeName(slot25))
			end
		end

		for slot24 = 1, table.getn(slot13:getKeyframeCallbacks()) do
			slot25 = slot20[slot24]
			slot26, slot27 = string.find(slot25, ":")

			if tonumber(string.sub(slot25, 1, slot26 - 1)) == 1 and ccb[slot14] ~= nil then
				slot13:setCallFuncForLuaCallbackNamed(cc.CallFunc:create(ccb[slot14][string.sub(slot25, slot27 + 1, -1)]), slot25)
			elseif slot28 == 2 and slot2 ~= nil then
				slot13:setCallFuncForLuaCallbackNamed(cc.CallFunc:create(slot2[slot29]), slot25)
			end
		end

		if slot13:getAutoPlaySequenceId() ~= -1 then
			slot13:runAnimationsForSequenceIdTweenDuration(slot21, 0)
		end
	end

	return slot4
end

rawset(_G, "CCBuilderReaderLoad", function (slot0, slot1, slot2)
	print("\n********** \n" .. "CCBuilderReaderLoad(strFilePath,proxy,owner)" .. " was deprecated please use " .. "CCBReaderLoad(strFilePath,proxy,owner)" .. " instead.\n**********")

	return CCBReaderLoad(slot0, slot1, slot2)
end)
