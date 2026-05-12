slot0 = class("DailyActivityRankView", Dialog)
slot0.RESOURCE_FILENAME = "daily_activity_rank.json"
slot0.RESOURCE_BINDING = {
	item = "item",
	empty = "empty",
	["empty.txt2"] = "txtEmpty",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["down.textName"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("myName")
		}
	},
	["down.textRank"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("myRank")
		}
	},
	["down.textPoint"] = {
		binds = {
			event = "text",
			idler = bindHelper.self("myScore")
		}
	},
	list = {
		varname = "list",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 4,
				data = bindHelper.self("rankDatas"),
				item = bindHelper.self("item"),
				itemAction = {
					isAction = true
				},
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("imgIcon", "textRank", "head", "textName", "textPoint", "textLvNote", "textLv")

					slot4.textName:text(slot3.name)
					slot4.textLv:text(slot3.level)
					adapt.oneLinePos(slot4.textLvNote, slot4.textLv, cc.p(0, slot4.textLvNote:y() - slot4.textLv:y()))

					if slot2 < 4 then
						slot4.imgIcon:texture(ui.RANK_ICON[slot2])
						slot4.textRank:hide()
					else
						slot4.imgIcon:hide()
						slot4.textRank:text(slot2)
					end

					bind.extend(slot0, slot4.head, {
						event = "extend",
						class = "role_logo",
						props = {
							vip = false,
							level = false,
							logoId = slot3.logo,
							frameId = slot3.frame,
							onNode = function (slot0)
								slot0:scale(0.9)
							end
						}
					})
					slot4.textPoint:text(slot3.score)
					slot1:setTouchEnabled(false)
				end,
				onAfterBuild = function (slot0)
					slot0.afterBuild()
				end
			},
			handlers = {
				afterBuild = bindHelper.self("onAfterBuild")
			}
		}
	}
}

function slot0.onCreate(slot0, slot1)
	slot0:initModel()

	if matchLanguage({
		"en",
		"kr"
	}) then
		adapt.setTextAdaptWithSize(slot0.txtEmpty, {
			margin = -8,
			vertical = "center",
			horizontal = "center",
			size = cc.size(450, 200)
		})
		slot0.txtEmpty:xy(slot0.txtEmpty:x() - 10, slot0.txtEmpty:y() - 15)
	end

	slot0.empty:hide()

	slot0.rankDatas = slot1.rank

	if slot1.myrank == 0 then
		slot1.myrank = gLanguageCsv.noRank
	end

	slot0.myRank = idler.new(slot1.myrank)

	if slot1.score ~= 0 then
		slot0.myScore = idler.new(slot1.score)
	end

	Dialog.onCreate(slot0)
end

function slot0.initModel(slot0)
	slot0.myName = gGameModel.role:getIdler("name")
end

function slot0.onAfterBuild(slot0)
	slot0.empty:visible(itertools.isempty(slot0.rankDatas))
end

return slot0
