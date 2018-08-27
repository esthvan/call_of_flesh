var/id_ = 0

/obj/structure/stalker/modification_table
	name = "modification table"
	desc = "Верстак, стол, на котором можно модифицировать оружие и костюмы."
	eng_desc = "Craft the diamond pickaxe."
	icon = 'icons/stalker/decor.dmi'
	icon_state = "gazovaya_plita"
	layer = 2.8
	var/obj/item/modificated = null
	var/balance = 0
	density = 1
	anchored = 1
	var/list/modifications_list = list(
		new /datum/data/modification/clothing/head/nightvision(),	//Шлем - ночное виденье
		new /datum/data/modification/clothing/mask/nightvision(),	//Противогаз
		new /datum/data/modification/clothing/suit/nightvision(),	//Костюм с замкнутой системой дыхания - ночное виденье
		new /datum/data/modification/clothing/head/nightvision/advanced(),
		new /datum/data/modification/clothing/mask/nightvision/advanced(),
		new /datum/data/modification/clothing/suit/nightvision/advanced(),
		)

/datum/data/modification
	name = "modification"
	var/cost = 5000
	var/desc = "Это модификаци&#255;."
	var/eng_desc = "This is modification"
	var/list/add_armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	var/id = null
	var/tier = 1
	var/modificated_type = null
/*
/datum/data/modification/New()
	if(!id)
		id_++
		id = num2text(id_)
*/
/datum/data/modification/proc/AffectEquipment(var/obj/item/I)
	I.unique = 1
	I.update_icon()
	I.modifications += src.id
	return

/datum/data/modification/proc/SpecialCheck(var/obj/item/I)
	return 1

/datum/data/modification/clothing
	name = "clothing modification"
	desc = "You shouldn't see this."
	eng_desc = "You shouldn't see this."

/datum/data/modification/clothing/AffectEquipment(var/obj/item/I)
	//for(var/A in I.armor)
	//	I.armor[A] += add_armor[A]
	//I.modifications += src.id
	..(I)

/////////////////////////////////////МОДИФИКАЦИИ ШЛЕМОВ/////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
/datum/data/modification/clothing/head
	name = "helmet modification"
	desc = "Это модификац&#255; дл&#255; шлема."
	eng_desc = "This is helmet modification."
	modificated_type = /obj/item/clothing/head
/*
/datum/data/modification/clothing/head/SpecialCheck(var/obj/item/clothing/head/Gear)
	if(Gear.flags_inv & HIDEMASK)
		return 1
	return 0
*/
/datum/data/modification/clothing/head/nightvision
	name = "Nightvision I Generation"
	cost = 12000
	desc = "Установка прибора ночного видень&#255; первого поколени&#255;."
	eng_desc = "Installation of a I gerantion nightvision device."
	add_armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	id = "visor_head"
	tier = 1
/*
/datum/data/modification/clothing/head/nightvision/SpecialCheck(var/obj/item/clothing/head/Gear)
	if(Gear.flags_inv & HIDEEYES)
		return 1
	return 0
*/
/datum/data/modification/clothing/head/nightvision/AffectEquipment(var/obj/item/clothing/head/Gear)
	if(!Gear.nvg)
		Gear.nvg = new /obj/item/nightvision(Gear)
	Gear.nvg.colour_matrix = NIGHTVISION_MATRIX_I
	..(Gear)

/datum/data/modification/clothing/head/nightvision/advanced
	name = "Nightvision II Generation"
	cost = 30000
	desc = "Установка прибора ночного видень&#255; второго поколени&#255;."
	eng_desc = "Installation of a II gerantion nightvision device."
	add_armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	id = "visor_head"
	tier = 2

/datum/data/modification/clothing/head/nightvision/advanced/AffectEquipment(var/obj/item/clothing/head/Gear)
	if(!Gear.nvg)
		Gear.nvg = new /obj/item/nightvision(Gear)
	Gear.nvg.colour_matrix = NIGHTVISION_MATRIX_II
	..(Gear)

/////////////////////////////////////МОДИФИКАЦИИ МАСОК//////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
/datum/data/modification/clothing/mask
	name = "helmet modification"
	desc = "Это модификац&#255; дл&#255; маски."
	eng_desc = "This is mask modification."
	modificated_type = /obj/item/clothing/mask/gas/stalker

/datum/data/modification/clothing/mask/nightvision
	name = "Nightvision I Generation"
	cost = 12000
	desc = "Установка прибора ночного видень&#255; первого поколени&#255;."
	eng_desc = "Installation of a I gerantion nightvision device."
	add_armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	id = "visor_mask"
	modificated_type = /obj/item/clothing/mask/gas/stalker

/datum/data/modification/clothing/mask/nightvision/AffectEquipment(var/obj/item/clothing/mask/Gear)
	if(!Gear.nvg)
		Gear.nvg = new /obj/item/nightvision(Gear)
	Gear.nvg.colour_matrix = NIGHTVISION_MATRIX_I
	..(Gear)

/datum/data/modification/clothing/mask/nightvision/advanced
	name = "Nightvision II Generation"
	cost = 30000
	desc = "Установка прибора ночного видень&#255; второго поколени&#255;."
	eng_desc = "Installation of a II gerantion nightvision device."
	add_armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	id = "visor_mask"
	tier = 2
	modificated_type = /obj/item/clothing/mask/gas/stalker

/datum/data/modification/clothing/mask/nightvision/advanced/AffectEquipment(var/obj/item/clothing/mask/Gear)
	if(!Gear.nvg)
		Gear.nvg = new /obj/item/nightvision(Gear)
	Gear.nvg.colour_matrix = NIGHTVISION_MATRIX_II
	..(Gear)

/////////////////////////////////////МОДИФИКАЦИИ КОСТЮМОВ////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
/datum/data/modification/clothing/suit
	name = "suit modification"
	desc = "Это модификаци&#255; дл&#255; костюма."
	eng_desc = "This is suit modification."
	modificated_type = /obj/item/clothing/suit

/datum/data/modification/clothing/suit/nightvision
	name = "Nightvision I Generation"
	cost = 12000
	desc = "Установка прибора ночного видень&#255; первого поколени&#255;."
	eng_desc = "Installation of a I gerantion nightvision device."
	add_armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	id = "visor_suit"
	modificated_type = /obj/item/clothing/suit/hooded/sealed

/datum/data/modification/clothing/suit/nightvision/AffectEquipment(var/obj/item/clothing/mask/Gear)
	if(!Gear.nvg)
		Gear.nvg = new /obj/item/nightvision(Gear)
	Gear.nvg.colour_matrix = NIGHTVISION_MATRIX_I
	..(Gear)

/datum/data/modification/clothing/suit/nightvision/advanced
	name = "Nightvision II Gen"
	cost = 30000
	desc = "Установка прибора ночного видень&#255; второго поколени&#255;."
	eng_desc = "Installation of a II gerantion nightvision device."
	add_armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	id = "visor_suit"
	modificated_type = /obj/item/clothing/suit/hooded/sealed

/datum/data/modification/clothing/suit/nightvision/advanced/AffectEquipment(var/obj/item/clothing/mask/Gear)
	if(!Gear.nvg)
		Gear.nvg = new /obj/item/nightvision(Gear)
	Gear.nvg.colour_matrix = NIGHTVISION_MATRIX_II
	..(Gear)
/////////////////////////////////////МОДИФИКАЦИИ ОРУЖИЯ//////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
/datum/data/modification/gun
	name = "gun modification"
	desc = "Это модификаци&#255; дл&#255; оружи&#255;."
	eng_desc = "This is gun modification."

/obj/structure/stalker/modification_table/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/clothing/head))
		var/obj/item/clothing/head/H = I
		if(H.durability)
			if(!user.unEquip(I))
				return 0
			I.loc = src
			modificated = I
			return 1
		return 0

	if(istype(I, /obj/item/clothing/mask))
		var/obj/item/clothing/mask/M = I
		if(M.durability)
			if(!user.unEquip(I))
				return 0
			I.loc = src
			modificated = I
			return 1
		return 0

	if(istype(I, /obj/item/clothing/suit))
		var/obj/item/clothing/suit/S = I
		if(S.durability)
			if(!user.unEquip(I))
				return 0
			I.loc = src
			modificated = I
			return 1
		return 0

	if(istype(I, /obj/item/weapon/gun/projectile))
		var/obj/item/weapon/gun/projectile/P = I
		if(P.durability)
			if(!user.unEquip(I))
				return 0
			I.loc = src
			modificated = I
			return 1
		return 0

/obj/structure/stalker/modification_table/attack_hand(mob/living/user as mob)
	if(!ishuman(user))
		return

	var/mob/living/carbon/human/H = user

	interact(H)

/obj/structure/stalker/modification_table/interact(var/mob/living/carbon/human/H)

	if(!modificated)
		say("Insert gear for modification.")
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
	dat += "<A href='?src=\ref[src];eject=1'>Eject</A>"
	dat += "<div class='lenta_scroll'>"
	dat += "<br><BR><table border='0' width='400'>"
	for(var/datum/data/modification/M in modifications_list)
		dat += SetMenu(H, M)

	dat += "</table>"
	dat += "</div>"

	var/datum/browser/popup
	popup = new(H, "modtable", "Modification Table", 450, 700)
	popup.set_content(dat)
	popup.open()
	return

/obj/structure/stalker/modification_table/proc/SetMenu(var/mob/living/carbon/human/H, var/datum/data/modification/M)
	var/dat_
	//if(modificated.type in typesof(M.modificated_type))
		//if((!(M.id in modificated.modifications) && M.tier == 1) || (M.tier  == modificated.modifications[M.id] + 1))
	if(M.id in modificated.modifications && M.tier == modificated.modifications[M.id] + 1)
		if(M.SpecialCheck(modificated))
			if(H.client.prefs.chat_toggles & CHAT_LANGUAGE)
				dat_ += "<tr><td><b>[M.name]</b></td><td><A href='?src=\ref[src];upgrade=\ref[M]'>UPGRADE</A></td></tr><tr><td>[M.eng_desc]</td></tr>"
			else
				dat_ += "<tr><td><b>[M.name]</b></td><td><A href='?src=\ref[src];upgrade=\ref[M]'>АПГРЕЙД</A></td></tr><tr><td>[M.desc]</td></tr>"
	return dat_

/obj/structure/stalker/modification_table/Topic(href, href_list)
	if(..())
		return

	if(href_list["upgrade"])
		var/datum/data/modification/M = locate(href_list["upgrade"])
		M.AffectEquipment(modificated)
		return

	if(href_list["eject"])
		if(!modificated)
			return
		modificated.loc = src.loc
		modificated = null
		usr.unset_machine()
		return