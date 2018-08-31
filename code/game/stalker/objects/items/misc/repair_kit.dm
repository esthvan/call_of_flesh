/obj/item/device/repair_kit
	name = "repair kit"
	var/uses = 1
	var/min_durability = 50
	var/add_durability = 30

/obj/item/device/repair_kit/clothing
	name = "repair kit (for suits)"
	desc = "Ремонтный набор дл&#255; бронекостюмов и шлемов. Предназначен дл&#255; некритического ремонта (состо&#255;ние от 25% до 100%)."
	icon = 'icons/stalker/device_new.dmi'
	icon_state = "repair_kit_clothing_25"
	uses = 1
	min_durability = 25
	add_durability = 40

/obj/item/clothing/suit/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/device/repair_kit/clothing))
		var/obj/item/device/repair_kit/RK = A
		if(src.loc == user)
			user << "<span class='warning'>Place [src] on the floor or table.</span>"
			return 0

		if((src.durability/initial(durability)*100) < RK.min_durability)
			user << "<span class='warning'>[src] duranility is too low. You can't repair it with kit of this type.</span>"
			return 0

		playsound(user.loc, 'sound/stalker/inv_repair_spray_oil.ogg', 50, 1)
		user.visible_message("<span class='notice'>[user] starts repairing [src]...</span>", "<span class='notice'>You start repairing [src]...</span>")
		if(!do_after(user, 50, target = src))
			playsound(src.loc, null, 50, 0)

		durability = (((durability / initial(durability) * 100) + RK.add_durability) / 100) * initial(durability)
		RK.uses -=1
		user.visible_message("<span class='notice'>[user] repairs [src].</span>", "<span class='notice'>You repair [src].")

		if(RK.uses <= 0)
			qdel(RK)

		if(durability > initial(durability))
			durability = initial(durability)
		return 1

	if(internal_slot)
		if(isrobot(user))
			user << "<span class='warning'>You're a robot. No.</span>"
			return 0	//Robots can't interact with storage items.

		if(!internal_slot.can_be_inserted(A, 0 , user))
			return 0

		internal_slot.handle_item_insertion(A, 0 , user)
		return 1


/obj/item/clothing/head/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/device/repair_kit/clothing))
		var/obj/item/device/repair_kit/RK = A

		if(src.loc == user)
			user << "<span class='warning'>Place [src] on the floor or table.</span>"
			return 0

		if((src.durability/initial(durability)*100) < RK.min_durability)
			user << "<span class='warning'>[src] durability is too low. You can't repair it with kit of this type.</span>"
			return 0

		playsound(user.loc, 'sound/stalker/inv_repair_spray_oil.ogg', 50, 1)
		user.visible_message("<span class='notice'>[user] starts repairing [src]...</span>", "<span class='notice'>You start repairing [src]...</span>")
		if(!do_after(user, 50, target = src))
			playsound(src.loc, null, 50, 0)

		durability = (((durability / initial(durability) * 100) + RK.add_durability) / 100) * initial(durability)
		RK.uses -=1
		user.visible_message("<span class='notice'>[user] repairs [src].</span>", "<span class='notice'>You repair [src].")

		if(RK.uses <= 0)
			qdel(RK)

		if(durability > initial(durability))
			durability = initial(durability)
		return 1

/obj/item/device/repair_kit/gun
	name = "repair kit (for guns)"
	desc = "Ремонтный набор дл&#255; огнестрельного оружия. Предназначен дл&#255; некритического ремонта (состо&#255;ние от 25% до 100%)."
	icon = 'icons/stalker/device_new.dmi'
	icon_state = "repair_kit_gun_25"
	uses = 1
	min_durability = 25
	add_durability = 40

/obj/item/weapon/gun/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/device/repair_kit/gun))
		var/obj/item/device/repair_kit/RK = A
		if(src.loc == user)
			user << "<span class='warning'>Place [src] on the floor or table.</span>"
			return 0

		if((src.durability/initial(durability)*100) < RK.min_durability)
			user << "<span class='warning'>[src] durability is too low. You can't repair it with kit of this type.</span>"
			return 0

		playsound(user.loc, 'sound/stalker/inv_repair_spray_oil.ogg', 50, 1)
		user.visible_message("<span class='notice'>[user] starts repairing [src]...</span>", "<span class='notice'>You start repairing [src]...</span>")

		if(!do_after(user, 50, target = src))
			playsound(user.loc, null, 50, 0)

		durability = (((durability / initial(durability) * 100) + RK.add_durability) / 100) * initial(durability)
		RK.uses -=1
		user.visible_message("<span class='notice'>[user] repairs [src].</span>", "<span class='notice'>You repair [src].")

		if(RK.uses <= 0)
			qdel(RK)

		if(durability > initial(durability))
			durability = initial(durability)
		return 1

/obj/item/device/repair_kit/examine(mob/user)
	..()
	user << "<span class='notice'>Uses left - [uses]</span>"
	user << "<span class='notice'>Restores - [add_durability]%</span>"