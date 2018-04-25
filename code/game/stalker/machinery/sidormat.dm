/obj/machinery/stalker
	icon = 'icons/stalker/decor.dmi'

/obj/machinery/stalker/sidormat
	name = "SIDORMAT 3000"
	desc = "An equipment vendor for beginning stalkers. Insert money - buy stuff."
	icon_state = "radio"
	density = 1
	anchored = 1
	var/itemloc = null
	var/itemloc2 = null
	var/balance = 0
	var/rating = 0
	var/list/weapon_list = list(
		///////////////////////////////  Оружие  /////////////////////////////////////////

		///////////////////////////// **Пистолеты** /////////////////////////////////////
		new /datum/data/stalker_equipment("PMm", 			"ПМм",				/obj/item/weapon/gun/projectile/automatic/pistol/pm,				3000, NEWBIE),
		new /datum/data/stalker_equipment("Fort-12",		"Форт-12",			/obj/item/weapon/gun/projectile/automatic/pistol/fort12,			6500, NEWBIE),
		new /datum/data/stalker_equipment("PB1s",			"ПБС1с",			/obj/item/weapon/gun/projectile/automatic/pistol/pb1s,				4500, NEWBIE),
		new /datum/data/stalker_equipment("SIG-Sauer P220",	"П-220",			/obj/item/weapon/gun/projectile/automatic/pistol/sip,				7500, EXPERT),
		new /datum/data/stalker_equipment("Colt M1911",		"Кольт",			/obj/item/weapon/gun/projectile/automatic/pistol/cora,				8000, EXPERT),
		new /datum/data/stalker_equipment("Beretta 92FS",	"Беретта",			/obj/item/weapon/gun/projectile/automatic/pistol/marta,				10000, EXPERT),
		new /datum/data/stalker_equipment("USP-match",		"ЮСП-матч",			/obj/item/weapon/gun/projectile/automatic/pistol/usp_match, 		9000, EXPERT),

		///////////////////////////// **Автоматы, ПП** /////////////////////////////////////
		new /datum/data/stalker_equipment("MP-5", 			"МП-5",				/obj/item/weapon/gun/projectile/automatic/mp5,						18000, NEWBIE),
		new /datum/data/stalker_equipment("AK 74/2 S", 		"АК 74/2 У",		/obj/item/weapon/gun/projectile/automatic/aksu74 ,					20000, NEWBIE),
		new /datum/data/stalker_equipment("AK 74/2", 		"АК 74/2",			/obj/item/weapon/gun/projectile/automatic/ak74,						25000, NEWBIE),
		new /datum/data/stalker_equipment("AS 96/2", 		"АС 96/2",			/obj/item/weapon/gun/projectile/automatic/abakan,					35000, EXPERT),
		new /datum/data/stalker_equipment("LR-300",			"ЛР-300",			/obj/item/weapon/gun/projectile/automatic/tpc301,					40000, EXPERT),
		new /datum/data/stalker_equipment("L85", 			"Л85",				/obj/item/weapon/gun/projectile/automatic/il86,						40000, VETERAN),
		new /datum/data/stalker_equipment("AS \"Val\"", 	"АС \"Вал\"",		/obj/item/weapon/gun/projectile/automatic/val,						50000, VETERAN),
		new /datum/data/stalker_equipment("Tunder OTs-14", 	"ОЦ-14 Гроза",		/obj/item/weapon/gun/projectile/automatic/groza,					40000, VETERAN),
		new /datum/data/stalker_equipment("Vintorez", 		"Винторез",			/obj/item/weapon/gun/projectile/automatic/vintorez,					65000, MASTER),
		new /datum/data/stalker_equipment("FN F2000", 		"ФН Ф2000",			/obj/item/weapon/gun/projectile/automatic/fnf2000,					70000, MASTER),

		/////////////////////////////// **Дробовики** /////////////////////////////////////
		new /datum/data/stalker_equipment("Sawn off", 		"Обрез",			/obj/item/weapon/gun/projectile/revolver/bm16/sawnoff,				6000, NEWBIE),
		new /datum/data/stalker_equipment("BM-16", 			"БМ-16",			/obj/item/weapon/gun/projectile/revolver/bm16,						12000, NEWBIE),
		new /datum/data/stalker_equipment("TOZ-34", 		"ТОЗ-34", 			/obj/item/weapon/gun/projectile/revolver/bm16/toz34, 				18000, EXPERT),
		new /datum/data/stalker_equipment("Wincheaster-1300","Винчестер-1300",	/obj/item/weapon/gun/projectile/shotgun/chaser,						25000, EXPERT),
		new /datum/data/stalker_equipment("SPAS-12", 		"СПАС-12",			/obj/item/weapon/gun/projectile/shotgun/spsa, 						40000, VETERAN),
		/////////////////////////////// **Другое** /////////////////////////////////////
		new /datum/data/stalker_equipment("Knife",			 "Нож",				/obj/item/weapon/stalker/knife,										2000, NEWBIE)
		)

	var/list/ammo_list = list(
		////////////////////////////////  Патроны  /////////////////////////////////////////
		new /datum/data/stalker_equipment("9x18 Box", 				"Коробка 9х18",								/obj/item/ammo_box/stalker/b9x18,						3750, NEWBIE),
		new /datum/data/stalker_equipment("9x18 AP Box", 			"Коробка 9x18 Бронебойные",					/obj/item/ammo_box/stalker/b9x18P,						7500, EXPERT),
		new /datum/data/stalker_equipment("9x19 Box", 				"Коробка 9x19",								/obj/item/ammo_box/stalker/b9x19,						4000, NEWBIE),
		new /datum/data/stalker_equipment("9x19 AP Box", 			"Коробка 9x19 Бронебойные",					/obj/item/ammo_box/stalker/b9x19P,						4000, EXPERT),
		new /datum/data/stalker_equipment(".45 ACP Box", 			"Коробка .45 ACP",							/obj/item/ammo_box/stalker/bacp45,						4000, NEWBIE),
		new /datum/data/stalker_equipment(".45 ACP Hydroshock Box", "Коробка .45 ACP Hydroshock",				/obj/item/ammo_box/stalker/bacp45ap,					5000, EXPERT),
		new /datum/data/stalker_equipment("12x70 Buckshot Box",		"Коробка дроби 12x70",						/obj/item/ammo_box/stalker/b12x70,						3000, NEWBIE),
		new /datum/data/stalker_equipment("12x70 Slug Box", 		"Коробка дроби 12x70 Бронебойные",			/obj/item/ammo_box/stalker/b12x70P,						4000, EXPERT),
		new /datum/data/stalker_equipment("12x70 Dart Box", 		"Коробка 12x70 Дротик",						/obj/item/ammo_box/stalker/b12x70D,						5000, EXPERT),
		new /datum/data/stalker_equipment("5.45x39 Box", 			"Коробка 5.45х39",							/obj/item/ammo_box/stalker/b545,						5750, NEWBIE),
		new /datum/data/stalker_equipment("5.45x39 AP Box",			"Коробка 5.45х39 Бронебойные",				/obj/item/ammo_box/stalker/b545ap,						7500, VETERAN),
		new /datum/data/stalker_equipment("5.56x45 Box",			"Коробка 5.56x45",							/obj/item/ammo_box/stalker/b55645,						6000, NEWBIE),
		new /datum/data/stalker_equipment("5.56x45 AP Box", 		"Коробка 5.56x45 Бронебойные",				/obj/item/ammo_box/stalker/b55645ap,					8000, VETERAN),
		new /datum/data/stalker_equipment("9x39 PAB-9 Box",			"Коробка 9x39 ПАБ-9",						/obj/item/ammo_box/stalker/b939,						9000, EXPERT),
		new /datum/data/stalker_equipment("PMm; PB1s Magazine",		"Магазин к ПМм; ПБ1с",						/obj/item/ammo_box/magazine/stalker/m9x18pm,			750, NEWBIE),
		new /datum/data/stalker_equipment("Fort-12 Magazine", 		"Магазин к Форт-12",						/obj/item/ammo_box/magazine/stalker/m9x18fort,			1000, NEWBIE),
		new /datum/data/stalker_equipment("MP-5 Magazine", 			"Магазин к МП-5",							/obj/item/ammo_box/magazine/stalker/m9x19mp5,			2000, NEWBIE),
		new /datum/data/stalker_equipment("AK 74/2;AC 96/2 Magazine","Магазин к AK 74/2;AC 96/2",				/obj/item/ammo_box/magazine/stalker/m545,				2250, NEWBIE),
		new /datum/data/stalker_equipment("L85; LR-300 Magazine", 	"Магазин к Л85; ЛР-300",					/obj/item/ammo_box/magazine/stalker/m556x45,			2500, NEWBIE),
		new /datum/data/stalker_equipment("AS \"Val\" Magazine", 	"Магазин к АС \"Вал\"",						/obj/item/ammo_box/magazine/stalker/sp9x39val,			3500, VETERAN),
		new /datum/data/stalker_equipment("Tunder S14 Magazine", 	"Магазин к ОЦ-14 Гроза",					/obj/item/ammo_box/magazine/stalker/sp9x39groza,		3500, VETERAN),
		new /datum/data/stalker_equipment("Vintorez Magazine", 		"Магазин к Винторезу",						/obj/item/ammo_box/magazine/stalker/sp9x39vint,			3000, VETERAN),
		new /datum/data/stalker_equipment("Colt M1911; SIG-Sauer P220 Magazine", "Магазин к Кольту; П-220",		/obj/item/ammo_box/magazine/stalker/sc45,				1400, NEWBIE),
		new /datum/data/stalker_equipment("Beretta Magazine", 		"Магазин к Беретте",						/obj/item/ammo_box/magazine/stalker/m9x19marta,			1500, NEWBIE),
		new /datum/data/stalker_equipment("USP-match Magazine", 	"Магазин к ЮСП-Матч",						/obj/item/ammo_box/magazine/stalker/usp45,				1500, NEWBIE),
		)

	var/list/armor_list = list(
		///////////////////////////////  Броня  /////////////////////////////////////////

		new /datum/data/stalker_equipment("Leather jacket", 		"Кожанка",						/obj/item/clothing/suit/hooded/kozhanka,					5000, NEWBIE),
		new /datum/data/stalker_equipment("White leather jacket",	"Бела&#x44F; кожанка",			/obj/item/clothing/suit/hooded/kozhanka/white,				5000, NEWBIE),
		new	/datum/data/stalker_equipment("Bandit jacket",			"Бандитска&#x44F; кожанка",		/obj/item/clothing/suit/hooded/kozhanka/banditka,			6000, NEWBIE, "Бандиты"),
		new	/datum/data/stalker_equipment("Army suit",				"Армейский комбинезон",			/obj/item/clothing/suit/army,								15000, NEWBIE, "Военные"),
		new /datum/data/stalker_equipment("\"Sunrize\"",			"Комбинезон \"Зар&#x44F;\"",	/obj/item/clothing/suit/hooded/kombez,						35000, NEWBIE),
		new /datum/data/stalker_equipment("Merc suit", 				"Комбинезон наёмников",			/obj/item/clothing/suit/hooded/kombez/mercenary,			25000, NEWBIE, "Наёмники"),
		new /datum/data/stalker_equipment("Bandit suit",			"Комбинезон бандитов",			/obj/item/clothing/suit/hooded/kombez/kombez_bandit,		25000, NEWBIE, "Бандиты"),
		new /datum/data/stalker_equipment("Black trench coat",		"Тёмный плащ",					/obj/item/clothing/suit/hooded/kozhanka/banditka/coat,		12500, NEWBIE, "Бандиты"),
		new /datum/data/stalker_equipment("Trenchcoat",				"Плащ",							/obj/item/clothing/suit/hooded/kozhanka/banditka/coat/brown,12500, NEWBIE),
		new /datum/data/stalker_equipment("Berill-5M",				"Берилл-5М",					/obj/item/clothing/suit/berill,								50000, EXPERT),
		new /datum/data/stalker_equipment("Wind of Freedom",	    "Ветер Свободы",				/obj/item/clothing/suit/hooded/kombez/strazh,				25000, EXPERT), "Свобода"),
		new /datum/data/stalker_equipment("PZ-1	",					"ПЗ-1",							/obj/item/clothing/suit/hooded/kombez/monolit,				25000, EXPERT, "Монолит"),
		new /datum/data/stalker_equipment("PS5-M",					"ПС5-М",						/obj/item/clothing/suit/hooded/kombez/psz9d,				25000, EXPERT, "Долг"),
		new /datum/data/stalker_equipment("SKAT-9M",				"СКАТ-9М",						/obj/item/clothing/suit/skat,								75000, VETERAN),
		new	/datum/data/stalker_equipment("PSZ-9Md",				"ПСЗ-9Мд",						/obj/item/clothing/suit/hooded/kombez/psz9md,				75000, VETERAN, "Долг"),
		new	/datum/data/stalker_equipment("SSP-99 Ecologist",		"ССП-99 Эколог",				/obj/item/clothing/suit/hooded/kombez/ecolog,				75000, MASTER),
		new	/datum/data/stalker_equipment("SSP-99M Ecologist",		"ССП-99М Эколог",				/obj/item/clothing/suit/hooded/kombez/ecologm,			100000, MASTER),
		new	/datum/data/stalker_equipment("SEVA",					"СЕВА",							/obj/item/clothing/suit/hooded/kombez/seva,					150000, MASTER),
		new	/datum/data/stalker_equipment("Exoskeleton",			"Экзоскелет",					/obj/item/clothing/suit/hooded/kombez/exoskelet,			150000, MASTER),
		)

	var/list/helmet_list = list(
		////////////////////////////	Маски, Шлемы	/////////////////////////////////////
		new /datum/data/stalker_equipment("Gasmask",				"Противогаз",				/obj/item/clothing/mask/gas/stalker,						7500, NEWBIE),
		new /datum/data/stalker_equipment("Merc gasmask",			"Противогаз наемников",		/obj/item/clothing/mask/gas/stalker/mercenary,				7500, NEWBIE),
		new /datum/data/stalker_equipment("Tactical helmet",		"Тактический шлем",			/obj/item/clothing/head/hardhat/tacticalhelmet,				20000, EXPERT),
		new /datum/data/stalker_equipment("Sphera-M12",				"Сфера-М12",				/obj/item/clothing/head/spherahelmet,						25000, EXPERT),
		new /datum/data/stalker_equipment("SKAT-9M (helmet)",		"СКАТ-9М (шлем)",			/obj/item/clothing/head/skathelmet,							35000, VETERAN),
		)

	var/list/med_list = list(
		///////////////////////////////	Медикаменты	/////////////////////////////////////////
		new /datum/data/stalker_equipment("Medkit",				"Аптечка",						/obj/item/weapon/reagent_containers/pill/stalker/aptechka_r,		1000, NEWBIE),
		new /datum/data/stalker_equipment("Army medkit",		"Армейска&#x44F; аптечка",		/obj/item/weapon/reagent_containers/pill/stalker/aptechka_b,		2000, EXPERT),
		new /datum/data/stalker_equipment("Scientific medkit",	"Научна&#x44F; аптечка",		/obj/item/weapon/reagent_containers/pill/stalker/aptechka_y,		4000, VETERAN),
		new /datum/data/stalker_equipment("Bandage",			"Бинт",							/obj/item/stack/medical/gauze/bint,									500, NEWBIE),
		new /datum/data/stalker_equipment("Anti-rad",			"Анти-рад препараты",			/obj/item/weapon/reagent_containers/hypospray/medipen/stalker/antirad,3000, NEWBIE)
		)

	var/list/food_list = list(
		/////////////////////////////////	Еда	///////////////////////////////////////////
		new /datum/data/stalker_equipment("Canned ham",			"Тушенка",				/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva,				500, NEWBIE),
		new /datum/data/stalker_equipment("Canned fish",		"Шпроты",					/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/shproti,		800, NEWBIE),
		new /datum/data/stalker_equipment("Vodka \"Kazaki\"",	"Водка \"Казаки\"",			/obj/item/weapon/reagent_containers/food/drinks/bottle/vodka/kazaki,			1000, NEWBIE),
		new /datum/data/stalker_equipment("Energetic NonStop",	"Энергетик NonStop",		/obj/item/weapon/reagent_containers/food/drinks/soda_cans/energetic,			500, NEWBIE),
		new /datum/data/stalker_equipment("Sniekrs",			"Сникерс",				/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/snack/snikers,	300, EXPERT),
		new /datum/data/stalker_equipment("Kolbasa",			"Колбаса",				/obj/item/weapon/reagent_containers/food/snacks/stalker/kolbasa,				400, NEWBIE),
		new /datum/data/stalker_equipment("Bation",				"Батон",					/obj/item/weapon/reagent_containers/food/snacks/stalker/baton,					300, NEWBIE),
		//new /datum/data/stalker_equipment("Плавленый сыр",			/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/snack/sirok,	400)
		)

	var/list/misc_list = list(
		/////////////////////////////////	Другое	/////////////////////////////////////////////
		new /datum/data/stalker_equipment("Repair-kit for suits and helmets",	"Рем. комплект дл&#x44F; бронекостюмов и шлемов",	/obj/item/device/repair_kit/clothing,					35000, NEWBIE),
		new /datum/data/stalker_equipment("Repair-kit for guns",				"Рем. комплект дл&#x44F; огнестрельного оружи&#x44F;",/obj/item/device/repair_kit/gun,						15000, NEWBIE),
		new /datum/data/stalker_equipment("Guitar",								"Гитара",											/obj/item/device/instrument/guitar,						2000, NEWBIE),
		new /datum/data/stalker_equipment("Geiger counter",						"Дозиметр",											/obj/item/device/geiger_counter,						2000, NEWBIE),
		new /datum/data/stalker_equipment("Flashlight",							"Фонарик",											/obj/item/device/flashlight/seclite,					1000, NEWBIE),
		new /datum/data/stalker_equipment("Artifact belt",						"По&#x44F;с дл&#x44F; артефактов",					/obj/item/weapon/storage/belt/stalker,					12000, NEWBIE),
		new /datum/data/stalker_equipment("Matches",							"Спички",											/obj/item/weapon/storage/box/matches,					200, NEWBIE),
		new /datum/data/stalker_equipment("Cigarettes",							"Сигареты",											/obj/item/weapon/storage/fancy/cigarettes/cigpack_maxim,1000, NEWBIE),
		new /datum/data/stalker_equipment("Cigars",								"Сигары",											/obj/item/weapon/storage/fancy/cigarettes/cigars,		5000, NEWBIE),
		)

	var/list/detector_list = list(
		/////////////////////////////////	Детекторы	///////////////////////////////////////////
		new /datum/data/stalker_equipment("Blink", 	"Отклик",							/obj/item/device/detector/blink,				4000, NEWBIE),
		new /datum/data/stalker_equipment("Bear",	"Медведь",							/obj/item/device/detector/bear,					9000, EXPERT),
		)
	var/list/loot_list = list(
	/////////////////////////////////	Лут с мутантов	///////////////////////////////////////////
		new /datum/data/stalker_equipment("Песий хвост",	"Песий хвост",										/obj/item/weapon/stalker/loot/dog_tail,		3000, NEWBIE, sale_price = 1500),
		new /datum/data/stalker_equipment("Плотий глаз",	"Плотий глаз",										/obj/item/weapon/stalker/loot/flesh_eye,	3000, NEWBIE, sale_price = 1500),
		new /datum/data/stalker_equipment("Кабаний ног",	"Кабаний ног",										/obj/item/weapon/stalker/loot/boar_leg,		6000, NEWBIE, sale_price = 3000),

		)

	var/list/artifact_list = list(
		/////////////////////////////////	Артефакты	///////////////////////////////////////////
		new /datum/data/stalker_equipment("Медуза",			"Медуза",									/obj/item/weapon/artifact/meduza,					5000, NEWBIE, sale_price = 2500),
		new /datum/data/stalker_equipment("Каменный цветок","Каменный цветок",							/obj/item/weapon/artifact/stoneflower,				10000, NEWBIE, sale_price = 5000),
		new /datum/data/stalker_equipment("Ночная звезда",	"Ночная звезда",							/obj/item/weapon/artifact/nightstar,				30000, NEWBIE, sale_price = 15000),
		new /datum/data/stalker_equipment("Мамины бусы",	"Мамины бусы",								/obj/item/weapon/artifact/maminibusi,				80000, NEWBIE, sale_price = 40000),
		new /datum/data/stalker_equipment("Вспышка",		"Вспышка",									/obj/item/weapon/artifact/flash,					6000, NEWBIE, sale_price = 3000),
		new /datum/data/stalker_equipment("Лунный свет",	"Лунный свет",								/obj/item/weapon/artifact/moonlight,				12000, NEWBIE, sale_price = 6000),
		new /datum/data/stalker_equipment("Пустышка",		"Пустышка",									/obj/item/weapon/artifact/pustishka,				90000, NEWBIE, sale_price = 45000),
		new /datum/data/stalker_equipment("Батарейка",		"Батарейка",								/obj/item/weapon/artifact/battery,					90000, NEWBIE, sale_price = 45000),
		new /datum/data/stalker_equipment("Капл&#x44F;",	"Капл&#x44F;",								/obj/item/weapon/artifact/droplet,					7000, NEWBIE, sale_price = 3500),
		new /datum/data/stalker_equipment("Огненный шар",	"Огненный шар",								/obj/item/weapon/artifact/fireball,					15000, NEWBIE, sale_price = 7500),
		new /datum/data/stalker_equipment("Кристалл",		"Кристалл",									/obj/item/weapon/artifact/crystal,					100000, NEWBIE, sale_price = 50000),
		new /datum/data/stalker_equipment("Кровь Камн&#x44F;","Кровь Камн&#x44F;",						/obj/item/weapon/artifact/stone_blood,				4000, NEWBIE, sale_price = 2000),
		new /datum/data/stalker_equipment("Душа",			"Душа",										/obj/item/weapon/artifact/soul,						8000, NEWBIE, sale_price = 4000),
		new /datum/data/stalker_equipment("Пузырь",			"Пузырь",									/obj/item/weapon/artifact/bubble,					30000, NEWBIE, sale_price = 15000),

		)

	var/attachment_list = list(
		/////////////////////////////////	Аттачменты	///////////////////////////////////////////
		new /datum/data/stalker_equipment("SUSAT",				"СУСАТ",							/obj/item/weapon/attachment/scope/SUSAT,			5000, EXPERT),
		new /datum/data/stalker_equipment("PSU-1",				"ПСУ-1",							/obj/item/weapon/attachment/scope/PS/U1,			6000, EXPERT),
		new /datum/data/stalker_equipment("PSO-1",				"ПСО-1",							/obj/item/weapon/attachment/scope/PS/O1,			7000, EXPERT),
		new /datum/data/stalker_equipment("Universl suppressor","Универсальный глушитель",			/obj/item/weapon/attachment/suppressor,				2000, NEWBIE),

		)

var/list/sidormatitems = list()

/datum/data/stalker_equipment/
	var/equipment_name_eng = "generic"
	var/equipment_name = "generic"
	var/equipment_path = null
	var/cost = 0
	var/rating = 0
	var/faction = "Одиночки"
	var/sale_price = 0

/datum/data/stalker_equipment/New(equipment_name_eng, name, path, cost, rating, faction = "Одиночки", sale_price = 0)
	src.equipment_name_eng = equipment_name_eng
	src.equipment_name = name
	src.equipment_path = path
	src.cost = cost
	src.rating = rating
	src.faction = faction
	if(sale_price)
		src.sale_price = sale_price
	else
		src.sale_price = cost/2
	sidormatitems += src

/obj/machinery/stalker/sidormat/New()
	itemloc = locate(x - 1, y, z)
	itemloc2 = locate(x + 1, y, z)

/obj/machinery/stalker/sidormat/attack_hand(mob/user)
	balance = 0
	if(..())
		return
	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		if(istype(H.wear_id, /obj/item/device/stalker_pda))
			var/datum/data/record/sk = find_record("sid", H.sid, data_core.stalkers)
			var/obj/item/device/stalker_pda/KPK = H.wear_id
			if(sk && KPK.activated)
				if(KPK.sid == H.sid)
					interact(user)
				else
					say("No access.")
			else
				say("Activate your profile in KPK.")
		else
			say("Put on your KPK.")

/obj/machinery/stalker/sidormat/interact(mob/user)
	var/mob/living/carbon/human/H = user
	if(istype(H.wear_id, /obj/item/device/stalker_pda))
		var/datum/data/record/sk = find_record("sid", H.sid, data_core.stalkers)
		var/obj/item/device/stalker_pda/KPK = H.wear_id
		if(sk && KPK.activated)
			if(KPK.sid == H.sid)
				balance = sk.fields["money"]
				rating = sk.fields["rating"]
			else
				say("No access.")
		else
			say("Activate your profile in KPK.")
	else
		say("Put on your KPK.")

	var/dat
	dat +="<div class='statusDisplay'>"
	dat +="<A href='?src=\ref[src];choice=take'><b>Сбыть хабар.</b></A><br>"

	dat += "На счету: [balance] р.<br>"
		//<A href='?src=\ref[src];choice=eject'>Вернуть деньги.</A>
	//else
	//	dat += "На счету отсутствуют деньги.  <A href='?src=\ref[src];choice=insert'>Вставьте купюру.</A><br>"

	dat += "<br><br>ИНСТРУКЦИЯ: Хабар складывать - на <b>левом</b> столе." // Забирать деньги и купленные вещи - на <b>правом</b>.
	dat += "<br><br>INSTRUCTION: Put habar for sale on the <b>left</b> table." // Забирать деньги и купленные вещи - на <b>правом</b>.
	dat += "</div>"
	dat += "<br><b>Список предметов:</b><BR><table border='0' width='400'>"
	dat += "<tr><td><center><b>Оружие</b></center></td><td></td><td></td></tr>"
	for(var/datum/data/stalker_equipment/prize in weapon_list)
		if(H.faction_s == prize.faction || prize.faction == "Одиночки")
			if(rating >= prize.rating)
				dat += "<tr><td>[prize.equipment_name_eng]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>Buy</A></td></tr>"

	dat += "<tr><td></td><td></td><td></td></tr><tr><td><center><b>Боеприпасы</b></center></td><td></td><td></td></tr>"
	for(var/datum/data/stalker_equipment/prize in ammo_list)
		if(H.faction_s == prize.faction || prize.faction == "Одиночки")
			if(rating >= prize.rating)
				dat += "<tr><td>[prize.equipment_name_eng]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>Buy</A></td></tr>"

	dat += "<tr><td></td><td></td><td></td></tr><tr><td><center><b>Бронекостюмы</b></center></td><td></td><td></td></tr>"
	for(var/datum/data/stalker_equipment/prize in armor_list)
		if(H.faction_s == prize.faction || prize.faction == "Одиночки")
			if(rating >= prize.rating)
				dat += "<tr><td>[prize.equipment_name_eng]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>Buy</A></td></tr>"

	dat += "<tr><td></td><td></td><td></td></tr><tr><td><center><b>Шлемы и противогазы</b></center></td><td></td><td></td></tr>"
	for(var/datum/data/stalker_equipment/prize in helmet_list)
		if(H.faction_s == prize.faction || prize.faction == "Одиночки")
			if(rating >= prize.rating)
				dat += "<tr><td>[prize.equipment_name_eng]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>Buy</A></td></tr>"

	dat += "<tr><td></td><td></td><td></td></tr><tr><td><center><b>Медикаменты</b></center></td><td></td><td></td></tr>"
	for(var/datum/data/stalker_equipment/prize in med_list)
		if(H.faction_s == prize.faction || prize.faction == "Одиночки")
			if(rating >= prize.rating)
				dat += "<tr><td>[prize.equipment_name_eng]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>Buy</A></td></tr>"

	dat += "<tr><td></td><td></td><td></td></tr><tr><td><center><b>Еда</b></center></td><td></td><td></td></tr>"
	for(var/datum/data/stalker_equipment/prize in food_list)
		if(H.faction_s == prize.faction || prize.faction == "Одиночки")
			if(rating >= prize.rating)
				dat += "<tr><td>[prize.equipment_name_eng]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>Buy</A></td></tr>"

	dat += "<tr><td></td><td></td><td></td></tr><tr><td><center><b>Детекторы</b></center></td><td></td><td></td></tr>"
	for(var/datum/data/stalker_equipment/prize in detector_list)
		if(H.faction_s == prize.faction || prize.faction == "Одиночки")
			if(rating >= prize.rating)
				dat += "<tr><td>[prize.equipment_name_eng]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>Buy</A></td></tr>"

	dat += "<tr><td></td><td></td><td></td></tr><tr><td><center><b>Другое</b></center></td><td></td><td></td></tr>"
	for(var/datum/data/stalker_equipment/prize in misc_list)
		if(H.faction_s == prize.faction || prize.faction == "Одиночки")
			if(rating >= prize.rating)
				dat += "<tr><td>[prize.equipment_name_eng]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>Buy</A></td></tr>"

	dat += "<tr><td></td><td></td><td></td></tr><tr><td><center><b>Модификации</b></center></td><td></td><td></td></tr>"
	for(var/datum/data/stalker_equipment/prize in attachment_list)
		if(H.faction_s == prize.faction || prize.faction == "Одиночки")
			if(rating >= prize.rating)
				dat += "<tr><td>[prize.equipment_name_eng]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>Buy</A></td></tr>"

	dat += "</table>"

	var/datum/browser/popup = new(user, "miningvendor", "SIDORMAT 3000", 500, 450)
	popup.set_content(dat)
	popup.open()
	return

/obj/machinery/stalker/sidormat/Topic(href, href_list)
	if(..())
		return

	var/mob/living/carbon/human/H = usr
	if(istype(H.wear_id, /obj/item/device/stalker_pda))
		var/datum/data/record/sk = find_record("sid", H.sid, data_core.stalkers)
		var/obj/item/device/stalker_pda/KPK = H.wear_id
		if(sk && KPK.activated)
			if(KPK.sid == H.sid)
				if(href_list["choice"])
					if(href_list["choice"] == "take")
						SellItems()

				if(href_list["purchase"])
					var/datum/data/stalker_equipment/prize = locate(href_list["purchase"])
					if (!prize)
						return
					if(prize.cost > sk.fields["money"])
						say("You have not enough money.")
					else
						sk.fields["money"] -= prize.cost
						balance = sk.fields["money"]
						new prize.equipment_path(itemloc2)
			else
				say("No access.")
		else
			say("Activate your profile in KPK.")
	else
		say("Put on your KPK.")

	updateUsrDialog()
	return

	/*
	if(href_list["choice"])
		if(href_list["choice"] == "take")
			SellItems()
		if(balance)
			if(href_list["choice"] == "eject")
				GiveMoney(balance)
				balance = 0
		else if(href_list["choice"] == "insert")
			var/obj/item/stack/spacecash/I = usr.get_active_hand()
			if(istype(I))
				if(!usr.drop_item())
					return
				balance += (I.worth * I.amount)
				qdel(I)
			else usr << "<span class='danger'>Нет купюры.</span>"
	if(href_list["purchase"])
		if(balance)
			var/datum/data/stalker_equipment/prize = locate(href_list["purchase"])
			if (!prize)
				return
			if(prize.cost > balance)
				say("На вашем счету недостаточно денег")
			else
				balance -= prize.cost
				new prize.equipment_path(itemloc2)
	*/

/*
/obj/machinery/stalker/sidormat/attackby(obj/item/I, mob/user, params)
	if(istype(I,/obj/item/stack/spacecash))
		var/obj/item/stack/spacecash/C = usr.get_active_hand()
		if(istype(C))
			if(!usr.drop_item())
				return
//			C.loc = src
			balance += (C.worth * C.amount)
			qdel(C)
			interact(user)
		return
	..()
*/
/obj/machinery/stalker/sidormat/proc/SellItems()
	var/list/ontable = GetItemsOnTable()
	var/total_cost = GetOnTableCost()
//	for(var/I in ontable)
//		qdel(I)
	var/mob/living/carbon/human/H = usr
	if(istype(H.wear_id, /obj/item/device/stalker_pda))
		var/datum/data/record/sk = find_record("sid", H.sid, data_core.stalkers)
		var/obj/item/device/stalker_pda/KPK = H.wear_id
		if(sk)
			if(KPK.sid == H.sid)
				if(total_cost > 100)
					sk.fields["money"] += total_cost
					balance = sk.fields["money"]
					for(var/I in ontable)
						qdel(I)
					say("Habar was sold successfully.")
				else
					say("Habar was not sold.")
			else
				say("No access.")
		else
			say("Activate your profile in KPK.")
	else
		say("Put on your KPK.")

/obj/machinery/stalker/sidormat/proc/GetItemsOnTable()
	var/list/ontable = list()
	for(var/atom/movable/AM in itemloc)
		if(GetCost(AM.type) || istype(AM, /obj/item/stack/spacecash))

			if(istype(AM, /obj/item/clothing))
				var/obj/item/clothing/C = AM
				if((C.durability / initial(C.durability)) * 100 < 75)
					//say("Костюм слишком изношен дл&#255; продажи.")
					continue

			ontable.Add(AM)
//	for(var/atom/movable/AM in itemloc2)
//		if(GetCost(AM.type) || istype(AM, /obj/item/stack/spacecash))
//			ontable.Add(AM)
	return ontable

/obj/machinery/stalker/sidormat/proc/GetOnTableCost()
	var/list/ontable = GetItemsOnTable()
	var/total_cost = 0

	for(var/atom/item_on_table in ontable)
		var/obj/item/stack/spacecash/C = item_on_table
		switch(item_on_table.type)
			if(/obj/item/stack/spacecash/c50)
				total_cost += 50 * C.amount
			if(/obj/item/stack/spacecash/c100)
				total_cost += 100 * C.amount
			if(/obj/item/stack/spacecash/c500)
				total_cost += 500 * C.amount
			if(/obj/item/stack/spacecash/c1000)
				total_cost += 1000 * C.amount
			if(/obj/item/stack/spacecash/c5000)
				total_cost += 5000 * C.amount
		var/cost = GetCost(item_on_table.type, 0)
		if(cost)
			total_cost += cost
		else
			ontable.Remove(item_on_table)
	return total_cost

/*
/obj/machinery/stalker/sidormat/proc/GiveMoney(amount)
	var/balance = amount
	var/oldbalance = 0
	while(balance >= 50)
		oldbalance = balance

		var/to_give = RemoveFloat(balance / 5000)
		GiveBills(to_give, 5000)
		var/count = to_give * 5000
		balance -= count

		to_give = RemoveFloat(balance / 1000)
		GiveBills(to_give, 1000)
		count = to_give * 1000
		balance -= count

		to_give = RemoveFloat(balance / 500)
		GiveBills(to_give, 500)
		count = to_give * 500
		balance -= count

		to_give = RemoveFloat(balance / 100)
		GiveBills(to_give, 100)
		count = to_give * 100
		balance -= count

		to_give = RemoveFloat(balance / 50)
		GiveBills(to_give, 50)
		count = to_give * 50
		balance -= count


		if(balance == oldbalance)
			break
*/
/*
/obj/machinery/stalker/sidormat/proc/GiveBills(amount, billtype)
	if(!amount)
		return

	var/obj/item/stack/spacecash/bill = null
	if(billtype == 5000)
		bill = new /obj/item/stack/spacecash/c5000(itemloc2)
	if(billtype == 1000)
		bill = new /obj/item/stack/spacecash/c1000(itemloc2)
	if(billtype == 500)
		bill = new /obj/item/stack/spacecash/c500(itemloc2)
	if(billtype == 100)
		bill = new /obj/item/stack/spacecash/c100(itemloc2)
	if(billtype == 50)
		bill = new /obj/item/stack/spacecash/c50(itemloc2)
	bill.amount = amount
*/
/*
/obj/machinery/stalker/sidormat/proc/GetCost(itemtype, half = 0)
	for(var/sidoritem/I in sidoritems)
		if(I.itemtype == itemtype)
			if(half)
				return I.cost / 2
			return I.cost
	return 0
*/
/obj/machinery/stalker/sidormat/proc/GetCost(itemtype)
	for(var/datum/data/stalker_equipment/se in sidormatitems)
		if(itemtype == se.equipment_path)
			return se.sale_price
	return 0
/*/proc/RemoveFloat(number)
	var/result = round(number)
	if(result > number)
		result--
	return result*/

/*/obj/machinery/stalker/sidormat/proc/RedeemVoucher(obj/item/weapon/mining_voucher/voucher, mob/redeemer)
	var/selection = input(redeemer, "Pick your equipment", "Mining Voucher Redemption") as null|anything in list("Kinetic Accelerator", "Resonator", "Mining Drone", "Advanced Scanner")
	if(!selection || !Adjacent(redeemer) || voucher.gc_destroyed || voucher.loc != redeemer)
		return
	switch(selection)
		if("PM")
			new /obj/item/weapon/gun/projectile/automatic/pistol/pm(src.loc)
	qdel(voucher)*/

/obj/machinery/stalker/sidormat/ex_act(severity, target)
	return