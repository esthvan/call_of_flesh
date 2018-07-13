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
	lootcount = 4
	loot = list(
				/obj/item/weapon/gun/projectile/automatic/pistol/pm  = 2,
				/obj/item/weapon/gun/projectile/automatic/pistol/tt  = 2,
				/obj/item/weapon/gun/projectile/revolver/bm16/sawnoff = 2,
				/obj/item/weapon/gun/projectile/automatic/ppsh  = 1,
				/obj/item/ammo_box/stalker/b762x25 = 10,
				/obj/item/ammo_box/stalker/b9x18 = 10,
				/obj/item/ammo_box/stalker/b9x18P = 5,
				/obj/item/ammo_box/stalker/b12x70 = 10,
				/obj/item/ammo_box/stalker/b12x70P = 5,
				/obj/item/ammo_box/stalker/b12x70D = 5,
				/obj/item/ammo_box/stalker/b9x19 = 10,
				/obj/item/ammo_box/stalker/b9x19P = 5,
				/obj/item/clothing/suit/hooded/kombez/mercenary = 1,
				/obj/item/clothing/suit/hooded/kombez/kombez_bandit = 1,
				/obj/item/clothing/suit/army = 1,
				/obj/item/clothing/suit/hooded/kozhanka/banditka/coat = 2,
				/obj/item/clothing/suit/hooded/kozhanka/banditka/coat/brown = 2,
				/obj/item/clothing/mask/gas/stalker = 2,
				/obj/item/clothing/head/hardhat/lighttacticalhelmet = 1,
				/obj/item/clothing/head/steelhelmet = 3,
				/obj/nothing = 20
				)
	rating_add = 100

/obj/structure/closet/crate/stalker/blue/stash/medium
	lootdoubles = 1
	lootcount = 2
	loot = list(
				/obj/item/weapon/gun/projectile/automatic/pistol/sip  = 2,
				/obj/item/weapon/gun/projectile/automatic/pistol/cora = 2,
				/obj/item/weapon/gun/projectile/automatic/pistol/marta = 2,
				/obj/item/weapon/gun/projectile/automatic/pistol/desert = 1,
				/obj/item/ammo_box/stalker/b545 = 5,
				/obj/item/ammo_box/stalker/b545ap = 5,
				/obj/item/ammo_box/stalker/b55645 = 8,
				/obj/item/ammo_box/stalker/b55645ap = 8,
				/obj/item/clothing/suit/hooded/kombez = 1,
				/obj/item/clothing/suit/hooded/kombez/veter = 0.5,
				/obj/item/clothing/suit/berill = 1,
				/obj/item/clothing/suit/strazh = 0.5,
				/obj/item/clothing/head/hardhat/tacticalhelmet = 2,
				/obj/nothing = 12
				)
	rating_add = 250

/obj/structure/closet/crate/stalker/blue/stash/high
	lootdoubles = 0
	lootcount = 2
	loot = list(
				/obj/item/weapon/gun/projectile/shotgun/spsa = 1,
				/obj/item/clothing/suit/hooded/kombez/ecolog = 1,
				/obj/item/clothing/suit/hooded/kombez/seva = 1,
				/obj/item/clothing/suit/hooded/kombez/psz9md = 1,
				/obj/item/clothing/suit/skat = 1,
				/obj/item/clothing/suit/psz9d = 1,
				/obj/item/clothing/suit/assaultmerc = 1,
				/obj/item/weapon/gun/projectile/automatic/val = 1,
				/obj/item/weapon/gun/projectile/automatic/vintorez = 1,
				/obj/item/weapon/gun/projectile/automatic/groza = 1,
				/obj/item/weapon/gun/projectile/automatic/l6_saw/pkm = 0.25,
				/obj/nothing = 2
				)
	rating_add = 1000


/obj/structure/closet/crate/stalker/blue/stash/New()
	..()
	if(prob(40))
		qdel(src)
		return

	if(!loot || !loot.len)
		return

	for(var/i = lootcount, i > 0, i--)
		if(!loot.len)
			break

		var/lootspawn = pickweight(loot)

		if(lootspawn == /obj/nothing)
			continue

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
			if(KPK.owner)
				show_lenta_message(null, KPK, null, "КПК", "Система", "Вы обнаружили тайник!", selfsound = 1)


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