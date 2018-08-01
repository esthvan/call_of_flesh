/obj/item/weapon/reagent_containers/pill/stalker
	icon = 'icons/stalker/items.dmi'
	w_class = 2
	possible_transfer_amounts = list()
	volume = 60
	apply_type = PATCH
	apply_method = "apply"

/obj/item/weapon/reagent_containers/pill/stalker/aptechka
	name = "kit"
	desc = "Стара&#255; советска&#255; аптечка."

obj/item/weapon/reagent_containers/pill/stalker/afterattack(obj/target, mob/user , proximity)
	return // thanks inheritance again

obj/item/weapon/reagent_containers/pill/stalker/canconsume(mob/eater, mob/user)
	if(!iscarbon(eater))
		return 0
	return 1 // Masks were stopping people from "eating" patches. Thanks, inheritance.

/obj/item/weapon/reagent_containers/pill/stalker/aptechka/civilian
	name = "medkit"
	icon_state = "aptechkar"
	desc = "Универсальный медицинский набор. Позвол&#255;ет справл&#255;тьс&#255; с травмами различного вида и степени сложности: ранени&#255;ми, ожогами, отравлени&#255;ми и прочим. Не останавливает кровотечение!"
	eng_desc = "All-purpose single-use medkit. Allows to handle injuries of different types and degrees of complexity. Doesn't stop bleeding!"
	item_state = "aptechkar"
	list_reagents = list("cryoxadone" = 16)

/obj/item/weapon/reagent_containers/pill/stalker/aptechka/army
	name = "army medkit"
	desc = "Специализированный медицинский набор дл&#255; борьбы с физическими повреждени&#255;ми и кровотечением. В него вход&#255;т компоненты дл&#255; ускорени&#255; свертывани&#255; крови, обезболивающие, антибиотики и иммунные стимул&#255;торы. Останавливает кровотечение!"
	eng_desc = "Specialized medical kit to provide first-aid in case of in-battle injuries. The kit includes Menadion-based medicine for faster blood coagulation, painkillers, antibiotics, immunity stimulators, so as a kit to remove shrapnel and bullets from your body. Stops the bleeding."
	icon_state = "aptechkab"
	item_state = "aptechkab"
	list_reagents = list("cryoxadoneb" = 8)

/obj/item/weapon/reagent_containers/pill/stalker/aptechka/scientific
	name = "scientific medkit"
	desc = "Медицинский набор, разработанный специально дл&#255; работы в услови&#255;х Зоны. Состав набора подобран как дл&#255; борьбы с ранени&#255;ми, так и дл&#255; вывода радионуклидов из организма. Преп&#255;тствует развитию лучевой болезни, а также снижает дозу накопленной радиации."
	eng_desc = "Medical set, designed especially for work in the Zone. The set includes means of healing wounds as well as means of eliminating radionuclides from the body. Prevents the development of radiowave sickness and lowers the dose of accumulated radiation. Stops the bleeding."
	icon_state = "aptechkay"
	item_state = "aptechkay"
	list_reagents = list("cryoxadoney" = 6)