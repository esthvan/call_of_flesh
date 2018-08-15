/mob
	var/sound/ambient_music			= null		//Музыка
	var/sound/ambient_environment	= null		//Случайные короткие звуки длительностью не более 12 секунд
	var/sound/ambient_background	= null		//Залупленный звук
	var/sound/ambient_psy			= null		//Пси-звук

/sound
	var/last_time = 0
	var/real_cooldown = 0
	var/transition = 0

/mob/proc/handle_sounds()
	if(!src.client)
		return 0

	var/area/A = get_area(src)

	if(ambient_music && (!A.ambient_music || (music && music.volume > 0)))
		ambient_music.Transition(src)
		ambient_music = null

	if(ambient_background && !ambient_background.transition && !(ambient_background.file in A.ambient_background))//[SSsunlight.current_step]))

		ambient_background.Transition(src)
		ambient_background = null

	if(ambient_psy && ambient_psy.volume > 10)

		return 1

	if(!ambient_music || (!ambient_music.transition && world.time >= ambient_music.last_time + ambient_music.real_cooldown))

		if(!isnull(A.ambient_music) && (!music || (music && music.volume <= 0)))

			if(ambient_music)
				ambient_music.Transition(src)

			ambient_music = sound(file = pick(A.ambient_music))
			////////////////////////
			ambient_music.real_cooldown = rand(A.ambient_music_cooldown * 0.8, A.ambient_music_cooldown * 1.6)
			ambient_music.last_time = world.time
			////////////////////////
			ambient_music.Set_Sound(707, 10, 0, -1)

			src << ambient_music

	if(!ambient_environment || world.time >= ambient_environment.last_time + ambient_environment.real_cooldown)

		if(!isnull(A.ambient_environment))

			if(A.ambient_environment_night && (SSsunlight.current_step == STEP_EVENING || SSsunlight.current_step == STEP_NIGHT))
				ambient_environment = sound(file = pick(A.ambient_environment_night))
			else
				ambient_environment = sound(file = pick(A.ambient_environment))

			if(ambient_environment)

				ambient_environment.last_time = world.time
				ambient_environment.real_cooldown = rand(A.ambient_environment_cooldown * 0.3, A.ambient_environment_cooldown * 1.5)
				ambient_environment.Set_Sound(708, rand(25, 60), rand(-100, 100), A.environment)
				src << ambient_environment

	if(!ambient_background || (!ambient_background.transition && world.time >= ambient_background.last_time + ambient_background.real_cooldown))

		if(!isnull(A.ambient_background))

			if(A.ambient_background[SSsunlight.current_step])
				ambient_background = sound(file = A.ambient_background[SSsunlight.current_step])
				ambient_background.real_cooldown = A.ambient_background_cooldown[SSsunlight.current_step]
/*
			if(A.ambient_background[5])
				ambient_background = sound(file = A.ambient_background[5])
				ambient_background.real_cooldown = A.ambient_background_cooldown[5]
*/
			if(ambient_background)
				////////////////////////
				ambient_background.last_time = world.time
				////////////////////////
				ambient_background.Set_Sound(709, 35, 0, A.environment)

				src << ambient_background

	return 1

/mob/living/carbon/human/handle_sounds()
	if(!..())
		return

	if(src.psyloss >= 25 && (!ambient_psy || (world.time >= ambient_psy.last_time + ambient_psy.real_cooldown)))
		ambient_psy = sound(file = 'sound/stalker/ambience/psy_amb.ogg')
		////////////////////////
		ambient_psy.last_time = world.time
		ambient_psy.real_cooldown = 110
		////////////////////////
		ambient_psy.Set_Sound(710, 60*(psyloss/200), 0, -1)

		src << ambient_psy


/sound/proc/Transition(var/mob/M)
	transition = 1
	while(volume > 0)
		volume = max(volume - 2, 0)
		status = SOUND_UPDATE
		M << src
		/////////
		sleep(2.5)
		/////////
	transition = 0

/sound/proc/Set_Sound(var/channel_, var/volume_, var/pan_ , var/environment_)
	repeat = 0
	wait = 0
	channel = channel_
	volume = volume_
	frequency = 0
	pan = pan_
	environment = environment_
	priority = 250
