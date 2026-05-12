slot0 = {
	"fightingRankList",
	"commentRankList"
}
slot1 = {
	TAB = 1,
	SCROLL = 2
}
slot2 = 20
slot3 = class("CommentRankView", Dialog)
slot3.RESOURCE_FILENAME = "card_comment_rank.json"
slot3.RESOURCE_BINDING = {
	["right.fightingRank.right.item"] = "fightingRankItem",
	["right.fightingRank.left"] = "fightingRankLeft",
	["left.item"] = "btnItem",
	["right.commentRank.right.item"] = "commentRankItem",
	["right.commentRank"] = "commentRank",
	["right.fightingRank"] = "fightingRank",
	["right.commentRank.left.pageItem"] = "pageItem",
	["right.commentRank.left.mask"] = "mask",
	["title.btnClose"] = {
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onClose")
			}
		}
	},
	["left.list"] = {
		varname = "btnList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("btnDatas"),
				item = bindHelper.self("btnItem"),
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:get("normal")
					slot5 = slot1:get("selected")

					slot5:visible(slot3.selected)
					slot4:visible(not slot3.selected)
					slot4:get("txt"):text(slot3.txt)
					slot5:get("txt"):text(slot3.txt)

					slot6 = slot4:getSize().height - 40

					adapt.setAutoText(slot4:get("txt"), slot3.name, slot6)
					adapt.setAutoText(slot5:get("txt"), slot3.name, slot6)
					slot4:get("txt"):getVirtualRenderer():setLineSpacing(-10)
					slot5:get("txt"):getVirtualRenderer():setLineSpacing(-10)
					bind.touch(slot0, slot4, {
						methods = {
							ended = functools.partial(slot0.clickCell, slot2)
						}
					})
				end
			},
			handlers = {
				clickCell = bindHelper.self("onSelectClick")
			}
		}
	},
	["right.fightingRank.right.list"] = {
		varname = "fightingRankList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("showData1"),
				item = bindHelper.self("fightingRankItem"),
				scrollState = bindHelper.self("scrollState"),
				itemAction = {
					isAction = true
				},
				onBeforeBuild = function (slot0)
					slot0.scrollState:set(false)
				end,
				onAfterBuild = function (slot0)
					slot0.scrollState:set(true)
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("rank", "txtRank", "head", "name", "vip", "lv", "lv1", "fighting", "card")

					if slot2 <= 3 then
						slot4.rank:show()
						slot4.txtRank:hide()

						if slot2 == 1 then
							slot4.rank:texture("city/rank/icon_jp.png")
						elseif slot2 == 2 then
							slot4.rank:texture("city/rank/icon_yp.png")
						else
							slot4.rank:texture("city/rank/icon_tp.png")
						end
					else
						slot4.rank:hide()
						slot4.txtRank:show()
						slot4.txtRank:text(slot2)
					end

					bind.extend(slot0, slot4.head, {
						class = "role_logo",
						props = {
							vip = false,
							level = false,
							onNode = function (slot0)
								slot0:scale(0.8)
							end,
							logoId = slot3.role.logo,
							frameId = slot3.role.frame
						}
					})
					slot4.name:text(slot3.role.name)
					slot4.lv:text(gLanguageCsv.textLv)
					slot4.lv1:text(slot3.role.level)
					adapt.oneLinePos(slot4.lv, slot4.lv1, cc.p(5, 0))

					if slot3.role.vip == false or slot3.role.vip <= 0 then
						slot4.vip:hide()
					else
						slot4.vip:texture("common/icon/vip/icon_vip" .. slot3.role.vip .. ".png")
					end

					slot4.fighting:text(slot3.card.fighting_point)
					adapt.oneLinePos(slot4.name, slot4.vip, cc.p(5, 0))

					slot5 = dataEasy.getUnitId(slot3.card.card_id, slot3.card.skin_id)

					bind.extend(slot0, slot4.card, {
						class = "card_icon",
						props = {
							unitId = slot5,
							rarity = csv.unit[slot5].rarity,
							star = slot3.card.star,
							dbid = slot3.card.id,
							advance = slot3.card.advance,
							levelProps = {
								data = slot3.card.level
							},
							onNode = function (slot0)
								slot0:scale(0.8)
								slot0:xy(10, 10)
							end
						}
					})

					if gGameModel.role:read("id") ~= slot3.role.id then
						bind.touch(slot0, slot4.head, {
							methods = {
								ended = functools.partial(slot0.headClick, slot4.head, slot2, slot3)
							}
						})
						bind.touch(slot0, slot4.card, {
							methods = {
								ended = functools.partial(slot0.clickCell, slot2, slot3)
							}
						})
					end
				end
			},
			handlers = {
				clickCell = bindHelper.self("onClickItem"),
				headClick = bindHelper.self("onHeadClick")
			}
		}
	},
	["right.commentRank.right.list"] = {
		varname = "commentRankList",
		binds = {
			event = "extend",
			class = "listview",
			props = {
				data = bindHelper.self("showData2"),
				item = bindHelper.self("commentRankItem"),
				scrollState = bindHelper.self("scrollState"),
				itemAction = {
					isAction = true
				},
				onBeforeBuild = function (slot0)
					slot0.scrollState:set(false)
				end,
				onAfterBuild = function (slot0)
					slot0.scrollState:set(true)
				end,
				onItem = function (slot0, slot1, slot2, slot3)
					slot4 = slot1:multiget("rank", "txtRank", "card", "name", "score", "iconAttr1", "iconAttr2", "imgCompare")

					if slot2 <= 3 then
						slot4.rank:show()
						slot4.txtRank:hide()

						if slot2 == 1 then
							slot4.rank:texture("city/rank/icon_jp.png")
						elseif slot2 == 2 then
							slot4.rank:texture("city/rank/icon_yp.png")
						else
							slot4.rank:texture("city/rank/icon_tp.png")
						end
					else
						slot4.rank:hide()
						slot4.txtRank:show()
						slot4.txtRank:text(slot2)
					end

					slot5 = {}

					for slot9, slot10 in pairs(gCardsMarkCsv[slot3.mark_id].data) do
						if csv.unit[csv.cards[slot10].unitID] then
							table.insert(slot5, slot11)
						end
					end

					slot6 = csv.unit[math.max(unpack(slot5))]

					bind.extend(slot0, slot4.card, {
						class = "card_icon",
						props = {
							cardId = slot6.cardID,
							rarity = slot6.rarity,
							onNode = function (slot0)
								slot0:scale(0.8)
								slot0:xy(0, 0)
							end
						}
					})
					slot4.name:text(slot6.name)
					slot4.iconAttr1:texture(ui.ATTR_ICON[slot6.natureType])
					slot4.iconAttr2:hide()

					if slot6.natureType2 then
						slot4.iconAttr2:texture(ui.ATTR_ICON[slot6.natureType2]):show()
					end

					slot4.score:text(mathEasy.getPreciseDecimal(slot3.score, 1))

					if slot3.rank == slot3.last_rank then
						slot4.imgCompare:texture("city/card/comment/logo_line.png")
					elseif slot3.last_rank <= slot3.rank then
						slot4.imgCompare:texture("common/icon/logo_arrow_red.png")
					else
						slot4.imgCompare:texture("common/icon/logo_arrow_green.png")
					end
				end
			}
		}
	},
	["right.commentRank.left.pageList"] = {
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
	["right.fightingRank.left.cardName"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c4b(230, 122, 35, 255)
				}
			}
		}
	},
	["right.commentRank.left.cardName"] = {
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c4b(230, 122, 35, 255)
				}
			}
		}
	},
	["right.commentRank.left.scoreBg.txt1"] = {
		varname = "scoreTxt1",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c4b(230, 122, 35, 255)
				}
			}
		}
	},
	["right.commentRank.left.scoreBg.txt2"] = {
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
	["right.commentRank.left.scoreBg.txt3"] = {
		varname = "scoreTxt3",
		binds = {
			event = "effect",
			data = {
				outline = {
					color = cc.c4b(230, 122, 35, 255)
				}
			}
		}
	}
}

function slot3.onCreate(slot0, slot1, slot2)
	slot0.cardId = slot1
	slot0.myrank = slot2.rank
	slot0.fightData = slot2.ranks

	slot0:initModel()

	if slot0.fightData and table.maxn(slot0.fightData) > 3 then
		for slot7 = 1, 3 do
		end

		slot0.fightData = {
			[slot7] = slot0.fightData[slot7]
		}
	end

	slot0.fightingRankList:setScrollBarEnabled(false)
	slot0.commentRankList:setScrollBarEnabled(false)

	slot5 = "left"

	slot0.commentRank:get(slot5):hide()

	slot0.isFightCanDown = true
	slot0.isScoreCanDown = true
	slot0.scrollState = idler.new(true)
	slot0.datas = {}
	uv5 = "cardId"

	for slot7 = 1, #slot5 do
		slot0.datas[slot7] = slot7 == 1 and slot0.fightData or {}
		slot0["showData" .. slot7] = idlers.newWithMap(slot0.datas[slot7])
	end

	slot0.btnDatas = idlers.new(btnDatas)
	slot0.showTab = idler.new(slot0.fightData and slot0.fightData[1] and 1 or 2)
	slot0.evolutionDatas = idlers.new({})
	slot4 = idlers.new({})
	slot0.scoreData = slot4
	uv4 = "myrank"
	slot0.rankState = slot4.SCROLL

	slot0.btnDatas:update({
		{
			selected = false,
			type = "fight",
			txt = gLanguageCsv.cardFightingRank
		},
		{
			selected = false,
			type = "score",
			txt = gLanguageCsv.cardCommentRank
		}
	})
	slot0.showTab:addListener(function (slot0, slot1, slot2)
		uv3 = "btnDatas"
		slot3 = slot3.btnDatas:atproxy(slot1)
		slot3.selected = false
		uv3 = "btnDatas"
		slot3 = slot3.btnDatas:atproxy(slot0)
		slot3.selected = true
		uv3 = "btnDatas"
		slot3 = slot3.fightingRank
		slot3 = slot3.visible

		slot3(slot3, slot0 == 1)

		uv3 = "btnDatas"
		slot3 = slot3.commentRank
		slot4 = slot3
		slot3 = slot3.visible

		slot3(slot4, slot0 == 2)

		uv3 = "btnDatas"
		uv4 = "atproxy"
		slot3.rankState = slot4.TAB
		uv3 = "btnDatas"

		if slot3.btnDatas:atproxy(slot0).type then
			uv3 = "btnDatas"

			if #slot3.datas[slot0] == 0 then
				uv3 = "btnDatas"
				uv5 = "btnDatas"
				uv8 = "btnDatas"
				uv9 = "selected"

				slot3:sendProtocol(slot5.btnDatas:atproxy(slot0).type, 0, slot0, slot8[slot9[slot0]])
			end
		end

		uv4 = "selected"

		for slot6, slot7 in ipairs(slot4) do
			if slot6 == slot0 then
				uv8 = "btnDatas"

				slot8[slot7]:jumpToItem(0, cc.p(0, 1), cc.p(0, 1))
			end
		end
	end)

	if slot0.fightData and slot0.fightData[1] then
		slot0:showFightingPanel()
	end

	uv6 = "cardId"

	for slot8, slot9 in ipairs(slot6) do
		slot10 = slot0[slot9]:getInnerContainer()

		slot0[slot9]:onScroll(function (slot0)
			uv1 = "getPositionY"

			if slot1:getPositionY() >= -10 then
				uv2 = "scrollState"

				if slot2.scrollState:read() then
					uv2 = "scrollState"

					if not slot2.isRequest then
						uv2 = "scrollState"
						uv4 = "read"

						if slot2.btnDatas:atproxy(slot4).type then
							uv2 = "scrollState"

							if slot2.isFightCanDown then
								uv2 = "scrollState"
								uv4 = "read"

								if slot2.btnDatas:atproxy(slot4).type ~= "fight" then
									uv2 = "scrollState"

									if slot2.isScoreCanDown then
										uv2 = "scrollState"
										uv4 = "read"

										if slot2.btnDatas:atproxy(slot4).type == "score" then
											uv2 = "scrollState"
											uv3 = "isRequest"
											slot2.rankState = slot3.SCROLL
											uv2 = "scrollState"
											uv4 = "scrollState"
											slot4 = slot4.btnDatas
											slot5 = slot4
											uv6 = "read"
											uv5 = "scrollState"
											uv6 = "read"
											uv6 = "read"
											uv7 = "scrollState"
											uv8 = "btnDatas"

											slot2:sendProtocol(slot4.atproxy(slot5, slot6).type, #slot5.datas[slot6], slot6, slot7[slot8])
										end
									else
										gGameUI:showTip(gLanguageCsv.noMoreComment)
									end
								end
							end
						end
					end
				end
			end
		end)
	end

	Dialog.onCreate(slot0)
end

function slot3.initModel(slot0)
	slot0.roleName = gGameModel.role:read("name")
	slot0.level = gGameModel.role:read("level")
	slot0.vipLevel = gGameModel.role:read("vip_level")
	slot0.roleId = gGameModel.role:read("id")
	slot0.cards = gGameModel.role:read("cards")
end

function slot3.onSelectClick(slot0, slot1, slot2)
	if not slot0.fightData or not slot0.fightData[1] then
		gGameUI:showTip(gLanguageCsv.cantViewFightingRank)
	else
		slot0.showTab:set(slot2)
	end
end

function slot3.initData(slot0, slot1, slot2, slot3, slot4, slot5)
	uv7 = "rankState"

	if slot0.rankState == slot7.SCROLL then
		if slot5 == "fight" then
			uv7 = "SCROLL"

			if #slot1 < slot7 then
				slot0.isFightCanDown = false
			end
		elseif slot5 == "score" then
			uv7 = "SCROLL"

			if #slot1 < slot7 then
				slot0.isScoreCanDown = false
			end
		end
	end

	if slot2 == 0 then
		slot0.datas[slot3] = slot1
	else
		for slot9, slot10 in ipairs(slot1) do
			table.insert(slot0.datas[slot3], slot10)
		end
	end

	slot0["showData" .. slot3]:update(slot0.datas[slot3])
	gGameUI:disableTouchDispatch(0.01)
	slot4:jumpToItem(slot2 - (slot0.showTab:read() == 1 and 3 or 4), cc.p(0, 1), cc.p(0, 1))
end

function slot3.sendProtocol(slot0, slot1, slot2, slot3, slot4)
	slot0.isRequest = true
	slot5 = 200

	if slot1 == "fight" then
		-- Nothing
	elseif slot1 == "score" then
		slot6 = gGameApp
		slot7 = slot6
		slot6 = slot6.requestServer
		slot8 = "/game/card/score/rank"

		function slot9(slot0)
			uv1 = "scoreOne"

			if slot1 == 0 then
				uv1 = "view"
				slot1.scoreOne = slot0.view.ranks[1]
				uv1 = "view"

				slot1:showCommentPanel()
			end

			slot1 = performWithDelay
			uv2 = "view"
			slot4 = 0.1

			slot1(slot2, function ()
				uv0 = "isRequest"
				slot0.isRequest = false
			end, slot4)

			uv1 = "view"
			uv4 = "scoreOne"
			uv5 = "ranks"
			uv6 = "showCommentPanel"
			uv7 = "performWithDelay"

			slot1:initData(slot0.view.ranks, slot4, slot5, slot6, slot7)
		end

		slot10 = slot2
		uv11 = "isRequest"

		if slot5 >= slot2 + slot11 or not (slot5 - slot2) then
			uv11 = "isRequest"
		end

		slot6(slot7, slot8, slot9, slot10, slot11)
	end
end

function slot3.showFightingPanel(slot0)
	slot0.fightOne = slot0.fightData[1]
	slot1 = dataEasy.getUnitCsv(slot0.fightOne.card.card_id, slot0.fightOne.card.skin_id)
	slot2 = slot0.fightingRank:get("left"):multiget("cardName", "cardIcon", "roleName", "lv", "lv1", "fighting", "fighting1")

	slot2.cardName:text(slot1.name)
	slot2.roleName:text(slot0.fightOne.role.name)
	slot2.lv:text(gLanguageCsv.textLv)
	slot2.lv1:text(slot0.fightOne.role.level)
	adapt.oneLineCenterPos(cc.p(370, 170), {
		slot2.roleName,
		slot2.lv,
		slot2.lv1
	}, cc.p(10, 0))
	slot2.fighting1:text(slot0.fightOne.card.fighting_point)
	adapt.oneLinePos(slot2.fighting, slot2.fighting1)

	slot3 = slot2.cardIcon
	slot4 = slot3:size()
	slot5 = gRoleFigureCsv[slot0.fightOne.role.figure]

	widget.addAnimationByKey(slot3, slot1.unitRes, "card", "standby_loop", -1):xy(slot4.width / 2 + 80, 0):scale(slot1.scale * 1.3):setSkin(slot1.skin)
	widget.addAnimationByKey(slot3, slot5.resSpine, "figure", "standby_loop1", 3):xy(slot4.width / 2 - 100, 0):scale(slot5.scale)

	if gGameModel.role:read("id") ~= slot0.fightOne.role.id then
		bind.touch(slot0, slot3, {
			methods = {
				ended = function ()
					uv0 = "onHeadClick"
					uv3 = "fightOne"
					uv5 = "onHeadClick"

					slot0:onHeadClick(nil, slot3, nil, slot5.fightOne)
				end
			}
		})
	end

	bind.extend(slot0, slot3, {
		event = "extend",
		class = "role_title",
		props = {
			data = slot0.fightOne.role.title,
			onNode = function (slot0)
				uv3 = "xy"
				uv4 = "xy"

				slot0:xy(slot3.width / 2, slot4.height - 50)
				slot0:scale(1.2)
				slot0:z(3)
			end
		}
	})

	slot7 = slot0.fightingRank:get("right.myRank"):multiget("txtRank", "rank", "head", "name", "vip", "lv", "lv1", "fighting", "card")

	bind.extend(slot0, slot7.head, {
		class = "role_logo",
		props = {
			vip = false,
			level = false,
			onNode = function (slot0)
				slot0:scale(0.8)
			end,
			logoId = gGameModel.role:read("logo"),
			frameId = gGameModel.role:read("frame")
		}
	})
	slot7.name:text(slot0.roleName)

	if slot0.myrank > 0 then
		slot7.txtRank:text(slot0.myrank)

		if slot0.myrank <= 3 then
			slot7.rank:show()
			slot7.txtRank:hide()

			if slot0.myrank == 1 then
				slot7.rank:texture("city/rank/icon_jp.png")
			elseif slot0.myrank == 2 then
				slot7.rank:texture("city/rank/icon_yp.png")
			else
				slot7.rank:texture("city/rank/icon_tp.png")
			end
		else
			slot7.rank:hide()
			slot7.txtRank:show()
			slot7.txtRank:text(slot0.myrank)
			text.addEffect(slot7.txtRank, {
				color = cc.c4b(91, 84, 91, 255)
			})
			slot7.txtRank:setFontSize(60)
		end
	else
		slot7.rank:hide()
	end

	slot9, slot10 = nil

	for slot14, slot15 in pairs(slot0.cards) do
		if csv.cards[slot0.cardId].cardMarkID == csv.cards[gGameModel.cards:find(slot15):read("card_id")].cardMarkID and 0 < slot16:read("fighting_point") then
			slot10 = slot15
			slot8 = slot16:read("card_id", "skin_id", "fighting_point", "level", "star", "advance").fighting_point
		end
	end

	if slot8 == 0 then
		if matchLanguage({
			"cn"
		}) then
			slot7.fighting:setPositionY(slot7.fighting:getPositionY() - 20)
		end

		slot7.fighting:text(gLanguageCsv.commentFightingRankTip)
	else
		slot7.fighting:text(slot8)

		slot11 = dataEasy.getUnitId(slot9.card_id, slot9.skin_id)

		bind.extend(slot0, slot7.card, {
			class = "card_icon",
			props = {
				unitId = slot11,
				rarity = csv.unit[slot11].rarity,
				star = slot9.star,
				advance = slot9.advance,
				dbid = slot10,
				levelProps = {
					data = slot9.level
				},
				onNode = function (slot0)
					slot0:scale(0.8)
					slot0:xy(10, 10)
				end
			}
		})
	end

	if slot0.vipLevel == false or slot0.vipLevel <= 0 then
		slot7.vip:hide()
	else
		slot7.vip:texture(ui.VIP_ICON[slot0.vipLevel]):show()
	end

	slot7.lv1:text(slot0.level)
	slot7.lv:text(gLanguageCsv.textLv)
	adapt.oneLinePos(slot7.name, slot7.vip, cc.p(3, 0), "left")
	adapt.oneLinePos(slot7.lv, slot7.lv1, cc.p(0, 0), "left")
end

function slot3.showCommentPanel(slot0)
	slot0.commentRank:get("left"):show()

	slot2 = csv.unit[csv.cards[slot0.scoreOne.mark_id].unitID]

	slot0.scoreTxt2:text(mathEasy.getPreciseDecimal(slot0.scoreOne.score, 1))

	if slot0.scoreOne.rank == slot0.scoreOne.last_rank then
		slot0.commentRank:get("left"):multiget("cardIcon", "rare", "name", "iconAttr1", "iconAttr2", "scoreBg").scoreBg:get("img"):texture("city/card/comment/logo_line.png")
	elseif slot0.scoreOne.last_rank <= slot0.scoreOne.rank then
		slot3.scoreBg:get("img"):texture("common/icon/logo_arrow_red.png")
	else
		slot3.scoreBg:get("img"):texture("common/icon/logo_arrow_green.png")
	end

	slot10 = 0

	adapt.oneLineCenter(slot0.scoreTxt2, slot0.scoreTxt1, slot0.scoreTxt3, cc.p(10, slot10))

	slot9 = -5

	adapt.oneLinePos(slot0.scoreTxt3, slot3.scoreBg:get("img"), cc.p(5, slot9))

	slot5 = {}

	for slot9, slot10 in orderCsvPairs(csv.cards) do
		if matchLanguageForce(slot10.languages) and slot10.cardMarkID == csv.cards[slot0.scoreOne.mark_id].cardMarkID and slot10.canDevelop then
			table.insert(slot5, {
				cfg = slot10,
				id = slot9
			})
		end
	end

	table.sort(slot5, function (slot0, slot1)
		return slot0.id < slot1.id
	end)
	slot0.evolutionDatas:update(slot5)

	slot6 = 0

	for slot10, slot11 in ipairs(slot5) do
		if slot11.id == slot4.id then
			slot6 = slot10
		end
	end

	slot0.selectEvolution = idler.new(slot6)

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
			slot10 = 5
			slot6 = widget.addAnimation(slot7.cardIcon, slot4.unitRes, "standby_loop", slot10):xy(slot5.size(slot6).width / 2, 0):scale(slot4.scaleU * 2.3)
			slot7 = slot6.setSkin

			slot7(slot6, slot4.skin)

			uv7 = "atproxy"
			slot7 = slot7.rare
			slot7 = slot7.texture
			uv10 = "select"
			slot10 = slot10.rarity

			slot7(slot7, ui.RARITY_ICON[slot10])

			uv7 = "atproxy"
			slot7 = slot7.name
			slot7 = slot7.text

			slot7(slot7, slot2.cfg.name)

			uv7 = "atproxy"
			slot7 = slot7.iconAttr1
			slot7 = slot7.texture
			uv10 = "select"

			slot7(slot7, ui.ATTR_ICON[slot10.natureType])

			uv7 = "atproxy"
			slot7 = slot7.iconAttr2
			slot7 = slot7.hide

			slot7(slot7)

			uv7 = "select"

			if slot7.natureType2 then
				uv7 = "atproxy"
				uv10 = "select"

				slot7.iconAttr2:texture(ui.ATTR_ICON[slot10.natureType2]):show()
			end

			uv10 = "atproxy"
			slot10 = slot10.name
			slot10 = slot10.y
			uv10 = "atproxy"
			slot10 = slot10.rare
			uv10 = "atproxy"
			slot10 = slot10.name
			uv10 = "atproxy"
			slot10 = slot10.iconAttr1
			uv10 = "atproxy"

			adapt.oneLineCenterPos(cc.p(380, slot10(slot10)), {
				slot10,
				slot10,
				slot10,
				slot10.iconAttr2
			}, cc.p(15, 0))

			slot2.select = true
		end
	end)
	slot0:initPrivilegeListener()
end

function slot3.initPrivilegeListener(slot0)
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

function slot3.onHeadClick(slot0, slot1, slot2, slot3, slot4)
	slot5, slot6 = slot2:xy()

	gGameUI:stackUI("city.chat.personal_info", nil, , slot2:getParent():convertToWorldSpace(cc.p(slot5 - 100, slot6)), slot4)
end

function slot3.onClickItem(slot0, slot1, slot2, slot3)
	if slot3.cardId == -1 then
		return
	end

	gGameApp:requestServer("/game/card_info", function (slot0)
		gGameUI:stackUI("city.card.info", nil, , slot0.view)
	end, slot3.card.id)
end

return slot3
