/obj/screen/human
	icon = 'icons/mob/screen_midnight.dmi'

/obj/screen/human/toggle
	name = "toggle"
	icon_state = "toggle"

/obj/screen/human/toggle/Click()
	if(usr.hud_used.inventory_shown)
		usr.hud_used.inventory_shown = 0
		usr.client.screen -= usr.hud_used.other
	else
		usr.hud_used.inventory_shown = 1
		usr.client.screen += usr.hud_used.other

	usr.hud_used.hidden_inventory_update()

/obj/screen/human/equip
	name = "equip"
	icon_state = "act_equip"

/obj/screen/human/equip/Click()
	if(istype(usr.loc,/obj/mecha)) // stops inventory actions in a mech
		return 1
	var/mob/living/carbon/human/H = usr
	H.quick_equip()

/obj/screen/ling
	invisibility = 101

/obj/screen/ling/sting
	name = "current sting"

/obj/screen/ling/sting/Click()
	var/mob/living/carbon/U = usr
	U.unset_sting()

/obj/screen/ling/chems
	name = "chemical storage"
	icon_state = "power_display"


/datum/hud/proc/human_hud(ui_style = 'icons/mob/screen_midnight.dmi')
	adding = list()
	other = list()
	hotkeybuttons = list()	//These can be disabled for hotkey users

	var/obj/screen/using
	var/obj/screen/inventory/inv_box

	using = new /obj/screen/act_intent()
	using.icon_state = mymob.a_intent
	using.screen_loc = ui_acti
	adding += using
	action_intent = using

	using = new /obj/screen/mov_intent()
	using.icon = ui_style
	using.icon_state = (mymob.m_intent == "run" ? "running" : "walking")
	using.screen_loc = ui_movi
	adding += using
	move_intent = using

	using = new /obj/screen/drop()
	using.icon = ui_style
	using.screen_loc = ui_drop_throw
	hotkeybuttons += using

	inv_box = new /obj/screen/inventory()
	inv_box.name = "i_clothing"
	inv_box.icon = ui_style
	inv_box.slot_id = slot_w_uniform
	inv_box.icon_state = "uniform"
	inv_box.screen_loc = ui_iclothing
	inv_box.layer = 19
	other += inv_box

	inv_box = new /obj/screen/inventory()
	inv_box.name = "o_clothing"
	inv_box.icon = ui_style
	inv_box.slot_id = slot_wear_suit
	inv_box.icon_state = "suit"
	inv_box.screen_loc = ui_oclothing
	inv_box.layer = 19
	other += inv_box

	inv_box = new /obj/screen/inventory()
	inv_box.name = "r_hand"
	inv_box.icon = ui_style
	inv_box.icon_state = "hand_r_inactive"
	if(mymob && !mymob.hand)	//This being 0 or null means the right hand is in use
		inv_box.icon_state = "hand_r_active"
	inv_box.screen_loc = ui_rhand
	inv_box.slot_id = slot_r_hand
	inv_box.layer = 19
	r_hand_hud_object = inv_box
	adding += inv_box

	inv_box = new /obj/screen/inventory()
	inv_box.name = "l_hand"
	inv_box.icon = ui_style
	inv_box.icon_state = "hand_l_inactive"
	if(mymob && mymob.hand)	//This being 1 means the left hand is in use
		inv_box.icon_state = "hand_l_active"
	inv_box.screen_loc = ui_lhand
	inv_box.slot_id = slot_l_hand
	inv_box.layer = 19
	l_hand_hud_object = inv_box
	adding += inv_box

	using = new /obj/screen/inventory()
	using.name = "hand"
	using.icon = ui_style
	using.icon_state = "swap_1"
	using.screen_loc = ui_swaphand1
	using.layer = 19
	adding += using

	using = new /obj/screen/inventory()
	using.name = "hand"
	using.icon = ui_style
	using.icon_state = "swap_2"
	using.screen_loc = ui_swaphand2
	using.layer = 19
	adding += using

	inv_box = new /obj/screen/inventory()
	inv_box.name = "id"
	inv_box.icon = ui_style
	inv_box.icon_state = "id"
	inv_box.screen_loc = ui_id
	inv_box.slot_id = slot_wear_id
	inv_box.layer = 19
	adding += inv_box

	inv_box = new /obj/screen/inventory()
	inv_box.name = "mask"
	inv_box.icon = ui_style
	inv_box.icon_state = "mask"
	inv_box.screen_loc = ui_mask
	inv_box.slot_id = slot_wear_mask
	inv_box.layer = 19
	other += inv_box

	inv_box = new /obj/screen/inventory()
	inv_box.name = "back"
	inv_box.icon = ui_style
	inv_box.icon_state = "back"
	inv_box.screen_loc = ui_back
	inv_box.slot_id = slot_back
	inv_box.layer = 19
	adding += inv_box
/*
	inv_box = new /obj/screen/inventory()
	inv_box.name = "back2"
	inv_box.icon = ui_style
	inv_box.icon_state = "back2"
	inv_box.screen_loc = ui_back2
	inv_box.slot_id = slot_back2
	inv_box.layer = 19
	adding += inv_box
*/
	inv_box = new /obj/screen/inventory()
	inv_box.name = "storage1"
	inv_box.icon = ui_style
	inv_box.icon_state = "pocket"
	inv_box.screen_loc = ui_storage1
	inv_box.slot_id = slot_l_store
	inv_box.layer = 19
	adding += inv_box

	inv_box = new /obj/screen/inventory()
	inv_box.name = "storage2"
	inv_box.icon = ui_style
	inv_box.icon_state = "pocket"
	inv_box.screen_loc = ui_storage2
	inv_box.slot_id = slot_r_store
	inv_box.layer = 19
	adding += inv_box

	inv_box = new /obj/screen/inventory()
	inv_box.name = "suit storage"
	inv_box.icon = ui_style
	inv_box.icon_state = "suit_storage"
	inv_box.screen_loc = ui_sstore1
	inv_box.slot_id = slot_s_store
	inv_box.layer = 19
	adding += inv_box

	using = new /obj/screen/resist()
	using.icon = ui_style
	using.screen_loc = ui_pull_resist
	hotkeybuttons += using

	using = new /obj/screen/bolt()
	using.icon = 'icons/mob/screen_midnight.dmi'//ui_style
	using.screen_loc = ui_bolt
	hotkeybuttons += using

	using = new /obj/screen/human/toggle()
	using.icon = ui_style
	using.screen_loc = ui_inventory
	adding += using

	using = new /obj/screen/human/equip()
	using.icon = ui_style
	using.screen_loc = ui_equip
	adding += using

	inv_box = new /obj/screen/inventory()
	inv_box.name = "gloves"
	inv_box.icon = ui_style
	inv_box.icon_state = "gloves"
	inv_box.screen_loc = ui_gloves
	inv_box.slot_id = slot_gloves
	inv_box.layer = 19
	other += inv_box

	inv_box = new /obj/screen/inventory()
	inv_box.name = "eyes"
	inv_box.icon = ui_style
	inv_box.icon_state = "glasses"
	inv_box.screen_loc = ui_glasses
	inv_box.slot_id = slot_glasses
	inv_box.layer = 19
	other += inv_box

	inv_box = new /obj/screen/inventory()
	inv_box.name = "ears"
	inv_box.icon = ui_style
	inv_box.icon_state = "ears"
	inv_box.screen_loc = ui_ears
	inv_box.slot_id = slot_ears
	inv_box.layer = 19
	other += inv_box

	inv_box = new /obj/screen/inventory()
	inv_box.name = "head"
	inv_box.icon = ui_style
	inv_box.icon_state = "head"
	inv_box.screen_loc = ui_head
	inv_box.slot_id = slot_head
	inv_box.layer = 19
	other += inv_box

	inv_box = new /obj/screen/inventory()
	inv_box.name = "shoes"
	inv_box.icon = ui_style
	inv_box.icon_state = "shoes"
	inv_box.screen_loc = ui_shoes
	inv_box.slot_id = slot_shoes
	inv_box.layer = 19
	other += inv_box

	inv_box = new /obj/screen/inventory()
	inv_box.name = "belt"
	inv_box.icon = ui_style
	inv_box.icon_state = "belt"
	inv_box.screen_loc = ui_belt
	inv_box.slot_id = slot_belt
	inv_box.layer = 19
	adding += inv_box

	mymob.throw_icon = new /obj/screen/throw_catch()
	mymob.throw_icon.icon = ui_style
	mymob.throw_icon.screen_loc = ui_drop_throw
	hotkeybuttons += mymob.throw_icon


//	mymob.internals = new /obj/screen/internals()
//	mymob.internals.screen_loc = ui_internal

	mymob.healths = new /obj/screen()
	mymob.healths.icon_state = "health0"
	mymob.healths.name = "health"
	mymob.healths.screen_loc = ui_health

	mymob.staminas = new /obj/screen()
	mymob.staminas.icon = 'icons/mob/screen_new.dmi'
	mymob.staminas.icon_state = "stamina0"
	mymob.staminas.name = "stamina"
	mymob.staminas.screen_loc = ui_stamina

	mymob.healthdoll = new /obj/screen()
	mymob.healthdoll.name = "health doll"
	mymob.healthdoll.screen_loc = ui_healthdoll

	mymob.pullin = new /obj/screen/pull()
	mymob.pullin.icon = ui_style
	mymob.pullin.update_icon(mymob)
	mymob.pullin.screen_loc = ui_pull_resist
	hotkeybuttons += mymob.pullin

	lingchemdisplay = new /obj/screen/ling/chems()
	lingchemdisplay.screen_loc = ui_lingchemdisplay

	lingstingdisplay = new /obj/screen/ling/sting()
	lingstingdisplay.screen_loc = ui_lingstingdisplay

	mymob.blind = new /obj/screen()
	mymob.blind.icon = 'icons/mob/screen_full.dmi'
	mymob.blind.icon_state = "blackimageoverlay"
	mymob.blind.name = " "
	mymob.blind.screen_loc = "CENTER-7,CENTER-7"
	mymob.blind.mouse_opacity = 0
	mymob.blind.layer = 0
	mymob.blind.alpha = 0

	mymob.damageoverlay = new /obj/screen()
	mymob.damageoverlay.icon = 'icons/mob/screen_full.dmi'
	mymob.damageoverlay.icon_state = "oxydamageoverlay0"
	mymob.damageoverlay.name = "dmg"
	mymob.damageoverlay.blend_mode = BLEND_OVERLAY
	mymob.damageoverlay.screen_loc = "CENTER-7,CENTER-7"
	mymob.damageoverlay.mouse_opacity = 0
	mymob.damageoverlay.layer = 18.1 //The black screen overlay sets layer to 18 to display it, this one has to be just on top.

	mymob.whitenoise = new /obj/screen()
	mymob.whitenoise.icon = 'icons/mob/screen_full.dmi'
	mymob.whitenoise.icon_state = "whitenoise"
	mymob.whitenoise.name = "whitenoise"
	mymob.whitenoise.blend_mode = BLEND_ADD
	mymob.whitenoise.screen_loc = "CENTER-7,CENTER-7"
	mymob.whitenoise.mouse_opacity = 0
	mymob.whitenoise.layer = 18.05
	mymob.whitenoise.alpha = 0

	mymob.nightvision = new /obj/screen()
	mymob.nightvision.icon = 'icons/stalker/hud_full.dmi'
	mymob.nightvision.icon_state = "nvg_hud1"
	mymob.nightvision.name = "nightvision"
	mymob.nightvision.blend_mode = BLEND_MULTIPLY
	mymob.nightvision.screen_loc = "CENTER-7,CENTER-7"
	mymob.nightvision.mouse_opacity = 0
	mymob.nightvision.layer = 19
	mymob.nightvision.alpha = 0

	mymob.pulseimage = new /obj/screen()
	mymob.pulseimage.icon = 'icons/stalker/mob/pulseimage.dmi'
	mymob.pulseimage.icon_state = "pulseimage"
	mymob.pulseimage.name = "pulseimage"
	mymob.pulseimage.blend_mode = BLEND_ADD
	mymob.pulseimage.screen_loc = "CENTER-7,CENTER-7"
	mymob.pulseimage.mouse_opacity = 0
	mymob.pulseimage.layer = 19
	mymob.pulseimage.alpha = 0

	mymob.flash = new /obj/screen()
	mymob.flash.icon_state = "blank"
	mymob.flash.name = "flash"
	mymob.flash.blend_mode = BLEND_ADD
	mymob.flash.screen_loc = "WEST,SOUTH to EAST,NORTH"
	mymob.flash.layer = 17
/*
	mymob.lighting_backdrop_lit = new /obj/screen()
	mymob.lighting_backdrop_lit.icon = 'icons/mob/screen_gen.dmi'
	mymob.lighting_backdrop_lit.icon_state = "flash"
	mymob.lighting_backdrop_lit.transform = matrix(200, 0, 0, 0, 200, 0)
	mymob.lighting_backdrop_lit.plane = LIGHTING_PLANE
	mymob.lighting_backdrop_lit.blend_mode = BLEND_OVERLAY
	mymob.lighting_backdrop_lit.layer = 13
	mymob.lighting_backdrop_lit.color = "#000"
	mymob.lighting_backdrop_lit.alpha = 255

	mymob.lighting_backdrop_unlit = new /obj/screen()
	mymob.lighting_backdrop_unlit.icon = 'icons/mob/screen_gen.dmi'
	mymob.lighting_backdrop_unlit.icon_state = "flash"
	mymob.lighting_backdrop_unlit.transform = matrix(200, 0, 0, 0, 200, 0)
	mymob.lighting_backdrop_unlit.plane = LIGHTING_PLANE
	mymob.lighting_backdrop_unlit.blend_mode = BLEND_OVERLAY
	mymob.lighting_backdrop_unlit.layer = 12
	mymob.lighting_backdrop_unlit.alpha = 255
*/
/*
	mymob.sun_lighting_backdrop_lit = new /obj/screen()
	mymob.sun_lighting_backdrop_lit.icon = 'icons/mob/screen_gen.dmi'
	mymob.sun_lighting_backdrop_lit.icon_state = "flash"
	mymob.sun_lighting_backdrop_lit.transform = matrix(200, 0, 0, 0, 200, 0)
	mymob.sun_lighting_backdrop_lit.plane = SUNLIGHTING_PLANE
	mymob.sun_lighting_backdrop_lit.blend_mode = BLEND_OVERLAY
	mymob.sun_lighting_backdrop_lit.layer = 13
	mymob.sun_lighting_backdrop_lit.color = "#000"
	mymob.sun_lighting_backdrop_lit.alpha = 255

	mymob.sun_lighting_backdrop_lit = new /obj/screen()
	mymob.sun_lighting_backdrop_lit.icon = 'icons/mob/screen_gen.dmi'
	mymob.sun_lighting_backdrop_lit.icon_state = "flash"
	mymob.sun_lighting_backdrop_lit.transform = matrix(200, 0, 0, 0, 200, 0)
	mymob.sun_lighting_backdrop_lit.plane = SUNLIGHTING_PLANE
	mymob.sun_lighting_backdrop_lit.blend_mode = BLEND_OVERLAY
	mymob.sun_lighting_backdrop_lit.layer = 12
	mymob.sun_lighting_backdrop_lit.alpha = 255
*/
	mymob.zone_sel = new /obj/screen/zone_sel()
	mymob.zone_sel.icon = 'icons/mob/screen_new.dmi'
	mymob.zone_sel.icon_state = "zone_sel"
	mymob.zone_sel.update_icon()

	mymob.client.screen = list()

	mymob.client.screen += list( mymob.zone_sel, mymob.healths, mymob.healthdoll, mymob.blind, mymob.flash, mymob.damageoverlay, mymob.nightvision, mymob.whitenoise, mymob.pulseimage, lingchemdisplay, lingstingdisplay, mymob.staminas) //, mymob.hands, mymob.rest, mymob.sleep) //, mymob.mach )
	mymob.client.screen += adding + hotkeybuttons
	mymob.client.screen += mymob.client.void

	inventory_shown = 0;


/mob/living/carbon/human/verb/toggle_hotkey_verbs()
	set category = "OOC"
	set name = "Toggle hotkey buttons"
	set desc = "This disables or enables the user interface buttons which can be used with hotkeys."

	if(hud_used.hotkey_ui_hidden)
		client.screen += hud_used.hotkeybuttons
		hud_used.hotkey_ui_hidden = 0
	else
		client.screen -= hud_used.hotkeybuttons
		hud_used.hotkey_ui_hidden = 1
