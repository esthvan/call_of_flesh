/datum/game_mode/monolith_revenge
	name = "monolith revenge"
	config_tag = "monolithwar"
	required_players = 0

	var/winning_faction = null
	var/finished = 0
	var/check_counter = 0
	var/start_hold_time = 0
	var/list/control_table = list()
	//reroll_friendly = 1

/datum/game_mode/monolith_revenge/announce()
	world << "<B>The current game mode is - Monolith Revenge!</B>"
	world << "<B>Monolith sent forces to capture Backwater! If they will control over 75% of control points for 15 minutes, they win the round!</B>"
	world << "<B><font color='green'>Due to psionic emission Skadovsk exit will be locked for next [round(SKADOVSK_LOCKDOWN_TIMER/600)] min.</font></B>"

/datum/game_mode/monolith_revenge/pre_setup()
	for(var/datum/job/J in SSjob.occupations)
		if(J.faction_s == "Monolith")
			J.activated = 1
	for(var/obj/machinery/stalker/sidorpoint/cp in cps)
		if(cp.path_ending == "ranger")
			cp.controlled_by = "Monolith"
			cp.control_percent = 100
	for(var/datum/job/J in SSjob.occupations)
		if(J.faction_s == "Monolith")
			J.activated = 1
	return 1

/datum/game_mode/monolith_revenge/post_setup()
	..()

/datum/game_mode/monolith_revenge/process()
	check_counter++
	if(check_counter >= 5)
		if(!finished)
			check_points()
			//ticker.mode.check_win()
		check_counter = 0
	return 0

/datum/game_mode/monolith_revenge/proc/check_points()
	control_table = list()

	var/antag_base_check = 0
	for(var/obj/machinery/stalker/sidorpoint/cp in cps)
		if(cp.control_percent >= 75)
			if((cp.path_ending == "ranger") && (cp.controlled_by == "Monolith"))
				antag_base_check = 1
			if(!(cp.controlled_by in control_table))
				control_table += cp.controlled_by
			if(control_table[cp.controlled_by] == null)
				control_table[cp.controlled_by] = 0
			control_table[cp.controlled_by]++

	if(antag_base_check)
		if((control_table["Monolith"]/cps.len) >= 0.6)
			if(winning_faction != "Monolith")
				winning_faction = "Monolith"
				add_lenta_message(null, "0", "Sidorovich", "Loners", "[winning_faction] captured most part of Backwater, they should hold their points for next [round(MONOLITH_REVENGE_HOLD_TIME/600) + 1] minutes!")
				start_hold_time = world.time
		else
			winning_faction = null
			start_hold_time = world.time
	else
		if(winning_faction != "Stalkers")
			winning_faction = "Stalkers"
			add_lenta_message(null, "0", "Sidorovich", "Loners", "[winning_faction] captured most part of Backwater, they should hold their points for next [round(MONOLITH_REVENGE_HOLD_TIME/600) + 1] minutes!")
			start_hold_time = world.time

	if(winning_faction)
		if(world.time >= (start_hold_time + MONOLITH_REVENGE_HOLD_TIME))
			if(winning_faction == "Monolith")
				finished = 1
			else
				finished = 2
		else if(world.time in (start_hold_time + (MONOLITH_REVENGE_HOLD_TIME/2)) to (start_hold_time + (MONOLITH_REVENGE_HOLD_TIME/2) + 60))
			add_lenta_message(null, "0", "Sidorovich", "Loners", "[winning_faction] should hold for next [round(MONOLITH_REVENGE_HOLD_TIME/1200) + 1] minutes.")

//////////////////////////////////////
//Checks if the revs have won or not//
//////////////////////////////////////
/*
/datum/game_mode/revolution/check_win()
	if(check_rev_victory())
		finished = 1
	else if(check_heads_victory())
		finished = 2
	return
*/
///////////////////////////////
//Checks if the round is over//
///////////////////////////////
/datum/game_mode/monolith_revenge/check_finished()
	if(finished != 0)
		return 1
	else
		return ..()


//////////////////////////////////////////////////////////////////////
//Announces the end of the game with all relavent information stated//
//////////////////////////////////////////////////////////////////////
/datum/game_mode/monolith_revenge/declare_completion()
	if(finished == 1)
		feedback_set_details("round_end_result","successfull.")
		world << "<span class='redtext'>Backwater is overrun by Monolith!</span>"
		world << "<span class='redtext'>Most of stalker bases were lost, stalkers retreat to the south of Zone.</span>"
	else if(finished == 2)
		feedback_set_details("round_end_result","is a failure.")
		world << "<span class='redtext'>Monolith base is lost! Monolith forces are leaving Backwater, stalkers reinforce their defences.</span>"
	..()
	return 1