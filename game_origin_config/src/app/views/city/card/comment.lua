slot0 = 20
slot1 = {
	OPEN = 3,
	DEL = 2,
	REFRESH = 4,
	SEND = 1
}
slot2 = {
	"common/icon/logo_arrow_green.png",
	"city/card/comment/logo_line.png",
	"common/icon/logo_arrow_red.png"
}
slot4 = class("CardCommentView", cc.load("mvc").ViewBase)
slot4.RESOURCE_FILENAME = "card_comment.json"
slot4.RESOURCE_BINDING = {
	["right.item.head"] = "textItemHead",
	["right.item.top"] = "textItemTop",
	["center.starDesc"] = "starDesc",
	["right.item"] = "commentItem",
	["right.item.list"] = "textItemList",
	["right.item.bottom.btnLike"] = "btnLike",
	["center.scoreBg.img"] = "scoreImg",
	center = "center",
	["right.textInput"] = "textInput",
	["right.noComment"] = "noComment",
	mask = "mask",
	["right.btnComment"] = "btnComment",
	["center.star"] = "star",
	["right.item.bg"] = "textItemBg",
	["center.pageItem"] = "pageItem",
	["right.item.bottom.btnDislike"] = "btnDislike",
	["right.list"] = {
		varname = "commentList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				asyncPreload = 5,
				disableOnScroll = true,
				data = bindHelper.self("commentData"),
				item = bindHelper.self("commentItem"),
				scrollState = bindHelper.self("scrollState"),
				preloadCenter = bindHelper.self("preloadCenter"),
				isEnd = bindHelper.self("isEnd"),
				itemAction = {
					isAction = true
				},
				onBeforeBuild = function (slot0)
					slot0.scrollState:set(false)
					slot0:setRenderHint(0)
				end,
				onAfterBuild = function (slot0)
					slot0.scrollState:set(true)
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					if slot2 == itertools.size(slot0.data) then
						slot0.isEnd:set(true)
					end

					slot4 = slot1:multiget("head", "list", "top", "bottom", "bg")
					slot5 = slot4.head:multiget("head", "lv", "lv1")
					slot6 = slot4.top:multiget("name", "vip", "btnDel", "tag", "tag2")
					slot7 = slot4.bottom:multiget("btnMore", "time", "txtLike", "txtDislike", "btnLike", "btnDislike")

					bind.extend(slot0, slot5.head, {
						event = "extend",
						class = "role_logo",
						props = {
							vip = false,
							level = false,
							logoId = slot3.logo,
							frameId = slot3.frame,
							onNode = function (slot0)
								slot0:xy(104, 95):z(6):scale(0.9)
							end
						}
					})
					slot5.lv:text(gLanguageCsv.textLv)
					slot5.lv1:text(slot3.level)
					adapt.oneLinePos(slot5.lv, slot5.lv1, cc.p(0, 0), "left")
					slot6.name:text(slot3.name)
					slot6.vip:hide()
					adapt.oneLinePos(slot6.name, slot6.vip, cc.p(10, 0), "left")
					slot6.tag:hide()
					slot6.tag2:hide()
					slot6.btnDel:hide()

					if slot3.key == "hot" then
						slot6.tag:texture("city/card/comment/logo_hot_pl.png"):show()

						if gGameModel.role:read("id") == slot3.val.role_db_id then
							slot6.tag2:texture("city/card/comment/logo_zi_pl.png"):show()
							slot6.btnDel:show()
						end
					elseif slot3.key == "my" then
						slot6.tag:texture("city/card/comment/logo_zi_pl.png"):show()
						slot6.btnDel:show()
					end

					slot8, slot9 = beauty.textScroll({
						align = "left",
						list = slot4.list,
						strs = slot3.val.content
					})

					slot4.list:setTouchEnabled(false)

					if slot3.listH < slot9 then
						if slot3.listH < slot8:size().height then
							slot7.btnMore:get("normal"):hide()
							slot7.btnMore:get("select"):show()
						else
							slot11:show()
							slot12:hide()
						end
					else
						slot11:hide()
						slot12:hide()
					end

					bind.click(slot1, slot11, {
						method = function ()
							uv0 = "switch"

							slot0()

							uv0 = "switch"
							slot0.switch = true
						end
					})

					if slot3.switch then
						function ()
							uv0 = "height"
							slot0 = slot0.height
							uv2 = "nodeH"
							uv3 = "listH"
							uv4 = "nodeH"
							slot4 = slot4.listH
							slot3 = slot3 - slot4
							slot2 = slot2.nodeH + slot3

							slot0(slot0, slot2)

							uv0 = "bg"
							slot0 = slot0.bg
							slot0 = slot0.height
							uv2 = "nodeH"
							uv3 = "listH"
							uv4 = "nodeH"
							slot4 = slot4.listH
							slot3 = slot3 - slot4
							slot2 = slot2.bgH + slot3

							slot0(slot0, slot2)

							uv0 = "bg"
							slot0 = slot0.bg
							slot0 = slot0.y
							uv2 = "nodeH"
							uv3 = "listH"
							uv4 = "nodeH"
							slot4 = slot4.listH
							slot3 = slot3 - slot4
							slot2 = slot2.bgY + slot3

							slot0(slot0, slot2)

							uv0 = "bgH"
							slot0 = slot0.height
							uv2 = "listH"

							slot0(slot0, slot2)

							uv0 = "bg"
							slot0 = slot0.top
							slot0 = slot0.y
							uv2 = "nodeH"
							uv3 = "listH"
							uv4 = "nodeH"
							slot4 = slot4.listH
							slot3 = slot3 - slot4
							slot2 = slot2.topY + slot3

							slot0(slot0, slot2)

							uv0 = "bg"
							slot0 = slot0.head
							slot0 = slot0.y
							uv2 = "nodeH"
							uv3 = "listH"
							uv4 = "nodeH"

							slot0(slot0, slot2.headY + slot3 - slot4.listH)

							uv0 = "y"
							slot0 = slot0.refreshView

							slot0(slot0)

							uv0 = "bgY"
							slot0 = slot0.show

							slot0(slot0)

							uv0 = "top"

							slot0:hide()
						end()
					end

					bind.click(slot1, slot12, {
						method = function ()
							uv0 = "height"
							slot0 = slot0.height
							uv2 = "nodeH"
							slot2 = slot2.nodeH

							slot0(slot0, slot2)

							uv0 = "bg"
							slot0 = slot0.bg
							slot0 = slot0.height
							uv2 = "nodeH"
							slot2 = slot2.bgH

							slot0(slot0, slot2)

							uv0 = "bg"
							slot0 = slot0.bg
							slot0 = slot0.y
							uv2 = "nodeH"
							slot2 = slot2.bgY

							slot0(slot0, slot2)

							uv0 = "bgH"
							slot0 = slot0.height
							uv2 = "nodeH"
							slot2 = slot2.listH

							slot0(slot0, slot2)

							uv0 = "bg"
							slot0 = slot0.top
							slot0 = slot0.y
							uv2 = "nodeH"
							slot2 = slot2.topY

							slot0(slot0, slot2)

							uv0 = "bg"
							slot0 = slot0.head
							slot0 = slot0.y
							uv2 = "nodeH"

							slot0(slot0, slot2.headY)

							uv0 = "y"
							slot0 = slot0.refreshView

							slot0(slot0)

							uv0 = "bgY"
							slot0 = slot0.show

							slot0(slot0)

							uv0 = "listH"
							slot0 = slot0.hide

							slot0(slot0)

							uv0 = "nodeH"
							slot0.switch = false
						end
					})

					slot14 = time.getDate(slot3.val.time)

					slot7.time:text(slot14.year .. "-" .. slot14.month .. "-" .. slot14.day .. "  " .. slot14.hour .. ":" .. slot14.min)
					slot7.txtLike:text(slot3.val.like)
					slot7.txtDislike:text(slot3.val.dislike)
					bind.touch(slot1, slot6.btnDel, {
						methods = {
							ended = functools.partial(slot0.btnDelClick, slot1, slot4, slot8, {
								listH = slot3.listH,
								nodeH = slot3.nodeH,
								bgH = slot3.bgH,
								bgY = slot3.bgY,
								topY = slot3.topY,
								headY = slot3.headY
							}, slot3)
						}
					})

					if gGameModel.role:read("id") ~= slot3.val.role_db_id then
						bind.touch(slot1, slot5.head, {
							methods = {
								ended = functools.partial(slot0.headClick, slot4.head, slot2, slot3)
							}
						})
					end

					slot7.btnLike:get("select"):visible(slot3.like)
					slot7.btnLike:get("normal"):visible(not slot3.like)
					slot7.btnDislike:get("select"):visible(slot3.dislike)
					slot7.btnDislike:get("normal"):visible(not slot3.dislike)
					bind.touch(slot1, slot7.btnLike, {
						methods = {
							ended = functools.partial(slot0.likeClick, slot2, slot3, slot3.like)
						}
					})
					bind.touch(slot1, slot7.btnDislike, {
						methods = {
							ended = functools.partial(slot0.dislikeClick, slot2, slot3, slot3.dislike)
						}
					})
				end
			},
			handlers = {
				btnDelClick = bindHelper.self("onBtnDel"),
				headClick = bindHelper.self("onHeadClick"),
				likeClick = bindHelper.self("onLikeClick"),
				dislikeClick = bindHelper.self("onDislikeClick")
			}
		}
	},
	["center.pageList"] = {
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("evolutionDatas"),
				item = bindHelper.self("pageItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot1:get("normal"):visible(slot3.select ~= true)
					slot1:get("select"):visible(slot3.select == true)
				end,
				onAfterBuild = function (slot0)
					slot0:setItemAlignCenter()
				end
			},
			handlers = {
				itemClick = bindHelper.self("onItemClick")
			}
		}
	},
	["left.btnRank"] = {
		varname = "btnRank",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onBtnRank")
			}
		}
	},
	["left.btnRank.txt"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["center.scoreBg.txt1"] = {
		varname = "scoreTxt1",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c4b(251, 139, 101, 255)
				}
			}
		}
	},
	["center.scoreBg.txt2"] = {
		varname = "scoreTxt2",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = ui.COLORS.OUTLINE.WHITE
				}
			}
		}
	},
	["center.scoreBg.txt3"] = {
		varname = "scoreTxt3",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c4b(251, 139, 101, 255)
				}
			}
		}
	}
}

function slot4.onCreate(slot0, slot1, slot2, slot3)
	gGameUI.topuiManager:createView("title", slot0, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "COMMENT",
		title = gLanguageCsv.comment
	})

	slot0.cardId = slot1
	slot0.score = slot3
	slot0.data = slot2
	slot0.textItemListH = slot0.textItemList:size().height
	slot0.itemListH = slot0.commentItem:size().height
	slot0.textItemBgH = slot0.textItemBg:size().height
	slot0.textItemBgY = slot0.textItemBg:y()
	slot0.textItemTopY = slot0.textItemTop:y()
	slot0.textItemHeadY = slot0.textItemHead:y()

	slot0.commentItem:get("list"):setScrollBarEnabled(false)

	slot0.preloadCenter = idler.new(0)
	slot0.isEnd = idler.new(false)

	slot0:initModel()
	idlereasy.when(slot0.cardCommentCounter, function (slot0, slot1)
		slot2 = {}

		for slot6, slot7 in pairs(slot1) do
			if not slot2[csv.cards[slot6].cardMarkID] then
				slot2[slot8.cardMarkID] = 0
			end

			slot2[slot8.cardMarkID] = slot2[slot8.cardMarkID] + slot7
		end

		uv3 = "pairs"
		slot3.commentCounter = slot2
	end)

	slot0.evolutionDatas = idlers.new()
	slot0.commentData = idlers.new()
	slot0.isCanDown = true
	slot4 = idler.new(true)
	slot0.scrollState = slot4
	uv4 = "gGameUI"
	slot0.commentState = slot4.OPEN

	slot0:commentListData()
	idlereasy.when(slot0.commentData, function (slot0, slot1)
		uv2 = "noComment"
		slot2 = slot2.noComment
		slot3 = slot2
		slot2 = slot2.visible
		uv4 = "visible"

		if not slot4.my[1] then
			uv4 = "visible"

			if not slot4.new[1] then
				uv4 = "visible"
				slot4 = not slot4.hot[1]
			end
		else
			slot4 = false
		end

		slot2(slot3, slot4)
	end)
	slot0:initCard()
	slot0:initComment()

	slot4 = slot0.commentList:getInnerContainer()

	slot0.commentList:onScroll(function (slot0)
		uv1 = "getPositionY"
		slot1 = slot1:getPositionY()

		if slot0.name == "SCROLL_TO_TOP" or slot0.name == "SCROLL_TO_BOTTOM" then
			uv2 = "name"

			if slot2.commentList.quickFor then
				uv2 = "name"
				slot2 = slot2.commentList
				slot2 = slot2.quickFor

				slot2(slot2)

				uv2 = "name"

				slot2.scrollState:set(true)
			end
		elseif slot1 >= -10 then
			uv2 = "name"

			if slot2.scrollState:read() then
				uv2 = "name"

				if not slot2.isRequest then
					uv2 = "name"

					if slot2.isCanDown then
						uv2 = "name"
						slot2 = slot2.isEnd
						slot3 = slot2
						slot2 = slot2.set

						slot2(slot3, false)

						uv2 = "name"
						uv3 = "SCROLL_TO_TOP"
						slot2.commentState = slot3.OPEN
						uv2 = "name"

						slot2:sendProtocol()
					else
						uv2 = "name"

						if slot2.isEnd:read() then
							gGameUI:showTip(gLanguageCsv.noMoreComment)
						end
					end
				end
			end
		end
	end)
end

function slot4.initData(slot0, slot1)
	uv3 = "commentState"

	if slot0.commentState == slot3.OPEN then
		uv3 = "OPEN"
		slot0.isCanDown = #slot1.new == slot3
	end

	uv3 = "commentState"

	if slot0.commentState == slot3.REFRESH then
		slot0.data.new = {}
	end

	slot0.data.hot = slot1.hot
	slot0.data.my = slot1.my

	for slot5, slot6 in ipairs(slot1.new) do
		table.insert(slot0.data.new, slot6)
	end

	for slot5, slot6 in pairs(slot1.like) do
		slot0.data.like[slot5] = slot6
	end

	for slot5, slot6 in pairs(slot1.dislike) do
		slot0.data.dislike[slot5] = slot6
	end

	for slot5, slot6 in pairs(slot1.roles) do
		slot0.data.roles[slot5] = slot6
	end

	slot0:commentListData()
end

function slot4.sendProtocol(slot0)
	uv2 = "commentState"

	if slot0.commentState == slot2.OPEN then
		slot0.isCanDown = false
	end

	slot0.isRequest = true
	slot1 = #slot0.data.new
	uv3 = "commentState"

	if slot0.commentState == slot3.OPEN then
		uv2 = "OPEN"

		if not slot2 then
			slot2 = 0
		end
	end

	uv4 = "commentState"

	if slot0.commentState == slot4.REFRESH then
		slot1 = 0
		slot2 = #slot0.data.new
	end

	gGameApp:requestServer("/game/card/comment/list", function (slot0)
		slot1 = performWithDelay
		uv2 = "performWithDelay"

		slot1(slot2, function ()
			uv0 = "isRequest"
			slot0.isRequest = false
		end, 0.1)

		uv1 = "performWithDelay"

		slot1:initData(slot0.view)
	end, slot0.cardId, slot1, slot2)
end

function slot4.initCard(slot0)
	slot2 = slot0.center:multiget("cardIcon", "rare", "name", "iconAttr1", "iconAttr2")
	slot4 = csv.unit[csv.cards[slot0.cardId].unitID]
	slot6 = {}

	for slot10, slot11 in orderCsvPairs(csv.cards) do
		if matchLanguageForce(slot11.languages) and slot11.cardMarkID == csv.cards[slot0.cardId].cardMarkID and slot11.canDevelop and gHandbookCsv[slot10].isOpen then
			table.insert(slot6, {
				existCards = existCards,
				selectDevelop = slot11.develop,
				cfg = slot11,
				id = slot10
			})
		end
	end

	table.sort(slot6, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	slot0.evolutionDatas:update(slot6)

	slot7 = 0

	for slot11, slot12 in ipairs(slot6) do
		if slot12.id == slot5.id then
			slot7 = slot11
		end
	end

	slot0.selectEvolution = idler.new(slot7)

	slot0.selectEvolution:addListener(function (slot0, slot1)
		uv2 = "evolutionDatas"
		slot2 = slot2.evolutionDatas
		slot3 = slot2
		slot2 = slot2.atproxy(slot3, slot0)
		uv3 = "evolutionDatas"

		if slot3.evolutionDatas:atproxy(slot1) then
			slot3.select = false
		end

		if slot2 then
			uv5 = "atproxy"

			itertools.invoke(slot5, "show")

			slot5 = slot2.cfg.unitID
			slot4 = csv.unit[slot5]
			uv5 = "atproxy"
			slot5 = slot5.cardIcon
			slot6 = slot5
			uv6 = "atproxy"
			slot6 = slot6.cardIcon
			slot7 = slot6

			slot6.removeAllChildren(slot7)

			uv7 = "atproxy"
			slot6 = widget.addAnimation(slot7.cardIcon, slot4.unitRes, "standby_loop", 5):xy(slot5.size(slot6).width / 2, 0):scale(slot4.scaleU * 2.3)
			slot7 = slot6.setSkin

			slot7(slot6, slot4.skin)

			uv7 = "atproxy"
			slot7 = slot7.name
			slot7 = slot7.text

			slot7(slot7, slot2.cfg.name)

			uv7 = "atproxy"
			slot10 = slot4.rarity

			slot7.rare:texture(ui.RARITY_ICON[slot10])

			slot7 = adapt.oneLineCenterPos
			uv10 = "atproxy"
			slot10 = slot10.name
			slot10 = slot10.y
			uv10 = "atproxy"
			slot10 = slot10.rare
			uv10 = "atproxy"
			slot10 = slot10.name
			uv10 = "atproxy"

			slot7(cc.p(290, slot10(slot10)), {
				slot10,
				slot10,
				slot10.iconAttr1
			}, cc.p(15, 0))

			uv7 = "atproxy"
			slot7 = slot7.iconAttr1
			slot7 = slot7.texture

			slot7(slot7, ui.ATTR_ICON[slot4.natureType])

			uv7 = "atproxy"

			slot7.iconAttr2:hide()

			if slot4.natureType2 then
				uv7 = "atproxy"
				slot9 = ui.ATTR_ICON[slot4.natureType2]
				slot7 = slot7.iconAttr2:texture(slot9)
				slot8 = slot7

				slot7.show(slot8)

				uv8 = "atproxy"
				uv9 = "atproxy"

				adapt.oneLinePos(slot8.iconAttr1, slot9.iconAttr2, cc.p(15, 0), "left")
			end

			uv7 = "evolutionDatas"
			slot7 = slot7.noComment:get("img1.txt")
			slot7 = slot7.text

			slot7(slot7, string.format(gLanguageCsv.noComment, slot2.cfg.name))

			uv7 = "evolutionDatas"

			slot7.noComment:get("img1.txt"):size(457, 140)

			slot2.select = true
		else
			uv5 = "atproxy"

			itertools.invoke(slot5, "hide")
		end
	end)
	slot0:initPrivilegeListener()
	slot0:initGrade()
end

function slot4.onBtnRank(slot0)
	gGameApp:requestServer("/game/card/fight/rank", function (slot0)
		uv6 = "gGameUI"

		gGameUI:stackUI("city.card.comment_rank", nil, , slot6.cardId, slot0.view)
	end, slot0.cardId, 0, 20)
end

function slot4.initPrivilegeListener(slot0)
	uiEasy.addTouchOneByOne(slot0.mask, {
		ended = function (slot0, slot1, slot2)
			if math.abs(slot1) > 100 and math.abs(slot2) < math.abs(slot1) then
				slot3 = slot1 > 0 and -1 or 1
				uv4 = "math"

				slot4.selectEvolution:modify(function (slot0)
					uv2 = "cc"
					uv4 = "clampf"

					return true, cc.clampf(slot0 + slot2, 1, slot4.evolutionDatas:size())
				end)
			end
		end
	})
end

function slot4.initGrade(slot0)
	slot0.scoreTxt2:text(mathEasy.getPreciseDecimal(slot0.score.score, 1))

	if slot0.score.last_score < slot0.score.score then
		uv3 = "scoreTxt2"

		slot0.scoreImg:texture(slot3[1])
	elseif slot0.score.score == slot0.score.last_score then
		uv3 = "scoreTxt2"

		slot0.scoreImg:texture(slot3[2])
	elseif slot0.score.score < slot0.score.last_score then
		uv3 = "scoreTxt2"

		slot0.scoreImg:texture(slot3[3])
	end

	adapt.oneLineCenter(slot0.scoreTxt2, slot0.scoreTxt1, slot0.scoreTxt3, cc.p(10, 0))
	adapt.oneLinePos(slot0.scoreTxt3, slot0.scoreImg, cc.p(5, -5))

	slot1 = {
		"common/icon/icon_star_d.png",
		"common/icon/icon_star.png"
	}
	slot2 = {
		gLanguageCsv.oneStarGrade,
		gLanguageCsv.twoStarGrade,
		gLanguageCsv.threeStarGrade,
		gLanguageCsv.fourStarGrade,
		gLanguageCsv.fiveStarGrade
	}
	slot3 = slot0.score.my_score
	slot5 = false

	for slot9, slot10 in orderCsvPairs(csv.cards) do
		if slot10.cardMarkID == csv.cards[slot0.cardId].cardMarkID and slot0.pokedex:read()[slot9] then
			slot5 = true

			break
		end
	end

	for slot9 = 1, 5 do
		function slot11(slot0, slot1)
			for slot5 = slot0 + 1, slot1 do
				uv6 = "star"
				slot8 = "star" .. slot5
				uv8 = "get"

				slot6.star:get(slot8):texture(slot8[1])
			end
		end

		function (slot0)
			for slot4 = 1, slot0 do
				uv5 = "star"
				slot7 = "star" .. slot4
				uv7 = "get"

				slot5.star:get(slot7):texture(slot7[2])
			end
		end(slot3 / 2)
		slot0.starDesc:text(slot2[slot3 / 2])
		bind.click(slot0, slot0.star:get("star" .. slot9), {
			method = function ()
				uv0 = "gGameUI"

				if slot0 == false then
					gGameUI:showTip(gLanguageCsv.cardNotActivateCantGrade)

					return
				end

				slot0 = 0
				uv2 = "showTip"

				for slot4, slot5 in pairs(slot2.cardScoreCounter:read()) do
					uv6 = "gLanguageCsv"

					if slot4 == slot6 then
						slot0 = slot5
					end
				end

				if gCommonConfigCsv.cardScoreDailyChangeTimes <= slot0 then
					gGameUI:showTip(gLanguageCsv.tomorrowCanChangeGrade)

					return
				end

				uv1 = "cardNotActivateCantGrade"
				uv2 = "pairs"

				slot1(slot2)

				uv1 = "cardScoreCounter"
				uv2 = "pairs"
				slot3 = 5

				slot1(slot2, slot3)

				uv1 = "showTip"
				uv3 = "read"
				uv4 = "pairs"

				slot1.starDesc:text(slot3[slot4])

				uv7 = "pairs"

				gGameUI:showDialog({
					fontSize = 50,
					clearFast = true,
					btnType = 2,
					strs = {
						string.format(gLanguageCsv.confirmWithCardScore, slot7 * 2)
					},
					cb = function ()
						uv4 = "gGameApp"
						uv5 = "requestServer"

						gGameApp:requestServer("/game/card/score/send", function (slot0)
							gGameUI:showTip(gLanguageCsv.gradeComplete)
						end, slot4.cardId, slot5 * 2)
					end,
					closeCb = function ()
						uv0 = "starDesc"
						uv1 = "text"
						slot1 = slot1 / 2

						slot0(slot1)

						uv0 = "gLanguageCsv"
						uv1 = "text"

						slot0(slot1 / 2, 5)

						uv0 = "text"

						if slot0 == 0 then
							uv0 = "noGrade"

							slot0.starDesc:text(gLanguageCsv.noGrade)
						else
							uv0 = "noGrade"
							uv2 = "starDesc"
							uv3 = "text"

							slot0.starDesc:text(slot2[slot3 / 2])
						end
					end,
					cancelCb = function ()
						uv0 = "starDesc"
						uv1 = "text"
						slot1 = slot1 / 2

						slot0(slot1)

						uv0 = "gLanguageCsv"
						uv1 = "text"

						slot0(slot1 / 2, 5)

						uv0 = "text"

						if slot0 == 0 then
							uv0 = "noGrade"

							slot0.starDesc:text(gLanguageCsv.noGrade)
						else
							uv0 = "noGrade"
							uv2 = "starDesc"
							uv3 = "text"

							slot0.starDesc:text(slot2[slot3 / 2])
						end
					end
				})
			end
		})
	end
end

function slot4.initComment(slot0)
	slot1 = slot0.cardId

	blacklist:addListener(slot0.textInput, "*")
	slot0.textInput:setPlaceHolder(string.format(gLanguageCsv.pleaseCommentOn, gCommonConfigCsv.cardCommentWordCount))
	slot0.textInput:setTextColor(ui.COLORS.NORMAL.DEFAULT)
	slot0.textInput:setMaxLengthEnabled(true)
	slot0.textInput:setMaxLength(gCommonConfigCsv.cardCommentWordCount)
	bind.touch(slot0, slot0.btnComment, {
		methods = {
			ended = function ()
				if not dataEasy.isUnlock(gUnlockCsv.cardPostComment) then
					gGameUI:showTip(string.format(gLanguageCsv.nowLevelCantComment, csv.unlock[gUnlockCsv.cardPostComment].startLevel))

					return
				end

				uv3 = "dataEasy"
				uv3 = "isUnlock"

				if gCommonConfigCsv.cardCommentDailyMarkSendTimes <= (slot3.commentCounter[csv.cards[slot3].cardMarkID] or 0) then
					gGameUI:showTip(string.format(gLanguageCsv.onedayCanCommentTimes, gCommonConfigCsv.cardCommentDailyMarkSendTimes))

					return
				end

				uv5 = "isUnlock"

				if gCommonConfigCsv.cardCommentDailyMarkNum <= itertools.size(slot5.commentCounter) then
					uv4 = "isUnlock"

					if not slot4.commentCounter[slot2] then
						gGameUI:showTip(string.format(gLanguageCsv.onedayDifferentCanCommentTimes, gCommonConfigCsv.cardCommentDailyMarkNum))

						return
					end
				end

				uv4 = "isUnlock"

				if slot4.textInput:getStringValue() == nil or slot4 == "" then
					gGameUI:showTip(gLanguageCsv.canNotEmpty)
				else
					uv9 = "dataEasy"

					gGameApp:requestServer("/game/card/comment/send", function (slot0)
						slot1 = gGameUI
						slot1 = slot1.showTip

						slot1(slot1, gLanguageCsv.commentIsSucceed)

						uv1 = "gGameUI"
						slot1 = slot1.textInput
						slot2 = slot1
						slot1 = slot1.text

						slot1(slot2, "")

						uv1 = "gGameUI"
						uv2 = "showTip"
						slot1.commentState = slot2.SEND
						uv1 = "gGameUI"

						slot1:sendProtocol()
					end, slot9, slot4)
				end
			end
		}
	})
end

function slot4.commentListData(slot0)
	slot1 = slot0.data

	function slot3(slot0, slot1)
		if slot0 then
			for slot5, slot6 in ipairs(slot0) do
				uv7 = "ipairs"

				if slot7.roles[slot6.role_db_id] then
					slot8 = false
					uv9 = "roles"
					uv11 = "role_db_id"

					if slot9.commentData:at(#slot11 + 1) then
						uv9 = "roles"
						uv11 = "role_db_id"
						slot8 = slot9.commentData:at(#slot11 + 1):read().switch
					end

					uv10 = "role_db_id"
					uv12 = "ipairs"
					uv12 = "ipairs"
					uv12 = "roles"
					slot12 = ((slot7.game_key.like[slot6.id] ~= nil).dislike[slot6.id] ~= nil).textItemListH
					uv12 = "roles"
					slot12 = slot12.itemListH
					uv12 = "roles"
					slot12 = slot12.textItemBgH
					uv12 = "roles"
					slot12 = slot12.textItemBgY
					uv12 = "roles"
					slot12 = slot12.textItemTopY
					uv12 = "roles"

					table.insert(slot10, {
						key = slot1,
						val = slot6,
						level = slot7.level,
						logo = slot7.logo,
						frame = slot7.frame,
						vip = slot7.vip,
						name = slot7.name,
						game_key = slot12,
						like = slot12,
						dislike = slot12,
						listH = slot12,
						nodeH = slot12,
						bgH = slot12,
						bgY = slot12,
						topY = slot12,
						headY = slot12.textItemHeadY,
						switch = slot8
					})
				end
			end
		end
	end

	slot3(slot1.hot, "hot")
	slot3(slot1.my, "my")

	slot5 = slot1.new

	slot3(slot5, "new")

	uv5 = "data"

	if slot0.commentState == slot5.SEND then
		slot0.preloadCenter:set(math.min(#slot1.hot + 1, #{}))
	else
		dataEasy.tryCallFunc(slot0.commentList, "updatePreloadCenterIndex")
	end

	slot0.commentData:update(slot2)
	gGameUI:disableTouchDispatch(0.01)
end

function slot4.onBtnDel(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	gGameUI:showDialog({
		fontSize = 50,
		clearFast = true,
		btnType = 2,
		strs = {
			gLanguageCsv.confirmWithDeleteComment
		},
		cb = function ()
			uv4 = "requestServer"

			gGameApp:requestServer("/game/card/comment/del", function (slot0)
				slot1 = gGameUI
				slot2 = slot1
				slot1 = slot1.showTip
				slot3 = gLanguageCsv.commentIsDelete

				slot1(slot2, slot3)

				uv1 = "gGameUI"
				uv2 = "showTip"
				slot1.commentState = slot2.DEL
				uv1 = "gGameUI"
				slot1 = slot1.sendProtocol

				slot1(slot1)

				uv1 = "gLanguageCsv"
				slot1 = slot1.height
				uv3 = "commentIsDelete"
				slot3 = slot3.nodeH

				slot1(slot1, slot3)

				uv1 = "commentState"
				slot1 = slot1.bg
				slot1 = slot1.height
				uv3 = "commentIsDelete"
				slot3 = slot3.bgH

				slot1(slot1, slot3)

				uv1 = "commentState"
				slot1 = slot1.bg
				slot1 = slot1.y
				uv3 = "commentIsDelete"
				slot3 = slot3.bgY

				slot1(slot1, slot3)

				uv1 = "DEL"
				slot1 = slot1.height
				uv3 = "commentIsDelete"
				slot3 = slot3.listH

				slot1(slot1, slot3)

				uv1 = "commentState"
				slot1 = slot1.top
				slot1 = slot1.y
				uv3 = "commentIsDelete"
				slot3 = slot3.topY

				slot1(slot1, slot3)

				uv1 = "commentState"
				slot1 = slot1.head
				slot1 = slot1.y
				uv3 = "commentIsDelete"

				slot1(slot1, slot3.headY)

				uv1 = "sendProtocol"

				slot1:refreshView()
			end, slot4.val.id)
		end
	})
end

function slot4.onHeadClick(slot0, slot1, slot2, slot3, slot4)
	if userDefault.getForeverLocalKey("serverKey", nil, {
		rawKey = true
	}) ~= slot4.game_key then
		gGameUI:showTip(gLanguageCsv.disserentServerCantViewing)

		return
	end

	slot6, slot7 = slot2:xy()

	gGameUI:stackUI("city.chat.personal_info", nil, , slot2:getParent():convertToWorldSpace(cc.p(slot6 - 100, slot7)), {
		role = {
			vip = slot4.vip,
			name = slot4.name,
			logo = slot4.logo,
			frame = slot4.frame,
			level = slot4.level,
			id = slot4.val.role_db_id
		}
	})
end

function slot4.updateLike(slot0, slot1, slot2)
	slot0.commentData:at(slot1):modify(function (slot0)
		uv1 = "revokeLike"

		if slot1 == "revokeLike" and slot0.like then
			slot0.val.like = slot0.val.like - 1
			slot0.like = false
		else
			uv1 = "revokeLike"

			if slot1 == "like" and not slot0.like then
				slot0.val.like = slot0.val.like + 1
				slot0.like = true

				if slot0.dislike then
					slot0.val.dislike = slot0.val.dislike - 1
					slot0.dislike = false
				end
			else
				uv1 = "revokeLike"

				if slot1 == "revokeDislike" and slot0.dislike then
					slot0.val.dislike = slot0.val.dislike - 1
					slot0.dislike = false
				else
					uv1 = "revokeLike"

					if slot1 == "dislike" and not slot0.dislike then
						slot0.val.dislike = slot0.val.dislike + 1
						slot0.dislike = true

						if slot0.like then
							slot0.val.like = slot0.val.like - 1
							slot0.like = false
						end
					end
				end
			end
		end
	end, true)
end

function slot4.refreshErr(slot0, slot1)
	uv2 = "commentState"
	slot0.commentState = slot2.REFRESH

	slot0:sendProtocol()
end

function slot4.onLikeClick(slot0, slot1, slot2, slot3, slot4)
	if slot4 then
		slot4 = false

		gGameApp:requestServerCustom("/game/card/comment/evaluate"):onErrClose(function ()
			uv0 = "refreshErr"
			uv2 = "refreshErr"

			slot0:refreshErr(slot2)
		end):params(slot3.val.id, "revokeLike"):doit()
		slot0:updateLike(slot2, "revokeLike")
	else
		slot4 = true

		gGameApp:requestServerCustom("/game/card/comment/evaluate"):onErrClose(function ()
			uv0 = "refreshErr"
			uv2 = "refreshErr"

			slot0:refreshErr(slot2)
		end):params(slot3.val.id, "like"):doit()
		slot0:updateLike(slot2, "like")
	end
end

function slot4.onDislikeClick(slot0, slot1, slot2, slot3, slot4)
	if slot4 then
		slot4 = false

		gGameApp:requestServerCustom("/game/card/comment/evaluate"):onErrClose(function ()
			uv0 = "refreshErr"
			uv2 = "refreshErr"

			slot0:refreshErr(slot2)
		end):params(slot3.val.id, "revokeDislike"):doit()
		slot0:updateLike(slot2, "revokeDislike")
	else
		slot4 = true

		gGameApp:requestServerCustom("/game/card/comment/evaluate"):onErrClose(function ()
			uv0 = "refreshErr"
			uv2 = "refreshErr"

			slot0:refreshErr(slot2)
		end):params(slot3.val.id, "dislike"):doit()
		slot0:updateLike(slot2, "dislike")
	end
end

function slot4.initModel(slot0)
	slot0.myID = gGameModel.role:getIdler("id")
	slot0.cardCommentCounter = gGameModel.daily_record:getIdler("card_comment_counter")
	slot0.cardScoreCounter = gGameModel.daily_record:getIdler("card_score_counter")
	slot0.pokedex = gGameModel.role:getIdler("pokedex")
end

return slot4
