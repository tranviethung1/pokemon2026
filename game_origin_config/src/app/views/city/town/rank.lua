slot0 = class("VisitRankView", Dialog)
slot1 = 100
slot0.RESOURCE_FILENAME = "town_home_rank.json"
slot0.RESOURCE_BINDING = {
	["leftPanel.item"] = "leftItem",
	["item.baseNode.midPanel1"] = "midPanel1",
	item = "item",
	emptyPanel = "emptyPanel",
	["item.baseNode.midPanel2"] = "midPanel2",
	down = "downPanel",
	["item.baseNode"] = "baseNode",
	["leftPanel.list"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("leftDatas"),
				item = bindHelper.self("leftItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot6 = nil

					if slot3.select then
						slot1:get("normal"):hide()

						slot6 = slot1:get("selected"):show()
					else
						slot5:hide()

						slot6 = slot4:show()
					end

					slot6:get("txt"):text(slot3.name):getVirtualRenderer():setLineSpacing(-10)
					adapt.setAutoText(slot6:get("txt"), slot3.name, slot6:size().height - 40)
					slot5:setTouchEnabled(false)
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onLeftItemClick")
			}
		}
	},
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 12,
				data = bindHelper.self("rankDatas"),
				item = bindHelper.self("item"),
				showTab = bindHelper.self("showTab"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot5 = slot1:get("baseNode")
					slot6 = slot5:get("midPanel1")

					slot6:hide()
					slot5:get("midPanel2"):hide()

					slot8 = slot6

					if slot0.showTab:read() == 2 then
						slot8 = slot7

						slot7:get("textServer"):text(string.format(gLanguageCsv.brackets, getServerArea(slot3.role.game_key or userDefault.getForeverLocalKey("serverKey", nil, {
							rawKey = true
						}), true)))
					end

					slot8:show()
					slot8:get("textName"):text(slot3.role.name)
					adapt.setTextScaleWithWidth(slot8:get("textName"), nil, 360)
					slot8:get("textLvNote"):text(gLanguageCsv.textLv)
					slot8:get("textLv"):text(slot3.role.level)

					slot10 = arraytools.hash(gGameModel.daily_record:read("town_home_role_liked"))

					if dataEasy.isUnlock(gUnlockCsv.townHomeScore) then
						slot5:get("text"):text(gLanguageCsv.townHomeVisitFinalScore):x(slot5:width() * 0.6)
						slot5:get("textDecorateNum"):text(slot3.town_home.fixed)
						slot5:get("textGet"):text(gLanguageCsv.townHomeVisitScore .. slot3.town_home.score):x(slot5:width() * 0.6)
						slot5:get("textSended"):hide()
						slot5:get("icon"):hide()
						adapt.oneLinePos(slot8:get("textName"), {
							slot8:get("textLvNote"),
							slot8:get("textLv")
						}, {
							cc.p(10, 0),
							cc.p(5, 0)
						}, "left")
					else
						slot5:get("textSended"):visible(slot10[slot3.role.id] ~= nil)
						slot5:get("textDecorateNum"):text(slot3.town_home.decorativeness)
						slot5:get("textGet"):text(gLanguageCsv.homeVisitGain .. " " .. slot3.town_home.liked)
						adapt.oneLinePos(slot5:get("textGet"), {
							slot5:get("icon"),
							slot5:get("textSended")
						}, cc.p(5, 0), "left")
					end

					adapt.oneLinePos(slot5:get("text"), slot5:get("textDecorateNum"), cc.p(5, 0), "left")
					uiEasy.setRankIcon(slot3.index or slot2, slot5:get("imgIcon"), slot5:get("textRank1"), slot5:get("textRank2"))
					bind.extend(slot0, slot5:get("head"), {
						event = "extend",
						class = "role_logo",
						props = {
							vip = false,
							level = false,
							logoId = slot3.role.logo,
							frameId = slot3.role.frame
						}
					})
					slot5:get("btnGo"):visible(slot3.role.id ~= gGameModel.role:read("id"))
					bind.touch(slot0, slot5:get("btnGo"), {
						methods = {
							ended = functools.partial(slot0.clickGo, slot1, slot3)
						}
					})

					if matchLanguage({
						"kr"
					}) then
						slot5:get("textSended"):setAnchorPoint(0, 0.5)
						slot5:get("textSended"):xy(cc.p(slot5:get("textGet"):x(), slot5:get("textGet"):y() - slot5:get("textGet"):height()))
					end
				end
			},
			handlers = {
				clickGo = bindHelper.self("onItemGoClick")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1, slot2)
	slot0.showTab = idler.new(1)
	slot0.rankDatas = idlers.new()
	slot0.cb = slot2
	slot0.datas = {
		slot1.ranking
	}
	slot0.isCanDown = true
	slot0.leftDatas = idlers.newWithMap({
		{
			select = true,
			name = gLanguageCsv.homeVisitRankCommonServer
		},
		{
			name = gLanguageCsv.homeVisitRankAllServer
		},
		{
			name = gLanguageCsv.homeVisitRankMyFriend
		}
	})

	slot0.showTab:addListener(function (slot0, slot1, slot2)
		uv3 = "lastRank"
		slot3.lastRank = nil
		uv3 = "lastRank"
		slot3 = slot3.leftDatas:atproxy(slot1)
		slot3.select = false
		uv3 = "lastRank"
		slot3.leftDatas:atproxy(slot0).select = true

		if slot0 ~= slot1 then
			uv3 = "lastRank"
			slot3.datas[slot0] = {}
		end

		slot3 = dataEasy.tryCallFunc
		uv4 = "lastRank"

		slot3(slot4.list, "setItemAction", {
			isAction = true
		})

		uv3 = "lastRank"

		if #slot3.datas[slot0] == 0 then
			uv3 = "lastRank"

			slot3:sendProtocol(0)
		end
	end, true)

	slot3 = slot0.list:getInnerContainer()

	slot0.list:onScroll(function (slot0)
		uv1 = "getPositionY"

		if slot1:getPositionY() >= -10 then
			uv2 = "isCanDown"

			if slot2.isCanDown then
				uv2 = "isCanDown"
				slot2.isCanDown = false
				uv2 = "isCanDown"

				slot2:sendProtocol()
			end
		end
	end)
	slot0:initData(slot1.ranking, slot1.rank, 0)
	slot0.emptyPanel:visible(slot0.rankDatas:size() == 0)
	slot0.emptyPanel:get("txt"):text(gLanguageCsv.homeVisitNoRank)
	Dialog.onCreate(slot0)
end

function slot0.onClose(slot0)
	if slot0.hasLiked then
		slot0:addCallbackOnExit(slot0.cb)
	end

	Dialog.onClose(slot0)

	return slot0
end

function slot0.onLeftItemClick(slot0, slot1, slot2)
	slot0.showTab:set(slot2)
end

function slot0.setDownDatas(slot0, slot1)
	slot2 = slot0.downPanel:multiget("textName", "textRank", "textLv", "textDecorate", "textDecoreNum", "textGetNum", "textLvNote", "imgIcon")
	slot0.lastRank = slot1 == 0 and slot0.lastRank or slot1

	slot2.textRank:text(slot0.lastRank == 0 and gLanguageCsv.noRank or slot0.lastRank)
	slot2.textName:text(gGameModel.role:read("name"))
	slot2.textLv:text(gGameModel.role:read("level"))
	slot2.textLvNote:text(gLanguageCsv.textLv2)

	slot3 = gGameModel.town:read("home")

	if dataEasy.isUnlock(gUnlockCsv.townHomeScore) then
		slot2.textDecorate:text(gLanguageCsv.townHomeVisitFinalScore)
		slot2.textDecoreNum:text(slot3.fixed or 0)
		slot2.textGetNum:text(gLanguageCsv.townHomeVisitScore .. slot3.score or 0)
		slot2.imgIcon:hide()
		adapt.oneLinePos(slot2.textGetNum, {
			slot2.textDecoreNum,
			slot2.textDecorate,
			slot2.textLv,
			slot2.textLvNote
		}, {
			cc.p(20, 0),
			cc.p(5, 0),
			cc.p(40, 0),
			cc.p(5, 0)
		}, "right")
	else
		slot2.textDecoreNum:text(slot3.decorativeness)
		slot2.textGetNum:text(gLanguageCsv.homeVisitGain .. slot3.liked)
		adapt.oneLinePos(slot2.imgIcon, {
			slot2.textGetNum,
			slot2.textDecoreNum,
			slot2.textDecorate
		}, cc.p(5, 0), "right")
	end
end

function slot0.sendProtocol(slot0, slot1)
	if slot0.isRequest then
		return
	end

	slot0.isRequest = true
	slot2 = slot0.showTab:read()

	if slot2 == 1 then
		gGameApp:requestServer("/game/town/society/home/rank", function (slot0)
			uv2 = "view"
			uv6 = "rank"

			slot2:initData(slot0.view.ranking, slot0.view.rank, slot6)
		end, 1, slot1 or #slot0.datas[slot2], 10)
	elseif slot2 == 2 then
		gGameApp:requestServer("/game/town/society/home/rank", function (slot0)
			uv2 = "view"
			uv6 = "rank"

			slot2:initData(slot0.view.ranking, slot0.view.rank, slot6)
		end, 2, slot1, 10)
	elseif slot2 == 3 then
		gGameApp:requestServer("/game/town/society/friend/search", function (slot0)
			slot1 = 0
			slot2 = slot0.view.roles

			table.sort(slot2, function (slot0, slot1)
				if slot0.town_home.fixed ~= slot1.town_home.fixed then
					return slot1.town_home.fixed < slot0.town_home.fixed
				end

				if slot0.town_home.score ~= slot1.town_home.score then
					return slot1.town_home.score < slot0.town_home.score
				end

				if slot0.town_home.liked ~= slot1.town_home.liked then
					return slot1.town_home.liked < slot0.town_home.liked
				end

				return false
			end)

			for slot6, slot7 in ipairs(slot2) do
				if slot7.role.id == gGameModel.role:read("id") then
					slot1 = slot6

					break
				end
			end

			uv3 = "view"

			slot3:initData(slot2, slot1, 0)
		end, true)
	end
end

function slot0.initData(slot0, slot1, slot2, slot3)
	slot0.isRequest = false
	slot5 = #slot1 == 10

	if slot3 == 0 then
		slot0.datas[slot0.showTab:read()] = slot1
	else
		for slot9, slot10 in ipairs(slot1) do
			table.insert(slot0.datas[slot4], slot10)
		end
	end

	if dataEasy.isUnlock(gUnlockCsv.townHomeScore) then
		mathEasy.setRankIndex(slot0.datas[slot4], function (slot0, slot1)
			return slot0.town_home.fixed == slot1.town_home.fixed and slot0.town_home.score == slot1.town_home.score
		end)
	end

	slot0.isCanDown = false

	slot0.rankDatas:update(slot0.datas[slot4])
	gGameUI:disableTouchDispatch(0.01)
	slot0.list:jumpToItem(slot3 - 3, cc.p(0, 1), cc.p(0, 1))

	slot0.isCanDown = slot5

	slot0.emptyPanel:visible(#slot0.datas[slot4] == 0)

	if slot2 and slot0.datas[slot4][slot2] and slot0.datas[slot4][slot2].index then
		slot2 = slot0.datas[slot4][slot2].index
	end

	slot0:setDownDatas(slot2)

	if slot4 == 3 then
		slot0.isCanDown = false
	end
end

function slot0.onItemGoClick(slot0, slot1, slot2, slot3)
	if slot3.role.id == gGameModel.role:read("id") then
		return
	end

	uiEasy.onTownHomeClick({
		name = slot3.role.name,
		roleID = slot3.role.id,
		serverKey = slot3.role.game_key,
		townDBID = slot3.town_home.town_db_id,
		likedCb = function (slot0)
			uv1 = "hasLiked"
			slot1.hasLiked = true

			if not dataEasy.isUnlock(gUnlockCsv.townHomeScore) then
				uv1 = "dataEasy"
				slot1 = slot1:get("baseNode")

				slot1:get("textSended"):show()
				slot1:get("textGet"):text(gLanguageCsv.homeVisitGain .. " " .. slot0.home.liked)
				adapt.oneLinePos(slot1:get("textGet"), {
					slot1:get("icon"),
					slot1:get("textSended")
				}, cc.p(5, 0), "left")

				if matchLanguage({
					"kr"
				}) then
					slot1:get("textSended"):setAnchorPoint(0, 0.5)
					slot1:get("textSended"):xy(cc.p(slot1:get("textGet"):x(), slot1:get("textGet"):y() - slot1:get("textGet"):height()))
				end
			end
		end
	})
end

return slot0
