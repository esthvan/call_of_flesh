/mob
	var/sound/ambient_music			= null		//Музыка
	var/sound/ambient_environment	= null		//Случайные короткие звуки длительностью не более 12 секунд
	var/sound/ambient_background	= null		//Залупленный звук
	var/sound/ambient_psy			= null		//Пси-звук
	var/sound/ambient_campfire		= null		//Звук от костра - campfire.dm

/sound
	var/last_time = 0
	var/real_cooldown = 0
	var/transition = 0

/mob/proc/handle_sounds()
	if(!src.client)
		return 0

	if(!src.loc)
		return 0

	var/area/A = get_area(src)

	if(ambient_music && !ambient_music.transition && (!A.ambient_music || (music && music.volume > 0)))
		ambient_music.Transition(src)
		ambient_music = null

	if(ambient_background && !ambient_background.transition && !(ambient_background.file in A.ambient_background))//[SSsunlight.current_step]))

		ambient_background.Transition(src)
		ambient_background = null

	if(ambient_psy && ambient_psy.volume > 10)
		return 1

	if(!ambient_music || (!ambient_music.transition && (world.time >= ambient_music.last_time + ambient_music.real_cooldown)))

		if(A.ambient_music && (!music || (music && music.volume <= 0)))

			if(ambient_music)
				ambient_music.Transition(src)

			ambient_music = sound(file = safepick(A.ambient_music))
			////////////////////////
			ambient_music.real_cooldown = rand(A.ambient_music_cooldown * 0.8, A.ambient_music_cooldown * 1.4)
			ambient_music.last_time = world.time
			////////////////////////
			ambient_music.Set_Sound(AMBIENT_MUSIC_CHANNEL, 10, 0, -1)
			src << ambient_music

	if(!ambient_environment || world.time >= ambient_environment.last_time + ambient_environment.real_cooldown)

		if(A.ambient_environment)

			if(A.ambient_environment_night && (SSsunlight.current_step == STEP_EVENING || SSsunlight.current_step == STEP_NIGHT))
				ambient_environment = sound(file = safepick(A.ambient_environment_night))
			else
				ambient_environment = sound(file = safepick(A.ambient_environment))

			if(ambient_environment)

				////////////////////////
				ambient_environment.last_time = world.time
				ambient_environment.real_cooldown = rand(A.ambient_environment_cooldown * 0.3, A.ambient_environment_cooldown * 1.5)
				////////////////////////
				ambient_environment.Set_Sound(AMBIENT_ENVIRONMENT_CHANNEL, rand(25, 60), rand(-100, 100), A.environment)
				src << ambient_environment

	if(!ambient_background || (!ambient_background.transition && world.time >= ambient_background.last_time + ambient_background.real_cooldown))

		if(A.ambient_background)

			if(A.ambient_background[SSsunlight.current_step])
				ambient_background = sound(file = A.ambient_background[SSsunlight.current_step])
				ambient_background.real_cooldown = A.ambient_background_cooldown[SSsunlight.current_step]

			if(ambient_background)
				////////////////////////
				ambient_background.last_time = world.time
				////////////////////////
				ambient_background.Set_Sound(AMBIENT_BACKGROUND_CHANNEL, 35, 0, A.environment)
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
		ambient_psy.Set_Sound(AMBIENT_PSY_CHANNEL, 60*(psyloss/200), 0, -1)
		src << ambient_psy


/sound/proc/Transition(var/mob/M)
	transition = 1
	status = SOUND_STREAM | SOUND_UPDATE

	while(volume > 0)
		volume = max(volume - 2, 0)
		M << src
		/////////
		sleep(2.5)
		/////////

	status = SOUND_STREAM
	transition = 0

/sound/proc/Set_Sound(var/channel_, var/volume_, var/pan_ , var/environment_)
	status = SOUND_STREAM
	repeat = 0
	wait = 0
	channel = channel_
	volume = volume_
	frequency = 0
	pan = pan_
	environment = environment_
	priority = 250