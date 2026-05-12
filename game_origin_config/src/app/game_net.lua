slot1 = class("GameNet", require("net.manager"))

function slot1.ctor(slot0, slot1)
	slot0.game = slot1
	slot0.noticeUrl = "http://192.168.1.99:18080/notice"
	slot0.versionUrl = "http://192.168.1.99:18080/version"
	slot0.serverUrl = "http://192.168.1.99:18080/servers"
	slot0.loginAddress = "192.168.1.99:16666"
	slot0.loginHost = "192.168.1.99"
	slot0.loginPort = 16666
	slot0.gameHost = "192.168.1.99"
	slot0.gamePort = 18080
	slot0.loginSession = require("app.servers.login.session").new(slot0)
	slot0.gameSession = require("app.servers.game.session").new(slot0)
	slot0.onlinefightSession = require("app.servers.onlinefight.session").new(slot0)
	slot2 = require("app.servers.unionadventure.session").new(slot0)
	slot0.unionadventureSession = slot2
	uv2 = "game"

	slot2.ctor(slot0)
end

function slot1.initLoginUrl(slot0)
	slot0.noticeUrl = NOTICE_CONF_URL
	slot0.versionUrl = VERSION_CONF_URL
	slot0.serverUrl = SERVER_CONF_URL
	slot0.loginAddress = LOGIN_SERVRE_HOSTS_TABLE[math.random(1, #LOGIN_SERVRE_HOSTS_TABLE)]
	slot0.loginHost, slot0.loginPort = string.gmatch(slot0.loginAddress, "([-a-z0-9A-Z.]+):(%d+)")()
	slot0.loginPort = tonumber(slot0.loginPort)
end

function slot1.setGameAddr(slot0, slot1)
	slot0.gameAddress = slot1.addr
	slot0.gameHost, slot0.gamePort = string.gmatch(slot0.gameAddress, "([-a-z0-9A-Z.]+):(%d+)")()

	slot0.gameSession:init(slot0.gameHost, slot0.gamePort, slot0.game.model.account:read("id"), slot1.key)
end

function slot1.doLogin(slot0, slot1, slot2)
	slot0.loginSession:init(slot0.loginHost, slot0.loginPort, slot1, slot2)
end

function slot1.doLoginEnd(slot0)
	slot0.loginSession:sleep()
end

function slot1.doGameEnd(slot0)
	slot0:initLoginUrl()
	slot0.gameSession:sleep()
end

function slot1.doRealtime(slot0, slot1, slot2, slot3)
	slot0.onlinefightSession:init(slot1, slot2, slot0.game.model.role:read("id"), userDefault.getForeverLocalKey("serverKey", nil, {
		rawKey = true
	}), slot3)
end

function slot1.doRealtimeEnd(slot0)
	slot0.onlinefightSession:sleep()
end

function slot1.getSessionByService(slot0, slot1)
	if slot1 == "game" then
		return slot0.gameSession
	elseif slot1 == "onlinefight" then
		return slot0.onlinefightSession
	elseif slot1 == "unionadventure" then
		return slot0.unionadventureSession
	else
		return slot0.loginSession
	end
end

function slot1.updateSession(slot0, slot1)
	slot0.loginSession:update(slot1)
	slot0.gameSession:update(slot1)
	slot0.onlinefightSession:update(slot1)
	slot0.unionadventureSession:update(slot1)
end

return slot1
