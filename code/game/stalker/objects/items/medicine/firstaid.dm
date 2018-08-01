/*
/obj/item/weapon/reagent_containers/pill/stalker/aptechka_r
	icon = 'icons/stalker/items.dmi'
	icon_state = "aptechkar"
	desc = "Универсальный медицинский набор. Позвол&#255;ет справл&#255;тьс&#255; с травмами различного вида и степени сложности - ранени&#255;ми, ожогами, отравлени&#255;ми и прочим."

/obj/item/weapon/reagent_containers/pill/stalker/aptechka_r/New()
	..()
	if(empty) return
	new /obj/item/stack/medical/gauze/bint(src)
	new /obj/item/stack/medical/gauze/bint(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/stack/medical/gauze(src)
	new /obj/item/weapon/reagent_containers/hypospray/medipen(src)
	return

/obj/item/weapon/reagent_containers/pill/stalker/aptechka_b
	icon = 'icons/stalker/items.dmi'
	icon_state = "aptechkab"
	desc = "Специализированный медицинский набор дл&#255; борьбы с физическими повреждени&#255;ми и кровотечением. В него вход&#255;т компоненты дл&#255; ускорени&#255; свертывани&#255; крови, обезболивающие, антибиотики и иммунные стимул&#255;торы."

/obj/item/weapon/reagent_containers/pill/stalker/aptechka_b/New()
	..()
	if(empty) return
	new /obj/item/stack/medical/gauze/bint(src)
	new /obj/item/stack/medical/gauze/bint(src)
	new /obj/item/stack/medical/gauze/bint(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/stack/medical/gauze(src)
	new /obj/item/weapon/reagent_containers/hypospray/medipen(src)
	return

/obj/item/weapon/reagent_containers/pill/stalker/aptechka_y
	icon = 'icons/stalker/items.dmi'
	icon_state = "aptechkay"
	desc = "Медицинский набор, разработанный специально дл&#255; работы в услови&#255;х Зоны. Состав набора подобран как дл&#255; борьбы с ранени&#255;ми, так и дл&#255; вывода радионуклидов из организма. Преп&#255;тствует развитию лучевой болезни, а также снижает дозу накопленной радиации."

/obj/item/weapon/reagent_containers/pill/stalker/aptechka_y/New()
	..()
	if(empty) return
	new /obj/item/weapon/reagent_containers/pill/patch/styptic(src)
	new /obj/item/weapon/reagent_containers/pill/patch/styptic(src)
	new /obj/item/weapon/reagent_containers/pill/patch/silver_sulf(src)
	new /obj/item/weapon/reagent_containers/pill/patch/silver_sulf(src)
	new /obj/item/weapon/reagent_containers/syringe/charcoal(src)
	new /obj/item/weapon/reagent_containers/hypospray/medipen/stalker/antirad(src)
	return
*/
/obj/item/stack/medical/gauze/bint
	desc = "Перев&#255;зочный материал. Помогает остановить кровотечение."
	eng_desc = "Bandage. Can stop your bleeding."
	icon = 'icons/stalker/items.dmi'
	icon_state = "bint"
	amount = 2