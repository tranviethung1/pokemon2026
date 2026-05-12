slot0 = {
	__size = 0
}
csv.union.daily_notice = {
	{
		desc_th = "อัพเกรดอาคารสหภาพของคุณ",
		goto = "contribute",
		targetType = "contribute",
		id = 1,
		desc_en = "Upgrade the building of your union",
		desc_vn = "Atualize o prédio do seu sindicato",
		desc = "Upgrade the building of your union"
	},
	{
		desc_th = "คุณมีภารกิจรายวันที่ยังไม่เสร็จ",
		goto = "contribute",
		targetType = "uniontask",
		id = 2,
		desc_en = "You have uncompleted daily quests",
		desc_vn = "Você tem missões diárias incompletas",
		desc = "You have uncompleted daily quests"
	},
	{
		desc_th = "คุณสามารถรับแพ็ครายวัน",
		goto = "dailygift",
		targetType = "dailygift",
		id = 3,
		desc_en = "You can claim daily pack",
		desc_vn = "Você pode reivindicar o pacote diário",
		desc = "You can claim daily pack"
	},
	{
		tarhetArg = 6,
		desc_th = "เร่งความเร็วสำหรับสหายของคุณ",
		targetType = "speedup",
		goto = "training",
		id = 4,
		desc_en = "Speed up for your comrade",
		desc_vn = "Acelere para o seu companheiro",
		desc = "Speed up for your comrade"
	},
	{
		desc_th = "มีซองแดงให้ขอรับ",
		goto = "redpacket",
		targetType = "dailypacket",
		id = 5,
		desc_en = "There's Red Packet to be claimed",
		desc_vn = "Há Red Packet a ser reivindicado",
		desc = "There's Red Packet to be claimed"
	},
	{
		tarhetArg = 3,
		desc_th = "ดันเจี้ยนท้าทายสหภาพ",
		targetType = "fuben",
		goto = "fuben",
		id = 6,
		desc_en = "Challenge union Dungeon",
		desc_vn = "Masmorra da união do desafio",
		desc = "Challenge union Dungeon"
	},
	{
		desc_th = "เปิดให้ลงทะเบียนเข้าร่วมสงครามสหพันธ์แล้ว",
		goto = "unionfight",
		targetType = "fightsign",
		id = 7,
		desc_en = "Registration for union War is open",
		desc_vn = "Estão abertas as inscrições para a Guerra Sindical",
		desc = "Registration for union War is open"
	},
	{
		desc_th = "คุณสามารถขอพรได้",
		goto = "fragdonate",
		targetType = "fragdonate",
		id = 8,
		desc_en = "You can make a wish",
		desc_vn = "Você pode fazer um desejo",
		desc = "You can make a wish"
	},
	__size = 8,
	__default = {
		__index = {
			desc_th = "",
			desc_en = "",
			desc_vn = "",
			desc = ""
		}
	}
}

return csv.union.daily_notice
