/obj/item/weapon/gun/projectile
	desc = "Now comes in flavors like GUN. Uses 10mm ammo, for some reason"
	name = "projectile gun"
	icon_state = "pistol"
	origin_tech = "combat=2;materials=2"
	w_class = 3
	var/loadsound = 'sound/stalker/weapons/load/ak74_load.ogg'
	var/opensound = 'sound/stalker/weapons/unload/ak74_open.ogg'


	var/mag_type = /obj/item/ammo_box/magazine/m10mm //Removes the need for max_ammo and caliber info
	var/obj/item/ammo_box/magazine/magazine

/obj/item/weapon/gun/projectile/verb/deattach()
	set src in usr.contents
	set category = "Object"
	set name = "Deattach Addon"

	if(usr.stat || usr.restrained() || !Adjacent(usr) || usr.stunned || usr.weakened || usr.lying)
		return

	if(usr.get_active_hand() == null || usr.get_inactive_hand() == null) // Let me know if this has any problems -Yota
		switch(addons.len)
			if(2 to INFINITY)
				var/selection = input("Please, select addon to deattach!", "Gun", null, null) as null|anything in addons
				deattach_attachment(selection)

			if(1)
				//ƒќƒ≈Ћј“№
				for (var/obj/item/weapon/attachment/A in addons)
					deattach_attachment(A)
			if(0)
				//нужно что-то написать здесь
				usr << "<span class='notice'>There are no attachments.</span>"
				return
	else
		usr << "<span class='notice'>ќсвободите руку.</span>"
	update_icon()
	return

/obj/item/weapon/gun/projectile/proc/deattach_attachment(var/obj/item/weapon/attachment/A)
	if(istype(A, /obj/item/weapon/attachment/suppressor))
		var/obj/item/weapon/attachment/suppressor/S = A
		if(usr.l_hand != src && usr.r_hand != src)
			..()
			return
		usr << "<span class='notice'>You unscrew [A] from [src].</span>"
		playsound (src.loc, 'sound/stalker/weapons/detach_addon.ogg', 50, 1, 0)
		usr.put_in_hands(S)
		fire_sound = S.oldsound
		suppressed = 0
		addons.Remove(S)
		return

	if(istype(A, /obj/item/weapon/attachment/scope))
		var/obj/item/weapon/attachment/scope/S =A
		if(usr.l_hand != src && usr.r_hand != src)
			..()
			return
		usr << "<span class='notice'>You unscrew [A] from [src].</span>"
		playsound (src.loc, 'sound/stalker/weapons/detach_addon.ogg', 50, 1, 0)
		azoom.Remove(usr)
		usr.put_in_hands(S)
		zoomable = 0
		addons.Remove(S)
		rebuild_zooming()
		return

/obj/item/weapon/gun/projectile/New()
	..()
	if (!magazine)
		magazine = new mag_type(src)
	chamber_round()
	update_icon()

/obj/item/weapon/gun/projectile/update_icon()
	..()
	if(current_skin)
		icon_state = "[current_skin][sawn_state ? "-sawn" : ""]"
	else
		icon_state = "[initial(icon_state)][sawn_state ? "-sawn" : ""]"

var/global/list/obj/item/ammo_casing/ACs = list()

/obj/item/weapon/gun/projectile/process_chamber(eject_casing = 1, empty_chamber = 1)
//	if(in_chamber)
//		return 1
	var/obj/item/ammo_casing/AC = chambered //Find chambered round
	if(isnull(AC) || !istype(AC))
		chamber_round()
		return
	if(eject_casing)
		AC.loc = get_turf(src) //Eject casing onto ground.
		AC.SpinAnimation(10, 1) //next gen special effects
		addtimer(AC, "delete_projectile", rand(CLEANABLE_CLEAN_DELAY*0.75, CLEANABLE_CLEAN_DELAY*1.25))
		ACs += AC

	if(empty_chamber)
		chambered = null
	chamber_round()
	return

/obj/item/ammo_casing/proc/delete_projectile()
	qdel(src)

/obj/item/weapon/gun/projectile/proc/chamber_round()
	if (chambered || !magazine)
		return
	else if (magazine.ammo_count())
		chambered = magazine.get_round()
		chambered.loc = src
	return

/obj/item/weapon/gun/projectile/can_shoot()
	if(!magazine || !magazine.ammo_count(0))
		return 0
	return 1

/obj/item/weapon/gun/projectile/attackby(obj/item/A, mob/user, params)
	..()
	if (istype(A, /obj/item/ammo_box/magazine))
		var/obj/item/ammo_box/magazine/AM = A
		if (!magazine && istype(AM, mag_type))
			user.remove_from_mob(AM)
			magazine = AM
			magazine.loc = src
			user << "<span class='notice'>You load a new magazine into \the [src].</span>"
			playsound(user, loadsound, 50, 1)
			chamber_round()
			update_icon()
			user.update_inv_l_hand()
			user.update_inv_r_hand()
			AM.update_icon()
			return 1
		else if (magazine)
			user << "<span class='notice'>There's already a magazine in \the [src].</span>"

	if(istype(A, /obj/item/weapon/attachment/suppressor))
		var/obj/item/weapon/attachment/suppressor/S = A
		for(var/atype in S.types)
			if(ispath(type, atype))
				if(!suppressed)
					if(!user.unEquip(A))
						return
					user << "<span class='notice'>You screw [S] onto [src].</span>"
					playsound (src.loc, 'sound/stalker/weapons/attach_addon.ogg', 50, 1, 0)
					suppressed = A
					S.oldsound = fire_sound
					S.initial_w_class = w_class
					fire_sound = 'sound/stalker/weapons/silencer.ogg'
					//w_class = 3 //so pistols do not fit in pockets when suppressed
					A.loc = src
					update_icon()
					addons += S
					return
				else
					user << "<span class='warning'>[src] already has a suppressor!</span>"
					return

		user << "<span class='warning'>You can't seem to figure out how to fit [S] on [src]!</span>"
		return

	if(istype(A, /obj/item/weapon/attachment/scope))
		var/obj/item/weapon/attachment/scope/S = A
		if(type in S.types)
			if(!zoomable)
				if(!user.unEquip(A))
					return
				user << "<span class='notice'>You screw [S] onto [src].</span>"
				playsound (src.loc, 'sound/stalker/weapons/attach_addon.ogg', 50, 1, 0)
				zoomable = 1
				A.loc = src
				update_icon()
				addons += S
				rebuild_zooming()
				azoom = new()
				azoom.gun = src
				azoom.Grant(user)
				return
			else
				user << "<span class='warning'>[src] already has a scope!</span>"
				return
		else
			user << "<span class='warning'>You can't seem to figure out how to fit [S] on [src]!</span>"
			return
	return 0

/obj/item/weapon/gun/projectile/attack_hand(mob/user)
	/*
	if(loc == user)
		if(suppressed && can_unsuppress)
			var/obj/item/weapon/suppressor/S = suppressed
			if(user.l_hand != src && user.r_hand != src)
				..()
				return
			user << "<span class='notice'>You unscrew [suppressed] from [src].</span>"
			playsound (src.loc, 'sound/stalker/weapons/detach_addon.ogg', 50, 1, 0)
			user.put_in_hands(suppressed)
			fire_sound = S.oldsound
			w_class = S.initial_w_class
			suppressed = 0
			update_icon()
			return
	*/
	..()

/obj/item/weapon/gun/projectile/attack_self(mob/living/user)
	var/obj/item/ammo_casing/AC = chambered //Find chambered round
	if(magazine)
		magazine.loc = get_turf(src.loc)
		user.put_in_hands(magazine)
		magazine.update_icon()
		magazine = null
		playsound(user, opensound, 50, 1)
		user << "<span class='notice'>You pull the magazine out of \the [src].</span>"
	else if(chambered)
		AC.loc = get_turf(src)
		AC.SpinAnimation(10, 1)
		chambered = null
		user << "<span class='notice'>You unload the round from \the [src]'s chamber.</span>"
		if(jam)
			jam = 0
			user << "<span class='notice'>ќружие снова в норме.</span>"
	else
		user << "<span class='notice'>There's no magazine in \the [src].</span>"
	update_icon()
	return


/obj/item/weapon/gun/projectile/examine(mob/user)
	..()
	user << "Has [get_ammo()] round\s remaining."

/obj/item/weapon/gun/projectile/proc/get_ammo(countchambered = 1)
	var/boolets = 0 //mature var names for mature people
	if (chambered && countchambered)
		boolets++
	if (magazine)
		boolets += magazine.ammo_count()
	return boolets

/obj/item/weapon/gun/projectile/suicide_act(mob/user)
	if (src.chambered && src.chambered.BB && !src.chambered.BB.nodamage)
		user.visible_message("<span class='suicide'>[user] is putting the barrel of the [src.name] in \his mouth.  It looks like \he's trying to commit suicide.</span>")
		sleep(25)
		if(user.l_hand == src || user.r_hand == src)
			process_fire(user, user, 0, zone_override = "head")
			user.visible_message("<span class='suicide'>[user] blows \his brains out with the [src.name]!</span>")
			return(BRUTELOSS)
		else
			user.visible_message("<span class='suicide'>[user] panics and starts choking to death!</span>")
			return(OXYLOSS)
	else
		user.visible_message("<span class='suicide'>[user] is pretending to blow \his brains out with the [src.name]! It looks like \he's trying to commit suicide!</b></span>")
		playsound(loc, 'sound/stalker/weapons/pistol_empty.ogg', 50, 1, -1)
		return (OXYLOSS)


/obj/item/weapon/gun/projectile/proc/sawoff(mob/user)
	if(sawn_state == SAWN_OFF)
		user << "<span class='warning'>\The [src] is already shortened!</span>"
		return
	user.changeNext_move(CLICK_CD_MELEE)
	user.visible_message("[user] begins to shorten \the [src].", "<span class='notice'>You begin to shorten \the [src]...</span>")

	//if there's any live ammo inside the gun, makes it go off
	if(blow_up(user))
		user.visible_message("<span class='danger'>\The [src] goes off!</span>", "<span class='danger'>\The [src] goes off in your face!</span>")
		return

	if(do_after(user, 30, target = src))
		if(sawn_state == SAWN_OFF)
			return
		user.visible_message("[user] shortens \the [src]!", "<span class='notice'>You shorten \the [src].</span>")
		name = "sawn-off [src.name]"
		desc = sawn_desc
		w_class = 3
		item_state = "gun"//phil235 is it different with different skin?
		slot_flags &= ~SLOT_BACK	//you can't sling it on your back
		slot_flags |= SLOT_BELT		//but you can wear it on your belt (poorly concealed under a trenchcoat, ideally)
		sawn_state = SAWN_OFF
		update_icon()
		return 1

// Sawing guns related proc
/obj/item/weapon/gun/projectile/proc/blow_up(mob/user)
	. = 0
	for(var/obj/item/ammo_casing/AC in magazine.stored_ammo)
		if(AC.BB)
			process_fire(user, user,0)
			. = 1

/obj/item/weapon/attachment/suppressor/specialoffer
	name = "cheap suppressor"
	desc = "A foreign knock-off suppressor, it feels flimsy, cheap, and brittle. Still fits all weapons."
	icon = 'icons/obj/guns/projectile.dmi'
	icon_state = "suppressor"

