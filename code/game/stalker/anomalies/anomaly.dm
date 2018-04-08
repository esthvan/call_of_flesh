#define DMG_TYPE_GIB 1
#define DMG_TYPE_ENERGY 2
#define DMG_TYPE_BURN 4
#define DMG_TYPE_BRAIN 8
#define DMG_TYPE_RADIATION 16
#define DMG_TYPE_IGNITION 32
#define DMG_TYPE_BIO 64
/var/list/obj/anomaly/anomalies = list()

/obj/anomaly
	name = "Anomaly"
	var/damage_amount = 0 				//Сколько дамажит
	var/damage_type = DMG_TYPE_ENERGY	//Тип дамага
	var/activated_icon_state = null 	//Спрайт при активации
	var/cooldown = 5
	var/lasttime = 0
	var/list/trapped = new/list()
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
	icon = 'icons/stalker/anomalies.dmi'
	unacidable = 1
	anchored = 1
	pass_flags = PASSTABLE | PASSGRILLE
	//invisibility = 101

/obj/anomaly/New()
	..()
	SSobj.processing.Remove(src)
	anomalies += src
	//if(prob(30))
	//	if(attachedSpawner)
	//		new attachedSpawner(src)
	icon_state = inactive_icon_state
	invisibility = inactive_invisibility
	SpawnArtifact()

/obj/anomaly/Destroy()
	..()
	SSobj.processing.Remove(src)

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

/obj/anomaly/proc/RandomMove(spawned)
	if(spawned)
		var/turf/T = get_turf(src)
		if(istype(spawned, /obj))
			var/obj/O = spawned
			var/new_x = T.x + rand(-1, 1)
			var/new_y = T.y + rand(-1, 1)
			O.Move(locate(new_x, new_y, T.z))
		else
			if(istype(spawned, /mob))
				var/mob/M = spawned
				var/new_x = T.x + rand(-1, 1)
				var/new_y = T.y + rand(-1, 1)
				M.Move(locate(new_x, new_y, T.z))
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
		src.set_light(src.activated_luminosity)
		spawn(10)
			invisibility = inactive_invisibility
			icon_state = inactive_icon_state
			src.set_light(src.idle_luminosity)
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
				//trapped.Remove(Q)
				spawn(src.cooldown * 10 - 5)
					qdel(I)
		return

	if(istype(A,/mob/living))
		//playsound(src.loc, src.sound, 50, 1, channel = 0)
		var/mob/living/M = A
		src.trapped.Add(M)
		if(src.trapped.len >= 1)
			SSobj.processing |= src
		//else
		//	src.trapped.Remove(M)
		return
	return

/obj/anomaly/Uncrossed(atom/A)
	..()
	if (istype(A,/mob/living))
		var/mob/living/M = A
		src.trapped.Remove(M)
		SSobj.processing.Remove(src)
//	if (istype(A,/obj/item) && !istype(A,/obj/item/projectile) && !istype(A,/obj/item/weapon/artifact))
//		var/obj/item/O = A
//		src.trapped.Remove(O)

/obj/anomaly/process()

	if(src.trapped.len <= 0)
		SSobj.processing.Remove(src)
		return

	if(lasttime + cooldown > world.time)
		return

	invisibility = active_invisibility
	icon_state = active_icon_state
	update_icon()
	src.set_light(src.activated_luminosity)
	spawn(10)
		invisibility = inactive_invisibility
		icon_state = inactive_icon_state
		src.set_light(src.idle_luminosity)

	playsound(src.loc, src.sound, 50, 1, channel = 0)

	lasttime = world.time

	spawn(src.delay * 10)
		for(var/atom/A in src.trapped)
			if(istype(A, /mob/living))
				var/mob/living/M = A
				//spawn(src.delay * 10)
				switch(src.damage_type)
					if(DMG_TYPE_ENERGY)
						M.apply_damage(src.damage_amount, BURN, null, M.getarmor(null, "electro"))
					if(DMG_TYPE_BIO)
						M.apply_damage(src.damage_amount, BURN, null, M.getarmor(null, "bio"))
					if(DMG_TYPE_RADIATION)
						M.rad_act(src.damage_amount)
					if(DMG_TYPE_GIB)
						M.gib()
						trapped.Remove(M)
					if(DMG_TYPE_IGNITION)
						A.fire_act()
						if(istype(A, /mob/living/simple_animal/hostile))
							M.apply_damage(40, BURN, null, 0)
	return

/obj/anomaly/electro
	name = "anomaly"
	damage_amount = 40
	cooldown = 2
	sound = 'sound/stalker/anomalies/electra_blast1.ogg'
	idle_luminosity = 1
	activated_luminosity = 2
	damage_type = DMG_TYPE_ENERGY
	inactive_icon_state = "electra0"
	active_icon_state = "electra1"
	active_invisibility = 0
	inactive_invisibility = 0
	loot = list(/obj/item/weapon/artifact/flash = 6,
				/obj/item/weapon/artifact/moonlight = 3,
				/obj/item/weapon/artifact/battery = 0.5,
				/obj/item/weapon/artifact/pustishka = 0.5,
				/obj/nothing = 90)

/obj/anomaly/electro/New()
	..()
	src.set_light(luminosity)

/obj/anomaly/tramplin
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
	loot = list(/obj/item/weapon/artifact/meduza = 6,
				/obj/item/weapon/artifact/stoneflower = 2.5,
				/obj/item/weapon/artifact/nightstar = 1,
				/obj/item/weapon/artifact/maminibusi = 0.5,
				/obj/nothing = 90)

/obj/anomaly/jarka
	name = "anomaly"
	cooldown = 1
	sound = 'sound/stalker/anomalies/zharka1.ogg'
	luminosity = 2
	idle_luminosity = 3
	activated_luminosity = 5
	damage_type = DMG_TYPE_IGNITION
	icon = 'icons/stalker/anomalies.dmi'
	inactive_icon_state = "jarka0"
	active_icon_state = "jarka1"
	active_invisibility = 0
	inactive_invisibility = 0
	loot = list(/obj/item/weapon/artifact/droplet = 6,
				/obj/item/weapon/artifact/fireball = 3,
				/obj/item/weapon/artifact/crystal = 1,
				/obj/nothing = 90)

/obj/anomaly/holodec
	name = "anomaly"
	luminosity = 3
	idle_luminosity = 3
	activated_luminosity = 5
	sound = 'sound/stalker/anomalies/buzz_hit.ogg'
	damage_type = DMG_TYPE_BIO
	damage_amount = 30
	icon = 'icons/stalker/anomalies.dmi'
	inactive_icon_state = "holodec"
	active_icon_state = "holodec" //need activation icon
	active_invisibility = 0
	inactive_invisibility = 0
	loot = list(/obj/item/weapon/artifact/stone_blood = 6,
				/obj/item/weapon/artifact/soul = 3,
				/obj/item/weapon/artifact/bubble = 1,
				/obj/nothing = 90)

/obj/anomaly/puh
	name = "anomaly"
	sound = 'sound/stalker/anomalies/buzz_hit.ogg'
	damage_type = DMG_TYPE_BIO
	damage_amount = 15
	icon = 'icons/stalker/anomalies.dmi'
	inactive_icon_state = "puh"
	active_icon_state = "puh" //need activation icon
	active_invisibility = 0
	inactive_invisibility = 0

/obj/anomaly/puh/puh2
	icon = 'icons/stalker/anomalies.dmi'
	inactive_icon_state = "puh2"
	active_icon_state = "puh2"
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
	var/cooldown = 5 					//Кулдаун
	var/lasttime = 0
	var/list/trapped = new/list()
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
	damage_amount = 1
	sound = 'sound/stalker/pda/geiger_1.ogg'
	icon_state = "rad_low"

/obj/rad/rad_medium
	damage_amount = 4
	sound = 'sound/stalker/pda/geiger_4.ogg'
	icon_state = "rad_medium"

/obj/rad/rad_high
	damage_amount = 8
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

	if(istype(A,/mob/living/carbon))
		var/mob/living/carbon/M = A
		src.trapped.Add(M)
		if(src.trapped.len >= 1)
			SSobj.processing |= src

/obj/rad/Uncrossed(atom/A)
	..()
	if (istype(A,/mob/living/carbon))
		var/mob/living/carbon/M = A
		src.trapped.Remove(M)
		SSobj.processing.Remove(src)

/obj/rad/process()
	if(src.trapped.len <= 0)
		SSobj.processing.Remove(src)
		return

	if(lasttime + cooldown > world.time)
		return

	for(var/atom/A in src.trapped)
		//if(istype(A, /mob/living))
		var/mob/living/M = A
		M.rad_act(src.damage_amount)
		if(istype(M, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = M
			if(istype(H.wear_id,/obj/item/device/stalker_pda))
				M << sound(src.sound, repeat = 0, wait = 0, volume = 50, channel = 3)
		src.lasttime = world.time
