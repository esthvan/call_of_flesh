/obj/machinery/stalker/sidorpoint
	name = "SIDORPOINT 500000 - null"
	desc = "Контрольна&#255; точка."
	eng_desc = "Control point."
	icon_state = "radio"
	density = 1
	anchored = 1

	var/controlled_by		= null
	var/capturing_faction	= null
	var/control_percent		= 0

	var/unlocked_weapons	= null
	var/respawn_income		= 0 //каждые 30 минут
	var/last_respawn_income	= 0

/obj/machinery/stalker/sidorpoint/New()
	..()
	name = "SIDORPOINT 500000 - [get_area(src).name]"
	update_desc()

/obj/machinery/stalker/sidorpoint/proc/update_desc()
	if(controlled_by)

		desc = "Точка находитс&#255; под контролем группировки [get_rus_faction(controlled_by)] на [control_percent]%"
		eng_desc = "Point is under [controlled_by] control by [control_percent]%"

	else

		if(control_percent)

			desc = "Точка под контролем группировки [get_rus_faction(capturing_faction)] на [control_percent]%"
			eng_desc = "Point is under [capturing_faction] control by [control_percent]%"

		else

			desc = "Точка свободна дл&#255; захвата"
			eng_desc = "This point can be captured."

/obj/machinery/stalker/sidorpoint/attack_hand(mob/user)
	if(..())
		return

	if(!istype(user,/mob/living/carbon/human))
		say("You are not a human.")
		return

	var/mob/living/carbon/human/H = user

	if(!istype(H.wear_id, /obj/item/device/stalker_pda))
		say("Put on your KPK.")
		return

	var/datum/data/record/sk = find_record("sid", H.sid, data_core.stalkers)
	var/obj/item/device/stalker_pda/KPK = H.wear_id

	if(!sk || !KPK.owner)
		say("Activate your KPK profile.")
		return

	if(KPK.owner != H)
		say("No access.")
		return

	if(control_percent == 100 && controlled_by == sk.fields["faction_s"])
		say("[get_area(src).name] is already captured!")
		return

	if(capturing_faction && capturing_faction == sk.fields["faction_s"])
		say("[get_area(src).name] is already being captured!")
		return

	capturing_faction = sk.fields["faction_s"]
	say("[capturing_faction] started capturing [get_area(src).name]!")

	return

/obj/machinery/stalker/sidorpoint/process()
	update_desc()

	//if(controlled_by && last_respawn_income)

	if(!capturing_faction)
		return

	if(!controlled_by)
		controlled_by = capturing_faction

	if(controlled_by == capturing_faction)

		control_percent += 2

		if(control_percent >= 100)

			control_percent = 100
			say("[get_area(src).name] captured  by [controlled_by]")
			capturing_faction = null

	else

		control_percent -= 2

		if(control_percent <= 0)

			control_percent = 0
			say("[controlled_by] lost control of [get_area(src).name].")
			controlled_by = capturing_faction

/obj/machinery/stalker/sidorpoint/ex_act(severity, target)
	return