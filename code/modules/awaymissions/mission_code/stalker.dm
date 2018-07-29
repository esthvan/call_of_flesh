/var/global/list/safezones = list(	/area/stalker/sidor,
									/area/stalker/blowout/outdoor/safezone,
									/area/stalker/blowout/buildings/safezone,
									/area/stalker/buildings/safezone,
									/area/stalker/byadt/bar)

/area/stalker
	icon = 'icons/stalker/areas.dmi'
	name = "Strange Location"
	icon_state = "away"
	has_gravity = 1

/area/stalker/blowout
	requires_power = 1

/area/stalker/blowout/outdoor
	name = "Outdoor"
	icon_state = "outdoor"
	requires_power = 1
	luminosity = 1
	open_space = TRUE
	dynamic_lighting = DYNAMIC_LIGHTING_ENABLED
	ambient_environment = list('sound/stalker/ambience/rnd_outdoor/rnd_bird_1.ogg','sound/stalker/ambience/rnd_outdoor/rnd_bird_2.ogg',
					'sound/stalker/ambience/rnd_outdoor/rnd_bird_3.ogg','sound/stalker/ambience/rnd_outdoor/rnd_bird_4.ogg',
					'sound/stalker/ambience/rnd_outdoor/rnd_bird_5.ogg','sound/stalker/ambience/rnd_outdoor/rnd_bird_6.ogg',
					'sound/stalker/ambience/rnd_outdoor/rnd_bird_7.ogg','sound/stalker/ambience/rnd_outdoor/rnd_bird_8.ogg',
					'sound/stalker/ambience/rnd_outdoor/rnd_bird_9.ogg','sound/stalker/ambience/rnd_outdoor/rnd_bird_10.ogg',
					'sound/stalker/ambience/rnd_outdoor/rnd_bird_11.ogg',
					'sound/stalker/ambience/rnd_outdoor/rnd_dog1.ogg','sound/stalker/ambience/rnd_outdoor/rnd_dog2.ogg',
					'sound/stalker/ambience/rnd_outdoor/rnd_dog3.ogg','sound/stalker/ambience/rnd_outdoor/rnd_dog4.ogg',
					'sound/stalker/ambience/rnd_outdoor/rnd_dog5.ogg','sound/stalker/ambience/rnd_outdoor/rnd_dog6.ogg',
					'sound/stalker/ambience/rnd_outdoor/rnd_dog7.ogg','sound/stalker/ambience/rnd_outdoor/rnd_dog8.ogg',
					'sound/stalker/ambience/rnd_outdoor/rnd_dog9.ogg','sound/stalker/ambience/rnd_outdoor/rnd_dog10.ogg',
					'sound/stalker/ambience/rnd_outdoor/rnd_crow_1.ogg','sound/stalker/ambience/rnd_outdoor/rnd_crow_2.ogg',
					'sound/stalker/ambience/rnd_outdoor/rnd_crow_3.ogg','sound/stalker/ambience/rnd_outdoor/rnd_crow_4.ogg',
					'sound/stalker/ambience/rnd_outdoor/rnd_crow_5.ogg','sound/stalker/ambience/rnd_outdoor/rnd_crow_6.ogg',
					'sound/stalker/ambience/rnd_outdoor/rnd_crow_7.ogg','sound/stalker/ambience/rnd_outdoor/rnd_crow_8.ogg',
					'sound/stalker/ambience/rnd_outdoor/rnd_crow_9.ogg','sound/stalker/ambience/rnd_outdoor/rnd_crow_10.ogg',
					'sound/stalker/ambience/rnd_outdoor/rnd_crow_11.ogg','sound/stalker/ambience/rnd_outdoor/rnd_crow_12.ogg',
					'sound/stalker/ambience/rnd_outdoor/ambient_wind_1.ogg','sound/stalker/ambience/rnd_outdoor/ambient_wind_2.ogg',
					'sound/stalker/ambience/rnd_outdoor/ambient_wind_3.ogg','sound/stalker/ambience/rnd_outdoor/ambient_wind_4.ogg',
					'sound/stalker/ambience/rnd_outdoor/rnd_insect_8.ogg',
					)
	ambient_environment_night = list('sound/stalker/ambience/rnd_outdoor_night/rnd_moan.ogg','sound/stalker/ambience/rnd_outdoor_night/rnd_moan2.ogg',
					'sound/stalker/ambience/rnd_outdoor_night/rnd_moan3.ogg','sound/stalker/ambience/rnd_outdoor_night/rnd_moan4.ogg',
					'sound/stalker/ambience/rnd_outdoor_night/rnd_moan5.ogg','sound/stalker/ambience/rnd_outdoor_night/rnd_moan6.ogg',
					'sound/stalker/ambience/rnd_outdoor_night/ambient_night_1.ogg','sound/stalker/ambience/rnd_outdoor_night/ambient_night_2.ogg',
					'sound/stalker/ambience/rnd_outdoor_night/ambient_night_3.ogg','sound/stalker/ambience/rnd_outdoor_night/ambient_night_4.ogg',
					'sound/stalker/ambience/rnd_outdoor_night/ambient_night_5.ogg','sound/stalker/ambience/rnd_outdoor_night/ambient_night_6.ogg',
					'sound/stalker/ambience/rnd_outdoor_night/ambient_night_7.ogg','sound/stalker/ambience/rnd_outdoor_night/ambient_night_8.ogg',
					'sound/stalker/ambience/rnd_outdoor_night/ambient_night_9.ogg','sound/stalker/ambience/rnd_outdoor_night/ambient_night_10.ogg',
					'sound/stalker/ambience/rnd_outdoor_night/wolf_howl_01.ogg','sound/stalker/ambience/rnd_outdoor_night/wolf_howl_02.ogg',
					'sound/stalker/ambience/rnd_outdoor_night/wolf_howl_03.ogg','sound/stalker/ambience/rnd_outdoor_night/wolf_howl_04.ogg',
					)
	ambient_environment_cooldown = 420
	ambient_background = list(null, null, 'sound/stalker/ambience/rnd_outdoor/rnd_insect_5.ogg', 'sound/stalker/ambience/rnd_outdoor_night/ambient_night_11.ogg', null)
	ambient_background_cooldown = list(null, null, 280, 420, null)
	environment = 15

/area/stalker/sidor
	name = "Sidorovich Basement"
	icon_state = "sidor"
	requires_power = 1
	ambient_music = null
	ambient_background = list(null, null, null, null, 'sound/stalker/ambience/sidor_music2.ogg')//list('sound/stalker/ambience/sidor_music.ogg','sound/stalker/ambience/sidor_music2.ogg')
	ambient_background_cooldown = list(null, null, null, null, 700)
	environment = 5

/area/stalker/deathzone
	name = "Afterlife"
	icon_state = "deathzone"

/area/stalker/blowout/outdoor/safezone
	name = "Safezone"
	icon_state = "safezone"
	requires_power= 1

/area/stalker/blowout/buildings
	name = "Buildings"
	icon_state = "buildings"
	requires_power = 1
	environment = 2

/area/stalker/blowout/buildings/safezone
	name = "Safezone"
	icon_state = "safezone_buildings"
	requires_power = 1

/area/stalker/buildings
	name = "Buildings"
	icon_state = "buildings_no_blowout"
	requires_power = 1
	environment = 5

/area/stalker/buildings/safezone
	name = "Safezone"
	icon_state = "safezone_buildings_no_blowout"
	requires_power = 1

/area/stalker/buildings/safezone/banditbar
	name = "Safezone"
	icon_state = "bandit_bar"
	requires_power = 1

/area/stalker/adminspace
	name = "Admin Space"
	icon_state = "admin_space"
	requires_power = 1

	///«¿“ŒÕ/BACKWATER

/area/stalker/blowout/outdoor/backwater
	name = "B-Outdoor"
	icon_state = "outdoor"

/area/stalker/buildings/backwater
	name = "B-Buildings"
	icon_state = "buildings"

	/// Œ–ƒŒÕ\\\


/area/stalker/kordon
	requires_power = 1

/area/stalker/kordon/buildings
	name = "Buildings"
	icon_state = "cellar"

/area/stalker/blowout/kordon/buildings
	name = "Buildings"
	icon_state = "buildings"

/area/stalker/kordon/cellar
	name = "Cellar"
	icon_state = "cellar"

/area/stalker/kordon/tunnel
	name = "Tunnel"
	icon_state = "tunnelS"

/area/stalker/blowout/kordon/tunnel
	name = "Tunnel"
	icon_state = "tunnel"


	///—¬¿À ¿\\\


/area/stalker/svalka
	requires_power = 1

/area/stalker/svalka/buildings
	name = "Buildings"
	icon_state = "buildings"

/area/stalker/blowout/svalka/buildings
	name = "Buildings"
	icon_state = "buildings"

/area/stalker/blowout/svalka/buildings/bar
	name = "Bar"
	icon_state = "buildings"

/area/stalker/svalka/cellar
	name = "Cellar"
	icon_state = "cellar"

/area/stalker/svalka/tunnel
	name = "Tunnel"
	icon_state = "tunnelS"

/area/stalker/blowout/svalka/tunnel
	name = "Tunnel"
	icon_state = "tunnel"


	///¿√–Œœ–ŒÃ\\\


/area/stalker/agroprom
	requires_power = 1

/area/stalker/agroprom/buildings
	name = "Buildings_blowout"
	icon_state = "buildings"

/area/stalker/blowout/agroprom/buildings
	name = "Buildings"
	icon_state = "buildings_blowout"

/area/stalker/agroprom/cellar
	name = "Cellar"
	icon_state = "cellar"

/area/stalker/agroprom/tunnel
	name = "Tunnel"
	icon_state = "tunnelS"

/area/stalker/blowout/agroprom/tunnel
	name = "Tunnel"
	icon_state = "tunnel"

/area/stalker/agroprom/caves
	name = "Caves"
	icon_state = "caves"
	requires_power = 1
	ambient_music = null
	ambient_background = list(null, null, null, null, 'sound/stalker/ambience/ugrnd/howled_4.ogg')
	ambient_background_cooldown = list(null, null, null, null, 270)
	ambient_environment = list('sound/stalker/ambience/ugrnd/rnd_ugrnd_amb_1.ogg','sound/stalker/ambience/ugrnd/rnd_ugrnd_amb_2.ogg',
				'sound/stalker/ambience/ugrnd/rnd_ugrnd_amb_3.ogg','sound/stalker/ambience/ugrnd/rnd_ugrnd_amb_4.ogg',
				'sound/stalker/ambience/ugrnd/rnd_ugrnd_amb_5.ogg','sound/stalker/ambience/ugrnd/rnd_ugrnd_amb_6.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_ambient_1.ogg','sound/stalker/ambience/ugrnd/ugrnd_ambient_2.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_ambient_3.ogg','sound/stalker/ambience/ugrnd/ugrnd_ambient_4.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_ambient_5.ogg','sound/stalker/ambience/ugrnd/ugrnd_ambient_6.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_ambient_7.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_ambient_banging_1.ogg','sound/stalker/ambience/ugrnd/ugrnd_ambient_banging_2.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_ambient_banging_3.ogg','sound/stalker/ambience/ugrnd/ugrnd_ambient_banging_4.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_ambient_banging_5.ogg','sound/stalker/ambience/ugrnd/ugrnd_ambient_banging_6.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_ambient_banging_7.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_ambient_machine_1.ogg','sound/stalker/ambience/ugrnd/ugrnd_ambient_machine_2.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_ambient_machine_3.ogg','sound/stalker/ambience/ugrnd/ugrnd_ambient_machine_4.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_ambient_machine_5.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_drip_1.ogg','sound/stalker/ambience/ugrnd/ugrnd_drip_2.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_drip_3.ogg','sound/stalker/ambience/ugrnd/ugrnd_drip_4.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_drip_5.ogg','sound/stalker/ambience/ugrnd/ugrnd_drip_6.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_drip_7.ogg','sound/stalker/ambience/ugrnd/ugrnd_drip_8.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_drip_9.ogg','sound/stalker/ambience/ugrnd/ugrnd_drip_10.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_drip_11.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_drone_1.ogg','sound/stalker/ambience/ugrnd/ugrnd_drone_2.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_drone_3.ogg','sound/stalker/ambience/ugrnd/ugrnd_drone_4.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_lab_1.ogg','sound/stalker/ambience/ugrnd/ugrnd_lab_2.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_lab_3.ogg','sound/stalker/ambience/ugrnd/ugrnd_lab_4.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_lab_5.ogg','sound/stalker/ambience/ugrnd/ugrnd_lab_6.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_metal_1.ogg','sound/stalker/ambience/ugrnd/ugrnd_metal_2.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_metal_3.ogg','sound/stalker/ambience/ugrnd/ugrnd_metal_4.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_metal_5.ogg','sound/stalker/ambience/ugrnd/ugrnd_metal_6.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_metal_7.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_noise_1.ogg','sound/stalker/ambience/ugrnd/ugrnd_noise_2.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_noise_3.ogg','sound/stalker/ambience/ugrnd/ugrnd_noise_4.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_noise_5.ogg','sound/stalker/ambience/ugrnd/ugrnd_noise_6.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_noise_7.ogg','sound/stalker/ambience/ugrnd/ugrnd_noise_8.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_noise_9.ogg','sound/stalker/ambience/ugrnd/ugrnd_noise_10.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_noise_11.ogg','sound/stalker/ambience/ugrnd/ugrnd_noise_12.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_whispers_1.ogg','sound/stalker/ambience/ugrnd/ugrnd_whispers_2.ogg',
				'sound/stalker/ambience/ugrnd/ugrnd_whispers_3.ogg','sound/stalker/ambience/ugrnd/ugrnd_whispers_4.ogg',
				)
	ambient_environment_cooldown = 1280
	environment = 8

	///¡¿–, ﬂÕ“¿–‹, ƒ» ¿ﬂ “≈––»“Œ–»ﬂ///


/area/stalker/byadt
	requires_power = 1

/area/stalker/byadt/bar
	name = "Bar"
	icon_state = "realbar"

/area/stalker/byadt/buildings
	name = "Buildings"
	icon_state = "buildings_no_blowout"

/area/stalker/blowout/byadt/buildings
	name = "Buildings Blowout"
	icon_state = "buildings"

/area/stalker/byadt/buildings/mercenary
	name = "Mercenary"
	icon_state = "mercenary"


/area/stalker/blowout/outdoor/safezone/bar
	name = "Bar Outdoor"
	icon_state = "bar_outdoor"
	requires_power = 1
	luminosity = 1
	dynamic_lighting = DYNAMIC_LIGHTING_ENABLED

