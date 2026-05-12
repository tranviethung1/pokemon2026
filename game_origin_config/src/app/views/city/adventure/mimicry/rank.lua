slot0 = {
	"common/icon/logo_yellow.png",
	"common/icon/logo_blue.png",
	"common/icon/logo_green.png",
	"common/icon/logo_gray.png"
}
slot1 = csv.mimicry.boss
slot2 = class("MimicryRankView", Dialog)
slot2.RESOURCE_FILENAME = "mimicry_rank.json"
slot2.RESOURCE_BINDING = {
	mark = "mark",
	down = "down",
	item = "item",
	["title.textTitle2"] = "textTitle2",
	["title.textTitle1"] = "textTitle1",
	titlePanel = "titlePanel",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
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
		varname = "rankList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				margin = 12,
				asyncPreload = 4,
				data = bindHelper.self("rankDatas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:get("baseNode.textLv")
					slot5 = slot1:get("baseNode.textName")

					slot5:text(slot3.name)
					slot4:text(slot3.level)
					slot1:get("baseNode.server"):text(string.format(gLanguageCsv.brackets, getServerArea(slot3.game_key, true)))
					slot1:get("baseNode.max"):text(slot3.score)
					uiEasy.setRankIcon(slot2, slot1:get("baseNode.imgIcon"), slot1:get("baseNode.textRank1"), slot1:get("baseNode.textRank2"))
					adapt.oneLinePos(slot5, {
						slot1:get("baseNode.nodeLv"),
						slot4
					}, cc.p(3, 0))
					bind.extend(slot0, slot1:get("baseNode.head"), {
						event = "extend",
						class = "role_logo",
						props = {
							vip = false,
							level = false,
							logoId = slot3.logo,
							frameId = slot3.frame
						}
					})

					slot11 = "baseNode.bossName"
					slot9 = slot1:get(slot11)
					slot10 = slot9
					slot9 = slot9.text
					uv11 = "get"

					if slot11[slot3.boss_id] then
						uv11 = "get"

						if not slot11[slot3.boss_id].gateName then
							slot11 = "--"
						end
					end

					slot9(slot10, slot11)
					bind.touch(slot0, slot1, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2, slot3)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onItemClick")
			}
		}
	}
}

function slot2.onCreate(slot0, slot1, slot2)
	slot0:initModel()

	slot1 = slot1 or {}
	slot0.dataRank = slot1.ranks or {}
	slot0.rankDatas = idlers.newWithMap(slot0.dataRank)

	slot0.mark:visible(#slot0.dataRank == 0)
	slot0.down:visible(#slot0.dataRank ~= 0)
	slot0.titlePanel:visible(#slot0.dataRank ~= 0)
	slot0.rankList:visible(#slot0.dataRank ~= 0)
	slot0.down:get("textRank"):text(slot1.rank and slot1.rank ~= 0 and slot1.rank or gLanguageCsv.noRank)
	slot0.down:get("textName"):text(slot0.roleName)

	if slot1.boss_id then
		uv4 = "initModel"

		if slot4[slot1.boss_id] then
			uv4 = "initModel"

			if not slot4[slot1.boss_id].gateName then
				slot4 = "--"
			end
		end
	end

	slot0.down:get("bossName"):text(slot4)
	slot0.down:get("textLv"):text(slot0.level)
	slot0.down:get("maxNum"):text(slot1.score or "")
	adapt.oneLinePos(slot0.down:get("textName"), {
		slot0.down:get("nodeLV"),
		slot0.down:get("textLv")
	}, cc.p(5, 0))
	adapt.oneLinePos(slot0.textTitle1, slot0.textTitle2, cc.p(2, 0))

	slot7, slot8 = dataEasy.serverOpenDaysLess(csv.mimicry.base[1].rankingRequiredOpenDays)

	if slot7 then
		slot0.down:get("textRank"):hide()
		slot0.down:get("textName"):hide()
		slot0.down:get("bossName"):hide()
		slot0.down:get("maxNum"):hide()
		slot0.down:get("textLv"):hide()
		slot0.down:get("nodeLV"):text(string.format(gLanguageCsv.mimicryOpenDay, slot6 - slot8 - 1, slot6))

		slot9 = slot0.down:get("nodeLV"):size()

		slot0.down:get("nodeLV"):anchorPoint(0.5, 0.5)
		slot0.down:get("nodeLV"):xy(900, 45)
	end

	if slot2 <= #slot0.dataRank then
		slot0.isCanDown = true
		slot0.offect = slot2 + 1
		slot0.addRankDataCount = 10
		slot9 = slot0.rankList:getInnerContainer()

		performWithDelay(slot0, function ()
			uv0 = "rankList"

			slot0.rankList:onScroll(function (slot0)
				uv1 = "getPositionY"

				if slot1:getPositionY() >= -10 then
					uv2 = "isCanDown"

					if slot2.isCanDown then
						uv2 = "isCanDown"
						slot2 = slot2.rankList
						slot3 = slot2
						uv3 = "isCanDown"

						if slot2.getChildrenCount(slot3) == #slot3.dataRank then
							uv2 = "isCanDown"
							slot2.isCanDown = false
							uv2 = "isCanDown"

							slot2:sendProtocol()
						end
					end
				end
			end)
		end, 0)
	end

	Dialog.onCreate(slot0)
end

function slot2.sendProtocol(slot0)
	gGameApp:requestServer("/game/cross/mimicry/rank", function (slot0)
		uv2 = "tolua"

		if tolua.isnull(slot2) then
			return
		end

		uv1 = "tolua"

		slot1:initData(slot0.view.ranks)
	end, slot0.offect, slot0.addRankDataCount)
end

function slot2.initData(slot0, slot1)
	if not slot1 or #slot1 == 0 then
		return
	end

	for slot5, slot6 in ipairs(slot1) do
		table.insert(slot0.dataRank, slot6)
	end

	slot0.rankDatas:update(slot0.dataRank)

	slot0.offect = slot0.offect + #slot1
	slot0.isCanDown = slot0.addRankDataCount <= #slot1
end

function slot2.initModel(slot0)
	slot0.roleId = gGameModel.mimicry:read("role_db_id")
	slot0.roleName = gGameModel.role:read("name")
	slot0.level = gGameModel.role:read("level")
end

function slot2.onItemClick(slot0, slot1, slot2, slot3)
	gGameUI:stackUI("city.adventure.mimicry.personal_info", nil, , slot3)
end

return slot2
