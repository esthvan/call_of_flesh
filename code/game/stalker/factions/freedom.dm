/datum/job/freedom
	title = "Freedom"
	faction = "Station"
	total_positions = 6
	spawn_positions = -1
	supervisors = "Major"
	selection_color = "#601919"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	whitelist_only = 0
	limit_per_player = 3
	outfit = /datum/outfit/job/freedom

/datum/outfit/job/freedom
	name = "Freedom"
	faction_s = "Freedom"

/datum/outfit/job/freedom/pre_equip(mob/living/carbon/human/H)
	..()
	head = null
	uniform = pick(/obj/item/clothing/under/color/switer, /obj/item/clothing/under/color/switer/dark)
	suit = /obj/item/clothing/suit/hooded/kombez/veter
	ears = null
	belt = /obj/item/weapon/stalker/knife
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/device/stalker_pda
	suit_store = /obj/item/weapon/gun/projectile/automatic/tpc301
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list()
	r_pocket = /obj/item/weapon/stalker/bolts
	l_pocket = pick(/obj/item/weapon/reagent_containers/food/snacks/stalker/kolbasa,/obj/item/weapon/reagent_containers/food/snacks/stalker/baton)

/datum/outfit/freedom  // For select_equipment
	name = "Freedom Soldier"

	head = null
	suit = /obj/item/clothing/suit/hooded/kombez/veter
	ears = null
	belt = /obj/item/weapon/stalker/knife
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/device/stalker_pda
	back = /obj/item/weapon/storage/backpack/stalker
	suit_store = /obj/item/weapon/gun/projectile/automatic/tpc301
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/ammo_box/stalker/b55645 = 1,
							/obj/item/ammo_box/magazine/stalker/m556x45 = 2,)
	r_pocket = /obj/item/weapon/stalker/bolts
	faction_s = "Freedom"

/datum/outfit/freedom/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(/obj/item/clothing/under/color/switer, /obj/item/clothing/under/color/switer/dark)
	suit = /obj/item/clothing/suit/hooded/kombez/veter
	ears = null
	l_pocket = pick(/obj/item/weapon/reagent_containers/food/snacks/stalker/kolbasa,/obj/item/weapon/reagent_containers/food/snacks/stalker/baton)
	r_pocket =/obj/item/weapon/stalker/bolts

/datum/job/freedom_lieutenant
	title = "Freedom Lieutenant"
	faction = "Station"
	total_positions = 2
	spawn_positions = -1
	supervisors = "Major"
	selection_color = "#601919"
	whitelist_only = 1
	limit_per_player = 2
	outfit = /datum/outfit/job/freedom_lieutenant

/datum/outfit/job/freedom_lieutenant
	name = "Freedom Lieutenant"
	faction_s = "Freedom"

/datum/outfit/job/freedom_lieutenant/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/hardhat/tacticalhelmet/light
	uniform = pick(/obj/item/clothing/under/color/switer, /obj/item/clothing/under/color/switer/dark)
	suit = /obj/item/clothing/suit/strazh
	belt = /obj/item/weapon/stalker/knife
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/device/stalker_pda
	suit_store = /obj/item/weapon/gun/projectile/automatic/sigsg550
	backpack_contents = list(/obj/item/ammo_box/stalker/b55645 = 1,
							/obj/item/ammo_box/magazine/stalker/m556x45 = 2,)
	shoes = /obj/item/clothing/shoes/jackboots/warm
	r_pocket = /obj/item/weapon/stalker/bolts
	l_pocket = pick(/obj/item/weapon/reagent_containers/food/snacks/stalker/kolbasa,/obj/item/weapon/reagent_containers/food/snacks/stalker/baton)