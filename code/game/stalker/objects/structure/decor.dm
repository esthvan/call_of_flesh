/obj/structure/stalker
	icon = 'icons/stalker/decor.dmi'
	density = 0
	anchored = 1
	layer = 3.1

/obj/structure/sign/vendor
	name = "vendor sign"
	desc = "There is a vendor this way!"
	icon = 'icons/stalker/decor.dmi'
	icon_state = "sign_vendor"
	density = 0

/obj/structure/sign/skadovsk_bar
	name = "bar sign"
	desc = "There is a bar this way!"
	icon = 'icons/stalker/decor.dmi'
	icon_state = "sign_bar"
	density = 0

/obj/structure/stalker/cacheable/polka
	name = "shelf"
	desc = "Дерев&#255;нный стеллаж."
	eng_desc = "Wooden shelf."
	icon = 'icons/stalker/polka.dmi'
	icon_state = "polka"
	density = 1
	anchored = 1
	cache_size = 0
	pass_flags = LETPASSTHROW

/obj/structure/stalker/radiation
	name = "radiation sign"
	desc = "Этот знак здесь &#255;вно не дл&#255; красоты."
	eng_desc = "This sign symbolise something."
	icon_state = "radiation_sign"
	density = 1
	pass_flags = LETPASSTHROW

/obj/structure/stalker/radiation/stop
	name = "sign"
	desc = "На табличке написано - \"Стоп! Запретна&#255; зона! Проход запрещен!\"."
	eng_desc = "On the sign: \"Stop! Forbidden zone! No enterance!\"."
	icon_state = "stop_sign"

/obj/structure/stalker/water
	anchored = 1
	var/busy = 0

/obj/structure/stalker/water/luzha
	name = "puddle"
	desc = "Обыкновенна&#255; лужа. Вода, вроде бы, не сама&#255; чиста&#255;, но умытьс&#255; или смыть остатки гр&#255;зи с одежды в ней можно."
	eng_desc = "Water in this puddle is not very clean. But you can still wash your face or clothes with it."
	icon_state = "luzha"

/obj/structure/stalker/water/luzha/kap
	name = "puddle"
	desc = "Обыкновенна&#255; лужа. Вода, вроде бы, не сама&#255; чиста&#255;, но умытьс&#255; или смыть остатки гр&#255;зи с одежды в ней можно."
	eng_desc = "Water in this puddle is not very clean. But you can still wash your face or clothes with it."
	icon_state = "luzha_kap"

/obj/structure/stalker/cacheable/truba
	name = "pipe"
	desc = "Стара&#255; ржава&#255; труба."
	eng_desc = "Old rusty pipe."
	icon_state = "truba"
	density = 0
	cache_size = 1

/obj/structure/stalker/cacheable/truba/vert
	icon_state = "truba_v"

/obj/structure/stalker/cacheable/body
	name = "stalker's body"
	desc = "Полусгниший труп сталкера."
	eng_desc = "Dead smelly stalker."
	icon_state = "deadbody1"
	density = 0
	cache_size = 2

/obj/structure/stalker/cacheable/body/New()
	..()
	icon_state = "deadbody[rand(1,6)]"

/obj/structure/stalker/cacheable/bochka
	name = "barrel"
	desc = "Железна&#255; непримечательна&#255; бочка."
	eng_desc = "Old steel barrel."
	icon_state = "bochka"
	density = 1
	cache_size = 2

/obj/structure/stalker/cacheable/bochka/red
	name = "red barrel"
	icon_state = "red_bochka"

/obj/structure/stalker/water/bochka
	name = "barrel"
	desc = "Железна&#255; бочка, наполненна&#255; дождевой водой. Здесь можно умытьс&#255; или смыть остатки гр&#255;зи."
	eng_desc = "Old steel barrel full of rainwater. You can wash your face oк clothes with it."
	icon_state = "bochka_s_vodoy"
	density = 1

/obj/structure/stalker/water/bochka/kap
	name = "barrel"
	desc = "Железна&#255; бочка, наполненна&#255; дождевой водой. Здесь можно умытьс&#255; или смыть остатки гр&#255;зи."
	eng_desc = "Old steel barrel full of rainwater. You can wash your face oк clothes with it."
	icon_state = "diryavaya_bochka_s_vodoy"


/obj/structure/stalker/cacheable/rozetka
	name = "socket"
	desc = "Стара&#255; советска&#255; розетка."
	eng_desc = "Old soviet socket. Doesn't work."
	icon_state = "rozetka"
	density = 0
	cache_size = 0

/obj/structure/stalker/cacheable/krest
	name = "cross"
	desc = "Дерев&#255;нный крест. Кажетс&#255;, здесь кто-то закопан."
	eng_desc = "Wooden cross. Looks like someone is burried here."
	icon_state = "krest"
	density = 0
	cache_size = 1

/obj/structure/stalker/cacheable/krest/bereza
	icon_state = "krest_bereza"

/obj/structure/stalker/cacheable/komod
	name = "komod"
	desc = "Обыкновенный дерев&#255;нный комод."
	eng_desc = "Wooden chest of drawers."
	icon_state = "komod"
	density = 1
	pass_flags = LETPASSTHROW
	cache_size = 1

/obj/structure/stalker/shina
	name = "tire"
	desc = "Т&#255;жела&#255; стара&#255; пробита&#255; шина."
	eng_desc = "Heavy old flat tire."
	icon_state = "shina"
	density = 1
	pass_flags = LETPASSTHROW

/obj/structure/stalker/shina2
	name = "bunch of tires"
	desc = "Т&#255;желые старые пробитые шины."
	eng_desc = "A couple of heavy old flat tires."
	icon_state = "shina2"
	density = 1

/obj/structure/stalker/cacheable/shina3
	name = "pile of tires"
	desc = "Т&#255;желые старые пробитые шины."
	eng_desc = "A couple of heavy old flat tires."
	icon_state = "shina3a"
	density = 1
	cache_size = 1

/obj/structure/stalker/cacheable/switcher
	name = "switcher"
	desc = "Неисправный выключатель.\n<span class='notice'>Вы начинаете щелкать его и обретаете на некоторое врем&#255; покой.</span>"
	eng_desc = "Broken switcher. \n<span class='notice'>You start switching it and feel calm.</span>"
	icon_state = "vikluchatel"
	cache_size = 0

/obj/structure/stalker/doski
	name = "planks"
	desc = "Сломанные доски. Использовать где-либо их уже не получитс&#255;."
	eng_desc = "Broken planks."
	icon_state = "doski_oblomki"
	layer = 2.8
	//pass_flags = LETPASSTHROW

/obj/structure/stalker/doski/doski2
	icon_state = "doski_oblomki2"

/obj/structure/stalker/doski/doski3
	icon_state = "doski_oblomki3"

/obj/structure/stalker/doski/doski4
	icon_state = "doski_oblomki4"

/obj/structure/stalker/cacheable/battery
	name = "battery"
	desc = "Ржава&#255; отопительна&#255; батаре&#255;. Когда-то согревала дома, сейчас - просто очередна&#255; железка."
	eng_desc = "Old rusty radiator. Doesn't produce any heat."
	icon_state = "gazovaya_truba"
	density = 0
	cache_size = 1

/obj/structure/stalker/cacheable/vanna
	name = "bath"
	desc = "Стара&#255; чугунна&#255; ванна. Ничего особенного."
	eng_desc = "Old cast-iron bath. Nothing special."
	icon_state = "vanna"
	density = 1
	cache_size =  2
	pass_flags = LETPASSTHROW

/obj/structure/stalker/list
	name = "stain-roof sheet"
	desc = "Т&#255;жёлый жест&#255;нной покорёженный лист. Использовать его уже никак не получитс&#255;."
	eng_desc = "Old stain-roof sheet."
	icon_state = "list_zhesti"
	density = 0

/obj/structure/stalker/cacheable/yashik
	name = "wooden crate"
	icon_state = "yashik"
	desc = "Старый &#255;щик."
	eng_desc = "Old wooden crate."
	density = 1
	cache_size = 1

/obj/structure/stalker/cacheable/yashik/yaskik_a
	name = "crate"
	icon_state = "yashik_a"
	desc = "Старый &#255;щик."
	eng_desc = "Old wooden crate."
	density = 1
	cache_size = 2

/obj/structure/stalker/cacheable/yashik/yaskik_a/big
	icon = 'icons/stalker/decorations_32x64.dmi'
	icon_state = "crate"
	desc = "Большой старый &#255;щик."
	eng_desc = "Old big wooden crate."
	opacity = 1
	density = 1
	layer = 9
	cache_size = 3

/obj/structure/stalker/propane
	name = "propane"
	desc = "Баллон с пропаном. Огнеопасно. Наверное."
	eng_desc = "Propane balloon. Flammable. Probably."
	icon = 'icons/stalker/decorations_32x64.dmi'
	icon_state = "propane"
	density = 1

/obj/structure/stalker/stolb
	name = "pillar"
	icon = 'icons/stalker/decorations_32x64.dmi'
	icon_state = "stolb"
	desc = "Столб с вис&#255;щими остатками проводов."
	eng_desc = "Old pillar."
	layer = 9
	density = 0

/obj/structure/stalker/propane/dual
	icon_state = "propane_dual"

/obj/structure/stalker/cacheable/pen
	name = "stump"
	desc = "Обычный пень. Ни больше, ни меньше."
	eng_desc = "A small stump."
	icon_state = "pen"
	density = 0
	cache_size = 0

/obj/structure/stalker/cacheable/radio
	name = "radio"
	desc = "Старое сломанное советское радио."
	eng_desc = "Broken soviet radio."
	icon_state = "radio"
	density = 1
	cache_size = 1
	pass_flags = LETPASSTHROW

/obj/structure/stalker/cacheable/apc
	name = "switchboard"
	desc = "Старый электрощиток."
	eng_desc = "Old switchboard."
	icon_state = "apc"
	density = 0
	cache_size = 1

/obj/structure/stalker/cacheable/apc/open
	icon_state = "apc1"

/obj/structure/stalker/cacheable/apc/open2
	icon_state = "apc2"

/obj/structure/stalker/cacheable/cover
	name = "carpet"
	icon = 'icons/stalker/cover.dmi'
	icon_state = "cover"
	desc = "Старый ковёр. Обычно висит на стене."
	eng_desc = "Old carpet. You usually see this on the wall."
	density = 0
	cache_size = 0

/obj/structure/stalker/cacheable/porog
	name = "step"
	icon = 'icons/stalker/decor.dmi'
	icon_state = "porog1"
	desc = "Старый порог, о который можно легко зацепитьс&#255; ногой."
	eng_desc = "Old step."
	layer = 2.9
	density = 0
	cache_size = 0

/obj/structure/stalker/cacheable/porog/porog2
	icon = 'icons/stalker/decor.dmi'
	icon_state = "porog2"

/obj/structure/stalker/cacheable/televizor
	name =  "TV-set"
	desc = "Старый советский телевизор."
	eng_desc = "Old soviet TV-set."
	icon_state = "TV"
	density = 1
	cache_size = 1
	pass_flags = LETPASSTHROW

/obj/structure/stalker/cacheable/clocks
	name =  "clocks"
	desc = "Остановились."
	eng_desc = "Doesn't work anymore."
	icon = 'icons/stalker/prishtina/decorations_32x32.dmi'
	icon_state = "clocks"
	density = 0
	cache_size = 0

/obj/structure/stalker/cacheable/painting
	icon = 'icons/stalker/prishtina/decorations_32x32.dmi'
	density = 0
	cache_size = 0

/obj/structure/stalker/cacheable/painting/gorbachev
	name = "painting"
	desc = "Портрет последнего секретар&#255; ЦК КПСС."
	eng_desc = "Portrait of the last general secretary of Central Committee of the Communist Party of the Soviet Union."
	icon_state = "gorbachev"

/obj/structure/stalker/cacheable/painting/stalin
	name = "painting"
	desc = "Портрет второго секретар&#255; ЦК КПСС."
	eng_desc = "Portrait of the second general secretary of Central Committee of the Communist Party of the Soviet Union."
	icon_state = "stalin"

/obj/structure/stalker/cacheable/painting/lenin
	name = "painting"
	desc = "Портрет первого секретар&#255; ЦК КПСС."
	eng_desc = "Portait of the first general secretary of Central Committee of the Communist Party of the Soviet Union."
	icon_state = "lenin"

/obj/structure/stalker/cacheable/intercom
	name = "intercom"
	desc = "Домофон."
	eng_desc = "Soviet intercom."
	icon = 'icons/stalker/backwater.dmi'
	icon_state = "intercom"
	density = 0
	cache_size = 0

/obj/structure/stalker/cacheable/televizor/broken
	icon_state = "TV_b"
	name =  "TV-set"
	desc = "Старый разбитый советский телевизор."
	density = 1
	cache_size = 2
	pass_flags = LETPASSTHROW

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
	density = 1
	pass_flags = LETPASSTHROW

/obj/structure/stalker/panel
	name = "machine"
	desc = ""
	icon_state = "panel_1"
	density = 1

/obj/structure/stalker/panel/panel2
	icon_state = "panel_2"

/obj/structure/stalker/cacheable/musor_yashik
	name = "dumpster"
	desc = "Мусорный &#255;щик"
	eng_desc = "Dumpster. Still stinks."
	density = 1
	cache_size = 3

/obj/structure/stalker/cacheable/musor_yashik/red
	icon_state = "yashik_musor"

/obj/structure/stalker/cacheable/musor_yashik/red/full
	icon_state = "yashik_musor_full"

/obj/structure/stalker/cacheable/musor_yashik/green
	icon_state = "yashik_musor2"

/obj/structure/stalker/cacheable/musor_yashik/green/full
	icon_state = "yashik_musor2_full"

/obj/structure/stalker/cacheable/shitok
	name = "switch box"
	desc = "Старый электрический щиток."
	eng_desc = "Old switch box."
	icon_state = "shitok"
	cache_size = 1
	density = 0

/obj/structure/stalker/cacheable/shitok/shitok2
	name = "switch box"
	desc = "Старый электрический щиток."
	eng_desc = "Old switch box."
	icon_state = "shitok2"
	cache_size = 1
	density = 0

/obj/structure/stalker/broke_table
	name = "table"
	desc = "Перевёрнутый стол."
	eng_desc = "Flipped over table."
	icon_state = "broke_table1"
	density = 1

/obj/structure/stalker/broke_table/right
	icon_state = "broke_table2"

/obj/structure/stalker/lift
	name = "elevator"
	desc = "Старый ооветский лифт. Веро&#255;тнее всего он уже никогда не заработает."
	eng_desc = "Old soviet lift. It doesn't work anymore."
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
	desc = "Больша&#255; ржава&#255; труба, служивша&#255; дл&#255; газоснабжени&#255;."
	eng_desc = "Big rusty gas-pipe."
	icon = 'icons/stalker/structure/trubas.dmi'
	icon_state = "trubas"
	density = 1

/obj/structure/stalker/sign/bar100rentgen
	name = "sign"
	desc = "Бар 100 рентген."
	eng_desc = "100 rentgen bar."
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

/obj/structure/stalker/cacheable/plita
	name = "stove"
	desc = "Ржава&#255; и очень стара&#255; газова&#255; плита. Где-то еще можно различить слой засохшего жира вперемешку с гр&#255;зью и пылью."
	eng_desc = "Rusty old gas stove. Covered with grease and dirt."
	icon = 'icons/stalker/decor.dmi'
	icon_state = "gazovaya_plita"
	density = 1
	anchored= 1
	cache_size = 2

/obj/structure/stalker/cacheable/pech
	name = "oven"
	desc = "Стара&#255; печь."
	eng_desc = "Well-made russian oven made out of bricks."
	icon = 'icons/stalker/decor.dmi'
	icon_state = "pech"
	density = 0
	anchored = 1

/obj/structure/stalker/cacheable/shkaf64
	name = "Shkaf"
	desc = "Большой дерев&#255;нный шкаф. Красивый, но в некоторых местах стерс&#255; и облез, на стекле пошли трещины. Несмотр&#255; на это, кажетс&#255;, будто всего пару минут назад внутри сто&#255;л хрустальный бабушкин сервиз."
	eng_desc = "Tall wooden shelf in poor state."
	icon = 'icons/stalker/decorations_32x64.dmi'
	icon_state = "shkaf64"
	density = 1
	anchored = 1
	cache_size = 3

//////////////////////////////Новые тайники////////////////////////////////

/obj/structure/stalker/cacheable
	name = "cache"
	desc = "Генерирует тайник с определенным шансом в начале раунда."
	eng_desc = "Generates a stash with a certain chance at the start of the round."
	density = 1
	var/cache_chance = 0	//percent
	var/cache_quality = -1	//from 0 to 3, -1 for random
	var/cache_size = 0		//from 0 to 3
	var/obj/item/weapon/storage/stalker/cache/internal_cache = null



/obj/structure/stalker/cacheable/New()
	..()

	if(!cache_chance)
		cache_chance = rand(6,8)

	if(cache_quality == -1)
		switch(z)
			if(4 to INFINITY)
				cache_quality = rand(1, 2)//rand(2, 3)
			if(3)
				cache_quality = rand(0, 1)
			if(2)
				cache_quality = 0
				cache_chance += 2
			if(1)
				cache_quality = rand(1, 2)//0
				cache_chance -= 4

	switch(cache_quality)
		if(3)
			cache_chance -= 2.5

		if(1)
			cache_chance += 1

		if(0)
			cache_chance += 2

	if(!prob(cache_chance))
		//internal_cache = null
		return

	if(get_area(src).safezone || (get_area(src).controlled_by && get_area(src)))
		return

	switch(cache_size)
		if(0)
			internal_cache = new /obj/item/weapon/storage/stalker/cache/small(src)
		if(1)
			internal_cache = new /obj/item/weapon/storage/stalker/cache/medium(src)
		if(2)
			internal_cache = new /obj/item/weapon/storage/stalker/cache/big(src)
		if(3)
			internal_cache = new /obj/item/weapon/storage/stalker/cache/large(src)

	internal_cache.CreateContents(src)

/obj/structure/stalker/cacheable/attack_hand(mob/user)
	..()

	user.visible_message("<span class='notice'>[user] starts inspecting [src]...</span>", "<span class='notice'>You start inspecting [src]...</span>")
	if(!do_after(user, 30, 1, src))
		return

	if(!internal_cache)
		user.visible_message("<span class='notice'>[user] finds nothing in [src].</span>", "<span class='notice'>You find nothing in [src].</span>")
		return

	user.visible_message("<span class='notice'>[user] discovered a hidden cache in [src].</span>", "<span class='notice'>You discovered a hidden cache in [src].</span>")

	playsound(loc, "rustle", 50, 1, -5)
	if(user.s_active)
		user.s_active.close(user)
	internal_cache.attack_hand(user)

	if(internal_cache.waspicked || !istype(usr, /mob/living/carbon/human))
		return

	var/mob/living/carbon/human/H = usr
	internal_cache.waspicked = 1

	if(!istype(H.wear_id, /obj/item/device/stalker_pda))
		return

	var/obj/item/device/stalker_pda/KPK = H.wear_id

	if(!KPK.owner || KPK.owner != H)
		return

	show_lenta_message(null, KPK, null, "PDA", "OS", "You discovered a stash in the [src]!", selfsound = 1)

	var/datum/data/record/sk = find_record("sid", H.sid, data_core.stalkers)

	if(!sk)
		return

	sk.fields["rating"] +=  25 * (2 ** cache_quality)

	if(!internal_cache.cached_cash)
		return

	sk.fields["money"] += internal_cache.cached_cash
	show_lenta_message(null, KPK, null, "PDA", "OS", "You found a bitRU key that gave you access to [internal_cache.cached_cash] RU on your account!", selfsound = 1)
	internal_cache.cached_cash = 0

/obj/item/weapon/storage/stalker/cache
	name = "cache"
	icon = 'icons/stalker/quest.dmi'
	icon_state = "blue_box_r"
	invisibility = 101
	display_contents_with_number = 1
	var/waspicked = 0
	var/cached_cash = 0

/obj/item/weapon/storage/stalker/cache/attack_hand(mob/user)
	playsound(loc, "rustle", 50, 1, -5)
	orient2hud(user)
	if(user.s_active)
		user.s_active.close(user)
	show_to(user)
	add_fingerprint(user)

/obj/item/weapon/storage/stalker/cache/proc/CreateContents(var/obj/structure/stalker/cacheable/C)
	var/list/lootspawn = list()

	var/max_cost = 0
	switch(C.cache_quality)
		if(0)
			lootspawn = trash_tier_sidormatitems
			max_cost = TRASH_TIER_COST
		if(1)
			lootspawn = low_tier_sidormatitems
			max_cost = LOW_TIER_COST
		if(2)
			lootspawn = medium_tier_sidormatitems
			max_cost = MEDIUM_TIER_COST
		if(3)
			lootspawn = high_tier_sidormatitems
			max_cost = HIGH_TIER_COST

	var/combined_w_class = 0
	var/combined_cost = 0

	for(var/i = 0, i <= storage_slots, i++)
		if(combined_w_class > max_combined_w_class)
			break

		if(combined_cost > max_cost)
			break

		var/datum/data/stalker_equipment/SE = safepick(lootspawn)

		if(!SE)
			continue

		var/A = SE.equipment_path

		if(!A)
			continue

		var/obj/item/I = new A(src)

		if(I.w_class > max_w_class)
			PlaceInPool(I)
			continue

		combined_cost += SE.cost

		//if(I.w_class >= w_class && (istype(I, /obj/item/weapon/storage)))
		//	continue

		combined_w_class +=  I.w_class
		handle_item_insertion(I, prevent_warning = 1)

	if(max_cost - combined_cost > 0)
		cached_cash = round((max_cost - combined_cost)/2)

/obj/item/weapon/storage/stalker/cache/small
	max_w_class = 2
	max_combined_w_class = 3

/obj/item/weapon/storage/stalker/cache/medium
	max_w_class = 3
	max_combined_w_class = 6

/obj/item/weapon/storage/stalker/cache/big
	max_w_class = 4
	max_combined_w_class = 8

/obj/item/weapon/storage/stalker/cache/large
	max_w_class = 4
	max_combined_w_class = 12
