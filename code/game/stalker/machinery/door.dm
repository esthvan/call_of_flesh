/obj/machinery/door/airlock/stalker
	icon = 'icons/obj/doors/door_sidor.dmi'
	overlays_file = 'icons/obj/doors/door_sidor.dmi'
	autoclose = 0

/obj/machinery/door/airlock/stalker/New()
	..()

/obj/machinery/door/airlock/do_animate(animation)
	switch(animation)
//		if("opening")
//			update_icon(AIRLOCK_OPENING)
//		if("closing")
//			update_icon(AIRLOCK_CLOSING)
		if("deny")
			update_icon(AIRLOCK_DENY)
			sleep(6)
			update_icon(AIRLOCK_CLOSED)
			icon_state = "closed"

/obj/machinery/door/airlock/stalker/sidor
	name = "door"
	icon_state = "closed"

/obj/machinery/door/poddoor/sidor
	name = "door"
	desc = "A heavy duty blast door that opens mechanically."
	icon = 'icons/obj/doors/door_sidor.dmi'
	icon_state = "closed"
	id = null
	auto_close = 50 // Time in seconds to automatically close when opened, 0 if it doesn't.

/obj/machinery/door/poddoor/sidor/skadovsk
	icon = 'icons/obj/doors/door_sidor2.dmi'
	icon_state = "closed"

/obj/machinery/door/poddoor/sidor/skadovsk/special
	icon = 'icons/obj/doors/door_sidor2.dmi'
	icon_state = "closed"
	auto_close = 50

/obj/machinery/door/poddoor/sidor/skadovsk/special/open(ignorepower = 0)
	if(!round_start_time || world.time >= round_start_time + SKADOVSK_LOCKDOWN_TIMER)
		return ..()
	else
		say("Door will be locked for next [round((round_start_time + SKADOVSK_LOCKDOWN_TIMER - world.time)/600) + 1] min. due to psionic emission.")
		return 0