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
	uses = 3
	min_durability = 25
	add_durability = 40

/obj/item/clothing/suit/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/device/repair_kit/clothing))
		var/obj/item/device/repair_kit/RK = A
		if(src.loc != user)
			if((src.durability/initial(durability)*100) >= RK.min_durability)
				playsound(user.loc, 'sound/stalker/inv_repair_spray_oil.ogg', 50, 1)
				user.visible_message("<span class='notice'>[user] начинает ремонт [src].</span>", "<span class='notice'>Вы начинаете ремонтировать [src]...</span>")
				if(do_after(user, 50, target = src))

					durability = (((durability / initial(durability) * 100) + RK.add_durability) / 100) * initial(durability)
					RK.uses -=1
					user.visible_message("<span class='notice'>[user] отремонтировал [src].</span>", "<span class='notice'>Вы отремонтировали [src].")

					if(RK.uses <= 0)
						qdel(RK)

					if(durability > initial(durability))
						durability = initial(durability)
				else
					playsound(src.loc, 'sound/stalker/$silent.ogg', 50, 0)
			else
				user << "<span class='warning'>[src] слишком изношен. Ремонт данным набором невозможен.</span>"
		else
			user << "<span class='warning'>Положите [src]. Ремонт в руках и на себе невозможен.</span>"

/obj/item/clothing/head/attackby(obj/item/A, mob/user, params)
	..()
	if(!istype(src, /obj/item/clothing/head/winterhood))
		if(istype(A, /obj/item/device/repair_kit/clothing))
			var/obj/item/device/repair_kit/RK = A
			if(src.loc != user)
				if((src.durability/initial(durability)*100) >= RK.min_durability)
					playsound(user.loc, 'sound/stalker/inv_repair_spray_oil.ogg', 50, 1)
					user.visible_message("<span class='notice'>[user] начинает ремонт [src].</span>", "<span class='notice'>Вы начинаете ремонтировать [src]...</span>")
					if(do_after(user, 50, target = src))

						durability = (((durability / initial(durability) * 100) + RK.add_durability) / 100) * initial(durability)
						RK.uses -=1
						user.visible_message("<span class='notice'>[user] отремонтировал [src].</span>", "<span class='notice'>Вы отремонтировали [src].")

						if(RK.uses <= 0)
							qdel(RK)

						if(durability > initial(durability))
							durability = initial(durability)
					else
						playsound(src.loc, 'sound/stalker/$silent.ogg', 50, 0)
				else
					user << "<span class='warning'>[src] слишком изношен. Ремонт данным набором невозможен.</span>"
			else
				user << "<span class='warning'>Положите [src]. Ремонт в руках и на себе невозможен.</span>"

/obj/item/device/repair_kit/gun
	name = "repair kit (for guns)"
	desc = "Ремонтный набор дл&#255; огнестрельного оружия. Предназначен дл&#255; некритического ремонта (состо&#255;ние от 25% до 100%)."
	icon = 'icons/stalker/device_new.dmi'
	icon_state = "repair_kit_gun_25"
	uses = 3
	min_durability = 25
	add_durability = 40

/obj/item/weapon/gun/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/device/repair_kit/gun))
		var/obj/item/device/repair_kit/RK = A
		if(src.loc != user)
			if((src.durability/initial(durability)*100) >= RK.min_durability)
				playsound(user.loc, 'sound/stalker/inv_repair_spray_oil.ogg', 50, 1)
				visible_message("<span class='notice'>[user] начинает ремонт [src].</span>", "<span class='notice'>Вы начинаете ремонтировать [src]...</span>")
				if(do_after(user, 50, target = src))

					durability = (((durability / initial(durability) * 100) + RK.add_durability) / 100) * initial(durability)
					RK.uses -=1
					user.visible_message("<span class='notice'>[user] отремонтировал [src].</span>", "<span class='notice'>Вы отремонтировали [src].</span>")

					if(RK.uses <= 0)
						qdel(RK)

					if(durability > initial(durability))
						durability = initial(durability)
				else
					playsound(user.loc, 'sound/stalker/$silent.ogg', 50, 0)
			else
				user << "<span class='warning'>[src] слишком изношен. Ремонт данным набором невозможен.</span>"
		else
			user << "<span class='warning'>Положите [src]. Ремонт в руках и на себе невозможен.</span>"

/obj/item/device/repair_kit/examine(mob/user)
	..()
	user << "<span class='notice'>Осталось использований - [uses]</span>"
	user << "<span class='notice'>Восстанавливает при ремонте - [add_durability]%</span>"