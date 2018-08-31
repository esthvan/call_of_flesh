/mob/living
	var/list/overlays_standing[TOTAL_LAYERS]

/mob/living/update_icons()
	update_top_overlay()

/mob/living/proc/update_top_overlay()
	if(overlays_standing[TOP_LAYER])

		overlays -= overlays_standing[TOP_LAYER]
		overlays_standing[TOP_LAYER] = null

	if(src.loc && istype(src.loc, /turf/stalker/floor/water))

		var/image/standing //= image('icons/stalker/water.dmi', "water_overlay")
		var/icon/I
		if(lying != 0)
			I = turn(icon('icons/stalker/water.dmi', "water_overlay_turned"), - lying)
		else
			I = icon('icons/stalker/water.dmi', "water_overlay")

		var/icon/mask
		mask = getIconMask(src)
		mask.MapColors(1,1,1, 1,1,1, 1,1,1, 1,1,1)
		mask.Blend(I, ICON_MULTIPLY)

		standing = image(mask, "")
		standing.blend_mode = BLEND_OVERLAY
		overlays_standing[TOP_LAYER] = standing
		overlays += standing

	return
