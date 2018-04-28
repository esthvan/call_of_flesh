#define IU238 	1
#define IPU238 	2
#define	IPO210	4

/isotope
	var/name
	var/not_modified_ka = 0.0

/isotope/u238
	name = "Uranium 238"
	not_modified_ka = 0.59596

/isotope/pu238
	name = "Plutonium 238"
	not_modified_ka = 0.27030

/isotope/po210
	name = "Polonium 210"
	not_modified_ka = 0.44015

/obj/item/weapon/artifact
	icon = 'icons/stalker/artifacts.dmi'
	var/isotope/isotope_base = null
	var/capacity = 0
	var/charge = 0
	var/list/art_armor = list()
	var/radiation = 2
	var/waspicked = 0
	var/level_s = 1
	w_class = 3
	var/obj/effect/fakeart/phantom = null

/obj/item/weapon/artifact/proc/Think(user)
	if(!charge) return 0
	if(istype(user, /mob/living/carbon))
		var/mob/living/carbon/mob = user
		if(radiation)
			mob.radiation += radiation
		if(mob.radiation < 0)
			mob.radiation = 0
	return 1


/obj/item/weapon/artifact/New()
	isotope_base = pick(/isotope/u238,
						/isotope/pu238,
						/isotope/po210)
	capacity = rand(1000, 10000)
	charge = capacity
	//invisibility = 100

/obj/item/weapon/artifact/pickup(mob/user)
	if(invisibility)
		invisibility = 0

	/////////////////////////////////////////Гравитационные артефакты/////////////////////////////////////////
/obj/item/weapon/artifact/meduza
	name = "meduza"
	desc = "Образуетс&#255; в аномалии Трамплин. Формирует слабое защитное поле, побочным эффектом которого &#255;вл&#255;етс&#255; лёгкое излучение. Артефакт широко распространён и недорог."
	icon_state = "meduza"
	art_armor = list(bullet = 10)
	level_s = 1

/obj/item/weapon/artifact/meduza/New()
	..()
	art_armor = list(bullet = 10)

/obj/item/weapon/artifact/stoneflower
	name = "stone flower"
	desc = "Рождаетс&#255; в аномалии «трамплин». Такой артефакт можно найти в немногих участках Зоны. Вкраплени&#255; металлических соединений дают красивую игру света."
	icon_state = "stoneflower"
	art_armor = list(bullet = 20)
	level_s = 2

/obj/item/weapon/artifact/stoneflower/New()
	..()
	art_armor = list(bullet = 20)

/obj/item/weapon/artifact/nightstar
	name = "night star"
	desc = "Этот замечательный артефакт формируетс&#255; аномалией «Трамплин». Использование артефакта требует нейтрализации смертельного радиоактивного излучени&#255;."
	icon_state = "nightstar"
	art_armor = list(bullet = 30)
	radiation = 3
	level_s = 3

/obj/item/weapon/artifact/nightstar/New()
	..()
	art_armor = list(bullet = 30)

/obj/item/weapon/artifact/maminibusi
	name = "mamini busi"
	desc = "Аномальное образование, по форме напоминающее бусы, довольно редкое и дорогое. Даёт защиту от пуль. Не облучает носител&#255;."
	icon_state = "mamini_busi"
	art_armor = list(bullet = 30)
	radiation = 0
	level_s = 4

/obj/item/weapon/artifact/maminibusi/New()
	..()
	art_armor = list(bullet = 30)

	/////////////////////////////////////////Электро артефакты/////////////////////////////////////////

/obj/item/weapon/artifact/flash
	name = "flash"
	desc = "Электра изредка порождает этот артефакт. Сталкеры используют его с большой охотой из-за его неплохих качеств."
	icon_state = "flash"
	art_armor = list(electro = 10)
	radiation = 2
	level_s = 1

/obj/item/weapon/artifact/flash/New()
	..()
	art_armor = list(electro = 10)

/obj/item/weapon/artifact/moonlight
	name = "moonlight"
	desc = "Вырожденный случай активности аномалии Электра. Видимо, такую замечательную округлую форму можно получить, если подвергнуть аномалию термовоздействию. Дорогой артефакт."
	icon_state = "moonlight"
	art_armor = list(electro = 20)
	level_s = 2

/obj/item/weapon/artifact/moonlight/New()
	..()
	art_armor = list(electro = 20)

/obj/item/weapon/artifact/pustishka
	name = "pustishka"
	desc = "Предположительно, разр&#255;женный энергетический элемент. Добавл&#255;ет огнестойкость."
	icon_state = "pustishka"
	art_armor = list(electro = 30)
	level_s = 3

/obj/item/weapon/artifact/pustishka/New()
	..()
	art_armor = list(electro = 30)

/obj/item/weapon/artifact/battery
	name = "battery"
	desc = "Происхождение этой вещи окутано завесой научной тайны. Пон&#255;тно, что в его состав вход&#255;т диэлектрические элементы, но при каких физических услови&#255;х он формируетс&#255; - науке не известно."
	icon_state = "battery"
	art_armor = list(electro = 30)
	level_s = 4

/obj/item/weapon/artifact/battery/New()
	..()
	art_armor = list(electro = 30)

	/////////////////////////////////////////Огненные артефакты/////////////////////////////////////////

/obj/item/weapon/artifact/droplet
	name = "droplet"
	desc = "Формируетс&#255; аномалией Жарка при высоких температурах. Внешне выгл&#255;дит как почерневшее каплевидное образование с гл&#255;нцевой поверхностью, покрытое трещинами. Слабо выводит радиацию."
	icon_state = "droplet"
	art_armor = list(rad = 10)
	radiation = -1
	level_s = 1

/obj/item/weapon/artifact/droplet/New()
	..()
	art_armor = list(rad = 10)

/obj/item/weapon/artifact/droplet/Think(user)
	if(!..()) return 0
	if(istype(user, /mob/living/carbon))
		var/mob/living/carbon/mob = user
		mob.adjustStaminaLoss(1.8)
	return 1

/obj/item/weapon/artifact/fireball
	name = "fireball"
	desc = "Кристаллизируетс&#255; в аномалии «Жарка». Хорошо боретс&#255; с радиоактивностью, хот&#255; ускоренный энергообмен изнашивает мышцы двигательного аппарата. Долго бежать не получитс&#255;. Артефакт излучает тепло."
	icon_state = "fireball"
	art_armor = list(rad = 20)
	level_s = 2

/obj/item/weapon/artifact/fireball/New()
	..()
	art_armor = list(rad = 20)

/obj/item/weapon/artifact/crystal
	name = "crystal"
	desc = "Получаетс&#255; при попадании т&#255;желого металла в аномалию «Жарка». Этот артефакт замечательно выводит радиацию. Такой артефакт высоко ценитс&#255; сталкерами, и мало где его можно добыть."
	icon_state = "crystal"
	art_armor = list(rad = 30)
	radiation = -5
	level_s = 3

/obj/item/weapon/artifact/crystal/New()
	..()
	art_armor = list(rad = 30)

	/////////////////////////////////////////Химические артефакты/////////////////////////////////////////

/obj/item/weapon/artifact/stone_blood
	name = "stone blood"
	desc = "Представл&#255;ет собой красноватое образование из спрессованных и окаменевших остатков растений, почвы и останков животных. Обладает способностью частично нейтрализовать вредные дл&#255; человека химические вещества. Радиоактивен."
	icon_state = "stone_blood"
	art_armor = list(bio = 10)
	radiation = 1
	level_s = 1

/obj/item/weapon/artifact/stone_blood/New()
	..()
	art_armor = list(bio = 10)

/obj/item/weapon/artifact/soul
	name = "soul"
	desc = "Органический артефакт с уникальными свойствами. Неизвестным пока образом увеличивает общую скорость восстановлени&#255; организма после травм любой природы, не ускор&#255;&#255; накопление токсинов. Из-за при&#255;тного внешнего вида представл&#255;ет особый интерес дл&#255; коллекционеров. Радиоактивен."
	icon_state = "soul"
	radiation = 2
	level_s = 1

/obj/item/weapon/artifact/soul/New()
	..()
	art_armor = list()

/obj/item/weapon/artifact/soul/Think(user)
	if(!..()) return 0
	if(istype(user, /mob/living/carbon))
		var/mob/living/carbon/mob = user
		mob.adjustBruteLoss(-0.5)
		mob.adjustFireLoss(-0.5)
	return 1

/obj/item/weapon/artifact/bubble
	name = "bubble"
	desc = "Артефакт представл&#255;ет собой несколько полых образований органической природы, соединённых между собой. Выдел&#255;ет газообразное вещество, способное нейтрализовать радиоактивные частицы в организме человека; какого-либо вредоносного воздействи&#255; данного вещества не вы&#255;влено. Ввиду высокой эффективности пользуетс&#255; огромным спросом."
	icon_state = "bubble"
	radiation = -4
	level_s = 1

/obj/item/weapon/artifact/bubble/New()
	..()
	art_armor = list()

	//Пояс
/obj/item/weapon/storage/belt/stalker
	name = "artifact belt"
	desc = "Специальный по&#255;с дл&#255; артефактов."
	icon = 'icons/obj/clothing/belts.dmi'
	icon_state = "utilitybelt"
	item_state = "utility"
	max_w_class = 3

/obj/item/weapon/storage/belt/stalker/artifact_belt
	var/thinkrate = 1000
	can_hold = list(
													//Гравитационные артефакты
		/obj/item/weapon/artifact/meduza,
		/obj/item/weapon/artifact/stoneflower,
		/obj/item/weapon/artifact/nightstar,
		/obj/item/weapon/artifact/maminibusi,

													//Электро артефакты
		/obj/item/weapon/artifact/flash,
		/obj/item/weapon/artifact/moonlight,
		/obj/item/weapon/artifact/battery,
		/obj/item/weapon/artifact/pustishka,

													//Огненные артефакты
		/obj/item/weapon/artifact/droplet,
		/obj/item/weapon/artifact/fireball,
		/obj/item/weapon/artifact/crystal,

													//Химические артефакты (Холодец)
		/obj/item/weapon/artifact/stone_blood,
		/obj/item/weapon/artifact/soul,
		/obj/item/weapon/artifact/bubble,

		)

/obj/item/weapon/storage/belt/stalker/artifact_belt/proc/Think()
	for(var/obj/item/weapon/artifact/A in contents)
		A.Think(loc)
	spawn(thinkrate)
		Think()

/obj/item/weapon/storage/belt/stalker/artifact_belt/handle_item_insertion(obj/item/W, prevent_warning = 0, mob/user)
	if(..(W, prevent_warning, user) && istype(W, /obj/item/weapon/artifact))
		var/obj/item/weapon/artifact/artifact = W
		var/mob/living/carbon/mob = loc
		for(var/i=1,i<=artifact.art_armor.len,i++)
			var/armortype = artifact.art_armor[i]
			if(!mob.global_armor.Find(armortype))
				mob.global_armor.Add(armortype)
			mob.global_armor[armortype] += artifact.art_armor[armortype]
		return 1
	return 0

/obj/item/weapon/storage/belt/stalker/artifact_belt/remove_from_storage(obj/item/W, atom/new_location, burn = 0)
	if(..(W, new_location, burn) && istype(W, /obj/item/weapon/artifact))
		var/obj/item/weapon/artifact/artifact = W
		var/mob/living/carbon/mob = loc
		for(var/i=1,i<=artifact.art_armor.len,i++)
			var/armortype = artifact.art_armor[i]
			if(!mob.global_armor.Find(armortype))
				mob.global_armor.Add(armortype)
			mob.global_armor[armortype] -= artifact.art_armor[armortype]
		return 1
	return 0

/obj/item/weapon/storage/belt/stalker/artifact_belt/small_artifact_belt
	name = "small artifact belt"
	desc = "Специальный по&#255;с дл&#255; артефактов."
	icon = 'icons/obj/clothing/belts.dmi'
	icon_state = "fannypack_black"
	item_state = "artifacts"
	storage_slots = 2


