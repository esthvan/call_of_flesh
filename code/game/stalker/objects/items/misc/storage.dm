/obj/item/weapon/storage/wallet/stalker
	storage_slots = 10
	can_hold = list(
		/obj/item/stack/spacecash,
		/obj/item/clothing/mask/cigarette,
		/obj/item/weapon/lighter,
		/obj/item/weapon/match)

/obj/item/weapon/storage/wallet/stalker/New()
	..()
	var/item1_type = pick(/obj/item/stack/spacecash/c100,/obj/item/stack/spacecash/c50)
	var/item2_type
	if(prob(50))
		item2_type = pick(/obj/item/stack/spacecash/c100,/obj/item/stack/spacecash/c50)

	spawn(2)
		if(item1_type)
			new item1_type(src)
		if(item2_type)
			new item2_type(src)

/obj/item/weapon/storage/backpack/stalker
	name = "backpack"
	desc = "You wear this on your back and put items into it."
	icon_state = "backpack-tourist"
	item_state = "backpack-tourist"
	w_class = 5
	slot_flags = SLOT_BACK
	max_w_class = 4
	max_combined_w_class = 30
	storage_slots = 21
	burn_state = FLAMMABLE
	burntime = 20
	display_contents_with_number = 1

/obj/item/weapon/storage/backpack/stalker/civilian
	name = "civilian backpack"
	icon_state = "backpack-civilian"
	item_state = "backpack-civilian"
	max_w_class = 3
	max_combined_w_class = 20

/obj/item/weapon/storage/backpack/stalker/tourist
	name = "tourist backpack"
	icon_state = "backpack-tourist"
	item_state = "backpack-tourist"
	max_w_class = 4
	max_combined_w_class = 35

/obj/item/weapon/storage/backpack/stalker/professional
	name = "professional backpack"
	icon_state = "backpack-professional"
	item_state = "backpack-professional"
	max_w_class = 4
	max_combined_w_class = 55

/obj/item/weapon/storage/backpack/satchel/stalker
	name = "satchel"
	icon_state = "satchel"
	item_state = "satchel"
	w_class = 5
	slot_flags = SLOT_BACK
	max_w_class = 4
	max_combined_w_class = 30
	storage_slots = 21
	burn_state = FLAMMABLE
	burntime = 20
	display_contents_with_number = 1

/obj/item/weapon/storage/backpack/satchel/stalker/civilian
	name = "civilian satchel"
	icon_state = "satchel-civilian"
	item_state = "satchel-civilian"
	max_w_class = 3
	max_combined_w_class = 20
/*
/obj/item/weapon/storage/backpack/stalker/attackby(obj/item/weapon/W, mob/user, params)
	playsound(src.loc, "sound/stalker/objects/inv_open.ogg", 50, 1, -5)
	..()
*/
//Some suit internal slots

/obj/item/weapon/storage/internal_slot
	name = "internal slot"
	desc = "You shouldn't see this."
	w_class = 4
	max_w_class = 2
	max_combined_w_class = 2
	storage_slots = 1
	w_class = 5
	takeout_speed = 0
	touch_sound = 'sound/stalker/objects/internal_slot_toggle.ogg'
	insert_sound = null

/obj/item/weapon/storage/internal_slot/attack_hand(mob/user)
	playsound(loc, touch_sound, 50, 1, -5)

	orient2hud(user)
	if(loc && loc.loc && (loc == user || loc.loc == user))
		if(user.s_active)
			user.s_active.close(user)
		show_to(user)
	add_fingerprint(user)

/obj/item/weapon/storage/internal_slot/MouseDrop(atom/over_object)
	if(iscarbon(usr) || isdrone(usr)) //all the check for item manipulation are in other places, you can safely open any storages as anything and its not buggy, i checked
		var/mob/M = usr

		if(!over_object)
			return

		if (istype(usr.loc,/obj/mecha)) // stops inventory actions in a mech
			return

		if(over_object == M && Adjacent(M)) // this must come before the screen objects only block
			orient2hud(M)					// dunno why it wasn't before
			if(M.s_active)
				M.s_active.close(M)
			show_to(M)
			return

		if(!M.restrained() && !M.stat)
			if(!istype(over_object, /obj/screen))
				return content_can_dump(over_object, M)

			if(loc != usr || (loc && loc.loc == usr))
				return

			playsound(loc, touch_sound, 50, 1, -5)
			add_fingerprint(usr)


//Artifact container//

/obj/item/weapon/storage/internal_slot/container
	name = "mounted artifact container"
	can_hold = list(/obj/item/weapon/artifact)
	storage_slots = 1

/obj/item/weapon/storage/internal_slot/container/advanced
	name = "mounted advanced artifact container"
	max_combined_w_class = 4
	storage_slots = 2

/obj/item/weapon/storage/internal_slot/container/modern
	name = "mounted modern artifact container"
	max_combined_w_class = 4
	storage_slots = 2
	radiation_protection = 1

//Item slots//

/obj/item/weapon/storage/internal_slot/webbing
	name = "mounted webbing"
	max_w_class = 2
	max_combined_w_class = 4
	storage_slots = 2

/obj/item/weapon/storage/internal_slot/webbing/advanced
	name = "mounted advanced webbing"
	max_w_class = 2
	max_combined_w_class = 6
	storage_slots = 3

/obj/item/weapon/storage/internal_slot/webbing/modern
	name = "mounted modern webbing"
	max_w_class = 3
	max_combined_w_class = 12
	storage_slots = 4

//Gun slot//

/obj/item/weapon/storage/internal_slot/gun_case
	name = "mounted gan case"
	can_hold = list(/obj/item/weapon/gun/projectile)
	max_w_class = 6
	max_combined_w_class = 6
	storage_slots = 1