/obj/item/weapon/storage/wallet/stalker
	storage_slots = 10
	can_hold = list(
		/obj/item/stack/spacecash,
		/obj/item/clothing/mask/cigarette,
		/obj/item/weapon/lighter,
		/obj/item/weapon/match)

/obj/item/weapon/storage/wallet/stalker/New()
	..()
	var/item1_type = pick(/obj/item/stack/spacecash/c100,/obj/item/stack/spacecash/c50)
	var/item2_type
	if(prob(50))
		item2_type = pick(/obj/item/stack/spacecash/c100,/obj/item/stack/spacecash/c50)

	spawn(2)
		if(item1_type)
			new item1_type(src)
		if(item2_type)
			new item2_type(src)

/obj/item/weapon/storage/backpack/stalker
	name = "backpack"
	desc = "You wear this on your back and put items into it."
	icon_state = "backpack-tourist"
	item_state = "backpack-tourist"
	w_class = 4
	slot_flags = SLOT_BACK
	max_w_class = 3
	max_combined_w_class = 21
	storage_slots = 21
	burn_state = FLAMMABLE
	burntime = 20

/obj/item/weapon/storage/backpack/satchel/stalker
	name = "satchel"
	icon_state = "satchel-tourist"
	item_state = "satchel-tourist"
	w_class = 4
	slot_flags = SLOT_BACK
	max_w_class = 3
	max_combined_w_class = 21
	storage_slots = 21
	burn_state = FLAMMABLE
	burntime = 20

/obj/item/weapon/storage/backpack/stalker/attackby(obj/item/weapon/W, mob/user, params)
	playsound(src.loc, "sound/stalker/objects/inv_open.ogg", 50, 1, -5)
	..()

												///ѕќ‘» —»“≈ Ё“ќ  “ќ-Ќ»Ѕ”ƒ№ ѕќ∆јЋ”…—“ј\\\

/obj/item/weapon/storage/backpack/polka
	name = "shelf"
	desc = "ƒерев&#255;нный стеллаж."
	icon = 'icons/stalker/polka.dmi'
	icon_state = "polka"
	storage_slots = 40
	max_w_class = 5
	max_combined_w_class = 80
	density = 1
	anchored = 1

	/*//¬се предметы, которые могут быть на полке и их обозначение
	var/obj/item/ammo_box/stalker/b545/PETERKA = null
	var/obj/item/ammo_box/stalker/b545ap/PETERKAAP = null
	var/obj/item/weapon/reagent_containers/pill/stalker/aptechka_r/CMED = null
	var/obj/item/weapon/reagent_containers/pill/stalker/aptechka_b/AMED = null
	var/obj/item/weapon/reagent_containers/pill/stalker/aptechka_y/SMED = null
	var/obj/item/stack/medical/gauze/bint/MED1 = null
	var/obj/item/stack/medical/ointment/MED2 = null
	var/obj/item/weapon/reagent_containers/hypospray/medipen/stalker/antirad/MED3 = null
	var/obj/item/ammo_box/stalker/b12x70/BP1 = null
	var/obj/item/ammo_box/stalker/b12x70P/BP2 = null
	var/obj/item/ammo_box/stalker/b12x70D/BP3 = null
	var/obj/item/ammo_box/stalker/b9x19/BD1 = null
	var/obj/item/ammo_box/stalker/b9x19/BD2 = null
	var/obj/item/ammo_box/stalker/b9x18/BV1 = null
	var/obj/item/ammo_box/stalker/b9x18/BV2 = null
	var/obj/item/weapon/gun/GUNS = null
	var/obj/item/weapon/reagent_containers/food/drinks/DRINK = null
	var/obj/item/weapon/reagent_containers/food/snacks/stalker/FOOD = null
	var/obj/item/OTHER = null


*/
/obj/item/weapon/storage/backpack/polka/New()
	switch (pickweight(list("food" = 20, "med" = 12, "common_med" = 10, "army_med" = 5, "science_med" = 2, "9x18" = 10, "9x19" = 7, "12x70" = 7, "545" = 3, "nothing" = 85)))
		if ("food")
			new /obj/item/weapon/reagent_containers/food/snacks/stalker/konserva(src)
			new /obj/item/weapon/reagent_containers/food/snacks/stalker/konserva(src)
			new /obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/soup(src)
			new /obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/bobi(src)

		if ("med")
			new /obj/item/stack/medical/gauze/bint(src)
			new /obj/item/stack/medical/gauze/bint(src)
			new /obj/item/stack/medical/ointment(src)
		if ("common_med")
			new /obj/item/weapon/reagent_containers/pill/stalker/aptechka_r(src)

		if ("army_med")
			new /obj/item/weapon/reagent_containers/pill/stalker/aptechka_b(src)

		if ("science_med")
			new /obj/item/weapon/reagent_containers/pill/stalker/aptechka_y(src)

		if ("9x18")
			new /obj/item/ammo_box/stalker/b9x18(src)
			new /obj/item/ammo_box/stalker/b9x18(src)

		if ("9x19")
			new /obj/item/ammo_box/stalker/b9x19(src)
			new /obj/item/ammo_box/stalker/b9x19(src)

		if ("545")
			new /obj/item/ammo_box/stalker/b545(src)
			new /obj/item/ammo_box/stalker/b545(src)

		if ("12x70")
			new /obj/item/ammo_box/stalker/b12x70(src)
			new /obj/item/ammo_box/stalker/b12x70(src)

		if ("nothing")
			new /obj/nothing(src)

/*	src.update_icon()


	if(src.dir == 4 || src.dir == 8) then
		density = 0

«десь должны накладыватьс€; оверлеи на полку, в зависимости от того, что на ней лежит
/obj/item/weapon/storage/backpack/polka/update_icon()
	src.overlays = 0

	if(PETERKA || PETERKAAP)
		overlays += "5x45"
	if(BP1 || BP2 || BP3)
		overlays += "drob"
	if(BD1 || BD2)
		overlays += "9x19"
	if(BV1 || BV2)
		overlays += "9x18"
	if(CMED)
		overlays += "firstaid"
	if(AMED)
		overlays += "army"
	if(SMED)
		overlays += "science"
	if(MED1 || MED2 || MED3)
		overlays += "med"
	if(FOOD)
		overlays += "food"
	if(DRINK)
		overlays += "drinks"
	if(GUNS)
		overlays += "guns"
	if(OTHER)
		overlays += "other"
*/

/obj/item/weapon/storage/backpack/polka/attack_hand(mob/user)
    return

/obj/item/weapon/storage/backpack/polka/left
	icon_state = "polka_left"

/obj/item/weapon/storage/backpack/polka/right
	icon_state = "polka_right"

/obj/item/weapon/storage/backpack/polka/middle
	icon_state = "polka_middle"
