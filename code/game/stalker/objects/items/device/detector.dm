/obj/item/device/detector
	name = "Detector"
	desc = "Самый дешевый и малоэффективный детектор."
	icon = 'icons/stalker/device_new.dmi'
	icon_state = "echo_off"
	var/icon_state_inactive = "echo_off"
	var/icon_state_active = "echo_on"
	var/icon_state_null = "echo_null"
	item_state = "electronic"
	w_class = 1
	var/atom/target = null
	var/min_dist = 8
	var/on = 0
	var/level_s = 0
	var/list/arts = list()
	var/mob/living/carbon/human/user = null
	var/cooldown = 0
	var/kostil = 0
	var/list/fakearts = list()

/obj/item/device/detector/blink
	name = "echo"
	desc = "Устаревша&#255; модель детектора аномальной активности. Реагирует звуковым сигналом на попадание аномальных частичек в специальную камеру при приближении к аномали&#255;м. Кроме того, может регистрировать присутствие артефактов и измер&#255;ть рассто&#255;ние до ближайшего из них — рассто&#255;ние до артефакта определ&#255;етс&#255; периодичностью подаваемого звукового сигнала. Режим поиска артефактов включаетс&#255; подн&#255;тием крышки-антенны на лицевой панели прибора. Ввиду простоты конструкции способен находить только самые распространённые артефакты."
	icon_state_inactive = "echo_off"
	icon_state_active = "echo_on"
	icon_state_null = "echo_null"
	//level_s = 1
	level_s = 2

/obj/item/device/detector/bear
	name = "bear"
	desc = "Детектор аномальной активности прошлого поколени&#255;. Снабжён локатором аномальных образований и светодиодным табло дл&#255; отображени&#255; направлени&#255; на артефакт, причём способен не только обнаруживать артефакты, но и определ&#255;ть рассто&#255;ни&#255; до них. Режим поиска артефактов включаетс&#255; подн&#255;тием крышки-антенны на лицевой стороне прибора. К сожалению, уже несколько устаревший список обнаруживаемых артефактов вшит в прибор намертво – на аппаратном уровне."
	icon_state = "bear_off"
	icon_state_inactive = "bear_off"
	icon_state_active = "bear_on"
	icon_state_null = "bear_null"
	//level_s = 2
	level_s = 4 //Пока нет велеса, медведь будет обнаруживать все артефакты

/obj/item/device/detector/veles
	name = "veles"
	desc = "Детектор-сканер нового поколени&#255;, используемый учёными. Благодар&#255; трём усовершенствованным регистрационным камерам расположение артефакта относительно детектора отображаетс&#255; на специальном экране. Способен фиксировать излучение и присутствие аномалий. Режим поиска артефактов включаетс&#255; подн&#255;тием индикатора-табло на лицевой стороне прибора; в данном режиме способен обнаруживать все известные науке артефакты."
	icon_state = "veles_off"
	icon_state_inactive = "veles_off"
	icon_state_active = "veles_on"
	icon_state_null = "veles_null"
	level_s = 4

/obj/item/device/detector/attack_self(mob/user)
	if(!on)
		if(world.time > cooldown + 5)
			playsound(user, "sound/stalker/detector/detector_draw.ogg", 50, 1, randfreq = 0)
			on = 1
			icon_state = icon_state_null
			if(!kostil)
				Scan()
	else
		playsound(user, "sound/stalker/detector/detector_draw.ogg", 50, 1, randfreq = 0)
		on = 0
		cooldown = world.time
		stop()

/obj/item/device/detector/proc/Scan()
	kostil = 1

	if(!on)
		kostil = 0
		return

	if(src.loc && isliving(src.loc))
		user = src.loc

	if(!user || !user.client)
		kostil = 0
		on = 0
		stop()
		return

	if(!user.get_item_by_slot(slot_r_hand) == src && !user.get_item_by_slot(slot_l_hand) == src)
		kostil = 0
		on = 0
		stop()
		return

	min_dist = 8
	target = null

	for(var/obj/item/weapon/artifact/a in range(7, user))
		if(level_s >= a.level_s)
			arts += a
			if(get_dist(user, a) < min_dist)
				min_dist = get_dist(user, a)
				target = a

	if(min_dist == 0)
		min_dist = 1

	for (var/obj/item/weapon/artifact/a in arts)
		if(a in range(1, user))
			if(isnull(a.phantom) && a.invisibility != 0)
				user.handle_artifact(a)
				//fakearts += a.phantom
		else
			if(!isnull(a.phantom))
				arts -= a
				qdel(a.phantom)
				a.phantom = null

	sleep(2 * min_dist)

	if(!on)
		kostil = 0
		stop()
		return

	if(!target)
		kostil = 0
		Scan()
		return

	dir = get_dir(user, target)
	playsound(user, "sound/stalker/detector/contact_1.ogg", 50, 1, randfreq = 0)
	icon_state = icon_state_active

	sleep(1)

	if(!on)
		kostil = 0
		stop()
		return

	icon_state = icon_state_null

	kostil = 0
	Scan()
	return

/obj/item/device/detector/dropped(mob/user)
	. = ..()
	on = 0
	stop()

/obj/item/device/detector/proc/stop()
	target = null
	icon_state = icon_state_inactive
	src.user = null
	//SSobj.processing.Remove(src)

	for (var/obj/item/weapon/artifact/a in arts)
		if(a.invisibility != 0)
			if(!isnull(a.phantom))
				qdel(a.phantom)
				a.phantom = null
		arts -= a

/mob/living/carbon/proc/handle_artifact(var/obj/item/weapon/artifact/a)
	new /obj/effect/artifact/fakeart(a, src)

/obj/effect/artifact
	invisibility = INVISIBILITY_OBSERVER
	var/mob/living/carbon/target = null

/obj/effect/artifact/fakeart
	var/obj/effect/fakeart/f = null

/obj/effect/artifact/fakeart/New(var/obj/item/weapon/artifact/a, var/mob/living/carbon/T)
	target = T
	f = new(a)
	a.phantom = f

	T << f.currentimage
	qdel(src)

/obj/effect/fakeart
	icon = null
	icon_state = null
	name = ""
	desc = ""
	density = 0
	anchored = 1
	opacity = 0
	var/image/currentimage = null
	var/image/up
	var/obj/item/weapon/artifact/my_target = null

/obj/effect/fakeart/New(var/obj/item/weapon/artifact/a)
	..()
	name = a.name
	desc = a.desc
	loc = a.loc
	my_target = a
	up = image(a)
	currentimage = new /image(up,src)

/obj/effect/fakeart/attack_hand(mob/user)
	if(user.stat || user.restrained() || !Adjacent(user) || user.stunned || user.weakened || user.lying)
		return

	if(user.get_active_hand() == null) // Let me know if this has any problems -Yota
		user.UnarmedAttack(my_target)
		my_target.invisibility = 0
		qdel(src)
		spawned_artifacts.Remove(my_target)

	if(istype(user, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		if(H.wear_id)
			if(istype(H.wear_id, /obj/item/device/stalker_pda))
				var/datum/data/record/sk = find_record("sid", H.sid, data_core.stalkers)
				//var/obj/item/device/stalker_pda/KPK = H.wear_id
				if(sk)
					sk.fields["rating"] += (2 ** my_target.level_s) * 50

/obj/effect/artifact/simple
	name = "artifact"
	icon = null
	icon_state = null
	opacity = 0
	var/image_icon = 'icons/stalker/artifacts.dmi'
	var/image_state = "meduza"
	var/px = 0
	var/py = 0
	var/image/current_image = null
	var/image_layer = MOB_LAYER
	var/active = 1
	var/mob/living/carbon/human/my_target = null

/obj/effect/artifact/simple/New(var/obj/item/weapon/artifact/a, var/mob/living/carbon/T)
	target = T
	icon = a.icon
	icon_state = a.icon_state
	return

/obj/effect/artifact/simple/proc/GetImage(var/obj/item/weapon/artifact/a)
	var/image/I = image(a.icon, a.loc, a.icon_state, a.layer, dir=src.dir)
	I.pixel_x = px
	I.pixel_y = py
	return I

/obj/effect/artifact/simple/proc/Show(var/obj/item/weapon/artifact/a, update=1)
	if(active)
		if(target.client) target.client.images.Remove(current_image)
		if(update)
			current_image = GetImage(a)
		if(target.client) target.client.images |= current_image

/obj/effect/artifact/simple/Destroy()
	if(target.client) target.client.images.Remove(current_image)
	active = 0
	return ..()