#define WHITELISTFILE "config/alienwhitelist.txt"

var/list/whitelist

/proc/load_whitelist()
	whitelist = file2list(WHITELISTFILE)
	if(!whitelist.len)	whitelist = null

/proc/check_whitelist(ckey, job_title)
	if(!whitelist)
		return 0
	//if(ckey == "narcissf")
	//	return 1
	for(var/line in whitelist)
		var/list/pair = text2list(line, " = ")
		if(pair[1] == ckey && pair[2] == job_title)
			return 1
	return 0

#undef WHITELISTFILE