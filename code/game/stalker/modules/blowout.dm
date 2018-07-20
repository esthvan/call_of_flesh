#define BLOWOUTLOW		1
#define BLOWOUTNORMAL	2
#define BLOWOUTHIGH		3

var/datum/subsystem/blowout/StalkerBlowout
var/global/isblowout = 0

/mob/living/carbon/human
	var/inshelter = 0

datum/subsystem/blowout
	name = "Blowouts"
	priority = 1
	var/blowoutphase = 0
	var/cooldownmin = 18000
	var/cooldownmax = 36000
	var/cooldownreal = 0
	var/lasttime = 0
	var/starttime = 0
	var/blowout_duration = 1200
	var/list/ambient = list('sound/stalker/blowout/blowout_amb_01.ogg', 'sound/stalker/blowout/blowout_amb_02.ogg',
						'sound/stalker/blowout/blowout_amb_03.ogg', 'sound/stalker/blowout/blowout_amb_04.ogg',
						'sound/stalker/blowout/blowout_amb_05.ogg', 'sound/stalker/blowout/blowout_amb_06.ogg',
						'sound/stalker/blowout/blowout_amb_07.ogg', 'sound/stalker/blowout/blowout_amb_08.ogg')

	var/list/rumble = list('sound/stalker/blowout/blowout_ambient_rumble_01.ogg', 'sound/stalker/blowout/blowout_ambient_rumble_02.ogg',
							'sound/stalker/blowout/blowout_ambient_rumble_03.ogg', 'sound/stalker/blowout/blowout_ambient_rumble_04.ogg')

	var/list/wave = list('sound/stalker/blowout/blowout_wave_01.ogg', 'sound/stalker/blowout/blowout_wave_02.ogg',
						'sound/stalker/blowout/blowout_wave_03.ogg')

	var/list/boom = list('sound/stalker/blowout/blowout_boom_01.ogg', 'sound/stalker/blowout/blowout_boom_02.ogg',
						'sound/stalker/blowout/blowout_boom_03.ogg')

	var/list/lightning = list('sound/stalker/blowout/blowout_lightning_01.ogg', 'sound/stalker/blowout/blowout_lightning_02.ogg',
								'sound/stalker/blowout/blowout_lightning_03.ogg', 'sound/stalker/blowout/blowout_lightning_04.ogg',
								'sound/stalker/blowout/blowout_lightning_05.ogg', 'sound/stalker/blowout/blowout_flare_01.ogg',
								'sound/stalker/blowout/blowout_flare_02.ogg', 'sound/stalker/blowout/blowout_flare_03.ogg',
								'sound/stalker/blowout/blowout_flare_04.ogg')

	var/list/wind = list('sound/stalker/blowout/blowout_wind_01.ogg', 'sound/stalker/blowout/blowout_wind_02.ogg',
							'sound/stalker/blowout/blowout_wind_03.ogg')

datum/subsystem/blowout/New()
	NEW_SS_GLOBAL(StalkerBlowout)
	cooldownreal = rand(cooldownmin, cooldownmax)

datum/subsystem/blowout/fire()
	if(world.time <= lasttime + cooldownreal)
		return

	if(starttime)
		if(640 + blowout_duration + starttime < world.time)
			AfterBlowout()
			return

		ProcessBlowout()

		if((320 + blowout_duration + starttime) < world.time)
			if(blowoutphase == 2)
				StopBlowout()
			BlowoutDealDamage()
			BlowoutClean()
			return

		if((blowout_duration + starttime) < world.time)
			if(blowoutphase == 1)
				PreStopBlowout()
			return

	if(!isblowout)
		StartBlowout()
		return


datum/subsystem/blowout/proc/StartBlowout()
	isblowout = 1
	blowoutphase = 1
	starttime = world.time

	add_lenta_message(null, "0", "Sidorovich", "Одиночки", "ВНИМАНИЕ, СТАЛКЕРЫ! Начинаетс&#x44F; выброс! Скорее найдите укрытие!")
	world << sound('sound/stalker/blowout/blowout_begin_02.ogg', wait = 0, channel = 17, volume = 50)
	world << sound('sound/stalker/blowout/blowout_siren.ogg', wait = 0, channel = 18, volume = 60)

datum/subsystem/blowout/proc/PreStopBlowout()
	blowoutphase = 2
	world << sound('sound/stalker/blowout/blowout_particle_wave.ogg', wait = 0, channel = 17, volume = 70)

datum/subsystem/blowout/proc/BlowoutClean()
	for(var/mob/living/L)
		if(L.stat == DEAD)

			L.gib()
			if(MC_TICK_CHECK)
				return

	for(var/obj/item/ammo_casing/AC in ACs)
		qdel(AC)
		if(MC_TICK_CHECK)
			return


datum/subsystem/blowout/proc/BlowoutDealDamage()
	for(var/mob/living/carbon/human/H)
		if(istype(get_area(H), /area/stalker/blowout))

			H.radiation += 500
			H.apply_damage(175, BURN)
			CHECK_TICK

datum/subsystem/blowout/proc/StopBlowout()

	if(blowoutphase == 2)

		world << sound('sound/stalker/blowout/blowout_impact_02.ogg', wait = 0, channel = 17, volume = 70)
		world << sound('sound/stalker/blowout/blowout_outro.ogg', wait = 0, channel = 18, volume = 70)

	blowoutphase = 3

	for(var/obj/item/weapon/artifact/A)

		if(A.invisibility > 30)

			PlaceInPool(A)
			CHECK_TICK

	for(var/obj/anomaly/An in anomalies)

		An.SpawnArtifact()
		CHECK_TICK

datum/subsystem/blowout/proc/AfterBlowout()

	cooldownreal = rand(cooldownmin, cooldownmax)
	isblowout = 0
	lasttime = world.time
	starttime = 0
	add_lenta_message(null, "0", "Sidorovich", "Одиночки", "Все! Выброс закончилс&#x44F;! Выходите из укрытий.")

	world << sound(null, wait = 0, channel = 19, volume = 70)
	world << sound(null, wait = 0, channel = 20, volume = 70)
	world << sound(null, wait = 0, channel = 21, volume = 70)
	world << sound(null, wait = 0, channel = 22, volume = 70)
	world << sound(null, wait = 0, channel = 23, volume = 70)
	world << sound(null, wait = 0, channel = 24, volume = 70)

datum/subsystem/blowout/proc/ProcessBlowout()
	if(isblowout)
		for(var/mob/living/carbon/human/H)
			if(istype(get_area(H), /area/stalker/blowout))
				switch(blowoutphase)
					if(1)
						shake_camera(H, 1, 1)
					if(2)
						shake_camera(H, 2, 1)
					if(3)
						shake_camera(H, 10, 1)

	if(prob(20))
		var/a = pick(StalkerBlowout.ambient)
		world << sound(a, wait = 1, channel = 19, volume = 70)

	if(prob(30))
		var/a = pick(StalkerBlowout.wave)
		world << sound(a, wait = 1, channel = 20, volume = 70)

	if(prob(20))
		var/a = pick(StalkerBlowout.wind)
		world << sound(a, wait = 1, channel = 21, volume = 70)

	if(prob(30))
		var/a = pick(StalkerBlowout.rumble)
		world << sound(a, wait = 1, channel = 22, volume = 70)

	if(prob(40))
		var/a = pick(StalkerBlowout.boom)
		world << sound(a, wait = 1, channel = 23, volume = 70)

	if(prob(40))
		var/a = pick(StalkerBlowout.lightning)
		world << sound(a, wait = 1, channel = 24, volume = 70)