slot0 = class("AsyncLoading")
slot1 = {
	"asyncFor",
	"overFor",
	"pauseFor",
	"resumeFor",
	"quickFor",
	"isPreloadOK",
	"preloadOverFor"
}

function slot0.init_(slot0)
	slot0.loading = false
	slot0.pause = false
	slot0.data = nil
	slot0.skip = 0
end

function slot0.bind(slot0, slot1)
	slot0:init_()

	uv5 = "init_"

	cc.setmethods(slot1, slot0, slot5)
	slot1:enableUpdate()

	slot0.target_ = slot1
	slot0.update_ = callbacks.new(slot1.onUpdate_, functools.partial(slot0.onAsyncUpdate_, slot0))
	slot1.onUpdate_ = slot0.update_
end

function slot0.unbind(slot0, slot1)
	if slot0.loading and slot0.data.cb_over then
		slot0.data.cb_over()
	end

	uv4 = "loading"

	cc.unsetmethods(slot1, slot4)
	slot0:init_()
	slot0.update_:remove()
end

function slot0.asyncFor(slot0, slot1, slot2, slot3, slot4)
	if slot0.loading then
		slot0:overFor()
	end

	slot0.skip = 0
	slot0.data = {
		co = coroutine.create(function ()
			uv1 = "xpcall"

			xpcall(slot1, __G__TRACKBACK__)
		end),
		cb_over = slot2,
		preload = slot3 or 0,
		cb_preload_over = slot4,
		skip = slot3 ~= nil
	}
	slot0.pause = false
	slot0.loading = true
end

function slot0.onAsyncUpdate_(slot0)
	if slot0.data == nil then
		return
	end

	if not slot0.target_:isVisibleInGlobal() then
		return
	end

	if slot0.pause and slot1.preload <= 0 then
		return
	end

	if slot0.skip > 0 then
		slot0.skip = slot0.skip - 1

		return
	end

	while slot1.preload > 0 or true do
		idlersystem.onViewBaseCoroutineBegin(slot0.target_)

		slot3, slot4 = coroutine.resume(slot1.co)

		idlersystem.onViewBaseCoroutineEnd(slot0.target_)

		if slot3 == nil or slot3 == false then
			slot0:overFor()

			break
		end

		slot1.preload = slot1.preload - 1
		slot2 = false

		if slot1.preload <= 0 and slot1.skip then
			slot0.skip = math.max(10, 60 - display.director:getFrameRate())
		end
	end

	if slot1.cb_preload_over and slot1.preload <= 0 then
		slot1.cb_preload_over()

		slot1.cb_preload_over = nil
	end
end

function slot0.overFor(slot0)
	if slot0.loading then
		slot0.loading = false
		slot0.data = nil

		if slot0.data and slot1.cb_preload_over then
			slot1.cb_preload_over()
		end

		if slot1 and slot1.cb_over then
			slot1.cb_over()
		end
	end
end

function slot0.pauseFor(slot0)
	slot0.pause = true
end

function slot0.resumeFor(slot0)
	slot0.pause = false
end

function slot0.quickFor(slot0, slot1)
	if slot0.data == nil then
		return
	end

	slot0.skip = 0
	slot2.skip = false

	if slot1 == "sync" then
		slot2.preload = 999999
	end
end

function slot0.isPreloadOK(slot0)
	return slot0.data.preload <= 0
end

function slot0.preloadOverFor(slot0, slot1)
	if slot0.data == nil or slot0.data.preload <= 0 then
		if slot0.data == nil then
			printError("!!! 检查弹框创建是否在协程创建之前")
		end

		slot1()
	else
		slot0.data.cb_preload_over = slot1
	end
end

return slot0
