/mob/living/gib(animation = 1)
	var/prev_lying = lying
	//src << "¬ы будете воскрешены через некоторое врем&#255;."
	death(1)
	//spawn(200)
	//	var/mob/new_player/NP = new()
	//	NP.ckey = last_ckey


	if(buckled)
		buckled.unbuckle_mob() //to update alien nest overlay.

	var/atom/movable/overlay/animate = setup_animation(animation, prev_lying)
	if(animate)
		gib_animation(animate)

	spawn_gibs()

	end_animation(animate) // Will qdel(src)

/mob/living/proc/spawn_gibs()
	gibs(loc, viruses)

/mob/living/proc/gib_animation(animate, flick_name = "gibbed")
	flick(flick_name, animate)

/mob/living/dust(animation = 0)
	death(1)
	var/atom/movable/overlay/animate = setup_animation(animation, 0)
	if(animate)
		dust_animation(animate)

	spawn_dust()
	end_animation(animate)

/mob/living/proc/spawn_dust()
	new /obj/effect/decal/cleanable/ash(loc)

/mob/living/proc/dust_animation(animate, flick_name = "")
	flick(flick_name, animate)

/mob/living/death(gibbed)
	let_justice_be_done(src)

	eye_blind = max(eye_blind, 1)
	timeofdeath = world.time

	living_mob_list -= src
	if(!gibbed)
		dead_mob_list += src
	else if(buckled)
		buckled.unbuckle_mob()


	if(src.ckey)
		var/message ="[src]([src.ckey]) "
		var/whereLink=null
		if(gibbed)
			message+="body has been destroyed"
			whereLink = "<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[src.x];Y=[src.y];Z=[src.z]'>JMP</a>"
		else
			message+="has died"
			var/ref_mob = "\ref[src]"
			whereLink = "<A HREF='?_src_=holder;adminplayerobservefollow=[ref_mob]'>FLW</A>"
		message_admins("[message] in [src.loc.loc] [whereLink]")

/mob/living/proc/setup_animation(animation, prev_lying)
	var/atom/movable/overlay/animate = null
	notransform = 1
	canmove = 0
	icon = null
	invisibility = 101
	alpha = 0

	if(!prev_lying && animation)
		animate = new(loc)
		animate.icon_state = "blank"
		animate.icon = 'icons/mob/mob.dmi'
		animate.master = src
	return animate

/mob/living/proc/end_animation(animate)
	if(!animate)
		qdel(src)
	else
		spawn(15)
			if(animate)		qdel(animate)
			if(src)			qdel(src)