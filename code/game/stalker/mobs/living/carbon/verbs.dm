/mob/living/carbon/verb/Poo()
	set category = "Life"
	set name = "Poo"
	if(stat != DEAD)
		if(shit > 7)
			var/turf/T = get_turf(src)
			var/shit_obj = /obj/item/weapon/reagent_containers/food/snacks/stalker/shit
			src << "<span class='notice'>Вы снимаете штаны и начинаете делать кучу.</span>"
			if(!do_after(src, 20, 1, src))	return
			if(shit > 15)
				new shit_obj(T)
				new shit_obj(T)
				src << "<span class='notice'>Какой молодец! Вы сделали целых две кучи! Скорее похвастайтесь друзь&#255;м!</span>"
			else
				new shit_obj(T)
				src << "<span class='notice'>Вы сделали кучу.</span>"
			shit = 0
		else
			src << "<span class='notice'>Вы не хотите делать кучу.</span>"