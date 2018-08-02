/obj/structure/stalker/modification_table
	name = "modification table"
	desc = "Верстак, стол, на котором можно модифицировать оружие и костюмы."
	eng_desc = "Minecraft table."
	icon = 'icons/stalker/decor.dmi'
	var/obj/item/modificated = null
	density = 1
	anchored = 1

/datum/data/modification
	name = "modification"
	var/cost = 5000
	var/desc = "Это модификаци&#x44F;."
	var/eng_desc = "This is modification"

/datum/data/modification/clothing
	name = "clothing modification"
	desc = "You shouldn't see this."
	eng_desc = "You shouldn't see this."
	var/list/add_armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)

/datum/data/modification/clothing/head
	name = "helmet modification"
	desc = "Это модификаци&#x44F;. дл&#x44F; шлема."
	eng_desc = "This is helmet modification."

/datum/data/modification/clothing/head/nightvision
	name = "Nightvision I"
	cost = 15000
	desc = "Установить прибор ночного видень&#x44F; первого поколени&#x44F;."
	eng_desc = ""
	add_armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)

/datum/data/modification/clothing/suit
	name = "suit modification"
	desc = "Это модификаци&#x44F;. дл&#x44F; костюма."
	eng_desc = "This is suit modification."

/datum/data/modification/gun
	name = "gun modification"
	desc = "Это модификаци&#x44F;. дл&#x44F; оружи&#x44F;."
	eng_desc = "This is gun modification."