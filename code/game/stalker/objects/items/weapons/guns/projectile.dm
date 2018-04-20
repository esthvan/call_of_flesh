/obj/effect/overlay/temp/impact_effect
	icon_state = "impact_bullet"
	duration = 5

/obj/effect/overlay/temp/impact_effect/New(loc, atom/target, obj/item/projectile/P)
	if(target == P.original) //the projectile hit the target originally clicked
		pixel_x = P.p_x + target.pixel_x - 16 + rand(-4,4)
		pixel_y = P.p_y + target.pixel_y - 16 + rand(-4,4)
	else
		pixel_x = target.pixel_x + rand(-4,4)
		pixel_y = target.pixel_y + rand(-4,4)
	..()

/obj/item/projectile
	var/impact_effect_type

///////////////////////////// Пистолеты //////////////////////////////////////////

/obj/item/weapon/gun/projectile/automatic/pistol/pm   // Макаров
	name = "PMm"
	desc = "Пистолет Макарова Модернизированный. Наиболее распространённый в зоне пистолет - наследие советской эпохи. Достаточно надёжный и дешёвый, отличаетс&#255; невысокой ёмкостью магазина при недостаточной мощности и неудовлетворительности кучности патрона. Основное оружие сталкера-новичка-неудачника. Отличное средство дл&#255; распугивани&#255; ворон."
	icon_state = "pm"
	w_class = 2
	fire_sound = 'sound/stalker/weapons/pm_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x18pm
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	durability = 50
	spread = 10
	recoil = 0.25
	damagelose = 0.2
	drawsound = 'sound/stalker/weapons/draw/pm_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'

/obj/item/weapon/gun/projectile/automatic/pistol/sip  // Sig-Sauer
	name = "SIG-Sauer P220"
	desc = "Модель, разработанна&#255; ещё в 1975 году, но до сих пор попул&#255;рна&#255; во всём мире. Магазин недостаточно ёмкий, зато механизм надёжен как швейцарские часы; вторым плюсом &#255;вл&#255;етс&#255; использование мощного кольтовского патрона .45 калибра."
	icon_state = "sip"
	w_class = 2
	fire_sound = 'sound/stalker/weapons/sig220_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sc45
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	durability = 100
	spread = 6
	recoil = 0.25
	damagelose = 0.2
	drawsound = 'sound/stalker/weapons/draw/sig220_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'

/obj/item/weapon/gun/projectile/automatic/pistol/cora  // Colt1911A
	name = "Colt M1911"
	desc = "Классический автоматический «кольт», с честью прошедший все вооружённые конфликты XX века и уверенно вошедший в новое столетие. Невысока&#255; ёмкость магазина в определённой степени компенсируетс&#255; использованием мощного патрона."
	icon_state = "cora"
	w_class = 3
	fire_sound = 'sound/stalker/weapons/colt1911_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sc45
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	spread = 6
	recoil = 0.5
	durability = 85
	damagelose = 0.15
	drawsound = 'sound/stalker/weapons/draw/pm_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'

/obj/item/weapon/gun/projectile/automatic/pistol/marta  // Beretta92FS
	name = "Beretta 92FS"
	desc = "Состоит на вооружении вооружённых сил и полиции США, многих военизированных и правохранительных формирований во всём мире. Столь же попул&#255;рна и у представителей преступного мира благодар&#255; мощному патрону и большой ёмкости магазина."
	icon_state = "marta"
	item_state = "marta"
	w_class = 3
	fire_sound = 'sound/stalker/weapons/marta_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x19marta
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	spread = 7
	recoil = 0.4
	damagelose = 0.2
	durability = 85
	drawsound = 'sound/stalker/weapons/draw/pm_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'

/obj/item/weapon/gun/projectile/automatic/pistol/fort12  // Фора12
	name = "Fort-12"
	desc = "Пистолет полицейского назначени&#255; украинского производства, пришедший на смену ПМм. Обладает лучшими по сравнению с последним точностью бо&#255;, эргономикой и более вместительным магазином, однако менее надёжен."
	icon_state = "fort12"
	fire_sound = 'sound/stalker/weapons/fort_shot.ogg'
	w_class = 2
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x18fort
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	spread = 8
	recoil = 0.3
	durability = 50
	damagelose = 0.2
	drawsound = 'sound/stalker/weapons/draw/fort_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'

/obj/item/weapon/gun/projectile/automatic/pistol/fort12/unique  // Фора12 - расширенный магазин
	desc = "Экспериментальный прототип пистолета Фора. Единичный экземпл&#255;р."
	icon_state = "fort12_unique"
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x18fort_u

/obj/item/weapon/gun/projectile/automatic/pistol/pb1s  //ПБ1С
	name = "PB1s"
	desc = "Пистолет с интегрированным глушителем, некогда использовавшийс&#255; советским спецназом. Морально устарел, но в умелых руках по-прежнему довольно эффективен."
	icon_state = "pb1s"
	w_class = 2
	fire_sound = 'sound/stalker/weapons/pb_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x18pm
	force = 10
	suppressed = 1
	can_suppress = 0
	can_unsuppress = 0
	spread = 8
	recoil = 0.3
	durability = 50
	damagelose = 0.2
	drawsound = 'sound/stalker/weapons/draw/pm_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'

/obj/item/weapon/gun/projectile/automatic/pistol/usp_match  // USP Match
	name = "H&K USP Match"
	desc = "Матчева&#255; модификаци&#255; известного немецкого пистолета, калибра .45. Имеет специальную насадку, котора&#255; уменьшает подброс ствола при стрельбе за счёт своего веса. Увеличенный магазин на 15 патронов. На руко&#255;тке инициалы - L.C."
	icon_state = "usp-match"
	w_class = 2
	mag_type = /obj/item/ammo_box/magazine/stalker/usp45
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	spread = 8
	recoil = 0.4
	durability = 100
	damagelose = 0.15
	drawsound = 'sound/stalker/weapons/draw/usp_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'


///////////////////////////// Автоматы, ПП //////////////////////////////////////////

/obj/item/weapon/gun/projectile/automatic
	var/image/mag_overlay 			= null
	var/image/mag_overlay_inhands 	= null
	var/image/silencer_overlay 		= null
	var/image/scope_overlay 		= null
	var/image/colored_overlay 		= null
	var/colored 					= null

/obj/item/weapon/gun/projectile/automatic/New()
	..()
	if(!istype(src, /obj/item/weapon/gun/projectile/automatic/pistol))
		mag_overlay = image('icons/stalker/projectile_overlays32x32.dmi', "[initial(icon_state)]-mag", layer = FLOAT_LAYER)

	if(can_suppress)
		silencer_overlay = image('icons/stalker/projectile_overlays48x48.dmi', "[initial(icon_state)]-silencer", layer = FLOAT_LAYER)

	if(can_scope)
		scope_overlay = image('icons/stalker/projectile_overlays32x32.dmi', "[initial(icon_state)]-scope", layer = FLOAT_LAYER)

	if(colored)
		colored_overlay = image('icons/stalker/projectile_overlays32x32.dmi', "[initial(icon_state)]-[colored]", layer = FLOAT_LAYER)
		overlays += colored_overlay

	update_icon()

/obj/item/weapon/gun/projectile/automatic/update_icon()
	..()
	overlays.Cut()

	if(colored)
		overlays += colored_overlay

	if(magazine && mag_overlay)
		overlays += mag_overlay

	if(suppressed && silencer_overlay)
		overlays += silencer_overlay

	if(zoomable && scope_overlay)
		overlays += scope_overlay

	if(unique)
		overlays += image('icons/stalker/projectile_overlays32x32.dmi', "unique", layer = FLOAT_LAYER)

	if(istype(src, /obj/item/weapon/gun/projectile/automatic/pistol))
		icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"
	else
		item_state = "[initial(item_state)][magazine ? "" : "-e"]"	//Пока не разберусь с оверлеями на мобах, будет так

	return
/*
/obj/item/weapon/gun/projectile/automatic/worn_overlays(var/isinhands = TRUE)
	. = list()
	if(!isinhands)
		if(magazine )
			overlays += mag_overlay

		if(suppressed )
			overlays += silencer_overlay
        . += image(icon = 'icons/effects/effects.dmi', icon_state = "[shield_state]")
*/

/obj/item/weapon/gun/projectile/automatic/ak74  // AK-74
	name = "AK 74/2"
	desc = "Автомат складной образца 1974 года под патрон 5,45x39мм. Представл&#255;ет собой простое и надёжное оружие, хот&#255; дешевизна в производстве несколько сказалась на удобстве использовани&#255; и точности бо&#255;. В Зоне это основное оружие военных сталкеров и многих одиночек."
	icon_state = "ak74"
	item_state = "ak74"
	colored = 0//"normal"
	slot_flags = SLOT_BACK//|SLOT_BELT
	force = 15
	origin_tech = "combat=5;materials=1"
	mag_type = /obj/item/ammo_box/magazine/stalker/m545
	fire_sound = 'sound/stalker/weapons/ak74_shot.ogg'
	can_suppress = 1
	can_unsuppress = 1
	burst_size = 3
	fire_delay = 1
	pin = /obj/item/device/firing_pin
	durability = 150
	w_class = 4
	spread = 7
	recoil = 0.5
	randomspread = 0
	damagelose = 0.25
	can_scope = 1
	drawsound = 'sound/stalker/weapons/draw/ak74_draw.ogg'

/obj/item/weapon/gun/projectile/automatic/aksu74  // АКС74У
	name = "AK 74/2y"
	desc = "По своим габаритам и массе Акм 74/2У (укороченный) близок к пистолетам-пулемётам, однако он &#255;вл&#255;етс&#255; представителем автоматов. Достоинства: малые габариты и довольно высока&#255; пробивающа&#255; способность. Главные недостатки - мала&#255; прицельна&#255; дальность и склонность к быстрому перегреву при стрельбе очеред&#255;ми."
	icon_state = "aksu74"
	item_state = "aksu74"
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=3;materials=1"
	mag_type = /obj/item/ammo_box/magazine/stalker/m545
	fire_sound = 'sound/stalker/weapons/ak74u_shot.ogg'
	can_suppress = 1
	burst_size = 3
	fire_delay = 1
	pin = /obj/item/device/firing_pin
	durability = 80
	w_class = 4
	spread = 9
	recoil = 0.9
	damagelose = 0.5
	can_scope = 1
	drawsound = 'sound/stalker/weapons/draw/ak74u_draw.ogg'

/*
/obj/item/weapon/gun/projectile/automatic/aksu74/black  // АКС74У - черный цвет
	colored = "black"
	item_state = "aksu74-black"
	mag_type = /obj/item/ammo_box/magazine/stalker/m545
*/

/obj/item/weapon/gun/projectile/automatic/mp5  // MP5
	name = "MP-5"
	desc = "Одно из самых лучших в классе пистолетов-пулемётов оружие. В течении последних дес&#255;тилетий XX века был прин&#255;т на вооружение спецподразделений армии и полиции во многих странах мира. С началом его постепенной замены более современными модел&#255;ми стал часто по&#255;вл&#255;тьс&#255; на чёрном рынке, откуда массово попал и в Зону."
	icon_state = "mp5"
	item_state = "gun"
	fire_sound = 'sound/stalker/weapons/mp5_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x19mp5
	can_suppress = 1
	burst_size = 2
	slot_flags = SLOT_BELT
	durability = 100
	w_class = 3
	spread = 6
	recoil = 0.65
	damagelose = 0.4
	can_scope = 1
	drawsound = 'sound/stalker/weapons/draw/mp5_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/mp5_load.ogg'
	opensound = 'sound/stalker/weapons/unload/mp5_open.ogg'

/obj/item/weapon/gun/projectile/automatic/tpc301  // Эмка
	name = "LR-300"
	desc = "Нова&#255; ступень в развитии семейства знаменитой М-16. Благодар&#255; исключительно ровному спуску, высокой эргономике и небольшому весу данное оружие отличаетс&#255; высокой точностью бо&#255;, хот&#255; высока&#255; чувствительность к загр&#255;знению делает его малопригодным дл&#255; использовани&#255; в сложных услови&#255;х."
	icon_state = "tpc301"
	item_state = "tpc301"
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=6"
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	fire_sound = 'sound/stalker/weapons/tpc301_shoot.ogg'
	can_suppress = 1
	burst_size = 3
	fire_delay = 1
	pin = /obj/item/device/firing_pin
	durability = 90
	w_class = 4
	spread = 5
	recoil = 0.5
	damagelose = 0.2
	can_scope = 1
	drawsound = 'sound/stalker/weapons/draw/tpc301_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/tpc301_load.ogg'
	opensound = 'sound/stalker/weapons/unload/tpc301_open.ogg'

/obj/item/weapon/gun/projectile/automatic/abakan  // Абакан
	name = "AC-96/2"
	desc = "Оружие элитных войск советской армии. Был разработан в качестве замены устаревшему АКМ-74/2. В «Обокане» подвижны не только внутренние механизмы, но и вс&#255; ствольна&#255; коробка вместе со стволом, что позвол&#255;ет снизить отдачу, тем самым значительно повысив точность бо&#255;."
	icon_state = "abakan"
	item_state = "abakan"
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=6"
	mag_type = /obj/item/ammo_box/magazine/stalker/m545
	fire_sound = 'sound/stalker/weapons/abakan_shoot.ogg'
	can_suppress = 1
	burst_size = 2
	fire_delay = 1
	pin = /obj/item/device/firing_pin
	durability = 200
	w_class = 4
	spread = 6
	recoil = 0.5
	damagelose = 0.2
	can_scope = 1
	drawsound = 'sound/stalker/weapons/draw/abakan_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/abakan_load.ogg'
	opensound = 'sound/stalker/weapons/unload/abakan_open.ogg'

/obj/item/weapon/gun/projectile/automatic/il86  // ИЛ86
	name = "L85"
	desc = "После того, как эта винтовка была заменена армией Великобритании на немецкую ГП37, она в большом количестве всплыла на чёрном рынке, а затем и в Зоне. Главным достоинством ИЛ86 &#255;вл&#255;ютс&#255; штатный 4-кратный прицел и высока&#255; точность первого выстрела. При стрельбе очеред&#255;ми точность бо&#255; резко падает, а надёжность основных механизмов винтовки недостаточно высока. Эффективна при стрельбе короткими очеред&#255;ми и одиночными."
	icon_state = "il86"
	item_state = "il86"
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=6;material=1"
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	fire_sound = 'sound/stalker/weapons/il86_shoot.ogg'
	can_suppress = 1
	zoomable = 1
	zoom_amt = 9
	burst_size = 2
	fire_delay = 1.5
	pin = /obj/item/device/firing_pin
	durability = 90
	w_class = 4
	spread = 3
	recoil = 0.4
	damagelose = 0
	can_scope = 0
	drawsound = 'sound/stalker/weapons/draw/l85_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/groza_load.ogg'
	opensound = 'sound/stalker/weapons/unload/groza_open.ogg'


///////////////////////////// Снайперские винтовки //////////////////////////////////////////
/obj/item/weapon/gun/projectile/automatic/val  // Вал
	name = "AS Val"
	desc = "Создан на базе бесшумной снайперской винтовки 'Винторез', от которой отличаетс&#255; складным прикладом, возможностью вести огонь очеред&#255;ми, а также более ёмким магазином. Изначально предназначалс&#255; дл&#255; применени&#255; спецподразделени&#255;ми в услови&#255;х атаки, требующей бесшумной и беспламенной стрельбы."
	icon_state = "val"
	fire_sound = 'sound/stalker/weapons/vintorez_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sp9x39val
	suppressed = 1
	can_suppress = 0
	can_unsuppress = 0
	durability = 150
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=5;materials=1"
	burst_size = 2
	pin = /obj/item/device/firing_pin
	w_class = 4
	spread = 4
	recoil = 0.6
	damagelose = 0.1
	can_scope = 1
	drawsound = 'sound/stalker/weapons/draw/val_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/val_load.ogg'
	opensound = 'sound/stalker/weapons/unload/val_open.ogg'

/obj/item/weapon/gun/projectile/automatic/vintorez  // ВСС Винторез
	name = "VSS Vintorez"
	desc = "Винтовка специальна&#255; снайперска&#255; 'Винторез'. Предназначена дл&#255; бесшумной стрельбы и беспламенной снайперской стрельбы и снабжена интегрированным глушителем. С рассто&#255;ни&#255; 400 метров пробивает бронежилет любой степени защиты. Очень ценимое сталкерами любого уровн&#255; оружие."
	icon_state = "vintorez"
	fire_sound = 'sound/stalker/weapons/vintorez_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sp9x39vint
	suppressed = 1
	can_suppress = 0
	can_unsuppress = 0
	zoomable = 1
	zoom_amt = 7
	burst_size = 1
	durability = 110
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=5;materials=1"
	pin = /obj/item/device/firing_pin
	w_class = 4
	spread = 3
	recoil = 0.6
	damagelose = 0
	can_scope = 0
	drawsound = 'sound/stalker/weapons/draw/val_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/val_load.ogg'
	opensound = 'sound/stalker/weapons/unload/val_open.ogg'

/obj/item/weapon/gun/projectile/automatic/groza  // ОЦ-14 Гроза
	name = "Grom C14"
	desc = "Автоматно-гранатомётный комплекс - очень удачный в услови&#255;х Зоны вариант штурмовой винтовки: компактный, надёжный, и в то же врем&#255; универсальный и мощный. 'Гром' очень люб&#255;т военные сталкеры."
	icon_state = "groza"
	fire_sound = 'sound/stalker/weapons/groza_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sp9x39groza
	can_suppress = 0
	durability = 130
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=5;materials=1"
	burst_size = 3
	pin = /obj/item/device/firing_pin
	w_class = 4
	spread = 8
	recoil = 0.6
	damagelose = 0.35
	can_scope = 1
	drawsound = 'sound/stalker/weapons/draw/groza_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/groza_load.ogg'
	opensound = 'sound/stalker/weapons/unload/groza_open.ogg'




/obj/item/weapon/gun/projectile/automatic/testgun
	name = "testgun"
	desc = "testing"
	icon_state = "ak74"
	item_state = "gun"
	fire_sound = 'sound/stalker/weapons/ak74_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/testgun
	can_suppress = 1
	burst_size = 3
	durability = 1000
	slot_flags = SLOT_BACK|SLOT_BELT
	force = 10
	w_class = 3
	spread = 10
