slot0 = require("app.views.city.activity.brave_challenge.adapt")
slot1 = {
	CAN_NOT_GOTTEN = 2,
	CAN_GOTTEN = 1,
	GOTTEN = 0
}
slot2 = class("BraveChallengeAchvView", Dialog)
slot2.RESOURCE_FILENAME = "activity_brave_challenge_achievement.json"
slot6.ended = bindHelper.self("onClose")
slot5.methods = {}
slot4.binds = {
	event = "touch"
}
slot3["topPanel.btnClose"] = {}
slot6.data = bindHelper.self("tabDatas")
slot6.item = bindHelper.self("tabItem")
slot6.showTab = bindHelper.self("showTab")

function slot6.onItem(slot0, slot1, slot2, slot3)
	slot6 = nil

	if slot3.select then
		slot1:get("normal"):hide()

		slot6 = slot1:get("selected"):show()
	else
		slot5:hide()

		slot6 = slot4:show()
	end

	if slot3.redHint then
		slot12 = slot0.showTab:read() ~= slot2
		slot12.activityId = slot3.id
		slot12.sign = slot3.sign
		slot12.type = slot3.type

		bind.extend(slot0, slot1, {
			class = "red_hint",
			props = {
				state = slot12,
				specialTag = slot3.redHint,
				listenData = {},
				onNode = function (slot0)
					uv3 = "xy"
					slot4 = slot3
					uv4 = "xy"

					slot0:xy(slot3.width(slot4) - 10, slot4:height() - 5)
				end
			}
		})
	end

	slot5:setTouchEnabled(false)

	slot11.ended = functools.partial(slot0.clickCell, slot2)
	slot10.methods = {}

	bind.touch(slot0, slot4, {})
	adapt.setAutoText(slot6:get("txt"), slot3.name, slot6:size().height - 40)
end

slot5.props = {}
slot6.clickCell = bindHelper.self("onTabClick")
slot5.handlers = {}
slot4.binds = {
	event = "extend",
	class = "listview"
}
slot3["leftPanel.tabList"] = {}
slot6.data = bindHelper.self("achvDatas1")
slot6.item = bindHelper.self("rankItem")
slot6.dataOrderCmpGen = bindHelper.self("onSortCards", true)
slot6.itemAction = {
	isAction = true
}

function slot6.onItem(slot0, slot1, slot2, slot3)
	slot1:multiget("achvDesc", "btnGet", "list", "got").achvDesc:text(slot3.desc)

	if next(slot3.award) ~= nil then
		uiEasy.createItemsToList(slot0, slot4.list, slot3.award, {
			scale = 0.8
		})
	end

	slot4.list:setScrollBarEnabled(false)

	slot8 = {
		methods = {}
	}
	slot9.ended = functools.partial(slot0.clickCell, slot3.csvId)

	bind.touch(slot0, slot4.btnGet, slot8)

	uv8 = "multiget"

	slot4.got:visible(slot3.get == slot8.GOTTEN)

	uv8 = "multiget"

	slot4.btnGet:visible(slot3.get ~= slot8.GOTTEN)

	slot5 = slot4.btnGet:get("txt")
	slot6 = slot5
	slot5 = slot5.text
	uv8 = "multiget"

	if slot3.get == slot8.GOTTEN then
		if not gLanguageCsv.received then
			slot7 = gLanguageCsv.spaceReceive
		end
	end

	slot5(slot6, slot7)

	uv6 = "multiget"

	if slot3.get ~= slot6.GOTTEN then
		uv6 = "multiget"

		if slot3.get ~= slot6.CAN_GOTTEN then
			if slot3.achType == 1 then
				if slot3.targetType == 3 then
					slot4.btnGet:get("txt"):text("0/1")
				else
					slot4.btnGet:get("txt"):text(slot3.progress .. "/" .. slot3.targetArg1)
				end
			end
		end
	end

	uiEasy.setBtnShader(slot4.btnGet, slot4.btnGet:get("txt"), slot3.get)
end

slot5.props = {
	asyncPreload = 5
}
slot6.clickCell = bindHelper.self("onGetBtn")
slot5.handlers = {}
slot4.binds = {
	event = "extend",
	class = "listview"
}
slot3["rewardPanel1.list"] = {
	varname = "list"
}
slot2.RESOURCE_BINDING = {
	rankItem = "rankItem",
	["leftPanel.tabItem"] = "tabItem",
	rewardPanel1 = "rewardPanel1"
}

function slot2.onCreate(slot0, slot1, slot2)
	slot0:initModel()

	slot0.baseInfo = slot2
	slot0.activityId = slot1
	slot0.showTab = idler.new(1)
	slot0.achvDatas1 = idlers.new()
	slot0.achvDatas2 = idlers.new()
	slot5.name = gLanguageCsv.achievement
	slot6 = slot0.activityId
	slot5.id = slot6
	uv6 = "initModel"
	slot5.sign = slot6.typ
	slot4[1] = {
		redHint = "braveChallengeAch",
		type = 1
	}
	slot5.name = gLanguageCsv.specialAchievement
	slot6 = slot0.activityId
	slot5.id = slot6
	uv6 = "initModel"
	slot5.sign = slot6.typ
	slot4[2] = {
		redHint = "braveChallengeAch",
		type = 2
	}
	slot3 = idlers.newWithMap({})
	slot0.tabDatas = slot3
	uv3 = "initModel"

	if slot3.typ == game.BRAVE_CHALLENGE_TYPE.anniversary then
		if not slot0.yyhuodongs then
			slot4 = slot0.commonBCData
		end
	end

	slot0.idler = slot4

	idlereasy.when(slot0.idler, function (slot0, slot1)
		slot2 = slot1 or {}
		uv3 = "activityId"

		if slot3 then
			uv3 = "valsums"
			slot2 = slot1[slot3.activityId] or {}
		end

		slot5 = {}
		slot6, slot7, slot8 = orderCsvPairs(csv.brave_challenge.achievement)

		for slot9, slot10 in slot6, slot7, slot8 do
			uv12 = "valsums"

			if slot10.groupID == slot12.baseInfo.achiSeqID then
				table.shallowcopy(slot10).csvId = slot9
				slot11.get = (slot2.stamps or {})[slot9]
				slot11.progress = (slot2.valsums or {})[slot9] or 0
				slot11.achType = slot10.type

				if slot10.type == 1 then
					table.insert({}, slot11)
				else
					table.insert(slot5, slot11)
				end
			end
		end

		uv6 = "valsums"
		slot7[1] = slot4
		slot7[2] = slot5
		slot6.datas = {}
		uv6 = "valsums"
		uv8 = "valsums"
		uv9 = "valsums"

		slot6.achvDatas1:update(slot8.datas[slot9.showTab:read()])
	end)
	slot0.showTab:addListener(function (slot0, slot1)
		uv2 = "tabDatas"
		slot2 = slot2.tabDatas:atproxy(slot1)
		slot2.select = false
		uv2 = "tabDatas"
		slot4 = slot0
		slot2 = slot2.tabDatas:atproxy(slot4)
		slot2.select = true
		uv2 = "tabDatas"
		uv4 = "tabDatas"

		slot2.achvDatas1:update(slot4.datas[slot0])
	end)
	slot0.rewardPanel1:show()
	Dialog.onCreate(slot0)
end

function slot2.initModel(slot0)
	slot0.yyhuodongs = gGameModel.role:getIdler("yyhuodongs")
	slot0.commonBCData = gGameModel.role:getIdler("normal_brave_challenge")
end

function slot2.onTabClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

function slot2.onGetBtn(slot0, slot1, slot2)
	uv5 = "gGameApp"

	gGameApp:requestServer(slot5.url("award"), function (slot0)
		gGameUI:showGainDisplay(slot0)
	end, slot0.activityId, slot2)
end

function slot2.onSortCards(slot0, slot1)
	return function (slot0, slot1)
		if (slot0.get or 0.5) ~= (slot1.get or 0.5) then
			return slot3 < slot2
		end

		return slot0.csvId < slot1.csvId
	end
end

return slot2
