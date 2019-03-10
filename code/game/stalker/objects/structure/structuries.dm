/obj/structure/table/stalker
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/obj/structure/table/stalker)
	pass_flags = LETPASSTHROW

/obj/structure/table/stalker/wood
	desc = "Обычный дерев&#255;нный слегка пошарпанный стол."
	eng_desc = "Simple table."
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

/obj/structure/stalker/okno
	name = "Window"
	desc = "Старое дерев&#255;нное окно."
	eng_desc = "Old wooden window."
	icon = 'icons/stalker/decor2.dmi'
	pass_flags = LETPASSTHROW
	density = 0
	opacity = 0
	//var/unpassable = 0

/obj/structure/stalker/okno/window1
	icon_state = "okno1"

/obj/structure/stalker/okno/window2
	icon_state = "okno2"

/obj/structure/stalker/okno/window3
	icon_state = "okno3"

/obj/structure/stalker/okno/window4
	icon_state = "okno4"