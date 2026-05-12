slot0 = {
	{
		__size = 0
	},
	{
		__size = 1,
		buff = {
			210
		}
	},
	__size = 16,
	[6] = {
		__size = 1,
		buff = {
			1038
		}
	},
	[7] = {
		__size = 1,
		items = {
			gold = 5000,
			__size = 1
		}
	},
	[8] = {
		__size = 1,
		buff = {
			212,
			213
		}
	},
	[9] = {
		__size = 1,
		buff = {
			1039
		}
	},
	[10] = {
		__size = 1,
		buff = {
			200
		}
	},
	[11] = {
		__size = 1,
		items = {
			gold = 15000,
			__size = 1
		}
	},
	[13] = {
		__size = 1,
		buff = {
			200,
			215
		}
	},
	[14] = {
		__size = 1,
		buff = {
			1057
		}
	},
	[20] = {
		__size = 1,
		items = {
			gold = 6000,
			__size = 1
		}
	},
	[21] = {
		__size = 1,
		items = {
			__size = 1,
			rmb = 10
		}
	},
	[23] = {
		__size = 1,
		buff = {
			1052
		}
	},
	[28] = {
		__size = 1,
		buff = {
			214
		}
	},
	[29] = {
		__size = 1,
		buff = {
			200,
			211
		}
	},
	[49] = {
		__size = 2,
		points = 50,
		items = {
			gold = 5000,
			__size = 1
		}
	}
}
slot1 = {
	[13] = slot0[7],
	[12] = slot0[20],
	[22] = slot0[23],
	default = slot0[1],
	[2] = slot0[6],
	[5] = slot0[11],
	[6] = slot0[10],
	[9] = slot0[11],
	[1002] = slot0[21],
	[1000] = slot0[20]
}
slot2 = {
	[24] = slot0[23],
	[12] = slot0[21],
	[15] = slot0[11],
	[14] = slot0[8],
	[22] = slot0[9],
	[19] = slot0[29],
	[18] = slot0[29],
	[29] = slot0[2],
	default = slot0[1],
	[3] = slot0[8],
	[5] = slot0[10],
	[4] = slot0[7],
	[7] = slot0[11],
	[8] = slot0[13],
	[1000] = slot0[49],
	[1002] = slot0[20],
	[1001] = slot0[20],
	[21] = slot0[14]
}
slot3 = {
	slot0[2],
	default = slot0[1],
	[21] = slot0[6],
	[23] = slot0[2],
	[28] = slot0[13],
	[29] = slot0[13],
	[3] = slot0[7],
	[5] = slot0[7],
	[4] = slot0[9],
	[7] = slot0[13],
	[6] = slot0[7],
	[9] = slot0[14],
	[8] = slot0[11],
	[10] = slot0[7],
	[13] = slot0[7],
	[12] = slot0[20],
	[15] = slot0[23],
	[19] = slot0[28],
	[18] = slot0[28],
	[30] = slot0[28],
	[1002] = slot0[49],
	[1001] = slot0[49]
}
csv.random_tower.event = {
	{
		choice1_en = "Place the statue properly",
		name = "Exquisite Statue",
		choice1_th = "วางพระให้เรียบร้อย",
		resultDesc1_th = "คุณได้รับพรจากรูปปั้น HP ของโปเกมอนทั้งหมดในสนามรบได้รับการฟื้นฟูอย่างเต็มที่",
		group = 2,
		desc_th = "รูปปั้นละเอียดอ่อนล้มลงกับพื้น และดูเหมือนว่ามีแสงสีทองส่องอยู่ภายในรูปปั้น",
		choice1 = "Place the statue properly",
		desc = "A delicate statue fell to the ground, and it seemed that golden light was shining inside the statue.",
		resultDesc2_th = "คุณได้รับเหรียญ แต่ถูกสาป ทำให้ HP ทั้งหมดที่ต่อสู้กับโปเกมอนลดลง 20%",
		name_en = "Exquisite Statue",
		choice3 = "Turn a blind eye",
		choice3_th = "เมิน",
		resultDesc3 = "Nothing happened",
		resultDesc3_en = "Nothing happened",
		choice2_en = "Smash it",
		onlyOne = true,
		choice3_en = "Turn a blind eye",
		resultDesc2_en = "You get coins, but are cursed, causing the HP all battling Pokémons to reduce by 20%",
		resultDesc1 = "You receive blessings from the statue, HP of all Pokémons on battlefield is fully restored",
		desc_en = "A delicate statue fell to the ground, and it seemed that golden light was shining inside the statue.",
		resultDesc2 = "You get coins, but are cursed, causing the HP all battling Pokémons to reduce by 20%",
		resultDesc3_th = "ไม่มีอะไรเกิดขึ้น",
		choice1_kr = "조각상을 원래대로 둔다",
		choice2 = "Smash it",
		name_th = "รูปปั้นที่สวยงาม",
		id = 1,
		result1 = slot3[1],
		result2 = {
			__size = 2,
			buff = {
				201
			},
			items = {
				gold = 5000,
				__size = 1
			}
		}
	},
	{
		choice1_en = "Place the statue properly",
		name = "Strange Statue",
		choice1_th = "วางพระให้เรียบร้อย",
		resultDesc1_th = "คุณได้รับพรจากรูปปั้น ค่าความโกรธของโปเกมอนทั้งหมดในสนามรบได้รับการฟื้นฟูอย่างเต็มที่",
		group = 2,
		desc_th = "รูปปั้นแปลก ๆ ล้มลงกับพื้น และดูเหมือนว่ามีแสงระยิบระยับอยู่ภายในรูปปั้น",
		choice1 = "Place the statue properly",
		desc = "A strange statue fell to the ground, and it seemed that sparkly light was shining inside the statue.",
		resultDesc2_th = "คุณได้รับเหรียญ แต่ถูกสาป ทำให้เสียค่าความโกรธของโปเกมอนในสนามรบ",
		name_en = "Strange Statue",
		choice3 = "Turn a blind eye",
		choice3_th = "เมิน",
		resultDesc3 = "The statue gives out a faint light, and you seem to have received blessing after it is  attached to your body. In the next battle, allied Pokémons get a 100% chance of damage bonus after knocking down enemies for 2 turns",
		resultDesc3_en = "The statue gives out a faint light, and you seem to have received blessing after it is  attached to your body. In the next battle, allied Pokémons get a 100% chance of damage bonus after knocking down enemies for 2 turns",
		choice2_en = "Smash it",
		onlyOne = true,
		choice3_en = "Turn a blind eye",
		resultDesc2_en = "You get coins, but are cursed, losing all rage value of the Pokémons on the battlefield",
		resultDesc1 = "You receive blessings from the statue, rage value of all Pokémons on battlefield is fully restored",
		desc_en = "A strange statue fell to the ground, and it seemed that sparkly light was shining inside the statue.",
		resultDesc2 = "You get coins, but are cursed, losing all rage value of the Pokémons on the battlefield",
		resultDesc3_th = "รูปปั้นให้แสงสว่างจาง ๆ และดูเหมือนว่าคุณได้รับพรหลังจากติดอยู่บนร่างกายของคุณ ในการต่อสู้ครั้งต่อไป โปเกมอนฝ่ายเดียวกันจะได้รับโบนัสความเสียหาย 100% หลังจากล้มศัตรูเป็นเวลา 2 เทิร์น",
		choice1_kr = "조각상을 원래대로 둔다",
		choice2 = "Smash it",
		name_th = "รูปปั้นประหลาด",
		id = 2,
		result1 = {
			__size = 1,
			buff = {
				211
			}
		},
		result2 = {
			__size = 2,
			buff = {
				205
			},
			items = {
				gold = 5000,
				__size = 1
			}
		},
		result3 = slot1[2]
	},
	{
		choice1_en = "Console him",
		name = "Ferocious Roadblocking Monster",
		choice1_th = "ปลอบใจเขา",
		resultDesc1_th = "Snorlax ยังคงผล็อยหลับไป ดูเหมือนว่าหีบสมบัติจะถูกวางไว้ข้างหลังเขา",
		name_en = "Ferocious Roadblocking Monster",
		desc_th = "คุณบังเอิญปลุก Snorlax ที่กำลังหลับใหล",
		name_th = "สัตว์ประหลาดที่ขวางทางอย่างดุร้าย",
		desc = "You accidentally awakened the sleeping Snorlax",
		resultDesc2_th = "Snorlax กำลังโหมกระหน่ำ มันส่งเสียงคำรามดังจนคุณตกใจ P.ATK และ SP.ATK ลดลง 10% คะแนนความโกรธของโปเกมอนในสนามรบก็ลดลงเช่นกัน",
		resultDesc2 = "Snorlax is raging, it gives out a loud roar that frightens you. P.ATK and SP.ATK is reduced by 10%, the rage points of the Pokémons on the battlefield reduce as well.",
		choice2_en = "Hide",
		resultDesc2_en = "Snorlax is raging, it gives out a loud roar that frightens you. P.ATK and SP.ATK is reduced by 10%, the rage points of the Pokémons on the battlefield reduce as well.",
		resultDesc1 = "Snorlax continues to fall asleep, a treasure chest seems to be placed behind him",
		desc_en = "You accidentally awakened the sleeping Snorlax",
		limit = 3,
		choice1_kr = "쓰다듬어 준다",
		choice2 = "Hide",
		choice1 = "Console him",
		id = 3,
		result1 = slot3[3],
		result2 = slot2[3]
	},
	{
		choice1_en = "Listening Attentively",
		name = "Hidden mystery",
		choice1_th = "ตั้งใจฟัง",
		resultDesc1_th = "หลังจากได้ยินเสียงของ Meloetta ในการเริ่มต้นการต่อสู้ครั้งต่อไป โปเกมอนพันธมิตรที่ทำการเคลื่อนไหวครั้งแรกจะสร้างความเสียหายสองเท่า",
		group = 2,
		desc_th = "ที่นี้ว่างเปล่าแต่เหมือนได้ยินเสียงแผ่วเบา",
		name_en = "Hidden mystery",
		desc = "It's empty here, but seems like a faint sound can be heard",
		resultDesc2_th = "คุณพบหีบที่ดูเหมือนจะบรรจุอะไรบางอย่าง",
		name_th = "ความลึกลับที่ซ่อนอยู่",
		choice2_en = "Look around",
		resultDesc2_en = "You found a chest that seems to contain something",
		resultDesc1 = "After hearing Meloetta's voice, at the beginning of the next battle, the allied Pokémon that makes the first move deals double damage",
		desc_en = "It's empty here, but seems like a faint sound can be heard",
		resultDesc2 = "You found a chest that seems to contain something",
		choice1_kr = "귀 기울여 듣는다",
		choice2 = "Look around",
		choice1 = "Listening Attentively",
		id = 4,
		result1 = slot3[4],
		result2 = slot2[4]
	},
	{
		choice1_en = "Throw a stone",
		name = "Mysterious chest",
		choice1_th = "ขว้างก้อนหิน",
		resultDesc1_th = "หีบสมบัติเปิดปากขนาดใหญ่ของมันและกลืนหินเข้าไป แต่ดูเหมือนว่ามันจะกระแทกฟันและหย่อนเหรียญถุงเล็กๆ",
		group = 2,
		desc_th = "เจอหน้าอกที่ดูแปลกๆ",
		name_en = "Mysterious chest",
		desc = "You found a chest that looks kinda weird",
		resultDesc2_th = "มันคือมอนสเตอร์หน้าอก HP ของการต่อสู้โปเกมอนลดลง",
		name_th = "หีบลึกลับ",
		choice3 = "Beware ahead",
		choice3_th = "ระวังข้างหน้า",
		resultDesc3 = "You get one chest",
		resultDesc3_en = "You get one chest",
		choice2_en = "Go and check it out",
		resultDesc3_th = "คุณได้รับหนึ่งหีบ",
		choice3_en = "Beware ahead",
		resultDesc2_en = "It's actually a chest monster, HP of battling Pokémons has reduced",
		resultDesc1 = "The treasure chest opened its huge mouth and swallowed the stone, but it seems to have knocked its teeth and dropped a small bag of coins",
		desc_en = "You found a chest that looks kinda weird",
		resultDesc2 = "It's actually a chest monster, HP of battling Pokémons has reduced",
		choice1_kr = "돌을 던져본다",
		choice2 = "Go and check it out",
		choice1 = "Throw a stone",
		id = 5,
		result1 = slot3[5],
		result2 = slot2[5],
		result3 = slot1[5]
	},
	{
		choice1_en = "Throw a stone",
		name = "Mysterious chest",
		choice1_th = "ขว้างก้อนหิน",
		resultDesc1_th = "หีบสมบัติเปิดปากขนาดใหญ่ของมันและกลืนหินเข้าไป แต่ดูเหมือนว่ามันจะกระแทกฟันและหย่อนเหรียญถุงเล็กๆ",
		group = 2,
		desc_th = "เจอหน้าอกที่ดูแปลกๆ",
		name_en = "Mysterious chest",
		desc = "You found a chest that looks kinda weird",
		resultDesc2_th = "คุณได้รับหนึ่งหีบ",
		name_th = "หีบลึกลับ",
		choice3 = "Beware ahead",
		choice3_th = "ระวังข้างหน้า",
		resultDesc3 = "It's actually a chest monster, HP of battling Pokémons has reduced",
		resultDesc3_en = "It's actually a chest monster, HP of battling Pokémons has reduced",
		choice2_en = "Go and check it out",
		resultDesc3_th = "มันคือมอนสเตอร์หน้าอก HP ของการต่อสู้โปเกมอนลดลง",
		choice3_en = "Beware ahead",
		resultDesc2_en = "You get one chest",
		resultDesc1 = "The treasure chest opened its huge mouth and swallowed the stone, but it seems to have knocked its teeth and dropped a small bag of coins",
		desc_en = "You found a chest that looks kinda weird",
		resultDesc2 = "You get one chest",
		choice1_kr = "돌을 던져본다",
		choice2 = "Go and check it out",
		choice1 = "Throw a stone",
		id = 6,
		result1 = slot3[6],
		result2 = {
			__size = 1,
			items = {
				gold = 9000,
				__size = 1
			}
		},
		result3 = slot1[6]
	},
	{
		choice1_en = "Say hello",
		name = "An Encounter with Team Rocket",
		choice1_th = "พูดสวัสดี",
		resultDesc1_th = "ทั้งสามคนตกใจและการต่อสู้ก็เกิดขึ้น HP ของการต่อสู้โปเกมอนลดลง 10% แต่ระดับความโกรธเพิ่มขึ้น",
		name_en = "An Encounter with Team Rocket",
		desc_th = "คุณพบทีม Rocket ทั้งสามคนที่มีพฤติกรรมน่าสงสัย",
		choice1 = "Say hello",
		desc = "You found the Team Rocket trio who are behaving suspiciously",
		resultDesc2_th = "ดูเหมือนว่าพวกเขาจะพบบางสิ่งที่มีค่าและจากไป ตามรอย คุณยังพบเหรียญที่เหลืออยู่ คุณได้รับ 15,000 เหรียญ",
		choice2_en = "Observe secretly",
		resultDesc2_en = "They seem to have found something valuable and left. Following the traces, you also found some remaining coins. You get 15,000 coins.",
		resultDesc1 = "The trio is startled and a battle ensued. HP of battling Pokémons reduces by 10%, but rage level has increased",
		desc_en = "You found the Team Rocket trio who are behaving suspiciously",
		resultDesc2 = "They seem to have found something valuable and left. Following the traces, you also found some remaining coins. You get 15,000 coins.",
		choice1_kr = "다가가 인사를 한다",
		choice2 = "Observe secretly",
		name_th = "การเผชิญหน้ากับทีม Rocket",
		id = 7,
		result1 = slot3[7],
		result2 = slot2[7]
	},
	{
		choice1_en = "Say hello",
		name = "An Encounter with Team Rocket",
		choice1_th = "พูดสวัสดี",
		resultDesc1_th = "ทั้งสามคนตกใจและวิ่งหนีไปอย่างรวดเร็ว ในการหลบหนีอย่างเร่งรีบ ดูเหมือนว่าพวกเขาจะทิ้งเหรียญไว้บ้าง",
		name_en = "An Encounter with Team Rocket",
		desc_th = "คุณพบทีม Rocket ทั้งสามคนที่มีพฤติกรรมน่าสงสัย",
		choice1 = "Say hello",
		desc = "You found the Team Rocket trio who are behaving suspiciously",
		resultDesc2_th = "คุณถูกค้นพบและไม่มีทางเลือกอื่นนอกจากต้องต่อสู้ HP ของการต่อสู้โปเกมอนลดลง 10% แต่ระดับความโกรธเพิ่มขึ้น",
		choice2_en = "Observe secretly",
		resultDesc2_en = "You've been discovered and have no chpice but to battle. HP of battling Pokémons reduces by 10%, but rage level has increased",
		resultDesc1 = "The trio is startled and ran away swiftly. In their hasty escape, they seem to have left behind some coins",
		desc_en = "You found the Team Rocket trio who are behaving suspiciously",
		resultDesc2 = "You've been discovered and have no chpice but to battle. HP of battling Pokémons reduces by 10%, but rage level has increased",
		choice1_kr = "다가가 인사를 한다",
		choice2 = "Observe secretly",
		name_th = "การเผชิญหน้ากับทีม Rocket",
		id = 8,
		result1 = slot3[8],
		result2 = slot2[8]
	},
	{
		choice1_en = "Who are you",
		name = "Mysterious man",
		choice1_th = "คุณคือใคร",
		resultDesc1_th = "ชายลึกลับเปิดเผยตัวตนของเขาและหยิบอัญมณีออกมา - เขาเป็นนักสำรวจจริงๆ คุณรับอัญมณีและรับพรจากมัน ในการต่อสู้ครั้งต่อไป โปเกมอนฝ่ายเดียวกันจะได้รับค่าความโกรธเริ่มต้นที่ 1,000",
		group = 2,
		desc_th = "จู่ๆก็เจอคนหน้าตาน่าสงสัยเข้ามาหา",
		name_en = "Mysterious man",
		desc = "You suddenly meet a suspicious-looking person and approached him",
		resultDesc2_th = "ชายลึกลับชี้ไปที่ทิศทางหนึ่ง และขณะที่เดินไปตามทิศทางนั้น คุณพบอุปกรณ์แปลก ๆ คุณเปิดใช้งานอุปกรณ์และรับคะแนนพิเศษ 200 คะแนน",
		name_th = "ชายลึกลับ",
		choice3 = "Where are you going?",
		choice3_th = "คุณกำลังจะไปไหน?",
		resultDesc3 = "The mysterious man took a bag out of his pocket and gave it to you instead of telling you. (You get a small reward)",
		resultDesc3_en = "The mysterious man took a bag out of his pocket and gave it to you instead of telling you. (You get a small reward)",
		choice2_en = "Where are you from?",
		resultDesc3_th = "ชายลึกลับหยิบกระเป๋าออกมาจากกระเป๋าของเขาแล้วส่งให้คุณแทนที่จะบอกคุณ (คุณจะได้รับผลตอบแทนเล็กน้อย)",
		choice3_en = "Where are you going?",
		resultDesc2_en = "The mysterious man pointed at a direction, and while following that direction, you found a strange device. You activated the device and get 200 extra points.",
		resultDesc1 = "The mysterious man revealed his identity and takes out a gem - he is actually an explorer. You take the gem and receive blessings from it. In the subsequent battle, allied Pokémons receive a initial rage value of 1000.",
		desc_en = "You suddenly meet a suspicious-looking person and approached him",
		resultDesc2 = "The mysterious man pointed at a direction, and while following that direction, you found a strange device. You activated the device and get 200 extra points.",
		choice1_kr = "당신은 누구세요?",
		choice2 = "Where are you from?",
		choice1 = "Who are you",
		id = 9,
		result1 = slot3[9],
		result2 = {
			__size = 1,
			points = 200
		},
		result3 = slot1[9]
	},
	{
		choice1_en = "Investigate the cause",
		name = "Mysterious Power",
		choice1_th = "สืบหาสาเหตุ",
		resultDesc1_th = "คุณปิดอุปกรณ์กีดขวางสำเร็จและได้รับรางวัล",
		group = 2,
		desc_th = "ดูเหมือนมีพลังลึกลับที่ขัดขวางไม่ให้คุณก้าวต่อไป",
		name_en = "Mysterious Power",
		desc = "Seems like there's a mysterious power that is hindering you from moving on",
		name_th = "พลังลึกลับ",
		resultDesc2_th = "คุณพบเส้นทางใหม่และเดินต่อไปตามปกติ (ไม่มีอะไรเกิดขึ้น)",
		choice3 = "Go courageously",
		choice3_th = "ไปอย่างกล้าหาญ",
		resultDesc3 = "A certain switch seems to be triggered, current HP of battling Pokémon reduces by 20%, and rage value increases by 50%",
		resultDesc3_en = "A certain switch seems to be triggered, current HP of battling Pokémon reduces by 20%, and rage value increases by 50%",
		resultDesc3_th = "ดูเหมือนว่าสวิตช์บางอย่างจะทำงาน HP ปัจจุบันของโปเกมอนต่อสู้ลดลง 20% และค่าความโกรธเพิ่มขึ้น 50%",
		choice2_en = "Taking a Detour",
		choice3_en = "Go courageously",
		resultDesc2_en = "You found a new path and went ahead normally (nothing happened)",
		resultDesc1 = "You've successfully closed the obstruction device and received a reward",
		desc_en = "Seems like there's a mysterious power that is hindering you from moving on",
		resultDesc2 = "You found a new path and went ahead normally (nothing happened)",
		choice1_kr = "원인을 조사한다",
		choice2 = "Taking a Detour",
		choice1 = "Investigate the cause",
		id = 10,
		result1 = slot3[10],
		result3 = {
			__size = 1,
			buff = {
				200,
				206
			}
		}
	},
	{
		choice1_en = "I wanna get stronger",
		name = "Wish Maker",
		choice1_th = "ฉันอยากแข็งแกร่งขึ้น",
		resultDesc1_th = "ในการเริ่มต้นการต่อสู้ครั้งต่อไป จะมีโอกาส 15% ที่ HP ปัจจุบันของคู่ต่อสู้จะลดลงครึ่งหนึ่ง มันจะถูกเรียกใช้ในการรบครั้งแรกเท่านั้น และจะไม่ถูกเรียกใช้ในการรบต่อๆ ไป",
		group = 3,
		desc_th = "คุณเจอจิราจิอารมณ์ดีเหมือนกำลังถามถึงความปรารถนาของคุณ",
		choice1 = "I wanna get stronger",
		desc = "You encounter a Jirachi which is in a very good mood, it seems to be asking about your wish.",
		resultDesc2 = "You get 50 diamonds",
		resultDesc2_th = "คุณได้รับ 50 เพชร",
		name_en = "Wish Maker",
		choice3 = "I want money",
		choice3_th = "ฉันต้องการเงิน",
		resultDesc3 = "You get plenty of money",
		choice2_en = "I want some diamonds",
		onlyOne = true,
		choice3_en = "I want money",
		resultDesc2_en = "You get 50 diamonds",
		resultDesc1 = "At the beginning of the next battle, there will be a 15% chance the opponent’s current HP will be reduced by half. It will only be triggered when the on the first battle, and not be triggered in the subsequent battles",
		desc_en = "You encounter a Jirachi which is in a very good mood, it seems to be asking about your wish.",
		limit = 1,
		resultDesc3_en = "You get plenty of money",
		choice1_kr = "나는 강해질 거야",
		choice2 = "I want some diamonds",
		name_th = "Wish Maker",
		id = 11,
		resultDesc3_th = "ได้เงินมากมาย",
		result1 = {
			__size = 1,
			buff = {
				1040
			}
		},
		result2 = {
			__size = 1,
			items = {
				__size = 1,
				rmb = 50
			}
		},
		result3 = {
			__size = 1,
			items = {
				gold = 25000,
				__size = 1
			}
		}
	},
	{
		choice1_en = "I wanna get stronger",
		name = "Wish Maker?",
		choice1_th = "ฉันอยากแข็งแกร่งขึ้น",
		resultDesc1_th = "จิราจิแปลงร่างกลับเป็น Ditto และไม่มีอะไรเกิดขึ้น…...................... เดี๋ยวก่อน ดูเหมือนว่าจะเหลือเหรียญไว้บ้าง",
		group = 2,
		desc_th = "คุณพบจิราจิที่อารมณ์ดี ดูเหมือนว่าจะถามถึงความปรารถนาของคุณ",
		name_en = "Wish Maker?",
		desc = "You encounter a Jirachi which is in an okay mood, it seems to be asking about your wish.",
		resultDesc2_th = "จิราจิแปลงร่างกลับเป็น Ditto และไม่มีอะไรเกิดขึ้น…...................... เดี๋ยวก่อน ดูเหมือนว่ามันได้ทิ้งเพชรไว้บ้างแล้ว",
		name_th = "Wish Maker?",
		choice3 = "I want money",
		choice3_th = "ฉันต้องการเงิน",
		resultDesc3 = "Jirachi transformed back into Ditto, and nothing happened…...................... Wait, seems like it has left behind some coins",
		resultDesc3_en = "Jirachi transformed back into Ditto, and nothing happened…...................... Wait, seems like it has left behind some coins",
		choice2_en = "I want some diamonds",
		resultDesc3_th = "จิราจิแปลงร่างกลับเป็น Ditto และไม่มีอะไรเกิดขึ้น…...................... เดี๋ยวก่อน ดูเหมือนว่าจะเหลือเหรียญไว้บ้าง",
		choice3_en = "I want money",
		resultDesc2_en = "Jirachi transformed back into Ditto, and nothing happened…...................... Wait, seems like it has left behind some diamonds",
		resultDesc1 = "Jirachi transformed back into Ditto, and nothing happened…...................... Wait, seems like it has left behind some coins",
		desc_en = "You encounter a Jirachi which is in an okay mood, it seems to be asking about your wish.",
		resultDesc2 = "Jirachi transformed back into Ditto, and nothing happened…...................... Wait, seems like it has left behind some diamonds",
		choice1_kr = "나는 강해질 거야",
		choice2 = "I want some diamonds",
		choice1 = "I wanna get stronger",
		id = 12,
		result1 = slot3[12],
		result2 = slot2[12],
		result3 = slot1[12]
	},
	{
		choice1_en = "I wanna get stronger",
		name = "Wish Maker?",
		choice1_th = "ฉันอยากแข็งแกร่งขึ้น",
		resultDesc1_th = "จิราจิแปลงร่างกลับเป็น Ditto และไม่มีอะไรเกิดขึ้น…...................... เดี๋ยวก่อน ดูเหมือนว่าจะเหลือเหรียญไว้บ้าง",
		name_en = "Wish Maker?",
		desc_th = "คุณเจอจิราจิอารมณ์ไม่ดี ดูเหมือนกำลังถามถึงความปรารถนาของคุณ",
		choice1 = "I wanna get stronger",
		desc = "You encounter a Jirachi which is in an extremely bad mood, it seems to be asking about your wish.",
		resultDesc2_th = "จิราจิแปลงร่างกลับเป็น Ditto และไม่มีอะไรเกิดขึ้น…...................... เดี๋ยวก่อน ดูเหมือนว่ามันได้ทิ้งเพชรไว้บ้างแล้ว",
		choice3 = "I want money",
		choice3_th = "ฉันต้องการเงิน",
		resultDesc3 = "Jirachi transformed back into Ditto, and nothing happened…...................... Wait, seems like it has left behind some coins",
		resultDesc3_en = "Jirachi transformed back into Ditto, and nothing happened…...................... Wait, seems like it has left behind some coins",
		resultDesc3_th = "จิราจิแปลงร่างกลับเป็น Ditto และไม่มีอะไรเกิดขึ้น…...................... เดี๋ยวก่อน ดูเหมือนว่าจะเหลือเหรียญไว้บ้าง",
		choice2_en = "I want some diamonds",
		choice3_en = "I want money",
		resultDesc2_en = "Jirachi transformed back into Ditto, and nothing happened…...................... Wait, seems like it has left behind some diamonds",
		resultDesc1 = "Jirachi transformed back into Ditto, and nothing happened…...................... Wait, seems like it has left behind some coins",
		desc_en = "You encounter a Jirachi which is in an extremely bad mood, it seems to be asking about your wish.",
		resultDesc2 = "Jirachi transformed back into Ditto, and nothing happened…...................... Wait, seems like it has left behind some diamonds",
		choice1_kr = "나는 강해질 거야",
		choice2 = "I want some diamonds",
		name_th = "Wish Maker?",
		id = 13,
		result1 = slot3[13],
		result2 = {
			__size = 1,
			items = {
				__size = 1,
				rmb = 5
			}
		},
		result3 = slot1[13]
	},
	{
		choice1_en = "Wake it up",
		name = "Ferocious Roadblocking Monster",
		choice1_th = "ตื่นได้แล้ว",
		resultDesc1_th = "เขิลทิ้งไปอย่างไม่เต็มใจ",
		name_en = "Ferocious Roadblocking Monster",
		desc_th = "สเลกกิ้งยักษ์ขวางทางเหมือนหลับสนิท",
		choice1 = "Wake it up",
		desc = "A giant Slaking has blocked their path, it seems to be sleeping soundly",
		resultDesc2_th = "Slaking ทำการโต้กลับ ลดโบนัสการโจมตีของโปเกมอนทั้งหมด 5%",
		choice2_en = "Wake it up",
		resultDesc2_en = "Slaking makes a counterattack, reducing the attack bonus of all Pokémons by 5%",
		resultDesc1 = "Slaking left unwillingly",
		desc_en = "A giant Slaking has blocked their path, it seems to be sleeping soundly",
		resultDesc2 = "Slaking makes a counterattack, reducing the attack bonus of all Pokémons by 5%",
		choice1_kr = "깨운다",
		choice2 = "Wake it up",
		name_th = "สัตว์ประหลาดที่ขวางทางอย่างดุร้าย",
		id = 14,
		result2 = slot2[14]
	},
	{
		choice1_en = "Wake it up",
		name = "Ferocious Roadblocking Monster",
		choice1_th = "ตื่นได้แล้ว",
		resultDesc1_th = "Slaking ตื่นขึ้นมาและทำให้คุณจูบ คุณได้รับพรของเขา - ศัตรูทั้งหมดจะถูกใบ้ 1 เทิร์นเมื่อเริ่มการต่อสู้ครั้งต่อไป",
		group = 2,
		desc_th = "สเลกกิ้งยักษ์ขวางทางเหมือนหลับสนิท",
		name_en = "Ferocious Roadblocking Monster",
		desc = "A giant Slaking has blocked their path, it seems to be sleeping soundly",
		resultDesc2_th = "Slaking วิ่งหนีไปเพราะกลัวความเจ็บปวด แต่ดูเหมือนมีของแปลก ๆ อยู่ข้างใต้",
		name_th = "สัตว์ประหลาดที่ขวางทางอย่างดุร้าย",
		choice2_en = "Wake it up",
		resultDesc2_en = "Slaking ran away as it is afraid of pain, but there seemed to be a bunch of strange items underneath it.",
		resultDesc1 = "Slaking wakes up and gives you a smooch. You receive his blessings - All enemies are silenced for 1 turn at the beginning of the next battle",
		desc_en = "A giant Slaking has blocked their path, it seems to be sleeping soundly",
		resultDesc2 = "Slaking ran away as it is afraid of pain, but there seemed to be a bunch of strange items underneath it.",
		choice1_kr = "깨운다",
		choice2 = "Wake it up",
		choice1 = "Wake it up",
		id = 15,
		result1 = slot3[15],
		result2 = slot2[15]
	},
	{
		choice1_en = "Give him the money",
		name = "Anxious person",
		choice1_th = "ให้เงินเขา",
		resultDesc1_th = "เขายอมรับมันอย่างมีความสุขและมอบหินลึกลับให้คุณ ศัตรูทั้งหมดผล็อยหลับไป 1 เทิร์นในการต่อสู้ครั้งต่อไป",
		group = 2,
		desc_th = "คุณพบใครบางคนที่เดินไปมาอย่างกระวนกระวายใจ เขาเข้าหาคุณและขอเงินเพื่อซื้อไอศกรีม",
		name_en = "Anxious person",
		desc = "You meet someone who is walking around anxiously. He approaches you and asks for some money to buy an ice cream",
		name_th = "คนขี้กังวล",
		resultDesc2_th = "เขาจากไปด้วยความผิดหวัง",
		choice3 = "Hit him away",
		choice3_th = "ตีเขาไป",
		resultDesc3 = "The Poké ball in his hand flashed, and a Gyarados appeared from it. As your Pokémons are frightened, their rage value has been reset to zero",
		resultDesc3_en = "The Poké ball in his hand flashed, and a Gyarados appeared from it. As your Pokémons are frightened, their rage value has been reset to zero",
		resultDesc3_th = "ลูกบอล Poké ในมือของเขาส่องแสง และ Gyarados ก็ปรากฏขึ้นจากมัน เมื่อโปเกมอนของคุณหวาดกลัว ค่าความโกรธของพวกมันก็ถูกรีเซ็ตเป็นศูนย์",
		choice2_en = "Reject him politely",
		choice3_en = "Hit him away",
		resultDesc2_en = "He left in disappointment",
		resultDesc1 = "He accepts it happily and gives you a mysterious stone. All enemies fall asleep for 1 turn in the next battle",
		desc_en = "You meet someone who is walking around anxiously. He approaches you and asks for some money to buy an ice cream",
		resultDesc2 = "He left in disappointment",
		choice1_kr = "돈을 준다",
		choice2 = "Reject him politely",
		choice1 = "Give him the money",
		id = 16,
		result1 = {
			__size = 1,
			buff = {
				1053
			}
		},
		result3 = {
			__size = 1,
			buff = {
				205
			}
		}
	},
	{
		choice1_en = "Waiting for the owner",
		name = "The value of honesty?",
		choice1_th = "รอเจ้าของ",
		resultDesc1_th = "พอเจ้าของเห็นก็ให้เหรียญเล็กๆ แทนคำขอบคุณ",
		group = 3,
		desc_th = "คุณพบกระเป๋าเงินอยู่ที่พื้น",
		name_en = "The value of honesty?",
		desc = "You found a wallet on the ground",
		resultDesc2_th = "คุณได้รับเหรียญมากขึ้น แต่ค่าความโกรธของโปเกมอนของคุณว่างเปล่าเนื่องจากรู้สึกผิดเกี่ยวกับมัน",
		name_th = "คุณค่าของความซื่อสัตย์?",
		choice3 = "Ignore",
		choice3_th = "ไม่สนใจ",
		resultDesc3 = "Nothing happened",
		resultDesc3_en = "Nothing happened",
		choice2_en = "Accept it secretly",
		resultDesc3_th = "ไม่มีอะไรเกิดขึ้น",
		choice3_en = "Ignore",
		resultDesc2_en = "You get more coins but the rage value of your Pokémons empties as they feel guilty about it",
		resultDesc1 = "When the owner saw it, as a gesture of gratitude he gave you a small amount of coins",
		desc_en = "You found a wallet on the ground",
		resultDesc2 = "You get more coins but the rage value of your Pokémons empties as they feel guilty about it",
		choice1_kr = "주인을 기다린다",
		choice2 = "Accept it secretly",
		choice1 = "Waiting for the owner",
		id = 17,
		result1 = {
			__size = 1,
			items = {
				gold = 10000,
				__size = 1
			}
		},
		result2 = {
			__size = 2,
			buff = {
				205
			},
			items = {
				gold = 25000,
				__size = 1
			}
		}
	},
	{
		choice1_en = "Listen to it singing",
		name = "Jigglypuff's Song",
		choice1_th = "ฟังมันร้องเพลง",
		resultDesc1_th = "คุณหลับสนิทและพักผ่อนให้เพียงพอ HP ของโปเกมอนฟื้นฟู 20%",
		group = 2,
		desc_th = "เห็น Jigglypuff เตรียมตัวร้องเพลง",
		name_en = "Jigglypuff's Song",
		desc = "Saw a Jigglypuff getting ready to sing",
		resultDesc2_th = "Jigglypuff โกรธมากและใช้ Double Slap HP ของโปเกมอนที่ต่อสู้ทั้งหมดลดลงแต่ได้รับค่าความโกรธ",
		name_th = "เพลงของ Jigglypuff",
		choice3 = "Run away",
		choice3_th = "หนีไป",
		resultDesc3 = "You've escaped from Jigglypuff's power",
		resultDesc3_en = "You've escaped from Jigglypuff's power",
		choice2_en = "Stop it",
		resultDesc3_th = "คุณได้หลุดพ้นจากพลังของ Jigglypuff แล้ว",
		choice3_en = "Run away",
		resultDesc2_en = "Jigglypuff is very angry and used Double Slap. HP of all battling Pokémons reduces but gained rage value",
		resultDesc1 = "You fell asleep soundly and got enough rest. HP of Pokémons recovers by 20%",
		desc_en = "Saw a Jigglypuff getting ready to sing",
		resultDesc2 = "Jigglypuff is very angry and used Double Slap. HP of all battling Pokémons reduces but gained rage value",
		choice1_kr = "노래를 듣는다",
		choice2 = "Stop it",
		choice1 = "Listen to it singing",
		id = 18,
		result1 = slot3[18],
		result2 = slot2[18]
	},
	{
		choice1_en = "Listen to it singing",
		name = "Jigglypuff's Song",
		choice1_th = "ฟังมันร้องเพลง",
		resultDesc1_th = "คุณหลับสนิทและพักผ่อนให้เพียงพอ HP ของโปเกมอนฟื้นฟู 20%",
		group = 2,
		desc_th = "เห็น Jigglypuff เตรียมตัวร้องเพลง",
		name_en = "Jigglypuff's Song",
		desc = "Saw a Jigglypuff getting ready to sing",
		resultDesc2_th = "Jigglypuff โกรธมากและใช้ Double Slap HP ของโปเกมอนที่ต่อสู้ทั้งหมดลดลงแต่ได้รับค่าความโกรธ",
		name_th = "เพลงของ Jigglypuff",
		choice3 = "Run away",
		choice3_th = "หนีไป",
		resultDesc3 = "But it was too late to flee, the allied Pokémons are affected by Jigglypuff and their HP recovery rate and rage level have reduced",
		resultDesc3_en = "But it was too late to flee, the allied Pokémons are affected by Jigglypuff and their HP recovery rate and rage level have reduced",
		choice2_en = "Stop it",
		resultDesc3_th = "แต่มันสายเกินไปที่จะหนี โปเกมอนพันธมิตรได้รับผลกระทบจาก Jigglypuff และอัตราการฟื้นฟู HP และระดับความโกรธลดลง",
		choice3_en = "Run away",
		resultDesc2_en = "Jigglypuff is very angry and used Double Slap. HP of all battling Pokémons reduces but gained rage value",
		resultDesc1 = "You fell asleep soundly and got enough rest. HP of Pokémons recovers by 20%",
		desc_en = "Saw a Jigglypuff getting ready to sing",
		resultDesc2 = "Jigglypuff is very angry and used Double Slap. HP of all battling Pokémons reduces but gained rage value",
		choice1_kr = "노래를 듣는다",
		choice2 = "Stop it",
		choice1 = "Listen to it singing",
		id = 19,
		result1 = slot3[19],
		result2 = slot2[19],
		result3 = {
			__size = 1,
			buff = {
				214,
				203
			}
		}
	},
	{
		choice1_en = "I dropped a Gold bag",
		name = "God?",
		choice1_th = "ฉันทำถุงทองตก",
		resultDesc1_th = "คุณได้รับเหรียญจำนวนมาก แต่ HP ของโปเกมอนในการต่อสู้ลดลง",
		group = 3,
		desc_th = "จู่ๆก็มีผู้ชายเรียกตัวเองว่าเทพมาถามว่าทำกระเป๋าตกมั้ย",
		choice1 = "I dropped a Gold bag",
		desc = "A man who calls himself a God suddenly appeared and asked if you had dropped a bag",
		resultDesc2 = "You get a huge amount of coins, but HP of the Pokémons in battle has reduced",
		resultDesc2_th = "คุณได้รับเหรียญจำนวนมาก แต่ HP ของโปเกมอนในการต่อสู้ลดลง",
		name_en = "God?",
		choice3 = "I have dropped nothing",
		choice3_th = "ฉันไม่ได้ทำอะไรตกเลย",
		resultDesc3 = "Honest kids are rewarded",
		choice2_en = "I dropped a Silver bag",
		onlyOne = true,
		choice3_en = "I have dropped nothing",
		resultDesc2_en = "You get a huge amount of coins, but HP of the Pokémons in battle has reduced",
		resultDesc1 = "You get a huge amount of coins, but HP of the Pokémons in battle has reduced",
		desc_en = "A man who calls himself a God suddenly appeared and asked if you had dropped a bag",
		limit = 1,
		resultDesc3_en = "Honest kids are rewarded",
		choice1_kr = "황금색 주머니를 잃어버렸습니다",
		choice2 = "I dropped a Silver bag",
		name_th = "พระเจ้า?",
		id = 20,
		resultDesc3_th = "เด็กที่ซื่อสัตย์ได้รับรางวัล",
		result1 = {
			__size = 2,
			buff = {
				202
			},
			items = {
				gold = 50000,
				__size = 1
			}
		},
		result2 = {
			__size = 2,
			buff = {
				201
			},
			items = {
				gold = 25000,
				__size = 1
			}
		},
		result3 = {
			__size = 1,
			items = {
				__size = 1,
				rmb = 20
			}
		}
	},
	{
		choice1_en = "Intense attack",
		name = "Wish",
		choice1_th = "การโจมตีที่รุนแรง",
		resultDesc1_th = "ในการต่อสู้ครั้งต่อไป โปเกมอนฝ่ายเดียวกันจะได้รับโบนัสความเสียหาย 100% หลังจากล้มศัตรูเป็นเวลา 2 เทิร์น",
		group = 3,
		desc_th = "บอกความปรารถนาของคุณมาสิ",
		name_en = "Wish",
		desc = "Here, tell me your wish",
		resultDesc2_th = "เมื่อการต่อสู้ครั้งต่อไปเริ่มขึ้น โปเกมอนฝ่ายเดียวกันจะได้รับคะแนนความโกรธ 1,000 คะแนน",
		name_th = "ประสงค์",
		choice3 = "Enjoy the Fruits of Others' Labor",
		choice3_th = "เพลิดเพลินกับผลไม้จากแรงงานของผู้อื่น",
		resultDesc3 = "At the beginning of the next battle, the enemy has a 50% chance of fainting instantly (the probability applies to individual enemy)",
		resultDesc3_en = "At the beginning of the next battle, the enemy has a 50% chance of fainting instantly (the probability applies to individual enemy)",
		choice2_en = "High speed",
		resultDesc3_th = "ในการเริ่มต้นการต่อสู้ครั้งต่อไป ศัตรูมีโอกาส 50% ที่จะเป็นลมทันที (ความน่าจะเป็นของศัตรูแต่ละคน)",
		choice3_en = "Enjoy the Fruits of Others' Labor",
		resultDesc2_en = "When the next battle begins, allied Pokémons will get an initial 1000 rage points",
		resultDesc1 = "In the next battle, allied Pokémons get a 100% chance of damage bonus after knocking down enemies for 2 turns",
		desc_en = "Here, tell me your wish",
		resultDesc2 = "When the next battle begins, allied Pokémons will get an initial 1000 rage points",
		choice1_kr = "강력한 공격",
		choice2 = "High speed",
		choice1 = "Intense attack",
		id = 21,
		result1 = slot3[21],
		result2 = slot2[21],
		result3 = {
			__size = 1,
			buff = {
				1041
			}
		}
	},
	{
		choice1_en = "Avoid fainting",
		name = "Wish",
		choice1_th = "หลีกเลี่ยงการเป็นลม",
		resultDesc1_th = "โปเกมอนฝ่ายเดียวกันจะฟื้นคืนชีพทันทีเมื่อถูกทำให้น็อค ฟื้น HP 50% และค่าความโกรธ 100% เอฟเฟกต์นี้สามารถใช้ได้เพียงครั้งเดียวเท่านั้น",
		group = 3,
		desc_th = "บอกความปรารถนาของคุณมาสิ",
		name_en = "Wish",
		desc = "Here, tell me your wish",
		resultDesc2_th = "ในการเริ่มต้นการต่อสู้ครั้งต่อไป โปเกมอนฝ่ายเดียวกันที่ทำการเคลื่อนไหวครั้งแรกจะสร้างความเสียหายสองเท่า",
		name_th = "ประสงค์",
		choice3 = "Status condition",
		choice3_th = "สภาพสถานะ",
		resultDesc3 = "All enemies are silence for 1 turn in the next battle",
		resultDesc3_en = "All enemies are silence for 1 turn in the next battle",
		choice2_en = "Intense attack",
		resultDesc3_th = "ศัตรูทั้งหมดเงียบ 1 เทิร์นในการต่อสู้ครั้งต่อไป",
		choice3_en = "Status condition",
		resultDesc2_en = "At the beginning of the next battle, the allied Pokémon that makes the first move deals double damage",
		resultDesc1 = "Allied Pokémons immediately revive when they are knocked out, restoring 50% HP and 100% rage value. This effect can only be used once.",
		desc_en = "Here, tell me your wish",
		resultDesc2 = "At the beginning of the next battle, the allied Pokémon that makes the first move deals double damage",
		choice1_kr = "죽음 면역",
		choice2 = "Intense attack",
		choice1 = "Avoid fainting",
		id = 22,
		result1 = {
			__size = 1,
			buff = {
				1047
			}
		},
		result2 = slot2[22],
		result3 = slot1[22]
	},
	{
		choice1_en = "I want to eat some meat",
		name = "Should you eat? Or not?",
		choice1_th = "อยากกินเนื้อ",
		resultDesc1_th = "ฟื้นฟู HP เต็มที่เมื่อต่อสู้กับโปเกมอน",
		group = 3,
		desc_th = "มีชายคนหนึ่งกำลังวางแผนที่จะย่าง Farfetch'd",
		choice1 = "I want to eat some meat",
		desc = "There is a man in front who is planning to grill the Farfetch'd",
		resultDesc2 = "In the last battle, all the enemies' rage level resets to zero during round 2 of the battle",
		resultDesc2_th = "ในการต่อสู้ครั้งสุดท้าย ระดับความโกรธของศัตรูทั้งหมดจะรีเซ็ตเป็นศูนย์ระหว่างรอบที่ 2 ของการต่อสู้",
		name_en = "Should you eat? Or not?",
		choice3 = "Rescue Farfetch'd",
		choice3_th = "กู้ภัย Farfetch'd",
		resultDesc3 = "Battle with that man before rescuing and releasing Farfetch'd, your battling Pokémons will increase HP by 10%. You will receive Farfetch'd's blessings where your Pokémons gets 30% more critical hit rate when using its Ultimate SKill for the first time",
		choice2_en = "I want scallions",
		onlyOne = true,
		choice3_en = "Rescue Farfetch'd",
		resultDesc2_en = "In the last battle, all the enemies' rage level resets to zero during round 2 of the battle",
		resultDesc1 = "Full recovery of HP for battling Pokémons",
		desc_en = "There is a man in front who is planning to grill the Farfetch'd",
		limit = 1,
		resultDesc3_en = "Battle with that man before rescuing and releasing Farfetch'd, your battling Pokémons will increase HP by 10%. You will receive Farfetch'd's blessings where your Pokémons gets 30% more critical hit rate when using its Ultimate SKill for the first time",
		choice1_kr = "고기가 먹고 싶습니다",
		choice2 = "I want scallions",
		name_th = "คุณควรกิน? หรือไม่?",
		id = 23,
		resultDesc3_th = "ต่อสู้กับชายคนนั้นก่อนที่จะช่วยเหลือและปล่อย Farfetch'd โปเกมอนต่อสู้ของคุณจะเพิ่ม HP ขึ้น 10% คุณจะได้รับพรจาก Farfetch'd โดยที่โปเกมอนของคุณได้รับอัตราคริติคอลเพิ่มขึ้น 30% เมื่อใช้ Ultimate SKill เป็นครั้งแรก",
		result1 = slot3[23],
		result2 = {
			__size = 1,
			buff = {
				1102
			}
		},
		result3 = {
			__size = 1,
			buff = {
				200,
				1006
			}
		}
	},
	{
		choice1_en = "Try listening to it",
		name = "Black Market Merchant",
		choice1_th = "ลองฟังกันดูนะครับ",
		resultDesc1_th = "เขาหยิบลูกกลมออกมาจากกระเป๋าของเขา และในการต่อสู้ครั้งต่อไป โปเกมอนศัตรูที่มี HP น้อยกว่า 10% เมื่อสิ้นสุดรอบสุดท้ายจะถูกกำจัดโดย Yveltal เทพเจ้าแห่งความตายและจะออกจากสนามรบทันที",
		group = 3,
		desc_th = "ชายน่าสงสัยที่อ้างว่าเป็นนักธุรกิจตลาดมืดปรากฏตัว เขากำลังบอกว่าเขาสามารถช่วยคุณให้พ้นจากอันตรายได้",
		choice1 = "Try listening to it",
		desc = "A suspicious man who claims to be a black market businessman appears, he is saying that he can save you from danger",
		resultDesc2 = "\"In order to expand the number of customers, I shall give you a little discount this time around\", all enemies are silenced for 1 turn in the next battle",
		resultDesc2_th = "“เพื่อขยายจำนวนลูกค้า คราวนี้ฉันจะให้ส่วนลดคุณเล็กน้อย” ศัตรูทั้งหมดจะถูกปิดปาก 1 เทิร์นในการต่อสู้ครั้งต่อไป",
		name_en = "Black Market Merchant",
		choice3 = "Vigilance",
		choice3_th = "ระแวดระวัง",
		resultDesc3 = "\"Oh no, seems like you don't find me trustworthy at all. Well then, here's a mysterious rune as a gift for you.\" You obtain the power of the mysterious rune. In subsequent battles, when an enemy is defeated, you deal 40% of damage to the defeated enemy to nearby Pokémons",
		choice2_en = "Ignore him",
		onlyOne = true,
		choice3_en = "Vigilance",
		resultDesc2_en = "\"In order to expand the number of customers, I shall give you a little discount this time around\", all enemies are silenced for 1 turn in the next battle",
		resultDesc1 = "He took out an orb from his pocket, and in the subsequent battle, enemy Pokémons with less than 10% HP at the end of the final round will be finished off by Yveltal, the god of death, and will leave the battlefield instantly",
		desc_en = "A suspicious man who claims to be a black market businessman appears, he is saying that he can save you from danger",
		limit = 1,
		resultDesc3_en = "\"Oh no, seems like you don't find me trustworthy at all. Well then, here's a mysterious rune as a gift for you.\" You obtain the power of the mysterious rune. In subsequent battles, when an enemy is defeated, you deal 40% of damage to the defeated enemy to nearby Pokémons",
		choice1_kr = "들어 본다",
		choice2 = "Ignore him",
		name_th = "พ่อค้าตลาดมืด",
		id = 24,
		resultDesc3_th = "“โอ้ ไม่ ดูเหมือนว่าคุณจะไม่เชื่อว่าฉันน่าเชื่อถือเลย เอาล่ะ นี่คืออักษรรูนลึกลับเป็นของขวัญสำหรับคุณ” คุณได้รับพลังของอักษรรูนลึกลับ ในการต่อสู้ครั้งต่อๆ ไป เมื่อศัตรูถูกกำจัด คุณจะสร้างความเสียหาย 40% ให้กับศัตรูที่พ่ายแพ้ต่อโปเกมอนที่อยู่ใกล้เคียง",
		result1 = {
			__size = 1,
			buff = {
				1110
			}
		},
		result2 = slot2[24],
		result3 = {
			__size = 1,
			buff = {
				1116
			}
		}
	},
	{
		choice1_en = "Who are you",
		name = "Mysterious man",
		choice1_th = "คุณคือใคร",
		resultDesc1_th = "ชายลึกลับเปิดเผยตัวตนของเขาและนำลูกแก้ววิญญาณออกมา - จริง ๆ แล้วเขาเป็นคนโกง คุณยอมรับลูกกลมและรับพรจากมัน ในการต่อสู้ครั้งต่อๆ ไป โปเกมอนศัตรูจะได้รับการลดสูงสุดอย่างถาวร 10% HP",
		group = 3,
		desc_th = "จู่ๆก็เจอคนหน้าตาน่าสงสัยเข้ามาหา",
		name_en = "Mysterious man",
		desc = "You suddenly meet a suspicious-looking person and approached him",
		resultDesc2_th = "ชายลึกลับชี้ไปที่ทิศทางหนึ่ง และขณะที่เดินไปตามทิศทางนั้น คุณพบอุปกรณ์แปลก ๆ คุณเปิดใช้งานอุปกรณ์และรับคะแนนพิเศษ 200 คะแนน",
		name_th = "ชายลึกลับ",
		choice3 = "Where are you going?",
		choice3_th = "คุณกำลังจะไปไหน?",
		resultDesc3 = "The mysterious man took a bag out of his pocket and gave it to you instead of telling you. (You get a small reward)",
		resultDesc3_en = "The mysterious man took a bag out of his pocket and gave it to you instead of telling you. (You get a small reward)",
		choice2_en = "Where are you from?",
		resultDesc3_th = "ชายลึกลับหยิบกระเป๋าออกมาจากกระเป๋าของเขาแล้วส่งให้คุณแทนที่จะบอกคุณ (คุณจะได้รับผลตอบแทนเล็กน้อย)",
		choice3_en = "Where are you going?",
		resultDesc2_en = "The mysterious man pointed at a direction, and while following that direction, you found a strange device. You activated the device and get 200 extra points.",
		resultDesc1 = "The mysterious man revealed his identity and takes out a soul orb - he is actually a rogue. You accept the orb and receive blessings from it. In subsequent battles, the enemy Pokémons receive a permanent 10% reduction in max. HP",
		desc_en = "You suddenly meet a suspicious-looking person and approached him",
		resultDesc2 = "The mysterious man pointed at a direction, and while following that direction, you found a strange device. You activated the device and get 200 extra points.",
		choice1_kr = "당신은 누구세요?",
		choice2 = "Where are you from?",
		choice1 = "Who are you",
		id = 25,
		result1 = {
			__size = 1,
			buff = {
				1114
			}
		},
		result2 = {
			__size = 1,
			points = 400
		},
		result3 = {
			__size = 1,
			items = {
				gold = 20000,
				__size = 1
			}
		}
	},
	{
		choice1_en = "My damage is not enough, I need to be stronger",
		name = "Victini's blessing",
		choice1_th = "ความเสียหายของฉันไม่เพียงพอ ฉันต้องแข็งแกร่งขึ้น",
		resultDesc1_th = "คุณได้รับพรที่เพิ่มความเสียหายของคุณ สร้างความเสียหายจริง 20% ของ ATK ของโปเกมอนที่มี ATK สูงสุดในทีมพันธมิตรกับโปเกมอนศัตรูทั้งหมดเมื่อสิ้นสุดรอบสุดท้าย",
		group = 3,
		desc_th = "วิกตินี่ป่าปรากฏตัวแล้ว โปเกมอนตัวนี้เป็นสัญลักษณ์ของชัยชนะและดูเหมือนว่าจะสามารถให้พรแก่คุณได้",
		choice1 = "My damage is not enough, I need to be stronger",
		desc = "A wild Victini has appeared. This Pokémon symbolizes victory and seems to be able to give you blessings",
		resultDesc2 = "You receive a defense blessing. When entering a battle, your team gain a shield that can absorb all damage taken by all the allied Pokémons, the amount of absorption is equal to the allied Pokémon with the highest HP",
		resultDesc2_th = "คุณได้รับพรการป้องกัน เมื่อเข้าสู่การต่อสู้ ทีมของคุณจะได้รับโล่ที่สามารถดูดซับความเสียหายทั้งหมดที่ได้รับจากโปเกมอนพันธมิตรทั้งหมด ปริมาณการดูดซึมจะเท่ากับโปเกมอนฝ่ายเดียวกันที่มี HP สูงสุด",
		name_en = "Victini's blessing",
		choice3 = "The enemy is too powerful",
		choice3_th = "ศัตรูแข็งแกร่งเกินไป",
		resultDesc3 = "You receive the blessing of annihilation. Allied Pokémons will remove alll buff effect of the enemy after using the Ultimate Skill",
		choice2_en = "My Pokémons gets knocked out easily, they need better survivability",
		onlyOne = true,
		choice3_en = "The enemy is too powerful",
		resultDesc2_en = "You receive a defense blessing. When entering a battle, your team gain a shield that can absorb all damage taken by all the allied Pokémons, the amount of absorption is equal to the allied Pokémon with the highest HP",
		resultDesc1 = "You receive blessing that increases your damage, giving a true damage of 20% ATK of the Pokémon with the highest ATK in the allied team to all enemy Pokémons at the end of the final round",
		desc_en = "A wild Victini has appeared. This Pokémon symbolizes victory and seems to be able to give you blessings",
		limit = 1,
		resultDesc3_en = "You receive the blessing of annihilation. Allied Pokémons will remove alll buff effect of the enemy after using the Ultimate Skill",
		choice1_kr = "내 대미지가 부족해, 더 강화해야 해",
		choice2 = "My Pokémons gets knocked out easily, they need better survivability",
		name_th = "พรของวิคตินี",
		id = 26,
		resultDesc3_th = "คุณได้รับพรแห่งการทำลายล้าง โปเกมอนฝ่ายเดียวกันจะลบเอฟเฟกต์บัฟของศัตรูทั้งหมดหลังจากใช้ทักษะขั้นสูงสุด",
		result1 = {
			__size = 1,
			buff = {
				1121
			}
		},
		result2 = {
			__size = 1,
			buff = {
				1122
			}
		},
		result3 = {
			__size = 1,
			buff = {
				1119
			}
		}
	},
	{
		choice1_en = "Suggest to her to eat the rice ball",
		name = "Today's dinner",
		choice1_th = "แนะนำให้เธอกินข้าวปั้น",
		resultDesc1_th = "เธอฟังคำแนะนำของคุณ ไปที่โรงอาหารเพื่อซื้อข้าวปั้น และแบ่งปันให้กับคุณ",
		group = 3,
		desc_th = "คุณได้พบกับผู้ฝึกสอนจาก Aether Paradise ที่ครุ่นคิดอยู่ลึกๆ ดูเหมือนเธอจะกังวลเรื่องอาหารเย็น",
		choice1 = "Suggest to her to eat the rice ball",
		desc = "You meet a trainer from the Aether Paradise who is deep in thoughts. She seems to be worrying for her dinner",
		resultDesc2 = "She heeded your advice, went to a convenience store to buy some lunch box, and shared some with you",
		resultDesc2_th = "เธอฟังคำแนะนำของคุณ ไปที่ร้านสะดวกซื้อเพื่อซื้อข้าวกล่อง และแบ่งบางอย่างกับคุณ",
		name_en = "Today's dinner",
		choice2_en = "We can just have lunch boxes since time is tight",
		onlyOne = true,
		resultDesc2_en = "She heeded your advice, went to a convenience store to buy some lunch box, and shared some with you",
		resultDesc1 = "She heeded your advice, went to the canteen to get some rice balls, and shared one with you",
		desc_en = "You meet a trainer from the Aether Paradise who is deep in thoughts. She seems to be worrying for her dinner",
		limit = 1,
		choice1_kr = "주먹밥을 추천해 준다",
		choice2 = "We can just have lunch boxes since time is tight",
		name_th = "มื้อเย็นวันนี้",
		id = 27,
		result1 = {
			__size = 1,
			items = {
				__size = 1,
				[516.0] = 1
			}
		},
		result2 = {
			__size = 1,
			items = {
				[515.0] = 1,
				__size = 1
			}
		}
	},
	{
		choice1_en = "Kind and Helpful",
		name = "Secret investigation?",
		choice1_th = "ใจดีและช่วยเหลือดี",
		resultDesc1_th = "คุณถูกเขาหลอกหลังจากเข้าไปในห้อง HP ของโปเกมอนต่อสู้ของคุณลดลง 10% แต่ค่าความโกรธเพิ่มขึ้น",
		group = 2,
		desc_th = "ชายผู้อ้างว่าเป็นแรนเจอร์ปรากฏตัวขึ้น ดูเหมือนว่าเขากำลังขอความช่วยเหลือจากคุณเพื่อตรวจสอบโปเกมอนที่อยู่ใกล้เคียงที่หายตัวไปอย่างลึกลับ",
		name_en = "Secret investigation?",
		desc = "A man who claims to be a Ranger has appeared, he seems to be seeking for your help to investigate the nearby Pokémons that have gone missing mysteriously",
		resultDesc2 = "\"I didn't expect you to see through that. I shouldn't stay here for long, bye.\" You feel very unhappy about it, and the rage value of the Pokémons on the battlefield increases",
		resultDesc2_th = "“ฉันไม่คิดว่าคุณจะเข้าใจ ฉันไม่ควรอยู่ที่นี่นาน ลาก่อน” คุณรู้สึกไม่พอใจกับมันมาก และค่าความโกรธของโปเกมอนในสนามรบก็เพิ่มขึ้น",
		name_th = "สืบสวนลับ?",
		choice2_en = "Express suspicion",
		resultDesc2_en = "\"I didn't expect you to see through that. I shouldn't stay here for long, bye.\" You feel very unhappy about it, and the rage value of the Pokémons on the battlefield increases",
		resultDesc1 = "You've been tricked by him after entering a room, the HP of your battling Pokémons reduces by 10% but rage value increases",
		desc_en = "A man who claims to be a Ranger has appeared, he seems to be seeking for your help to investigate the nearby Pokémons that have gone missing mysteriously",
		limit = 1,
		choice1_kr = "흔쾌히 도와준다",
		choice2 = "Express suspicion",
		choice1 = "Kind and Helpful",
		id = 28,
		result1 = slot3[28],
		result2 = {
			__size = 1,
			buff = {
				215
			}
		}
	},
	{
		choice1_en = "Kind and Helpful",
		name = "Secret investigation",
		choice1_th = "ใจดีและช่วยเหลือดี",
		resultDesc1_th = "ต่อสู้กับแก๊งอันธพาลกับเรนเจอร์ HP ของการต่อสู้โปเกมอนลดลง 10% แต่ระดับความโกรธเพิ่มขึ้น",
		group = 2,
		desc_th = "ชายผู้อ้างว่าเป็นแรนเจอร์ปรากฏตัวขึ้น ดูเหมือนว่าเขากำลังขอความช่วยเหลือจากคุณเพื่อตรวจสอบโปเกมอนที่อยู่ใกล้เคียงที่หายตัวไปอย่างลึกลับ",
		name_en = "Secret investigation",
		desc = "A man who claims to be a Ranger has appeared, he seems to be seeking for your help to investigate the nearby Pokémons that have gone missing mysteriously",
		resultDesc2 = "\"There's nothing I can if you don't believe me. Maybe I can heal your companions?\" The HP of the battling Pokémons has recovered",
		resultDesc2_th = "“ไม่มีอะไรที่ฉันทำได้ถ้าคุณไม่เชื่อฉัน บางทีฉันอาจจะรักษาเพื่อนของคุณได้” ฟื้น HP ของโปเกมอนต่อสู้แล้ว",
		name_th = "การสืบสวนลับ",
		choice2_en = "Express suspicion",
		resultDesc2_en = "\"There's nothing I can if you don't believe me. Maybe I can heal your companions?\" The HP of the battling Pokémons has recovered",
		resultDesc1 = "Battle with the gang of rogues with the ranger, HP of battling Pokémons reduces by 10%, but rage level has increased",
		desc_en = "A man who claims to be a Ranger has appeared, he seems to be seeking for your help to investigate the nearby Pokémons that have gone missing mysteriously",
		limit = 1,
		choice1_kr = "흔쾌히 도와준다",
		choice2 = "Express suspicion",
		choice1 = "Kind and Helpful",
		id = 29,
		result1 = slot3[29],
		result2 = slot2[29]
	},
	{
		choice1_en = "Steal some sweets",
		name = "Sweets Room",
		choice1_th = "ขโมยขนม",
		resultDesc1_th = "HP ของโปเกมอนพันธมิตรฟื้นเต็มที่",
		group = 2,
		desc_th = "เข้าห้องทำขนมแต่ดูเหมือนไม่มีใคร",
		name_en = "Sweets Room",
		desc = "You've entered a room that makes sweets, but there seems to be no one here",
		name_th = "ห้องขนมหวาน",
		resultDesc2_th = "โชคดีจังที่รอดมาได้เกือบเจอแล้ว",
		choice2_en = "Takeaway",
		resultDesc2_en = "It's lucky you escaped fast enough, you're almost found",
		resultDesc1 = "HP of allied Pokémons fully recovers",
		desc_en = "You've entered a room that makes sweets, but there seems to be no one here",
		resultDesc2 = "It's lucky you escaped fast enough, you're almost found",
		choice1_kr = "디저트를 훔쳐먹는다",
		choice2 = "Takeaway",
		choice1 = "Steal some sweets",
		id = 30,
		result1 = slot3[30]
	},
	__size = 33,
	[1000] = {
		choice1_en = "Who are you",
		name = "Mysterious man",
		choice1_th = "คุณคือใคร",
		resultDesc1_th = "ชายลึกลับ \"อึ\" และแปลงร่างเป็น Ditto ก่อนจะรีบหนีไปอย่างรวดเร็ว",
		name_en = "Mysterious man",
		desc_th = "จู่ๆก็เจอคนหน้าตาน่าสงสัยเข้ามาหา",
		choice1 = "Who are you",
		desc = "You suddenly meet a suspicious-looking person and approached him",
		resultDesc2_th = "ชายลึกลับชี้ไปที่ทิศทางหนึ่ง และขณะที่เดินไปตามทิศทางนั้น คุณพบอุปกรณ์แปลก ๆ คุณเปิดใช้งานอุปกรณ์และรับ 50 คะแนนพิเศษและ 10,000 เหรียญ",
		choice3 = "Where are you going?",
		choice3_th = "คุณกำลังจะไปไหน?",
		resultDesc3 = "The mysterious man doesn't say anything, but takes out a bag from the pocket and hands it to you.",
		resultDesc3_en = "The mysterious man doesn't say anything, but takes out a bag from the pocket and hands it to you.",
		resultDesc3_th = "ชายลึกลับไม่พูดอะไร แต่หยิบกระเป๋าออกมาจากกระเป๋าแล้วยื่นให้คุณ",
		choice2_en = "Where are you from?",
		choice3_en = "Where are you going?",
		resultDesc2_en = "The mysterious man pointed at a direction, and while following that direction, you found a strange device. You activated the device and get 50extra points and 10000 coins.",
		resultDesc1 = "The mysterious man \"poofs\" and transformed into Ditto before quickly fleeing away.",
		desc_en = "You suddenly meet a suspicious-looking person and approached him",
		resultDesc2 = "The mysterious man pointed at a direction, and while following that direction, you found a strange device. You activated the device and get 50extra points and 10000 coins.",
		choice1_kr = "당신은 누구세요?",
		choice2 = "Where are you from?",
		name_th = "ชายลึกลับ",
		id = 1000,
		result2 = slot2[1000],
		result3 = slot1[1000]
	},
	[1001] = {
		choice1_en = "Who are you",
		name = "Mysterious man",
		choice1_th = "คุณคือใคร",
		resultDesc1_th = "ชายลึกลับชี้ไปที่ทิศทางหนึ่ง และขณะที่เดินไปตามทิศทางนั้น คุณพบอุปกรณ์แปลก ๆ คุณเปิดใช้งานอุปกรณ์และรับ 50 คะแนนพิเศษและ 10,000 เหรียญ",
		group = 2,
		desc_th = "จู่ๆก็เจอคนหน้าตาน่าสงสัยเข้ามาหา",
		name_en = "Mysterious man",
		desc = "You suddenly meet a suspicious-looking person and approached him",
		resultDesc2_th = "ชายลึกลับไม่พูดอะไร แต่หยิบกระเป๋าออกมาจากกระเป๋าแล้วยื่นให้คุณ",
		name_th = "ชายลึกลับ",
		choice3 = "Where are you going?",
		choice3_th = "คุณกำลังจะไปไหน?",
		resultDesc3 = "The mysterious man \"poofs\" and transformed into Ditto before quickly fleeing away.",
		resultDesc3_en = "The mysterious man \"poofs\" and transformed into Ditto before quickly fleeing away.",
		choice2_en = "Where are you from?",
		resultDesc3_th = "ชายลึกลับ \"อึ\" และแปลงร่างเป็น Ditto ก่อนจะรีบหนีไปอย่างรวดเร็ว",
		choice3_en = "Where are you going?",
		resultDesc2_en = "The mysterious man doesn't say anything, but takes out a bag from the pocket and hands it to you.",
		resultDesc1 = "The mysterious man pointed at a direction, and while following that direction, you found a strange device. You activated the device and get 50extra points and 10000 coins.",
		desc_en = "You suddenly meet a suspicious-looking person and approached him",
		resultDesc2 = "The mysterious man doesn't say anything, but takes out a bag from the pocket and hands it to you.",
		choice1_kr = "당신은 누구세요?",
		choice2 = "Where are you from?",
		choice1 = "Who are you",
		id = 1001,
		result1 = slot3[1001],
		result2 = slot2[1001]
	},
	[1002] = {
		choice1_en = "Who are you",
		name = "Mysterious man",
		choice1_th = "คุณคือใคร",
		resultDesc1_th = "ชายลึกลับชี้ไปที่ทิศทางหนึ่ง และขณะที่เดินไปตามทิศทางนั้น คุณพบอุปกรณ์แปลก ๆ คุณเปิดใช้งานอุปกรณ์และรับ 50 คะแนนพิเศษและ 10,000 เหรียญ",
		group = 3,
		desc_th = "จู่ๆก็เจอคนหน้าตาน่าสงสัยเข้ามาหา",
		name_en = "Mysterious man",
		desc = "You suddenly meet a suspicious-looking person and approached him",
		resultDesc2_th = "ชายลึกลับไม่พูดอะไร แต่หยิบกระเป๋าออกมาจากกระเป๋าแล้วยื่นให้คุณ",
		name_th = "ชายลึกลับ",
		choice3 = "Where are you going?",
		choice3_th = "คุณกำลังจะไปไหน?",
		resultDesc3 = "The mysterious man gives it some thought and hands you a small bag",
		resultDesc3_en = "The mysterious man gives it some thought and hands you a small bag",
		choice2_en = "Where are you from?",
		resultDesc3_th = "ชายลึกลับคิดและยื่นกระเป๋าใบเล็กให้คุณ",
		choice3_en = "Where are you going?",
		resultDesc2_en = "The mysterious man doesn't say anything, but takes out a bag from the pocket and hands it to you.",
		resultDesc1 = "The mysterious man pointed at a direction, and while following that direction, you found a strange device. You activated the device and get 50extra points and 10000 coins.",
		desc_en = "You suddenly meet a suspicious-looking person and approached him",
		resultDesc2 = "The mysterious man doesn't say anything, but takes out a bag from the pocket and hands it to you.",
		choice1_kr = "당신은 누구세요?",
		choice2 = "Where are you from?",
		choice1 = "Who are you",
		id = 1002,
		result1 = slot3[1002],
		result2 = slot2[1002],
		result3 = slot1[1002]
	},
	__default = {
		__index = {
			choice1_en = "",
			name = "",
			choice1_th = "",
			resultDesc1_th = "",
			group = 1,
			desc_th = "",
			name_th = "",
			desc = "",
			choice2 = "",
			resultDesc2 = "",
			resultDesc2_th = "",
			name_en = "",
			choice3 = "",
			choice3_th = "",
			choice2_en = "",
			onlyOne = false,
			choice3_en = "",
			resultDesc2_en = "",
			resultDesc1 = "",
			desc_en = "",
			limit = 999,
			resultDesc3 = "",
			choice1_kr = "",
			res = "",
			choice1 = "",
			resultDesc3_th = "",
			resultDesc3_en = "",
			result1 = slot3.default,
			result2 = slot2.default,
			result3 = slot1.default
		}
	}
}

return csv.random_tower.event
