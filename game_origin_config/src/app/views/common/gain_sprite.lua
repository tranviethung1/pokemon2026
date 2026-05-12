class("GainSpriteView", cc.load("mvc").ViewBase).RESOURCE_FILENAME = "common_gain_sprite.json"
slot1.RESOURCE_BINDING = {
	["down.rarity"] = "rarity",
	["down.bottomPanel.cardName"] = "cardName",
	["left.nature"] = "nature",
	["down.attr2"] = "attr2",
	titlePanel = "titlePanel",
	["left.skillName"] = "skillName",
	["left.new"] = "leftNew",
	["left.icon"] = "icon",
	["down.bottomPanel.cardNote"] = "cardNote",
	["left.skillAttr"] = "skillAttr",
	["left.skillContent"] = "skillContent",
	["down.name"] = "txtName",
	["down.attr1"] = "attr1",
	["down.bottomPanel"] = "bottomPanel",
	["down.bottomPanel.pos"] = "pos",
	btnJump = {
		varname = "btnJump",
		binds = {
			event = "touch",
			methods = {
				ended = bindHelper.self("onJump")
			}
		}
	},
	left = {
		varname = "leftPanel",
		binds = {
			event = "visible",
			idler = bindHelper.self("isShowPanel")
		}
	},
	down = {
		varname = "downPanel",
		binds = {
			event = "visible",
			idler = bindHelper.self("isShowPanel")
		}
	},
	cardImg = {
		varname = "cardImg",
		binds = {
			event = "visible",
			idler = bindHelper.self("isShowPanel")
		}
	},
	attrInfo = {
		varname = "attrInfo",
		binds = {
			{
				event = "visible",
				idler = bindHelper.self("isShowPanel")
			},
			{
				event = "extend",
				class = "draw_attr",
				props = {
					type = "big",
					lock = false,
					nvalue = bindHelper.self("nvalue"),
					zwakeValue = bindHelper.self("zawakeNvalue"),
					offsetPos = {
						{
							x = -100,
							y = -100
						},
						{
							x = 10,
							y = -160
						},
						{
							x = 10,
							y = -260
						},
						{
							x = -100,
							y = -320
						},
						{
							y = -260,
							x = matchLanguage({
								"kr",
								"en"
							}) and -265 or -210
						},
						{
							y = -160,
							x = matchLanguage({
								"kr",
								"en"
							}) and -265 or -210
						}
					},
					offset = {
						x = 230,
						y = 250
					},
					onNode = function (slot0)
						slot0:xy(240, 170)
					end
				}
			}
		}
	},
	effect = {
		varname = "effect",
		binds = {
			event = "click",
			method = bindHelper.self("onClose")
		}
	}
}

function slot1.onCreate(slot0, slot1, slot2, slot3, slot4)
	slot0.panel = ccui.Layout:create():addTo(slot0:getResourceNode(), 100, "mask"):setAnchorPoint(cc.p(0.5, 0.5)):size(cc.size(display.maxWidth, display.height)):alignCenter(slot0:getResourceNode():size()):setTouchEnabled(true):show()

	audio.playEffectWithWeekBGM("card_gain.mp3")

	slot0.isShowPanel = idler.new(false)
	slot6 = widget.addAnimation(slot0.effect, "effect/huodexinjinglingbg.skel", "effect", 1):alignCenter(slot0.effect:size()):scale(2)

	performWithDelay(slot0.effect, function ()
		uv0 = "play"
		slot0 = slot0.play

		slot0(slot0, "effect_loop")

		uv0 = "effect_loop"
		slot0 = slot0.leftPanel
		slot0 = slot0.scaleX

		slot0(slot0, 0)

		uv0 = "effect_loop"
		slot0 = slot0.downPanel
		slot0 = slot0.scaleX

		slot0(slot0, 0)

		uv0 = "effect_loop"
		slot0 = slot0.attrInfo
		slot0 = slot0.scale

		slot0(slot0, 0)

		uv0 = "effect_loop"
		slot0 = slot0.isShowPanel
		slot1 = slot0

		slot0.set(slot1, true)

		uv1 = "effect_loop"
		slot0 = transition.executeSequence(slot1.leftPanel):scaleXTo(0.5, 1.1):scaleXTo(0.1, 1)
		slot1 = slot0

		slot0.done(slot1)

		uv1 = "effect_loop"
		slot0 = transition.executeSequence(slot1.downPanel):scaleXTo(0.5, 1.1):scaleXTo(0.1, 1)
		slot1 = slot0

		slot0.done(slot1)

		uv1 = "effect_loop"
		slot0 = transition.executeSequence(slot1.attrInfo):scaleTo(0.5, 1.1):scaleTo(0.1, 1)
		slot0 = slot0.done

		slot0(slot0)

		uv0 = "effect_loop"
		slot1 = widget.addAnimation(slot0:getResourceNode(), "effect/huodexinjingling.skel", "effect", 103)
		slot5 = 0.5
		uv5 = "effect_loop"

		slot1:align(cc.p(slot5, 1), slot5.titlePanel:xy()):scale(1.2)

		slot2 = slot1.addPlay
		slot4 = "effect_loop"

		slot2(slot1, slot4)

		uv2 = "effect_loop"
		slot2 = slot2.cardImg:size()
		uv4 = "effect_loop"

		widget.addAnimation(slot4.cardImg, "effect/jinglingchuxian.skel", "effect", 6):xy(slot2.width / 2, slot2.height * 0.05)
	end, 0.6666666666666666)

	slot2 = slot2 or {}

	if slot4 then
		slot0.cb = slot4
	end

	slot8 = gGameModel.cards:find(slot1.dbid or slot1.db_id):read("card_id", "character", "nvalue", "name", "advance", "zawake_nvalue")

	slot0.nature:text(csv.character[slot8.character].name)

	slot10 = csv.unit[csv.cards[slot8.card_id].unitID]
	slot11 = slot10.skillList
	slot12 = csv.skill[slot11[itertools.size(slot11)]]

	slot0.skillContent:hide()
	beauty.textScroll({
		size = slot0.skillContent:size(),
		strs = slot12.simDesc
	}):xy(slot0.skillContent:box()):z(slot0.skillContent:z()):addTo(slot0.skillContent:parent())
	slot0.skillName:text(slot12.skillName)
	slot0.icon:texture(ui.SKILL_ICON[slot12.skillNatureType])
	slot0.skillAttr:texture(ui.SKILL_TEXT_ICON[slot12.skillNatureType])
	slot0.rarity:texture(ui.RARITY_ICON[slot10.rarity])

	slot14 = slot0.cardImg:size()

	widget.addAnimation(slot0.cardImg, slot10.unitRes, "standby_loop", 5):xy(slot14.width / 2, slot14.height * 0.05):scale(slot10.scaleU * 3):setSkin(slot10.skin)
	widget.addAnimationByKey(slot0.cardImg, "effect/jinhuajiemian.skel", "top", "effect_down2_loop", 4):xy(slot14.width / 2, -50):scale(1.2)
	widget.addAnimationByKey(slot0.cardImg, "effect/jinhuajiemian.skel", "down", "effect_up_loop", 6):xy(slot14.width / 2, -50):scale(1.2)
	uiEasy.setMaxStar(slot0.cardImg, {
		align = "left",
		scale = 1.4,
		cardId = slot8.card_id,
		position = {
			x = 0,
			y = math.floor(slot0.cardImg:height() / 1.8)
		}
	})
	uiEasy.setIconName("card", slot8.card_id, {
		space = true,
		node = slot0.txtName,
		name = slot8.name,
		advance = slot8.advance
	})
	slot0.attr2:visible(slot10.natureType2 ~= nil)

	if slot10.natureType2 then
		slot0.attr2:texture(ui.ATTR_ICON[slot10.natureType2])
	end

	slot0.attr1:texture(ui.ATTR_ICON[slot10.natureType])

	slot0.nvalue = slot8.nvalue
	slot0.zawakeNvalue = slot8.zawake_nvalue
	slot1.new = slot1.new or slot1.first

	if slot1.new and not slot2[slot8.card_id] then
		slot2[slot8.card_id] = true

		slot0.cardName:text(csv.cards[slot8.card_id].name)
		adapt.oneLineCenterPos(cc.p(slot0.pos:xy()), {
			slot0.cardName,
			slot0.cardNote
		}, cc.p(10, 0))
	else
		slot0.bottomPanel:hide()
		slot0.leftNew:hide()
	end

	adapt.oneLinePos(slot0.txtName, slot0.rarity, cc.p(8, 0), "right")
	adapt.oneLinePos(slot0.txtName, {
		slot0.attr1,
		slot0.attr2
	}, cc.p(8, 0))
	performWithDelay(slot0, function ()
		uv0 = "panel"

		slot0.panel:hide()
	end, 1)
	slot0.btnJump:visible(false)
	performWithDelay(slot0, function ()
		slot2 = false
		uv1 = "userDefault"
		uv2 = "userDefault"

		if slot2 == nil then
			slot1 = not userDefault.getForeverLocalKey("isJumpSpriteView", slot2)
		end

		uv2 = "getForeverLocalKey"

		slot2.btnJump:visible(slot1)
	end, 0.9)

	if matchLanguageForce(slot9.languages) == false then
		errorInWindows("配置可获取到整卡 %s, 但 csv.cards (%s) 未开放", slot8.card_id, LOCAL_LANGUAGE)
	end
end

function slot1.onJump(slot0)
	userDefault.setForeverLocalKey("isJumpSpriteView", true)
	slot0:onClose()
end

function slot1.onClose(slot0)
	slot1 = slot0.addCallbackOnExit

	slot1(slot0, slot0.cb)

	uv1 = "addCallbackOnExit"

	slot1.onClose(slot0)
end

return slot1
