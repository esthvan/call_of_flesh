/obj/item/weapon/storage/stalker/shkaf64
	name = "Shkaf"
	desc = "Большой дерев&#255;нный шкаф. Красивый, но в некоторых местах стерс&#255; и облез, на стекле пошли трещины. Несмотр&#255; на это, кажется, будто всего пару минут назад внутри сто&#255;л хрустальный бабушкин сервиз."
	icon = 'icons/stalker/decorations_32x64.dmi'
	icon_state = "shkaf64"
	density = 1
	anchored = 1

/obj/item/weapon/storage/stalker/shkaf64/attack_hand(mob/user)
	return attack_self(user)

/obj/structure/table/stalker
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/obj/structure/table/stalker)
	pass_flags = LETPASSTHROW
/*
/obj/structure/table/stalker/CanPass(atom/movable/mover, turf/target, height=0)//So bullets will fly over and stuff.
	if(istype(mover, /obj/item/projectile))
		var/obj/item/projectile/proj = mover
		if(proj.firer && Adjacent(proj.firer))
			return 1
		if(!unpassable)
			return 1
		return 0
	else
		return 0
*/

/obj/structure/table/stalker/wood
	desc = "Обычный дерев&#255;нный слегка пошарпанный стол."
	icon = 'icons/obj/smooth_structures/stol_stalker.dmi'
	icon_state = "stol"
	deconstructable = 0
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/obj/structure/table/stalker/wood)

/obj/structure/table/stalker/wood/bar
	desc = "Самодельна&#255; барна&#255; стойка"
	icon = 'icons/obj/smooth_structures/stol_stalker_bar.dmi'
	icon_state = "bar"
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/obj/structure/table/stalker/wood/bar)

/obj/structure/table/stalker/wood/bar100rentgen
	desc = "Качественна&#255; барна&#255; стойка"
	icon = 'icons/stalker/structure/bartables.dmi'
	icon_state = "table"
	smooth = SMOOTH_FALSE

/obj/item/weapon/storage/stalker/plita
	name = "stove"
	desc = "Ржава&#255; и очень стара&#255; газова&#255; плита. Где-то еще можно различить слой засохшего жира вперемешку с гр&#255;зью и пылью."
	icon = 'icons/stalker/decor.dmi'
	icon_state = "gazovaya_plita"
	density = 1
	anchored= 1

/obj/item/weapon/storage/stalker/plita/attack_hand(mob/user)
	return attack_self(user)

/obj/item/weapon/storage/stalker/pech
	name = "furnace"
	desc = "Стара&#255; печь."
	icon = 'icons/stalker/decor.dmi'
	icon_state = "pech"
	anchored= 1

/obj/item/weapon/storage/stalker/pech/attack_hand(mob/user)
	return attack_self(user)

/obj/structure/stalker/okno
	name = "Window"
	desc = "Старое дерев&#255;нное окно."
	icon = 'icons/stalker/decor2.dmi'
	pass_flags = LETPASSTHROW
	density = 0
	opacity = 0
	var/unpassable = 0

/obj/structure/stalker/okno/window1
	icon_state = "okno1"

/obj/structure/stalker/okno/window2
	icon_state = "okno2"

/obj/structure/stalker/okno/window3
	icon_state = "okno3"

/obj/structure/stalker/okno/window4
	icon_state = "okno4"

/*
/obj/structure/stalker/okno/CanPass(atom/movable/mover, turf/target, height=0)
	if(height==0)
		return 1

	if(istype(mover) && mover.checkpass(PASSTABLE))
		return 1
	if(locate(/obj/structure/stalker/okno) in get_turf(mover))
		return 1
	else
		return !density
*/

/*
/obj/structure/stalker/okno/whitebrick/odin
	icon_state = "whitebrick1"

/obj/structure/stalker/okno/whitebrick/dva
	icon_state = "whitebrick2"

/obj/structure/stalker/okno/whitebrick/tri
	icon_state = "whitebrickarm"

/obj/structure/stalker/okno/whitebrick/double1
	icon_state = "whitebrickdbl1"

/obj/structure/stalker/okno/whitebrick/double2
	icon_state = "whitebrickdbl2"

/obj/structure/stalker/okno/whitebrick/factorio
	icon_state = "whitebrick3"

/obj/structure/stalker/okno/redbrick/odin
	icon_state = "redbrick1"

/obj/structure/stalker/okno/redbrick/dva
	icon_state = "redbrick2"

/obj/structure/stalker/okno/redbrick/double1
	icon_state = "redbrickdbl1"

/obj/structure/stalker/okno/redbrick/double2
	icon_state = "redbrickdbl2"

/obj/structure/stalker/okno/yellowbrick/yellowbrick1
	icon_state = "yellowbrick1"
	opacity = 1
*/