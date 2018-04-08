/*
________
\______ \   ______________  __ ____   ____    ______   ______  _  __ ___________
 |    |  \_/ __ \_  __ \  \/ // __ \ /    \   \____ \ /  _ \ \/ \/ // __ \_  __ \
 |    `   \  ___/|  | \/\   /\  ___/|   |  \  |  |_> >  <_> )     /\  ___/|  | \/
/_______  /\___  >__|    \_/  \___  >___|  /  |   __/ \____/ \/\_/  \___  >__|
        \/     \/                 \/     \/   |__|                      \/

*/

/obj/structure/border
	icon = 'icons/effects/warning_stripes.dmi' //WHAT'S YOUR ICON
	icon_state = "borded1"
	name = "border"
	pass_flags = LETPASSTHROW
	density = 1
	anchored = 1.0
	var/proj_pass_rate = 100

/obj/structure/border/CanPass(atom/movable/mover, turf/target, height=0)//So bullets will fly over and stuff.
	if(height==0)
		return 1
	if(istype(mover, /obj/item/projectile))
		if(!anchored)
			return 1
		var/obj/item/projectile/proj = mover
		if(proj.firer && Adjacent(proj.firer))
			return 1
		if(prob(proj_pass_rate))
			return 1
		return 0
	else
		return 0

