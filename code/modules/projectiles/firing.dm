/proc/splittext510(txt, splitter)
	var/text = txt
	var/list/result = list()
	var/found = findtext(text, splitter)
	while(found)
		result.Add(copytext(text, 1, found))
		if(lentext(text) > found)
			found = findtext(text, splitter)
			if(found)
				text = copytext(text, found + 1, lentext(text) + 1)
				result.Add(copytext(text, 1, 0))
				return result
			else
				result.Add(copytext(text, found + 1, lentext(text) + 1))
		else
			break
	return result





/obj/item/ammo_casing/proc/fire(atom/target as mob|obj|turf, mob/living/user as mob|obj, params, distro, quiet, zone_override = "", spread, damagelose)
	distro += variance
	for (var/i = max(1, pellets), i > 0, i--)
		var/targloc = get_turf(target)
		ready_proj(target, user, quiet, zone_override)
		if(distro && pellets > 1) //We have to spread a pixel-precision bullet. throw_proj was called before so angles should exist by now...
			if(randomspread)
				spread = round((rand() - 0.5) * distro)
			else if (pellets > 1) //Smart spread
				spread = ((i / pellets) * distro)
		if(!throw_proj(target, targloc, user, params, spread, damagelose, distro))
			return 0
		if(i > 1)
			newshot()
	if(click_cooldown_override)
		user.changeNext_move(click_cooldown_override)
	else
		user.changeNext_move(CLICK_CD_RANGE)
	user.newtonian_move(get_dir(target, user))
	update_icon()
	return 1

/obj/item/ammo_casing/proc/ready_proj(atom/target, mob/living/user, quiet, zone_override = "")
	if (!BB)
		return
	BB.original = target
	BB.firer = user
	if (zone_override)
		BB.def_zone = zone_override
	else
		BB.def_zone = user.zone_sel.selecting
	BB.suppressed = quiet

	if(reagents && BB.reagents)
		reagents.trans_to(BB, reagents.total_volume) //For chemical darts/bullets
		qdel(reagents)

/obj/item/ammo_casing/proc/throw_proj(atom/target, turf/targloc, mob/living/user, params, spread, damagelose, distro)
	var/turf/curloc = get_turf(user)
	if (!istype(targloc) || !istype(curloc) || !BB)
		return 0
	BB.ammo_casing = src

	var/firing_dir
	if(BB.firer)
		firing_dir = BB.firer.dir
	if(!BB.suppressed && firing_effect_type)
		var/obj/effect/overlay/temp/dir_setting/firing_effect/FE = PoolOrNew(firing_effect_type, get_turf(src), firing_dir)
		FE.setDir(firing_dir)

	if(targloc == curloc)
		if(target) //if the target is right on our location we go straight to bullet_act()
			target.bullet_act(BB, BB.def_zone)
		qdel(BB)
		BB = null
		return 1

	BB.preparePixelProjectile(target, targloc, user, params, spread, pellets, distro)
	if(BB)
		BB.fire(BB.Angle, damagelose, pellets)
	BB = null
	return 1

/obj/item/ammo_casing/proc/spread(turf/target, turf/current, distro)
	var/dx = abs(target.x - current.x)
	var/dy = abs(target.y - current.y)
	return locate(target.x + round(gaussian(0, distro) * (dy+2)/8, 1), target.y + round(gaussian(0, distro) * (dx+2)/8, 1), target.z)

/obj/item/projectile/proc/preparePixelProjectile(atom/target, var/turf/targloc, mob/living/user, params, spread, var/pellets, var/distro)
	var/turf/curloc = get_turf(user)
	src.loc = get_turf(user)
	src.starting = get_turf(user)
	src.current = curloc
	src.yo = targloc.y - curloc.y
	src.xo = targloc.x - curloc.x

	if(params)
		var/list/mouse_control = params2list(params)
		if(mouse_control["icon-x"])
			src.p_x = text2num(mouse_control["icon-x"])
		if(mouse_control["icon-y"])
			src.p_y = text2num(mouse_control["icon-y"])
		if(mouse_control["screen-loc"])
			//Split screen-loc up into X+Pixel_X and Y+Pixel_Y
			var/list/screen_loc_params = splittext510(mouse_control["screen-loc"], ",")

			//Split X+Pixel_X up into list(X, Pixel_X)
			var/list/screen_loc_X = splittext510(screen_loc_params[1],":")

			//Split Y+Pixel_Y up into list(Y, Pixel_Y)
			var/list/screen_loc_Y = splittext510(screen_loc_params[2],":")
			//world << "X: [screen_loc_X[1]] PixelX: [screen_loc_X[2]] / Y: [screen_loc_Y[1]] PixelY: [screen_loc_Y[2]]"
			var/x = text2num(screen_loc_X[1]) * 32 + text2num(screen_loc_X[2]) - 32
			var/y = text2num(screen_loc_Y[1]) * 32 + text2num(screen_loc_Y[2]) - 32

			//Calculate the "resolution" of screen based on client's view and world's icon size. This will work if the user can view more tiles than average.
			var/screenview = (user.client.view * 2 + 1) * world.icon_size //Refer to http://www.byond.com/docs/ref/info.html#/client/var/view for mad maths

			var/ox = round(screenview/2) //"origin" x
			var/oy = round(screenview/2) //"origin" y

			var/o_x = user.client.pixel_x
			var/o_y = user.client.pixel_y		//Прицелы
			//world << "Pixel position: [x] [y]"
			var/angle = Atan2(y - oy + o_y, x - ox + o_x)
			//world << "Angle: [angle]"
			src.Angle = angle
	else
		src.Angle = Atan2(yo, xo)

	if(spread && pellets <= 1)
		Angle += round(rand(-spread, spread))
	else if(spread && pellets > 1)
		Angle = Angle + spread - distro/2