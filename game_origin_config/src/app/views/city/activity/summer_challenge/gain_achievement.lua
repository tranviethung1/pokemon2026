slot1 = class("SummerChallengeGainAchievementView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "summer_challenge_gain_achievement.json"
slot1.RESOURCE_BINDING = {
	["icon.imgTitle"] = "title",
	item = "item",
	bgPanel = "bgPanel",
	["icon.imgLight"] = "imgLight",
	["icon.imgLight1"] = "imgLight1",
	["icon.imgIcon"] = "icon",
	gain = {
		varname = "gain",
		binds = {
			{
				event = "effect",
				data = {
					outline = {
						size = 4,
						color = cc.c4b(91, 84, 91, 255)
					}
				}
			}
		}
	}
}
slot1.RESOURCE_STYLES = {
	blackLayer = true,
	clickClose = true
}

function slot1.onCreate(slot0, slot1)
	slot2 = csv.summer_challenge.base[slot1]
	slot3 = dataEasy.getCfgByKey(slot2.achievementID).name

	bind.extend(slot0, slot0.item, {
		class = "icon_key",
		props = {
			data = {
				key = slot2.achievementID
			}
		}
	})

	if slot2.achievementBg then
		if string.find(slot2.achievementBg, ".skel") then
			slot0.bgPanel:get("iconBg"):hide()

			slot4 = widget.addAnimationByKey(slot0.bgPanel, slot2.achievementBg, "spine1", "effect", 10):anchorPoint(cc.p(0.5, 0.5)):xy(slot2.bgSpinePos.x, slot2.bgSpinePos.y):scale(slot2.bgScale.x)
		else
			slot4 = slot0.bgPanel:get("iconBg")

			slot4:texture(slot2.achievementBg)
			slot4:setScaleX(slot2.bgScale.x)
			slot4:setScaleY(slot2.bgScale.y)
		end
	end

	if slot2.achievementImg then
		slot0.icon:texture(slot2.achievementImg)
	end

	if slot2.achievementText then
		slot0.title:texture(slot2.achievementText)
	end

	slot0.icon:setPosition(slot0.icon:x() + slot2.imgPos.x, slot0.icon:y() + slot2.imgPos.y)

	if slot3 then
		slot0.gain:text(string.format(gLanguageCsv.summerChallengeGain, slot3))
	end

	if not slot2.achievementBg then
		slot0.imgLight:runAction(cc.RepeatForever:create(cc.RotateBy:create(15, 360)))
		slot0.imgLight1:runAction(cc.RepeatForever:create(cc.RotateBy:create(6, -360)))
	else
		slot0.imgLight:hide()
		slot0.imgLight1:hide()
	end
end

return slot1
