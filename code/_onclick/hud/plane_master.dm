/obj/screen/plane_master
	screen_loc = "CENTER"
//	icon_state = "blank"
	appearance_flags = NO_CLIENT_COLOR | PLANE_MASTER | RESET_TRANSFORM | RESET_COLOR | RESET_ALPHA
	blend_mode = BLEND_OVERLAY

/obj/screen/plane_master/proc/backdrop(mob/mymob)

/obj/screen/plane_master/game_world
	name = "game world plane master"
	plane = GAME_PLANE
	blend_mode = BLEND_MULTIPLY
	appearance_flags = PLANE_MASTER | RESET_TRANSFORM | RESET_COLOR | RESET_ALPHA
	invisibility     = INVISIBILITY_LIGHTING
	color = list(null,null,null,"#0000","#000f")

/obj/screen/plane_master/game_world/backdrop(mob/mymob)
	filters = list()
	if(istype(mymob) && mymob.client)
		if(mymob.client.prefs && mymob.client.prefs.ambientocclusion)
			filters += AMBIENT_OCCLUSION

/obj/screen/plane_master/lighting
	name = "sun lighting plane master"
	plane = SUNLIGHTING_PLANE
	layer = LIGHTING_LAYER
	blend_mode = BLEND_ADD
	icon = 'icons/effects/alphacolors.dmi'
	invisibility     = INVISIBILITY_LIGHTING
	appearance_flags = NO_CLIENT_COLOR | RESET_TRANSFORM | RESET_ALPHA | PLANE_MASTER
	mouse_opacity = 0
	//color = list(null,null,null,"#0000","#000f")

/obj/screen/plane_master/real_lighting
	name = "lighting plane master"
	plane = LIGHTING_PLANE
	blend_mode = BLEND_DEFAULT
	icon = 'icons/effects/alphacolors.dmi'
	invisibility     = INVISIBILITY_LIGHTING
	appearance_flags = RESET_TRANSFORM | RESET_ALPHA | PLANE_MASTER
	mouse_opacity = 0

/obj/screen/plane_master/lighting/backdrop(mob/mymob)
	//mymob.lighting_backdrop_lit.alpha = 255
	//mymob.lighting_backdrop_unlit.alpha = 255

/obj/screen/plane_master/lighting/New()
	. = ..()
	color = SSsunlight.current_color
	SSsunlight.sunlighting_planes |= src

/obj/screen/plane_master/lighting/Destroy()
	SSsunlight.sunlighting_planes -= src
	. = ..()

/obj/screen/plane_master/hud
	name = "hud plane master"
	plane = HUD_PLANE
	blend_mode = BLEND_OVERLAY
	appearance_flags = NO_CLIENT_COLOR | RESET_TRANSFORM | RESET_ALPHA | PLANE_MASTER