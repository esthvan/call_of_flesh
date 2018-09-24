/obj/machinery/campfire
	name = "Campfire"
	desc = "Бочка с парой сухих дровишек внутри. Можно зажечь спичками или зажигалкой."
	eng_desc = "Barrel with a couple of logs inside it. If you light it you can heal by sitting near it."
	icon = 'icons/stalker/stalker.dmi'
	icon_state = "campfire0"
	anchored = 1
	var/firecolor = "#FFAA33"
	var/sound_playing = 0
	var/cooldown = 5 					//Кулдаун в секундах
	var/incooldown = 0
	var/on = 0
	var/list/mob/living/carbon/campers = list()
	var/do_after_check = 0
	var/last_campfire_played = 0

/obj/machinery/campfire/New()
	..()
	//set_light(4, 1, firecolor)
	//spawn(10)
	//	set_light(0, 1, firecolor)
	spawn(10)
		SSmachine.processing.Remove(src)

/obj/machinery/campfire/Destroy()
	for (var/client/C in campers)
		C << sound(null, channel = AMBIENT_CAMPFIRE_CHANNEL)
		C.mob.ambient_campfire = null
		campers -= C

	SSmachine.processing.Remove(src)
	..()

obj/machinery/campfire/barrel
	name = "barrel"
	icon = 'icons/stalker/bochka.dmi'
	icon_state = "barrel0"
	density = 1

/obj/machinery/campfire/attack_hand(mob/user)
	..()
	if(!on || do_after_check)
		return

	user.visible_message("<span class='notice'>[user] started extinguishing a fire...</span>", "<span class='notice'>You started extinguishing a fire...</span>")
	do_after_check = 1

	if(!do_after(user, 10, 1, src))
		do_after_check = 0
		return

	do_after_check = 0

	user.visible_message("<span class='green'>[user] extinguished a fire.</span>", "<span class='green'>You extinguished a fire.</span>")
	desc = initial(desc)
	eng_desc = initial(eng_desc)

	on = !on
	update_icon()
	set_light(0)

	for (var/client/C in campers)
		C << sound(null, channel = AMBIENT_CAMPFIRE_CHANNEL)
		C.mob.ambient_campfire = null
		campers -= C
	campers = list()

	SSmachine.processing.Remove(src)

/obj/machinery/campfire/update_icon()
	icon_state = "campfire[on]"
	update_state()
	return

/obj/machinery/campfire/barrel/update_icon()
	icon_state = "barrel[on]"
	update_state()
	return

/obj/machinery/campfire/proc/update_state()
	if(on)
		if(!sound_playing)
			sound_playing = 1

	else if(!on)
		sound_playing = 0

/obj/machinery/campfire/proc/RefreshSound()
	if(last_campfire_played + 2360 < world.timeofday)
		last_campfire_played = world.timeofday
		for (var/client/C in campers)
			C.mob.ambient_campfire = null

	for(var/mob/M in view(5, src))
		if(!M || !M.client)
			continue

		if(!(M.client in campers))
			campers += M.client

	for (var/client/C in campers)
		if(!C)
			campers -= C
			continue

		if(!on || !(C.mob in view(5, src)))
			C << sound(null, channel = AMBIENT_CAMPFIRE_CHANNEL)
			C.mob.ambient_campfire = null
			campers -= C
			continue

		if(istype(C.mob, /mob/living/carbon/human) && C.mob.buckled)
			var/mob/living/carbon/human/H = C.mob
			H.adjustStaminaLoss(-10)
			H.adjustCloneLoss(-0.5)
			H.adjustBruteLoss(-0.5)
			H.adjustFireLoss(-0.5)
			H.adjustToxLoss(-0.5)
			H.adjustPsyLoss(-2)

		if(!C.mob.ambient_campfire)
			C.mob.ambient_campfire = sound(file = 'sound/stalker/objects/campfire.ogg')
			C.mob.ambient_campfire.Set_Sound(AMBIENT_CAMPFIRE_CHANNEL, 50, 0, get_area(src).environment)
			C.mob << C.mob.ambient_campfire

obj/machinery/campfire/process()
	if(!on)
		SSmachine.processing.Remove(src)
		return
	src.RefreshSound()

/obj/machinery/campfire/attackby(obj/item/I, mob/user, params)
	if(I)
		if(istype(I, /obj/item/weapon/match))
			var/obj/item/weapon/match/M = I
			if(M.lit == 1 && !on)
				on = !on
				usr.visible_message("[usr] lit a fire.", "<span class='notice'>You lit a fire.</span>")
				update_icon()
				desc = "От костра исходит тёпло и м&#255;гкий свет."
				eng_desc = "Campfire emites warm and calmness. You can heal by sitting in it's range."
				set_light(4, 1, firecolor)
				spawn(10)
					set_light(0, 1, firecolor)
					set_light(4, 1, firecolor)
				SSmachine.processing |= src
			else
				if(M.lit == 0 && on)
					M.fire_act()
			return

		if(istype(I, /obj/item/weapon/lighter))
			var/obj/item/weapon/lighter/L = I
			if(L.lit == 1 && !on)
				on = !on
				usr.visible_message("[usr] lit a fire.", "<span class='notice'>You lit a fire.</span>")
				update_icon()
				desc = "От костра исходит тёпло и м&#255;гкий свет."
				eng_desc = "Campfire emites warm and calmness. You can heal by sitting in it's range."
				set_light(4, 1, firecolor)
				spawn(10)
					set_light(0, 1, firecolor)
					set_light(4, 1, firecolor)
				SSmachine.processing |= src
			return

		if(on)
			I.fire_act()
			return