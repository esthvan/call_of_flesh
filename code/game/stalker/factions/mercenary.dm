/datum/job/mercenary
	title = "Mercenary"
//	flag = ASSISTANT
//	department_flag = CIVILIAN
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = ""
	selection_color = "#2e708b"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	whitelist_only = 1
	limit_per_player = 4
	outfit = /datum/outfit/job/mercenary

/datum/outfit/job/mercenary
	name = "Mercenary"
	faction_s = "Наёмники"

/datum/outfit/job/mercenary/pre_equip(mob/living/carbon/human/H)
	..()
	head = null
	mask = /obj/item/clothing/mask/gas/stalker/mercenary
	uniform = pick(/obj/item/clothing/under/color/switer, /obj/item/clothing/under/color/switer/dark)
	suit = /obj/item/clothing/suit/hooded/kombez/mercenary
	ears = null
	belt = /obj/item/weapon/stalker/knife
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/device/stalker_pda
	back = /obj/item/weapon/gun/projectile/automatic/mp5
	//back2 = pick(/obj/item/weapon/gun/projectile/automatic/mp5, /obj/item/weapon/gun/projectile/shotgun/chaser)
	//suit_store = pick(/obj/item/weapon/gun/projectile/automatic/mp5, /obj/item/weapon/gun/projectile/shotgun/chaser)
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/device/flashlight/seclite = 1,
							/obj/item/ammo_box/stalker/m9x19mp5 = 1)
	r_pocket = /obj/item/weapon/stalker/bolts

/datum/outfit/mercenary  // For select_equipment
	name = "Mercenary"

	head = null
	mask = /obj/item/clothing/mask/gas/stalker/mercenary
	uniform = /obj/item/clothing/under/color/switer
	suit = /obj/item/clothing/suit/hooded/kombez/mercenary
	ears = null
	belt = /obj/item/weapon/stalker/knife
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/device/stalker_pda
	back = /obj/item/weapon/storage/backpack/stalker
	shoes = /obj/item/clothing/shoes/jackboots/warm
	backpack_contents = list(/obj/item/ammo_box/magazine/stalker/sc45 = 2,
							/obj/item/weapon/reagent_containers/pill/stalker/aptechka_b = 1,
							/obj/item/weapon/gun/projectile/automatic/pistol/sip = 1,
							/obj/item/device/flashlight/seclite = 1)
	r_pocket = /obj/item/weapon/stalker/bolts
	l_pocket = /obj/item/weapon/reagent_containers/food/snacks/stalker/kolbasa
	faction_s = "Наемники"

/datum/outfit/mercenary/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(/obj/item/clothing/under/color/switer, /obj/item/clothing/under/color/switer/dark)
	suit = /obj/item/clothing/suit/hooded/kombez/mercenary
	//back2 = pick(/obj/item/weapon/gun/projectile/automatic/mp5, /obj/item/weapon/gun/projectile/shotgun/chaser)
	suit_store = pick(/obj/item/weapon/gun/projectile/automatic/mp5, /obj/item/weapon/gun/projectile/shotgun/chaser)
	r_pocket = /obj/item/weapon/stalker/bolts
	l_pocket = pick(/obj/item/weapon/reagent_containers/food/snacks/stalker/kolbasa,/obj/item/weapon/reagent_containers/food/snacks/stalker/baton)
