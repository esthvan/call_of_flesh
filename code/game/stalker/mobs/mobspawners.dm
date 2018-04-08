/obj/effect/spawner/lootdrop/stalker/mobspawner
	name = "mob spawner"
	cooldown = 1000

/obj/effect/spawner/lootdrop/stalker/mobspawner/SpawnLoot(enable_cooldown = 1)
	if(loot && loot.len)
		if(!enable_cooldown)
			for(var/k = 0, k < CanSpawn(), k++)
				if(!loot.len) break
				var/lootspawn = pickweight(loot)
				if(lootspawn)
					var/turf/T = get_turf(src)
					var/mob/living/M = new lootspawn(T)
					spawned_loot.Add(M)
					RandomMove(M)
		else
			spawn(cooldown)
				for(var/k = 0, k < CanSpawn(), k++)
					if(!loot.len) return
					var/lootspawn = pickweight(loot)
					if(lootspawn)
						var/turf/T = get_turf(src)
						var/mob/living/M = new lootspawn(T)
						spawned_loot.Add(M)
						RandomMove(M)
				SpawnLoot()

/obj/effect/spawner/lootdrop/stalker/mobspawner/CanSpawn()
	var/count = 0
	var/id_ = 0
	var/list/ids = new()
	for(var/mob/living/M in spawned_loot)
		if(M.stat != 2)
			count++
		else
			ids.Add(id_)
		id_++
	for(var/id in ids)
		spawned_loot.Cut(id, id)
	return max_spawned - count

/obj/effect/spawner/lootdrop/stalker/mobspawner/flesh_spawner
	name = "flesh mutant"
	lootcount = 3
	radius = 10 //Радиус разброса лута
	cooldown = 6000 //Кол-во минут * 1000 - кд шитспавна
	loot = list(/mob/living/simple_animal/hostile/mutant/flesh = 100)

/obj/effect/spawner/lootdrop/stalker/mobspawner/dog_spawner
	name = "dog mutant"
	lootcount = 2
	radius = 10 //Радиус разброса лута
	cooldown = 6000 //Кол-во минут * 1000 - кд шитспавна
	loot = list(/mob/living/simple_animal/hostile/mutant/dog = 100)

/obj/effect/spawner/lootdrop/stalker/mobspawner/kaban_spawner
	name = "kaban mutant"
	lootcount = 1
	radius = 10 //Радиус разброса лута
	cooldown = 6000 //Кол-во минут * 1000 - кд шитспавна
	loot = list(/mob/living/simple_animal/hostile/mutant/kaban = 100)

/obj/effect/spawner/lootdrop/stalker/mobspawner/snork_spawner
	name = "snork mutant"
	lootcount = 1
	radius = 1
	cooldown = 9000
	loot = list(/mob/living/simple_animal/hostile/mutant/snork = 100)