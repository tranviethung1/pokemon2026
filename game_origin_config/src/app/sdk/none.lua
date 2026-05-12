slot0 = "img/editor/btn_1.png"
slot1 = "img/editor/btn.png"

return {
	commitRoleInfo = function (slot0, slot1)
		return slot1()
	end,
	_payOnline = function (slot0, slot1, slot2, slot3, slot4, slot5)
		gGameApp.net:sendHttpRequest("POST", ({
			kr = "http://119.28.235.28:28081",
			cn = "http://212.64.58.151:28081"
		})[dev.ONLINE_VERSION_LANGUAGE] .. "/tjgame/create", string.format("accountId=%s&orderStatus=1&orderId=%s&amount=%.2f&game_extra=%s", stringz.bintohex(gGameModel.role:read("account_id")), slot0, 0, slot1), cc.XMLHTTPREQUEST_RESPONSE_STRING, function (slot0)
			if slot0.status == 200 then
				slot2 = ccui.Layout:create():size(display.sizeInView):xy(-display.sizeInView.width / 2, -display.sizeInView.height / 2)

				slot2:setBackGroundColorType(1)
				slot2:setBackGroundColor(cc.c3b(91, 84, 91))
				slot2:setBackGroundColorOpacity(204)
				slot2:setTouchEnabled(true)

				slot7 = 100
				slot3 = ccui.EditBox:create(cc.size(400, slot7), "")

				slot3:setText("12345678")

				slot6 = ui.COLORS.RED

				slot3:setFontColor(slot6)

				uv6 = "status"
				uv7 = "cc"
				slot4 = ccui.Button:create(slot6, slot7)

				slot4:setTitleText("支付码OK")
				slot4:setTitleColor(cc.c3b(0, 0, 0))
				slot4:setTitleFontSize(30)
				slot4:setOpacity(100)
				slot4:setPressedActionEnabled(true)
				slot4:xy(0, -100):show()
				slot4:addClickEventListener(function ()
					error("Decompilation failed")
					-- Exception in function building!
					-- Traceback (most recent call last):
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 856, in _build_function
					--     return _build_function_definition(prototype, state.header)
					--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 54, in _build_function_definition
					--     node.statements.contents = _build_function_blocks(state, instructions)
					--                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 101, in _build_function_blocks
					--     statement, line_marked_elements = _build_statement(state, addr, instruction)
					--                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 451, in _build_statement
					--     return _build_var_assignment(state, addr, instruction)
					--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 438, in decorated
					--     assn = func(*args, **kwargs)
					--            ^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 528, in _build_var_assignment
					--     expression = _build_const_expression(state, addr, instruction)
					--                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 834, in _build_const_expression
					--     return _build_numeric_constant(state, instruction.CD)
					--            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
					-- File "/home/hungtv/megamon2024/luajit-decompiler/ljd/ast/builder.py", line 1027, in _build_numeric_constant
					--     number = state.constants.numeric_constants[index]
					--              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^
					-- IndexError: list index out of range
				end)
				cc.Node:create():add(slot2, -99):add(slot3):add(slot4):xy(display.sizeInView.width / 2, display.sizeInView.height / 2):addTo(gGameUI.scene, 999)

				return
			end

			slot1 = print

			slot1("POST none.create order Error", APP_CHANNEL, slot0.status, slot0.statusText)

			uv1 = "ccui"

			slot1(-1)
		end)
	end,
	pay = function (slot0, slot1, slot2, slot3, slot4, slot5)
		gGameUI:showDialog({
			clearFast = true,
			btnType = 2,
			title = "RedFox Info",
			content = "Purchase Confirmation? \n " .. slot4,
			cb = function ()
				gGameUI:showConnecting()

				slot0 = gGameModel.account:read("name")
				uv5 = "gGameUI"
				uv6 = "showConnecting"
				uv7 = "gGameModel"
				uv10 = "account"
				slot6 = gGameApp.net

				slot6:sendHttpRequest("POST", "http://51.79.248.41:28081/OkamiPay/payment", string.format("accountId=%s&orderStatus=1&orderId=%s&amount=%.2f&game_extra=%s&username=%s&desc=%s", stringz.bintohex(gGameModel.role:read("account_id")), md5(777654645654.0 .. slot0), slot6, slot7, slot0, string.urlencode(slot10)), cc.XMLHTTPREQUEST_RESPONSE_STRING, function (slot0)
					if slot0.status == 200 then
						slot1 = json.decode(slot0.response)

						print(slot1.ReturnCode)

						if slot1.ReturnCode == 201 then
							slot2 = gGameUI
							slot2 = slot2.showDialog

							slot2(slot2, {
								clearFast = true,
								btnType = 2,
								title = "RedFox Info",
								content = slot1.MsgCode,
								cb = function ()
									uv5 = "cc"
									uv6 = "Application"

									cc.Application:getInstance():openURL(string.format("%s/quicklogin.php?data=%s&username=%s", APILINK, slot5, slot6))
								end,
								dialogParams = {
									clickClose = false
								}
							}, styles)

							uv2 = "decode"

							slot2(-1)
						else
							slot2 = gGameUI
							slot2 = slot2.showTip

							slot2(slot2, slot1.MsgCode)

							uv2 = "decode"

							slot2(0)
						end
					else
						slot1 = print

						slot1("POST none.pay order Error", APP_CHANNEL, slot0.status, slot0.statusText)

						uv1 = "decode"

						slot1(-1)
					end
				end)
			end,
			dialogParams = {
				clickClose = false
			}
		}, styles)
	end,
	logout = function (slot0)
		return slot0()
	end
}
