
///////////////////////////// ��������� //////////////////////////////////////////

/obj/item/weapon/gun/projectile/automatic/pistol/pm   // �������
	name = "PMm"
	desc = "�������� �������� �����������������. �������� ��������������� � ���� �������� - �������� ��������� �����. ���������� ������� � �������, ���������&#255; ��������� �������� �������� ��� ������������� �������� � ���������������������� �������� �������. �������� ������ ��������-�������-����������. �������� �������� ��&#255; �����������&#255; �����."
	eng_desc = "This Soviet legacy is the most common pistol in the Zone and is one of the best compact self-defense handguns available. It is small, highly reliable, easy to use and maintain in working order. It also suffers from several drawbacks, including its short range, low firing accuracy and poor stopping power, while also losing out to modern pistols in its class in terms of weight and magazine size."
	icon_state = "pm"
	w_class = 2
	fire_sound = 'sound/stalker/weapons/pm_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x18pm
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	durability = 60
	spread = 10
	recoil = 0.2
	damagelose = 0.2
	drawsound = 'sound/stalker/weapons/draw/pm_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'

/obj/item/weapon/gun/projectile/automatic/pistol/tt   // ��
	name = "TT"
	desc = "������ ��������, ������������� ��� ����� �� ������ ��������� ������. ������ �����&#255;��� ��-�� ����, ��� ����� ����� ����������� �������� � �������, ��� �� ������ ����� ������� ������� � ��������� � ������� ������ ��������. ���� �� ��� �����, �� ����� ��� ������."
	icon_state = "tt"
	w_class = 2
	fire_sound = 'sound/stalker/weapons/fort_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/tt
	force = 10
	can_suppress = 0
	can_unsuppress = 0
	fire_delay = 0.5
	durability = 50
	spread = 8
	recoil = 0.15
	damagelose = 0.1
	drawsound = 'sound/stalker/weapons/draw/pm_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'

/obj/item/weapon/gun/projectile/automatic/pistol/sip  // Sig-Sauer
	name = "SIG-Sauer P220"
	desc = "������, ������������&#255; ��� � 1975 ����, �� �� ��� ��� �����&#255;���&#255; �� ��� ����. ������� ������������ �����, ���� �������� ������ ��� ����������� ����; ������ ������ &#255;��&#255;���&#255; ������������� ������� ������������ ������� .45 �������."
	eng_desc = "The only remaining mass produced model of a globally renowned pistol, this weapon has earned a reputation for its excellent ergonomics and accuracy, and while its magazine is relatively small, it benefits from powerful ammo and a mechanism that functions like a Swiss watch. Some believe the SIP-t M200 to be the best mass produced .45ACP caliber handgun there is and it has certainly got a following among experienced stalkers and mercenaries."
	icon_state = "sip"
	w_class = 2
	fire_sound = 'sound/stalker/weapons/sig220_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sc45
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	durability = 85
	spread = 6
	recoil = 0.4
	damagelose = 0.2
	drawsound = 'sound/stalker/weapons/draw/sig220_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'

/obj/item/weapon/gun/projectile/automatic/pistol/cora  // Colt1911A
	name = "Colt M1911"
	desc = "������������ �������������� ������, � ������ ��������� ��� ���������� ��������� XX ���� � �������� �������� � ����� ��������. ��������&#255; ������� �������� � ����������� ������� �������������&#255; �������������� ������� �������."
	eng_desc = "An improved version of a classic automatic pistol, which passed all the major armed conflicts of the 20th century with flying colors and entered the new millennium with confidence. Produced by dozens if not hundreds of arms manufacturers around the world in both standard and modified configurations. The weapon's only drawback, its mediocre magazine capacity, is largely compensated by the hard-hitting ammo it uses."
	icon_state = "cora"
	w_class = 3
	fire_sound = 'sound/stalker/weapons/colt1911_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sc45
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	spread = 8
	recoil = 0.5
	durability = 100
	damagelose = 0.15
	drawsound = 'sound/stalker/weapons/draw/pm_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'

/obj/item/weapon/gun/projectile/automatic/pistol/marta  // Beretta92FS
	name = "Beretta 92FS"
	desc = "������� �� ���������� ���������� ��� � ������� ���, ������ ��������������� � ����������������� ������������ �� ��� ����. ����� �� �����&#255;��� � � �������������� ����������� ���� ��������&#255; ������� ������� � ������� ������� ��������."
	eng_desc = "Martha pistols enjoy the reputation of a relatively reliable, albeit somewhat cumbersome weapon, around the world. In service with armed forces and police across the ocean, as well as various military and law enforcement organizations worldwide. The pistol is equally popular with members of the underworld, thanks to its powerful round and magazine capacity. Marthas found in the Zone are usually dated, probably from retired stock."
	icon_state = "marta"
	item_state = "marta"
	w_class = 3
	fire_sound = 'sound/stalker/weapons/marta_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x19marta
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	spread = 7
	recoil = 0.25
	damagelose = 0.2
	durability = 75
	drawsound = 'sound/stalker/weapons/draw/pm_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'

/obj/item/weapon/gun/projectile/automatic/pistol/fort12  // ����12
	name = "Fort-12"
	desc = "�������� ������������ ���������&#255; ����������� ������������, ��������� �� ����� ���. �������� ������� �� ��������� � ��������� ��������� ��&#255;, ����������� � ����� ������������� ���������, ������ ����� ������."
	eng_desc = "A Ukranian-made pistol predominantly used by law enforcement organizations. Provides higher accuracy, better ergonomics and has a larger magazine than the PMm. These pistols make it into the Zone in large numbers thanks to the sale of defective weapons, which suffer from technical miscalculations in early design models. Despite this, the pistol is in demand among stalkers thanks to its good combat characteristics."
	icon_state = "fort12"
	fire_sound = 'sound/stalker/weapons/fort_shot.ogg'
	w_class = 2
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x18fort
	force = 10
	can_suppress = 0
	can_unsuppress = 0
	spread = 8
	recoil = 0.25
	durability = 50
	damagelose = 0.2
	drawsound = 'sound/stalker/weapons/draw/fort_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'

/obj/item/weapon/gun/projectile/automatic/pistol/fort12/unique  // ����12 - ����������� �������
	desc = "����������������� �������� ��������� ����. ��������� �������&#255;�."
	unique = 1
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x18fort_u

/obj/item/weapon/gun/projectile/automatic/pistol/pb1s  //��1�
	name = "PB1s"
	desc = "�������� � ��������������� ����������, ������� ���������������&#255; ��������� ���������. �������� �������, �� � ������ ����� ��-�������� �������� ����������."
	eng_desc = "This pistol was developed in the second half of the 20th century on the basis of the PMm for use by special forces and scouting units. The front of the pistol's barrel is covered with an integrated silencer, while the bolt mechanism is short, which prevents a back-moving spring from being located inside it, and it is therefore situated in the weapon's handle. Morally obsolete, the weapon is still effective in the right hands."
	icon_state = "pb1s"
	w_class = 2
	fire_sound = 'sound/stalker/weapons/pb_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x18pm
	force = 10
	suppressed = 1
	can_suppress = 0
	can_unsuppress = 0
	spread = 10
	recoil = 0.25
	durability = 50
	damagelose = 0.2
	drawsound = 'sound/stalker/weapons/draw/pm_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'

/obj/item/weapon/gun/projectile/automatic/pistol/usp_match  // USP Match
	name = "H&K USP Match"
	desc = "�������&#255; ����������&#255; ���������� ��������� ���������, ������� .45. ����� ����������� �������, ������&#255; ��������� ������� ������ ��� �������� �� ���� ������ ����. ����������� ������� �� 15 ��������. �� ����&#255;��� �������� - L.C."
	eng_desc = "Impeccable reliability and durability combined with excellent accuracy are the main noteworthy features of this weapon. Its minor drawbacks include its considerable size, relatively high center of gravity and massive bolt, which make it difficult to conceal but do not outweigh the weapon's positive features. The weapon is especially popular with the Zone's veterans."
	icon_state = "usp-match"
	w_class = 2
	mag_type = /obj/item/ammo_box/magazine/stalker/usp45
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	spread = 8
	recoil = 0.35
	durability = 60
	damagelose = 0.25
	drawsound = 'sound/stalker/weapons/draw/usp_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'

/obj/item/weapon/gun/projectile/automatic/pistol/desert  // Desert Eagle
	name = "Desert Eagle .44"
	desc = "�������, �&#255;�����, �����&#255;��� � ��������� ������������ - ������������� � 80-� ���� �������� ���� ����������� �������&#255;���� � �����&#255;������������ ��������������� ��������� ����� ���� �� �������&#255;, ��������� ���� ���� ������������ ������ ������ ������������������ ����������. ��������� ���� ����� ������� ����� ��������, ������� �� ��� � ����-�� � ��� - ��� ������� ����� �����."
	eng_desc = "An extremely powerful gun, featured in many Hollywood movies and popularised by criminals. Truly a killing machine for close-range combat."
	icon_state = "desert"
	w_class = 3
	fire_sound = 'sound/stalker/weapons/desert_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/desert
	force = 10
	can_suppress = 0
	can_unsuppress = 0
	spread = 8
	recoil = 0.65
	durability = 50
	damagelose = 0.15
	drawsound = 'sound/stalker/weapons/draw/usp_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'

/obj/item/weapon/gun/projectile/revolver/anaconda
	name = "Colt Anaconda .44"
	desc = "� ����, � ��� �� ������ �������. ��������� �� ����� ���, ��� ������ �&#255;��? ������ �����&#255;, � ���� �������� &#255; � ��� �����&#255; �� �����. �� ����� � ����, ��� ��� ������ 44-�� �������, ����� ������� ��������� �� �����, � �� ����� ��������� ������ ���� �����. ������ �� ������ ���� ���� ������: ������ �� ���? ��, ������ ��, �������?"
	eng_desc = "A very popular amongst western cops weapon, reliable, powerful and precise. Did he shoot six times, or only five?"
	icon_state = "anaconda"
	w_class = 3
	fire_sound = 'sound/stalker/weapons/desert_shot.ogg'
	fire_delay = 1.5
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/anaconda
	force = 10
	can_suppress = 0
	can_unsuppress = 0
	spread = 6
	recoil = 1
	durability = 500
	damagelose = 0.1
	drawsound = 'sound/stalker/weapons/draw/usp_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/obrez_load.ogg'
	opensound = 'sound/stalker/weapons/unload/obrez_open.ogg'


///////////////////////////// ��������, �� //////////////////////////////////////////

/obj/item/weapon/gun/projectile/automatic
	var/image/mag_overlay 			= null
	var/image/mag_overlay_inhands 	= null
	var/image/silencer_overlay 		= null
	var/image/scope_overlay 		= null
	var/image/colored_overlay 		= null
	var/colored 					= null

/obj/item/weapon/gun/projectile/automatic/New()
	..()
	if(!istype(src, /obj/item/weapon/gun/projectile/automatic/pistol))
		mag_overlay = image('icons/stalker/projectile_overlays32x32.dmi', "[initial(icon_state)]-mag", layer = FLOAT_LAYER)

	if(can_suppress)
		silencer_overlay = image('icons/stalker/projectile_overlays48x48.dmi', "[initial(icon_state)]-silencer", layer = FLOAT_LAYER)

	if(can_scope)
		scope_overlay = image('icons/stalker/projectile_overlays32x32.dmi', "[initial(icon_state)]-scope", layer = FLOAT_LAYER)

	if(colored)
		colored_overlay = image('icons/stalker/projectile_overlays32x32.dmi', "[initial(icon_state)]-[colored]", layer = FLOAT_LAYER)
		overlays += colored_overlay

	update_icon()

/obj/item/weapon/gun/projectile/automatic/update_icon()
	..()
	overlays.Cut()

	if(colored)
		overlays += colored_overlay

	if(magazine && mag_overlay)
		overlays += mag_overlay

	if(suppressed && silencer_overlay)
		overlays += silencer_overlay

	if(zoomable && scope_overlay)
		overlays += scope_overlay

	if(unique)
		overlays += image('icons/stalker/projectile_overlays32x32.dmi', "unique", layer = FLOAT_LAYER)

	if(istype(src, /obj/item/weapon/gun/projectile/automatic/pistol))
		icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"
	else
		item_state = "[initial(item_state)][magazine ? "" : "-e"]"	//���� �� ��������� � ��������� �� �����, ����� ���

	return
/*
/obj/item/weapon/gun/projectile/automatic/worn_overlays(var/isinhands = TRUE)
	. = list()
	if(!isinhands)
		if(magazine )
			overlays += mag_overlay

		if(suppressed )
			overlays += silencer_overlay
        . += image(icon = 'icons/effects/effects.dmi', icon_state = "[shield_state]")
*/

/obj/item/weapon/gun/projectile/automatic/ak74  // AK-74
	name = "AK 74"
	desc = "������� ������� 1974 ���� ��� ������ 5,45x39��. ���������&#255;�� ����� ������� � ������� ������, ���&#255; ��������� � ������������ ��������� ��������� �� �������� ������������&#255; � �������� ��&#255;. � ���� ��� �������� ������ ������� ��������� � ������ ��������."
	eng_desc = "This weapon, designed in 1974, signaled the adoption of small caliber and low impulse rounds by Warsaw Pact countries. A descendant of the most popular assault rifle in the world, the AKM-74/2 has an even bigger muzzle brake, resulting in a reduction of what was already manageable recoil. This facilitates better accuracy and groupings, especially when fired in fast single shots or bursts. As before, the rifle is very simple and reliable."
	icon_state = "ak74"
	item_state = "ak74"
	colored = 0//"normal"
	slot_flags = SLOT_BACK//|SLOT_BELT
	force = 15
	origin_tech = "combat=5;materials=1"
	mag_type = /obj/item/ammo_box/magazine/stalker/m545
	fire_sound = 'sound/stalker/weapons/ak74_shot.ogg'
	can_suppress = 1
	can_unsuppress = 1
	burst_size = 3
	fire_delay = 1.8
	pin = /obj/item/device/firing_pin
	durability = 120
	w_class = 4
	spread = 6
	recoil = 0.5
	randomspread = 0
	damagelose = 0.25
	can_scope = 1
	drawsound = 'sound/stalker/weapons/draw/ak74_draw.ogg'

/obj/item/weapon/gun/projectile/automatic/aksu74  // ���74�
	name = "AK 74S"
	desc = "�� ����� ��������� � ����� ��-74� (�����������) ������ � ����������-��������, ������ �� &#255;��&#255;���&#255; �������������� ���������. �����������: ����� �������� � �������� ������&#255; ����������&#255; �����������. ������� ���������� - ����&#255; ���������&#255; ��������� � ���������� � �������� ��������� ��� �������� ������&#255;��."
	eng_desc = "Despite being similar to submachineguns in size, weight and tactical purpose, this weapon is classified as an assault rifle due to the fact that its internal mechanism is identical to that of the AKM 74/2. The weapon is notable for its mobility in close quarters and high armor-penetration capacity, while its drawbacks are its short effective range, despite the relatively long bullet range, a tendency to overheat and high ricochet propensity."
	icon_state = "aksu74"
	item_state = "aksu74"
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=3;materials=1"
	mag_type = /obj/item/ammo_box/magazine/stalker/m545
	fire_sound = 'sound/stalker/weapons/ak74u_shot.ogg'
	can_suppress = 1
	burst_size = 3
	fire_delay = 1.8
	pin = /obj/item/device/firing_pin
	durability = 100
	w_class = 4
	spread = 9
	recoil = 0.7
	damagelose = 0.5
	can_scope = 1
	drawsound = 'sound/stalker/weapons/draw/ak74u_draw.ogg'

/*
/obj/item/weapon/gun/projectile/automatic/aksu74/black  // ���74� - ������ ����
	colored = "black"
	item_state = "aksu74-black"
	mag_type = /obj/item/ammo_box/magazine/stalker/m545
*/

/obj/item/weapon/gun/projectile/automatic/mp5  // MP5
	name = "MP-5"
	desc = "���� �� ����� ������ � ������ ����������-�������� ������. � ������� ��������� ���&#255;������� XX ���� ��� ����&#255;� �� ���������� ����������������� ����� � ������� �� ������ ������� ����. � ������� ��� ����������� ������ ����� ������������ �����&#255;�� ���� ����� ��&#255;��&#255;���&#255; �� ������ �����, ������ ������� ����� � � ����."
	eng_desc = "This submachine gun has gained popularity around the world thanks to its reliability, ease of use and accuracy. Over the last few decades the Viper 5 was in service with special armed forces and police units worldwide. Not surprisingly, having flooded the global black markets, it eventually made its way to the Zone."
	icon_state = "mp5"
	item_state = "gun"
	fire_sound = 'sound/stalker/weapons/mp5_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x19mp5
	can_suppress = 1
	burst_size = 3
	fire_delay = 1.25
	slot_flags = SLOT_BELT
	durability = 100
	w_class = 3
	spread = 7
	recoil = 0.2
	damagelose = 0.4
	can_scope = 1
	drawsound = 'sound/stalker/weapons/draw/mp5_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/mp5_load.ogg'
	opensound = 'sound/stalker/weapons/unload/mp5_open.ogg'

/obj/item/weapon/gun/projectile/automatic/kiparis  // �������
	name = "Kiparis"
	desc = "���������, ������ � ������� ��������-������� ��� ���������� ������, ������������� �� ������ ������������ ������� ���� � 1972-�� ����. �� ����� �������� ��������������� � ����� ��-�� ���������� � ������������ ��� ��� ������, �� ��� ������ �� ���������� �������� ���, ���, ������������� � ���������� ������� �������������� ������������ ��������."
	eng_desc = "A small, light submachine gun firing a low-powered bullet, was designed by USSR Defense Ministry in the year 1972. Wasn't adopted by army, but found use and popularity amongst different modern russian government military forces and police."
	icon_state = "kiparis"
	item_state = "gun"
	fire_sound = 'sound/stalker/weapons/fort_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/kiparis
	can_suppress = 1
	burst_size = 2
	fire_delay = 1
	slot_flags = SLOT_BELT
	durability = 80
	w_class = 3
	spread = 8
	recoil = 0.15
	damagelose = 0.25
	can_scope = 0
	drawsound = 'sound/stalker/weapons/draw/mp5_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/mp5_load.ogg'
	opensound = 'sound/stalker/weapons/unload/mp5_open.ogg'

/obj/item/weapon/gun/projectile/automatic/ppsh  // ���
	name = "PPSh"
	desc = "���� �� ����� ������ ������������� �������� ��������������� ������� �����&#255;, ��������-������� �������, � ��������� ������ ������ ������� �������������... ����� � �������� ����������� ������ �� ������� � ������� ��� ����� ��������. ��������� �������, ������, ���������� ��������� ��� ������ �������, ������������ ��� ��� ����� ������ � �������&#255;�� ������ �� �������. � ��� � ����� - ���� �� ����� �������&#255;���."
	eng_desc = "The PPSh saw extensive combat use during World War II and the Korean War. It was one of the major infantry weapons of the Soviet Armed Forces during World War II. Around six million PPSh-41s were manufactured. In the form of the Chinese Type 50 (licensed copy), it was still being used by the Viet Cong as late as 1970. According to the 2002 edition of the Encyclopedia of Weapons of World War II the PPSh was still in use with irregular militaries."
	icon_state = "ppsh"
	item_state = "gun"
	fire_sound = 'sound/stalker/weapons/pm_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/ppsh
	can_suppress = 0
	burst_size = 5
	fire_delay = 1.2
	slot_flags = SLOT_BELT
	durability = 50
	w_class = 4
	spread = 9
	recoil = 0.25
	damagelose = 0.5
	can_scope = 0
	drawsound = 'sound/stalker/weapons/draw/mp5_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/mp5_load.ogg'
	opensound = 'sound/stalker/weapons/unload/mp5_open.ogg'

/obj/item/weapon/gun/projectile/automatic/tpc301  // ����
	name = "LR-300"
	desc = "����&#255; ������� � �������� ��������� ���������� �-16. ��������&#255; ������������� ������� ������, ������� ���������� � ���������� ���� ������ ������ ���������&#255; ������� ��������� ��&#255;, ���&#255; ������&#255; ���������������� � ����&#255;������ ������ ��� ������������� ��&#255; ������������&#255; � ������� ������&#255;�."
	eng_desc = "A new step in the development of this famous weapon family. The changes were made to the upper half of the steel construction comprising the barrel, gas tube and bolt assembly, reducing the weapon's weight, improving ergonomics and its gas system. The weapon is highly accurate, although its propensity to catch dirt makes it a poor choice for the Zone's difficult conditions."
	icon_state = "tpc301"
	item_state = "tpc301"
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=6"
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	fire_sound = 'sound/stalker/weapons/tpc301_shoot.ogg'
	can_suppress = 1
	burst_size = 3
	fire_delay = 1.4
	pin = /obj/item/device/firing_pin
	durability = 80
	w_class = 4
	spread = 4
	recoil = 0.4
	damagelose = 0.2
	can_scope = 1
	drawsound = 'sound/stalker/weapons/draw/tpc301_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/tpc301_load.ogg'
	opensound = 'sound/stalker/weapons/unload/tpc301_open.ogg'

/obj/item/weapon/gun/projectile/automatic/abakan  // ������
	name = "AC-96"
	desc = "������ ������� ����� ��������� �����. ��� ���������� � �������� ������ ����������� ��-74. � �������� �������� �� ������ ���������� ���������, �� � ��&#255; ��������&#255; ������� ������ �� �������, ��� ������&#255;�� ������� ������, ��� ����� ����������� ������� �������� ��&#255;."
	eng_desc = "A modern assault rifle developed as a replacement for the ageing AKM 74/2. The main difference is its high speed 2-round burst firing mode, which allows two bullets to be fired at exactly the same spot on a target up to 100 meters away. This significantly increases the likelihood of hitting the target in comparison to the 1 round firing mode, which considerably improves kill potential, stopping power and armor piercing capability."
	icon_state = "abakan"
	item_state = "abakan"
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=6"
	mag_type = /obj/item/ammo_box/magazine/stalker/m545
	fire_sound = 'sound/stalker/weapons/abakan_shoot.ogg'
	can_suppress = 1
	burst_size = 2
	fire_delay = 1.5
	pin = /obj/item/device/firing_pin
	durability = 200
	w_class = 4
	spread = 4
	recoil = 0.4
	damagelose = 0.2
	can_scope = 1
	drawsound = 'sound/stalker/weapons/draw/abakan_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/abakan_load.ogg'
	opensound = 'sound/stalker/weapons/unload/abakan_open.ogg'

/obj/item/weapon/gun/projectile/automatic/il86  // ��86
	name = "L85"
	desc = "����� ����, ��� ��� �������� ���� �������� ������ �������������� �� �������� ��37, ��� � ������� ���������� ������� �� ������ �����, � ����� � � ����. ������� ������������ ��86 &#255;��&#255;���&#255; ������� 4-������� ������ � ������&#255; �������� ������� ��������. ��� �������� ������&#255;�� �������� ��&#255; ����� ������, � ��������� �������� ���������� �������� ������������ ������. ���������� ��� �������� ��������� ������&#255;�� � ����������."
	eng_desc = "This rifle's considerable number of drawbacks caused most of these weapons to be modernized, with the retired stock making its way to the Zone via the black market. The rifle's main advantages are its built-in 4x scope, high single-shot accuracy and reliable upgrade technology. When the weapon is fired in bursts, its accuracy decreases significantly and the rifle's basic internal mechanisms become somewhat unreliable."
	icon_state = "il86"
	item_state = "il86"
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=6;material=1"
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	fire_sound = 'sound/stalker/weapons/il86_shoot.ogg'
	can_suppress = 1
	zoomable = 1
	zoom_amt = 9
	burst_size = 2
	fire_delay = 1.8
	pin = /obj/item/device/firing_pin
	durability = 75
	w_class = 4
	spread = 4
	recoil = 0.4
	damagelose = 0.1
	can_scope = 0
	drawsound = 'sound/stalker/weapons/draw/l85_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/groza_load.ogg'
	opensound = 'sound/stalker/weapons/unload/groza_open.ogg'

/obj/item/weapon/gun/projectile/automatic/sigsg550
	name = "SIG SG 550"
	desc = "������������� ������������ ������ ��������� ��������� ��������. ��������&#255; ������� ���������, �������� � ��� � �������� � ���������, &#255;��&#255;���&#255; ����� �� ������ �������� ���������&#255; ����� ������. � ���� ����������&#255; ������� � ����� ������� �����; ������ � ���������� ���������� ��&#255; ���&#255; ������� ��������."
	eng_desc = "A relatively new assault rifle that has quickly found admirers around the world, despite lacking a \"trendy\" design. Weapons of this series are one of the best in their class, renowned for their reliability, accuracy and ease of use. Despite being relatively difficult to obtain in the Zone, this assault rifle is often ordered by experienced stalkers at considerable expense."
	icon_state = "sigsg550"
	item_state = "sigsg550"
	slot_flags = SLOT_BACK
	fire_sound = 'sound/stalker/weapons/sigsg550_shoot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	can_suppress = 0
	durability = 125
	burst_size = 2
	fire_delay = 1.3
	w_class = 4
	spread = 3
	recoil = 0.3
	damagelose = 0.2
	can_scope = 0
	drawsound = 'sound/stalker/weapons/draw/fnf2000_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/fnf2000_load.ogg'
	opensound = 'sound/stalker/weapons/unload/fnf2000_open.ogg'

/obj/item/weapon/gun/projectile/automatic/gp37  // GP37
	name = "GP37"
	desc = "��������&#255; �������� ������ ���������, �����������&#255; � �������� � ����� �����&#255;� ��&#255; ���&#255;��� ������������ ���������&#255;. ����������� ���������� �������� ��&#255; ��� �� ������� ����������, ������ ������� � ���������� � ����� ��������. ����� ������ �������� ����������� ����� ������� � ���������."
	eng_desc = "A new addition to the Western-made assault rifle family, which differs significantly from previous models in the series built on an automatic foundation with a semi-open bolt assembly, this weapon is more like American automatic gas-operated assault rifles with a short-stroke gas piston system. These changes ensure that the rifle is a first-rate example of a modern weapon - lightweight, reliable and ergonomic."
	icon_state = "gp37"
	item_state = "gp37"
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=6;material=1"
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	fire_sound = 'sound/stalker/weapons/il86_shoot.ogg'
	can_suppress = 1
	zoomable = 1
	zoom_amt = 10
	burst_size = 2
	fire_delay = 1.25
	pin = /obj/item/device/firing_pin
	durability = 150
	w_class = 4
	spread = 3
	recoil = 0.35
	damagelose = 0.1
	can_scope = 0
	drawsound = 'sound/stalker/weapons/draw/l85_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/groza_load.ogg'
	opensound = 'sound/stalker/weapons/unload/groza_open.ogg'

/obj/item/weapon/gun/projectile/automatic/fnf2000  // fnf2000
	name = "FN-F2000"
	desc = "��-�2000 � ��-������ ��������� ������. ����������� ��������� ������������� ����������� � ������� �������������� �������������� ������� �������� ������ ������� ���� �������������. ��� ������������� ��������������� ���&#255; ����� ����� ������ ������������&#255; ����������. ���&#255;�� � ��37 &#255;��&#255;���&#255; ����� �� ������ ������ �������� � ����."
	eng_desc = "This futuristic-looking weapon with a bullpup layout is actually a mass produced modular system, comprising a rifle grenade complex with a computerized fire control system and a 40-mm grenade launcher. Despite its bulky appearance, the weapon is highly ergonomic, easy to use and benefits from good technical characteristics."
	icon_state = "fnf2000"
	item_state = "fnf2000"
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=6"
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	fire_sound = 'sound/stalker/weapons/fnf2000_shoot.ogg'
	can_suppress = 0
	burst_size = 3
	fire_delay = 1.4
	pin = /obj/item/device/firing_pin
	durability = 250
	w_class = 4
	spread = 3
	recoil = 0.35
	damagelose = 0.15
	can_scope = 0
	drawsound = 'sound/stalker/weapons/draw/fnf2000_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/fnf2000_load.ogg'
	opensound = 'sound/stalker/weapons/unload/fnf2000_open.ogg'

/obj/item/weapon/gun/projectile/automatic/fnf2000s  // fnf2000
	name = "FN-F2000-OTBS"
	desc = "��-�2000 � ��-������ ��������� ������. ����������� ��������� ������������� ����������� � ������� �������������� �������������� ������� �������� ������ ������� ���� �������������. ��� ������������� ��������������� ���&#255; ����� ����� ������ ������������&#255; ����������. ���&#255;�� � ��37 &#255;��&#255;���&#255; ����� �� ������ ������ �������� � ����. � ������ ������ �������������� ������� ��� �������� � ���� ��� ������������."
	eng_desc = "This futuristic-looking weapon with a bullpup layout is actually a mass produced modular system, comprising a rifle grenade complex with a computerized fire control system and a 40-mm grenade launcher. Despite its bulky appearance, the weapon is highly ergonomic, easy to use and benefits from good technical characteristics."
	icon_state = "fnf2000s"
	item_state = "fnf2000s"
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=6"
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	fire_sound = 'sound/stalker/weapons/fnf2000_shoot.ogg'
	can_suppress = 0
	burst_size = 3
	fire_delay = 1.4
	zoomable = 1
	zoom_amt = 12
	pin = /obj/item/device/firing_pin
	durability = 250
	w_class = 4
	spread = 1
	recoil = 0.35
	damagelose = 0.15
	can_scope = 0
	drawsound = 'sound/stalker/weapons/draw/fnf2000_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/fnf2000_load.ogg'
	opensound = 'sound/stalker/weapons/unload/fnf2000_open.ogg'


/obj/item/weapon/gun/projectile/automatic/l6_saw/pkm
	name = "PKM"
	desc = "���� ������ �����&#255;�� ������������ ��������� � ����� ��������, ��� ��� ������������&#255; � ������, � ����� ������� ������ ����� ������ � ��������, ��� ���&#255; ����� ������ �������� ��������� ������. ������� �� ������ ���������� � �������� - �� ������. ������, ������� ���� ������ �����������."
	eng_desc = "This belt-fed machine gun is a portable modification with a complex two-stage feeding system. Despite its weight and low precision, this LMG has found admirers in the Zone. Used primarily to fight off outnumbering enemy forces during faction conflicts and clear out mutant lairs"
	icon_state = "PKMclosed200"
	item_state = "l6closedmag"
	w_class = 5
	slot_flags = SLOT_BACK
	origin_tech = "combat=5;materials=1;syndicate=2"
	mag_type = /obj/item/ammo_box/magazine/stalker/pkm
	weapon_weight = WEAPON_MEDIUM
	fire_sound = 'sound/stalker/weapons/pkm_shot.ogg'
	can_suppress = 0
	can_scope = 0
	burst_size = 5
	fire_delay = 1.8
	spread = 6
	recoil = 1
	damagelose = 0.25
	pin = /obj/item/device/firing_pin
	durability = 500

/obj/item/weapon/gun/projectile/automatic/l6_saw/pkm/update_icon()
	icon_state = "PKM[cover_open ? "open" : "closed"][magazine ? Ceiling(get_ammo(0)/200)*200 : "-empty"]"

/obj/item/weapon/gun/projectile/automatic/l6_saw/pkm/shottie
   name = "PTV M-777"
   desc = "������ ������ ���������. ��&#255;��� ��� ������."
   mag_type = /obj/item/ammo_box/magazine/stalker/pkm/shottie

///////////////////////////// ����������� �������� //////////////////////////////////////////
/obj/item/weapon/gun/projectile/automatic/val  // ���
	name = "AS Val"
	desc = "������ �� ���� ��������� ����������� �������� '��������', �� ������� ���������&#255; �������� ��������� � ����������� �������. ���������� �������������&#255; ��&#255; ���������&#255; ����������������&#255;�� � ������&#255;� �����, ��������� ��������� � ������������ ��������."
	eng_desc = "A modified version of the silent Vintar BC sniper rifle, the assault rifle was designed as a special forces weapon. The rifle's primary purpose is effective fire against enemies employing modern personal protection equipment without disclosing the shooter's location. Thanks to its integrated silencer and 9x39 caliber round with a heavy subsonic bullet, the weapon's noise and muzzle flash have been reduced to a minimum."
	icon_state = "val"
	item_state = "val"
	fire_sound = 'sound/stalker/weapons/vintorez_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sp9x39val
	suppressed = 1
	can_suppress = 0
	can_unsuppress = 0
	durability = 150
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=5;materials=1"
	burst_size = 3
	fire_delay = 1.2
	pin = /obj/item/device/firing_pin
	w_class = 4
	spread = 3
	recoil = 0.3
	damagelose = 0.1
	can_scope = 1
	drawsound = 'sound/stalker/weapons/draw/val_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/val_load.ogg'
	opensound = 'sound/stalker/weapons/unload/val_open.ogg'

/obj/item/weapon/gun/projectile/automatic/vintorez  // ��� ��������
	name = "VSS Vintorez"
	desc = "�������� ����������&#255; ����������&#255; '��������'. ������������� ��&#255; ��������� � ������������ ����������� �������� � �������� ��������������� ����������. � ������&#255;��&#255; 400 ������ ��������� ����������� ������������. ����� ������� ���������� ������ �����&#255; ������."
	eng_desc = "A special military sniper rifle purpose-built for silent, flashless sniping during special operations where early detection of the shooter may be critical. The Vintar BC provides high armor-piercing capability and stopping power, as well as being equipped with an integrated sniper and optical scope. Highly rated by many stalkers despite its small magazine."
	icon_state = "vintorez"
	item_state = "vintorez"
	fire_sound = 'sound/stalker/weapons/vintorez_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sp9x39vint
	suppressed = 1
	can_suppress = 0
	can_unsuppress = 0
	zoomable = 1
	zoom_amt = 7
	burst_size = 3
	fire_delay = 1.2
	durability = 150
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=5;materials=1"
	pin = /obj/item/device/firing_pin
	w_class = 4
	spread = 2
	recoil = 0.3
	damagelose = 0
	can_scope = 0
	drawsound = 'sound/stalker/weapons/draw/val_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/val_load.ogg'
	opensound = 'sound/stalker/weapons/unload/val_open.ogg'

/obj/item/weapon/gun/projectile/automatic/groza  // ��-14 �����
	name = "Groza OTs-14"
	desc = "���������-������������ �������� - ����� ������� � ������&#255;� ���� ������� ��������� ��������: ����������, �������, � � �� �� ����&#255; ������������� � ������. '�����' ����� ���&#255;� ������� ��������."
	eng_desc = "This assault rifle combined with a grenade launcher, which is similar to the AKM series, was specifically developed for rapid response units. The main differences are its 9x39 caliber ammunition, bullpup layout and extensive configuration options. This weapon is highly valued by military stalkers due to its ability to kill enemies wearing body armor behind improvised cover at a distance during urban combat, as well as its excellent stopping power."
	icon_state = "groza"
	item_state = "groza"
	fire_sound = 'sound/stalker/weapons/groza_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sp9x39groza
	can_suppress = 0
	durability = 125
	slot_flags = SLOT_BACK
	fire_delay = 1
	force = 15
	origin_tech = "combat=5;materials=1"
	burst_size = 3
	pin = /obj/item/device/firing_pin
	w_class = 4
	spread = 5
	recoil = 0.4
	damagelose = 0.35
	can_scope = 1
	drawsound = 'sound/stalker/weapons/draw/groza_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/groza_load.ogg'
	opensound = 'sound/stalker/weapons/unload/groza_open.ogg'


/obj/item/weapon/gun/projectile/automatic/testgun
	name = "testgun"
	desc = "testing"
	icon_state = "ak74"
	item_state = "gun"
	fire_sound = 'sound/stalker/weapons/ak74_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/testgun
	can_suppress = 1
	burst_size = 3
	durability = 1000
	slot_flags = SLOT_BACK|SLOT_BELT
	force = 10
	w_class = 3
	spread = 10
