var/datum/subsystem/mobs/SSmob

/datum/subsystem/mobs
	name = "Mobs"
	priority = 4
	wait = 10
	dynamic_wait = 1
	dwait_upper = 20	//longest wait can be under dynamic_wait
	dwait_lower = 2		//shortest wait can be under dynamic_wait
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
		count = 0

	//cache for sanic speed (lists are references anyways)
	//var/list/currentrun = src.currentrun
	//var/currentrun_len_initial = currentrun.len

	while(currentrun.len)
		var/mob/M = currentrun[1]
		currentrun.Cut(1, 2)
		if(M)
			var/seconds = wait * 0.1
			M.Life(seconds)
		else
			mob_list.Remove(M)
		//if (MC_TICK_CHECK)
		//	return

		//world << currentrun.len
		//world << round(currentrun_len_initial * ( 1 - (count * (wait / initial(wait)))))

		count++
		if(currentrun.len < round(currentrun_len_initial * ( 1 - (count * (wait / initial(wait))))))
			return