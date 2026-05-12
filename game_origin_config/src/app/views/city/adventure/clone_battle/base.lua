slot1 = class("CloneBattleBaseView", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "clone_battle_base.json"
slot1.RESOURCE_BINDING = {}

function slot1.onCreate(slot0, slot1)
	slot2 = slot0:getResourceNode()
	slot3 = slot2:size()
	slot0.bgAni = widget.addAnimation(slot2, "huizhangbeijing/yuansudizuo.skel", "effect_1_loop", 12):scale(2):xy(slot3.width / 2, slot3.height / 2):hide()
	slot0.bgAniB = widget.addAnimation(slot2, "huizhangbeijing/yuansubeijing.skel", "effect_loop", 11):scale(2):xy(slot3.width / 2, slot3.height / 2)
	slot0.bgAniF = widget.addAnimation(slot2, "huizhangbeijing/yuansu_qianjing.skel", "effect_loop", 13):scale(2):xy(slot3.width / 2, slot3.height / 2)

	if slot1 then
		slot0.data = slot1

		slot0:refreshView()
	else
		slot0:refresh()
	end
end

function slot1.onCleanup(slot0)
	if slot0.view then
		slot0.view:removeFromParent()

		slot0.view = nil
	end

	uv1 = "view"

	slot1.onCleanup(slot0)
end

function slot1.refresh(slot0)
	gGameApp:requestServer("/game/clone/get", function (slot0)
		uv1 = "data"
		slot1.data = slot0.view
		uv1 = "data"

		slot1:refreshView()
	end)
end

function slot1.refreshView(slot0, slot1)
	slot0.data = slot1 or slot0.data

	if slot0.view then
		slot0.view:onClose()

		slot0.view = nil

		slot0.bgAni:hide()
	end

	if gGameModel.role:read("clone_room_db_id") then
		slot0.bgAniB:visible(false)
		slot0.bgAniF:visible(false)

		slot0.view = gGameUI:createView("city.adventure.clone_battle.room", slot0):init(slot0)
	else
		slot0:playBgAni(nil)
		slot0.bgAniB:visible(true)
		slot0.bgAniF:visible(true)

		slot0.view = gGameUI:createView("city.adventure.clone_battle.view", slot0):init(slot0.data, slot0)
	end

	gGameUI.topuiManager:createView("default", slot0.view, {
		onClose = slot0:createHandler("onClose")
	}):init({
		subTitle = "CloneBattle",
		title = gLanguageCsv.clone
	})
end

function slot1.playBgAni(slot0, slot1)
	if slot1 then
		slot0.bgAni:show()
		slot0.bgAni:play("effect_" .. slot1 .. "_loop")
	else
		slot0.bgAni:hide()
	end
end

return slot1
