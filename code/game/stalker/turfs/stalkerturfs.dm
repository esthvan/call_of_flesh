#define NORTH_EDGING	"north"
#define SOUTH_EDGING	"south"
#define EAST_EDGING		"east"
#define WEST_EDGING		"west"

/turf/simulated/floor/plating/asteroid/snow/lite
	name = "snow"
	desc = "Выгл&#255;дит холодным."
	icon = 'icons/turf/snow.dmi'
	baseturf = /turf/simulated/floor/plating/asteroid/snow
	icon_state = "snow"
	icon_plating = "snow"
	temperature = 293
	slowdown = 4
	environment_type = "snow"
	dug = 1

/obj/structure/grille/stalker
	desc = "Хороший, крепкий железный забор."
	name = "fence"
	icon = 'icons/stalker/structure.dmi'
	icon_state = "fence1"
	density = 1
	anchored = 1
	flags = CONDUCT
	layer = 2.9
	health = 10000000

/obj/structure/grille/stalker/ex_act(severity, target)
	return

/obj/structure/grille/stalker/attack_paw(mob/user)
	return

/obj/structure/grille/stalker/attack_hand(mob/living/user)
	user.do_attack_animation(src)
	return

/obj/structure/grille/stalker/attack_animal(var/mob/living/simple_animal/M)
	M.do_attack_animation(src)
	return

/obj/structure/grille/stalker/bullet_act(var/obj/item/projectile/Proj)
	if(!Proj)
		return
	..()
	if((Proj.damage_type != STAMINA)) //Grilles can't be exhausted to death
		return
	return

/obj/structure/grille/stalker/attackby(obj/item/weapon/W, mob/user, params)
	return

/obj/structure/grille/hitby(AM as mob|obj)
	..()
	return

/obj/structure/grille/stalker/wood
	desc = "Хороший, старый дерев&#255;нный забор."
	icon_state = "zabor_horizontal1"
	density = 1
	opacity = 0

/obj/structure/grille/stalker/beton
	icon = 'icons/stalker/beton_zabor.dmi'
	desc = "Слишком крепкий."
	icon_state = "1"
	density = 1
	opacity = 0

/obj/structure/grille/stalker/beton/green
	icon = 'icons/stalker/green_zabor.dmi'
	desc = "Зелённый забор. Лучше, чем серый."
	icon_state = "1"
	layer = 6.1

obj/structure/grille/stalker/beton/CanPass(atom/movable/mover, turf/target, height=0)
	if(height==0) return 1
	if(istype(mover) && mover.checkpass(PASSGRILLE))
		return 1
	else
		if(istype(mover, /obj/item/projectile) && density)
			return prob(0)
		else
			return !density

/turf/stalker
	name = "stalker turf"
	icon = 'icons/stalker/grass.dmi'

/turf/stalker/floor
	name = "Grass"
	icon = 'icons/stalker/grass.dmi'
	icon_state = "grass1"
	layer = TURF_LAYER
	plane = GAME_PLANE
	overlay_priority = 0

/turf/stalker/floor/digable


/turf/stalker/floor/digable/grass
	icon = 'icons/stalker/zemlya.dmi'
	icon_state = "grass1"

/turf/stalker/floor/digable/grass/dump
	icon = 'icons/stalker/zemlya.dmi'
	icon_state = "dump_grass1"
/*
/turf/stalker/floor/digable/grass/dump/New()
	icon_state = "dump_grass[rand(1, 3)]"
*/
/turf/stalker/floor/digable/gryaz_rocky
	icon_state = "gryaz_rocky1"

/turf/stalker/floor/digable/gryaz_rocky/New()
	icon_state = "gryaz_rocky[rand(1, 3)]"

/turf/stalker/floor/sidor
	name = "floor"
	icon = 'icons/turf/beton.dmi'
	icon_state = "sidorpol"

/obj/machinery/door/unpowered/stalker
	icon = 'icons/turf/beton.dmi'

/turf/stalker/floor/asphalt
	name = "road"
	icon = 'icons/stalker/Prishtina/asphalt.dmi'
	icon_state = "road1"
	layer = 2
	overlay_priority = 1

var/global/list/AsphaltEdgeCache

/turf/stalker/floor/asphalt/New()
	icon_state = "road[rand(1, 3)]"
	if(!AsphaltEdgeCache || !AsphaltEdgeCache.len)
		AsphaltEdgeCache = list()
		AsphaltEdgeCache.len = 10
		AsphaltEdgeCache[NORTH] = image('icons/stalker/Prishtina/asphalt.dmi', "roadn", layer = 2.01)
		AsphaltEdgeCache[SOUTH] = image('icons/stalker/Prishtina/asphalt.dmi', "roads", layer = 2.01)
		AsphaltEdgeCache[EAST] = image('icons/stalker/Prishtina/asphalt.dmi', "roade", layer = 2.01)
		AsphaltEdgeCache[WEST] = image('icons/stalker/Prishtina/asphalt.dmi', "roadw", layer = 2.01)

	spawn(1)
		var/turf/T
		for(var/i = -1, i <= 3, i++)
			if(!get_step(src, 2**i))
				continue
			if(overlay_priority > get_step(src, 2**i).overlay_priority)
				T = get_step(src, 2**i)
				if(T)
					T.overlays += AsphaltEdgeCache[2**i]
	return

/turf/stalker/floor/tropa
	name = "road"
	icon = 'icons/stalker/tropa.dmi'
	icon_state = "tropa"
	layer = 2
	overlay_priority = 2

var/global/list/TropaEdgeCache

/turf/stalker/floor/tropa/New()
	if(!TropaEdgeCache || !TropaEdgeCache.len)
		TropaEdgeCache = list()
		TropaEdgeCache.len = 10
		TropaEdgeCache[NORTH] = image('icons/stalker/tropa.dmi', "tropa_side_n", layer = 2.01)
		TropaEdgeCache[SOUTH] = image('icons/stalker/tropa.dmi', "tropa_side_s", layer = 2.01)
		TropaEdgeCache[EAST] = image('icons/stalker/tropa.dmi', "tropa_side_e", layer = 2.01)
		TropaEdgeCache[WEST] = image('icons/stalker/tropa.dmi', "tropa_side_w", layer = 2.01)

	spawn(1)
		var/turf/T
		for(var/i = -1, i <= 3, i++)
			if(!get_step(src, 2**i))
				continue
			if(overlay_priority > get_step(src, 2**i).overlay_priority)
				T = get_step(src, 2**i)
				if(T)
					T.overlays += TropaEdgeCache[2**i]
	return

/turf/stalker/floor/road
	name = "road"
	icon = 'icons/stalker/building_road.dmi'
	icon_state = "road2"
	layer = 2
	overlay_priority = 3

/turf/stalker/floor/road/New()
	if(prob(80))
		icon_state = "road2"
	else if (prob(50))
		icon_state = "road1"
	else if(prob(50))
		icon_state = "road3"
	else if (prob(50))
		icon_state = "road4"
	else
		icon_state = "road5"

/turf/stalker/floor/gryaz
	name = "dirt"
	icon = 'icons/stalker/zemlya.dmi'
	icon_state = "gryaz1"
	layer = 2.01
	overlay_priority = 4

var/global/list/GryazEdgeCache

/turf/stalker/floor/gryaz/New()
	icon_state = "gryaz[rand(1, 3)]"
	if(!GryazEdgeCache || !GryazEdgeCache.len)
		GryazEdgeCache = list()
		GryazEdgeCache.len = 10
		GryazEdgeCache[NORTH] = image('icons/stalker/zemlya.dmi', "gryaz_side_n", layer = 2.01)
		GryazEdgeCache[SOUTH] = image('icons/stalker/zemlya.dmi', "gryaz_side_s", layer = 2.01)
		GryazEdgeCache[EAST] = image('icons/stalker/zemlya.dmi', "gryaz_side_e", layer = 2.01)
		GryazEdgeCache[WEST] = image('icons/stalker/zemlya.dmi', "gryaz_side_w", layer = 2.01)

	spawn(1)
		var/turf/T
		for(var/i = -1, i <= 3, i++)
			if(!get_step(src, 2**i))
				continue
			if(overlay_priority > get_step(src, 2**i).overlay_priority)
				T = get_step(src, 2**i)
				if(T)
					T.overlays += GryazEdgeCache[2**i]
	return

/turf/stalker/floor/gryaz/gryaz2
	icon_state = "gryaz2"

/turf/stalker/floor/gryaz/gryaz3
	icon_state = "gryaz3"

/obj/structure/stalker/rails
	name = "rails"
	icon = 'icons/stalker/rails.dmi'
	icon_state = "sp"
	layer = 2.01
	anchored = 1
	density = 0
	opacity = 0

/turf/stalker/floor/plasteel
	name = "floor"
	icon = 'icons/stalker/floor.dmi'

/turf/stalker/floor/plasteel/plita
	icon_state = "plita1"

/turf/stalker/floor/plasteel/plita/New()
	icon_state = "plita[rand(1, 4)]"

/turf/stalker/floor/plasteel/plitochka
	icon_state = "plitka1"

/turf/stalker/floor/plasteel/plitochka/New()
	icon_state = "plitka[rand(1, 7)]"

/turf/stalker/floor/plasteel/plitka
	icon_state = "plitka_old1"

/turf/stalker/floor/plasteel/plitka/New()
	icon_state = "plitka_old[rand(1, 8)]"

/turf/stalker/floor/water
	name = "water"
	icon = 'icons/stalker/water.dmi'
	icon_state = "water"
	layer = TURF_LAYER
	overlay_priority = 5

/turf/stalker/floor/water/Entered(atom/movable/A)
	..()
	if(istype(A, /mob/living))
		var/mob/living/L = A
		L.update_top_overlay()

/turf/stalker/floor/water/Exited(atom/movable/A)
	..()
	if(istype(A, /mob/living))
		var/mob/living/L = A
		L.update_top_overlay()
		flick("water_splash_movement", src)

var/global/list/WaterEdgeCache

/turf/stalker/floor/water/New()
	if(!WaterEdgeCache || !WaterEdgeCache.len)
		WaterEdgeCache = list()
		WaterEdgeCache.len = 10
		WaterEdgeCache[NORTH] = image('icons/stalker/water.dmi', "water_north", layer = 2.01)
		WaterEdgeCache[SOUTH] = image('icons/stalker/water.dmi', "water_south", layer = 2.01)
		WaterEdgeCache[EAST] = image('icons/stalker/water.dmi', "water_east", layer = 2.01)
		WaterEdgeCache[WEST] = image('icons/stalker/water.dmi', "water_west", layer = 2.01)

	spawn(1)
		var/turf/T
		for(var/i = -1, i <= 3, i++)
			if(!get_step(src, 2**i))
				continue
			if(overlay_priority > get_step(src, 2**i).overlay_priority)
				T = get_step(src, 2**i)
				if(T)
					T.overlays += WaterEdgeCache[2**i]
	return

/turf/stalker/floor/wood
	icon = 'icons/stalker/floor.dmi'
	name = "floor"

/turf/stalker/floor/wood/brown
	icon_state = "wooden_floor"

/turf/stalker/floor/wood/grey
	icon_state = "wooden_floor2"

/turf/stalker/floor/wood/black
	icon_state = "wooden_floor3"

/turf/stalker/floor/wood/oldgor
	icon_state = "wood1"

/turf/stalker/floor/wood/oldvert
	icon_state = "woodd1"

/turf/stalker/floor/agroprom/beton
	name = "floor"
	icon = 'icons/stalker/pol_agroprom.dmi'
	icon_state = "beton1"

/turf/stalker/floor/agroprom/beton/New()
	icon_state = "beton[rand(1, 4)]"

/turf/stalker/floor/agroprom/gryaz
	name = "dirt"
	icon = 'icons/stalker/pol_agroprom.dmi'
	icon_state = "gryaz1"

/turf/stalker/floor/agroprom/gryaz/New()
	icon_state = "gryaz[rand(1, 11)]"

/turf/stalker/floor/lattice
	name = "lattice"
	icon = 'icons/stalker/floor.dmi'
	icon_state = "lattice1"

/turf/stalker/floor/lattice/New()
	icon_state = "lattice[rand(1, 4)]"