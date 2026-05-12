slot1 = class("ActivityDispatchSuc", cc.load("mvc").ViewBase)
slot1.RESOURCE_FILENAME = "activity_dispatch_suc.json"
slot1.RESOURCE_BINDING = {
	textNote = "textNote"
}

function slot1.onCreate(slot0)
	widget.addAnimation(slot0:getResourceNode(), "qimiaomaoxian/weipaichenggong.skel", "effect", 0):scale(2.5):alignCenter(display.sizeInView):addPlay("effect_loop")
end

return slot1
