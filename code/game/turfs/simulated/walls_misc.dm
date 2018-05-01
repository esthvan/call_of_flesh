/turf/simulated/wall/cult
	name = "wall"
	desc = "The patterns engraved on the wall seem to shift as you try to focus on them. You feel sick."
	icon = 'icons/turf/walls/cult_wall.dmi'
	icon_state = "cult"
	walltype = "cult"
	builtin_sheet = null
	canSmoothWith = null

/turf/simulated/wall/cult/New()
	PoolOrNew(/obj/effect/overlay/temp/cult/turf, src)
	..()

/turf/simulated/wall/cult/break_wall()
	new /obj/effect/decal/cleanable/blood(src)
	return (new /obj/structure/cultgirder(src))

/turf/simulated/wall/cult/devastate_wall()
	new /obj/effect/decal/cleanable/blood(src)
	new /obj/effect/decal/remains/human(src)

/turf/simulated/wall/cult/narsie_act()
	return

/turf/simulated/wall/vault
	icon = 'icons/turf/walls.dmi'
	icon_state = "rockvault"

/turf/simulated/wall/ice
	icon = 'icons/turf/walls/icedmetal_wall.dmi'
	icon_state = "iced"
	desc = "A wall covered in a thick sheet of ice."
	walltype = "iced"
	canSmoothWith = null
	hardness = 35
	slicing_duration = 150 //welding through the ice+metal

/turf/simulated/wall/rust
	name = "rusted wall"
	desc = "A rusted metal wall."
	icon = 'icons/turf/walls/rusty_wall.dmi'
	icon_state = "arust"
	walltype = "arust"
	hardness = 45

/turf/simulated/wall/r_wall/rust
	name = "rusted reinforced wall"
	desc = "A huge chunk of rusted reinforced metal."
	icon = 'icons/turf/walls/rusty_reinforced_wall.dmi'
	icon_state = "rrust"
	walltype = "rrust"
	hardness = 15

/turf/simulated/wall/stalker
	canSmoothWith = list(
	/turf/simulated/wall/stalker/beton,
	/turf/simulated/wall/stalker/bricks,
	/turf/simulated/wall/stalker/bricks_yellow,
	/turf/simulated/wall/stalker/bricks_white,
	/turf/simulated/wall/stalker/beton_agro
	///obj/structure/stalker/okno/whitebrick/odin,
	///obj/structure/stalker/okno/whitebrick/dva,
	///obj/structure/stalker/okno/whitebrick/tri,
	///obj/structure/stalker/okno/whitebrick/double1,
	///obj/structure/stalker/okno/whitebrick/double2,
	///obj/structure/stalker/okno/redbrick/odin,
	///obj/structure/stalker/okno/redbrick/dva,
	///obj/structure/stalker/okno/redbrick/double1,
	///obj/structure/stalker/okno/redbrick/double2)
	)
	smooth = SMOOTH_TRUE

/turf/simulated/wall/stalker/beton
	name = "wall"
	desc = "A huge chunk of wall"
	icon = 'icons/turf/walls/beton_tg.dmi'
	icon_state = "beton"
	walltype = "beton"
	canSmoothWith = list(
	/turf/simulated/wall/stalker/beton,
	/turf/simulated/wall/stalker/beton_agro
	)

/turf/simulated/wall/stalker/bricks
	name = "wall"
	desc = "A huge chunk of wall"
	icon = 'icons/turf/walls/bricks_tg.dmi'
	icon_state = "bricks"
	walltype = "brick"
	canSmoothWith = list(
	/turf/simulated/wall/stalker/bricks
	)

/turf/simulated/wall/stalker/bricks_yellow
	name = "wall"
	desc = "A huge chunk of wall"
	icon = 'icons/turf/walls/bricks_tg_yellow.dmi'
	icon_state = "bricks"
	walltype = "yellowbrick"
	canSmoothWith = list(
	/turf/simulated/wall/stalker/bricks_yellow
	)

/turf/simulated/wall/stalker/bricks_white
	name = "wall"
	desc = "A huge chunk of wall"
	icon = 'icons/turf/walls/bricks_tg_white.dmi'
	icon_state = "bricks"
	walltype = "whitebrick"
	canSmoothWith = list(
	/turf/simulated/wall/stalker/bricks_white
	)

/turf/simulated/wall/stalker/beton_agro
	name = "wall"
	desc = "A huge chunk of wall"
	icon = 'icons/turf/walls/beton_w_tg.dmi'
	icon_state = "beton"
	walltype = "betonagro"
	canSmoothWith = list(
	/turf/simulated/wall/stalker/beton_agro
	)

/turf/simulated/wall/shuttle
	name = "wall"
	icon = 'icons/turf/shuttle.dmi'
	icon_state = "wall1"
	walltype = "shuttle"
	smooth = SMOOTH_FALSE

/turf/simulated/wall/stalker/ship
	name = "hull"
	desc = "A huge chunk of hull"
	icon = 'icons/stalker/barzha.dmi'
	icon_state = "hull"
	walltype = "barzha"
	canSmoothWith = list(/turf/simulated/wall/stalker/ship)

//sub-type to be used for interior shuttle walls
//won't get an underlay of the destination turf on shuttle move
/turf/simulated/wall/shuttle/interior/copyTurf(turf/T)
	if(T.type != type)
		T.ChangeTurf(type)
		if(underlays.len)
			T.underlays = underlays
	if(T.icon_state != icon_state)
		T.icon_state = icon_state
	if(T.icon != icon)
		T.icon = icon
	if(T.color != color)
		T.color = color
	if(T.dir != dir)
		T.dir = dir
	T.transform = transform
	return T

/turf/simulated/wall/shuttle/copyTurf(turf/T)
	. = ..()
	T.transform = transform

//why don't shuttle walls habe smoothwall? now i gotta do rotation the dirty way
/turf/simulated/wall/shuttle/shuttleRotate(rotation)
	var/matrix/M = transform
	M.Turn(rotation)
	transform = M