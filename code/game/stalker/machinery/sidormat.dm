var/global/list/trash_tier_sidormatitems = list()
var/global/list/low_tier_sidormatitems = list()
var/global/list/medium_tier_sidormatitems = list()
var/global/list/high_tier_sidormatitems = list()
var/global/list/real_sidormat_items = list()

var/global/list/global_sidormat_list = list(
		///////////////////////////////  Оружие  /////////////////////////////////////////
	"Handguns" = list(
		///////////////////////////// **Пистолеты** /////////////////////////////////////
		new /datum/data/stalker_equipment("PMm", 			"ПМм",				/obj/item/weapon/gun/projectile/automatic/pistol/pm,				3000, ROOKIE),
		new /datum/data/stalker_equipment("TT", 			"ТТ",				/obj/item/weapon/gun/projectile/automatic/pistol/tt,				3000, ROOKIE),
		new /datum/data/stalker_equipment("Fort-12",		"Форт-12",			/obj/item/weapon/gun/projectile/automatic/pistol/fort12,			6500, ROOKIE),
		new /datum/data/stalker_equipment("PB1s",			"ПБС1с",			/obj/item/weapon/gun/projectile/automatic/pistol/pb1s,				4500, ROOKIE),
		new /datum/data/stalker_equipment("SIG-Sauer P220",	"П-220",			/obj/item/weapon/gun/projectile/automatic/pistol/sip,				12500, EXPERIENCED),
		new /datum/data/stalker_equipment("Colt M1911",		"Кольт",			/obj/item/weapon/gun/projectile/automatic/pistol/cora,				9000, EXPERIENCED),
		new /datum/data/stalker_equipment("Beretta 92FS",	"Беретта",			/obj/item/weapon/gun/projectile/automatic/pistol/marta,				9000, EXPERIENCED),
		new /datum/data/stalker_equipment("USP-match",		"ЮСП-матч",			/obj/item/weapon/gun/projectile/automatic/pistol/usp_match, 		16000, EXPERIENCED),
		new /datum/data/stalker_equipment("Colt Anaconda",	"Кольт Анаконда",	/obj/item/weapon/gun/projectile/revolver/anaconda, 	            	25000, EXPERIENCED),
		new /datum/data/stalker_equipment("Desert Eagle",	"Дёзерт Игл",		/obj/item/weapon/gun/projectile/automatic/pistol/desert, 	    	30000, EXPERIENCED)
		),

	"Automatic Weapons" = list(
		///////////////////////////// **Автоматы, ПП** /////////////////////////////////////
		new /datum/data/stalker_equipment("Beretta M38", 	"Беретта М38",		/obj/item/weapon/gun/projectile/automatic/berettam38,				10000, ROOKIE),
		new /datum/data/stalker_equipment("Kiparis", 		"Кипарис",			/obj/item/weapon/gun/projectile/automatic/kiparis,					10000, ROOKIE),
		new /datum/data/stalker_equipment("PPSh",			"ППШ",				/obj/item/weapon/gun/projectile/automatic/ppsh,						15000, ROOKIE),
		new /datum/data/stalker_equipment("MP-5", 			"МП-5",				/obj/item/weapon/gun/projectile/automatic/mp5,						18000, ROOKIE),
		new /datum/data/stalker_equipment("AK-74S",			"АК-74У",			/obj/item/weapon/gun/projectile/automatic/aksu74 ,					24000, ROOKIE),
		new /datum/data/stalker_equipment("AK-74",			"АК-74",			/obj/item/weapon/gun/projectile/automatic/ak74,						30000, ROOKIE),
		new /datum/data/stalker_equipment("AS-96",			"АС-96",			/obj/item/weapon/gun/projectile/automatic/abakan,					40000, EXPERIENCED),
		new /datum/data/stalker_equipment("LR-300",			"ЛР-300",			/obj/item/weapon/gun/projectile/automatic/tpc301,					40000, EXPERIENCED),
		new /datum/data/stalker_equipment("L85",			"Л85",				/obj/item/weapon/gun/projectile/automatic/il86,						40000, EXPERIENCED),
		new /datum/data/stalker_equipment("Tunder OTs-14", 	"ОЦ-14 Гроза",		/obj/item/weapon/gun/projectile/automatic/groza,					35000, EXPERIENCED),
		new /datum/data/stalker_equipment("AS \"Val\"", 	"АС \"Вал\"",		/obj/item/weapon/gun/projectile/automatic/val,						50000, VETERAN),
		new /datum/data/stalker_equipment("SIG SG 550",		"СИГ СГ 550",		/obj/item/weapon/gun/projectile/automatic/sigsg550,					50000, VETERAN),
		new /datum/data/stalker_equipment("FN F2000", 		"ФН Ф2000",			/obj/item/weapon/gun/projectile/automatic/fnf2000,					65000, EXPERT),
		new /datum/data/stalker_equipment("GP 37", 	    	"ГП 37",			/obj/item/weapon/gun/projectile/automatic/gp37,						75000, EXPERT),
		new /datum/data/stalker_equipment("FN F2000S", 		"ФН Ф2000С",		/obj/item/weapon/gun/projectile/automatic/fnf2000s,					100000, EXPERT),
		new /datum/data/stalker_equipment("PKM", 			"ПКМ",				/obj/item/weapon/gun/projectile/automatic/l6_saw/pkm,				200000, EXPERT)
		),

	"Shotguns" = list(
		/////////////////////////////// **Дробовики** /////////////////////////////////////
		new /datum/data/stalker_equipment("Sawn off", 		"Обрез",			/obj/item/weapon/gun/projectile/revolver/bm16/sawnoff,				6000, ROOKIE),
		new /datum/data/stalker_equipment("BM-16", 			"БМ-16",			/obj/item/weapon/gun/projectile/revolver/bm16,						10000, ROOKIE),
		new /datum/data/stalker_equipment("TOZ-34", 		"ТОЗ-34", 			/obj/item/weapon/gun/projectile/revolver/bm16/toz34, 				15000, ROOKIE),
		new /datum/data/stalker_equipment("Ithaca M37",		"Итака М37",		/obj/item/weapon/gun/projectile/shotgun/ithaca,						20000, EXPERIENCED),
		new /datum/data/stalker_equipment("Wincheaster-1300","Винчестер-1300",	/obj/item/weapon/gun/projectile/shotgun/chaser,						30000, EXPERIENCED),
		new /datum/data/stalker_equipment("SPAS-12", 		"СПАС-12",			/obj/item/weapon/gun/projectile/shotgun/spsa, 						50000, VETERAN)
		),

	"Rifles" = list(
		/////////////////////////////// **Винтовки** /////////////////////////////////////
		new /datum/data/stalker_equipment("Lee Enfield", 	"Ли Энфилд",		/obj/item/weapon/gun/projectile/shotgun/boltaction/enfield,			15000, ROOKIE),
		new /datum/data/stalker_equipment("Vintorez", 		"Винторез",			/obj/item/weapon/gun/projectile/automatic/vintorez,					60000, EXPERT)
		),

	"Melee Weapons" = list(
		/////////////////////////////// **Другое** /////////////////////////////////////
		new /datum/data/stalker_equipment("Knife",			 "Нож",				/obj/item/weapon/stalker/knife,										3500, ROOKIE)
		),

	"Ammo Boxes" = list(
		////////////////////////////////  Патроны  /////////////////////////////////////////
		new /datum/data/stalker_equipment("9x18mm Box",				"Коробка 9х18мм",							/obj/item/ammo_box/stalker/b9x18,						1500, ROOKIE),
		new /datum/data/stalker_equipment("9x18mm AP Box",			"Коробка 9x18мм Бронебойные",				/obj/item/ammo_box/stalker/b9x18P,						2500, EXPERIENCED),
		new /datum/data/stalker_equipment("7.62x25mm Box",			"Коробка 7.62x25мм",						/obj/item/ammo_box/stalker/b762x25,						1500, ROOKIE),
		new /datum/data/stalker_equipment("9x19mm Box",				"Коробка 9x19мм",							/obj/item/ammo_box/stalker/b9x19,						2500, ROOKIE),
		new /datum/data/stalker_equipment("9x19mm AP Box",			"Коробка 9x19мм Бронебойные",				/obj/item/ammo_box/stalker/b9x19P,						3750, EXPERIENCED),
		new /datum/data/stalker_equipment(".45 ACP Box",			"Коробка .45 ACP",							/obj/item/ammo_box/stalker/bacp45,						5000, ROOKIE),
		new /datum/data/stalker_equipment(".45 ACP Hydroshock Box",	"Коробка .45 ACP Hydroshock",				/obj/item/ammo_box/stalker/bacp45ap,					7500, EXPERIENCED),
		new /datum/data/stalker_equipment(".44 Magnum Box",			"Коробка .44 Магнум",						/obj/item/ammo_box/stalker/bmag44,						7000, EXPERIENCED),
		new /datum/data/stalker_equipment(".44 Magnum FMJ Box",		"Коробка .44 Магнум Цельномет. оболочка",	/obj/item/ammo_box/stalker/bmag44fmj,					10000, EXPERIENCED),
		new /datum/data/stalker_equipment("12x70 Buckshot Box",		"Коробка дроби 12x70",						/obj/item/ammo_box/stalker/b12x70,						3000, ROOKIE),
		new /datum/data/stalker_equipment("12x70 Slug Box",			"Коробка дроби 12x70 Бронебойные",			/obj/item/ammo_box/stalker/b12x70P,						4500, EXPERIENCED),
		new /datum/data/stalker_equipment("12x70 Dart Box",			"Коробка 12x70 Дротик",						/obj/item/ammo_box/stalker/b12x70D,						6000, EXPERIENCED),
		new /datum/data/stalker_equipment("5.45x39mm Box",			"Коробка 5.45х39мм",						/obj/item/ammo_box/stalker/b545,						8000, ROOKIE),
		new /datum/data/stalker_equipment("5.45x39mm AP Box",		"Коробка 5.45х39мм Бронебойные",			/obj/item/ammo_box/stalker/b545ap,						12000, VETERAN),
		new /datum/data/stalker_equipment("5.56x45mm Box",			"Коробка 5.56x45мм",						/obj/item/ammo_box/stalker/b55645,						10000, ROOKIE),
		new /datum/data/stalker_equipment("5.56x45mm AP Box",		"Коробка 5.56x45мм Бронебойные",			/obj/item/ammo_box/stalker/b55645ap,					15000, VETERAN),
		new /datum/data/stalker_equipment("7.62x51 Box",			"Коробка 7.62х51",							/obj/item/ammo_box/stalker/b762x51,						8000, ROOKIE),
		new /datum/data/stalker_equipment("9x39 PAB-9 Box",			"Коробка 9x39мм ПАБ-9",						/obj/item/ammo_box/stalker/b939,						10000, EXPERIENCED)
		),

	"Ammo Magazines and Clips" = list(
		new /datum/data/stalker_equipment("PMm; PB1s Magazine",		"Магазин к ПМм; ПБ1с",						/obj/item/ammo_box/magazine/stalker/m9x18pm,			700, ROOKIE),
		new /datum/data/stalker_equipment("TT Magazine",			"Магазин к ТТ",								/obj/item/ammo_box/magazine/stalker/tt,					600, ROOKIE),
		new /datum/data/stalker_equipment("Fort-12 Magazine",		"Магазин к Форт-12",						/obj/item/ammo_box/magazine/stalker/m9x18fort,			1000, ROOKIE),
		new /datum/data/stalker_equipment("Kiparis Magazine",		"Магазин к Кипарису",						/obj/item/ammo_box/magazine/stalker/kiparis,			1400, ROOKIE),
		new /datum/data/stalker_equipment("MP-5 Magazine",			"Магазин к МП-5",							/obj/item/ammo_box/magazine/stalker/m9x19mp5,			2000, ROOKIE),
		new /datum/data/stalker_equipment("PPSh Drum",				"Магазин к ППШ",							/obj/item/ammo_box/magazine/stalker/ppsh,				5000, ROOKIE),
		new /datum/data/stalker_equipment("5.45x39mm Magazine",		"Магазин 5.45x39мм",						/obj/item/ammo_box/magazine/stalker/m545,				2250, ROOKIE),
		new /datum/data/stalker_equipment("5.56x45mm Magazine",		"Магазин 5.56x45мм",						/obj/item/ammo_box/magazine/stalker/m556x45,			3500, ROOKIE),
		new /datum/data/stalker_equipment("AS \"Val\" Magazine",	"Магазин к АС \"Вал\"",						/obj/item/ammo_box/magazine/stalker/sp9x39val,			3000, VETERAN),
		new /datum/data/stalker_equipment("Tunder S14 Magazine",	"Магазин к ОЦ-14 Гроза",					/obj/item/ammo_box/magazine/stalker/sp9x39groza,		3500, EXPERIENCED),
		new /datum/data/stalker_equipment("Vintorez Magazine",		"Магазин к Винторезу",						/obj/item/ammo_box/magazine/stalker/sp9x39vint,			3000, VETERAN),
		new /datum/data/stalker_equipment("Colt M1911; SIG-Sauer P220 Magazine", "Магазин к Кольту; П-220",		/obj/item/ammo_box/magazine/stalker/sc45,				1400, ROOKIE),
		new /datum/data/stalker_equipment("Beretta 92FS Magazine",	"Магазин к Беретте 92ФС",					/obj/item/ammo_box/magazine/stalker/m9x19marta,			1500, ROOKIE),
		new /datum/data/stalker_equipment("Beretta M38 Magazine",	"Магазин к Беретте М38",					/obj/item/ammo_box/magazine/stalker/berettam38,			1250, ROOKIE),
		new /datum/data/stalker_equipment("USP-match Magazine",		"Магазин к ЮСП-Матч",						/obj/item/ammo_box/magazine/stalker/usp45,				2500, ROOKIE),
		new /datum/data/stalker_equipment("Desert Eagle Magazine",	"Магазин к Desert Eagle",					/obj/item/ammo_box/magazine/stalker/desert,				2000, EXPERIENCED),
		new /datum/data/stalker_equipment("PKM ammo belt box",		"Жестянка с лентой к ПКМ",					/obj/item/ammo_box/magazine/stalker/pkm,				20000, EXPERIENCED),
		new /datum/data/stalker_equipment("7.62x51 Clip",			"Обойма 7.62х51",				 			/obj/item/ammo_box/stalker/cl762x51,					800, ROOKIE),
		),

	"Suits" = list(
		///////////////////////////////  Броня  /////////////////////////////////////////
		new /datum/data/stalker_equipment("Leather jacket", 		"Кожанка",						/obj/item/clothing/suit/hooded/kozhanka,					5000, ROOKIE),
		new /datum/data/stalker_equipment("White leather jacket",	"Бела&#x44F; кожанка",			/obj/item/clothing/suit/hooded/kozhanka/white,				5000, ROOKIE),
		new	/datum/data/stalker_equipment("Bandit jacket",			"Бандитска&#x44F; кожанка",		/obj/item/clothing/suit/hooded/kozhanka/banditka,			6000, ROOKIE,	faction = "Bandits"),
		new	/datum/data/stalker_equipment("Army suit",				"Армейский комбинезон",			/obj/item/clothing/suit/army,								15000, ROOKIE,	faction = "Army"),
		new /datum/data/stalker_equipment("\"Sunrize\"",			"Комбинезон \"Зар&#x44F;\"",	/obj/item/clothing/suit/hooded/kombez,						33000, ROOKIE,	faction = "Loners"),
		new /datum/data/stalker_equipment("Merc suit", 				"Комбинезон наёмников",			/obj/item/clothing/suit/hooded/kombez/mercenary,			25000, ROOKIE,	faction = "Mercenaries"),
		new /datum/data/stalker_equipment("Bandit suit",			"Комбинезон бандитов",			/obj/item/clothing/suit/hooded/kombez/kombez_bandit,		25000, ROOKIE,	faction = "Bandits"),
		new /datum/data/stalker_equipment("Black trenchcoat",		"Тёмный плащ",					/obj/item/clothing/suit/hooded/kozhanka/banditka/coat,		12500, ROOKIE,	faction = "Bandits"),
		new /datum/data/stalker_equipment("Brown trenchcoat",		"Плащ",							/obj/item/clothing/suit/hooded/kozhanka/banditka/coat/brown,12500, ROOKIE),
		new /datum/data/stalker_equipment("Berill-5M",				"Берилл-5М",					/obj/item/clothing/suit/berill,								50000, EXPERIENCED,	faction = "Loners"),
		new /datum/data/stalker_equipment("Wind of Freedom",	    "Ветер Свободы",				/obj/item/clothing/suit/hooded/kombez/veter,				25000, ROOKIE,	faction = "Freedom"),
		new /datum/data/stalker_equipment("Guardian of Freedom",	"Страж Свободы",				/obj/item/clothing/suit/strazh,								40000, EXPERIENCED,	faction = "Freedom"),
		new /datum/data/stalker_equipment("PZ-1	",					"ПЗ-1",							/obj/item/clothing/suit/hooded/kombez/monolith,				25000, ROOKIE,	faction = "Monolith"),
		new /datum/data/stalker_equipment("PS5-M",					"ПС5-М",						/obj/item/clothing/suit/hooded/kombez/ps5m,				    25000, ROOKIE,	faction = "Duty"),
		new /datum/data/stalker_equipment("Heavy merc armor",		"Тяжелая броня наёмников",		/obj/item/clothing/suit/assaultmerc,						50000, EXPERIENCED,	faction = "Mercenaries"),
		new /datum/data/stalker_equipment("PSZ-9D",		    		"ПСЗ-9Д",						/obj/item/clothing/suit/psz9d,								60000, VETERAN,	faction = "Duty"),
		new /datum/data/stalker_equipment("SKAT-9M",				"СКАТ-9М",						/obj/item/clothing/suit/skat,								75000, VETERAN),
		new	/datum/data/stalker_equipment("PSZ-9Md",				"ПСЗ-9Мд",						/obj/item/clothing/suit/hooded/sealed/psz9md,				75000, VETERAN,	faction = "Duty"),
		new	/datum/data/stalker_equipment("SSP-99 Ecologist",		"ССП-99 Эколог",				/obj/item/clothing/suit/hooded/sealed/ecolog,				75000, EXPERT),
		new	/datum/data/stalker_equipment("SSP-99M Ecologist",		"ССП-99М Эколог",				/obj/item/clothing/suit/hooded/sealed/ecologm,			    100000, EXPERT),
		new	/datum/data/stalker_equipment("SEVA",					"СЕВА",							/obj/item/clothing/suit/hooded/sealed/seva,					125000, EXPERT),
		new	/datum/data/stalker_equipment("Exoskeleton",			"Экзоскелет",					/obj/item/clothing/suit/hooded/sealed/exoskelet,			150000, EXPERT, assortment_level = 5)
		),

	"Masks and Helmets" = list(
		////////////////////////////	Маски, Шлемы	/////////////////////////////////////
		new /datum/data/stalker_equipment("Gasmask",				"Противогаз",					/obj/item/clothing/mask/gas/stalker,						7500, ROOKIE),
		new /datum/data/stalker_equipment("Merc gasmask",			"Противогаз наемников",			/obj/item/clothing/mask/gas/stalker/mercenary,				7500, ROOKIE),
		new /datum/data/stalker_equipment("Steel helmet",			"Стальная каска",				/obj/item/clothing/head/steelhelmet,						7500, ROOKIE),
		new /datum/data/stalker_equipment("Light tactical helmet",	"Легкий тактический шлем",		/obj/item/clothing/head/hardhat/tacticalhelmet/light,		12500, EXPERIENCED),
		new /datum/data/stalker_equipment("Tactical helmet",		"Тактический шлем",				/obj/item/clothing/head/tacticalhelmet,					25000, EXPERIENCED),
		new /datum/data/stalker_equipment("Assault helmet",	    	"Штурмовой шлем",				/obj/item/clothing/head/assaultmerc        ,				30000, EXPERIENCED, faction = "Mercenaries"),
		new /datum/data/stalker_equipment("Sphera-M12",			 	"Сфера-М12",					/obj/item/clothing/head/spheram,							30000, EXPERIENCED),
		new /datum/data/stalker_equipment("SKAT-9M (helmet)",		"СКАТ-9М (шлем)",				/obj/item/clothing/head/skathelmet,							40000, VETERAN)
		),

	"Medicine" = list(
		///////////////////////////////	Медикаменты	/////////////////////////////////////////
		new /datum/data/stalker_equipment("Medkit",				"Аптечка",							/obj/item/weapon/reagent_containers/pill/stalker/aptechka/civilian,			1000, ROOKIE),
		new /datum/data/stalker_equipment("Army medkit",		"Армейска&#x44F; аптечка",			/obj/item/weapon/reagent_containers/pill/stalker/aptechka/army,				2500, EXPERIENCED),
		new /datum/data/stalker_equipment("Scientific medkit",	"Научна&#x44F; аптечка",			/obj/item/weapon/reagent_containers/pill/stalker/aptechka/scientific,		5000, VETERAN),
		new /datum/data/stalker_equipment("Bandage",			"Бинт",								/obj/item/stack/medical/gauze/bint,											750, ROOKIE),
		new /datum/data/stalker_equipment("Anti-rad",			"Анти-рад препараты",				/obj/item/weapon/reagent_containers/hypospray/medipen/stalker/antirad,		3500, ROOKIE)
		),

	"Food" = list(
		/////////////////////////////////	Еда	///////////////////////////////////////////
		new /datum/data/stalker_equipment("Canned stew",		"Тушенка",							/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva,				550, ROOKIE),
		new /datum/data/stalker_equipment("Canned fish",		"Шпроты",							/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/shproti,		750, ROOKIE),
		new /datum/data/stalker_equipment("Vodka \"Kazaki\"",	"Водка \"Казаки\"",					/obj/item/weapon/reagent_containers/food/drinks/bottle/vodka/kazaki,			1500, ROOKIE),
		new /datum/data/stalker_equipment("Energy drink \"NonStop\"","Энергетик \"NonStop\"",		/obj/item/weapon/reagent_containers/food/drinks/soda_cans/energetic,			500, ROOKIE),
		new /datum/data/stalker_equipment("Snickers",			"Сникерс",							/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/snack/snikers,	300, EXPERIENCED),
		new /datum/data/stalker_equipment("Salami",				"Колбаса",							/obj/item/weapon/reagent_containers/food/snacks/stalker/kolbasa,				500, ROOKIE),
		new /datum/data/stalker_equipment("Bread",				"Батон",							/obj/item/weapon/reagent_containers/food/snacks/stalker/baton,					400, ROOKIE)
		),

	"Misc" = list(
		/////////////////////////////////	Другое	/////////////////////////////////////////////
		new /datum/data/stalker_equipment("Repair-kit for suits and helmets",	"Рем. комплект дл&#x44F; бронекостюмов и шлемов",	/obj/item/device/repair_kit/clothing,										10000, ROOKIE),
		new /datum/data/stalker_equipment("Repair-kit for guns",				"Рем. комплект дл&#x44F; огнестрельного оружи&#x44F;",/obj/item/device/repair_kit/gun,											3500, ROOKIE),
		new /datum/data/stalker_equipment("Guitar",								"Гитара",											/obj/item/device/instrument/guitar,											3000, ROOKIE),
		new /datum/data/stalker_equipment("Geiger counter",						"Дозиметр",											/obj/item/device/geiger_counter,											3000, ROOKIE),
		new /datum/data/stalker_equipment("Flashlight",							"Фонарик",											/obj/item/device/flashlight/seclite,										1000, ROOKIE),
		new /datum/data/stalker_equipment("Big Artifact belt",					"Большой по&#x44F;с дл&#x44F; артефактов",			/obj/item/weapon/storage/belt/stalker/artifact_belt,						60000, EXPERIENCED),
		new /datum/data/stalker_equipment("Artifact belt",						"Маленький по&#x44F;с дл&#x44F; артефактов",		/obj/item/weapon/storage/belt/stalker/artifact_belt/small,					25000, ROOKIE),
		new /datum/data/stalker_equipment("Matches",							"Спички",											/obj/item/weapon/storage/box/matches,										800, ROOKIE),
		new /datum/data/stalker_equipment("Cigarettes",							"Сигареты",											/obj/item/weapon/storage/fancy/cigarettes/cigpack_maxim,					2500, ROOKIE),
		new /datum/data/stalker_equipment("Cigars",								"Сигары",											/obj/item/weapon/storage/fancy/cigarettes/cigars,							10000, ROOKIE),
		new /datum/data/stalker_equipment("Backpack",							"Рюкзак",											/obj/item/weapon/storage/backpack/stalker,									2500, ROOKIE),
		new /datum/data/stalker_equipment("Satchel",							"Сумка",											/obj/item/weapon/storage/backpack/satchel/stalker,							2500, ROOKIE),
		new /datum/data/stalker_equipment("Under",								"Бабушкин свитер",									/obj/item/clothing/under/color/switer,										1000, ROOKIE),
		new /datum/data/stalker_equipment("Dark under",							"Тёмный бабушкин свитер",							/obj/item/clothing/under/color/switer/dark,									1500, ROOKIE),
		new /datum/data/stalker_equipment("Telnyashka",							"Тельняшка",										/obj/item/clothing/under/color/switer/lolg,									1500, ROOKIE),
		new /datum/data/stalker_equipment("Tracksuit",							"Спортивный костюм",								/obj/item/clothing/under/color/switer/tracksuit,							1500, ROOKIE),
		new /datum/data/stalker_equipment("Worn out army boots",				"Поношенные берцы",									/obj/item/clothing/shoes/jackboots/warm,									800, ROOKIE)
		),

	"Detectors" = list(
		/////////////////////////////////	Детекторы	///////////////////////////////////////////
		new /datum/data/stalker_equipment("Blink", 	"Отклик",							/obj/item/device/detector/blink,				4000, 	ROOKIE),
		new /datum/data/stalker_equipment("Bear",	"Медведь",							/obj/item/device/detector/bear,					12000, 	EXPERIENCED),
		new /datum/data/stalker_equipment("Veles",	"Велес",							/obj/item/device/detector/veles,				36000, 	VETERAN),
		),

	"Attachments" = list(
		/////////////////////////////////	Аттачменты	///////////////////////////////////////////
		new /datum/data/stalker_equipment("SUSAT",				"СУСАТ",							/obj/item/weapon/attachment/scope/SUSAT,			8000,	EXPERIENCED),
		new /datum/data/stalker_equipment("PSU-1",				"ПСУ-1",							/obj/item/weapon/attachment/scope/PS/U1,			6000,	EXPERIENCED),
		new /datum/data/stalker_equipment("PSO-1",				"ПСО-1",							/obj/item/weapon/attachment/scope/PS/O1,			10000,	EXPERIENCED),
		new /datum/data/stalker_equipment("WW2 rifles scope",	"Оптический прицел старых винтовок",/obj/item/weapon/attachment/scope/rifle,			8000,	ROOKIE),
		new /datum/data/stalker_equipment("Universl suppressor","Универсальный глушитель",			/obj/item/weapon/attachment/suppressor,				2000,	ROOKIE),
		///////////////////////////////////////////////////////////////////////////////////////////
		),

	"Unbuyable" = list(
		new /datum/data/stalker_equipment("Canned soup",	"Консервированный Суп",				/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/soup,				900),
		new /datum/data/stalker_equipment("Canиed beans",	"Консервированные Бобы",			/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/bobi,				750),
		new /datum/data/stalker_equipment("Canned stew",	"Тушенка",							/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/govyadina2,		900),
		new /datum/data/stalker_equipment("Canned fish",	"Консервированна&#x44F; рыба",		/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/fish,				750),
		new /datum/data/stalker_equipment("Cream cheese",	"Плавленый сыр",					/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/snack/sirok,		400),
		new /datum/data/stalker_equipment("Chocolate bar",	"Плитка шоколада",					/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/snack/chocolate,	600),
		new /datum/data/stalker_equipment("Biscuits",		"Галеты",							/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/galets,			400),
		new /datum/data/stalker_equipment("Cerreal",		"Каша",								/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/kasha,				550),
		new /datum/data/stalker_equipment("Canned meat",	"Тушенка",							/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/MREkonserva1,		700),
		new /datum/data/stalker_equipment("Canned meat",	"Тушенка",							/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/MREkonserva2,		700),
		new /datum/data/stalker_equipment("Canned meat with vegetables","Тушенка с овощами",	/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/MREkonserva3,		850),
		new /datum/data/stalker_equipment("Biscuits",		"Галеты",							/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/galets,			400),
		/////////////////////////////////	Лут с мутантов	///////////////////////////////////////////
		new /datum/data/stalker_equipment("Песий хвост",	"Песий хвост",										/obj/item/weapon/stalker/loot/dog_tail,			2500, ROOKIE, sale_price = 1250),
		new /datum/data/stalker_equipment("Плотий глаз",	"Плотий глаз",										/obj/item/weapon/stalker/loot/flesh_eye,		1800, ROOKIE, sale_price = 900),
		new /datum/data/stalker_equipment("Кабаний ног",	"Кабаний ног",										/obj/item/weapon/stalker/loot/boar_leg,			6000, ROOKIE, sale_price = 3000),
		new /datum/data/stalker_equipment("Cноркий рук",	"Снорукий рук",										/obj/item/weapon/stalker/loot/snork_leg,		7000, ROOKIE, sale_price = 3500),
		new /datum/data/stalker_equipment("Кровососий щупалец","Кровососий щупалец",							/obj/item/weapon/stalker/loot/bloodsucker,		16000, ROOKIE, sale_price = 8000),
		new /datum/data/stalker_equipment("Псевдопесий хвост","Псевдопесий хвост",								/obj/item/weapon/stalker/loot/pseudo_tail,		8000, ROOKIE, sale_price = 4000),
		new /datum/data/stalker_equipment("Контроллерий мозг","Контроллерий мозг",								/obj/item/weapon/stalker/loot/controller_brain,	40000, ROOKIE, sale_price = 20000),
		/////////////////////////////////	Артефакты	///////////////////////////////////////////
		new /datum/data/stalker_equipment("Медуза",				"Медуза",									/obj/item/weapon/artifact/meduza,					5000,	ROOKIE,	sale_price = 2500),
		new /datum/data/stalker_equipment("Каменный цветок",	"Каменный цветок",							/obj/item/weapon/artifact/stoneflower,				10000,	ROOKIE,	sale_price = 5000),
		new /datum/data/stalker_equipment("Ночная звезда",		"Ночная звезда",							/obj/item/weapon/artifact/nightstar,				30000,	ROOKIE,	sale_price = 15000),
		new /datum/data/stalker_equipment("Душа",				"Душа",										/obj/item/weapon/artifact/soul,						80000,	ROOKIE,	sale_price = 35000),
		///////////////////////////////////////////////////////////////////////////////////////////
		new /datum/data/stalker_equipment("Вспышка",			"Вспышка",									/obj/item/weapon/artifact/flash,					6000,	ROOKIE,	sale_price = 3000),
		new /datum/data/stalker_equipment("Лунный свет",		"Лунный свет",								/obj/item/weapon/artifact/moonlight,				12000,	ROOKIE,	sale_price = 6000),
		new /datum/data/stalker_equipment("Пустышка",			"Пустышка",									/obj/item/weapon/artifact/pustishka,				40000,	ROOKIE,	sale_price = 20000),
		new /datum/data/stalker_equipment("Батарейка",			"Батарейка",								/obj/item/weapon/artifact/battery,					70000,	ROOKIE,	sale_price = 35000),
		///////////////////////////////////////////////////////////////////////////////////////////
		new /datum/data/stalker_equipment("Капл&#x44F;",		"Капл&#x44F;",								/obj/item/weapon/artifact/droplet,					7000,	ROOKIE,	sale_price = 3500),
		new /datum/data/stalker_equipment("Огненный шар",		"Огненный шар",								/obj/item/weapon/artifact/fireball,					15000,	ROOKIE,	sale_price = 7500),
		new /datum/data/stalker_equipment("Кристалл",			"Кристалл",									/obj/item/weapon/artifact/crystal,					60000,	ROOKIE,	sale_price = 30000),
		new /datum/data/stalker_equipment("Мамины бусы",		"Мамины бусы",								/obj/item/weapon/artifact/maminibusi,				80000,	ROOKIE,	sale_price = 40000),
		///////////////////////////////////////////////////////////////////////////////////////////
		new /datum/data/stalker_equipment("Кровь Камн&#x44F;",	"Кровь Камн&#x44F;",						/obj/item/weapon/artifact/stone_blood,				4000,	ROOKIE,	sale_price = 2000),
		new /datum/data/stalker_equipment("Пузырь",				"Пузырь",									/obj/item/weapon/artifact/bubble,					8000,	ROOKIE,	sale_price = 4000),
		new /datum/data/stalker_equipment("Слюда",				"Слюда",									/obj/item/weapon/artifact/mica,						20000,	ROOKIE,	sale_price = 10000),
		new /datum/data/stalker_equipment("Светл&#x44F;к",		"Светл&#x44F;к",							/obj/item/weapon/artifact/firefly,					50000,	ROOKIE,	sale_price = 25000),
		/////////////////////////////////	Мусор	//////////////////////////////////////////////
		new /datum/data/stalker_equipment("Konserva",			"Консервеа",								/obj/item/trash/konserva,							400,	ROOKIE),
		new /datum/data/stalker_equipment("Konserva",			"Консервеа",								/obj/item/trash/konserva/MREkonserva1,				200,	ROOKIE),
		new /datum/data/stalker_equipment("Konserva",			"Консервеа",								/obj/item/trash/konserva/MREkonserva2,				200,	ROOKIE),
		new /datum/data/stalker_equipment("Konserva",			"Консервеа",								/obj/item/trash/konserva/MREkonserva3,				200,	ROOKIE),
		new /datum/data/stalker_equipment("Konserva",			"Консервеа",								/obj/item/trash/konserva/bobi,						400,	ROOKIE),
		new /datum/data/stalker_equipment("Konserva",			"Консервеа",								/obj/item/trash/konserva/fish,						500,	ROOKIE),
		new /datum/data/stalker_equipment("Konserva",			"Консервеа",								/obj/item/trash/konserva/govyadina,					400,	ROOKIE),
		new /datum/data/stalker_equipment("Konserva",			"Консервеа",								/obj/item/trash/konserva/shproti,					600,	ROOKIE),
		new /datum/data/stalker_equipment("Konserva",			"Консервеа",								/obj/item/trash/konserva/soup,						500,	ROOKIE),
		///////////////////////////////////////////////////////////////////////////////////////////
		new /datum/data/stalker_equipment("50 RU",				"50 RU",									/obj/item/stack/spacecash/c50,						50,		ROOKIE,	sale_price = 50),
		new /datum/data/stalker_equipment("100 RU",				"100 RU",									/obj/item/stack/spacecash/c100,						100,	ROOKIE,	sale_price = 100),
		new /datum/data/stalker_equipment("500 RU",				"500 RU",									/obj/item/stack/spacecash/c500,						500,	ROOKIE,	sale_price = 500),
		new /datum/data/stalker_equipment("1000 RU",			"1000 RU",									/obj/item/stack/spacecash/c1000,					1000,	ROOKIE,	sale_price = 1000),
		new /datum/data/stalker_equipment("5000 RU",			"5000 RU",									/obj/item/stack/spacecash/c5000,					5000,	ROOKIE,	sale_price = 5000)
		)
	)

/obj/machinery/stalker
	icon = 'icons/stalker/decor.dmi'

/obj/machinery/stalker/sidormat
	name = "SYCHEMAT"
	desc = "An equipment vendor for beginning stalkers."
	icon_state = "radio"
	density = 1
	anchored = 1
	var/itemloc = null
	var/itemloc2 = null
	var/balance = 0
	var/rating = 0
	var/switches = 0
	var/real_assorment = list()

/datum/data/stalker_equipment
	//var/name = "generic"
	var/name_ru = "generic"
	var/equipment_path = null
	var/cost = 0
	var/rating = 0
	var/faction = "Everyone"
	var/sale_price = 0
	var/assortment_level = 0

/datum/data/stalker_equipment/New(name, name_ru, path, cost, rating, faction = "Everyone", sale_price = 0, assortment_level = 0)
	src.name = name
	src.name_ru = name_ru
	src.equipment_path = path
	src.cost = cost
	src.rating = rating
	src.faction = faction
	if(sale_price)
		src.sale_price = sale_price
	else
		src.sale_price = cost/2
	src.assortment_level = assortment_level
	switch(cost)
		if(0 to TRASH_TIER_COST)
			trash_tier_sidormatitems += src

		if(0 to LOW_TIER_COST)
			low_tier_sidormatitems += src

		if(0 to MEDIUM_TIER_COST)
			medium_tier_sidormatitems += src

		if(LOW_TIER_COST to HIGH_TIER_COST)
			high_tier_sidormatitems += src
	real_sidormat_items += src

/obj/machinery/stalker/sidormat/New()
	itemloc = locate(x - 1, y, z)
	itemloc2 = locate(x + 1, y, z)

/obj/machinery/stalker/sidormat/attack_hand(mob/user)
	balance = 0
	if(..())
		return

	if(!ishuman(user))
		say("You are not a human.")
		return

	var/mob/living/carbon/human/H = user

	interact(H)


/obj/machinery/stalker/sidormat/interact(mob/living/carbon/human/H)

	if(!istype(H.wear_id, /obj/item/device/stalker_pda))
		say("Put on your KPK.")
		return

	var/datum/data/record/sk = find_record("sid", H.sid, data_core.stalkers)
	var/obj/item/device/stalker_pda/KPK = H.wear_id

	if(!sk || !KPK.owner)
		say("Activate your KPK profile.")
		return

	if(KPK.owner != H)
		say("No access.")
		return

	H.set_machine(src)
	balance = sk.fields["money"]
	rating = sk.fields["rating"]

	var/dat
	if(H.client.prefs.chat_toggles & CHAT_LANGUAGE)

	///////////////////////////////////////////////////////////АНГЛИЙСКИЙ СИДОРОМАТ///////////////////////////////////////////////////////////////////////

		dat +="<div class='statusDisplay'>"
		dat += "Balance: [balance] RU<br>"
		dat += "<br><br>INSTRUCTION: Put habar for sale on the <b>left</b> table.<br>" // Забирать деньги и купленные вещи - на <b>правом</b>.
		if(!(switches & SHOW_FACTION_EQUIPMENT))
			dat +="<A href='?src=\ref[src];choice=take'><b>Sell habar.</b></A>"
		dat += "</div>"
		dat += "<div class='lenta_scroll'>"
		dat += "<br><BR><table border='0' width='400'>" //<b>Item list:</b>
		for(var/L in global_sidormat_list)
			if(L == "Unbuyable")
				continue
			dat += "<tr><td><center><big><b>[L]</b></big></center></td><td></td><td></td></tr>"
			for(var/datum/data/stalker_equipment/prize in global_sidormat_list[L])
				if((KPK.eng_faction_s == prize.faction && (KPK.eng_faction_s == "Loners" || KPK.eng_faction_s == "Bandits" || (switches & SHOW_FACTION_EQUIPMENT))) || prize.faction == "Everyone")
					//if(rating >= prize.rating)
					if(get_assortment_level(H) >= prize.assortment_level)
						dat += "<tr><td>[prize.name]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>Buy</A></td></tr>"

		dat += "</table>"
		dat += "</div>"

	else

		///////////////////////////////////////////////////////////РУССКИЙ СИДОРОМАТ///////////////////////////////////////////////////////////////////////

		dat +="<div class='statusDisplay'>"
		dat += "На счету: [balance] RU<br>"
		dat += "<br><br>ИНСТРУКЦИЯ: Хабар складывать - на <b>левом</b> столе.<br>" //Забирать деньги и купленные вещи - на <b>правом</b>.
		if(!(switches & SHOW_FACTION_EQUIPMENT))
			dat +="<A href='?src=\ref[src];choice=take'><b>Сбыть хабар.</b></A>"
		dat += "</div>"
		dat += "<div class='lenta_scroll'>"
		dat += "<br><BR><table border='0' width='400'>" //<b>Список предметов:</b>
		for(var/L in global_sidormat_list)
			if(L == "Unbuyable")
				continue
			dat += "<tr><td><center><b>[L]</b></center></td><td></td><td></td></tr>"
			for(var/datum/data/stalker_equipment/prize in global_sidormat_list[L])
				if((KPK.eng_faction_s == prize.faction && (KPK.eng_faction_s == "Loners" || KPK.eng_faction_s == "Bandits" || (switches & SHOW_FACTION_EQUIPMENT))) || prize.faction == "Everyone")
					//if(rating >= prize.rating)
					if(get_assortment_level(H) >= prize.assortment_level)
						dat += "<tr><td>[prize.name_ru]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>Купить</A></td></tr>"
		dat += "</table>"
		dat += "</div>"

	var/datum/browser/popup = new(H, "miningvendor", "SIDORMAT 3000", 450, 700)
	popup.set_content(dat)
	popup.open()
	return

/proc/get_assortment_level(var/mob/living/carbon/human/owner)
	var/datum/data/record/sk = find_record("sid", owner.sid, data_core.stalkers)
	var/assortment_level = 0


	for(var/obj/machinery/stalker/sidorpoint/cp in cps)
		if(cp.controlled_by == sk.fields["faction_s"] && cp.control_percent == 100)
			assortment_level++

	return assortment_level

/obj/machinery/stalker/sidormat/Topic(href, href_list)
	if(..())
		return

	var/mob/living/carbon/human/H = usr

	if(!istype(H.wear_id, /obj/item/device/stalker_pda))
		say("Put on your KPK.")
		updateUsrDialog()
		return

	var/datum/data/record/sk = find_record("sid", H.sid, data_core.stalkers)
	var/obj/item/device/stalker_pda/KPK = H.wear_id


	if(!sk)
		say("Activate your KPK profile.")
		updateUsrDialog()
		return

	if(!KPK.owner || (KPK.owner != H))
		say("No access.")
		updateUsrDialog()
		return

	if(href_list["choice"])
		if(href_list["choice"] == "take")
			SellItems()

	if(href_list["purchase"])
		var/datum/data/stalker_equipment/prize = locate(href_list["purchase"])

		if (!prize)
			updateUsrDialog()
			return

		if(prize.cost > sk.fields["money"])
			say("You don't have enough money to buy [prize.name].")
			updateUsrDialog()
			return

		sk.fields["money"] -= prize.cost
		balance = sk.fields["money"]
		//PoolOrNew(prize.equipment_path, itemloc2)
		new prize.equipment_path(itemloc2)


	//updateUsrDialog()
	return


/obj/machinery/stalker/sidormat/proc/SellItems()
	var/mob/living/carbon/human/H = usr
	if(!istype(H.wear_id, /obj/item/device/stalker_pda))
		say("Put on your KPK.")
		return

	var/datum/data/record/sk = find_record("sid", H.sid, data_core.stalkers)
	var/obj/item/device/stalker_pda/KPK = H.wear_id

	if(!sk)
		say("Activate your profile in KPK.")
		return

	if(KPK.sid != H.sid)
		say("No access.")
		return

	var/list/ontable = GetItemsOnTable()
	var/total_cost = GetOnTableCost(ontable)

	if(total_cost < 100)
		say("Habar was not sold.")

	for(var/atom/movable/I in ontable)
		if(I.loc != itemloc)
			continue

		sk.fields["money"] += GetCost(I.type)
		balance = sk.fields["money"]

		say("[I] was sold for [GetCost(I.type)].")

		PlaceInPool(I)
		CHECK_TICK

	if(total_cost)
		say("<b>Habar was successfully sold for [total_cost].</b>")

	updateUsrDialog()
	return

/obj/machinery/stalker/sidormat/proc/GetItemsOnTable()
	var/list/ontable = list()
	for(var/atom/movable/AM in itemloc)
		if(!GetCost(AM.type))
			continue

		if(istype(AM, /obj/item/clothing))
			var/obj/item/clothing/C = AM
			if((C.durability / initial(C.durability)) * 100 < 80)
				say("[AM] is too broken for sale.")
				continue

		if(istype(AM, /obj/item/weapon/storage/backpack) && AM.contents.len)
			say("Empty [AM] before selling.")
			continue

		if(istype(AM, /obj/item/ammo_box))
			var/obj/item/ammo_box/AB = AM
			if(AB.stored_ammo.len < AB.max_ammo)
				say("Fill [AB] before selling.")
				continue

		//if(istype(AM, /obj/item/weapon/reagent_containers))
		//	say("[AM] can't be sold!")
		//	continue

		ontable += AM

	return ontable

/obj/machinery/stalker/sidormat/proc/GetOnTableCost(var/list/ontable)
	//var/list/ontable = GetItemsOnTable()
	var/total_cost = 0

	for(var/atom/item_on_table in ontable)
		var/cost = GetCost(item_on_table.type)
		if(cost)
			total_cost += cost
	return total_cost

/obj/machinery/stalker/sidormat/proc/GetCost(itemtype)
	for(var/datum/data/stalker_equipment/se in real_sidormat_items)
		if(itemtype == se.equipment_path)
			return se.sale_price
	return 0

/obj/machinery/stalker/sidormat/ex_act(severity, target)
	return