/obj/item/clothing/suit
	var/CCBS = 0 //Костюм с замкнутой системой дыхания

/obj/item/clothing
	var/durability = 100

/obj/item/clothing/head
	var/CBBS_h = 0

/obj/item/clothing/head/examine(mob/user)
	..()
	if(!istype(src, /obj/item/clothing/head/winterhood))
		var/percentage = null
		if(durability)
			percentage = (durability / (initial(durability)))*100
			if(percentage >= 50)
				user << "<span class='notice'>Прочность - [percentage]%</span>"
			else
				user << "<span class='warning'>Прочность - [percentage]%</span>"

/obj/item/clothing/mask/examine(mob/user)
	..()
	var/percentage = null
	if(durability)
		percentage = (durability / (initial(durability)))*100
		if(percentage >= 50)
			user << "<span class='notice'>Прочность - [percentage]%</span>"
		else
			user << "<span class='warning'>Прочность - [percentage]%</span>"


/obj/item/clothing/suit/examine(mob/user)
	..()
	var/percentage = null
	if(durability)
		percentage = (durability / (initial(durability)))*100
		if(percentage >= 50)
			user << "<span class='notice'>Прочность - [percentage]%</span>"
		else
			user << "<span class='warning'>Прочность - [percentage]%</span>"

/obj/item/clothing/suit/hooded/kozhanka
	name = "leather jacket"
	desc = "Обычна&#255; плотна&#255; кожана&#255; куртка, каких много. Слегка усиливает противопулевую и осколочную защиту. Неэффективна против аномальных и других воздействий."
	icon_state = "kozhanka"
	item_state = "det_suit"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	armor = list(melee = 10, bullet = 10, laser = 10,burn = 10, bomb = 10, bio = 10, rad = 0, electro = 10)
	allowed = list(/obj/item/weapon/gun/projectile,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/weapon/restraints/handcuffs,/obj/item/device/flashlight/seclite,/obj/item/weapon/storage/fancy/cigarettes,/obj/item/weapon/lighter,/obj/item/weapon/stalker/knife)
	hooded = 1
	action_button_name = "Toggle Hood"
	unacidable = 1
	hoodtype = /obj/item/clothing/head/winterhood/stalker/kozhanka
	durability = 75

/obj/item/clothing/head/winterhood/stalker
	body_parts_covered = HEAD
	cold_protection = HEAD
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags = NODROP//|BLOCKHEADHAIR

/obj/item/clothing/head/winterhood/stalker/kozhanka
	icon_state = "winterhood_kozhanka"
	armor = list(melee = 10, bullet = 0, laser = 10,burn = 10, bomb = 0, bio = 10, rad = 0, electro = 10)

/obj/item/clothing/suit/hooded/kozhanka/white
	icon_state = "kozhanka_wh"
	item_state = "labcoat"
	hoodtype = /obj/item/clothing/head/winterhood/stalker/kozhanka_wh

/obj/item/clothing/head/winterhood/stalker/kozhanka_wh
	armor = list(melee = 10, bullet = 0, laser = 10,burn = 10, bomb = 0, bio = 10, rad = 0, electro = 10)
	icon_state = "winterhood_kozhanka_wh"

/obj/item/clothing/suit/hooded/kozhanka/banditka
	name = "bandit jacket"
	desc = "Традиционна&#255; одежда бандита - кожана&#255; куртка со вшитыми броневыми элементами. Даёт защиту, крайне недостаточную в жёстких услови&#255;х Зоны."
	icon_state = "banditka"
	item_state = "ro_suit"
	armor = list(melee = 15, bullet = 15, laser = 10,burn = 10, bomb = 10, bio = 10, rad = 0, electro = 10)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/banditka
	durability = 75

/obj/item/clothing/head/winterhood/stalker/banditka
	armor = list(melee = 15, bullet = 0, laser = 10,burn = 10, bomb = 10, bio = 10, rad = 0, electro = 10)
	icon_state = "winterhood_banditka"

/obj/item/clothing/suit/hooded/kozhanka/banditka/unique
	name = "chain-mail jacket"
	desc = "Обычный слабенький бандитский бронежилет, но в подкладку вшито кольчужное полотно. Сделать такой под силу почти каждому, но терпени&#255; хватит далеко не всем."
	icon_state = "banditka_unique"
	armor = list(melee = 15, bullet = 28, laser = 10,burn = 10, bomb = 10, bio = 10, rad = 0, electro = 10)

/obj/item/clothing/suit/hooded/kozhanka/unique
	name = "anomaly jacket"
	desc = "Эту куртку сн&#255;ли с трупа одного из сталкеров, умерших в аномалии 'кисель'. Пролежав долгое врем&#255; в аномалии, куртка обрела свойство ускор&#255;ть метаболизм."
	icon_state = "kozhanka_unique"
	armor = list(melee = 10, bullet = 10, laser = 10,burn = 10, bomb = 20, bio = 20, rad = 0, electro = 10)

/obj/item/clothing/suit/hooded/kombez
	name = "sunrise"
	desc = "Производимый 'народными умельцами' комбинезон сталкера представл&#255;ет собой эффективное сочетание лёгкого армейского бронежилета и комбинезона из прорезиненой ткани. Усилен за счёт встроенных кевларовых пластин. Неплохо защищает от слабого стрелкового оружи&#255;. В целом крайне недостаточен дл&#255; глубоких рейдов и серьёзных операций в узлах Зоны."
	icon_state = "kombez"
	item_state = "syndicate-green"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	allowed = list(/obj/item/weapon/gun/projectile,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/weapon/restraints/handcuffs,/obj/item/device/flashlight/seclite,/obj/item/weapon/storage/fancy/cigarettes,/obj/item/weapon/lighter,/obj/item/weapon/stalker/knife)
	hooded = 1
	action_button_name = "Toggle Hood"
	unacidable = 1
	strip_delay = 80
	put_on_delay = 60
	flags_inv = HIDEJUMPSUIT
	armor = list(melee = 40, bullet = 30, laser = 50,burn = 50, bomb = 30, bio = 50, rad = 50, electro = 50)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/kombez
	durability = 200

/obj/item/clothing/head/winterhood/stalker/kombez
	armor = list(melee = 40, bullet = 	0, laser = 50,burn = 50, bomb = 0, bio = 50, rad = 50, electro = 50)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_kombez"

/obj/item/clothing/suit/jacket/sidor
	name = "old vest"
	desc = "Кошегна&#255; жилетка, сделанна&#255; из кожи химеры."
	icon_state = "sidor_vest"
	item_state = "det_suit"
	burn_state = FIRE_PROOF
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank/internals/emergency_oxygen,/obj/item/toy,/obj/item/weapon/storage/fancy/cigarettes,/obj/item/weapon/lighter,/obj/item/weapon/gun/projectile/automatic/pistol,/obj/item/weapon/gun/projectile/revolver,/obj/item/weapon/gun/projectile/revolver/detective,/obj/item/weapon/stalker/knife)

/obj/item/clothing/suit/hooded/kozhanka/banditka/coat
	name = "bandit coat"
	desc = "Обычный плащ из чёрной кожи. Особенной защиты носителю не обеспечивает, разве что не даст замёрзнуть ночью и см&#255;гчит укус слепой собаки. Достаточно неудобен, но, тем не менее, часто используетс&#255; бандитами - возможно, исключительно из-за внешнего вида."
	icon_state = "banditcoat"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list(melee = 20, bullet = 10, laser = 15,burn = 10, bomb = 0, bio = 10, rad = 0, electro = 10)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/bandit
	durability = 200

/obj/item/clothing/head/winterhood/stalker/bandit
	armor = list(melee = 20, bullet = 0, laser = 15,burn = 10, bomb = 10, bio = 10, rad = 0, electro = 10)
	icon_state = "winterhood_banditcoat"

/obj/item/clothing/suit/hooded/kozhanka/banditka/coat/brown
	icon_state = "banditcoatbrown"
	hoodtype = /obj/item/clothing/head/winterhood/stalker/banditbrown

/obj/item/clothing/head/winterhood/stalker/banditbrown
	armor = list(melee = 20, bullet = 0, laser = 15,burn = 10, bomb = 0, bio = 10, rad = 0, electro = 10)
	icon_state = "winterhood_banditcoatbrown"

/obj/item/clothing/suit/hooded/kombez/ecolog
	name = "SSP-99"
	desc = "Созданный дл&#255; работы в услови&#255;х Зоны костюм защиты ССП-99. Используетс&#255; экспедици&#255;ми учёных и сотрудничающих с ними сталкеров-экологов. Встроенна&#255; система фильтрации воздуха и кондиционировани&#255;. Не рассчитан на ведение боевых действий."
	icon_state = "ecolog"
	item_state = "suit-orange"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_SUIT_MAX_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	flags = STOPSPRESSUREDMAGE | THICKMATERIAL
	armor = list(melee = 50, bullet = 20, laser = 90, burn = 90, bomb = 40, bio = 90, rad = 95, electro = 90)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/nightvision/ecolog
	burn_state = FIRE_PROOF
	CCBS = 1
	durability = 200

/obj/item/clothing/head/winterhood/stalker/nightvision/ecolog
	name = "SSP-99 helmet"
	armor = list(melee = 50, bullet = 20, laser = 90, burn = 90, bomb = 40, bio = 90, rad = 95, electro = 90)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_HELM_MAX_TEMP_PROTECT
	icon_state = "ecolog_helmet"
	CBBS_h = 1

/////////////////////////////////////////////////////////////////////ШЛЕМЫ НОЧНОГО ВИДЕНЬЯ/////////////////////////////////////////////////////////////////////////////////////////

/obj/item/clothing/head/winterhood/stalker/nightvision
	var/vision_flags = 0
	var/darkness_view = 4//Base human is 2
	var/invis_view = SEE_INVISIBLE_LIVING
	var/list/icon/current = list()
	action_button_name = "Toggle Night Vision"
	var/active = 0
	var/obj/screen/overlay = null
	invis_view = SEE_INVISIBLE_LIVING

/obj/item/clothing/head/winterhood/stalker/nightvision/attack_self(mob/user)
	if(active)
		active = 0
		playsound(usr, 'sound/stalker/nv_off.ogg', 50, 1, -1)
		usr << "You deactivate the optical matrix on the [src]."
		if(istype(usr, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = usr
			H.nightvision.alpha = 0
		//overlay = null
		invis_view = SEE_INVISIBLE_LIVING
		//sleep(5)
	else
		active = 1
		playsound(usr, 'sound/stalker/nv_start.ogg', 50, 1, -1)
		usr << "You activate the optical matrix on the [src]."
		if(istype(usr, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = usr
			H.nightvision.alpha = 125
		//overlay = global_hud.nvg
		invis_view = SEE_INVISIBLE_MINIMUM
		sleep(5)

/obj/item/clothing/head/winterhood/stalker/nightvision/ui_action_click()
	attack_self()

/obj/item/clothing/head/winterhood/stalker/nightvision/New()
	..()
	overlay = global_hud.nvg

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/clothing/suit/hooded/kombez/ecologm
	name = "SSP-99M"
	desc = "Высококачественный модифицированный комбинезон ССП-99. Добавлена защита торса от пулевого и осколочного повреждени&#255;. Предназначен дл&#255; экипировки охраны научных экспедиций. Эффективна&#255; защита от радиации и биологических аномалий. Стойкий к химически-агрессивным средам и другим вредным дл&#255; организма воздействи&#255;м."
	icon_state = "ecologg"
	item_state = "syndicate-green"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_SUIT_MAX_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	flags = STOPSPRESSUREDMAGE | THICKMATERIAL
	armor = list(melee = 60, bullet = 40, laser = 90,burn = 90, bomb = 60, bio = 90, rad = 90, electro = 90)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/nightvision/ecologm
	burn_state = FIRE_PROOF
	CCBS = 1
	durability = 250

/obj/item/clothing/head/winterhood/stalker/nightvision/ecologm
	name = "SSP-99M helmet"
	armor = list(melee = 60, bullet = 40, laser = 90,burn = 90, bomb = 60, bio = 90, rad = 90, electro = 90)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_HELM_MAX_TEMP_PROTECT
	icon_state = "ecologg_helmet"
	burn_state = FIRE_PROOF
	CBBS_h = 1

/obj/item/clothing/suit/hooded/kombez/seva
	name = "SEVA"
	desc = "Производимый одним из оборонных киевских НИИ данный комбинезон предоставл&#255;ет отличную альтернативу другим сталкеровским комбинезонам, изготовленным в кустарных услови&#255;х. Представл&#255;ет из себ&#255; отличное сочетание бронированного комбинезона, системы дыхани&#255; с замкнутым циклом, а также встроенной системой подавлени&#255; действи&#255; аномальных полей. За счёт удачного подбора материалов &#255;вл&#255;етс&#255; хорошим выбором. Единственный недостаток - его цена."
	icon_state = "seva"
	item_state = "syndicate-black"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_SUIT_MAX_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	flags = STOPSPRESSUREDMAGE | THICKMATERIAL
	armor = list(melee = 50, bullet = 40, laser = 80,burn = 80, bomb = 50, bio = 70, rad = 90, electro = 90)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/nightvision/seva
	burn_state = FIRE_PROOF
	CCBS = 1
	durability = 150

/obj/item/clothing/head/winterhood/stalker/nightvision/seva
	armor = list(melee = 50, bullet = 40, laser = 80,burn = 80, bomb = 50, bio = 70, rad = 90, electro = 90)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_HELM_MAX_TEMP_PROTECT
	icon_state = "seva_helmet"
	burn_state = FIRE_PROOF
	CBBS_h = 1

/obj/item/clothing/suit/hooded/kombez/seva/orange
	icon_state = "sevao"
	item_state = "suit-orange"
	hoodtype = /obj/item/clothing/head/winterhood/stalker/nightvision/seva/orange

/obj/item/clothing/head/winterhood/stalker/nightvision/seva/orange
	icon_state = "sevao_helmet"

/obj/item/clothing/suit/hooded/kombez/psz9md
	name = "PSZ-9MD"
	desc = "Отличный защитный костюм дл&#255; Зоны. Сталкеры цен&#255;т его за сочетание отличных противоаномальных качеств и противопулевой защиты. В составе: комбинезон ПСЗ-9д, система дыхани&#255; с замкнутым циклом, встроенна&#255; система подавлени&#255; действи&#255; аномальных полей. Предоставл&#255;ет качественную защиту от пулевого и осколочного попадани&#255;."
	icon_state = "psz9md"
	item_state = "syndicate-black-red"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_SUIT_MAX_TEMP_PROTECT
	strip_delay = 80
	put_on_delay = 60
	flags_inv = HIDEJUMPSUIT
	flags = STOPSPRESSUREDMAGE | THICKMATERIAL
	armor = list(melee = 50, bullet = 40, laser = 80,burn = 80, bomb = 50, bio = 70, rad = 90, electro = 90)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/nightvision/psz9md
	burn_state = FIRE_PROOF
	CCBS = 1
	durability = 150

/obj/item/clothing/head/winterhood/stalker/nightvision/psz9md
	armor = list(melee = 50, bullet = 40, laser = 80,burn = 80, bomb = 50, bio = 70, rad = 90, electro = 90)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_HELM_MAX_TEMP_PROTECT
	icon_state = "psz9md_helmet"
	burn_state = FIRE_PROOF
	CBBS_h = 1

/obj/item/clothing/suit/hooded/kombez/exoskelet
	name = "exoskelet"
	desc = "Экспериментальный образец военного экзоскелета. В серийное производство так и не попал, в виду чрезвычайной дороговизны и некоторых ошибок в проектировании. Не смотр&#255; на это, выпускаетс&#255; малыми парти&#255;ми на подпольных предпри&#255;ти&#255;х за пределами Украины. Данный экзоскелет относитс&#255; к третьему поколению. В нем устранены конструктивные недостатки, кардинально снижавшие подвижность, а также усилена брон&#255;. Предоставл&#255;ет великолепную защиту от пулевого и осколочного попадани&#255;, но не гарантирует стойкости к аномали&#255;м."
	icon_state = "exoskelet"
	item_state = "syndicate-black"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	flags_inv = HIDEJUMPSUIT
	armor = list(melee = 80, bullet = 60, laser = 50,burn = 50, bomb = 80, bio = 50, rad = 30, electro = 50)
	hooded = 1
	action_button_name = "Toggle Hood"
	hoodtype = /obj/item/clothing/head/winterhood/stalker/nightvision/exoskelet
	CCBS = 1
	durability = 200

/obj/item/clothing/head/winterhood/stalker/nightvision/exoskelet
	armor = list(melee = 80, bullet = 60, laser = 50,burn = 50, bomb = 80, bio = 50, rad = 30, electro = 50)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	icon_state = "exoskelet_helmet"
	CBBS_h = 1

/obj/item/clothing/suit/army
	name = "army armor"
	desc = "Стандартный армейский бронежилет, выдаваемый всем военнослужащим, охран&#255;ющим периметр Зоны. Предоставл&#255;ет слабую защиту от пуль и холодного оружи&#255;, абсолютно непригоден дл&#255; вылазок вглубь Зоны, так как не имеет никакой защиты от воздействи&#255; аномальных полей."
	icon_state = "army_armor1"
	item_state = "armor"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	unacidable = 1
	armor = list(melee = 20, bullet = 20, laser = 10,burn = 10, bomb = 10, bio = 0, rad = 0, electro = 0)
	allowed = list(/obj/item/weapon/gun/projectile,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/weapon/restraints/handcuffs,/obj/item/device/flashlight/seclite,/obj/item/weapon/storage/fancy/cigarettes,/obj/item/weapon/lighter,/obj/item/weapon/stalker/knife)
	durability = 75

/*
/obj/item/clothing/suit/army/army2
	icon_state = "army_armor2"
*/
/obj/item/clothing/suit/army/New()
	icon_state = "army_armor[rand(1, 2)]"

/obj/item/clothing/suit/berill
	name = "berill-5M"
	desc = "Модифицированна&#255; дл&#255; работы в услови&#255;х Зоны, экипировка армейского спецназа."
	icon_state = "berill_5m"
	item_state = "syndicate-green"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list(melee = 40, bullet = 45, laser = 30,burn = 30, bomb = 40, bio = 30, rad = 30, electro = 30)
	allowed = list(/obj/item/weapon/gun/projectile,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/weapon/restraints/handcuffs,/obj/item/device/flashlight/seclite,/obj/item/weapon/storage/fancy/cigarettes,/obj/item/weapon/lighter,/obj/item/weapon/stalker/knife)
	durability = 150

/obj/item/clothing/suit/hooded/kombez/monolit
	name = "monolith armor"
	desc = "Комбинезон сталкера группировки 'Монолит'. Производитель неизвестен. По защитным характеристикам немного уступает армейскому бронежилету серии ПС3-9а. По структуре напоминает широко распространенные среди нейтральных сталкеров комбинезоны, в которых бронежилет соедин&#255;етс&#255; с костюмом противорадиационной защиты. Неплохо защищает от слабого стрелкового оружи&#255;. Уровень защиты от аномальной активности оставл&#255;ет желать лучшего из-за отсутстви&#255; системы фильтрации воздуха."
	icon_state = "monolit"
	item_state = "syndicate-green"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list(melee = 40, bullet = 40, laser = 50,burn = 60, bomb = 40, bio = 50, rad = 50, electro = 60)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/monolit
	durability = 150

/obj/item/clothing/head/winterhood/stalker/monolit
	armor = list(melee = 40, bullet = 0, laser = 50,burn = 60, bomb = 0, bio = 50, rad = 50, electro = 60)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_monolit"

/obj/item/clothing/suit/skat
	name = "SKAT-M9"
	desc = "Армейский бронекостюм СКАТ-9М создан дл&#255; проведени&#255; штурмовых операций в зонах активности аномалий. В составе: т&#255;жёлый армейский бронекостюм серии ПС3-12п, встроенный компенсационный костюм. Предоставл&#255;ет великолепную защиту от пулевого и осколочного попадани&#255;, при этом не снижа&#255; подвижности солдата. В наличии сбалансированна&#255; система защиты от аномального воздействи&#255;."
	icon_state = "skat"
	item_state = "syndicate-black"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	unacidable = 1
	armor = list(melee = 70, bullet = 55, laser = 60,burn = 70, bomb = 70, bio = 50, rad = 70, electro = 70)
	durability = 300

/obj/item/clothing/suit/hooded/kombez/psz9d
	name = "PSZ-9D"
	desc = "Производитс&#255; одним из оборонных киевских НИИ на заказ группировки 'Долг'. Простота и надёжность базовой модели ПС3-9 в сочетании с новыми материалами предоставл&#255;ют хорошую защиту от различных вредных воздействий, включа&#255; огнестрельные повреждени&#255;. Из-за отсутстви&#255; защиты дыхани&#255; бронежилет требует доработки."
	icon_state = "psz9d"
	item_state = "syndicate-black-red"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	put_on_delay = 60
	flags_inv = HIDEJUMPSUIT
	armor = list(melee = 50, bullet = 40, laser = 50,burn = 50, bomb = 40, bio = 50, rad = 50, electro = 50)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/psz9d
	durability = 250

/obj/item/clothing/head/winterhood/stalker/psz9d
	armor = list(melee = 50, bullet = 0, laser = 50,burn = 50, bomb = 0, bio = 50, rad = 50, electro = 50)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_psz9d"

/obj/item/clothing/suit/hooded/kombez/mercenary
	name = "mercenary armor"
	desc = "Комбинезон сталкера из группировки 'Наёмники'. За основу вз&#255;ты образцы экипировки спецназа западных армий. За счёт специальной обработки ткани усилена устойчивость брони при физическом смещении пластин. По защитным характеристикам немного превосходит армейские бронежилеты серии ПС3-7."
	icon_state = "mercenary"
	item_state = "syndicate-black"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	put_on_delay = 60
	flags_inv = HIDEJUMPSUIT
	armor = list(melee = 25, bullet = 20, laser = 30,burn = 30, bomb = 50, bio = 20, rad = 30, electro = 30)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/mercenary
	durability = 150

/obj/item/clothing/head/winterhood/stalker/mercenary
	armor = list(melee = 25, bullet = 0, laser = 30,burn = 30, bomb = 50, bio = 20, rad = 30, electro = 30)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_mercenary"

/obj/item/clothing/suit/hooded/kombez/strazh
	name = "guardian of freedom"
	desc = "Производимый ремесленниками группировки «Свобода» усиленный комбинезон сталкера. Средний армейский бронежилет плюс накладные усиливающие циркониевые элементы дают неплохую защиту от автоматных пуль и осколков на различных дистанци&#255;х. Материал костюма состоит из двух слоёв: специально обработанной кожи и ткани с асбестовой нитью. Даёт некоторую защиту от различных аномальных воздействий и радиации."
	icon_state = "strazh"
	item_state = "syndicate-green"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	put_on_delay = 60
	flags_inv = HIDEJUMPSUIT
	armor = list(melee = 50, bullet = 40, laser = 50,burn = 50, bomb = 45, bio = 50, rad = 50, electro = 50)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/strazh
	durability = 200

/obj/item/clothing/head/winterhood/stalker/strazh
	armor = list(melee = 50, bullet = 0, laser = 50,burn = 50, bomb = 0, bio = 20, rad = 50, electro = 50)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_strazh"

/obj/item/clothing/suit/hooded/kombez/kombez_bandit
	name = "bandit armor"
	desc = "Комбинезон сталкера из группировки 'Бандиты'. За основу вз&#255;ты образцы экипировки спецназа западных армий. За счёт специальной обработки ткани усилена устойчивость брони при физическом смещении пластин. По защитным характеристикам немного превосходит армейские бронежилеты серии ПС3-7."
	icon_state = "combez_bandit"
	item_state = "syndicate-orange"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	put_on_delay = 60
	flags_inv = HIDEJUMPSUIT
	armor = list(melee = 25, bullet = 20, laser = 30,burn = 30, bomb = 50, bio = 20, rad = 30, electro = 30)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/kombez_bandit
	durability = 150

/obj/item/clothing/head/winterhood/stalker/kombez_bandit
	armor = list(melee = 25, bullet = 0, laser = 30,burn = 30, bomb = 50, bio = 20, rad = 30, electro = 30)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_combez_bandit"