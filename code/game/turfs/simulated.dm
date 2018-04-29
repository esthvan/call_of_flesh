/turf/simulated
	name = "station"
	var/wet = 0
	var/image/wet_overlay = null

	var/thermite = 0
	oxygen = MOLES_O2STANDARD
	nitrogen = MOLES_N2STANDARD
	var/to_be_destroyed = 0 //Used for fire, if a melting temperature was reached, it will be destroyed
	var/max_fire_temperature_sustained = 0 //The max temperature of the fire which it was subjected to



/turf/simulated/proc/burn_tile()

/turf/simulated/proc/MakeSlippery(wet_setting = TURF_WET_WATER) // 1 = Water, 2 = Lube, 3 = Ice
	if(wet >= wet_setting)
		return
	wet = wet_setting
	if(wet_setting != TURF_DRY)
		if(wet_overlay)
			overlays -= wet_overlay
			wet_overlay = null
		var/turf/simulated/floor/F = src
		if(istype(F))
			wet_overlay = image('icons/effects/water.dmi', src, "wet_floor_static")
		else
			wet_overlay = image('icons/effects/water.dmi', src, "wet_static")
		overlays += wet_overlay

	spawn(rand(790, 820)) // Purely so for visual effect
		if(!istype(src, /turf/simulated)) //Because turfs don't get deleted, they change, adapt, transform, evolve and deform. they are one and they are all.
			return
		MakeDry(wet_setting)

/turf/simulated/proc/MakeDry(wet_setting = TURF_WET_WATER)
	if(wet > wet_setting)
		return
	wet = TURF_DRY
	if(wet_overlay)
		overlays -= wet_overlay

/turf/simulated/Entered(atom/A, atom/OL)
	..()
	var/footstepsound
	if (istype(A,/mob/living/carbon))
		var/mob/living/carbon/M = A
		if(istype(M, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = M

			//clown shoes
			if(istype(H.shoes, /obj/item/clothing/shoes/clown_shoes))
				if(M.m_intent == "run")
					if(M.footstep >= 3)
						M.footstep = 0
						playsound(src, "clownstep", 30, 1) // this will get annoying very fast.
					else
						M.footstep++
				else
					playsound(src, "clownstep", 60, 1)

			//shoes
			if 		(istype(src, /turf/stalker/floor/digable/grass))
				footstepsound = "grassfootsteps"
			else 	if(istype(src, /turf/stalker/floor/tropa))
				footstepsound = "sandfootsteps"
			else 	if(istype(src, /turf/simulated/floor/plating/beach/water))
				footstepsound = "waterfootsteps"
			else 	if(istype(src, /turf/stalker/floor/wood || /turf/stalker/floor/wood/oldgor || /turf/stalker/floor/wood/oldvert))
				footstepsound = "woodfootsteps"
			else 	if(istype(src, /turf/simulated/floor/carpet))
				footstepsound = "carpetfootsteps"
			else 	if(istype(src, /turf/stalker/floor/gryaz || /turf/stalker/floor/gryaz/gryaz2 ))
				footstepsound = "dirtfootsteps"
			else
				footstepsound = "erikafootsteps"

			if(istype(H.shoes, /obj/item/clothing/shoes))
				if(istype(H.shoes, /obj/item/clothing/shoes/space_ninja)) return
				if(istype(H.shoes, /obj/item/clothing/shoes/sneakers/mime)) return
				if(M.m_intent == "run")
					if(M.footstep >= 3)
						M.footstep = 0
						playsound(src, footstepsound, 30, 1) // this will get annoying very fast.
					else
						M.footstep++
				else
					if(M.footstep >= 6)
						M.footstep = 0
						playsound(src, footstepsound, 60, 1)
					else
						M.footstep++


		switch(wet)
			if(TURF_WET_WATER)
				if(!M.slip(3, 1, null, NO_SLIP_WHEN_WALKING))
					M.inertia_dir = 0
				return
			if(TURF_WET_LUBE)
				M.slip(0, 7, null, (SLIDE|GALOSHES_DONT_HELP))
				return
			if(TURF_WET_ICE)
				M.slip(0, 4, null, (SLIDE|NO_SLIP_WHEN_WALKING))
				return
	..()

/turf
	var/list/l_sounds_ugrnd = 	list(	'sound/stalker/ambience/ugrnd/rnd_ugrnd_amb_1.ogg','sound/stalker/ambience/ugrnd/rnd_ugrnd_amb_1.ogg',
									'sound/stalker/ambience/ugrnd/ugrnd_ambient_banging_1.ogg','sound/stalker/ambience/ugrnd/ugrnd_ambient_banging_2.ogg',
									'sound/stalker/ambience/ugrnd/ugrnd_drip_1.ogg','sound/stalker/ambience/ugrnd/ugrnd_drip_2.ogg',
									'sound/stalker/ambience/ugrnd/ugrnd_metal_1.ogg','sound/stalker/ambience/ugrnd/ugrnd_metal_2.ogg',
									'sound/stalker/ambience/ugrnd/ugrnd_metal_3.ogg','sound/stalker/ambience/ugrnd/ugrnd_metal_4.ogg')

	var/list/l_sounds_outdoor = list('sound/stalker/ambience/rnd_outdoor/rnd_bird_1.ogg','sound/stalker/ambience/rnd_outdoor/rnd_bird_2.ogg',
									'sound/stalker/ambience/rnd_outdoor/rnd_bird_3.ogg','sound/stalker/ambience/rnd_outdoor/rnd_bird_4.ogg',
									'sound/stalker/ambience/rnd_outdoor/rnd_bird_5.ogg','sound/stalker/ambience/rnd_outdoor/rnd_bird_6.ogg',
									'sound/stalker/ambience/rnd_outdoor/rnd_bird_7.ogg','sound/stalker/ambience/rnd_outdoor/rnd_bird_8.ogg',
									'sound/stalker/ambience/rnd_outdoor/rnd_bird_9.ogg','sound/stalker/ambience/rnd_outdoor/rnd_bird_10.ogg',
									'sound/stalker/ambience/rnd_outdoor/rnd_bird_11.ogg',
									'sound/stalker/ambience/rnd_outdoor/rnd_dog1.ogg','sound/stalker/ambience/rnd_outdoor/rnd_dog2.ogg',
									'sound/stalker/ambience/rnd_outdoor/rnd_dog3.ogg','sound/stalker/ambience/rnd_outdoor/rnd_dog4.ogg',
									'sound/stalker/ambience/rnd_outdoor/rnd_dog5.ogg','sound/stalker/ambience/rnd_outdoor/rnd_dog6.ogg',
									'sound/stalker/ambience/rnd_outdoor/rnd_dog7.ogg','sound/stalker/ambience/rnd_outdoor/rnd_dog8.ogg',
									'sound/stalker/ambience/rnd_outdoor/rnd_dog9.ogg','sound/stalker/ambience/rnd_outdoor/rnd_dog10.ogg',
									'sound/stalker/ambience/rnd_outdoor/rnd_crow_1.ogg','sound/stalker/ambience/rnd_outdoor/rnd_crow_2.ogg',
									'sound/stalker/ambience/rnd_outdoor/rnd_crow_3.ogg','sound/stalker/ambience/rnd_outdoor/rnd_crow_4.ogg',
									'sound/stalker/ambience/rnd_outdoor/rnd_crow_5.ogg','sound/stalker/ambience/rnd_outdoor/rnd_crow_6.ogg',
									'sound/stalker/ambience/rnd_outdoor/rnd_crow_7.ogg','sound/stalker/ambience/rnd_outdoor/rnd_crow_8.ogg',
									'sound/stalker/ambience/rnd_outdoor/rnd_crow_9.ogg','sound/stalker/ambience/rnd_outdoor/rnd_crow_10.ogg',
									'sound/stalker/ambience/rnd_outdoor/rnd_crow_11.ogg','sound/stalker/ambience/rnd_outdoor/rnd_crow_12.ogg')

	var/list/l_sounds_bar = list('sound/stalker/megafon/bar_start_megafon_1.ogg','sound/stalker/megafon/bar_start_megafon_2.ogg',
								'sound/stalker/megafon/bar_start_megafon_3.ogg','sound/stalker/megafon/bar_start_megafon_4.ogg',
								'sound/stalker/megafon/mega_duty_propaganda_1.ogg','sound/stalker/megafon/mega_duty_propaganda_2.ogg',
								'sound/stalker/megafon/mega_duty_propaganda_3.ogg','sound/stalker/megafon/mega_duty_propaganda_4.ogg',
								'sound/stalker/megafon/mega_duty_propaganda_5.ogg','sound/stalker/megafon/mega_duty_propaganda_6.ogg',
								'sound/stalker/megafon/mega_duty_propaganda_7.ogg')


/turf/stalker/Entered(atom/A, atom/OL)
	..()
	var/footstepsound
	if (istype(A,/mob/living/carbon))
		var/mob/living/carbon/M = A
		if(istype(M, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = M

			//clown shoes
			if(istype(H.shoes, /obj/item/clothing/shoes/clown_shoes))
				if(M.m_intent == "run")
					if(M.footstep >= 3)
						M.footstep = 0
						playsound(src, "clownstep", 30, 1) // this will get annoying very fast.
					else
						M.footstep++
				else
					playsound(src, "clownstep", 60, 1)

			//shoes
			if(istype(src, /turf/stalker/floor/digable/grass))
				footstepsound = "grassfootsteps"
			else if(istype(src, /turf/stalker/floor/tropa))
				footstepsound = "sandfootsteps"
			else if(istype(src, /turf/simulated/floor/plating/beach/water))
				footstepsound = "waterfootsteps"
			else if(istype(src, /turf/stalker/floor/wood || /turf/stalker/floor/wood/oldgor || /turf/stalker/floor/wood/oldvert))
				footstepsound = "woodfootsteps"
			else if(istype(src, /turf/simulated/floor/carpet))
				footstepsound = "carpetfootsteps"
			else if(istype(src, /turf/stalker/floor/gryaz || /turf/stalker/floor/gryaz/gryaz2))
				footstepsound = "dirtfootsteps"
			else
				footstepsound = "erikafootsteps"

			var/l_sound = pick(l_sounds_ugrnd)

			if (istype(get_area(src.loc), /area/stalker/blowout/outdoor))
				if (prob(1))
					l_sound = pick(l_sounds_outdoor)
					A << sound(l_sound, repeat = 0, wait = 1,volume = 65, channel = 8)
			if (istype(get_area(src.loc), /area/stalker/agroprom/caves))
				if (prob(1))
					l_sound = pick(l_sounds_ugrnd)
					A << sound(l_sound, repeat = 0, wait = 1,volume = 65, channel = 8)
			if (istype(get_area(src.loc), /area/stalker/blowout/outdoor/safezone/bar))
				if (prob(0.3))
					l_sound = pick(l_sounds_bar)
					A << sound(l_sound, repeat = 0, wait = 1,volume = 65, channel = 8)

			if (isblowout == 1)
				if (!istype(get_area(src.loc), /area/stalker/blowout))
					if (H.inshelter == 0)
						if(H.client && (H.client.prefs.chat_toggles & CHAT_LANGUAGE))
							H << "<span class='notice'>You enter the shelter.</span>"
						else
							H << "<span class='notice'>Вы заходите в укрытие.</span>"
					H.inshelter = 1

			if(istype(H.shoes, /obj/item/clothing/shoes))
				if(M.m_intent == "run")
					if(M.footstep >= 3)
						M.footstep = 0
						playsound(src, footstepsound, 30, 1) // this will get annoying very fast.
					else
						M.footstep++
				else
					if(M.footstep >= 6)
						M.footstep = 0
						playsound(src, footstepsound, 60, 1)
					else
						M.footstep++
	..()

/turf/stalker/Exited(atom/A, atom/NL)
	..()
	if(istype(A, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = A

		if (isblowout == 1)
			if (istype(get_area(src.loc), /area/stalker/blowout))
				if (H.inshelter == 1)
					if(H.client && (H.client.prefs.chat_toggles & CHAT_LANGUAGE))
						H << "<span class='notice'>You leave the shelter.</span>"
					else
						H << "<span class='notice'>Вы покидаете укрытие.</span>"
				H.inshelter = 0

/turf/simulated/ChangeTurf(var/path)
	. = ..()
	smooth_icon_neighbors(src)
