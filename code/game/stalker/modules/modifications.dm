/obj/structure/stalker/modification_table
	name = "modification table"
	desc = "Верстак, стол, на котором можно модифицировать оружие и костюмы."
	eng_desc = "Craft the diamond pickaxe."
	icon = 'icons/stalker/decor.dmi'
	icon_state = "polka"
	var/obj/item/modificated = null
	var/balance = 0
	density = 1
	anchored = 1
	var/list/modifications_list = list(



		)

/datum/data/modification
	name = "modification"
	var/cost = 5000
	var/desc = "Это модификаци&#255;."
	var/eng_desc = "This is modification"

/datum/data/modification/proc/AffectEquipment(var/obj/item/I)
	return

/datum/data/modification/clothing
	name = "clothing modification"
	desc = "You shouldn't see this."
	eng_desc = "You shouldn't see this."
	var/list/add_armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)

/datum/data/modification/clothing/AffectEquipment(var/obj/item/I)
	for(var/A in I.armor)
		I.armor[A] += add_armor[A]
	return
/////////////////////////////////////МОДИФИКАЦИИ ШЛЕМОВ//
/datum/data/modification/clothing/head
	name = "helmet modification"
	desc = "Это модификац&#255; дл&#255; шлема."
	eng_desc = "This is helmet modification."

/datum/data/modification/clothing/head/nightvision
	name = "Nightvision I Gen"
	cost = 12000
	desc = "Установка прибора ночного видень&#255; первого поколени&#255;."
	eng_desc = ""
	add_armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)

/datum/data/modification/clothing/head/nightvision/AffectEquipment(var/obj/item/clothing/head/Gear)
	Gear.nvg = new /obj/item/nightvision(src)
	return
/////////////////////////////////////МОДИФИКАЦИИ МАСОК//
/datum/data/modification/clothing/mask
	name = "helmet modification"
	desc = "Это модификац&#255; дл&#255; маски."
	eng_desc = "This is mask modification."

/datum/data/modification/clothing/mask/nightvision
	name = "Nightvision I Gen"
	cost = 12000
	desc = "Установка прибора ночного видень&#255; первого поколени&#255;."
	eng_desc = ""
	add_armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)

/datum/data/modification/clothing/mask/nightvision/AffectEquipment(var/obj/item/clothing/mask/Gear)
	Gear.nvg = new /obj/item/nightvision(src)
	return
/////////////////////////////////////МОДИФИКАЦИИ КОСТЮМОВ//
/datum/data/modification/clothing/suit
	name = "suit modification"
	desc = "Это модификаци&#255; дл&#255; костюма."
	eng_desc = "This is suit modification."
/////////////////////////////////////МОДИФИКАЦИИ ОРУЖИЯ//
/datum/data/modification/gun
	name = "gun modification"
	desc = "Это модификаци&#255; дл&#255; оружи&#255;."
	eng_desc = "This is gun modification."

/obj/structure/stalker/modification_table/attackby(obj/item/I, mob/user, params)
	..()
	if(istype(I, /obj/item/clothing/head))
		I.loc = src
		modificated = I

	if(istype(I, /obj/item/clothing/mask))
		I.loc = src
		modificated = I

	if(istype(I, /obj/item/clothing/suit))
		I.loc = src
		modificated = I

	if(istype(I, /obj/item/weapon/gun/projectile))
		I.loc = src
		modificated = I

/obj/structure/stalker/modification_table/attack_hand(mob/living/user as mob)
	if (..())
		return

	if(!ishuman(user))
		return

	var/mob/living/carbon/human/H = user

	interact(H)

/obj/structure/stalker/modification_table/interact(var/mob/living/carbon/human/H)

	if(!modificated)
		return

	if(!istype(H.wear_id, /obj/item/device/stalker_pda))
		say("Put on your KPK.")
		return

	var/obj/item/device/stalker_pda/KPK = H.wear_id

	if(!KPK.profile || !KPK.owner)
		say("Activate your KPK profile.")
		return

	if(KPK.owner != H)
		say("No access.")
		return

	balance = KPK.profile.fields["money"]

	var/dat
	dat +="<div class='statusDisplay'>"
	dat += "Balance: [balance] р.<br>"
	dat += "<br><br>INSTRUCTION: Insert your gear in the modification table."
	dat += "</div>"
	dat += "<div class='lenta_scroll'>"
	dat += "<br><BR><table border='0' width='400'>"
	if(istype(modificated, /obj/item/clothing/head))
		if(H.client.prefs.chat_toggles & CHAT_LANGUAGE)
			for(var/datum/data/modification/clothing/head/M in modifications_list)
				dat += "<tr><td>[M.name]</td></tr><tr><td>[M.eng_desc]</td><td><A href='?src=\ref[src];buy=\ref[M]'>UPGRADE</A></td></tr>"
		else
			for(var/datum/data/modification/clothing/head/M in modifications_list)
				dat += "<tr><td>[M.name]</td></tr><tr><td>[M.desc]</td><td><A href='?src=\ref[src];buy=\ref[M]'>UPGRADE</A></td></tr>"

	if(istype(modificated, /obj/item/clothing/mask))
		if(H.client.prefs.chat_toggles & CHAT_LANGUAGE)
			for(var/datum/data/modification/clothing/mask/M in modifications_list)
				dat += "<tr><td>[M.name]</td></tr><tr><td>[M.eng_desc]</td><td><A href='?src=\ref[src];buy=\ref[M]'>UPGRADE</A></td></tr>"
		else
			for(var/datum/data/modification/clothing/mask/M in modifications_list)
				dat += "<tr><td>[M.name]</td></tr><tr><td>[M.desc]</td><td><A href='?src=\ref[src];buy=\ref[M]'>UPGRADE</A></td></tr>"

	if(istype(modificated, /obj/item/clothing/suit))
		if(H.client.prefs.chat_toggles & CHAT_LANGUAGE)
			for(var/datum/data/modification/clothing/suit/M in modifications_list)
				dat += "<tr><td>[M.name]</td></tr><tr><td>[M.eng_desc]</td><td><A href='?src=\ref[src];buy=\ref[M]'>UPGRADE</A></td></tr>"
		else
			for(var/datum/data/modification/clothing/suit/M in modifications_list)
				dat += "<tr><td>[M.name]</td></tr><tr><td>[M.desc]</td><td><A href='?src=\ref[src];buy=\ref[M]'>UPGRADE</A></td></tr>"

	if(istype(modificated, /obj/item/weapon/gun/projectile))
		if(H.client.prefs.chat_toggles & CHAT_LANGUAGE)
			for(var/datum/data/modification/gun/M in modifications_list)
				dat += "<tr><td>[M.name]</td></tr><tr><td>[M.eng_desc]</td><td><A href='?src=\ref[src];buy=\ref[M]'>UPGRADE</A></td></tr>"
		else
			for(var/datum/data/modification/gun/M in modifications_list)
				dat += "<tr><td>[M.name]</td></tr><tr><td>[M.desc]</td><td><A href='?src=\ref[src];buy=\ref[M]'>UPGRADE</A></td></tr>"

	dat += "</table>"
	dat += "</div>"

	var/datum/browser/popup
	popup = new(H, "modtable", "Modification Table", 450, 700)
	popup.set_content(dat)
	popup.open()
	return