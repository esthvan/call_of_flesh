//In this file: C4 and Syndicate Bombs

/obj/item/weapon/c4
	name = "C-4"
	desc = "Used to put holes in specific areas without too much extra hole."
	gender = PLURAL
	icon = 'icons/obj/assemblies.dmi'
	icon_state = "plastic-explosive0"
	item_state = "plasticx"
	flags = NOBLUDGEON
	w_class = 2
	origin_tech = "syndicate=2"
	var/datum/wires/explosive/c4/wires = null
	var/timer = 10
	var/atom/target = null
	var/open_panel = 0
	var/image_overlay = null

/obj/item/weapon/c4/New()
	wires = new(src)
	image_overlay = image('icons/obj/assemblies.dmi', "plastic-explosive2")
	..()

/obj/item/weapon/c4/Destroy()
	qdel(wires)
	wires = null
	target = null
	return ..()

/obj/item/weapon/c4/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] activates the [src.name] and holds it above \his head! It looks like \he's going out with a bang!</span>")
	var/message_say = "Аллах Акбар!"
	if(user.mind)
		if(user.mind.special_role)
			var/role = lowertext(user.mind.special_role)
			if(role == "traitor" || role == "syndicate")
				message_say = "За Синдикат!"
			else if(role == "changeling")
				message_say = "За Улей!"
			else if(role == "cultist")
				message_say = "За Нар-Си!"
			else if(role == "revolutionary" || role == "head revolutionary")
				message_say = "Да здравствует революци&#255;!"
			else if(user.mind.gang_datum)
				message_say = "[uppertext(user.mind.gang_datum.name)] RULES!"
	user.say(message_say)
	target = user
	message_admins("[key_name_admin(user)](<A HREF='?_src_=holder;adminmoreinfo=\ref[user]'>?</A>) (<A HREF='?_src_=holder;adminplayerobservefollow=\ref[user]'>FLW</A>) suicided with [src.name] at ([x],[y],[z] - <A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[x];Y=[y];Z=[z]'>JMP</a>)",0,1)
	message_admins("[key_name(user)] suicided with [src.name] at ([x],[y],[z])")
	sleep(10)
	explode(get_turf(user))
	user.gib()

/obj/item/weapon/c4/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/weapon/screwdriver))
		open_panel = !open_panel
		user << "<span class='notice'>You [open_panel ? "open" : "close"] the wire panel.</span>"
	else if(wires.IsInteractionTool(I))
		wires.Interact(user)
	else
		..()

/obj/item/weapon/c4/attack_self(mob/user)
	var/newtime = input(usr, "Please set the timer.", "Timer", 10) as num
	if(user.get_active_hand() == src)
		newtime = Clamp(newtime, 10, 60000)
		timer = newtime
		user << "Timer set for [timer] seconds."

/obj/item/weapon/c4/afterattack(atom/movable/AM, mob/user, flag)
	if (!flag)
		return
//	if (istype(AM) || istype(AM, /obj/item/weapon/storage/))
	if (istype(AM, /obj/item/weapon/storage/) || istype(AM, /turf/simulated/wall/shuttle))
		return
	if(loc == AM)
		return
	if(ismob(AM))
		add_logs(user, AM, "tried to plant explosives on", object="[name]")
		user.visible_message("<span class='warning'>[user.name] пытаетс&#255; прикрепить взрывчатку на [AM.name]!</span>")

	user << "<span class='notice'>You start planting the bomb...</span>"

	if(do_after(user, 50, target = AM))
		if(!user.unEquip(src))
			return
		src.target = AM
		loc = null

		message_admins("[key_name_admin(user)](<A HREF='?_src_=holder;adminmoreinfo=\ref[user]'>?</A>) (<A HREF='?_src_=holder;adminplayerobservefollow=\ref[user]'>FLW</A>) planted [src.name] on [target.name] at ([target.x],[target.y],[target.z] - <A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[target.x];Y=[target.y];Z=[target.z]'>JMP</a>) with [timer] second fuse",0,1)
		log_game("[key_name(user)] planted [src.name] on [target.name] at ([target.x],[target.y],[target.z]) with [timer] second fuse")

		target.overlays += image_overlay
		user << "<span class='notice'>You plant the bomb. Timer counting down from [timer].</span>"
		spawn(timer*10)
			explode()
			if (ismob(target))
				var/mob/T = target
				T.gib()

/obj/item/weapon/c4/proc/explode()
	if(qdeleted(src))
		return
	var/turf/location

	if(!target)
		target = get_atom_on_turf(src)
	if(!target)
		target = src
	if(location)
		explosion(location, -1, -1, 4, 4)

	if(target)
		if (istype(target, /turf/simulated/wall))
			target:dismantle_wall(1)
		else
			target.ex_act(1)

	if(target)
		if(!qdeleted(target))
			location = get_turf(target)
			target.overlays -= image_overlay
	else
		location = get_turf(src)
	if(location)
		location.ex_act(2, target)
		explosion(location,0,0,3)
	qdel(src)

/obj/item/weapon/c4/attack(mob/M, mob/user, def_zone)
	return
