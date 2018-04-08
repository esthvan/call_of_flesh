var/datum/subsystem/donate/StalkerDonate
/donater
	var/ckey = null
	var/amount = null

/datum/subsystem/donate
	name = "Donate"
	var/list/donaters = list()


/datum/subsystem/donate/New()
	NEW_SS_GLOBAL(StalkerDonate)
	Update()


/datum/subsystem/donate/proc/Update()
	var/database/db = new("data/donates.db")
	var/database/query/q = new("SELECT * FROM donates")
	donaters = list()
	if(q.Execute(db))
		while(q.NextRow())
			var/list/rowdata = q.GetRowData()
			var/donater/D = new /donater()
			D.ckey = rowdata["ckey"]
			D.amount = rowdata["amount"]
			donaters.Add(D)
		return 1
	else
		return 0

/proc/GetDonateAmount(ckey)
	for(var/donater/D in StalkerDonate.donaters)
		if(D.ckey == ckey)
			return D.amount

/datum/subsystem/donate/stat_entry()
	..("P:[donaters.len]")