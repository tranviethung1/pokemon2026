if ccs == nil then
	return
end

if not json then
	require("cocos.cocos2d.json")
end

require("cocos.cocostudio.StudioConstants")

function ccs.sendTriggerEvent(slot0)
	if ccs.TriggerMng.getInstance():get(slot0) == nil then
		return
	end

	for slot5 = 1, table.getn(slot1) do
		if slot1[slot5] ~= nil and slot6:detect() then
			slot6:done()
		end
	end
end

function ccs.registerTriggerClass(slot0, slot1)
	ccs.TInfo.new(slot0, slot1)
end

ccs.TInfo = class("TInfo")
ccs.TInfo._className = ""
ccs.TInfo._fun = nil

function ccs.TInfo.ctor(slot0, slot1, slot2)
	if slot2 ~= nil then
		slot0._className = slot1
		slot0._fun = slot2
	else
		slot0._className = slot1._className
		slot0._fun = slot1._fun
	end

	ccs.ObjectFactory.getInstance():registerType(slot0)
end

ccs.ObjectFactory = class("ObjectFactory")
ccs.ObjectFactory._typeMap = nil
ccs.ObjectFactory._instance = nil

function ccs.ObjectFactory.ctor(slot0)
	slot0._typeMap = {}
end

function ccs.ObjectFactory.getInstance()
	if ccs.ObjectFactory._instance == nil then
		ccs.ObjectFactory._instance = ccs.ObjectFactory.new()
	end

	return ccs.ObjectFactory._instance
end

function ccs.ObjectFactory.destroyInstance()
	ccs.ObjectFactory._instance = nil
end

function ccs.ObjectFactory.createObject(slot0, slot1)
	slot2 = nil

	if slot0._typeMap[slot1] ~= nil then
		slot2 = slot3._fun()
	end

	return slot2
end

function ccs.ObjectFactory.registerType(slot0, slot1)
	slot0._typeMap[slot1._className] = slot1
end

ccs.TriggerObj = class("TriggerObj")
ccs.TriggerObj._cons = {}
ccs.TriggerObj._acts = {}
ccs.TriggerObj._enable = false
ccs.TriggerObj._id = 0
ccs.TriggerObj._vInt = {}

function ccs.TriggerObj.extend(slot0)
	if not tolua.getpeer(slot0) then
		tolua.setpeer(slot0, {})
	end

	setmetatable(slot1, TriggerObj)

	return slot0
end

function ccs.TriggerObj.ctor(slot0)
	slot0:init()
end

function ccs.TriggerObj.init(slot0)
	slot0._id = 0
	slot0._enable = true
	slot0._cons = {}
	slot0._acts = {}
	slot0._vInt = {}
end

function ccs.TriggerObj.detect(slot0)
	if not slot0._enable or table.getn(slot0._cons) == 0 then
		return true
	end

	slot2 = nil

	for slot6 = 1, table.getn(slot0._cons) do
		if slot0._cons[slot6] ~= nil and slot2.detect ~= nil then
			slot1 = true and slot2:detect()
		end
	end

	return slot1
end

function ccs.TriggerObj.done(slot0)
	if not slot0._enable or table.getn(slot0._acts) == 0 then
		return
	end

	slot1 = nil

	for slot5 = 1, table.getn(slot0._acts) do
		if slot0._acts[slot5] ~= nil and slot1.done then
			slot1:done()
		end
	end
end

function ccs.TriggerObj.removeAll(slot0)
	slot1 = nil

	for slot5 = 1, table.getn(slot0._cons) do
		if slot0._cons[slot5] ~= nil then
			slot1:removeAll()
		end
	end

	slot0._cons = {}

	for slot5 = 1, table.getn(slot0._acts) do
		if slot0._acts[slot5] ~= nil then
			slot1:removeAll()
		end
	end

	slot0._acts = {}
end

function ccs.TriggerObj.serialize(slot0, slot1)
	slot0._id = slot1.id
	slot2 = 0

	if slot1.conditions ~= nil then
		for slot7 = 1, table.getn(slot3) do
			if slot3[slot7].classname ~= nil then
				assert(ccs.ObjectFactory.getInstance():createObject(slot9) ~= nil, string.format("class named %s can not implement!", slot9))
				slot10:serialize(slot8)
				slot10:init()
				table.insert(slot0._cons, slot10)
			end
		end
	end

	if slot1.actions ~= nil then
		for slot8 = 1, table.getn(slot4) do
			if slot4[slot8].classname ~= nil then
				assert(ccs.ObjectFactory.getInstance():createObject(slot10) ~= nil, string.format("class named %s can not implement!", slot10))
				slot11:serialize(slot9)
				slot11:init()
				table.insert(slot0._acts, slot11)
			end
		end
	end

	if slot1.events ~= nil then
		for slot9 = 1, table.getn(slot5) do
			if slot5[slot9].id >= 0 then
				table.insert(slot0._vInt, slot11)
			end
		end
	end
end

function ccs.TriggerObj.getId(slot0)
	return slot0._id
end

function ccs.TriggerObj.setEnable(slot0, slot1)
	slot0._enable = slot1
end

function ccs.TriggerObj.getEvents(slot0)
	return slot0._vInt
end

ccs.TriggerMng = class("TriggerMng")
ccs.TriggerMng._eventTriggers = nil
ccs.TriggerMng._triggerObjs = nil
ccs.TriggerMng._movementDispatches = nil
ccs.TriggerMng._instance = nil

function ccs.TriggerMng.ctor(slot0)
	slot0._triggerObjs = {}
	slot0._movementDispatches = {}
	slot0._eventTriggers = {}
end

function ccs.TriggerMng.getInstance()
	if ccs.TriggerMng._instance == nil then
		ccs.TriggerMng._instance = ccs.TriggerMng.new()
	end

	return ccs.TriggerMng._instance
end

function ccs.TriggerMng.destroyInstance()
	if ccs.TriggerMng._instance ~= nil then
		ccs.TriggerMng._instance:removeAll()

		ccs.TriggerMng._instance = nil
	end
end

function ccs.TriggerMng.triggerMngVersion(slot0)
	return "1.0.0.0"
end

function ccs.TriggerMng.parse(slot0, slot1)
	if json.decode(slot1, 1) == nil then
		return
	end

	for slot7 = 1, table.getn(slot2) do
		slot9 = ccs.TriggerObj.new()

		slot9:serialize(slot2[slot7])

		for slot14 = 1, table.getn(slot9:getEvents()) do
			slot0:add(slot10[slot14], slot9)
		end

		slot0._triggerObjs[slot9:getId()] = slot9
	end
end

function ccs.TriggerMng.get(slot0, slot1)
	return slot0._eventTriggers[slot1]
end

function ccs.TriggerMng.getTriggerObj(slot0, slot1)
	return slot0._triggerObjs[slot1]
end

function ccs.TriggerMng.add(slot0, slot1, slot2)
	if slot0._eventTriggers[slot1] == nil then
		slot3 = {}
	end

	slot4 = false

	for slot8 = 1, table.getn(slot3) do
		if slot3[slot8] == triggers then
			slot4 = true

			break
		end
	end

	if not slot4 then
		table.insert(slot3, slot2)

		slot0._eventTriggers[slot1] = slot3
	end
end

function ccs.TriggerMng.removeAll(slot0)
	for slot4 in pairs(slot0._eventTriggers) do
		for slot9 = 1, table.getn(slot0._eventTriggers[slot4]) do
			slot5[slot9]:removeAll()
		end
	end

	slot0._eventTriggers = {}
end

function ccs.TriggerMng.remove(slot0, slot1, slot2)
	if slot2 ~= nil then
		return slot0:removeObjByEvent(slot1, slot2)
	end

	assert(slot1 >= 0, "event must be larger than 0")

	if slot0._eventTriggers == nil then
		return false
	end

	if slot0._eventTriggers[slot1] == nil then
		return false
	end

	for slot7 = 1, table.getn(slot3) do
		if triggers[slot7] ~= nil then
			slot8:remvoeAll()
		end
	end

	slot0._eventTriggers[slot1] = nil

	return true
end

function ccs.TriggerMng.removeObjByEvent(slot0, slot1, slot2)
	assert(slot1 >= 0, "event must be larger than 0")

	if slot0._eventTriggers == nil then
		return false
	end

	if slot0._eventTriggers[slot1] == nil then
		return false
	end

	for slot7 = 1, table.getn(slot3) do
		if slot3[slot7] ~= nil and slot8 == slot2 then
			slot8:remvoeAll()
			table.remove(slot3, slot7)

			return true
		end
	end
end

function ccs.TriggerMng.removeTriggerObj(slot0, slot1)
	if slot0.getTriggerObj(slot1) == nil then
		return false
	end

	for slot7 = 1, table.getn(slot2:getEvents()) do
		slot0:remove(slot3[slot7], slot2)
	end

	return true
end

function ccs.TriggerMng.isEmpty(slot0)
	return slot0._eventTriggers ~= nil or table.getn(slot0._eventTriggers) <= 0
end

function __onParseConfig(slot0, slot1)
	if slot0 == cc.ConfigType.COCOSTUDIO then
		ccs.TriggerMng.getInstance():parse(slot1)
	end
end

function ccs.AnimationInfo(slot0, slot1, slot2)
	assert(slot0 ~= nil and type(slot0) == "string" and slot1 ~= nil and type(slot1) == "number" and slot2 ~= nil and type(slot2) == "number", "ccs.AnimationInfo() - invalid input parameters")

	return {
		name = slot0,
		startIndex = slot1,
		endIndex = slot2
	}
end
