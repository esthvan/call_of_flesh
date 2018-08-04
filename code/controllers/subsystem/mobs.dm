var/datum/subsystem/mobs/SSmob

/datum/subsystem/mobs
	name = "Mobs"
	priority = 4
	wait = 10
	dynamic_wait = 0
	dwait_upper = 10	//Real wait. Change this instead of wait
	dwait_lower = 0.1
	var/list/currentrun = list()
	var/currentrun_len_initial = 0
	var/count = 0

/datum/subsystem/mobs/New()
	NEW_SS_GLOBAL(SSmob)


/datum/subsystem/mobs/stat_entry()
	..("P:[mob_list.len]")


/datum/subsystem/mobs/fire(resumed = 0)
	//if (!resumed)
	if(!currentrun.len)
		src.currentrun = mob_list.Copy()
		currentrun_len_initial = currentrun.len
		wait = max(dwait_upper / currentrun_len_initial, dwait_lower)
		count = 0

	//cache for sanic speed (lists are references anyways)
	//var/list/currentrun = src.currentrun
	//var/currentrun_len_initial = currentrun.len

	count++
	var/step = count * (wait / dwait_upper)
	var/currentrun_len_new = round(currentrun_len_initial * ( 1 - step))
	var/seconds = dwait_upper * 0.1

	while(currentrun.len > max(0, min(currentrun_len_new, currentrun_len_initial - currentrun_len_initial * step)))
		var/mob/M = currentrun[1]
		currentrun.Cut(1, 2)
		if(M)
			M.Life(seconds)
		else
			mob_list.Remove(M)
		if (MC_TICK_CHECK)
			return

		//world << currentrun.len
		//world << round(currentrun_len_initial * ( 1 - (count * (wait / initial(wait)))))