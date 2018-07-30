/obj/effect/overlay
	name = "overlay"
	unacidable = 1
	var/i_attached//Added for possible image attachments to objects. For hallucinations and the like.

/obj/effect/overlay/singularity_act()
	return

/obj/effect/overlay/singularity_pull()
	return

/obj/effect/overlay/beam//Not actually a projectile, just an effect.
	name="beam"
	icon='icons/effects/beam.dmi'
	icon_state="b_beam"
	var/atom/BeamSource

/obj/effect/overlay/beam/New()
	..()
	spawn(10) qdel(src)

/obj/effect/overlay/temp
	icon = 'icons/effects/effects.dmi'
	icon_state = "nothing"
	anchored = 1
	layer = 4.1
	mouse_opacity = 0
	var/duration = 10
	var/randomdir = 1

/obj/effect/overlay/temp/Destroy()
	..()
	return QDEL_HINT_PUTINPOOL

/obj/effect/overlay/temp/New()
	if(randomdir)
		dir = pick(cardinal)
	flick("[icon_state]", src) //Because we might be pulling it from a pool, flick whatever icon it uses so it starts at the start of the icon's animation.
	spawn(duration)
		qdel(src)

/obj/effect/overlay/temp/impact_effect
	icon_state = "impact_bullet"
	duration = 5

/obj/effect/overlay/temp/impact_effect/New(loc, atom/target, obj/item/projectile/P)
	if(target == P.original) //the projectile hit the target originally clicked
		pixel_x = P.p_x + target.pixel_x - 16 + rand(-4,4)
		pixel_y = P.p_y + target.pixel_y - 16 + rand(-4,4)
	else
		pixel_x = target.pixel_x + rand(-4,4)
		pixel_y = target.pixel_y + rand(-4,4)
	..()

/obj/item/projectile
	var/impact_effect_type

/obj/effect/overlay/temp/dir_setting
	randomdir = FALSE

/obj/effect/overlay/temp/dir_setting/New(mapload, set_dir)
	if(set_dir)
		setDir(set_dir)
	. = ..()

/obj/effect/overlay/temp/dir_setting/firing_effect
	icon = 'icons/effects/effects.dmi'
	icon_state = "firing_effect"
	duration = 2

/obj/effect/overlay/temp/dir_setting/firing_effect/setDir(newdir)
	switch(newdir)
		if(NORTH)
			layer = 3
			pixel_x = rand(-3,3)
			pixel_y = rand(4,6)
		if(SOUTH)
			pixel_x = rand(-3,3)
			pixel_y = rand(-1,1)
		else
			pixel_x = rand(-1,1)
			pixel_y = rand(-1,1)
	..()

/obj/effect/overlay/temp/dir_setting/bloodsplatter
	icon = 'icons/effects/blood.dmi'
	icon_state = "splatter1"
	duration = 5
	randomdir = FALSE
	layer = 3

/obj/effect/overlay/temp/dir_setting/bloodsplatter/New(mapload, set_dir)
	if(set_dir in diagonals)
		icon_state = "splatter[pick(1, 2, 6)]"
	else
		icon_state = "splatter[pick(3, 4, 5)]"

	. = ..()

	var/target_pixel_x = 0
	var/target_pixel_y = 0
	switch(set_dir)
		if(NORTH)
			target_pixel_y = 16
		if(SOUTH)
			target_pixel_y = -16
			layer = 5
		if(EAST)
			target_pixel_x = 16
		if(WEST)
			target_pixel_x = -16
		if(NORTHEAST)
			target_pixel_x = 16
			target_pixel_y = 16
		if(NORTHWEST)
			target_pixel_x = -16
			target_pixel_y = 16
		if(SOUTHEAST)
			target_pixel_x = 16
			target_pixel_y = -16
			layer = 5
		if(SOUTHWEST)
			target_pixel_x = -16
			target_pixel_y = -16
			layer = 5
	animate(src, pixel_x = target_pixel_x, pixel_y = target_pixel_y, alpha = 0, time = duration)

/////////////////////////////////

/obj/effect/overlay/temp/cult
	randomdir = 0
	duration = 10

/obj/effect/overlay/temp/cult/sac
	name = "maw of Nar-Sie"
	icon_state = "sacconsume"

/obj/effect/overlay/temp/cult/turf
	name = "unholy glow"
	icon_state = "wallglow"
	layer = 2.01

/obj/effect/overlay/temp/cult/turf/floor
	icon_state = "floorglow"
	duration = 5


/obj/effect/overlay/temp/revenant
	name = "spooky lights"
	icon_state = "purplesparkles"

/obj/effect/overlay/temp/revenant/cracks
	name = "glowing cracks"
	icon_state = "purplecrack"
	duration = 6


/obj/effect/overlay/temp/emp
	name = "emp sparks"
	icon_state = "empdisable"

/obj/effect/overlay/temp/emp/pulse
	name = "emp pulse"
	icon_state = "emp pulse"
	duration = 8
	randomdir = 0


/obj/effect/overlay/palmtree_r
	name = "Palm tree"
	icon = 'icons/misc/beach2.dmi'
	icon_state = "palm1"
	density = 1
	layer = 5
	anchored = 1

/obj/effect/overlay/palmtree_l
	name = "Palm tree"
	icon = 'icons/misc/beach2.dmi'
	icon_state = "palm2"
	density = 1
	layer = 5
	anchored = 1

/obj/effect/overlay/coconut
	name = "Coconuts"
	icon = 'icons/misc/beach.dmi'
	icon_state = "coconuts"