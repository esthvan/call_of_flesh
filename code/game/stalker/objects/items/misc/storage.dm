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

/obj/item/weapon/storage/backpack/satchel/stalker
	name = "satchel"
	icon_state = "satchel-tourist"
	item_state = "satchel-tourist"
	w_class = 5
	slot_flags = SLOT_BACK
	max_w_class = 4
	max_combined_w_class = 30
	storage_slots = 21
	burn_state = FLAMMABLE
	burntime = 20

/obj/item/weapon/storage/backpack/stalker/attackby(obj/item/weapon/W, mob/user, params)
	playsound(src.loc, "sound/stalker/objects/inv_open.ogg", 50, 1, -5)
	..()