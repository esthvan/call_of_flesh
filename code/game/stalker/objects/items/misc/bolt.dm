/obj/item/weapon/stalker/bolts
	name = "bolts"
	desc = "Куча болтов."
	eng_desc = "A pile of bolts."
	icon = 'icons/stalker/bolt.dmi'
	icon_state = "kucha"
	w_class = 2

/obj/item/weapon/stalker/bolts/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/weapon/stalker/bolt))
		if(user.client && (user.client.prefs.chat_toggles & CHAT_LANGUAGE))
			user << "<span class='notice'>You place a bolt in the pile.</span>"
		else
			user << "<span class='notice'>Вы кладёте болт в кучу.</span>"
		PlaceInPool(W)

/obj/item/weapon/stalker/bolt
	name = "bolt"
	desc = "Старый советский болт, пораженный коррозией,"
	eng_desc = "Old sovit bolt affected by corrosion."
	icon = 'icons/stalker/bolt.dmi'
	icon_state = "bolt"
	w_class = 1
	var/spawn_time = 0

/obj/item/weapon/stalker/bolt/New()
	spawn_time = world.time
	SSobj.processing.Add(src)

/obj/item/weapon/stalker/bolt/process()
	if(loc && spawn_time + 150 <= world.time)
		PlaceInPool(src)

/obj/item/weapon/stalker/bolt/Destroy()
	..()
	SSobj.processing.Remove()
	return QDEL_HINT_PUTINPOOL

/obj/item/weapon/stalker/bolts/MouseDrop(atom/over_object)
	var/mob/M = usr
	if(M.restrained() || M.stat || !Adjacent(M))
		return

	if(over_object == M)
		M.put_in_hands(src)

	else if(istype(over_object, /obj/screen))
		switch(over_object.name)
			if("r_hand")
				if(!remove_item_from_storage(M))
					M.unEquip(src)
				M.put_in_r_hand(src)
			if("l_hand")
				if(!remove_item_from_storage(M))
					M.unEquip(src)
				M.put_in_l_hand(src)

	add_fingerprint(M)


/obj/item/weapon/stalker/bolts/attack_paw(mob/user)
	return attack_hand(user)


/obj/item/weapon/stalker/bolts/attack_hand(mob/user)
	if(user.lying)
		return

	user.changeNext_move(CLICK_CD_MELEE)

	if(user != src.loc)
		..()
		return

	var/obj/item/weapon/stalker/bolt/P = PoolOrNew(/obj/item/weapon/stalker/bolt)
	P.loc = user.loc
	user.put_in_hands(P)
	if(user.client && (user.client.prefs.chat_toggles & CHAT_LANGUAGE))
		user << "<span class='notice'>You take a bolt out of the pile.</span>"
	else
		user << "<span class='notice'>Вы достаете болт из кучи.</span>"

	add_fingerprint(user)

	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.throw_mode_on()

	return