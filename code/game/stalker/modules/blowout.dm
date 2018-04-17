#define BLOWOUTLOW		1
#define BLOWOUTNORMAL	2
#define BLOWOUTHIGH		3

var/datum/subsystem/blowout/StalkerBlowout
var/global/isblowout = 0

/mob/living/carbon/human
	var/inshelter = 0

datum/subsystem/blowout
	var/blowoutphase = 0
	var/cooldownmin = 18000
	var/cooldownmax = 36000
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
	Cycle()

datum/subsystem/blowout/proc/Cycle()
	spawn(rand(cooldownmin, cooldownmin))
		StartBlowout()
	blowoutphase++
	if(blowoutphase > 3)
		blowoutphase = 1

datum/subsystem/blowout/proc/StartBlowout()
	isblowout = 1
	for(var/area/stalker/A in sortedAreas)
		if(istype(A, /area/stalker/blowout))
			A.StartBlowout()

	add_lenta_message(null, "0", "Sidorovich", "Одиночки", "ВНИМАНИЕ, СТАЛКЕРЫ! Начинаетс&#x44F; выброс! Скорее найдите укрытие!")
	//world << "<span class='danger'>Начинаетс&#255; выброс! Скорее найдите укрытие!</span>"
	//world << 'sound/stalker/pda/sms.ogg'
	world << sound('sound/stalker/blowout/blowout_begin_02.ogg', wait = 0, channel = 17, volume = 70)
	world << sound('sound/stalker/blowout/blowout_siren.ogg', wait = 0, channel = 18, volume = 70)
	spawn(1200)	//980
		world << sound('sound/stalker/blowout/blowout_particle_wave.ogg', wait = 0, channel = 17, volume = 70)
	spawn(1520)	//1200
		StopBlowout()

datum/subsystem/blowout/proc/StopBlowout()
	for(var/area/stalker/A in blowoutAreas)
		A.StopBlowout(blowoutphase)
		CHECK_TICK

	for(var/mob/living/L in living_mob_list)
		if(istype(get_area(L.loc), /area/stalker/blowout))
			if(istype(L, /mob/living/carbon/human))
				var/mob/living/carbon/human/H = L
				H.radiation += 100
				H.apply_damage(300, BURN)
				CHECK_TICK
				continue
			if(L.stat == DEAD)
				L.gib()
				CHECK_TICK

	for(var/obj/item/weapon/artifact/A in spawned_artifacts)
		spawned_artifacts.Remove(A)
		qdel(A)

	world << sound('sound/stalker/blowout/blowout_impact_02.ogg', wait = 0, channel = 17, volume = 70)
	world << sound('sound/stalker/blowout/blowout_outro.ogg', wait = 0, channel = 18, volume = 70)
	spawn(300)
		for(var/obj/anomaly/An in anomalies)
			An.SpawnArtifact()
		isblowout = 0
		add_lenta_message(null, "0", "Sidorovich", "Одиночки", "Все! Выброс закончилс&#x44F;! Выходите из укрытий.")
		world << sound(null, wait = 0, channel = 19, volume = 70)
		world << sound(null, wait = 0, channel = 20, volume = 70)
		world << sound(null, wait = 0, channel = 21, volume = 70)
		world << sound(null, wait = 0, channel = 22, volume = 70)
		world << sound(null, wait = 0, channel = 23, volume = 70)
		world << sound(null, wait = 0, channel = 24, volume = 70)
		Cycle()

area/proc/StartBlowout()
	blowout = 1
	ProcessBlowout()

area/proc/StopBlowout(blowoutphase)
	blowout = 0
	/*
	for(var/mob/living/L in src.contents)
		if(istype(L, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = L
			H.radiation += 100
			H.apply_damage(300, BURN)
			continue
		if(L.stat == DEAD)
			L.gib()
	*/
	/*
	for(var/obj/item/weapon/artifact/A in src.contents)
		qdel(A)
	*/
	/*
	switch(blowoutphase)

		if(BLOWOUTLOW)

			for(var/mob/living/L in src.contents)
				if(istype(L, /mob/living/carbon/human))
					var/mob/living/carbon/human/H = L
					H.radiation += 100
					H.apply_damage(150, BURN)
					continue
				L.gib()

			for(var/obj/item/weapon/artifact/A in src.contents)
				qdel(A)

		if(BLOWOUTNORMAL)

			for(var/mob/living/L in src.contents)
				if(istype(L, /mob/living/carbon/human))
					var/mob/living/carbon/human/H = L
					H.radiation += 100
					H.apply_damage(150, BURN)
					continue
				L.gib()

			for(var/obj/item/weapon/artifact/A in src.contents)
				qdel(A)

		if(BLOWOUTHIGH)
			lentahtml = ""

			for(var/mob/living/L in src.contents)
				if(istype(L, /mob/living/carbon/human))
					var/mob/living/carbon/human/H = L
					H.radiation += 100
					H.apply_damage(150, BURN)
					continue
				L.gib()

			for(var/obj/item/weapon/artifact/A in src.contents)
				qdel(A)
				continue
	*/
area/proc/ProcessBlowout()
	if(blowout)
		for(var/mob/living/carbon/human/H in src.contents)
			shake_camera(H, 1, 1)
			spawn(1100)	//980
				shake_camera(H, 10, 1)
		spawn(15)
			ProcessBlowout()
	if(prob(10))
		var/a = pick(StalkerBlowout.ambient)
		world << sound(a, wait = 1, channel = 19, volume = 70)

	if(prob(20))
		var/a = pick(StalkerBlowout.wave)
		world << sound(a, wait = 1, channel = 20, volume = 70)

	if(prob(10))
		var/a = pick(StalkerBlowout.wind)
		world << sound(a, wait = 1, channel = 21, volume = 70)

	if(prob(20))
		var/a = pick(StalkerBlowout.rumble)
		world << sound(a, wait = 1, channel = 22, volume = 70)

	if(prob(30))
		var/a = pick(StalkerBlowout.boom)
		world << sound(a, wait = 1, channel = 23, volume = 70)

	if(prob(30))
		var/a = pick(StalkerBlowout.lightning)
		world << sound(a, wait = 1, channel = 24, volume = 70)