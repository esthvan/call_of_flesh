/obj/structure/stalker
	icon = 'icons/stalker/decor.dmi'
	density = 0
	anchored = 1
	layer = 3.1

/obj/structure/stalker/radiation
	name = "radiation sign"
	desc = "Этот знак здесь &#255;вно не дл&#255; красоты."
	icon_state = "radiation_sign"
	density = 1
	pass_flags = LETPASSTHROW

/obj/structure/stalker/radiation/stop
	name = "sign"
	desc = "На табличке написано - 'Стоп! Запретна&#255; зона! Проход запрещен!'."
	icon_state = "stop_sign"

/obj/structure/stalker/water
	anchored = 1
	var/busy = 0

/obj/structure/stalker/water/luzha
	name = "puddle"
	desc = "Обыкновенна&#255; лужа. Вода, вроде бы, не сама&#255; чиста&#255;."
	icon_state = "luzha"

/obj/structure/stalker/water/luzha/kap
	name = "puddle"
	desc = "Обыкновенна&#255; лужа. Вода, вроде бы, не сама&#255; чиста&#255;. Кап-кап."
	icon_state = "luzha_kap"

/obj/structure/stalker/truba
	name = "pipe"
	desc = "Стара&#255; ржава&#255; труба."
	icon_state = "truba"

/obj/structure/stalker/truba/vert
	icon_state = "truba_v"

/obj/structure/stalker/bochka
	name = "barrel"
	desc = "Железна&#255; непримечательна&#255; бочка."
	icon_state = "bochka"
	density = 1

/obj/structure/stalker/bochka/red
	icon_state = "red_bochka"

/obj/structure/stalker/water/bochka
	name = "Barrel"
	desc = "Железна&#255; бочка, наполненна&#255;, скорее всего, дождевой водой."
	icon_state = "bochka_s_vodoy"
	density = 1

/obj/structure/stalker/water/bochka/kap
	name = "Barrel"
	desc = "Железна&#255; бочка, наполненна&#255;, скорее всего, дождевой водой. Кап-кап."
	icon_state = "diryavaya_bochka_s_vodoy"


/obj/structure/stalker/rozetka
	name = "socket"
	desc = "Стара&#255; советска&#255; розетка."
	icon_state = "rozetka"

/obj/structure/stalker/krest
	name = "cross"
	desc = "Дерев&#255;нный крест."
	icon_state = "krest"
	density = 0

/obj/structure/stalker/krest/bereza
	icon_state = "krest_bereza"

/obj/structure/stalker/komod
	name = "komod"
	desc = "Обыкновенный дерев&#255;нный комод."
	icon_state = "komod"
	density = 1
	pass_flags = LETPASSTHROW

/obj/structure/stalker/shina
	name = "shina"
	desc = "Тяжела&#255; стара&#255; пробита&#255; шина."
	icon_state = "shina"
	density = 1

/obj/structure/stalker/shina2
	name = "two shina"
	desc = "Тяжелые старые пробитые шины."
	icon_state = "shina2"
	density = 1

/obj/structure/stalker/shina3
	name = "three shina"
	desc = "Тяжелые старые пробитые шины."
	icon_state = "shina3"
	density = 1

/obj/structure/stalker/shina3
	name = "three shina"
	desc = "Тяжелые старые пробитые шины."
	icon_state = "shina3a"
	density = 1

/obj/structure/stalker/switcher
	name = "switcher"
	desc = "Неисправный выключатель.\n<span class='notice'>Вы начинаете щелкать его и обретаете на некоторое врем&#255; покой.</span>"
	icon_state = "vikluchatel"

/obj/structure/stalker/doski
	name = "planks"
	desc = "Сломанные доски. Использовать где-либо их уже не получитс&#255;."
	icon_state = "doski_oblomki"
	layer = 2.8
	pass_flags = LETPASSTHROW

/obj/structure/stalker/doski/doski2
	icon_state = "doski_oblomki2"

/obj/structure/stalker/doski/doski3
	icon_state = "doski_oblomki3"

/obj/structure/stalker/doski/doski4
	icon_state = "doski_oblomki4"

/obj/structure/stalker/battery
	name = "battery"
	desc = "Ржава&#255; отопительна&#255; батаре&#255;. Когда-то согревала дома, сейчас - просто очередна&#255; железка."
	icon_state = "gazovaya_truba"

/obj/structure/stalker/vanna
	name = "bath"
	desc = "Стара&#255; чугунна&#255; ванна. Ничего особенного."
	icon_state = "vanna"
	density = 1

/obj/structure/stalker/list
	name = "stain-roof sheet"
	desc = "Т&#255;жёлый жест&#255;нной покорёженный лист. Использовать его уже никак не получитс&#255;."
	icon_state = "list_zhesti"

/obj/structure/stalker/yashik
	name = "wooden box"
	icon_state = "yashik"
	density = 1

/obj/structure/stalker/yashik/yaskik_a
	name = "crate"
	icon_state = "yashik_a"

/obj/structure/stalker/yashik/yaskik_a/big
	icon = 'icons/stalker/decorations_32x64.dmi'
	icon_state = "crate"
	opacity = 1
	layer = 9

/obj/structure/stalker/propane
	name = "propane"
	desc = "Баллон с пропаном. Огнеопасно."
	icon = 'icons/stalker/decorations_32x64.dmi'
	icon_state = "propane"

/obj/structure/stalker/stolb
	name = "pillar"
	icon = 'icons/stalker/decorations_32x64.dmi'
	icon_state = "stolb"
	layer = 9

/obj/structure/stalker/propane/dual
	icon_state = "propane_dual"

/obj/structure/stalker/pen
	name = "stump"
	desc = "Обычный пень. Ни больше, ни меньше."
	icon_state = "pen"

/obj/structure/stalker/radio
	name = "radio"
	desc = "Старое сломанное советское радио"
	icon_state = "radio"

/obj/structure/stalker/apc
	name = "switchboard"
	desc = "Старый электрощиток."
	icon_state = "apc"

/obj/structure/stalker/apc/open
	icon_state = "apc1"

/obj/structure/stalker/apc/open2
	icon_state = "apc2"

/obj/structure/stalker/cover
	icon = 'icons/stalker/cover.dmi'
	icon_state = "cover"

/obj/structure/stalker/porog
	name = "step"
	icon = 'icons/stalker/decor.dmi'
	icon_state = "porog1"
	layer = 2.9

/obj/structure/stalker/porog/porog2
	icon = 'icons/stalker/decor.dmi'
	icon_state = "porog2"

/obj/structure/stalker/televizor
	name =  "televisor"
	desc = "Старый советский телевизор."
	icon_state = "TV"
	density = 1

/obj/structure/stalker/clocks
	name =  "clocks"
	desc = "Остановились."
	icon = 'icons/stalker/prishtina/decorations_32x32.dmi'
	icon_state = "clocks"

/obj/structure/stalker/painting
	icon = 'icons/stalker/prishtina/decorations_32x32.dmi'

/obj/structure/stalker/painting/gorbachev
	name = "painting"
	desc = "Портрет последнего секретар&#255; ЦК КПСС."
	icon_state = "gorbachev"

/obj/structure/stalker/painting/stalin
	name = "painting"
	desc = "Портрет второго секретар&#255; ЦК КПСС."
	icon_state = "stalin"

/obj/structure/stalker/painting/lenin
	name = "painting"
	desc = "Портрет первого секретар&#255; ЦК КПСС."
	icon_state = "lenin"

/obj/structure/stalker/televizor/broken
	icon_state = "TV_b"
	name =  "Televisor"
	desc = "Старый разбитый советский телевизор."

/obj/structure/stalker/bigyashik
	name = "Metal Container"
	icon = 'icons/stalker/yashiki/decorations_64x64.dmi'
	icon_state = "bigyashik 0.0"
	density = 1
	opacity = 1

/obj/structure/stalker/bigyashik/melkiy
	icon = 'icons/stalker/yashiki/decorations_32x64.dmi'
	icon_state = "bigyashik"

/obj/structure/stalker/water/attack_hand(mob/living/user)
	if(!user || !istype(user))
		return
	if(!iscarbon(user))
		return
	if(!Adjacent(user))
		return

	if(busy)
		user << "<span class='notice'>Someone's already washing here.</span>"
		return
	var/selected_area = parse_zone(user.zone_sel.selecting)
	var/washing_face = 0
	if(selected_area in list("head", "mouth", "eyes"))
		washing_face = 1
	user.visible_message("<span class='notice'>[user] start washing their [washing_face ? "face" : "hands"]...</span>", \
						"<span class='notice'>You start washing your [washing_face ? "face" : "hands"]...</span>")
	busy = 1

	if(!do_after(user, 40, target = src))
		busy = 0
		return

	busy = 0

	user.visible_message("<span class='notice'>[user] washes their [washing_face ? "face" : "hands"] using [src].</span>", \
						"<span class='notice'>You wash your [washing_face ? "face" : "hands"] using [src].</span>")
	if(washing_face)
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			H.lip_style = null //Washes off lipstick
			H.lip_color = initial(H.lip_color)
			H.regenerate_icons()
		user.drowsyness -= rand(2,3) //Washing your face wakes you up if you're falling asleep
		user.drowsyness = Clamp(user.drowsyness, 0, INFINITY)
	else
		user.clean_blood()


/obj/structure/stalker/water/attackby(obj/item/O, mob/user, params)
	if(busy)
		user << "<span class='warning'>Someone's already washing here!</span>"
		return

	if(istype(O, /obj/item/weapon/reagent_containers))
		var/obj/item/weapon/reagent_containers/RG = O
		if(RG.flags & OPENCONTAINER)
			RG.reagents.add_reagent("water", min(RG.volume - RG.reagents.total_volume, RG.amount_per_transfer_from_this))
			user << "<span class='notice'>You fill [RG] from [src].</span>"
			return

	if(istype(O, /obj/item/weapon/melee/baton))
		var/obj/item/weapon/melee/baton/B = O
		if(B.bcell)
			if(B.bcell.charge > 0 && B.status == 1)
				flick("baton_active", src)
				var/stunforce = B.stunforce
				user.Stun(stunforce)
				user.Weaken(stunforce)
				user.stuttering = stunforce
				B.deductcharge(B.hitcost)
				user.visible_message("<span class='warning'>[user] shocks themself while attempting to wash the active [B.name]!</span>", \
									"<span class='userdanger'>You unwisely attempt to wash [B] while it's still on.</span>")
				playsound(src, "sparks", 50, 1)
				return

	if(istype(O, /obj/item/weapon/mop))
		O.reagents.add_reagent("water", 5)
		user << "<span class='notice'>You wet [O] in [src].</span>"
		playsound(loc, 'sound/effects/slosh.ogg', 25, 1)

	var/obj/item/I = O
	if(!I || !istype(I))
		return
	if(I.flags & ABSTRACT) //Abstract items like grabs won't wash. No-drop items will though because it's still technically an item in your hand.
		return

	user << "<span class='notice'>You start washing [I]...</span>"
	busy = 1
	if(!do_after(user, 40, target = src))
		busy = 0
		return
	busy = 0
	O.clean_blood()
	user.visible_message("<span class='notice'>[user] washes [I] using [src].</span>", \
						"<span class='notice'>You wash [I] using [src].</span>")

/obj/structure/stalker/oscillograph
	name = "oscillograph"
	desc = ""
	icon_state = "oscillograph_off"

/obj/structure/stalker/panel
	name = "machine"
	desc = ""
	icon_state = "panel_1"
	density = 1

/obj/structure/stalker/panel/panel2
	icon_state = "panel_2"

/obj/structure/stalker/musor_yashik
	name = "garbage crate"
	desc = "Мусорный &#255;щик"
	density = 1

/obj/structure/stalker/musor_yashik/red
	icon_state = "yashik_musor"

/obj/structure/stalker/musor_yashik/red/full
	icon_state = "yashik_musor_full"

/obj/structure/stalker/musor_yashik/green
	icon_state = "yashik_musor2"

/obj/structure/stalker/musor_yashik/green/full
	icon_state = "yashik_musor2_full"

/obj/structure/stalker/shitok
	name = "switch box"
	desc = "Старый электрический щиток"
	icon_state = "shitok"

/obj/structure/stalker/broke_table
	name = "table"
	desc = "Перевернутый стол"
	icon_state = "broke_table1"
	density = 1

/obj/structure/stalker/broke_table/right
	icon_state = "broke_table2"

/obj/structure/stalker/lift
	name = "elevator"
	desc = "Старый ооветский лифт. Веро&#255;тнее всего он уже никогда не заработает"
	icon_state = "lift"

/obj/structure/stalker/luk
	name = "hatch"
	desc = "Закрытый канализационный люк"
	icon = 'icons/stalker/decor2.dmi'
	icon_state = "luk0"

/obj/structure/stalker/luk/open
	desc = "Открытый канализационый люк. Интересно, что внутри?"
	icon_state = "luk1"

/obj/structure/stalker/luk/open/ladder
	desc = "Открытый канализационны люк с лестницей. Интересно, что внутри?"
	icon_state = "luk2"

/obj/structure/stalker/trubas
	name = "pipe"
	desc = "Большие ржавые трубы, служили дл&#255; газоснабжени&#255;."
	icon = 'icons/stalker/structure/trubas.dmi'
	icon_state = "trubas"
	density = 1

/obj/structure/stalker/sign/bar100rentgen
	name = "sign"
	desc = "Небольшая табличка с красивой надписью 'Бар 100 Рентген'"
	icon_state = "100_rentgen"

/obj/structure/stalker/bar_plitka
	name = "tile"
	icon = 'icons/stalker/floor.dmi'
	icon_state = "bar_plate1"
	layer = 2.3

/obj/structure/stalker/bar_plitka/New()
	..()
	pixel_x = rand(-2, 2)
	pixel_y = rand(-2, 2)

/obj/structure/stalker/bunker
	name = "bunker"
	icon = 'icons/stalker/bunker.dmi'
	density = 1
	opacity = 1