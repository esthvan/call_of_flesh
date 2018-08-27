/turf/simulated
	name = "station"
	var/wet = 0
	var/image/wet_overlay = null

	var/thermite = 0
	oxygen = MOLES_O2STANDARD
	nitrogen = MOLES_N2STANDARD
	var/to_be_destroyed = 0 //Used for fire, if a melting temperature was reached, it will be destroyed
	var/max_fire_temperature_sustained = 0 //The max temperature of the fire which it was subjected to
	overlay_priority = 100


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
			if(istype(src, /turf/stalker/floor/digable/grass))
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
/*Чтобы не потерять
/turf

	var/list/l_sounds_bar = list('sound/stalker/megafon/bar_start_megafon_1.ogg','sound/stalker/megafon/bar_start_megafon_2.ogg',
								'sound/stalker/megafon/bar_start_megafon_3.ogg','sound/stalker/megafon/bar_start_megafon_4.ogg',
								'sound/stalker/megafon/mega_duty_propaganda_1.ogg','sound/stalker/megafon/mega_duty_propaganda_2.ogg',
								'sound/stalker/megafon/mega_duty_propaganda_3.ogg','sound/stalker/megafon/mega_duty_propaganda_4.ogg',
								'sound/stalker/megafon/mega_duty_propaganda_5.ogg','sound/stalker/megafon/mega_duty_propaganda_6.ogg',
								'sound/stalker/megafon/mega_duty_propaganda_7.ogg')
*/

/turf/stalker/Entered(atom/A, atom/OL)
	..()
	var/footstepsound
	if(istype(A, /mob/living))
		if(istype(src, /turf/stalker/floor/water))
			footstepsound = "waterfootsteps"
			playsound(src, footstepsound, 60, 1)
			..()
			return

	if(istype(A,/mob/living/carbon))
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
			else if(istype(src, /turf/stalker/floor/water))
				footstepsound = "waterfootsteps"
			else
				footstepsound = "erikafootsteps"

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

/turf/simulated/ChangeTurf(var/path)
	. = ..()
	smooth_icon_neighbors(src)
