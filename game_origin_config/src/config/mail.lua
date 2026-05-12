slot0 = {
	__size = 1,
	[2] = {
		gold = 100000,
		rmb = 3000,
		vip = 5,
		__size = 3
	}
}
slot1 = {
	[9] = slot0[2],
	[7] = slot0[2]
}
csv.mail = {
	{
		subject_en = "System Mail",
		sender_th = "เลขานุการ",
		subject = "System Mail",
		id = 1,
		sender_en = "Secretary",
		sender = "Secretary",
		tab = 1,
		subject_th = "System Mail"
	},
	{
		subject_en = "Game Developer mail",
		id = 2,
		sender_en = "Daluoluo",
		subject_th = "อีเมลสำหรับนักพัฒนาเกม",
		sender_th = "ต้าหลัว",
		sender = "Daluoluo",
		subject = "Game Developer mail"
	},
	{
		subject = "Rank Rewards",
		subject_th = "รางวัลอันดับ",
		id = 3,
		content_th = "เรียนเทรนเนอร์: \n ผลงานของคุณในการแข่งขันจัดอันดับนั้นยอดเยี่ยมมาก! เมื่อเวลา 21:00 น. คุณบรรลุอันดับที่ %d ระบบได้ส่งรางวัลไปยังอีเมลของคุณแล้ว โปรดตรวจสอบและขอรับสิทธิ์ \n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "ทีมงานอารีน่า",
		sender = "Arena Staff",
		content = "Dear trainer: \n    Your performance in the ranked matches was amazing! As of 21:00, you achieved rank No. %d. Rewards have been sent to your mail, please check and claim it. \n    Happy gaming!",
		content_en = "Dear trainer: \n    Your performance in the ranked matches was amazing! As of 21:00, you achieved rank No. %d. Rewards have been sent to your mail, please check and claim it. \n    Happy gaming!",
		subject_en = "Rank Rewards",
		sender_en = "Arena Staff"
	},
	{
		subject = "The mine has run out of resources!",
		subject_th = "เหมืองหมดทรัพยากรแล้ว!",
		id = 4,
		content_th = "เรียนเทรนเนอร์:\n เหมืองของคุณถูกปล้นไปเปล่าๆ! รางวัลการผลิต %s ส่งทางไปรษณีย์แล้ว โปรดตรวจสอบ\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "ถูกทอดทิ้ง",
		sender = "Abandoned",
		content = "Dear trainers:\n    Your mine has been looted empty! The %s production reward has sent via mail, please check.\n    Happy gaming!",
		content_en = "Dear trainers:\n    Your mine has been looted empty! The %s production reward has sent via mail, please check.\n    Happy gaming!",
		subject_en = "The mine has run out of resources!",
		sender_en = "Abandoned"
	},
	{
		subject = "Your mine has been looted!",
		subject_th = "เหมืองของคุณถูกปล้น!",
		id = 5,
		content_th = "เรียน เทรนเนอร์:\n เหมืองของคุณถูก %s ครอบครอง! ส่งรางวัลการผลิต %s ทางไปรษณีย์แล้ว\n ครั้งหน้าขอให้โชคดีกว่านี้!",
		sender_th = "ถูกทอดทิ้ง",
		sender = "Abandoned",
		content = "Dear trainers:\n    Your mine has been occupied by %s! The %s production reward has been sent via mail.\n    Better luck next time!",
		content_en = "Dear trainers:\n    Your mine has been occupied by %s! The %s production reward has been sent via mail.\n    Better luck next time!",
		subject_en = "Your mine has been looted!",
		sender_en = "Abandoned"
	},
	{
		subject = "Endless Tower Rewards",
		subject_th = "รางวัล Endless Tower",
		id = 6,
		content_th = "เรียนเทรนเนอร์:\n Yo'veu แสดงผลงานที่ยอดเยี่ยมในแมตช์จัดอันดับและได้อันดับ %d ใน Endless Tower วันนี้ โปรดตรวจสอบและรับรางวัลที่ส่งทางไปรษณีย์\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "Endless Tower  Guard เอียน",
		sender = "Endless Tower Guardian",
		content = "Dear trainer:\n Yo'veu displayed an excellent performance in the ranked match and achieved rank %d in Endless Tower today. Please check and claim the rewards that have been sent via mail.\n Happy gaming!",
		content_en = "Dear trainer:\n Yo'veu displayed an excellent performance in the ranked match and achieved rank %d in Endless Tower today. Please check and claim the rewards that have been sent via mail.\n Happy gaming!",
		subject_en = "Endless Tower Rewards",
		sender_en = "Endless Tower Guardian"
	},
	{
		subject = "Daily login reward",
		subject_th = "รางวัลล็อกอินรายวัน",
		id = 7,
		content_th = "เรียนเทรนเนอร์:\n ขอบคุณสำหรับการเข้าสู่ระบบในวันนี้ โปรดรับรางวัลการเข้าสู่ระบบทางไปรษณีย์ของคุณ\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers:\n    Thank you for logging in today. Please claim the login rewards in your mail.\n    Happy gaming!",
		content_en = "Dear trainers:\n    Thank you for logging in today. Please claim the login rewards in your mail.\n    Happy gaming!",
		subject_en = "Daily login reward",
		sender_en = "Secretary",
		attachs = slot1[7]
	},
	{
		subject = "Daily login reward",
		subject_th = "รางวัลล็อกอินรายวัน",
		id = 8,
		content_th = "เรียนเทรนเนอร์:\n ขอบคุณสำหรับการเข้าสู่ระบบในวันนี้ โปรดรับรางวัลการเข้าสู่ระบบทางไปรษณีย์ของคุณ\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers:\n    Thank you for logging in today. Please claim the login rewards in your mail.\n    Happy gaming!",
		content_en = "Dear trainers:\n    Thank you for logging in today. Please claim the login rewards in your mail.\n    Happy gaming!",
		subject_en = "Daily login reward",
		sender_en = "Secretary",
		attachs = {
			gold = 100000,
			rmb = 3000,
			vip = 3,
			__size = 3
		}
	},
	{
		subject = "Daily login reward",
		subject_th = "รางวัลล็อกอินรายวัน",
		id = 9,
		content_th = "เรียนเทรนเนอร์:\n ขอบคุณสำหรับการเข้าสู่ระบบในวันนี้ โปรดรับรางวัลการเข้าสู่ระบบทางไปรษณีย์ของคุณ\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers:\n    Thank you for logging in today. Please claim the login rewards in your mail.\n    Happy gaming!",
		content_en = "Dear trainers:\n    Thank you for logging in today. Please claim the login rewards in your mail.\n    Happy gaming!",
		subject_en = "Daily login reward",
		sender_en = "Secretary",
		attachs = slot1[9]
	},
	{
		subject = "Daily login reward",
		subject_th = "รางวัลล็อกอินรายวัน",
		id = 10,
		content_th = "เรียนเทรนเนอร์:\n ขอบคุณสำหรับการเข้าสู่ระบบในวันนี้ โปรดรับรางวัลการเข้าสู่ระบบทางไปรษณีย์ของคุณ\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers:\n    Thank you for logging in today. Please claim the login rewards in your mail.\n    Happy gaming!",
		content_en = "Dear trainers:\n    Thank you for logging in today. Please claim the login rewards in your mail.\n    Happy gaming!",
		subject_en = "Daily login reward",
		sender_en = "Secretary",
		attachs = {
			gold = 100000,
			rmb = 3000,
			vip = 7,
			__size = 3
		}
	},
	{
		subject_en = "Trial Pack, for trial usage",
		id = 11,
		sender_en = "Secretary",
		subject_th = "Trial Pack สำหรับทดลองใช้งาน",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		subject = "Trial Pack, for trial usage",
		attachs = {
			[37.0] = 99,
			__size = 1
		}
	},
	{
		subject = "\"You're the MVP\" Compensation Pack",
		subject_th = "\"You're the MVP\" ชุดค่าตอบแทน",
		id = 12,
		content_th = "เรียนเทรนเนอร์: \n การบำรุงรักษาเซิร์ฟเวอร์เสร็จสิ้น! เมื่อเราเปิด \"กระป๋องเวิร์ม\" ได้ มีแมลงจำนวนมากปรากฏขึ้นและก่อให้เกิดปัญหาที่ไม่จำเป็นและความสูญเสียแก่เทรนเนอร์ ดังนั้น เราจะให้รางวัลแก่เทรนเนอร์เพื่อเป็นสัญลักษณ์แทนคำขอโทษ โปรดตรวจสอบอีเมลของคุณเพื่อรับ \n เนื่องจากนี่เป็นการทดสอบครั้งแรกของเรา เราขอขอบคุณสำหรับความเข้าใจของคุณ!",
		sender_th = "โปรแกรมเมอร์ขี้อาย",
		sender = "Shy Programmer",
		content = "Dear trainers: \n    Maintenance of the server is completed! As we opened \"a can of worms\", many bugs appeared and have caused unnecessary problems and losses to the trainers. Therefore, we will be giving trainers some rewards as a token of apology. Please check your mail to receive it. \n    As this is our first test, we thank you for your understanding!",
		content_en = "Dear trainers: \n    Maintenance of the server is completed! As we opened \"a can of worms\", many bugs appeared and have caused unnecessary problems and losses to the trainers. Therefore, we will be giving trainers some rewards as a token of apology. Please check your mail to receive it. \n    As this is our first test, we thank you for your understanding!",
		subject_en = "\"You're the MVP\" Compensation Pack",
		sender_en = "Shy Programmer",
		attachs = {
			gold = 50000,
			rmb = 300,
			__size = 2
		}
	},
	{
		subject = "System Annoucement",
		subject_th = "ประกาศระบบ",
		id = 13,
		content_th = "เรียนเทรนเนอร์:\n เพื่อให้ประสบการณ์การเล่นเกมเป็นไปอย่างราบรื่น เซิร์ฟเวอร์จะทำการรีบูตตั้งแต่เวลา 16:30-16:45 น. เพื่อแก้ไขปัญหาบางอย่าง เมื่อเซิร์ฟเวอร์เปิดอีกครั้ง โปรดตรวจสอบอีเมลของคุณเพื่อขอรับเงินชดเชยสำหรับการหยุดชะงัก n มีความสุขกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers:\n    In order to ensure a seamless gaming experience, the server will be rebooting from 16:30-16:45 to fix some issues. When the sever reopens, please check your mail to claim the compensation reward for the disruption. n    Happy gaming!",
		content_en = "Dear trainers:\n    In order to ensure a seamless gaming experience, the server will be rebooting from 16:30-16:45 to fix some issues. When the sever reopens, please check your mail to claim the compensation reward for the disruption. n    Happy gaming!",
		subject_en = "System Annoucement",
		sender_en = "Secretary"
	},
	{
		subject = "\"Heirloom\" Pack",
		subject_th = "\"Heirloom\" Pack",
		id = 14,
		content_th = "เรียนเทรนเนอร์:\n เราขออภัยสำหรับ Heirloom Pack ที่ล่าช้านี้ แต่สิ่งดีๆ ก็คุ้มค่าแก่การรอคอย! โปรดตรวจสอบอีเมลของคุณเพื่อรับ Heirloom Pack ลึกลับ\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers:\n    We apologize for this late Heirloom Pack, but good things are worth the wait! Please check your mail to claim the mysterious Heirloom Pack.\n    Happy gaming!",
		content_en = "Dear trainers:\n    We apologize for this late Heirloom Pack, but good things are worth the wait! Please check your mail to claim the mysterious Heirloom Pack.\n    Happy gaming!",
		subject_en = "\"Heirloom\" Pack",
		sender_en = "Secretary",
		attachs = {
			__size = 1,
			[40.0] = 1
		}
	},
	{
		subject = "Daily login reward",
		subject_th = "รางวัลล็อกอินรายวัน",
		id = 15,
		content_th = "เรียนเทรนเนอร์:\n ขอบคุณสำหรับการเข้าสู่ระบบในวันนี้ โปรดรับรางวัลการเข้าสู่ระบบทางไปรษณีย์ของคุณ\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers:\n    Thank you for logging in today. Please claim the login rewards in your mail.\n    Happy gaming!",
		content_en = "Dear trainers:\n    Thank you for logging in today. Please claim the login rewards in your mail.\n    Happy gaming!",
		subject_en = "Daily login reward",
		sender_en = "Secretary",
		attachs = {
			card = 21,
			__size = 1
		}
	},
	{
		subject = "Daily login reward",
		subject_th = "รางวัลล็อกอินรายวัน",
		id = 16,
		content_th = "เรียนเทรนเนอร์:\n ขอบคุณสำหรับการเข้าสู่ระบบในวันนี้ โปรดรับรางวัลการเข้าสู่ระบบทางไปรษณีย์ของคุณ\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers:\n    Thank you for logging in today. Please claim the login rewards in your mail.\n    Happy gaming!",
		content_en = "Dear trainers:\n    Thank you for logging in today. Please claim the login rewards in your mail.\n    Happy gaming!",
		subject_en = "Daily login reward",
		sender_en = "Secretary",
		attachs = {
			[21002.0] = 30,
			__size = 1
		}
	},
	{
		subject = "Closed Beta extension login reward",
		subject_th = "รางวัลล็อกอินส่วนขยาย Closed Beta",
		id = 17,
		content_th = "เรียนเทรนเนอร์:\n ขอบคุณสำหรับการเข้าสู่ระบบในวันนี้ โปรดรับรางวัลการเข้าสู่ระบบทางไปรษณีย์ของคุณ\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers:\n    Thank you for logging in today. Please claim the login rewards in your mail.\n    Happy gaming!",
		content_en = "Dear trainers:\n    Thank you for logging in today. Please claim the login rewards in your mail.\n    Happy gaming!",
		subject_en = "Closed Beta extension login reward",
		sender_en = "Secretary",
		attachs = {
			__size = 4,
			rmb = 3000,
			vip = 8,
			gold = 600000,
			[21002.0] = 30
		}
	},
	{
		subject = "Closed Beta extension login reward",
		subject_th = "รางวัลล็อกอินส่วนขยาย Closed Beta",
		id = 18,
		content_th = "เรียนเทรนเนอร์:\n ขอบคุณสำหรับการเข้าสู่ระบบในวันนี้ โปรดรับรางวัลการเข้าสู่ระบบทางไปรษณีย์ของคุณ\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers:\n    Thank you for logging in today. Please claim the login rewards in your mail.\n    Happy gaming!",
		content_en = "Dear trainers:\n    Thank you for logging in today. Please claim the login rewards in your mail.\n    Happy gaming!",
		subject_en = "Closed Beta extension login reward",
		sender_en = "Secretary",
		attachs = {
			__size = 4,
			rmb = 3000,
			vip = 9,
			gold = 600000,
			[21002.0] = 30
		}
	},
	{
		subject = "Closed Beta extension login reward",
		subject_th = "รางวัลล็อกอินส่วนขยาย Closed Beta",
		id = 19,
		content_th = "เรียนเทรนเนอร์:\n ขอบคุณสำหรับการเข้าสู่ระบบในวันนี้ โปรดรับรางวัลการเข้าสู่ระบบทางไปรษณีย์ของคุณ\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers:\n    Thank you for logging in today. Please claim the login rewards in your mail.\n    Happy gaming!",
		content_en = "Dear trainers:\n    Thank you for logging in today. Please claim the login rewards in your mail.\n    Happy gaming!",
		subject_en = "Closed Beta extension login reward",
		sender_en = "Secretary",
		attachs = {
			__size = 4,
			rmb = 3000,
			vip = 10,
			gold = 600000,
			[21002.0] = 30
		}
	},
	{
		subject = "union Dungeon Clearance Reward",
		subject_th = "รางวัลเคลียร์ดันเจี้ยนสหภาพ",
		id = 20,
		content_th = "เรียนเทรนเนอร์:\n %s ของสหภาพนี้เคลียร์ %s(%s) ของระดับ %s สำเร็จแล้ว โปรดตรวจสอบอีเมลเพื่อรับรางวัลของคุณ สมาชิกคนอื่นๆ ทำผลงานดีๆ แล้วพบกันใหม่เร็วๆ นี้\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "สหภาพ",
		sender = "union",
		content = "Dear trainer:\n    %s of this union has successfully cleared the %s(%s) of level %s. Please check mail to claim your rewards. Other members, keep up the good work and see you soon at the top.\n    Happy gaming!",
		content_en = "Dear trainer:\n    %s of this union has successfully cleared the %s(%s) of level %s. Please check mail to claim your rewards. Other members, keep up the good work and see you soon at the top.\n    Happy gaming!",
		subject_en = "union Dungeon Clearance Reward",
		sender_en = "union"
	},
	{
		subject = "union Dungeon Quick Clearance Reward",
		subject_th = "union Dungeon Quick Clearance Reward",
		id = 21,
		content_th = [[
เรียนสมาชิก: 
 ทำได้ดีมาก!
 %s ได้เคลียร์ %s(%s) ของระดับ %s อย่างรวดเร็ว โปรดตรวจสอบอีเมลสำหรับรางวัลเพิ่มเติม เราหวังว่าสมาชิกสหภาพทุกคนจะมีผลงานที่ดีต่อไป
 โชคดี!]],
		sender_th = "สหภาพ",
		sender = "union",
		content = [[
Dear member: 
    Good job!
    %s has swiftly cleared the %s(%s) of level %s. Please check mail for additional rewards. We hope all union members can keep up the good work.
    Good luck!]],
		content_en = [[
Dear member: 
    Good job!
    %s has swiftly cleared the %s(%s) of level %s. Please check mail for additional rewards. We hope all union members can keep up the good work.
    Good luck!]],
		subject_en = "union Dungeon Quick Clearance Reward",
		sender_en = "union"
	},
	{
		subject = "Get double returns for making purchases during beta testing",
		subject_th = "รับผลตอบแทนสองเท่าสำหรับการซื้อระหว่างการทดสอบเบต้า",
		id = 22,
		content_th = [[
#C0xffe672##F24#ถึงเทรนเนอร์:
 
 ด้วยการสนับสนุนของคุณสำหรับ Great Pokémon Adventure เราขอเสนอการทดสอบบัญชีแบบถาวรแก่คุณ เพื่อเป็นการตอบแทนผู้ฝึกโปเกมอนที่ร่วมเดินทางไปกับเราในโลกดิจิทัล เราขอคืนเงินเป็นสองเท่าของจำนวนเงินที่คุณซื้อในช่วงการทดสอบชั่วคราว (เพชรของขวัญไม่รวมอยู่ในการคืนเงิน การคืนเงินสองเท่าสามารถทำได้เท่านั้น รวบรวมไว้ในเซิร์ฟเวอร์เดียว) 
 ผู้ที่ได้รับเลือก ตอนนี้คุณเริ่มการผจญภัยได้แล้ว!
 โดย Great Pokémon Adventure Game Developers]],
		sender_th = "แองเจโวมอน",
		sender = "Angewomon",
		content = [[
#C0xffe672##F24#Dear trainers:
    
   With your support for the Great Pokémon Adventure, we present you the permanent account testing.  In order to give back to the Pokémon trainers who have went through a journey with us in the digital world, we hereby refund double of your purchase amount during the temporary testing period (gift diamonds are not included in the refund, double refund can only be collected in one server). 
    The chosen ones, you may now begin your adventure!
   By the Great Pokémon Adventure Game Developers]],
		content_en = [[
#C0xffe672##F24#Dear trainers:
    
   With your support for the Great Pokémon Adventure, we present you the permanent account testing.  In order to give back to the Pokémon trainers who have went through a journey with us in the digital world, we hereby refund double of your purchase amount during the temporary testing period (gift diamonds are not included in the refund, double refund can only be collected in one server). 
    The chosen ones, you may now begin your adventure!
   By the Great Pokémon Adventure Game Developers]],
		subject_en = "Get double returns for making purchases during beta testing",
		sender_en = "Angewomon"
	},
	{
		subject = "Mid-autumn festival daily login reward",
		subject_th = "รางวัลล็อกอินรายวันเทศกาลไหว้พระจันทร์",
		id = 23,
		content_th = "เรียนเทรนเนอร์:\n ขอบคุณสำหรับการเข้าสู่ระบบในวันนี้ เราหวังว่าคุณจะมีความสุขในเทศกาลไหว้พระจันทร์! โปรดรับรางวัลการเข้าสู่ระบบทางไปรษณีย์ของคุณ\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers:\n    Thank you for logging in today. We wish you a Happy Mid-Autumn Festival! Please claim the login rewards in your mail.\n    Happy gaming!",
		content_en = "Dear trainers:\n    Thank you for logging in today. We wish you a Happy Mid-Autumn Festival! Please claim the login rewards in your mail.\n    Happy gaming!",
		subject_en = "Mid-autumn festival daily login reward",
		sender_en = "Secretary",
		attachs = {
			gold = 100000,
			rmb = 50,
			[110.0] = 10,
			__size = 3
		}
	},
	{
		subject = "Time-limited Challenge Rewards",
		subject_th = "รางวัลท้าทายจำกัดเวลา",
		id = 24,
		content_th = "เรียนเทรนเนอร์: \n การแสดงของคุณในความท้าทายที่จำกัดเวลานั้นยอดเยี่ยมมาก! คุณได้รับอันดับที่ %d ในการจัดอันดับความเสียหายที่ทำได้ โปรดตรวจสอบอีเมลของคุณเพื่อรับรางวัล \n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers: \n    Your performance in the time-limited challenge was amazing! You've attained No. %d in the damage dealt ranking. Please check your mail to claim the rewards. \n    Happy gaming!",
		content_en = "Dear trainers: \n    Your performance in the time-limited challenge was amazing! You've attained No. %d in the damage dealt ranking. Please check your mail to claim the rewards. \n    Happy gaming!",
		subject_en = "Time-limited Challenge Rewards",
		sender_en = "Secretary"
	},
	{
		subject = "Time-limited Challenge Rewards",
		subject_th = "รางวัลท้าทายจำกัดเวลา",
		id = 25,
		content_th = "เรียนเทรนเนอร์: \n การแสดงของคุณในความท้าทายที่จำกัดเวลานั้นยอดเยี่ยมมาก! คุณได้รับอันดับที่ %d ในการจัดอันดับความเสียหายที่ทำได้ โปรดตรวจสอบอีเมลของคุณเพื่อรับรางวัล \n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers: \n    Your performance in the time-limited challenge was amazing! You've attained No. %d in the damage dealt ranking. Please check your mail to claim the rewards. \n    Happy gaming!",
		content_en = "Dear trainers: \n    Your performance in the time-limited challenge was amazing! You've attained No. %d in the damage dealt ranking. Please check your mail to claim the rewards. \n    Happy gaming!",
		subject_en = "Time-limited Challenge Rewards",
		sender_en = "Secretary"
	},
	{
		subject = "Time-limited Challenge Rewards",
		subject_th = "รางวัลท้าทายจำกัดเวลา",
		id = 26,
		content_th = "เรียนผู้เล่นทุกท่าน:\n เซิร์ฟเวอร์ของคุณได้รับความเสียหายจากการรบ  World Boss วันนี้! ได้ส่งรางวัลให้ทางไปรษณีย์แล้ว กรุณากดรับสิทธิ์ \n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear players:\n    Your server has hit the target damage against the World Boss battle today! Rewards have been sent via mail, please claim it. \n   Happy gaming!",
		content_en = "Dear players:\n    Your server has hit the target damage against the World Boss battle today! Rewards have been sent via mail, please claim it. \n   Happy gaming!",
		subject_en = "Time-limited Challenge Rewards",
		sender_en = "Secretary"
	},
	{
		subject_en = "Union Announcement",
		sender_th = "ศูนย์การจัดการยูเนี่ยน",
		subject = "Union Announcement",
		id = 27,
		sender_en = "union Management Center",
		sender = "union Management Center",
		tab = 1,
		subject_th = "ประกาศสหภาพ"
	},
	{
		subject = "Aether Paradise Rewards",
		subject_th = "Aether Paradise รีวอร์ด",
		id = 28,
		content_th = "เรียนเทรนเนอร์: \n การแสดงของคุณใน  Aether Paradise นั้นยอดเยี่ยมมาก! ณ เวลา 05:00 น. คุณบรรลุอันดับที่ %d โปรดตรวจสอบอีเมลของคุณเพื่อรับรางวัล \n ขอให้สิ่งใหม่ประสบความสำเร็จในครั้งต่อไป!",
		sender_th = "Aether Staff",
		sender = "Aether Staff",
		content = "Dear trainers: \n    Your performance in the Aether Paradise was amazing! As of 05:00 you've achieved rank No. %d. Please check your mail to claim the rewards. \n    May new achieve new heights the next time!",
		content_en = "Dear trainers: \n    Your performance in the Aether Paradise was amazing! As of 05:00 you've achieved rank No. %d. Please check your mail to claim the rewards. \n    May new achieve new heights the next time!",
		subject_en = "Aether Paradise Rewards",
		sender_en = "Aether Staff"
	},
	{
		subject = "All-target rewards mail",
		subject_th = "จดหมายรางวัลทุกเป้าหมาย",
		id = 29,
		content_th = "เรียนเทรนเนอร์:\n การแสดงของคุณในงานนี้ยอดเยี่ยมมาก! เมื่อสิ้นสุดกิจกรรม รางวัลทั้งหมดได้ถูกส่งไปยังอีเมลของคุณแล้ว โปรดตรวจสอบและรับมัน \n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers:\n    Your performance in the event was amazing! As of the end of the event, the all-target rewards have been sent to your mail, please check and claim it. \n    Happy gaming!",
		content_en = "Dear trainers:\n    Your performance in the event was amazing! As of the end of the event, the all-target rewards have been sent to your mail, please check and claim it. \n    Happy gaming!",
		subject_en = "All-target rewards mail",
		sender_en = "Secretary"
	},
	{
		subject = "Combat power ranking reward mail",
		subject_th = "จดหมายรางวัลการจัดอันดับพลังการต่อสู้",
		id = 30,
		content_th = "เรียนเทรนเนอร์: \n ผลงานของคุณในการจัดอันดับพลังการต่อสู้นั้นยอดเยี่ยมมาก! เมื่อเวลา 21:30 น. รางวัลอันดับถูกส่งไปยังอีเมลของคุณแล้ว โปรดตรวจสอบและรับมัน \n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers: \n    Your performance in the combat power ranking was amazing! As of 21:30, rank rewards have been sent to your mail, please check and claim it. \n    Happy gaming!",
		content_en = "Dear trainers: \n    Your performance in the combat power ranking was amazing! As of 21:30, rank rewards have been sent to your mail, please check and claim it. \n    Happy gaming!",
		subject_en = "Combat power ranking reward mail",
		sender_en = "Secretary"
	},
	{
		subject = "Combat power reward mail",
		subject_th = "จดหมายรางวัลพลังต่อสู้",
		id = 31,
		content_th = "เรียนเทรนเนอร์: \n ผลงานของคุณในการจัดอันดับพลังการต่อสู้นั้นยอดเยี่ยมมาก! เมื่อเวลา 21:30 น. ของรางวัลได้ถูกส่งไปยังอีเมลของคุณแล้ว โปรดตรวจสอบและรับมัน \n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers: \n    Your performance in the combat power ranking was amazing! As of 21:30, rewards have been sent to your mail, please check and claim it. \n    Happy gaming!",
		content_en = "Dear trainers: \n    Your performance in the combat power ranking was amazing! As of 21:30, rewards have been sent to your mail, please check and claim it. \n    Happy gaming!",
		subject_en = "Combat power reward mail",
		sender_en = "Secretary"
	},
	{
		subject = "Welcome to the Digital World",
		subject_th = "ยินดีต้อนรับสู่  Dig ital World",
		id = 32,
		content_th = "เรียนเทรนเนอร์: \n ยินดีต้อนรับสู่โลกดิจิทัลที่ลึกลับและน่าสนใจ นี่คือของขวัญสำหรับคุณ เราหวังว่ามันจะช่วยคุณในการผจญภัยของคุณ \n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "อากูมอน",
		sender = "Agumon",
		content = "Dear trainer: \n Welcome to the mysterious and interesting digital world. This is a gift for you, we hope it can help you in youre adventure. \n Happy gaming!",
		content_en = "Dear trainer: \n Welcome to the mysterious and interesting digital world. This is a gift for you, we hope it can help you in youre adventure. \n Happy gaming!",
		subject_en = "Welcome to the Digital World",
		sender_en = "Agumon",
		attachs = {
			gold = 10000,
			rmb = 188,
			__size = 3,
			[11.0] = 50
		}
	},
	{
		subject = "Time-limited Legendary Pokémon Rewards",
		subject_th = "รางวัลโปเกมอนในตำนานแบบจำกัดเวลา",
		id = 33,
		content_th = "เรียนเทรนเนอร์:\n ขอแสดงความยินดีกับอันดับที่ %d ในกิจกรรมโปเกมอนในตำนานที่จำกัดเวลา โปรดตรวจสอบอีเมลของคุณเพื่อรับรางวัล\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainer:\n    Congratulations for ranking No. %d in the time-limited Legendary Pokémon Event. Please check your mail to claim the rewards.\n    Happy gaming!",
		content_en = "Dear trainer:\n    Congratulations for ranking No. %d in the time-limited Legendary Pokémon Event. Please check your mail to claim the rewards.\n    Happy gaming!",
		subject_en = "Time-limited Legendary Pokémon Rewards",
		special = true,
		sender_en = "Secretary"
	},
	{
		subject = "Time-limited Legendary Pokémon Rewards",
		subject_th = "รางวัลโปเกมอนในตำนานแบบจำกัดเวลา",
		id = 34,
		content_th = "เรียนเทรนเนอร์:\n ขอแสดงความยินดีกับอันดับที่ %d ในกิจกรรมโปเกมอนในตำนานที่จำกัดเวลา เนื่องจากจำนวนคะแนนที่คุณได้รับไม่ตรงตามข้อกำหนด นี่คือรางวัลที่คุณได้รับ โปรดตรวจสอบอีเมลของคุณเพื่อขอรับสิทธิ์\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainer:\n    Congratulations for ranking No. %d in the time-limited Legendary Pokémon Event, as the No. of points you earned have not met the requirements, here are the rewards you've received. Please check your mail to claim them.\n    Happy gaming!",
		content_en = "Dear trainer:\n    Congratulations for ranking No. %d in the time-limited Legendary Pokémon Event, as the No. of points you earned have not met the requirements, here are the rewards you've received. Please check your mail to claim them.\n    Happy gaming!",
		subject_en = "Time-limited Legendary Pokémon Rewards",
		special = true,
		sender_en = "Secretary"
	},
	{
		subject = "Elemental Challenge Completion Rewards",
		subject_th = "รางวัลสำเร็จภารกิจท้าทายธาตุ",
		id = 35,
		content_th = "เทรนเนอร์ที่รัก:\n ยินดีด้วย! มีสมาชิก %d คนในทีมของคุณที่เคลียร์ Element Challenge สำเร็จ! นี่คือรางวัลสำหรับคุณ!\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers:\n    Congratulations! There are %d members in your team who have successfully clear the Element Challenge! This are the rewards for you!\n    Happy gaming!",
		content_en = "Dear trainers:\n    Congratulations! There are %d members in your team who have successfully clear the Element Challenge! This are the rewards for you!\n    Happy gaming!",
		subject_en = "Elemental Challenge Completion Rewards",
		sender_en = "Secretary"
	},
	{
		subject = "union Dungeon Damage Ranking Reward",
		subject_th = "รางวัลอันดับความเสียหายของดันเจี้ยนสหภาพ",
		id = 36,
		content_th = "เรียนเทรนเนอร์: \n ยินดีด้วย! คุณอยู่ในอันดับที่ %d ในความเสียหายที่ทำในดันเจี้ยน %s ของสหภาพ และมีส่วนสร้างความเสียหาย %d กรุณารับรางวัลของคุณทางไปรษณีย์ สมาชิกคนอื่นๆ ติดตามผลงานดีๆ แล้วพบกันใหม่เร็วๆ นี้\n ขอให้โชคดี!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers: \n    Congratulations! You rank number %d in damage dealt at the union's %s dungeon and contributed %d damage. Please claim your rewards in the mail. Other members, keep up the good work and see you soon at the top.\n    Good luck!",
		content_en = "Dear trainers: \n    Congratulations! You rank number %d in damage dealt at the union's %s dungeon and contributed %d damage. Please claim your rewards in the mail. Other members, keep up the good work and see you soon at the top.\n    Good luck!",
		subject_en = "union Dungeon Damage Ranking Reward",
		sender_en = "Secretary"
	},
	{
		subject = "union Dungeon additional rewards",
		subject_th = "ยูเนี่ยนดันเจี้ยนรางวัลเพิ่มเติม",
		id = 37,
		content_th = [[
เรียนเทรนเนอร์:
 การแสดงของคุณในกิจกรรม union Dungeon ของ %s นั้นยอดเยี่ยมมาก! รางวัลความเสียหาย SP.ATK ของ Boss แบบสุ่มถูกส่งไปยังอีเมลของคุณแล้ว โปรดตรวจสอบและรับมัน 
 สมาชิกคนอื่นๆ ติดตามผลงานดีๆ แล้วพบกันใหม่เร็วๆ นี้
 ขอให้สนุกกับการเล่นเกม!]],
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = [[
Dear trainers:
    Your performance in %s's union Dungeon event was amazing! The random Boss SP.ATK damage rewards have been sent to your mail, please check and claim it. 
 Other members, keep up the good work and see you soon at the top.
    Happy gaming!]],
		content_en = [[
Dear trainers:
    Your performance in %s's union Dungeon event was amazing! The random Boss SP.ATK damage rewards have been sent to your mail, please check and claim it. 
 Other members, keep up the good work and see you soon at the top.
    Happy gaming!]],
		subject_en = "union Dungeon additional rewards",
		sender_en = "Secretary"
	},
	{
		subject = "Indigo Plateau Conference Victory Rewards",
		subject_th = "รางวัลชัยชนะการประชุม Indigo Plateau Conference",
		id = 38,
		content_th = "เรียนเทรนเนอร์:\n คุณประสบความสำเร็จ %d ชัยชนะและ %d การพ่ายแพ้ และได้รับ %d คะแนนในการประชุมที่ราบสูงอินดิโก โปรดตรวจสอบอีเมลของคุณเพื่อรับรางวัล\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainer:\n You've achieved %d victories and %d defeats and earned %d points in the Indigo Plateau Conference. Please check your mail to claim the rewards.\n    Happy gaming!",
		content_en = "Dear trainer:\n You've achieved %d victories and %d defeats and earned %d points in the Indigo Plateau Conference. Please check your mail to claim the rewards.\n    Happy gaming!",
		subject_en = "Indigo Plateau Conference Victory Rewards",
		sender_en = "Secretary"
	},
	{
		subject = "Indigo Plateau Conference Ranking Rewards",
		subject_th = "รางวัลการจัดอันดับการประชุมที่ราบสูงคราม",
		id = 39,
		content_th = "เรียนเทรนเนอร์: \n ขอแสดงความยินดีสำหรับการบรรลุอันดับที่ %d ในการประชุมที่ราบสูงคราม! โปรดตรวจสอบอีเมลของคุณเพื่อรับรางวัลการจัดอันดับของคุณ ติดตามผลงานดีๆ แล้วพบกันใหม่เร็วๆ นี้\n ขอให้มีความสุขกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainer: \n    Congratulations for achieving rank No. %d in the Indigo Plateau Conference! Please check your mail to receive your ranking rewards. Do keep up the good work and see you soon at the top.\n    Happy gaming!",
		content_en = "Dear trainer: \n    Congratulations for achieving rank No. %d in the Indigo Plateau Conference! Please check your mail to receive your ranking rewards. Do keep up the good work and see you soon at the top.\n    Happy gaming!",
		subject_en = "Indigo Plateau Conference Ranking Rewards",
		sender_en = "Secretary"
	},
	{
		subject = "Indigo Plateau Conference Betting Rewards",
		subject_th = "รางวัลการเดิมพันการประชุมที่ราบสูงคราม",
		id = 40,
		content_th = "เรียนเทรนเนอร์:\n ขอแสดงความยินดีสำหรับการเดาที่ถูกต้อง %s เป็นผู้ชนะการประชุมที่ราบสูงอินดิโก! โปรดตรวจสอบอีเมลของคุณเพื่อรับรางวัลการเดิมพัน\n ขอให้มีความสุขกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers:\n    Congratulations for making the right guess, %s is the winner of the Indigo Plateau Conference! Please check your mail to receive your betting rewards.\n    Happy gaming!",
		content_en = "Dear trainers:\n    Congratulations for making the right guess, %s is the winner of the Indigo Plateau Conference! Please check your mail to receive your betting rewards.\n    Happy gaming!",
		subject_en = "Indigo Plateau Conference Betting Rewards",
		sender_en = "Secretary"
	},
	{
		subject = "Indigo Plateau Conference Betting Returns",
		subject_th = "ผลตอบแทนการเดิมพันการประชุมที่ราบสูงคราม",
		id = 41,
		content_th = "เรียนเทรนเนอร์: \n %s ที่คุณเดิมพันได้เข้าสู่รอบรองชนะเลิศในการประชุม Indigo Plateau Conference แล้ว คุณได้รับเงินคืนครึ่งหนึ่ง โปรดตรวจสอบ\n ขอให้สนุกกับเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers: \n    %s you bet on has entered the quarterfinals in the Indigo Plateau Conference. You get half of your bet back, please check.\n    Happy gaming!",
		content_en = "Dear trainers: \n    %s you bet on has entered the quarterfinals in the Indigo Plateau Conference. You get half of your bet back, please check.\n    Happy gaming!",
		subject_en = "Indigo Plateau Conference Betting Returns",
		sender_en = "Secretary"
	},
	{
		subject = "Indigo Plateau Conference Winner Betting Results",
		subject_th = "ผลการเดิมพันผู้ชนะการประชุม Indigo Plateau Conference",
		id = 42,
		content_th = "เรียนเทรนเนอร์: \n คุณเดิมพัน %s แต่น่าเสียดายที่พวกเขาไม่ได้เข้าสู่ 8 อันดับแรก น่าเสียดาย!\n ขอให้โชคดีในครั้งต่อไป!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers: \n    You bet on %s but unfortunately they did not enter the Top 8. What a pity!\n    Better luck next time!",
		content_en = "Dear trainers: \n    You bet on %s but unfortunately they did not enter the Top 8. What a pity!\n    Better luck next time!",
		subject_en = "Indigo Plateau Conference Winner Betting Results",
		sender_en = "Secretary"
	},
	{
		subject = "You obtain the title",
		subject_th = "คุณได้รับชื่อเรื่อง",
		id = 43,
		content_th = "เรียนเทรนเนอร์:\n ขอแสดงความยินดีที่ได้รับ %s ใช้ชื่อของคุณในหนังสือชื่อ!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainer:\n    Congratulation for getting %s, use your title in the title book!",
		content_en = "Dear trainer:\n    Congratulation for getting %s, use your title in the title book!",
		subject_en = "You obtain the title",
		sender_en = "Secretary"
	},
	{
		subject = "Title Consecutive Battle",
		subject_th = "ชื่อเรื่อง การต่อสู้ต่อเนื่อง",
		id = 44,
		content_th = "เรียนเทรนเนอร์:\n ขอแสดงความยินดีสำหรับการบรรลุสตรีคที่ชนะ %s\n ขอให้มีความสุขกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainer:\n    Congratulations for achieving a winning streak against %s\n    Happy gaming!",
		content_en = "Dear trainer:\n    Congratulations for achieving a winning streak against %s\n    Happy gaming!",
		subject_en = "Title Consecutive Battle",
		sender_en = "Secretary"
	},
	{
		subject = "union War Qualifiers Registration",
		subject_th = "การลงทะเบียนรอบคัดเลือก union War",
		id = 45,
		content_th = "เรียนเทรนเนอร์: \n นี่คือรางวัลสำหรับการลงทะเบียนเข้าร่วมการแข่งขันรอบคัดเลือกของ Union War!\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainer: \n    This is the reward for registering for the union War qualifiers!\n    Happy gaming!",
		content_en = "Dear trainer: \n    This is the reward for registering for the union War qualifiers!\n    Happy gaming!",
		subject_en = "union War Qualifiers Registration",
		sender_en = "Secretary"
	},
	{
		subject = "union War Finals Registration",
		subject_th = "การลงทะเบียน union War Finals",
		id = 46,
		content_th = "เรียนเทรนเนอร์: \n นี่คือรางวัลสำหรับการลงทะเบียนเข้าร่วม union War Finals!\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainer: \n    This is the reward for registering for the union War finals!\n    Happy gaming!",
		content_en = "Dear trainer: \n    This is the reward for registering for the union War finals!\n    Happy gaming!",
		subject_en = "union War Finals Registration",
		sender_en = "Secretary"
	},
	{
		subject = "union War Victory",
		subject_th = "ชัยชนะสงครามสหภาพ",
		id = 47,
		content_th = "เรียนเทรนเนอร์: \n คุณได้รับชัยชนะ %d ครั้งในสงครามการรวมกลุ่มครั้งนี้ นี่คือรางวัลของคุณ (สูงสุด 6 รางวัลต่อวัน)!\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainer: \n You achieved %d victories in this round of union War. This is your reward (up to 6 rewards per day)!\n Happy gaming!",
		content_en = "Dear trainer: \n You achieved %d victories in this round of union War. This is your reward (up to 6 rewards per day)!\n Happy gaming!",
		subject_en = "union War Victory",
		sender_en = "Secretary"
	},
	{
		subject = "union War Ranking",
		subject_th = "การจัดอันดับสงครามสหภาพ",
		id = 48,
		content_th = "เรียนเทรนเนอร์:\n คุณได้รับอันดับ %d ในสงครามสหภาพในรอบนี้ นี่คือรางวัลของคุณ! \n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainer:\n    You've achieved rank %d in this round of union War. This are your rewards! \n Happy gaming!",
		content_en = "Dear trainer:\n    You've achieved rank %d in this round of union War. This are your rewards! \n Happy gaming!",
		subject_en = "union War Ranking",
		sender_en = "Secretary"
	},
	{
		subject = "union War betting rewards",
		subject_th = "รางวัลการเดิมพันยูเนี่ยนวอร์",
		id = 49,
		content_th = "เรียนเทรนเนอร์:\n ขอแสดงความยินดีสำหรับการเดาที่ถูกต้อง %s เป็นผู้ชนะในสงครามสหภาพแรงงาน! โปรดตรวจสอบอีเมลของคุณเพื่อรับรางวัลการเดิมพัน\n ขอให้มีความสุขกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers:\n    Congratulations for making the right guess, %s is the winner of the union War! Please check your mail to receive your betting rewards.\n    Happy gaming!",
		content_en = "Dear trainers:\n    Congratulations for making the right guess, %s is the winner of the union War! Please check your mail to receive your betting rewards.\n    Happy gaming!",
		subject_en = "union War betting rewards",
		sender_en = "Secretary"
	},
	{
		subject = "union War bet returns",
		subject_th = "ผลตอบแทนการเดิมพันยูเนี่ยนสงคราม",
		id = 50,
		content_th = "เรียนเทรนเนอร์: \n %s ที่คุณเดิมพันได้เข้าสู่รอบชิงชนะเลิศในสงครามสหภาพ คุณได้รับเงินคืนครึ่งหนึ่ง โปรดตรวจสอบ\n ขอให้สนุกกับเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers: \n    %s you bet on has entered the finals in the union War. You get half of your bet back, please check.\n    Happy gaming!",
		content_en = "Dear trainers: \n    %s you bet on has entered the finals in the union War. You get half of your bet back, please check.\n    Happy gaming!",
		subject_en = "union War bet returns",
		sender_en = "Secretary"
	},
	{
		subject = "union War betting results",
		subject_th = "ผลการเดิมพันยูเนี่ยนวอร์",
		id = 51,
		content_th = "เรียนเทรนเนอร์: \n คุณเดิมพัน %s แต่น่าเสียดายที่พวกเขาไม่ได้เข้าสู่รอบชิงชนะเลิศ น่าเสียดาย!\n ครั้งหน้าขอให้โชคดีกว่านี้!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers: \n    You bet on %s but unfortunately they did not enter the finals. What a pity!\n    Better luck next time!",
		content_en = "Dear trainers: \n    You bet on %s but unfortunately they did not enter the finals. What a pity!\n    Better luck next time!",
		subject_en = "union War betting results",
		sender_en = "Secretary"
	},
	{
		subject_en = "Spring Festival Wishes Mail",
		id = 52,
		sender_en = "Secretary",
		subject_th = "จดหมายอวยพรเทศกาลฤดูใบไม้ผลิ",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		subject = "Spring Festival Wishes Mail",
		attachs = {
			__size = 1,
			[634.0] = 1
		}
	},
	{
		subject = "2048 Coins are given out yesterday",
		subject_th = "2048  Coins แจกเมื่อวาน",
		id = 53,
		content_th = "เรียนเทรนเนอร์: \n เกม 2048 ที่คุณเล่นเมื่อวานนี้ยังไม่ได้รับการอ้างสิทธิ์ โปรดตรวจสอบ. \n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainer: \n    The 2048 game you played yesterday has not been claimed. Please check. \n    Happy gaming!",
		content_en = "Dear trainer: \n    The 2048 game you played yesterday has not been claimed. Please check. \n    Happy gaming!",
		subject_en = "2048 Coins are given out yesterday",
		sender_en = "Secretary"
	},
	{
		subject = "Global Indigo Conference Battle Rewards",
		subject_th = "รางวัลการต่อสู้การประชุม Indigo ระดับโลก",
		id = 54,
		content_th = "เรียนเทรนเนอร์:\n คุณประสบความสำเร็จ %d ชัยชนะและ %d การพ่ายแพ้ และได้รับ %d คะแนนในการประชุม Global Indigo Plateau Conference โปรดตรวจสอบอีเมลของคุณเพื่อรับรางวัล\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainer:\n You've achieved %d victories and %d defeats and earned %d points in the Global Indigo Plateau Conference. Please check your mail to claim the rewards.\n    Happy gaming!",
		content_en = "Dear trainer:\n You've achieved %d victories and %d defeats and earned %d points in the Global Indigo Plateau Conference. Please check your mail to claim the rewards.\n    Happy gaming!",
		subject_en = "Global Indigo Conference Battle Rewards",
		sender_en = "Secretary"
	},
	{
		subject = "Global Indigo Conference Ranking Rewards",
		subject_th = "รางวัลการจัดอันดับการประชุม Global Indigo",
		id = 55,
		content_th = [[
เรียนเทรนเนอร์:
 ขอแสดงความยินดีสำหรับการบรรลุอันดับที่ %s ในการประชุม Global Indigo Plateau Conference! โปรดตรวจสอบอีเมลของคุณเพื่อรับรางวัลอันดับของคุณ
โปรดทำผลงานให้ดี แล้วพบกันใหม่เร็วๆ นี้ที่อันดับสูงสุด
 ขอให้สนุกกับการเล่นเกม!]],
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = [[
Dear trainers:
    Congratulations for achieving rank No. %s in the Global Indigo Plateau Conference! Please check your mail to receive your ranking rewards.
Do keep up the good work and see you soon at the top.
    Happy gaming!]],
		content_en = [[
Dear trainers:
    Congratulations for achieving rank No. %s in the Global Indigo Plateau Conference! Please check your mail to receive your ranking rewards.
Do keep up the good work and see you soon at the top.
    Happy gaming!]],
		subject_en = "Global Indigo Conference Ranking Rewards",
		sender_en = "Secretary"
	},
	{
		subject = "Global Indigo Conference Betting Reward",
		subject_th = "รางวัลการเดิมพัน Global Indigo Conference",
		id = 56,
		content_th = "เพื่อนที่รัก:\n ขอแสดงความยินดี คุณเดาผู้เล่นตั้งต้นทั้งหมดในรอบคัดเลือกของ Global Indigo Plateau Conference ได้ถูกต้องแล้ว! รางวัลการเดิมพันถูกส่งทางไปรษณีย์แล้ว โปรดรับสิทธิ์\n ขอให้มีความสุขกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear friends:\n Congratulations, you correctly guessed all the seed players in Global Indigo Plateau Conference qualifiers! Betting rewards have been sent via mail, please claim it.\n Happy Gaming!",
		content_en = "Dear friends:\n Congratulations, you correctly guessed all the seed players in Global Indigo Plateau Conference qualifiers! Betting rewards have been sent via mail, please claim it.\n Happy Gaming!",
		subject_en = "Global Indigo Conference Betting Reward",
		sender_en = "Secretary"
	},
	{
		subject = "Global Indigo Conference Betting Reward",
		subject_th = "รางวัลการเดิมพัน Global Indigo Conference",
		id = 57,
		content_th = "เพื่อนที่รัก:\n ยินดีด้วย คุณเดาผู้เล่นตั้ง %d ผู้เล่นได้ถูกต้องในรอบคัดเลือกของการประชุม Global Indigo Plateau Conference รางวัลการเดิมพันถูกส่งทางไปรษณีย์แล้ว โปรดรับสิทธิ์\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear friends:\n Congratulations, you successfully guessed %d seed players correctly in Global Indigo Plateau Conference qualifiers. Betting rewards have been sent via mail, please claim it.\n Happy gaming!",
		content_en = "Dear friends:\n Congratulations, you successfully guessed %d seed players correctly in Global Indigo Plateau Conference qualifiers. Betting rewards have been sent via mail, please claim it.\n Happy gaming!",
		subject_en = "Global Indigo Conference Betting Reward",
		sender_en = "Secretary"
	},
	{
		subject = "Global Indigo Conference Betting Reward",
		subject_th = "รางวัลการเดิมพัน Global Indigo Conference",
		id = 58,
		content_th = "เพื่อนที่รัก:\nคุณเดาผู้เล่น %d คนผิดสำหรับรอบคัดเลือก นี่คือรางวัลปลอบใจสำหรับการเดาที่ไม่สำเร็จ ส่งทางไปรษณีย์แล้ว โปรดรับสิทธิ์\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear friends:\nYou have guessed %d players wrongly for the qualifiers. This is the consolation reward for the unsuccessful guess. It has been sent via mail, please claim it.\n Happy gaming!",
		content_en = "Dear friends:\nYou have guessed %d players wrongly for the qualifiers. This is the consolation reward for the unsuccessful guess. It has been sent via mail, please claim it.\n Happy gaming!",
		subject_en = "Global Indigo Conference Betting Reward",
		sender_en = "Secretary"
	},
	{
		subject = "Global Indigo Conference Betting Reward",
		subject_th = "รางวัลการเดิมพัน Global Indigo Conference",
		id = 59,
		content_th = "เพื่อนที่รัก:\n ขอแสดงความยินดี คุณเดาผู้เล่นสี่อันดับแรกของการประชุม Global Indigo Plateau ได้ถูกต้องแล้ว รางวัลการเดิมพันถูกส่งทางไปรษณีย์แล้ว โปรดรับสิทธิ์\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear friends:\n Congratulations, you correctly guessed all the top four players of the Global Indigo Plateau Conference. Betting rewards have been sent via mail, please claim it.\n Happy gaming!",
		content_en = "Dear friends:\n Congratulations, you correctly guessed all the top four players of the Global Indigo Plateau Conference. Betting rewards have been sent via mail, please claim it.\n Happy gaming!",
		subject_en = "Global Indigo Conference Betting Reward",
		sender_en = "Secretary"
	},
	{
		subject = "Global Indigo Conference Betting Reward",
		subject_th = "รางวัลการเดิมพัน Global Indigo Conference",
		id = 60,
		content_th = "เพื่อนๆที่รัก:\n ยินดีด้วย! คุณเดาได้อย่างถูกต้อง %d ผู้เล่นสี่อันดับแรกในการประชุม Global Indigo Plateau Conference รางวัลการเดิมพันถูกส่งทางไปรษณีย์แล้ว โปรดรับสิทธิ์\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear friends:\n Congratulations! You correctly guessed %d top four players in Global Indigo Plateau Conference. Betting rewards have been sent via mail, please claim it.\n Happy gaming!",
		content_en = "Dear friends:\n Congratulations! You correctly guessed %d top four players in Global Indigo Plateau Conference. Betting rewards have been sent via mail, please claim it.\n Happy gaming!",
		subject_en = "Global Indigo Conference Betting Reward",
		sender_en = "Secretary"
	},
	{
		subject = "Global Indigo Conference Betting Reward",
		subject_th = "รางวัลการเดิมพัน Global Indigo Conference",
		id = 61,
		content_th = "เรียนผู้เล่นทุกท่าน:\n คุณคาดการณ์ผู้เล่น %d คนผิดสำหรับรอบรองชนะเลิศ ได้ส่งรางวัลปลอบใจของคุณทางไปรษณีย์แล้ว โปรดอ้างสิทธิ์ \n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear players:\n    You've predicted %d players wrongly for the semifinals. Your consolation rewards have been sent via mail, please claim it. \n   Happy gaming!",
		content_en = "Dear players:\n    You've predicted %d players wrongly for the semifinals. Your consolation rewards have been sent via mail, please claim it. \n   Happy gaming!",
		subject_en = "Global Indigo Conference Betting Reward",
		sender_en = "Secretary"
	},
	{
		subject = "Global Indigo Conference Betting Reward",
		subject_th = "รางวัลการเดิมพัน Global Indigo Conference",
		id = 62,
		content_th = "เรียนเทรนเนอร์:\n ขอแสดงความยินดี คุณทำนายแชมป์ของ Global Indigo Plateau Conference ถูกต้องแล้ว! รางวัลการเดิมพันของคุณถูกส่งทางไปรษณีย์ โปรดตรวจสอบ \n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainers:\n    Congratulations, you have predicted the champion of the Global Indigo Plateau Conference correctly! Your betting rewards have been sent via mail please, check. \n   Happy gaming!",
		content_en = "Dear trainers:\n    Congratulations, you have predicted the champion of the Global Indigo Plateau Conference correctly! Your betting rewards have been sent via mail please, check. \n   Happy gaming!",
		subject_en = "Global Indigo Conference Betting Reward",
		sender_en = "Secretary"
	},
	{
		subject = "Global Indigo Conference Betting Reward",
		subject_th = "รางวัลการเดิมพัน Global Indigo Conference",
		id = 63,
		content_th = "เพื่อนๆ ที่รัก:\n น่าเสียดายที่คุณไม่ได้เดา Global Indigo Plateau Conference Champion อย่างถูกต้อง ของรางวัลปลอบใจได้ถูกส่งไปทางไปรษณีย์แล้ว โปรดรับมันไว้\n ครั้งหน้าขอให้โชคดีกว่านี้!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear friends:\n You unfortunately did not guess the Global Indigo Plateau Conference Champion correctly. Consolation rewards have been sent via mail, please claim it.\n Better luck next time!",
		content_en = "Dear friends:\n You unfortunately did not guess the Global Indigo Plateau Conference Champion correctly. Consolation rewards have been sent via mail, please claim it.\n Better luck next time!",
		subject_en = "Global Indigo Conference Betting Reward",
		sender_en = "Secretary"
	},
	{
		subject = "Global Arena 7-day Rewards",
		subject_th = "รางวัล Global Arena 7 วัน",
		id = 64,
		content_th = "ผู้เล่นที่รัก: \n ยินดีด้วย! คุณชนะอันดับ %s อันดับ %d ในอารีน่าข้ามเซิร์ฟเวอร์ (การตั้งถิ่นฐานรายสัปดาห์) รางวัลของคุณถูกส่งทางไปรษณีย์ กรุณาเช็คอินเวลา พยายามต่อไปให้ดีที่สุด \n สนุกกับเกมของคุณ!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear Player: \n    Congrats! You won in Rank %s No. %d in Cross-server Arena (Weekly Settlement). Your reward has been sent by mail. Please check in time. Keep on trying your best. \n    Enjoy your game!",
		content_en = "Dear Player: \n    Congrats! You won in Rank %s No. %d in Cross-server Arena (Weekly Settlement). Your reward has been sent by mail. Please check in time. Keep on trying your best. \n    Enjoy your game!",
		subject_en = "Global Arena 7-day Rewards",
		sender_en = "Secretary"
	},
	{
		subject = "End of Global Arena Rewards",
		subject_th = "สิ้นสุดรางวัล Global Arena",
		id = 65,
		content_th = "ผู้เล่นที่รัก: \n ยินดีด้วย! คุณชนะอันดับ %s อันดับ %d ในอารีน่าข้ามเซิร์ฟเวอร์ (การตั้งถิ่นฐานตามฤดูกาล) รางวัลของคุณถูกส่งทางไปรษณีย์ กรุณาเช็คอินเวลา พยายามต่อไปให้ดีที่สุด \n สนุกกับเกมของคุณ!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear Player: \n    Congrats! You won in Rank %s No. %d in Cross-server Arena (Seasonal Settlement). Your reward has been sent by mail. Please check in time. Keep on trying your best. \n    Enjoy your game!",
		content_en = "Dear Player: \n    Congrats! You won in Rank %s No. %d in Cross-server Arena (Seasonal Settlement). Your reward has been sent by mail. Please check in time. Keep on trying your best. \n    Enjoy your game!",
		subject_en = "End of Global Arena Rewards",
		sender_en = "Secretary"
	},
	{
		subject = "Fishing Tournament Ranking Reward",
		subject_th = "รางวัลอันดับการแข่งขันตกปลา",
		id = 66,
		content_th = "ผู้เล่นที่รัก: \n ยินดีด้วย! คุณได้รับรางวัล No.%d ในการแข่งขันตกปลา รางวัลของคุณถูกส่งทางไปรษณีย์ กรุณาเช็คอินเวลา \n สนุกกับเกมของคุณ!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear Player: \n    Congrats! You won No.%d in the Fishing Tournament. Your reward has been sent by mail. Please check in time. \n    Enjoy your game!",
		content_en = "Dear Player: \n    Congrats! You won No.%d in the Fishing Tournament. Your reward has been sent by mail. Please check in time. \n    Enjoy your game!",
		subject_en = "Fishing Tournament Ranking Reward",
		sender_en = "Secretary"
	},
	{
		subject = "Fishing Tournament Auto-fishing Reward",
		subject_th = "รางวัลการแข่งขันตกปลาอัตโนมัติ",
		id = 67,
		content_th = "ผู้เล่นที่รัก: \n ในการแข่งขันตกปลานี้ คุณทำสำเร็จ %d ครั้งและล้มเหลว %d ครั้งด้วยการตกปลาอัตโนมัติ รางวัลของคุณถูกส่งทางไปรษณีย์ กรุณาเช็คอินเวลา \n สนุกกับเกมของคุณ!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear Player: \n    In this Fishing Tournament, you succeeded %d times and failed %d times with auto-fishing. Your reward has been sent by mail. Please check in time. \n    Enjoy your game!",
		content_en = "Dear Player: \n    In this Fishing Tournament, you succeeded %d times and failed %d times with auto-fishing. Your reward has been sent by mail. Please check in time. \n    Enjoy your game!",
		subject_en = "Fishing Tournament Auto-fishing Reward",
		sender_en = "Secretary"
	},
	{
		subject = "Honorary Gym Leader Reward (Your Server)",
		subject_th = "รางวัลผู้นำยิมกิตติมศักดิ์ (เซิร์ฟเวอร์ของคุณ)",
		id = 68,
		content_th = "ผู้เล่นที่รัก: \n ยินดีด้วย! คุณกลายเป็น %s ผู้นำยิมกิตติมศักดิ์ของเซิร์ฟเวอร์ของคุณ รางวัลของคุณถูกส่งทางไปรษณีย์ กรุณาเช็คอินเวลา พยายามต่อไปให้ดีที่สุด \n สนุกกับเกมของคุณ!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear Player: \n    Congrats! You became %s Honorary Gym Leader of your server. Your reward has been sent by mail. Please check in time. Keep on trying your best. \n    Enjoy your game!",
		content_en = "Dear Player: \n    Congrats! You became %s Honorary Gym Leader of your server. Your reward has been sent by mail. Please check in time. Keep on trying your best. \n    Enjoy your game!",
		subject_en = "Honorary Gym Leader Reward (Your Server)",
		sender_en = "Secretary"
	},
	{
		subject = "Honorary Gym Leader Reward (Cross-server)",
		subject_th = "รางวัลผู้นำยิมกิตติมศักดิ์ (ข้ามเซิร์ฟเวอร์)",
		id = 69,
		content_th = "ผู้เล่นที่รัก: \n ยินดีด้วย! คุณกลายเป็น %s ผู้นำยิมกิตติมศักดิ์ของ Cross-server รางวัลของคุณถูกส่งทางไปรษณีย์ กรุณาเช็คอินเวลา พยายามต่อไปให้ดีที่สุด \n สนุกกับเกมของคุณ!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear Player: \n    Congrats! You became %s Honorary Gym Leader of Cross-server. Your reward has been sent by mail. Please check in time. Keep on trying your best. \n    Enjoy your game!",
		content_en = "Dear Player: \n    Congrats! You became %s Honorary Gym Leader of Cross-server. Your reward has been sent by mail. Please check in time. Keep on trying your best. \n    Enjoy your game!",
		subject_en = "Honorary Gym Leader Reward (Cross-server)",
		sender_en = "Secretary"
	},
	{
		subject = "Honorary Gym Member Reward (Cross-server)",
		subject_th = "รางวัลสมาชิกยิมกิตติมศักดิ์ (ข้ามเซิร์ฟเวอร์)",
		id = 70,
		content_th = "ผู้เล่นที่รัก: \n ยินดีด้วย! คุณกลายเป็น %s สมาชิกยิมกิตติมศักดิ์ของข้ามเซิร์ฟเวอร์ รางวัลของคุณถูกส่งทางไปรษณีย์ กรุณาเช็คอินเวลา พยายามต่อไปให้ดีที่สุด \n สนุกกับเกมของคุณ!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear Player: \n    Congrats! You became %s Honorary Gym Member of Cross-server. Your reward has been sent by mail. Please check in time. Keep on trying your best. \n    Enjoy your game!",
		content_en = "Dear Player: \n    Congrats! You became %s Honorary Gym Member of Cross-server. Your reward has been sent by mail. Please check in time. Keep on trying your best. \n    Enjoy your game!",
		subject_en = "Honorary Gym Member Reward (Cross-server)",
		sender_en = "Secretary"
	},
	{
		subject = "Gym Dungeon Reward Makeup",
		subject_th = "แต่งหน้ารางวัลยิมดันเจี้ยน",
		id = 71,
		content_th = "เรียนผู้เล่น: \n คุณยังไม่ได้รับรางวัล Gym Dungeon ของคุณ ของรางวัลถูกส่งไปทางไปรษณีย์ กรุณาเช็คอินเวลา พยายามต่อไปให้ดีที่สุด \n สนุกกับเกมของคุณ!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear Player: \n    You haven't claim your Gym Dungeon Reward. Reward has been sent by mail. Please check in time. Keep on trying your best. \n    Enjoy your game!",
		content_en = "Dear Player: \n    You haven't claim your Gym Dungeon Reward. Reward has been sent by mail. Please check in time. Keep on trying your best. \n    Enjoy your game!",
		subject_en = "Gym Dungeon Reward Makeup",
		sender_en = "Secretary"
	},
	{
		subject = "Elemental Challenge - Kickout Notice",
		subject_th = "Elemental Challenge - ประกาศ Kickout",
		id = 72,
		content_th = "เรียนผู้เล่น: \n น่าเสียดาย คุณถูกไล่ออกจากห้อง Elemental Challenge เนื่องจากคุณไม่ได้ทำภารกิจท้าทายมาเป็นเวลานาน",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear Player: \n    Unfortunately, you have been kicked out the Elemental Challenge room as you didn't complete any challenge for a long time.",
		content_en = "Dear Player: \n    Unfortunately, you have been kicked out the Elemental Challenge room as you didn't complete any challenge for a long time.",
		subject_en = "Elemental Challenge - Kickout Notice",
		sender_en = "Secretary"
	},
	{
		subject = "Elemental Challenge - Vote Invitation",
		subject_th = "Elemental Challenge - โหวตคำเชิญ",
		id = 73,
		content_th = "เรียนผู้เล่น: \n ผู้เล่นในห้องของคุณเริ่มโหวตการลบโฮสต์ เป็นสิ่งสำคัญสำหรับคุณที่จะได้รับรางวัลผู้เข้าร่วม เข้าร่วมเลย!\n สนุกกับเกมของคุณ!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear Player: \n    Players in your room initiated the Host Removal Vote. It is important for you to get the Participants Reward. Join it now!\n    Enjoy your game!",
		content_en = "Dear Player: \n    Players in your room initiated the Host Removal Vote. It is important for you to get the Participants Reward. Join it now!\n    Enjoy your game!",
		subject_en = "Elemental Challenge - Vote Invitation",
		sender_en = "Secretary"
	},
	{
		subject = "Elemental Challenge - Kickout Warning",
		subject_th = "Elemental Challenge - คำเตือนการเตะออก",
		id = 74,
		content_th = "เรียนผู้เล่น: \n ในฐานะเจ้าบ้าน คุณยังไม่ได้ทำภารกิจท้าทายใดๆ เลย ดังนั้นผู้เล่นคนอื่น ๆ โหวตให้เตะคุณออก ไปที่ห้องและทำภารกิจให้เสร็จก่อนที่จะสายเกินไป!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear Player: \n    As a Host of the room, you haven't completed any challenge so far. Thus other players are voting to kick you out. Go to the room and complete the challenge before it's too late!",
		content_en = "Dear Player: \n    As a Host of the room, you haven't completed any challenge so far. Thus other players are voting to kick you out. Go to the room and complete the challenge before it's too late!",
		subject_en = "Elemental Challenge - Kickout Warning",
		sender_en = "Secretary"
	},
	{
		subject = "Elemental Challenge - New Host Notice",
		subject_th = "Elemental Challenge - ประกาศโฮสต์ใหม่",
		id = 75,
		content_th = "เรียนผู้เล่น: \n อดีตเจ้าบ้านถูกไล่ออกเนื่องจากไม่มีการใช้งาน ตอนนี้คุณเป็นโฮสต์ใหม่แล้ว เชิญผู้เล่นมาท้าทายตอนนี้ การได้รับรางวัลผู้เข้าร่วมเป็นสิ่งสำคัญ!\n สนุกกับเกมของคุณ!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear Player: \n    The former Host has been kicked out for inactivity. Now you are the new Host. Invite players to challenge now. It is important for you to get the Participants Reward!\n    Enjoy your game!",
		content_en = "Dear Player: \n    The former Host has been kicked out for inactivity. Now you are the new Host. Invite players to challenge now. It is important for you to get the Participants Reward!\n    Enjoy your game!",
		subject_en = "Elemental Challenge - New Host Notice",
		sender_en = "Secretary"
	},
	{
		subject = "Aether Paradise Point Reward Makeup",
		subject_th = "Aether Paradise แต้ม รีวอร์ด แต่งหน้า",
		id = 76,
		content_th = "เรียนผู้เล่นทุกท่าน: \n เราได้อัปเดตเนื้อหาในรางวัลคะแนนแล้ว แนบรางวัลที่ไม่มีการอ้างสิทธิ์ของคุณ หวังว่าจะได้พบคุณอีกครั้งใน  Aether Paradise !\n ขอให้สนุกกับเกมของคุณ!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear Player: \n    We updated contents in Point Reward. Your unclaimed reward is attached. Hope to see you again in the Aether Paradise!\n    Enjoy your game!",
		content_en = "Dear Player: \n    We updated contents in Point Reward. Your unclaimed reward is attached. Hope to see you again in the Aether Paradise!\n    Enjoy your game!",
		subject_en = "Aether Paradise Point Reward Makeup",
		sender_en = "Secretary"
	},
	{
		subject = "Fortune Incoming Redeem Mail",
		subject_th = "ฟอร์จูนรับจดหมายแลกรับ",
		id = 77,
		content_th = [[
เรียนผู้เล่นทุกท่าน: 
 นี่คือข้อมูลคูปองของคุณจาก No.%d Red Pack Rain in the Fortune Incoming: 
 หมายเลขคูปอง: %d; รายละเอียดการแลก: %s 
 สนุกกับเกมของคุณ!]],
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = [[
Dear Player: 
    Here is your Coupon Info from No.%d Red Pack Rain in the Fortune Incoming: 
    Coupon No.: %d; Redeem Details: %s 
    Enjoy your game!]],
		content_en = [[
Dear Player: 
    Here is your Coupon Info from No.%d Red Pack Rain in the Fortune Incoming: 
    Coupon No.: %d; Redeem Details: %s 
    Enjoy your game!]],
		subject_en = "Fortune Incoming Redeem Mail",
		sender_en = "Secretary"
	},
	{
		subject = "Cross-server Mall Daily Reward",
		subject_th = "รางวัล Mall Daily ข้ามเซิร์ฟเวอร์",
		id = 78,
		content_th = "ผู้เล่นที่รัก: \n ยินดีด้วย! คุณได้รับรางวัล No.%d ใน Cross-server Mall (การชำระรายวัน) รางวัลของคุณถูกส่งทางไปรษณีย์ กรุณาเช็คอินเวลา พยายามต่อไป!\n สนุกกับเกมของคุณ!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear Player: \n    Congrats! You won No.%d in the Cross-server Mall (Daily Settlement). Your reward has been sent by mail. Please check in time. Keep on trying your best!\n    Enjoy your game!",
		content_en = "Dear Player: \n    Congrats! You won No.%d in the Cross-server Mall (Daily Settlement). Your reward has been sent by mail. Please check in time. Keep on trying your best!\n    Enjoy your game!",
		subject_en = "Cross-server Mall Daily Reward",
		sender_en = "Secretary"
	},
	{
		subject = "Cross-server Mall Total Reward",
		subject_th = "รางวัลรวมมอลล์ข้ามเซิร์ฟเวอร์",
		id = 79,
		content_th = "ผู้เล่นที่รัก: \n ยินดีด้วย! คุณได้รับรางวัล No.%d ใน Cross-server Mall (Seasonal Settlement) รางวัลของคุณถูกส่งทางไปรษณีย์ กรุณาเช็คอินเวลา หวังว่าจะได้พบคุณอีกครั้ง!\n ขอให้สนุกกับเกมของคุณ!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear Player: \n    Congrats! You won No.%d in the Cross-server Mall (Seasonal Settlement). Your reward has been sent by mail. Please check in time. Hope to see you again!\n    Enjoy your game!",
		content_en = "Dear Player: \n    Congrats! You won No.%d in the Cross-server Mall (Seasonal Settlement). Your reward has been sent by mail. Please check in time. Hope to see you again!\n    Enjoy your game!",
		subject_en = "Cross-server Mall Total Reward",
		sender_en = "Secretary"
	},
	{
		subject = "Cross-server Mall Server Total Reward",
		subject_th = "รางวัลรวมเซิร์ฟเวอร์มอลล์ข้ามเซิร์ฟเวอร์",
		id = 80,
		content_th = "ผู้เล่นที่รัก: \n ยินดีด้วย! เซิร์ฟเวอร์ของคุณชนะ No.%d ใน Cross-server Mall (Seasonal Settlement) รางวัลของคุณถูกส่งทางไปรษณีย์ กรุณาเช็คอินเวลา หวังว่าจะได้พบคุณอีกครั้ง!\n ขอให้สนุกกับเกมของคุณ!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear Player: \n    Congrats! Your server won No.%d in the Cross-server Mall (Seasonal Settlement). Your reward has been sent by mail. Please check in time. Hope to see you again!\n    Enjoy your game!",
		content_en = "Dear Player: \n    Congrats! Your server won No.%d in the Cross-server Mall (Seasonal Settlement). Your reward has been sent by mail. Please check in time. Hope to see you again!\n    Enjoy your game!",
		subject_en = "Cross-server Mall Server Total Reward",
		sender_en = "Secretary"
	},
	{
		subject = "Cross-server Mall Boss Reward",
		subject_th = "รางวัลบอสมอลล์ข้ามเซิร์ฟเวอร์",
		id = 81,
		content_th = "ผู้เล่นที่รัก: \n ยินดีด้วย! ความเสียหายทั้งหมดของคุณชนะ No.%d ใน Cross-server Mall (Boss Battle) รางวัลของคุณถูกส่งทางไปรษณีย์ กรุณาเช็คอินเวลา ขอบคุณที่รักษาความสงบของ Mall!\n ขอให้สนุกกับเกมของคุณ!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear Player: \n    Congrats! Your total damage dealt won No.%d in the Cross-server Mall (Boss Battle). Your reward has been sent by mail. Please check in time. Thank you for keeping the peace of Mall!\n    Enjoy your game!",
		content_en = "Dear Player: \n    Congrats! Your total damage dealt won No.%d in the Cross-server Mall (Boss Battle). Your reward has been sent by mail. Please check in time. Thank you for keeping the peace of Mall!\n    Enjoy your game!",
		subject_en = "Cross-server Mall Boss Reward",
		sender_en = "Secretary"
	},
	{
		subject = "union Q & a individual ranking Award",
		subject_th = "ยูเนี่ยน Q & รางวัลการจัดอันดับบุคคล",
		id = 82,
		content_th = "เพื่อนๆ ที่รัก：\n ขอแสดงความยินดีที่คุณได้รับรางวัล %d ในสหภาพ Q & a ， รางวัลอันดับถูกส่งไปพร้อมกับอีเมล โปรดตรวจสอบให้ทันเวลา หวังว่าจะใช้ความพยายามอย่างไม่ลดละและปีนขึ้นไปบนยอดอย่างกล้าหาญ \n ฉันขอให้คุณมีความสุขในเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear friends：\n   Congratulations on your winning the %d place in the union Q & a ， the ranking reward has been sent with the email, please check it in time. Hope to make persistent efforts and climb the summit bravely. \n  I wish you a happy game!",
		content_en = "Dear friends：\n   Congratulations on your winning the %d place in the union Q & a ， the ranking reward has been sent with the email, please check it in time. Hope to make persistent efforts and climb the summit bravely. \n  I wish you a happy game!",
		subject_en = "union Q & a individual ranking Award",
		sender_en = "Secretary"
	},
	{
		subject = "union Q & a guild ranking Award",
		subject_th = "ยูเนี่ยน Q & a รางวัลอันดับกิลด์",
		id = 83,
		content_th = "เพื่อนๆ ที่รัก：\n ยินดีด้วย คุณชนะที่ %d ในการถาม & ตอบของสหภาพแล้ว รางวัลอันดับถูกส่งทางอีเมลแล้ว กรุณาตรวจสอบในเวลา หวังว่าจะมีส่วนร่วมในความสูงใหม่ที่กล้าหาญ \n ฉันขอให้คุณมีความสุขในเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear friends：\n Congratulations, your  won the %d place in the union Q & A. the ranking reward has been sent by email. Please check it in time. Hope to participate in the collective, brave new heights. \n I wish you a happy game!",
		content_en = "Dear friends：\n Congratulations, your  won the %d place in the union Q & A. the ranking reward has been sent by email. Please check it in time. Hope to participate in the collective, brave new heights. \n I wish you a happy game!",
		subject_en = "union Q & a guild ranking Award",
		sender_en = "Secretary"
	},
	{
		subject = "Battle of the Big House Preliminary Ranking Rewards",
		subject_th = "404  404",
		id = 84,
		content_th = "404  404",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear friends:\n Your guild won the %d place in the preliminary battle for the Ministry of Commerce materials. The settlement reward has been sent with the email, please check it in time. \n Happy gaming!",
		content_en = "Dear friends:\n Your guild won the %d place in the preliminary battle for the Ministry of Commerce materials. The settlement reward has been sent with the email, please check it in time. \n Happy gaming!",
		subject_en = "Battle of the Big House Preliminary Ranking Rewards",
		sender_en = "Secretary"
	},
	{
		subject = "Big House Battle Final Ranking Rewards",
		subject_th = "404  404",
		id = 85,
		content_th = "404  404",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear friends:\n The guild you belong to won the %dth place in the Battle of the Ministry of War. The settlement reward has been sent with the email, please check it in time. \n Happy gaming!",
		content_en = "Dear friends:\n The guild you belong to won the %dth place in the Battle of the Ministry of War. The settlement reward has been sent with the email, please check it in time. \n Happy gaming!",
		subject_en = "Big House Battle Final Ranking Rewards",
		sender_en = "Secretary"
	},
	{
		subject = "Big House Battle Preliminary Quiz Rewards",
		subject_th = "404  404",
		id = 86,
		content_th = "404  404",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear friends:\n You have successfully guessed %s in the Preliminary Contest of the Battle of the Household, and the settlement reward has been sent with the email, please check it in time. \n Happy gaming!",
		content_en = "Dear friends:\n You have successfully guessed %s in the Preliminary Contest of the Battle of the Household, and the settlement reward has been sent with the email, please check it in time. \n Happy gaming!",
		subject_en = "Big House Battle Preliminary Quiz Rewards",
		sender_en = "Secretary"
	},
	{
		subject = "Big House Battle Final Guess Rewards",
		subject_th = "404  404",
		id = 87,
		content_th = "404  404",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear friends:\n You have successfully guessed %s in the final quiz of the Big House Battle. The settlement reward has been sent with the email, please check it in time. \n Happy gaming!",
		content_en = "Dear friends:\n You have successfully guessed %s in the final quiz of the Big House Battle. The settlement reward has been sent with the email, please check it in time. \n Happy gaming!",
		subject_en = "Big House Battle Final Guess Rewards",
		sender_en = "Secretary"
	},
	{
		subject = "Rewards for Failed Preliminary Guessing",
		subject_th = "404  404",
		id = 88,
		content_th = "404  404",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear friends:\n You did not guess correctly in the preliminary guess of the Battle of the Household. The following is the consolation prize, please make persistent efforts. The settlement reward has been sent with the email, please check it in time. \n Happy gaming!",
		content_en = "Dear friends:\n You did not guess correctly in the preliminary guess of the Battle of the Household. The following is the consolation prize, please make persistent efforts. The settlement reward has been sent with the email, please check it in time. \n Happy gaming!",
		subject_en = "Rewards for Failed Preliminary Guessing",
		sender_en = "Secretary"
	},
	{
		subject = "Reward for failure of the final quiz of the Big House Battle",
		subject_th = "404  404",
		id = 89,
		content_th = "404  404",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear friends:\n You did not guess correctly in the final guess of the Battle of the Household. The following is the consolation prize. Please make persistent efforts. The settlement reward has been sent with the email, please check it in time. \n Happy gaming!",
		content_en = "Dear friends:\n You did not guess correctly in the final guess of the Battle of the Household. The following is the consolation prize. Please make persistent efforts. The settlement reward has been sent with the email, please check it in time. \n Happy gaming!",
		subject_en = "Reward for failure of the final quiz of the Big House Battle",
		sender_en = "Secretary"
	},
	__size = 123,
	[101] = {
		subject = "Lost Pokémon Mail",
		subject_th = "โปเกม่อนเมลหาย",
		id = 101,
		content_th = "เรียนเทรนเนอร์:\n เราพบโปเกมอนที่หายไปสองสามตัว โปรดนำพวกมันกลับบ้านเร็ว ๆ นี้! \n สิ่งที่ดีที่สุดสำหรับการผจญภัยของคุณ!",
		sender_th = "โปเกมอน เซ็นเตอร์",
		sender = "Pokémon Center",
		content = "Dear trainer:\n    We found a few missing Pokémons, please bring them home soon! \n    All the best for your adventure!",
		content_en = "Dear trainer:\n    We found a few missing Pokémons, please bring them home soon! \n    All the best for your adventure!",
		subject_en = "Lost Pokémon Mail",
		sender_en = "Pokémon Center"
	},
	[102] = {
		subject = "Monthly subscription unclaimed rewards notice",
		subject_th = "ประกาศรางวัลที่ไม่มีการอ้างสิทธิ์การสมัครสมาชิกรายเดือน",
		id = 102,
		content_th = "เรียนเทรนเนอร์: \n เนื่องจากคุณยังไม่ได้รับรางวัลรายวันของการสมัครรับข้อมูลรายเดือนที่มอบให้เมื่อวันก่อน โปรดตรวจสอบรางวัลที่ส่งทางไปรษณีย์ n มีความสุขกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainer: \n    As you've not claimed the Monthly Subscription  daily rewards given on the day before, please check the rewards that have been sent via mail. n    Happy gaming!",
		content_en = "Dear trainer: \n    As you've not claimed the Monthly Subscription  daily rewards given on the day before, please check the rewards that have been sent via mail. n    Happy gaming!",
		subject_en = "Monthly subscription unclaimed rewards notice",
		sender_en = "Secretary"
	},
	[103] = {
		subject = "Extreme Month Card Replacement notice",
		subject_th = "แจ้งการเปลี่ยนบัตรเดือน Extreme",
		id = 103,
		content_th = "เรียนเทรนเนอร์: \n เนื่องจากคุณยังไม่ได้รับรางวัลการสมัครสมาชิกรายเดือน Supreme รายวันที่มอบให้เมื่อวันก่อน โปรดตรวจสอบรางวัลที่ส่งทางไปรษณีย์ n มีความสุขกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainer: \n    As you've not claimed the Supreme Monthly Subscription daily rewards given on the day before, please check the rewards that have been sent via mail.  n    Happy gaming!",
		content_en = "Dear trainer: \n    As you've not claimed the Supreme Monthly Subscription daily rewards given on the day before, please check the rewards that have been sent via mail.  n    Happy gaming!",
		subject_en = "Extreme Month Card Replacement notice",
		sender_en = "Secretary"
	},
	[104] = {
		subject = "%s rewards return",
		subject_th = "%s การคืนของรางวัล",
		id = 104,
		content_th = "เรียนเทรนเนอร์:\n เนื่องจากคุณยังไม่ได้รับรางวัลที่เสร็จสิ้นระหว่างกิจกรรม เราจึงออกรางวัลให้คุณใหม่ โปรดตรวจสอบและรับรางวัลดังต่อไปนี้\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainer:\n    Since you have not claimed the rewards completed during the event, we're reissuing the rewards to you. Please check and claim the following rewards.\n    Happy gaming!",
		content_en = "Dear trainer:\n    Since you have not claimed the rewards completed during the event, we're reissuing the rewards to you. Please check and claim the following rewards.\n    Happy gaming!",
		subject_en = "%s rewards return",
		sender_en = "Secretary"
	},
	[105] = {
		id = 105,
		subject = "Your union request has been processed",
		content = "Dear trainer:\n  %s has approved your request to join the union. Time to say hello to your union members!",
		content_th = "เรียนเทรนเนอร์:\n %s อนุมัติคำขอเข้าร่วมสหภาพของคุณแล้ว ถึงเวลากล่าวทักทายสมาชิกสหภาพของคุณแล้ว!",
		sender_th = "ศูนย์ทรัพยากรมนุษย์พันธมิตร",
		sender = "Alliance Human Resource Center",
		subject_th = "คำขอสหภาพของคุณได้รับการดำเนินการแล้ว",
		content_en = "Dear trainer:\n  %s has approved your request to join the union. Time to say hello to your union members!",
		subject_en = "Your union request has been processed",
		sender_en = "Alliance Human Resource Center",
		tab = 1
	},
	[106] = {
		subject = "Welcome to the Pokémon World",
		subject_th = "ยินดีต้อนรับสู่โลกโปเกมอน",
		id = 106,
		content_th = "เรียนเทรนเนอร์:\n ยินดีต้อนรับสู่โลกโปเกมอนที่ลึกลับและน่าสนใจ นี่เป็นสัญญาณเล็กๆ น้อยๆ สำหรับคุณ หวังว่าสิ่งนี้จะช่วยคุณในการผจญภัยในอนาคต\n ขอให้มีความสุขกับการเล่นเกม!",
		sender_th = "พันธมิตรโปเกมอน",
		sender = "Pokémon Alliance",
		content = "Dear trainer:\n    Welcome to this mysterious and interesting Pokémon World. This is a small token for you, hope that this can help you in your future adventure.\n    Happy gaming!",
		content_en = "Dear trainer:\n    Welcome to this mysterious and interesting Pokémon World. This is a small token for you, hope that this can help you in your future adventure.\n    Happy gaming!",
		subject_en = "Welcome to the Pokémon World",
		sender_en = "Pokémon Alliance",
		attachs = {
			gold = 20000,
			rmb = 50,
			__size = 3,
			[11.0] = 50
		}
	},
	[107] = {
		subject = "Rewards mail",
		subject_th = "จดหมายรางวัล",
		id = 107,
		content_th = "เรียนเทรนเนอร์:\n ยินดีต้อนรับสู่โลกโปเกมอนที่ลึกลับและน่าสนใจ นี่เป็นสัญญาณเล็กๆ น้อยๆ สำหรับคุณ หวังว่าสิ่งนี้จะช่วยคุณในการผจญภัยในอนาคต\n ขอให้มีความสุขกับการเล่นเกม!",
		sender_th = "พันธมิตรโปเกมอน",
		sender = "Pokémon Alliance",
		content = "Dear trainer:\n    Welcome to this mysterious and interesting Pokémon World. This is a small token for you, hope that this can help you in your future adventure.\n    Happy gaming!",
		content_en = "Dear trainer:\n    Welcome to this mysterious and interesting Pokémon World. This is a small token for you, hope that this can help you in your future adventure.\n    Happy gaming!",
		subject_en = "Rewards mail",
		sender_en = "Pokémon Alliance",
		attachs = {
			gold = 10,
			__size = 1
		}
	},
	[108] = {
		subject = "Someone helpful has fulfilled your wish",
		subject_th = "มีคนช่วยเหลือเติมเต็มความปรารถนาของคุณ",
		id = 108,
		content_th = "มีคน %s ช่วยมอบชิ้นส่วนให้กับคุณ อย่าลืมยอมรับมัน!",
		sender_th = "สำนักงานปรารถนาลีก",
		sender = "League Wishing Office",
		content = "Someone %s helping has gifted you a shard, do remember to accept it!",
		content_en = "Someone %s helping has gifted you a shard, do remember to accept it!",
		subject_en = "Someone helpful has fulfilled your wish",
		sender_en = "League Wishing Office"
	},
	[109] = {
		subject = "Identity Autentication Reward Mail",
		subject_th = "จดหมายรางวัลการตรวจสอบข้อมูลประจำตัว",
		id = 109,
		content_th = "เรียนเทรนเนอร์:\n ยินดีต้อนรับสู่โลกโปเกมอนที่ลึกลับและน่าสนใจ นี่เป็นสัญญาณเล็กๆ น้อยๆ สำหรับคุณ หวังว่าสิ่งนี้จะช่วยคุณในการผจญภัยในอนาคต\n ขอให้มีความสุขกับการเล่นเกม!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear trainer:\n    Welcome to this mysterious and interesting Pokémon World. This is a small token for you, hope that this can help you in your future adventure.\n    Happy gaming!",
		content_en = "Dear trainer:\n    Welcome to this mysterious and interesting Pokémon World. This is a small token for you, hope that this can help you in your future adventure.\n    Happy gaming!",
		subject_en = "Identity Autentication Reward Mail",
		sender_en = "Secretary",
		attachs = {
			gold = 500000,
			rmb = 150,
			__size = 2
		}
	},
	[110] = {
		subject = "PvP Arena Weekly Settlement",
		subject_th = "PvP Arena การตั้งถิ่นฐานรายสัปดาห์",
		id = 110,
		content_th = "ผู้เล่นที่รัก: \n ยินดีด้วย! คุณบรรลุ %d คะแนนในสองโหมดในการตัดสินรายสัปดาห์ นี่คือรางวัลของคุณ พยายามต่อไป!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear Player: \n    Congrats! You reached %d points in two modes at weekly settlement. Here are your rewards. Keep trying!",
		content_en = "Dear Player: \n    Congrats! You reached %d points in two modes at weekly settlement. Here are your rewards. Keep trying!",
		subject_en = "PvP Arena Weekly Settlement",
		sender_en = "Secretary"
	},
	[111] = {
		subject = "PvP Arena Weekly Settlement",
		subject_th = "PvP Arena การตั้งถิ่นฐานรายสัปดาห์",
		id = 111,
		content_th = "ผู้เล่นที่รัก: \n คุณถึง %d คะแนนในสองโหมด แต่การรบที่เข้าร่วมของคุณน้อยกว่า %d ในสัปดาห์นี้ คุณไม่สามารถรับรางวัลได้ โปรดเข้าร่วมอย่างแข็งขันในสัปดาห์หน้า!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear Player: \n    You reached %d points in two modes but your participated battles are less than %d this week. You cannot claim any reward. Please join actively next week!",
		content_en = "Dear Player: \n    You reached %d points in two modes but your participated battles are less than %d this week. You cannot claim any reward. Please join actively next week!",
		subject_en = "PvP Arena Weekly Settlement",
		sender_en = "Secretary"
	},
	[112] = {
		subject = "PvP Arena Seasonal Settlement",
		subject_th = "PvP Arena การตั้งถิ่นฐานตามฤดูกาล",
		id = 112,
		content_th = "ผู้เล่นที่รัก: \n ฤดูกาลนี้สิ้นสุดแล้ว! ยินดีด้วย! คุณได้รับรางวัล No.%d ในการตัดสินฤดูกาล นี่คือรางวัลของคุณ พยายามต่อไปและพบกันใหม่ในฤดูกาลหน้า!",
		sender_th = "เลขานุการ",
		sender = "Secretary",
		content = "Dear Player: \n    This season is ended! Congrats! You won No.%d at seasonal settlement. Here are your rewards. Keep trying and see you next season!",
		content_en = "Dear Player: \n    This season is ended! Congrats! You won No.%d at seasonal settlement. Here are your rewards. Keep trying and see you next season!",
		subject_en = "PvP Arena Seasonal Settlement",
		sender_en = "Secretary"
	},
	[113] = {
		subject = "Notice for illegal discount top-up",
		subject_th = "แจ้งการเติมส่วนลดผิดกฎหมาย",
		id = 113,
		content_th = [[
Dear trainers,
  Recently we found that some trainer are using illegal third-party top-up method.
  In order to maintain the fairness of the game, and ensure everyone's account safety,we will take action on trainers who using illegal third-party top-up.
  1) Illegal recharge channels is unsecure for your personal information and your credit card.
  2) If after using illegal third-party top-up and service provider refunds, you account will be banned.
  3) We will not deal with any issue caused by using illegal third-party top-up method.
  4) Your account may being stolen by illegal top-up service providers.
  Please cherish your account and be aware of "discount" top-up scam.
  Sincerely
  Devs group]],
		sender_th = "มีหมอก",
		sender = "Misty",
		content = [[
Dear trainers,
  Recently we found that some trainer are using illegal third-party top-up method.
  In order to maintain the fairness of the game, and ensure everyone's account safety,we will take action on trainers who using illegal third-party top-up.
  1) Illegal recharge channels is unsecure for your personal information and your credit card.
  2) If after using illegal third-party top-up and service provider refunds, you account will be banned.
  3) We will not deal with any issue caused by using illegal third-party top-up method.
  4) Your account may being stolen by illegal top-up service providers.
  Please cherish your account and be aware of "discount" top-up scam.
  Sincerely
  Devs group]],
		content_en = [[
Dear trainers,
  Recently we found that some trainer are using illegal third-party top-up method.
  In order to maintain the fairness of the game, and ensure everyone's account safety,we will take action on trainers who using illegal third-party top-up.
  1) Illegal recharge channels is unsecure for your personal information and your credit card.
  2) If after using illegal third-party top-up and service provider refunds, you account will be banned.
  3) We will not deal with any issue caused by using illegal third-party top-up method.
  4) Your account may being stolen by illegal top-up service providers.
  Please cherish your account and be aware of "discount" top-up scam.
  Sincerely
  Devs group]],
		subject_en = "Notice for illegal discount top-up",
		sender_en = "Misty"
	},
	[120] = {
		id = 120,
		subject = "Explorer Device (Unicorn Crawler) upgrade consumption reduction returns",
		content = "Dear trainer:\n Thank you for your feedback on the relatively high number of materials needed for upgrading the Explorer Device (Unicorn crawler). Upon update and adjustments, we are refunding the additional materials you have spent in the upgrade. We hope that can it help in your future adventures. \n Happy Gaming!",
		content_th = "เรียนเทรนเนอร์:\n ขอบคุณสำหรับความคิดเห็นของคุณเกี่ยวกับจำนวนวัสดุที่ค่อนข้างสูงที่จำเป็นสำหรับการอัปเกรด Explorer  Device (โปรแกรมรวบรวมข้อมูลยูนิคอร์น) เมื่ออัปเดตและปรับเปลี่ยน เราจะคืนเงินสำหรับวัสดุเพิ่มเติมที่คุณใช้ไปในการอัปเกรด เราหวังว่าจะสามารถช่วยในการผจญภัยในอนาคตของคุณ \n มีความสุขกับการเล่นเกม!",
		sender_th = "พันธมิตรโปเกมอน",
		sender = "Pokémon Alliance",
		subject_th = "Explorer  Device (ตัวยูนิคอน Crawler) อัพเกรดการลดการบริโภคกลับ",
		content_en = "Dear trainer:\n Thank you for your feedback on the relatively high number of materials needed for upgrading the Explorer Device (Unicorn crawler). Upon update and adjustments, we are refunding the additional materials you have spent in the upgrade. We hope that can it help in your future adventures. \n Happy Gaming!",
		subject_en = "Explorer Device (Unicorn Crawler) upgrade consumption reduction returns",
		sender_en = "Pokémon Alliance",
		tab = 1
	},
	[121] = {
		id = 121,
		subject = "Indigo Plateau Silver Badge Exchange",
		content = "Dear trainers:\n    Hi, due to the optimization of the Indigo Plateau currency, the %d Indigo Plateau Silver Badges you originally had have all been automatically converted into %d Indigo Plateau Gold Badges. \n   Happy gaming!",
		content_th = "เรียน เทรนเนอร์:\n สวัสดี เนื่องจากการปรับสกุลเงินที่ราบสูงอินดิโก้ให้เหมาะสมที่สุด %d  Indigo Plateau Silver Badge ที่คุณแต่เดิมได้ถูกแปลงเป็น %d Indigo Plateau Gold Badges โดยอัตโนมัติ \n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "พันธมิตรโปเกมอน",
		sender = "Pokémon Alliance",
		subject_th = "Indigo Plateau Silver Badge แลกเปลี่ยน",
		content_en = "Dear trainers:\n    Hi, due to the optimization of the Indigo Plateau currency, the %d Indigo Plateau Silver Badges you originally had have all been automatically converted into %d Indigo Plateau Gold Badges. \n   Happy gaming!",
		subject_en = "Indigo Plateau Silver Badge Exchange",
		sender_en = "Pokémon Alliance",
		tab = 1
	},
	[122] = {
		id = 122,
		subject = "Global Indigo Plateau Silver Coin Exchange",
		content = "Dear trainer:\n Due to currency optimization, your original %d Global Indigo Silvers has been automatically converted into %d Global Indigo Coins by the system.\n Happy gaming!",
		content_th = "เรียนเทรนเนอร์:\n เนื่องจากการเพิ่มประสิทธิภาพสกุลเงิน %d  Global Indigo Silver s ดั้งเดิมของคุณจึงถูกแปลงเป็น %d Global Indigo  Coins โดยอัตโนมัติโดยระบบ\n ขอให้สนุกกับการเล่นเกม!",
		sender_th = "พันธมิตรโปเกมอน",
		sender = "Pokémon Alliance",
		subject_th = "การแลกเปลี่ยนเหรียญเงินที่ราบสูงครามโลก",
		content_en = "Dear trainer:\n Due to currency optimization, your original %d Global Indigo Silvers has been automatically converted into %d Global Indigo Coins by the system.\n Happy gaming!",
		subject_en = "Global Indigo Plateau Silver Coin Exchange",
		sender_en = "Pokémon Alliance",
		tab = 1
	},
	[123] = {
		id = 123,
		subject = "Reunion Time Notice",
		content = "Dear Trainer: \n    Due to the inactivity of your linked Returned Player, you can only join Reunion Event again after %d days.",
		content_th = "เรียนเทรนเนอร์: \n เนื่องจากไม่มีการใช้งานของผู้เล่นที่ส่งคืนที่เชื่อมโยงของคุณ คุณสามารถเข้าร่วมกิจกรรมการรวมตัวใหม่ได้อีกครั้งหลังจาก %d วัน",
		sender_th = "พันธมิตรโปเกมอน",
		sender = "Pokémon Alliance",
		subject_th = "ประกาศเวลาเรอูนียง",
		content_en = "Dear Trainer: \n    Due to the inactivity of your linked Returned Player, you can only join Reunion Event again after %d days.",
		subject_en = "Reunion Time Notice",
		sender_en = "Pokémon Alliance",
		tab = 1
	},
	[130] = {
		subject = "404404",
		id = 130,
		sender = "Secretary",
		content = "404404",
		attachs = {
			gold = 50000,
			rmb = 50,
			__size = 3,
			[14.0] = 20
		}
	},
	[131] = {
		subject = "404404",
		id = 131,
		sender = "Secretary",
		content = "404404",
		attachs = {
			gold = 100000,
			rmb = 100,
			[941.0] = 1,
			__size = 3
		}
	},
	[132] = {
		subject = "404404",
		id = 132,
		sender = "Secretary",
		content = "404404",
		attachs = {
			[452.0] = 50,
			rmb = 150,
			gold = 150000,
			__size = 3
		}
	},
	[133] = {
		subject = "404404",
		id = 133,
		sender = "Secretary",
		content = "404404",
		attachs = {
			[5000.0] = 30,
			gold = 200000,
			[503.0] = 5,
			__size = 3
		}
	},
	[134] = {
		subject = "Community rewards",
		id = 134,
		sender = "Secretary",
		content = "Congratulations on winning the 1st place in the community event.",
		attachs = {
			gold = 800000,
			rmb = 1000,
			__size = 3,
			[930.0] = 50
		}
	},
	[135] = {
		subject = "Community rewards",
		id = 135,
		sender = "Secretary",
		content = "Congratulations on winning the 2nd place in the community event.",
		attachs = {
			gold = 600000,
			rmb = 800,
			__size = 3,
			[930.0] = 30
		}
	},
	[136] = {
		subject = "Community rewards",
		id = 136,
		sender = "Secretary",
		content = "Congratulations on winning the 3rd place in the community event.",
		attachs = {
			gold = 300000,
			rmb = 500,
			__size = 3,
			[930.0] = 15
		}
	},
	[137] = {
		subject = "Birthday present",
		id = 137,
		sender = "Secretary",
		content = "Happy birthday! A gift has been prepared for you, please check it out.",
		attachs = {
			[503.0] = 20,
			rmb = 2000,
			__size = 4,
			[521.0] = 10,
			gold = 2000000
		}
	},
	[138] = {
		id = 138,
		sender = "Secretary",
		subject = "Mounted Combat Guild Victory Reward Email",
		content = "Dear friends:\n Your guild has won the Battle of Mounted Combat! Please accept the winner's prize! . \n I wish you a happy game!"
	},
	[139] = {
		id = 139,
		sender = "Secretary",
		subject = "Mounted Combat Guild Failure Reward Email",
		content = "Dear friends:\n Your guild was narrowly defeated in the Battle of Shadows, please receive rewards and fight harder! . \n I wish you a happy game!"
	},
	[140] = {
		id = 140,
		sender = "Secretary",
		subject = "Mounted Combat Guild Draw Reward Email",
		content = "Dear friends:\n Your guild is evenly matched with the opponent in the battle of the Mounted Combat, please accept this hard-won reward! . \n I wish you a happy game!"
	},
	[141] = {
		id = 141,
		sender = "Secretary",
		subject = "Mounted Combat Guild Ranking Reward Email",
		content = "Dear friends:\n Your guild won the %d place in this season's fierce battle, the ranking reward has been sent with the email, please check it in time. \n I wish you a happy game!"
	},
	[142] = {
		id = 142,
		sender = "Secretary",
		subject = "Mounted Combat Character Ranking Reward Email",
		content = "Dear friend:\n Congratulations on your achievement of the %dth place in the fierce battle of the Mounted Combat. The ranking reward has been sent with the email, please check it in time. \n I wish you a happy game!"
	},
	[143] = {
		id = 143,
		sender = "Secretary",
		subject = "404404"
	},
	[150] = {
		tab = 1,
		content = "Dear trainer: \n Due to the increase of the level of the Held Items, and then after an update have reduced the level consumption, there will be some experience overflow. The overflow has been returned with the mail, please check it in time. \n I wish you a happy game!",
		id = 150,
		sender = "Secretary",
		subject = "Held Items upgrade-overflow return"
	},
	[151] = {
		tab = 1,
		content = "Thanks you for participating in the Come With Me event.",
		id = 151,
		sender = "Secretary",
		subject = "【Come With Me】 Event Rewards"
	},
	[152] = {
		tab = 1,
		content = "Thank you for participating in the  Gathering of New Friends event, please accept your reward, wish you a happy game!",
		id = 152,
		sender = "Secretary",
		subject = "Gathering of New Friends Event Reward"
	},
	__default = {
		__index = {
			subject_th = "",
			subject = "",
			content_th = "",
			sender_th = "",
			sender = "",
			content = "",
			content_en = "",
			subject_en = "",
			special = false,
			sender_en = "",
			tab = 2,
			attachs = {
				__size = 0
			}
		}
	}
}

return csv.mail
