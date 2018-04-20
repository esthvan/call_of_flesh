#define DMG_TYPE_GIB 1
#define DMG_TYPE_ENERGY 2
#define DMG_TYPE_BURN 4
#define DMG_TYPE_BRAIN 8
#define DMG_TYPE_RADIATION 16
#define DMG_TYPE_IGNITION 32
#define DMG_TYPE_BIO 64
/var/list/obj/anomaly/anomalies = list()
/var/list/obj/item/weapon/spawned_artifacts = list()

/obj/anomaly
	name = "Anomaly"
	var/damage_amount = 0 				//Сколько дамажит
	var/damage_type = DMG_TYPE_ENERGY	//Тип дамага
	var/activated_icon_state = null 	//Спрайт при активации
	var/cooldown = 5
	var/lasttime = 0
	var/list/mob/living/trapped = new/list()
	var/idle_luminosity = 0
	var/activated_luminosity = 0
	var/sound = null
	var/delay = 0
	//var/attachedSpawner = null
	var/active_icon_state = null
	var/inactive_icon_state = null;
	var/active_invisibility = 0
	var/inactive_invisibility = 0
	var/list/loot
	var/anomaly_color = null
	icon = 'icons/stalker/anomalies.dmi'
	unacidable = 1
	anchored = 1
	pass_flags = PASSTABLE | PASSGRILLE
	//invisibility = 101

/obj/anomaly/New()
	..()
	//SSobj.processing.Remove(src)
	anomalies += src
	//if(prob(30))
	//	if(attachedSpawner)
	//		new attachedSpawner(src)
	icon_state = inactive_icon_state
	invisibility = inactive_invisibility
	set_light(idle_luminosity, l_color = anomaly_color)
	SpawnArtifact()

/obj/anomaly/proc/SpawnArtifact()
	if(loot)
		var/lootspawn = pickweight(loot)
		if(lootspawn)
			var/turf/T = get_turf(src)
			var/obj/item/weapon/artifact/O = new lootspawn(T)
			O.invisibility = 100
			RandomMove(O)
			if(!istype(O, /obj/nothing) && O.z < O.level_s)
				qdel(O)
				SpawnArtifact()
				return
			spawned_artifacts += O

/obj/anomaly/proc/RandomMove(spawned)
	if(spawned)
		var/turf/T = get_turf(src)
		if(T && istype(spawned, /obj))
			var/obj/O = spawned
			var/new_x = T.x + rand(-1, 1)
			var/new_y = T.y + rand(-1, 1)
			O.Move(locate(new_x, new_y, T.z))
	return spawned

/obj/anomaly/Crossed(atom/A)
	..()
	if(lasttime + cooldown > world.time)
		return

	if(istype(A,/obj/item/projectile) || istype(A,/obj/item/weapon/artifact))
		return

	if(istype(A,/obj/item))
		invisibility = active_invisibility
		icon_state = active_icon_state
		set_light(activated_luminosity, l_color = anomaly_color)


		spawn(10)
			invisibility = inactive_invisibility
			icon_state = inactive_icon_state
			set_light(idle_luminosity, l_color = anomaly_color)

		src.lasttime = world.time

		playsound(src.loc, src.sound, 50, 1, channel = 0)
		var/obj/item/Q = A

		if(Q.unacidable == 0)
			Q.throw_impact(get_turf(A))
			Q.throwing = 0
			spawn(5)
				var/turf/T = get_turf(Q)
				var/obj/effect/decal/cleanable/molten_item/I = new (T)
				I.pixel_x = rand(-16,16)
				I.pixel_y = rand(-16,16)
				I.desc = "Looks like this was \an [Q] some time ago."
				if(istype(A,/obj/item/weapon/storage))
					var/obj/item/weapon/storage/S = Q
					S.do_quick_empty()
				qdel(Q)
				spawn(src.cooldown * 10 - 5)
					qdel(I)
		return

	if(istype(A,/mob/living))
		var/mob/living/L = A
		src.trapped.Add(L)
		if(src.trapped.len >= 1)
			Think()
		else
			src.trapped.Remove(L)
	return

/obj/anomaly/Uncrossed(atom/A)
	..()
	if(istype(A, /mob/living))
		var/mob/living/L = A
		src.trapped.Remove(L)
	return

/obj/anomaly/proc/Think()

	if(src.trapped.len < 1)
		return

	if(lasttime + (cooldown * 10) > world.time)

		//////////////////////////////////////////////
		sleep(lasttime + (cooldown * 10) - world.time)
		//////////////////////////////////////////////

		Think()
		return

	invisibility = active_invisibility
	icon_state = active_icon_state
	update_icon()
	set_light(activated_luminosity, l_color = anomaly_color)

	spawn(10)
		invisibility = inactive_invisibility
		icon_state = inactive_icon_state
		update_icon()
		set_light(idle_luminosity, l_color = anomaly_color)

	playsound(src.loc, src.sound, 50, 1, channel = 0)

	lasttime = world.time

	////////////////////
	sleep(src.delay * 10)
	////////////////////

	for(var/atom/A in src.trapped)

		if(!istype(A, /mob/living))
			continue

		var/mob/living/L = A

		if(L.stat == 2)
			src.trapped.Remove(L)
			continue

		switch(src.damage_type)
			if(DMG_TYPE_ENERGY)
				L.apply_damage(src.damage_amount, BURN, null, L.getarmor(null, "electro"))
			if(DMG_TYPE_BIO)
				L.apply_damage(src.damage_amount, BURN, null, L.getarmor(null, "bio"))
			if(DMG_TYPE_RADIATION)
				L.rad_act(src.damage_amount)
			if(DMG_TYPE_GIB)
				L.gib()
				trapped.Remove(L)
			if(DMG_TYPE_IGNITION)
				if(istype(L, /mob/living/simple_animal/hostile))
					L.apply_damage(40, BURN, null, 0)
				else
					L.fire_act()
		///////////////////////
		sleep(src.cooldown * 10)
		///////////////////////

	if(src.trapped.len < 1)
		return

	Think()
	return

/obj/anomaly/tramplin/Think()

	if(src.trapped.len < 1)
		return

	if(lasttime + (cooldown * 10) > world.time)

		//////////////////////////////////////////////
		sleep(lasttime + (cooldown * 10) - world.time)
		//////////////////////////////////////////////

		Think()
		return

	invisibility = active_invisibility
	icon_state = active_icon_state
	update_icon()
	set_light(activated_luminosity, l_color = anomaly_color)


	spawn(10)
		invisibility = inactive_invisibility
		icon_state = inactive_icon_state
		set_light(idle_luminosity, l_color = anomaly_color)

	playsound(src.loc, src.sound, 50, 1, channel = 0)

	lasttime = world.time

	sleep(src.delay * 10)

	for(var/atom/A in src.trapped)

		if(!(A in src.trapped))
			continue

		if(!istype(A, /mob/living))
			continue

		var/mob/living/L = A
		if(L.stat == 2)
			src.trapped.Remove(L)
			continue

		L.apply_damage(src.damage_amount, BRUTE, null, 0)

		var/new_dir = NORTH
		var/target = get_turf(src)

		for(var/o=0, o<8, o++)
			new_dir = pick(EAST, NORTH, WEST, SOUTH)
			target = get_turf(get_step(target, new_dir))

		L.throw_at(target, 6, 1, spin=1, diagonals_first = 1)
		L.Weaken(2)

		///////////////////////
		sleep(src.cooldown * 10)
		///////////////////////

	if(src.trapped.len < 1)
		return

	Think()
	return

/obj/anomaly/electro
	name = "anomaly"
	damage_amount = 40
	cooldown = 2
	sound = 'sound/stalker/anomalies/electra_blast1.ogg'
	idle_luminosity = 1
	activated_luminosity = 2
	anomaly_color = "#7ac8e2"
	damage_type = DMG_TYPE_ENERGY
	inactive_icon_state = "electra0"
	active_icon_state = "electra1"
	active_invisibility = 0
	inactive_invisibility = 0
	loot = list(/obj/item/weapon/artifact/flash = 6,
				/obj/item/weapon/artifact/moonlight = 3.5,
				/obj/item/weapon/artifact/battery = 0.25,
				/obj/item/weapon/artifact/pustishka = 0.25,
				/obj/nothing = 90)

/obj/anomaly/electro/New()
	..()
	src.set_light(luminosity)

/obj/anomaly/karusel
	name = "anomaly"
	damage_amount = 40
	cooldown = 2
	delay = 1
	sound = 'sound/stalker/anomalies/gravi_blowout1.ogg'
	idle_luminosity = 0
	activated_luminosity = 0
	inactive_icon_state = "tramplin0"
	active_icon_state = "tramplin1"
	damage_type = DMG_TYPE_GIB
	active_invisibility = 0
	inactive_invisibility = 101
	loot = list(/obj/item/weapon/artifact/meduza = 5,
				/obj/item/weapon/artifact/stoneflower = 3,
				/obj/item/weapon/artifact/nightstar = 1.5,
				/obj/item/weapon/artifact/maminibusi = 0.5,
				/obj/nothing = 90)

/obj/anomaly/tramplin
	name = "anomaly"
	damage_amount = 20
	cooldown = 2
	delay = 0.3
	sound = 'sound/stalker/anomalies/gravi_blowout1.ogg'
	idle_luminosity = 0
	activated_luminosity = 0
	inactive_icon_state = "tramplin0"
	active_icon_state = "tramplin1"
	damage_type = DMG_TYPE_GIB
	active_invisibility = 0
	inactive_invisibility = 101
	loot = list(/obj/item/weapon/artifact/meduza = 5,
				/obj/item/weapon/artifact/stoneflower = 3,
				/obj/item/weapon/artifact/nightstar = 1.5,
				/obj/item/weapon/artifact/maminibusi = 0.5,
				/obj/nothing = 90)

/obj/anomaly/jarka
	name = "anomaly"
	cooldown = 0.75
	sound = 'sound/stalker/anomalies/zharka1.ogg'
	luminosity = 2
	idle_luminosity = 3
	activated_luminosity = 5
	anomaly_color = "#FFAA33"
	damage_type = DMG_TYPE_IGNITION
	icon = 'icons/stalker/anomalies.dmi'
	inactive_icon_state = "jarka0"
	active_icon_state = "jarka1"
	active_invisibility = 0
	inactive_invisibility = 0
	loot = list(/obj/item/weapon/artifact/droplet = 6.5,
				/obj/item/weapon/artifact/fireball = 3,
				/obj/item/weapon/artifact/crystal = 0.5,
				/obj/nothing = 90)

/obj/anomaly/holodec
	name = "anomaly"
	cooldown = 0.75
	luminosity = 3
	idle_luminosity = 3
	activated_luminosity = 5
	anomaly_color = "#70cc33"
	sound = 'sound/stalker/anomalies/buzz_hit.ogg'
	damage_type = DMG_TYPE_BIO
	damage_amount = 60
	icon = 'icons/stalker/anomalies.dmi'
	inactive_icon_state = "holodec"
	active_icon_state = "holodec" //need activation icon
	active_invisibility = 0
	inactive_invisibility = 0
	loot = list(/obj/item/weapon/artifact/stone_blood = 6.5,
				/obj/item/weapon/artifact/soul = 3,
				/obj/item/weapon/artifact/bubble = 0.5,
				/obj/nothing = 90)

/obj/anomaly/puh
	name = "anomaly"
	cooldown = 0.75
	sound = 'sound/stalker/anomalies/buzz_hit.ogg'
	damage_type = DMG_TYPE_BIO
	damage_amount = 65
	icon = 'icons/stalker/anomalies.dmi'
	inactive_icon_state = "puh"
	active_icon_state = "puh" //need activation icon
	active_invisibility = 0
	inactive_invisibility = 0

/obj/anomaly/puh/New()
	..()
	inactive_icon_state = pick("puh","puh2")
	icon_state = inactive_icon_state
	if(inactive_icon_state == "puh2")
		active_icon_state = "puh2"
/*
/obj/anomaly/puh/puh2
	icon = 'icons/stalker/anomalies.dmi'
	inactive_icon_state = "puh2"
	active_icon_state = "puh2"
*/
/*
/obj/anomaly/fake
	name = "anomaly"
*/
/obj/rad 	//Не наносит урона
	name = "Anomaly"
	icon = 'icons/stalker/anomalies.dmi'
	icon_state = "rad_low"
	var/damage_amount = 0 				//Сколько дамажит
	var/damage_type = DMG_TYPE_RADIATION	//Тип дамага
	var/activated_icon_state = null 	//Спрайт при активации
	var/cooldown = 2.5					//Кулдаун
	var/lasttime = 0
	var/list/mob/living/carbon/human/trapped = new/list()
	var/idle_luminosity = 0
	var/activated_luminosity = 0
	var/sound = null
	var/delay = 0
	var/attachedSpawner = null
	var/active_icon_state = null
	var/inactive_icon_state = null
	invisibility = 101
	icon = 'icons/stalker/anomalies.dmi'
	unacidable = 1
	anchored = 1
	pass_flags = PASSTABLE | PASSGRILLE

/obj/rad/rad_low
	damage_amount = 10
	sound = 'sound/stalker/pda/geiger_1.ogg'
	icon_state = "rad_low"

/obj/rad/rad_medium
	damage_amount = 25
	sound = 'sound/stalker/pda/geiger_4.ogg'
	icon_state = "rad_medium"

/obj/rad/rad_high
	damage_amount = 75
	sound = 'sound/stalker/pda/geiger_6.ogg'
	icon_state = "rad_high"

/obj/rad/New()
	..()
	SSobj.processing.Remove(src)

/obj/rad/Destroy()
	..()
	SSobj.processing.Remove(src)

/obj/rad/Crossed(atom/A)
	..()
	if(lasttime + cooldown > world.time)
		return

	if(istype(A,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = A
		src.trapped.Add(H)
		if(src.trapped.len >= 1)
			SSobj.processing |= src

/obj/rad/Uncrossed(atom/A)
	..()
	if (istype(A,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = A
		src.trapped.Remove(H)
		SSobj.processing.Remove(src)

/obj/rad/process()
	if(src.trapped.len < 1)
		SSobj.processing.Remove(src)
		return

	for(var/atom/A in src.trapped)

		if(lasttime + cooldown > world.time)
			return

		if(!istype(A, /mob/living/carbon/human))
			continue

		var/mob/living/carbon/human/H = A

		if(H.stat == 2)
			src.trapped.Remove(H)
			continue

		H.rad_act(src.damage_amount)

		if(istype(H.wear_id,/obj/item/device/stalker_pda))
			H << sound(src.sound, repeat = 0, wait = 0, volume = 50, channel = 3)

		src.lasttime = world.time
