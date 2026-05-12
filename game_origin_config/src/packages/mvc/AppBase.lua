slot0 = class("AppBase")

function slot0.ctor(slot0, slot1)
	globals.gGameApp = slot0
	slot0.scene = display.newScene("main")
	slot0.configs_ = {
		defaultSceneName = "MainScene",
		modelsRoot = "app.models",
		viewsRoot = {
			"battle.app_views",
			"lushi_battle.app_views",
			"app.views"
		}
	}

	for slot5, slot6 in pairs(slot1 or {}) do
		slot0.configs_[slot5] = slot6
	end

	if type(slot0.configs_.viewsRoot) ~= "table" then
		slot0.configs_.viewsRoot = {
			slot0.configs_.viewsRoot
		}
	end

	if type(slot0.configs_.modelsRoot) ~= "table" then
		slot0.configs_.modelsRoot = {
			slot0.configs_.modelsRoot
		}
	end

	slot0:onCreate()
end

function slot0.run(slot0, slot1)
	slot0:enterScene(slot1 or slot0.configs_.defaultSceneName)
end

function slot0.enterScene(slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0:createView(slot1)

	slot5:onCreate()
	slot5:setVisible(true)
	slot0.scene:addChild(slot5)

	return slot5
end

function slot0.createView(slot0, slot1, slot2, slot3)
	if slot0:getViewClass(slot1) == nil then
		error(string.format("'%s' not found in views root:", slot1))
	end

	return slot4:create(slot0, slot2, slot3)
end

function slot0.getViewClass(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.configs_.viewsRoot) do
		slot7 = string.format("%s.%s", slot6, slot1):gsub("/", ".")

		printDebug("[getViewClass] %s ", slot7)

		slot8, slot9 = pcall(require, slot7)

		if slot8 then
			return slot9
		end

		if not slot9:find("not found") or slot10:find("expected") then
			printError(slot10)
			require(slot7)
		end
	end
end

function slot0.onCreate(slot0)
end

return slot0
