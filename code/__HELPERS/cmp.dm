/proc/cmp_numeric_dsc(a,b)
	return b - a

/proc/cmp_numeric_asc(a,b)
	return a - b

/proc/cmp_text_asc(a,b)
	return sorttext(b,a)

/proc/cmp_text_dsc(a,b)
	return sorttext(a,b)

/proc/cmp_name_asc(atom/a, atom/b)
	if(a && b)
		return sorttext(b.name, a.name)

/proc/cmp_real_name_dsc(mob/a, mob/b)
	if(a && b)
		return sorttext(a.real_name, b.real_name)

/proc/cmp_real_name_asc(mob/a, mob/b)
	if(a && b)
		return sorttext(b.real_name, a.real_name)

/proc/cmp_name_dsc(atom/a, atom/b)
	if(a && b)
		return sorttext(a.name, b.name)

/proc/cmp_price_dsc(datum/data/stalker_equipment/a,datum/data/stalker_equipment/b)
	return b.cost - a.cost

/proc/cmp_price_asc(datum/data/stalker_equipment/a,datum/data/stalker_equipment/b)
	return a.cost - b.cost

var/cmp_field = "name"

/proc/cmp_soundtracks_asc(datum/data/turntable_soundtrack/a, datum/data/turntable_soundtrack/b)
	return sorttext(b.f_name + b.name, a.f_name + a.name)

/proc/cmp_soundtracks_dsc(datum/data/turntable_soundtrack/a, datum/data/turntable_soundtrack/b)
	return sorttext(a.f_name + a.name, b.f_name + b.name)

/proc/cmp_records_asc(datum/data/record/a, datum/data/record/b)
	return sorttext(b.fields[cmp_field], a.fields[cmp_field])

/proc/cmp_records_dsc(datum/data/record/a, datum/data/record/b)
	return sorttext(a.fields[cmp_field], b.fields[cmp_field])

/proc/cmp_records_numeric_dsc(datum/data/record/a, datum/data/record/b)
	return b.fields[cmp_field] - a.fields[cmp_field]

/proc/cmp_records_numeric_asc(datum/data/record/a, datum/data/record/b)
	return a.fields[cmp_field] - b.fields[cmp_field]

/proc/cmp_ckey_asc(client/a, client/b)
	return sorttext(b.ckey, a.ckey)

/proc/cmp_ckey_dsc(client/a, client/b)
	return sorttext(a.ckey, b.ckey)

/proc/cmp_subsystem_priority(datum/subsystem/a, datum/subsystem/b)
	return b.priority - a.priority
/*
/proc/cmp_subsystem_display(datum/subsystem/a, datum/subsystem/b)
	if(a.display == b.display)
		return sorttext(b.name, a.name)
	return a.display - b.display
*/