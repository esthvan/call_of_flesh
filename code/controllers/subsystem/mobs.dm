var/datum/subsystem/mobs/SSmob

/datum/subsystem/mobs
	name = "Mobs"
	priority = 4
	wait = 10
	dynamic_wait = 1
	dwait_upper = 20	//longest wait can be under dynamic_wait
	dwait_lower = 2		//shortest wait can be under dynamic_wait
	var/list/currentrun = list()


/datum/subsystem/mobs/New()
	NEW_SS_GLOBAL(SSmob)


/datum/subsystem/mobs/stat_entry()
	..("P:[mob_list.len]")


/datum/subsystem/mobs/fire(resumed = 0)
	if (!resumed)
		src.currentrun = mob_list.Copy()

	//cache for sanic speed (lists are references anyways)
	var/list/currentrun = src.currentrun
	var/currentrun_len_initial = currentrun.len

	while(currentrun.len)
		var/mob/M = currentrun[1]
		currentrun.Cut(1, 2)
		if(M)
			var/seconds = wait * 0.1
			M.Life(seconds)
		else
			mob_list.Remove(M)
		if (MC_TICK_CHECK)
			return
		if(currentrun.len <= round(currentrun_len_initial * wait / initial(wait)))
			return