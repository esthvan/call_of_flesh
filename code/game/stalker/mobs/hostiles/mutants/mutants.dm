/mob/living/simple_animal/hostile/mutant
	stat_attack = 2
	fearless = 0
	var/gib_targets = 1 //Гибать
	icon = 'icons/stalker/stalker.dmi'
	var/deletable = 1 //Self-deletable dead bodies
	speak_chance = 1

/*
/mob/living/simple_animal/hostile/mutant/death(gibbed)
	..()
	if(deletable)
		spawn(300)
			qdel(src)
*/

/mob/living/simple_animal/hostile/mutant/Move(atom/NewLoc, direct)
	var/area/B = get_area(NewLoc)
	for(var/A in safezones)
		if(B.type == A)
			src << "<span class='warning'>Вы не можете находитьc&#255; в этой зоне!</span>"
			return 0
	. = ..()

/mob/living/simple_animal/hostile/mutant/AttackingTarget()
	..()
	if(istype(target, /mob/living))
		var/mob/living/L = target
		if (L.stat == DEAD && gib_targets)
			if(ishuman(L))
				var/mob/living/carbon/human/H = L
				if(prob(50))
					H.unEquip(H.ears)
				if(prob(50))
					H.unEquip(H.gloves)
				if(prob(50))
					H.unEquip(H.glasses)
				if(prob(50))
					H.unEquip(H.head)
				if(prob(50))
					H.unEquip(H.shoes)
				H.unEquip(H.back)
				H.unEquip(H.wear_id)
			L.gib()
			visible_message("<span class='danger'>[src] разрывает [L] на кусочки!</span>")
			src << "<span class='userdanger'>Вы пожираете [L] и востанавливаете себе здоровье!</span>"
			src.revive()

/mob/living/simple_animal/hostile/mutant/mrspooky
	name = "Mr.Spooky"
	desc = "Ход&#255;ча&#255; груда костей, 3spooky5u"
	icon = 'icons/mob/human.dmi'
	icon_state = "skeleton_s"
	icon_living = "skeleton_s"
	icon_dead = "skeleton_dead"
	turns_per_move = 5
	speak_emote = list("spooks")
	emote_see = list("spooks")
	a_intent = "harm"
	maxHealth = 100
	fearborder = 30
	health = 40
	speed = 1
	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 15
	minbodytemp = 0
	maxbodytemp = 1500
	healable = 0 //they're skeletons how would bruise packs help them??
	attacktext = "spooks"
	attack_sound = 'sound/hallucinations/wail.ogg'
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 10
	environment_smash = 1
	robust_searching = 1
	search_objects = 1
	gold_core_spawnable = 1
	faction = list("skeleton")
	see_invisible = SEE_INVISIBLE_MINIMUM
	see_in_dark = 8
	layer = MOB_LAYER - 0.1
	deathmessage = "Mr.Spooky is too spooky for himself!"
	del_on_death = 1
	loot = list(/obj/effect/decal/remains/human)

/mob/living/simple_animal/hostile/mutant/dog
	name = "dog mutant"
	desc = "Мутировавша&#255; дика&#255; собака."
	turns_per_move = 5
	speed = 1
	a_intent = "harm"
	harm_intent_damage = 5
	icon_state = "stalker_dog"
	icon_living = "stalker_dog"
	icon_dead = "stalker_dog_dead"
	attacktext = "кусает"
	search_objects = 1
	speak_emote = list("скулит", "рычит")
	emote_see = list("лает!")
	faction = list("stalker_mutants1")
	attack_sound = 'sound/stalker/mobs/mutants/attack/dog_attack.ogg'
	idle_sounds = list('sound/stalker/mobs/mutants/idle/bdog_idle_1.ogg',
						'sound/stalker/mobs/mutants/idle/bdog_idle_2.ogg',
						'sound/stalker/mobs/mutants/idle/bdog_idle_3.ogg',
						'sound/stalker/mobs/mutants/idle/bdog_idle_4.ogg')
	death_sound = 'sound/stalker/mobs/mutants/death/dog_death.ogg'
	melee_damage_lower = 10
	melee_damage_upper = 20
	maxHealth = 25
	fearborder = 10
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	healable = 1
	robust_searching = 1
	see_invisible = SEE_INVISIBLE_MINIMUM
	see_in_dark = 4
	deathmessage = "Собака издаёт истошный вой!"
	del_on_death = 0
	minbodytemp = 0
	maxbodytemp = 1500
	environment_smash = 0
	layer = MOB_LAYER - 0.1
	loot = list(/obj/item/weapon/stalker/loot/dog_tail, /obj/nothing, /obj/nothing, /obj/nothing)
	random_loot = 1

/mob/living/simple_animal/hostile/mutant/snork
	name = "snork"
	desc = "Когда-то оно было человеком."
	turns_per_move = 5
	speed = 3
	a_intent = "harm"
	search_objects = 1
	icon_state = "snork"
	icon_living = "snork"
	icon_dead = "snork_dead"
	attacktext = "царапает огромными когт&#255;ми"
	speak_emote = list("рычит")
	emote_see = list("агрессивно рычит")
	maxHealth = 70
	healable = 1
	melee_damage_lower = 20
	attack_sound = 'sound/stalker/mobs/mutants/attack/snork_attack.ogg'
	idle_sounds = list('sound/stalker/mobs/mutants/idle/snork_idle_1.ogg',
						'sound/stalker/mobs/mutants/idle/snork_idle_2.ogg',
						'sound/stalker/mobs/mutants/idle/snork_idle_3.ogg')
	death_sound = 'sound/stalker/mobs/mutants/death/snork_death.ogg'
	melee_damage_upper = 30
	fearborder = 10
	see_invisible = SEE_INVISIBLE_MINIMUM
	see_in_dark = 4
	minbodytemp = 0
	maxbodytemp = 1500
	faction = list("stalker_mutants1")
	del_on_death = 0
	//environment_smash = 1
	robust_searching = 1
	deathmessage = "Снорк издает истошный вопль и падает навзничь!"
	layer = MOB_LAYER - 0.1
	loot = list(/obj/nothing, /obj/nothing, /obj/nothing, /obj/nothing, /obj/nothing)
	random_loot = 1
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	ranged = 1
	ranged_cooldown = 1 //By default, start the Goliath with his cooldown off so that people can run away quickly on first sight
	ranged_cooldown_cap = 4

	var/leaping = 0

/mob/living/simple_animal/hostile/mutant/snork/OpenFire()
	if(get_dist(src, target) <= 4)
		leaping = 1
		//throw_at_fast(target, 7, 1)
		throw_at(target, 7, 1, spin=1, diagonals_first = 1)
		leaping = 0
		ranged_cooldown = ranged_cooldown_cap
	return
				//sleep(10)

/mob/living/simple_animal/hostile/mutant/snork/throw_impact(atom/A)

	if(!leaping)
		return ..()

	if(A)
		if(istype(A, /mob/living))
			var/mob/living/L = A
			var/blocked = 0
			if(ishuman(A))
				var/mob/living/carbon/human/H = A
				if(H.check_shields(90, "the [name]", src, attack_type = THROWN_PROJECTILE_ATTACK))
					blocked = 1
			if(!blocked)
				L.visible_message("<span class ='danger'>[src] pounces on [L]!</span>", "<span class ='userdanger'>[src] pounces on you!</span>")
				L.Weaken(1)
				sleep(2)//Runtime prevention (infinite bump() calls on hulks)
				step_towards(src,L)
		else if(A.density && !A.CanPass(src))
			visible_message("<span class ='danger'>[src] smashes into [A]!</span>", "<span class ='alertalien'>[src] smashes into [A]!</span>")
			weakened = 2

		if(leaping)
			leaping = 0
			update_icons()
			update_canmove()

/mob/living/simple_animal/hostile/mutant/flesh
	name = "flesh"
	desc = "Мутировавшие свиньи."
	turns_per_move = 5
	speed = 20
	a_intent = "harm"
	search_objects = 1
	icon_state = "plot"
	icon_living = "plot"
	icon_dead = "plot_dead"
	attacktext = "бьет"
	speak_emote = list("хрюкает")
	emote_see = list("агрессивно визжит!")
	maxHealth = 40
	healable = 5
	melee_damage_lower = 20
	attack_sound = 'sound/stalker/mobs/mutants/attack/flesh_attack.ogg'
	idle_sounds = list('sound/stalker/mobs/mutants/idle/flesh_idle_1.ogg',
						'sound/stalker/mobs/mutants/idle/flesh_idle_2.ogg')
	death_sound = 'sound/stalker/mobs/mutants/death/flesh_death.ogg'
	melee_damage_upper = 30
	fearborder = 18
	see_invisible = SEE_INVISIBLE_MINIMUM
	see_in_dark = 4
	minbodytemp = 0
	maxbodytemp = 1500
	faction = list("stalker_mutants1")
	del_on_death = 0
	environment_smash = 1
	robust_searching = 0
	deathmessage = "Плоть издает предсмертный визг!"
	layer = MOB_LAYER - 0.1
	loot = list(/obj/item/weapon/stalker/loot/flesh_eye, /obj/nothing, /obj/nothing, /obj/nothing, /obj/nothing)
	random_loot = 1
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)

/mob/living/simple_animal/hostile/mutant/kaban
	name = "boar"
	desc = "Коренное население."
	turns_per_move = 5
	speed = 5
	a_intent = "harm"
	search_objects = 1
	icon_state = "kaban"
	icon_living = "kaban"
	icon_dead = "kaban_dead"
	attacktext = "бьет"
	speak_emote = list("хрюкает")
	emote_see = list("агрессивно визжит!")
	maxHealth = 150
	healable = 1
	melee_damage_lower = 20
	attack_sound = 'sound/stalker/mobs/mutants/attack/boar_attack.ogg'
	idle_sounds = list('sound/stalker/mobs/mutants/idle/boar_idle_1.ogg',
						'sound/stalker/mobs/mutants/idle/boar_idle_2.ogg',
						'sound/stalker/mobs/mutants/idle/boar_idle_3.ogg')
	death_sound = 'sound/stalker/mobs/mutants/death/boar_death.ogg'
	melee_damage_upper = 45
	fearborder = 18
	see_invisible = SEE_INVISIBLE_MINIMUM
	see_in_dark = 4
	minbodytemp = 0
	maxbodytemp = 1500
	faction = list("stalker_mutants1")
	del_on_death = 0
	environment_smash = 1
	robust_searching = 0
	deathmessage = "Кабан издает предсмертный визг!"
	layer = MOB_LAYER - 0.1
	loot = list(/obj/item/weapon/stalker/loot/boar_leg, /obj/nothing, /obj/nothing, /obj/nothing, /obj/nothing)
	random_loot = 1
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)

	/*Код крашера с колониал маринов
	Раскидывает мобов с дороги в стороны
	for(var/o=0, o<10, o++)
		target = get_turf(get_step(target,cur_dir))
	L.throw_at(target, 200, 100)
	*/