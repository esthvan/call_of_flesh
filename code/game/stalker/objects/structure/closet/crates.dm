/obj/structure/closet/crate/stalker
	icon = 'icons/stalker/crates.dmi'
	anchored = 1

/obj/structure/closet/crate/stalker/blue
	name = "crate"
	desc = "Обычный железный &#255;щик."
	icon_crate = "blue"
	icon_state = "blue"

/obj/structure/closet/crate/stalker/blue/stash
	name = "stash"
	desc = "В таких &#255;щиках обычно пр&#255;чут хабар. Замок сгнил."
	var/lootcount = 1		//how many items will be spawned
	var/lootdoubles = 1		//if the same item can be spawned twice
	var/list/loot
	var/waspicked = 0
	var/rating_add

/obj/structure/closet/crate/stalker/blue/stash/low
	lootdoubles = 1
	lootcount = 5
	loot = list(
				/obj/item/weapon/gun/projectile/automatic/aksu74 = 1,
				/obj/item/weapon/gun/projectile/automatic/aksu74/green = 1,
				/obj/item/weapon/gun/projectile/automatic/mp5 = 2,
				/obj/item/weapon/gun/projectile/revolver/bm16 = 2,
				/obj/item/ammo_box/stalker/b9x18P = 10,
				/obj/item/ammo_box/stalker/b12x70P = 5,
				/obj/item/ammo_box/stalker/b12x70D = 5,
				/obj/item/ammo_box/stalker/b9x19P = 10,
				/obj/item/clothing/suit/hooded/kombez/mercenary = 1,
				/obj/item/clothing/suit/hooded/kombez/kombez_bandit = 1,
				/obj/item/clothing/suit/army = 1,
				/obj/item/clothing/suit/hooded/kozhanka/banditka/coat = 1,
				/obj/item/clothing/suit/hooded/kozhanka/banditka/coat/brown = 1,
				/obj/item/clothing/mask/gas/stalker = 2,
				/obj/item/device/detector/bear = 2,
				/obj/nothing = 20
				)
	rating_add = 50

/obj/structure/closet/crate/stalker/blue/stash/medium
	lootdoubles = 1
	lootcount = 4
	loot = list(
				/obj/item/weapon/gun/projectile/automatic/pistol/sip  = 2,
				/obj/item/weapon/gun/projectile/automatic/pistol/cora = 2,
				/obj/item/weapon/gun/projectile/automatic/pistol/marta = 2,
				/obj/item/weapon/gun/projectile/automatic/ak74 = 2,
				/obj/item/weapon/gun/projectile/automatic/ak74/m = 2,
				/obj/item/weapon/gun/projectile/automatic/ak74/green = 2,
				/obj/item/weapon/gun/projectile/automatic/abakan = 2,
				/obj/item/weapon/gun/projectile/automatic/tpc301 = 2,
				/obj/item/ammo_box/stalker/b545ap = 8,
				/obj/item/ammo_box/stalker/b55645ap = 8,
				/obj/item/clothing/suit/hooded/kombez = 2,
				/obj/item/clothing/suit/hooded/kombez/strazh = 2,
				/obj/item/clothing/suit/berill = 2,
				/obj/item/clothing/head/hardhat/tacticalhelmet = 2,
				/obj/nothing = 15
				)
	rating_add = 100


/obj/structure/closet/crate/stalker/blue/stash/New()
	..()
	if(loot && loot.len)
		for(var/i = lootcount, i > 0, i--)
			if(!loot.len) break
			var/lootspawn = pickweight(loot)
			if(!lootdoubles)
				loot.Remove(lootspawn)

			if(lootspawn)
				new lootspawn(src)

/obj/structure/closet/crate/stalker/blue/stash/open()
	..()
	if(!waspicked && istype(usr, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = usr
		waspicked = 1
		if(istype(H.wear_id, /obj/item/device/stalker_pda))
			var/obj/item/device/stalker_pda/KPK = H.wear_id
			if(KPK.activated)
				KPK.show_lenta_message(KPK, "Вы обнаружили тайник!", H.sid, selfsound = 1)

		var/datum/data/record/sk = find_record("sid", H.sid, data_core.stalkers)
		if(sk)
			sk.fields["rating"] += rating_add

	return 1

/obj/structure/closet/stalker
	icon = 'icons/stalker/crates.dmi'
	anchored = 1

/obj/structure/closet/stalker/shkaf
	name = "closet"
	desc = "Обычный железный шкафчик."
	icon_state = "shkaf"