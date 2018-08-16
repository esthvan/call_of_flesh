var/global/list/obj/machinery/stalker/sidorpoint/cps = list()

/obj/machinery/stalker/sidorpoint
	name = "SIDORPOINT - null"
	desc = "����������&#255; �����."
	eng_desc = "Control point."
	icon = 'icons/stalker/device_new.dmi'
	icon_state = "radio_free"
	density = 1
	anchored = 1

	var/controlled_by		= null
	var/capturing_faction	= null
	var/control_percent		= 0

	var/unlocked_weapons	= null
	var/respawn_income		= 0 //������ 30 �����
	var/last_respawn_income	= 0

/obj/machinery/stalker/sidorpoint/New()
	..()
	name = "SIDORPOINT ([get_area(src).name])"
	cps += src
	update_desc()

/obj/machinery/stalker/sidorpoint/proc/update_desc()
	if(controlled_by)

		desc = "����� ��������&#255; ��� ��������� ����������� [get_rus_faction(controlled_by)] �� [control_percent]%"
		eng_desc = "Point is under [controlled_by] control by [control_percent]%"

	else

		if(control_percent)

			desc = "����� ��� ��������� ����������� [get_rus_faction(capturing_faction)] �� [control_percent]%"
			eng_desc = "Point is under [capturing_faction] control by [control_percent]%"

		else

			desc = "����� �������� ��&#255; �������"
			eng_desc = "This point can be captured."

/obj/machinery/stalker/sidorpoint/proc/update_icon_percent()
	switch(control_percent)
		if(100)
			icon_state = "radio_captured"
		if(80 to 99)
			icon_state = "radio_in_progress_80"
		if(60 to 80)
			icon_state = "radio_in_progress_60"
		if(40 to 60)
			icon_state = "radio_in_progress_40"
		if(20 to 40)
			icon_state = "radio_in_progress_20"
		if(1 to 20)
			icon_state = "radio_in_progress_0"
		if(0)
			icon_state = "radio_free"

/obj/machinery/stalker/sidorpoint/proc/check_invader()
	if(!capturing_faction)
		return

	for(var/mob/living/carbon/human/H in range(5, src))
		var/datum/data/record/sk = find_record("sid", H.sid, data_core.stalkers)
		if(sk && sk.fields["faction_s"] == capturing_faction)
			return

	capturing_faction = null

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

	if(sk.fields["faction_s"] == "Loners")
		say("No access.")
		return

	if(control_percent == 100 && controlled_by == sk.fields["faction_s"])
		say("[get_area(src).name] is already captured!")
		return

	if(capturing_faction && capturing_faction == sk.fields["faction_s"])
		say("[get_area(src).name] is already being captured!")
		return

	if(!do_after(user, 10, 1, src))
		return

	capturing_faction = sk.fields["faction_s"]
	say("[capturing_faction] started capturing [get_area(src).name]!")

	return

/obj/machinery/stalker/sidorpoint/process()

	update_desc()
	update_icon_percent()

	//if(controlled_by && last_respawn_income)

	check_invader()

	if(capturing_faction && !controlled_by)
		controlled_by = capturing_faction

	if(!capturing_faction)
		return

	if(controlled_by == capturing_faction)

		control_percent += 2

		if(control_percent >= 100)

			control_percent = 100
			say("[get_area(src).name] is captured  by [controlled_by]!")
			capturing_faction = null

	else

		control_percent -= 2

		if(control_percent <= 0)

			control_percent = 0
			say("[controlled_by] lost control of [get_area(src).name]!")
			controlled_by = capturing_faction

/obj/machinery/stalker/sidorpoint/ex_act(severity, target)
	return

/obj/machinery/stalker/sidormat/special
	desc = "An equipment vendor for experienced stalkers."
	var/obj/machinery/stalker/sidorpoint/SP = null
	var/SP_area = null

/obj/machinery/stalker/sidorpoint/proc/SendJobTotalPositions()
	if(control_percent < 100)
		return

	for(var/datum/job/J in SSjob.occupations)
		if(controlled_by == J.faction_s)
			J.total_positions += 3

/obj/machinery/stalker/sidormat/special/New()
	..()
	sleep(10)
	if(SP_area)
		for(var/turf/T in get_area_turfs(SP_area))
			SP = locate(/obj/machinery/stalker/sidorpoint)  in T
			if(SP)
				break

/obj/machinery/stalker/sidormat/special/interact(mob/living/carbon/human/H)
	if(!SP)
		SP = locate(/obj/machinery/stalker/sidorpoint) in get_area_turfs(SP_area)

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

	if(!SP.controlled_by || SP.control_percent < 100)
		say("No access.")
		return

	if(SP.controlled_by != sk.fields["faction_s"])
		say("No access.")
		return

	..()