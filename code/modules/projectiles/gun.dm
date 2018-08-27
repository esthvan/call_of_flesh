/obj/item/weapon/gun
	name = "gun"
	desc = "It's a gun. It's pretty terrible, though."
	icon = 'icons/obj/guns/projectile.dmi'
	icon_state = "detective"
	item_state = "gun"
	flags =  CONDUCT
	slot_flags = SLOT_BELT
	materials = list(MAT_METAL=2000)
	w_class = 3
	throwforce = 5
	throw_speed = 3
	throw_range = 5
	force = 5
	origin_tech = "combat=1"
	needs_permit = 1
	attack_verb = list("struck", "hit", "bashed")

	var/fire_sound = "gunshot"
	var/suppressed = 0					//whether or not a message is displayed when fired
	var/can_suppress = 0
	var/can_unsuppress = 1
	var/recoil = 0						//boom boom shake the room
	var/clumsy_check = 1
	var/obj/item/ammo_casing/chambered = null
	var/trigger_guard = 1				//trigger guard on the weapon, hulks can't fire them with their big meaty fingers
	var/sawn_desc = null				//description change if weapon is sawn-off
	var/sawn_state = SAWN_INTACT
	var/burst_size = 1					//how large a burst is
	var/fire_delay = 0					//rate of fire for burst firing and semi auto
	var/firing_burst = 0				//Prevent the weapon from firing again while already firing
	var/semicd = 0						//cooldown handler
	var/weapon_weight = WEAPON_LIGHT

	var/spread = 0						//Spread induced by the gun itself.
	var/randomspread = 0				//Set to 0 for shotguns. This is used for weapons that don't fire all their bullets at once.

	var/unique_rename = 0 //allows renaming with a pen
	var/unique_reskin = 0 //allows one-time reskinning
	var/current_skin = null //the skin choice if we had a reskin
	var/list/options = list()

	lefthand_file = 'icons/mob/inhands/guns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/guns_righthand.dmi'

	var/obj/item/device/firing_pin/pin = /obj/item/device/firing_pin //standard firing pin for most guns

	var/obj/item/device/flashlight/F = null
	var/can_flashlight = 0

	var/list/upgrades = list()

	var/ammo_x_offset = 0 //used for positioning ammo count overlay on sprite
	var/ammo_y_offset = 0
	var/flight_x_offset = 0
	var/flight_y_offset = 0

	//Zooming
	var/zoomable = FALSE //whether the gun generates a Zoom action on creation
	var/zoomed = FALSE //Zoom toggle
	var/zoom_amt = 3 //Distance in TURFs to move the user's screen forward (the "zoom" effect)
	var/datum/action/toggle_scope_zoom/azoom
	var/can_scope = 0

	///////////////////////STALKER////////////////////////////////

	var/drawsound = 'sound/stalker/weapons/draw/ak74_draw.ogg'
	var/damagelose = 0		 //1 урона за 1 тайл = 0.33 ед
	var/distro = 0			 //Зазор между дробью для дробовиков
	var/durability = 100     //durability of a gun
	var/jam = 0              //is weapon jammed or not
	var/list/obj/item/weapon/attachment/addons = list()
	var/obj/item/weapon/attachment/gl = null

	var/list/l_sounds_shots = list('sound/stalker/weapons/fading/rnd_shooting_1.ogg','sound/stalker/weapons/fading/rnd_shooting_2.ogg',
								'sound/stalker/weapons/fading/rnd_shooting_4.ogg','sound/stalker/weapons/fading/rnd_shooting_5.ogg',
								'sound/stalker/weapons/fading/rnd_shooting_6.ogg','sound/stalker/weapons/fading/rnd_shooting_7.ogg',
								'sound/stalker/weapons/fading/rnd_shooting_9.ogg','sound/stalker/weapons/fading/rnd_shooting_10.ogg',
								'sound/stalker/weapons/fading/rnd_shooting_11.ogg')

/obj/item/weapon/gun/New()
	..()
	if(pin)
		pin = new pin(src)

	rebuild_zooming()


/obj/item/weapon/gun/CheckParts(list/parts_list)
	..()
	var/obj/item/weapon/gun/G = locate(/obj/item/weapon/gun) in contents
	if(G)
		G.loc = loc
		qdel(G.pin)
		G.pin = null
		visible_message("[G] can now fit a new pin, but old one was destroyed in the process.")
		qdel(src)

/obj/item/weapon/gun/examine(mob/user)
	..()
	var/percentage = null
	if(durability)
		percentage = (durability / (initial(durability)))*100
		if(percentage >= 50)
			user << "<span class='notice'>Durability - [percentage]%</span>"
		else
			user << "<span class='warning'>Durability - [percentage]%</span>"
	if(unique_reskin && !current_skin)
		user << "<span class='notice'>Alt-click it to reskin it.</span>"
	if(unique_rename)
		user << "<span class='notice'>Use a pen on it to rename it.</span>"
//	if(pin)
//		user << "It has [pin] installed."
//	else
//		user << "It doesn't have a firing pin installed, and won't fire."


/obj/item/weapon/gun/proc/process_chamber()
	return 0


//check if there's enough ammo/energy/whatever to shoot one time
//i.e if clicking would make it shoot
/obj/item/weapon/gun/proc/can_shoot()
	return 1


/obj/item/weapon/gun/proc/shoot_with_empty_chamber(mob/living/user as mob|obj)
	user << "<span class='danger'>*click*</span>"
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	return


/obj/item/weapon/gun/proc/shoot_live_shot(mob/living/user as mob|obj, pointblank = 0, mob/pbtarget = null, message = 1)

	var/shot_sound = pick(l_sounds_shots)
	var/delay_sound = 0
	var/turf/epicenter = get_turf(user)

	if(user.light_range < 2)
		var/light_range_old = user.light_range
		user.add_light_range(2 - user.light_range)
		spawn(5)
			user.add_light_range(-2 + light_range_old)

	if(recoil)
		shake_camera(user, 2 + recoil * 8, recoil)

	if(suppressed)
		playsound(user, fire_sound, 10, 1)
	else
		playsound(user, fire_sound, 50, 1)
		if(!message)
			return
		if(pointblank)
			user.visible_message("<span class='danger'>[user] fires [src] point blank at [pbtarget]!</span>", "<span class='danger'>You fire [src] point blank at [pbtarget]!</span>", "<span class='italics'>You hear a [istype(src, /obj/item/weapon/gun/energy) ? "laser blast" : "gunshot"]!</span>")
		else
			user.visible_message("<span class='danger'>[user] fires [src]!</span>", "<span class='danger'>You fire [src]!</span>", "You hear a [istype(src, /obj/item/weapon/gun/energy) ? "laser blast" : "gunshot"]!")
			var/frequency = get_rand_frequency()
			for(var/mob/M in range(20))
				// Double check for client
				if(M && M.client)
					var/turf/M_turf = get_turf(M)
					if(M_turf && M_turf.z == epicenter.z)
						var/dist = get_dist(M_turf, epicenter)
						if(dist <= 40 && dist >= 8 && delay_sound == 0)
							var/far_volume = Clamp(40, 30, 50) // Volume is based on explosion size and dist
							far_volume += (dist <= 40 * 0.5 ? 50 : 0) // add 50 volume if the mob is pretty close to the explosion
							M.playsound_local(epicenter, shot_sound, far_volume, 1, frequency, falloff = 5)
							delay_sound = 1
							spawn(100)
								delay_sound = 0

	if(weapon_weight >= WEAPON_MEDIUM)
		if(user.get_inactive_hand())
			if(prob(15))
				if(user.drop_item())
					user.visible_message("<span class='danger'>[src] flies out of [user]'s hands!</span>", "<span class='userdanger'>[src] kicks out of your grip!</span>")

/obj/item/weapon/gun/emp_act(severity)
	for(var/obj/O in contents)
		O.emp_act(severity)


/obj/item/weapon/gun/afterattack(atom/target, mob/living/user, flag, params)

	if(firing_burst)
		return

	if(flag) //It's adjacent, is the user, or is on the user's person
		if(target in user.contents) //can't shoot stuff inside us.
			return
		if(!ismob(target) || user.a_intent == "harm") //melee attack
			return
		if(target == user && user.zone_sel.selecting != "mouth") //so we can't shoot ourselves (unless mouth selected)
			return

	if(istype(user))//Check if the user can use the gun, if the user isn't alive(turrets) assume it can.
		var/mob/living/L = user
		if(!can_trigger_gun(L))
			return

	if(!can_shoot()) //Just because you can pull the trigger doesn't mean it can't shoot.
		shoot_with_empty_chamber(user)
		return

	if(flag)
		if(user.zone_sel.selecting == "mouth")
			handle_suicide(user, target, params)
			return


	//Exclude lasertag guns from the CLUMSY check.
	if(clumsy_check)
		if(istype(user))
			if (user.disabilities & CLUMSY && prob(40))
				user << "<span class='userdanger'>You shoot yourself in the foot with \the [src]!</span>"
				var/shot_leg = pick("l_leg", "r_leg")
				process_fire(user,user,0,params, zone_override = shot_leg, damagelose)
				user.drop_item()
				return

	if(weapon_weight == WEAPON_HEAVY && user.get_inactive_hand())
		user << "<span class='userdanger'>You need both hands free to fire \the [src]!</span>"
		return

	process_fire(target, user, 1, params, , damagelose)


/obj/item/weapon/gun/proc/can_trigger_gun(mob/living/carbon/user)
	var/area/B = get_area(user.loc)
	if(B.safezone)
		if(user.client && (user.client.prefs.chat_toggles & CHAT_LANGUAGE))
			user << "<span class='warning'>You can't shoot in the safezone!</span>"
		else
			user << "<span class='warning'>Вы не можете стрел&#255;ть в этой зоне!</span>"
		return 0
	if(!handle_pins(user))
		return 0

	if(trigger_guard)
		if(user.has_dna())
			if(user.dna.check_mutation(HULK))
				user << "<span class='warning'>Your meaty finger is much too large for the trigger guard!</span>"
				return 0
			if(NOGUNS in user.dna.species.specflags)
				user << "<span class='warning'>Your fingers don't fit in the trigger guard!</span>"
				return 0
	/*
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.martial_art && H.martial_art.name == "The Sleeping Carp") //great dishonor to famiry
			user << "<span class='warning'>Use of ranged weaponry would bring dishonor to the clan.</span>"
			return 0*/
	return 1


/obj/item/weapon/gun/proc/handle_pins(mob/living/user)
	if(pin)
		if(pin.pin_auth(user) || pin.emagged)
			return 1
		else
			pin.auth_fail(user)
			return 0
	else
		user << "<span class='warning'>\The [src]'s trigger is locked. This weapon doesn't have a firing pin installed!</span>"
	return 0

obj/item/weapon/gun/proc/newshot()
	return

/obj/item/weapon/gun/proc/process_fire(atom/target as mob|obj|turf, mob/living/user as mob|obj, message = 1, params, zone_override, damagelose)

	add_fingerprint(user)

	if(semicd)
		return

	if(weapon_weight)
		if(user.get_inactive_hand())
			recoil = 4 //one-handed kick
		else
			recoil = initial(recoil)

	if(burst_size > 1)
		firing_burst = 1
		for(var/i = 1 to burst_size)
			if(!user)
				break
			if(!issilicon(user))
				if( i>1 && !(src in get_both_hands(user))) //for burst firing
					break
			if(chambered)
				var/sprd = 0
				if(randomspread)
					sprd = round((rand() - 0.5) * spread)
				else //Smart spread
					sprd = round((i / burst_size - rand(-1, 1)) * spread)
				durability_check(user)
				if(!chambered.fire(target, user, params, distro, suppressed, zone_override, sprd, damagelose))
					shoot_with_empty_chamber(user)
					break
				else
					if(!jam)
						if(get_dist(user, target) <= 1) //Making sure whether the target is in vicinity for the pointblank shot
							shoot_live_shot(user, 1, target, message)
						else
							shoot_live_shot(user, 0, target, message)
					else
						if(!chambered.fire(target, user, params, distro, suppressed, zone_override, sprd, damagelose))
							shoot_with_empty_chamber(user)
							playsound(user, fire_sound, 50, 1)
							user << "<span class='warning'>Оружие заклинило. Его необходимо перезар&#255;дить.</span>"
							firing_burst = 0
							return
						else
							user << "<span class='warning'>Оружие заклинило. Его необходимо перезар&#255;дить.</span>"
			else
				shoot_with_empty_chamber(user)
				break
			process_chamber()
			update_icon()
			sleep(fire_delay)
		firing_burst = 0
	else
		if(chambered)
			durability_check(user)
			var/sprd = round(rand(-1, 1) * spread)
			if(!chambered.fire(target, user, params, distro, suppressed, zone_override, sprd, damagelose))
				shoot_with_empty_chamber(user)
				return
			else
				if(!jam)
					if(get_dist(user, target) <= 1) //Making sure whether the target is in vicinity for the pointblank shot
						shoot_live_shot(user, 1, target, message)
					else
						shoot_live_shot(user, 0, target, message)
				else
					if(!chambered.fire(target, user, params, distro, suppressed, zone_override, sprd, damagelose))
						shoot_with_empty_chamber(user)
						playsound(user, fire_sound, 50, 1)
						user << "<span class='warning'>Оружие заклинило. Его необходимо перезар&#255;дить.</span>"
						return
					else
						user << "<span class='warning'>Оружие заклинило. Его необходимо перезар&#255;дить.</span>"
		else
			shoot_with_empty_chamber(user)
			return
		process_chamber()
		update_icon()
		semicd = 1
		spawn(fire_delay)
			semicd = 0

	if(user)
		if(user.hand)
			user.update_inv_l_hand()
		else
			user.update_inv_r_hand()
	feedback_add_details("gun_fired","[src.type]")

/obj/item/weapon/gun/proc/durability_check(mob/user)   //Gun durability
/*
	if(durability < 1)
		shake_camera(user, 4, 2)
		explosion(src.loc,-2,-2,2,flame_range = 0)
		qdel(src)
		src = null
		user << "<span class='userdanger'>Оружие разорвалось пр&#255;мо у вас в руках!</span>"
	else
*/
	if(durability && !jam)
		var/percentage = (durability/(initial(durability)))*100
		switch(percentage)
			if(0 to 20)
				if(prob(60))
					shake_camera(user, 4, 2)
					explosion(src.loc,-2,-2,2,flame_range = 0)
					qdel(src)
					src = null
					user << "<span class='userdanger'>Оружие разорвалось пр&#255;мо у вас в руках!</span>"
					return
				else
					if(prob(40))
						jam = 1

			if(20 to 45)
				if(prob(10))
					user.drop_item()
					shake_camera(user, 4, 2)
					user << "<span class='userdanger'>Кажетс&#255; самое врем&#255; починить этот хлам или выбросить, пока он не выстрелил тебе в лицо.</span>"
					jam = 1
				else
					if(prob(20))
						jam = 1

			if(45 to 60)
				if(prob(5))
					jam = 1

			if(60 to 75)
				if(prob(2.5))
					jam = 1

		durability -= 0.075
	else
		if(jam)
			return
		else
			durability -= 0.05

/obj/item/weapon/gun/attack(mob/M as mob, mob/user)
	if(user.a_intent == "harm") //Flogging
		..()
	else
		return

/obj/item/weapon/gun/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/device/flashlight/seclite))
		var/obj/item/device/flashlight/seclite/S = A
		if(can_flashlight)
			if(!F)
				if(!user.unEquip(A))
					return
				user << "<span class='notice'>You click [S] into place on [src].</span>"
				if(S.on)
					set_light(0)
				F = S
				A.loc = src
				update_icon()
				update_gunlight(user)
				verbs += /obj/item/weapon/gun/proc/toggle_gunlight

	if(istype(A, /obj/item/weapon/screwdriver))
		if(F && can_flashlight)
			for(var/obj/item/device/flashlight/seclite/S in src)
				user << "<span class='notice'>You unscrew the seclite from [src].</span>"
				F = null
				S.loc = get_turf(user)
				update_gunlight(user)
				S.update_brightness(user)
				update_icon()
				verbs -= /obj/item/weapon/gun/proc/toggle_gunlight

	if(unique_rename)
		if(istype(A, /obj/item/weapon/pen))
			rename_gun(user)
	..()

/obj/item/weapon/gun/proc/toggle_gunlight()
	set name = "Toggle Gunlight"
	set category = "Object"
	set desc = "Click to toggle your weapon's attached flashlight."

	if(!F)
		return

	var/mob/living/carbon/human/user = usr
	if(!isturf(user.loc))
		user << "<span class='warning'>You cannot turn the light on while in this [user.loc]!</span>"
	F.on = !F.on
	user << "<span class='notice'>You toggle the gunlight [F.on ? "on":"off"].</span>"

	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_gunlight(user)
	return

/obj/item/weapon/gun/proc/update_gunlight(mob/user = null)
	if(F)
		action_button_name = "Toggle Gunlight"
		if(F.on)
			if(loc == user)
				user.add_light_range(F.brightness_on)
			else if(isturf(loc))
				set_light(F.brightness_on)
		else
			if(loc == user)
				user.add_light_range(-F.brightness_on)
			else if(isturf(loc))
				set_light(0)
		update_icon()
	else
		action_button_name = null
		if(loc == user)
			user.add_light_range(-5)
		else if(isturf(loc))
			set_light(0)
		return

/obj/item/weapon/gun/pickup(mob/user)
	if(F)
		if(F.on)
			user.add_light_range(F.brightness_on)
			set_light(0)
	if(azoom)
		azoom.Grant(user)

/obj/item/weapon/gun/dropped(mob/user)
	. = ..()
	if(F)
		if(F.on)
			user.add_light_range(-F.brightness_on)
			set_light(F.brightness_on)
	zoom(user,FALSE)
	if(azoom)
		azoom.Remove(user)


/obj/item/weapon/gun/AltClick(mob/user)
	..()
	if(user.incapacitated())
		user << "<span class='warning'>You can't do that right now!</span>"
		return
	if(unique_reskin && !current_skin && loc == user)
		reskin_gun(user)


/obj/item/weapon/gun/proc/reskin_gun(mob/M)
	var/choice = input(M,"Warning, you can only reskin your weapon once!","Reskin Gun") in options

	if(src && choice && !M.stat && in_range(M,src) && !M.restrained() && M.canmove)
		if(options[choice] == null)
			return
		if(sawn_state == SAWN_OFF)
			icon_state = options[choice] + "-sawn"
		else
			icon_state = options[choice]
		M << "Your gun is now skinned as [choice]. Say hello to your new friend."
		current_skin = 1
		return

/obj/item/weapon/gun/proc/rename_gun(mob/M)
	var/input = sanitize_russian(stripped_input(M,"What do you want to name the gun?", ,"", MAX_NAME_LEN))

	if(src && input && !M.stat && in_range(M,src) && !M.restrained() && M.canmove)
		name = input
		M << "You name the gun [input]. Say hello to your new friend."
		return


/obj/item/weapon/gun/proc/handle_suicide(mob/living/carbon/human/user, mob/living/carbon/human/target, params)
	if(!ishuman(user) || !ishuman(target))
		return

	if(semicd)
		return

	if(user == target)
		target.visible_message("<span class='warning'>[user] sticks [src] in their mouth, ready to pull the trigger...</span>", \
			"<span class='userdanger'>You stick [src] in your mouth, ready to pull the trigger...</span>")
	else
		target.visible_message("<span class='warning'>[user] points [src] at [target]'s head, ready to pull the trigger...</span>", \
			"<span class='userdanger'>[user] points [src] at your head, ready to pull the trigger...</span>")

	semicd = 1

	if(!do_mob(user, target, 120) || user.zone_sel.selecting != "mouth")
		if(user)
			if(user == target)
				user.visible_message("<span class='notice'>[user] decided life was worth living.</span>")
			else if(target && target.Adjacent(user))
				target.visible_message("<span class='notice'>[user] has decided to spare [target]'s life.</span>", "<span class='notice'>[user] has decided to spare your life!</span>")
		semicd = 0
		return

	semicd = 0

	if(!can_trigger_gun(user))
		return

	target.visible_message("<span class='warning'>[user] pulls the trigger!</span>", "<span class='userdanger'>[user] pulls the trigger!</span>")

	if(chambered && chambered.BB)
		chambered.BB.damage *= 20

	process_fire(target, user, 1, params)

/obj/item/weapon/gun/proc/unlock() //used in summon guns and as a convience for admins
	if(pin)
		qdel(pin)
	pin = new /obj/item/device/firing_pin

/////////////
// ZOOMING //
/////////////

/datum/action/toggle_scope_zoom
	name = "Toggle Scope"
	check_flags = AB_CHECK_RESTRAINED|AB_CHECK_STUNNED|AB_CHECK_LYING
	button_icon_state = "sniper_zoom"
	var/obj/item/weapon/gun/gun = null

/datum/action/toggle_scope_zoom/Trigger()
	gun.zoom(owner)

/datum/action/toggle_scope_zoom/IsAvailable()
	. = ..()
	if(!. && gun)
		gun.zoom(owner, FALSE)

/datum/action/toggle_scope_zoom/Remove(mob/living/L)
	gun.zoom(L, FALSE)
	..()

/datum/action/toggle_scope_zoom/Checks()
	. = ..()

	if(owner.get_active_hand() != gun)
		return 0

	return .

/obj/item/weapon/gun/proc/zoom(mob/living/user, forced_zoom)
	if(!user || !user.client)
		return

	switch(forced_zoom)
		if(FALSE)
			zoomed = FALSE
		if(TRUE)
			zoomed = TRUE
		else
			zoomed = !zoomed

	if(zoomed)
		var/_x = 0
		var/_y = 0
		switch(user.dir)
			if(NORTH)
				_y = zoom_amt
			if(EAST)
				_x = zoom_amt
			if(SOUTH)
				_y = -zoom_amt
			if(WEST)
				_x = -zoom_amt

		user.client.pixel_x = world.icon_size*_x
		user.client.pixel_y = world.icon_size*_y
	else
		user.client.pixel_x = 0
		user.client.pixel_y = 0


//Proc, so that gun accessories/scopes/etc. can easily add zooming.
/obj/item/weapon/gun/proc/rebuild_zooming()
	if(azoom)
		if(!zoomable)
			zoom_amt = initial(zoom_amt)
			zoom(usr, FALSE)
			azoom = null
		return

	if(zoomable)
		for(var/obj/item/weapon/attachment/scope/S in addons)
			zoom_amt += S.zoom_add
		azoom = new()
		azoom.gun = src
