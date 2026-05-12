slot0 = {
	{},
	__size = 3,
	[3] = {
		32
	},
	[4] = {
		__size = 2,
		x = 0,
		y = -150
	}
}
slot2 = {
	[1003] = slot0[3],
	[1002] = slot0[3],
	[1001] = slot0[3]
}
slot3 = {
	[1003] = slot0[4],
	[1002] = slot0[4],
	[1001] = slot0[4]
}
csv.new_guide_local = {
	{
		showType = 2,
		talkContent = "Pickup! Pickup!",
		specialName = "summerChallenge101",
		talkContent_en = "Pickup! Pickup!",
		id = 1,
		stage = 1,
		talkContent_th = "ปิ๊กอัพ ปิ๊กอัพ!"
	},
	{
		showType = 2,
		talkContent = "Pikachu, let's fight together!",
		service = 1,
		id = 2,
		stage = 1,
		talkContent_th = "ปิก๊าจู สู้ไปด้วยกัน!",
		talkContent_en = "Pikachu, let's fight together!",
		choices = {
			11,
			21,
			31
		}
	},
	__size = 9,
	[11] = {
		showType = 2,
		stage = 1,
		talkContent_th = "แอปเปิ้ลทองคำ2",
		talkContent_en = "golden apple 2",
		id = 11,
		talkContent = "golden apple 2"
	},
	[21] = {
		showType = 2,
		stage = 1,
		talkContent_th = "แอปเปิ้ลเงิน2",
		talkContent_en = "silver apple 2",
		id = 21,
		talkContent = "silver apple 2"
	},
	[31] = {
		showType = 2,
		stage = 1,
		talkContent_th = "แอปเปิ้ลเน่า2",
		talkContent_en = "Rotten Apple 2",
		id = 31,
		talkContent = "Rotten Apple 2"
	},
	[1001] = {
		specialName = "summerChallenge1001",
		showType = 2,
		roleName_th = "Dr.Oak",
		talkContent_en = "Welcome to this Summer Carnival Explore event, now we are in the beaty islands where Milotic lives, and the rest of time we will explore the legend of Milotic in this game with thrills and spills.To find out the secret of Milotic in the mysterious ancient Palace of Lake......",
		talkContent = "Welcome to this Summer Carnival Explore event, now we are in the beaty islands where Milotic lives, and the rest of time we will explore the legend of Milotic in this game with thrills and spills.To find out the secret of Milotic in the mysterious ancient Palace of Lake......",
		talkContent_th = "ยินดีต้อนรับสู่กิจกรรม Summer Carnival Explore นี้ ตอนนี้เราอยู่ในเกาะอันสวยงามที่ Milotic อาศัยอยู่ และช่วงเวลาที่เหลือเราจะสำรวจตำนานของ Milotic ในเกมนี้ด้วยความระทึกและระทึก เพื่อค้นหาความลับของ Milotic ในสมัยโบราณลึกลับ วังแห่งทะเลสาบ...",
		roleName = "Dr.Oak",
		roleName_en = "Dr.Oak",
		id = 1001,
		stage = 2,
		useRoleFigure = slot2[1001],
		offPos = slot3[1001]
	},
	[1002] = {
		showType = 2,
		talkContent = "It is said that Milotic lives in the Palace of Lake under the middle of beauty islands, and the clues to enter the Palace is hidden in our intense and fun game stages. There will be only one team can win the chance of entering the Palace, Milotic and the Ultimate Treasure is waiting for you to find!",
		roleName_th = "Dr.Oak",
		talkContent_en = "It is said that Milotic lives in the Palace of Lake under the middle of beauty islands, and the clues to enter the Palace is hidden in our intense and fun game stages. There will be only one team can win the chance of entering the Palace, Milotic and the Ultimate Treasure is waiting for you to find!",
		talkContent_th = "ว่ากันว่า Milotic อาศัยอยู่ใน Palace of Lake ใต้กลางเกาะที่สวยงามและเบาะแสในการเข้าสู่ Palace นั้นถูกซ่อนอยู่ในขั้นตอนเกมที่เข้มข้นและสนุกสนานของเรา จะมีทีมเดียวเท่านั้นที่สามารถชนะโอกาสในการเข้า Palace, Milotic และ Ultimate Treasure กำลังรอคุณอยู่!",
		roleName = "Dr.Oak",
		roleName_en = "Dr.Oak",
		id = 1002,
		stage = 2,
		useRoleFigure = slot2[1002],
		offPos = slot3[1002]
	},
	[1003] = {
		showType = 2,
		talkContent = "Each team will get a Expedition Manuel that includes the map of event area and details of this event......",
		roleName_th = "Dr.Oak",
		talkContent_en = "Each team will get a Expedition Manuel that includes the map of event area and details of this event......",
		talkContent_th = "แต่ละทีมจะได้รับ Expedition Manuel ที่มีแผนที่พื้นที่กิจกรรมและรายละเอียดของกิจกรรมนี้......",
		roleName = "Dr.Oak",
		roleName_en = "Dr.Oak",
		id = 1003,
		stage = 2,
		useRoleFigure = slot2[1003],
		offPos = slot3[1003]
	},
	[1004] = {
		showType = 2,
		force = 2,
		talkContent = "I can't wait any more, let's get started now!!!",
		talkContent_th = "อดใจรอไม่ไหวแล้ว มาเริ่มกันเลย!!!",
		talkContent_en = "I can't wait any more, let's get started now!!!",
		service = 1,
		id = 1004,
		stage = 2,
		useRoleFigure = {
			0
		}
	},
	__default = {
		__index = {
			showType = 1,
			startLevel = 1,
			gotoScene = 0,
			roleName_th = "",
			talkContent_en = "",
			roleName_en = "",
			talkContent_th = "",
			showAward = false,
			roleName = "",
			service = 0,
			talkContent = "",
			order = 0,
			anyPosCancel = false,
			animateAngle = 0,
			force = 1,
			startGate = 0,
			tagName = ({
				default = slot0[1]
			}).default,
			choices = ({
				default = slot0[1]
			}).default
		}
	}
}

return csv.new_guide_local
