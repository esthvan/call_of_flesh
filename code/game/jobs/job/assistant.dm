/*
Assistant
*/
/datum/job/assistant
	title = "Loner"
//	flag = ASSISTANT
//	department_flag = CIVILIAN
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = ""
	selection_color = "#dddddd"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	outfit = /datum/outfit/job/assistant


/datum/job/assistant/get_access()
	if((config.jobs_have_maint_access & ASSISTANTS_HAVE_MAINT_ACCESS) || !config.jobs_have_minimal_access) //Config has assistant maint access set
		. = ..()
		. |= list(access_maint_tunnels)
	else
		return ..()

/datum/job/assistant/config_check()
	if(config && !(config.assistant_cap == 0))
		total_positions = config.assistant_cap
		spawn_positions = config.assistant_cap
		return 1
	return 0


/datum/outfit/job/assistant
	name = "Survivor"

/datum/outfit/job/assistant/pre_equip(mob/living/carbon/human/H)
	..()
	if (config.grey_assistants)
		uniform = pick(/obj/item/clothing/under/color/switer,/obj/item/clothing/under/color/switer/dark)
		suit = pick(/obj/item/clothing/suit/hooded/kozhanka,/obj/item/clothing/suit/hooded/kozhanka/white)
		ears = null
		belt = /obj/item/weapon/kitchen/knife/tourist
		id = /obj/item/device/pda/stalker
		shoes = /obj/item/clothing/shoes/jackboots/warm
		backpack_contents = list(/obj/item/stack/spacecash/c500)
		l_pocket = pick(/obj/item/weapon/reagent_containers/food/snacks/stalker/kolbasa,/obj/item/weapon/reagent_containers/food/snacks/stalker/baton)
	else
		uniform = /obj/item/clothing/under/color/switer
