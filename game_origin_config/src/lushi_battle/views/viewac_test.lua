function AutoChessBattleView.addTestBtn(slot0)
	if not EDITOR_ENABLE then
		return
	end

	if device.platform == "windows" then
		require("app.editor.auto_chess"):init(slot0)
	end
end
