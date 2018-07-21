#define STAGE_SOURCES  1
#define STAGE_CORNERS  2
#define STAGE_OVERLAYS 3

var/datum/subsystem/lighting/SSlighting

var/list/lighting_update_lights    = list() // List of lighting sources  queued for update.
var/list/lighting_update_corners   = list() // List of lighting corners  queued for update.
var/list/lighting_update_overlays  = list() // List of lighting overlays queued for update.


/datum/subsystem/lighting
	name = "Lighting"
	priority = 1
	wait = 1
	dynamic_wait = 1
	dwait_delta = 3
	//display = 5
	name = "lighting"

	var/initialized = FALSE

	var/list/currentrun_lights		= list()
	var/list/currentrun_corners		= list()
	var/list/currentrun_overlays	= list()

	var/resuming_stage = 0


/datum/subsystem/lighting/New()
	NEW_SS_GLOBAL(SSlighting)


/datum/subsystem/lighting/stat_entry()
	..("L:[lighting_update_lights.len]|C:[lighting_update_corners.len]|O:[lighting_update_overlays.len]")


/datum/subsystem/lighting/Initialize(timeofday)
	if (config.starlight)
		for(var/area/A in world)
			if (A.dynamic_lighting == DYNAMIC_LIGHTING_IFSTARLIGHT)
				A.luminosity = 0

	create_all_lighting_overlays()

	while (lighting_update_lights.len)
		var/datum/light_source/L = lighting_update_lights[lighting_update_lights.len]
		lighting_update_lights.len--

		if (L.check() || L.destroyed || L.force_update)
			L.remove_lum()
			if (!L.destroyed)
				L.apply_lum()

		else if (L.vis_update) //We smartly update only tiles that became (in) visible to use.
			L.smart_vis_update()

		L.vis_update   = FALSE
		L.force_update = FALSE
		L.needs_update = FALSE

	while (lighting_update_corners.len)
		var/datum/lighting_corner/C = lighting_update_corners[lighting_update_corners.len]
		lighting_update_corners.len--

		C.update_overlays()
		C.needs_update = FALSE

	resuming_stage = STAGE_OVERLAYS

	while (lighting_update_overlays.len)
		var/atom/movable/lighting_overlay/O = lighting_update_overlays[lighting_update_overlays.len]
		lighting_update_overlays.len--

		if (qdeleted(O))
			continue

		O.update_overlay()
		O.animate_color()
		O.needs_update = FALSE

	resuming_stage = 0

	initialized = TRUE

	..()


/datum/subsystem/lighting/fire()
	while (lighting_update_lights.len)
		var/datum/light_source/L = lighting_update_lights[lighting_update_lights.len]
		lighting_update_lights.len--

		if (L.check() || L.destroyed || L.force_update)
			L.remove_lum()
			if (!L.destroyed)
				L.apply_lum()

		else if (L.vis_update) //We smartly update only tiles that became (in) visible to use.
			L.smart_vis_update()

		L.vis_update   = FALSE
		L.force_update = FALSE
		L.needs_update = FALSE

		if (MC_TICK_CHECK)
			return

	while (lighting_update_corners.len)
		var/datum/lighting_corner/C = lighting_update_corners[lighting_update_corners.len]
		lighting_update_corners.len--

		C.update_overlays()
		C.needs_update = FALSE
		if (MC_TICK_CHECK)
			return

	resuming_stage = STAGE_OVERLAYS

	while (lighting_update_overlays.len)
		var/atom/movable/lighting_overlay/O = lighting_update_overlays[lighting_update_overlays.len]
		lighting_update_overlays.len--

		if (qdeleted(O))
			continue

		O.update_overlay()
		O.animate_color()
		O.needs_update = FALSE
		if (MC_TICK_CHECK)
			return
	resuming_stage = 0


/datum/subsystem/lighting/Recover()
	initialized = SSlighting.initialized
	..()


#undef STAGE_SOURCES
#undef STAGE_CORNERS
#undef STAGE_OVERLAYS