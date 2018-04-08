/*
var/datum/subsystem/karma/StalkerKarma
/ckeyamountpair
	var/ckey = null
	var/amount = null

/datum/subsystem/karma
	name = "Karma"
	var/list/KarmaList = list()


/datum/subsystem/karma/New()
	NEW_SS_GLOBAL(StalkerKarma)
	Update()


/datum/subsystem/karma/proc/Update()
	var/database/db = new("data/karma.db")
	var/database/query/q = new("SELECT * FROM players")
	KarmaList = list()
	if(q.Execute(db))
		while(q.NextRow())
			var/list/rowdata = q.GetRowData()
			var/ckeyamountpair/C = new /ckeyamountpair()
			C.ckey = rowdata["ckey"]
			C.amount = rowdata["amount"]
			KarmaList.Add(C)
		return 1
	else
		return 0

/datum/subsystem/karma/proc/AddPlayer(ckey)
	var/database/db = new("data/karma.db")
	var/database/query/q = new("INSERT INTO players (ckey) VALUES ('[ckey]')")
	if(q.Execute(db))
		Update()
		return 1
	else
		return 0


/datum/subsystem/karma/stat_entry()
	..("P:[KarmaList.len]")

/datum/subsystem/karma/proc/InitKarmaForCkey(ckey)
	var/karma = GetKarma(ckey)
	if(karma == null)
		AddPlayer(ckey)
		Update()
		return GetKarma(ckey)
	else
		return karma

/datum/subsystem/karma/proc/SetKarma(ckey, amount as num)
	var/value
	if(amount < 1)
		value = 1
	else
		value = amount
	var/database/db = new("data/karma.db")
	var/database/query/q = new("UPDATE players SET amount = '[value]' WHERE ckey = '[ckey]'")
	if(q.Execute(db))
		for(var/ckeyamountpair/C in StalkerKarma.KarmaList)
			if(C.ckey == ckey)
				C.amount = amount
		return 1
	else
		return 0

/proc/GetKarma(ckey)
	for(var/ckeyamountpair/C in StalkerKarma.KarmaList)
		if(C.ckey == ckey)
			return C.amount
*/