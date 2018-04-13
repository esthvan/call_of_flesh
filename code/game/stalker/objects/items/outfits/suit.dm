/obj/item/clothing/suit
	var/CCBS = 0 //������ � ��������� �������� �������

/obj/item/clothing
	var/durability = 100

/obj/item/clothing/head
	var/CBBS_h = 0

/obj/item/clothing/head/examine(mob/user)
	..()
	if(!istype(src, /obj/item/clothing/head/winterhood))
		var/percentage = null
		if(durability)
			percentage = (durability / (initial(durability)))*100
			if(percentage >= 50)
				user << "<span class='notice'>��������� - [percentage]%</span>"
			else
				user << "<span class='warning'>��������� - [percentage]%</span>"

/obj/item/clothing/mask/examine(mob/user)
	..()
	var/percentage = null
	if(durability)
		percentage = (durability / (initial(durability)))*100
		if(percentage >= 50)
			user << "<span class='notice'>��������� - [percentage]%</span>"
		else
			user << "<span class='warning'>��������� - [percentage]%</span>"


/obj/item/clothing/suit/examine(mob/user)
	..()
	var/percentage = null
	if(durability)
		percentage = (durability / (initial(durability)))*100
		if(percentage >= 50)
			user << "<span class='notice'>��������� - [percentage]%</span>"
		else
			user << "<span class='warning'>��������� - [percentage]%</span>"

/obj/item/clothing/suit/hooded/kozhanka
	name = "leather jacket"
	desc = "������&#255; ������&#255; ������&#255; ������, ����� �����. ������ ��������� �������������� � ���������� ������. ������������ ������ ���������� � ������ �����������."
	icon_state = "kozhanka"
	item_state = "det_suit"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	armor = list(melee = 10, bullet = 10, laser = 10,burn = 10, bomb = 10, bio = 10, rad = 10, electro = 10)
	allowed = list(/obj/item/weapon/gun/projectile,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/weapon/restraints/handcuffs,/obj/item/device/flashlight/seclite,/obj/item/weapon/storage/fancy/cigarettes,/obj/item/weapon/lighter,/obj/item/weapon/stalker/knife)
	hooded = 1
	action_button_name = "Toggle Hood"
	unacidable = 1
	hoodtype = /obj/item/clothing/head/winterhood/stalker/kozhanka
	durability = 75

/obj/item/clothing/head/winterhood/stalker
	body_parts_covered = HEAD
	cold_protection = HEAD
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags = NODROP//|BLOCKHEADHAIR

/obj/item/clothing/head/winterhood/stalker/kozhanka
	icon_state = "winterhood_kozhanka"
	armor = list(melee = 10, bullet = 0, laser = 10,burn = 10, bomb = 0, bio = 10, rad = 10, electro = 10)

/obj/item/clothing/suit/hooded/kozhanka/white
	icon_state = "kozhanka_wh"
	item_state = "labcoat"
	hoodtype = /obj/item/clothing/head/winterhood/stalker/kozhanka_wh

/obj/item/clothing/head/winterhood/stalker/kozhanka_wh
	armor = list(melee = 10, bullet = 0, laser = 10,burn = 10, bomb = 0, bio = 10, rad = 10, electro = 10)
	icon_state = "winterhood_kozhanka_wh"

/obj/item/clothing/suit/hooded/kozhanka/banditka
	name = "bandit jacket"
	desc = "�����������&#255; ������ ������� - ������&#255; ������ �� ������� ��������� ����������. ��� ������, ������ ������������� � ������ ������&#255;� ����."
	icon_state = "banditka"
	item_state = "ro_suit"
	armor = list(melee = 15, bullet = 15, laser = 10,burn = 10, bomb = 10, bio = 10, rad = 10, electro = 10)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/banditka
	durability = 75

/obj/item/clothing/head/winterhood/stalker/banditka
	armor = list(melee = 15, bullet = 0, laser = 10,burn = 10, bomb = 10, bio = 10, rad = 10, electro = 10)
	icon_state = "winterhood_banditka"

/obj/item/clothing/suit/hooded/kozhanka/banditka/unique
	name = "chain-mail jacket"
	desc = "������� ���������� ���������� ����������, �� � ��������� ����� ���������� �������. ������� ����� ��� ���� ����� �������, �� �������&#255; ������ ������ �� ����."
	icon_state = "banditka"
	item_state = "ro_suit"
	unique = 1
	armor = list(melee = 15, bullet = 28, laser = 10,burn = 10, bomb = 10, bio = 10, rad = 10, electro = 10)

/obj/item/clothing/suit/hooded/kozhanka/unique
	name = "anomaly jacket"
	desc = "��� ������ ��&#255;�� � ����� ������ �� ���������, ������� � �������� '������'. �������� ������ ����&#255; � ��������, ������ ������ �������� �����&#255;�� ����������."
	icon_state = "kozhanka"
	item_state = "det_suit"
	unique = 1
	armor = list(melee = 10, bullet = 10, laser = 10,burn = 10, bomb = 20, bio = 20, rad = 10, electro = 10)

/obj/item/clothing/suit/hooded/kombez
	name = "sunrise"
	desc = "������������ '��������� ���������' ���������� �������� ���������&#255;�� ����� ����������� ��������� ������ ���������� ����������� � ����������� �� ������������ �����. ������ �� ���� ���������� ���������� �������. ������� �������� �� ������� ����������� �����&#255;. � ����� ������ ������������ ��&#255; �������� ������ � ��������� �������� � ����� ����."
	icon_state = "kombez"
	item_state = "syndicate-green"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	allowed = list(/obj/item/weapon/gun/projectile,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/weapon/restraints/handcuffs,/obj/item/device/flashlight/seclite,/obj/item/weapon/storage/fancy/cigarettes,/obj/item/weapon/lighter,/obj/item/weapon/stalker/knife)
	hooded = 1
	action_button_name = "Toggle Hood"
	unacidable = 1
	strip_delay = 80
	put_on_delay = 60
	flags_inv = HIDEJUMPSUIT
	armor = list(melee = 35, bullet = 25, laser = 50,burn = 50, bomb = 30, bio = 50, rad = 50, electro = 50)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/kombez
	durability = 200

/obj/item/clothing/head/winterhood/stalker/kombez
	armor = list(melee = 35, bullet = 	0, laser = 50,burn = 50, bomb = 0, bio = 50, rad = 50, electro = 50)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_kombez"

/obj/item/clothing/suit/jacket/sidor
	name = "old vest"
	desc = "�������&#255; �������, ��������&#255; �� ���� ������."
	icon_state = "sidor_vest"
	item_state = "det_suit"
	burn_state = FIRE_PROOF
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank/internals/emergency_oxygen,/obj/item/toy,/obj/item/weapon/storage/fancy/cigarettes,/obj/item/weapon/lighter,/obj/item/weapon/gun/projectile/automatic/pistol,/obj/item/weapon/gun/projectile/revolver,/obj/item/weapon/gun/projectile/revolver/detective,/obj/item/weapon/stalker/knife)

/obj/item/clothing/suit/hooded/kozhanka/banditka/coat
	name = "bandit coat"
	desc = "������� ���� �� ������ ����. ��������� ������ �������� �� ������������, ����� ��� �� ���� ��������� ����� � ��&#255;���� ���� ������ ������. ���������� ��������, ��, ��� �� �����, ����� �����������&#255; ��������� - ��������, ������������� ��-�� �������� ����."
	icon_state = "banditcoat"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list(melee = 20, bullet = 15, laser = 15,burn = 30, bomb = 0, bio = 10, rad = 10, electro = 30)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/bandit
	durability = 150

/obj/item/clothing/head/winterhood/stalker/bandit
	armor = list(melee = 15, bullet = 0, laser = 15,burn = 30, bomb = 10, bio = 10, rad = 10, electro = 30)
	icon_state = "winterhood_banditcoat"

/obj/item/clothing/suit/hooded/kozhanka/banditka/coat/brown
	icon_state = "banditcoatbrown"
	hoodtype = /obj/item/clothing/head/winterhood/stalker/banditbrown

/obj/item/clothing/head/winterhood/stalker/banditbrown
	armor = list(melee = 15, bullet = 0, laser = 15,burn = 30, bomb = 0, bio = 10, rad = 10, electro = 30)
	icon_state = "winterhood_banditcoatbrown"

/obj/item/clothing/suit/hooded/kombez/ecolog
	name = "SSP-99"
	desc = "��������� ��&#255; ������ � ������&#255;� ���� ������ ������ ���-99. �����������&#255; ���������&#255;�� ������ � �������������� � ���� ���������-��������. ���������&#255; ������� ���������� ������� � ����������������&#255;. �� ��������� �� ������� ������ ��������."
	icon_state = "ecolog"
	item_state = "suit-orange"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_SUIT_MAX_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	flags = STOPSPRESSUREDMAGE | THICKMATERIAL
	armor = list(melee = 15, bullet = 15, laser = 90, burn = 90, bomb = 40, bio = 90, rad = 95, electro = 90)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/nightvision/ecolog
	burn_state = FIRE_PROOF
	CCBS = 1
	durability = 200

/obj/item/clothing/head/winterhood/stalker/nightvision/ecolog
	name = "SSP-99 helmet"
	armor = list(melee = 15, bullet = 15, laser = 90, burn = 90, bomb = 40, bio = 90, rad = 95, electro = 90)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_HELM_MAX_TEMP_PROTECT
	icon_state = "ecolog_helmet"
	CBBS_h = 1

/////////////////////////////////////////////////////////////////////����� ������� �������/////////////////////////////////////////////////////////////////////////////////////////

/obj/item/clothing/head/winterhood/stalker/nightvision
	var/vision_flags = 0
	var/darkness_view = 4//Base human is 2
	var/invis_view = SEE_INVISIBLE_LIVING
	var/list/icon/current = list()
	action_button_name = "Toggle Night Vision"
	var/active = 0
	var/obj/screen/overlay = null
	invis_view = SEE_INVISIBLE_LIVING

/obj/item/clothing/head/winterhood/stalker/nightvision/attack_self(mob/user)
	if(active)
		active = 0
		playsound(usr, 'sound/stalker/nv_off.ogg', 50, 1, -1)
		usr << "You deactivate the optical matrix on the [src]."
		if(istype(usr, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = usr
			H.nightvision.alpha = 0
		//overlay = null
		invis_view = SEE_INVISIBLE_LIVING
		//sleep(5)
	else
		active = 1
		playsound(usr, 'sound/stalker/nv_start.ogg', 50, 1, -1)
		usr << "You activate the optical matrix on the [src]."
		if(istype(usr, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = usr
			H.nightvision.alpha = 125
		//overlay = global_hud.nvg
		invis_view = SEE_INVISIBLE_MINIMUM
		sleep(5)

/obj/item/clothing/head/winterhood/stalker/nightvision/ui_action_click()
	attack_self()

/obj/item/clothing/head/winterhood/stalker/nightvision/New()
	..()
	overlay = global_hud.nvg

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/clothing/suit/hooded/kombez/ecologm
	name = "SSP-99M"
	desc = "������������������ ���������������� ���������� ���-99. ��������� ������ ����� �� �������� � ����������� ����������&#255;. ������������ ��&#255; ���������� ������ ������� ����������. ����������&#255; ������ �� �������� � ������������� ��������. ������� � ���������-����������� ������ � ������ ������� ��&#255; ��������� ����������&#255;�."
	icon_state = "ecologg"
	item_state = "syndicate-green"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_SUIT_MAX_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	flags = STOPSPRESSUREDMAGE | THICKMATERIAL
	armor = list(melee = 40, bullet = 30, laser = 90,burn = 90, bomb = 60, bio = 90, rad = 90, electro = 90)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/nightvision/ecologm
	burn_state = FIRE_PROOF
	CCBS = 1
	durability = 250

/obj/item/clothing/head/winterhood/stalker/nightvision/ecologm
	name = "SSP-99M helmet"
	armor = list(melee = 40, bullet = 30, laser = 90,burn = 90, bomb = 60, bio = 90, rad = 90, electro = 90)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_HELM_MAX_TEMP_PROTECT
	icon_state = "ecologg_helmet"
	burn_state = FIRE_PROOF
	CBBS_h = 1

/obj/item/clothing/suit/hooded/kombez/seva
	name = "SEVA"
	desc = "������������ ����� �� ��������� �������� ��� ������ ���������� ����������&#255;�� �������� ������������ ������ ������������� ������������, ������������� � ��������� ������&#255;�. ���������&#255;�� �� ���&#255; �������� ��������� �������������� �����������, ������� ������&#255; � ��������� ������, � ����� ���������� �������� ���������&#255; �������&#255; ���������� �����. �� ���� �������� ������� ���������� &#255;��&#255;���&#255; ������� �������. ������������ ���������� - ��� ����."
	icon_state = "seva"
	item_state = "syndicate-black"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_SUIT_MAX_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	flags = STOPSPRESSUREDMAGE | THICKMATERIAL
	armor = list(melee = 60, bullet = 50, laser = 80,burn = 80, bomb = 50, bio = 70, rad = 80, electro = 80)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/nightvision/seva
	burn_state = FIRE_PROOF
	CCBS = 1
	durability = 200

/obj/item/clothing/head/winterhood/stalker/nightvision/seva
	armor = list(melee = 60, bullet = 50, laser = 80,burn = 80, bomb = 50, bio = 70, rad = 80, electro = 80)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_HELM_MAX_TEMP_PROTECT
	icon_state = "seva_helmet"
	burn_state = FIRE_PROOF
	CBBS_h = 1

/obj/item/clothing/suit/hooded/kombez/seva/orange
	icon_state = "sevao"
	item_state = "suit-orange"
	hoodtype = /obj/item/clothing/head/winterhood/stalker/nightvision/seva/orange

/obj/item/clothing/head/winterhood/stalker/nightvision/seva/orange
	icon_state = "sevao_helmet"

/obj/item/clothing/suit/hooded/kombez/psz9md
	name = "PSZ-9MD"
	desc = "�������� �������� ������ ��&#255; ����. �������� ���&#255;� ��� �� ��������� �������� ����������������� ������� � �������������� ������. � �������: ���������� ���-9�, ������� ������&#255; � ��������� ������, ���������&#255; ������� ���������&#255; �������&#255; ���������� �����. ����������&#255;�� ������������ ������ �� �������� � ����������� ��������&#255;."
	icon_state = "psz9md"
	item_state = "syndicate-black-red"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_SUIT_MAX_TEMP_PROTECT
	strip_delay = 80
	put_on_delay = 60
	flags_inv = HIDEJUMPSUIT
	flags = STOPSPRESSUREDMAGE | THICKMATERIAL
	armor = list(melee = 50, bullet = 50, laser = 80,burn = 65, bomb = 50, bio = 50, rad = 70, electro = 65)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/nightvision/psz9md
	burn_state = FIRE_PROOF
	CCBS = 1
	durability = 150

/obj/item/clothing/head/winterhood/stalker/nightvision/psz9md
	armor = list(melee = 50, bullet = 50, laser = 80,burn = 65, bomb = 50, bio = 50, rad = 70, electro = 65)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_HELM_MAX_TEMP_PROTECT
	icon_state = "psz9md_helmet"
	burn_state = FIRE_PROOF
	CBBS_h = 1

/obj/item/clothing/suit/hooded/kombez/exoskelet
	name = "exoskelet"
	desc = "����������������� ������� �������� �����������. � �������� ������������ ��� � �� �����, � ���� ������������ ����������� � ��������� ������ � ��������������. �� �����&#255; �� ���, ����������&#255; ������ �����&#255;�� �� ���������� �������&#255;��&#255;� �� ��������� �������. ������ ���������� ��������&#255; � �������� ���������. � ��� ��������� �������������� ����������, ����������� ��������� �����������, � ����� ������� ����&#255;. ����������&#255;�� ������������ ������ �� �������� � ����������� ��������&#255;, �� �� ����������� ��������� � �������&#255;�."
	icon_state = "exoskelet"
	item_state = "syndicate-black"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	flags_inv = HIDEJUMPSUIT
	armor = list(melee = 80, bullet = 75, laser = 50,burn = 30, bomb = 80, bio = 50, rad = 30, electro = 30)
	hooded = 1
	action_button_name = "Toggle Hood"
	hoodtype = /obj/item/clothing/head/winterhood/stalker/nightvision/exoskelet
	CCBS = 1
	durability = 200

/obj/item/clothing/head/winterhood/stalker/nightvision/exoskelet
	armor = list(melee = 80, bullet = 75, laser = 50,burn = 30, bomb = 80, bio = 50, rad = 30, electro = 30)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	icon_state = "exoskelet_helmet"
	CBBS_h = 1


/obj/item/clothing/suit/army
	name = "army armor"
	desc = "����������� ��������� ����������, ���������� ���� ��������������, �����&#255;���� �������� ����. ����������&#255;�� ������ ������ �� ���� � ��������� �����&#255;, ��������� ���������� ��&#255; ������� ������ ����, ��� ��� �� ����� ������� ������ �� ����������&#255; ���������� �����."
	icon_state = "army_armor1"
	item_state = "armor"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	unacidable = 1
	armor = list(melee = 25, bullet = 40, laser = 10,burn = 20, bomb = 10, bio = 0, rad = 15, electro = 20)
	allowed = list(/obj/item/weapon/gun/projectile,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/weapon/restraints/handcuffs,/obj/item/device/flashlight/seclite,/obj/item/weapon/storage/fancy/cigarettes,/obj/item/weapon/lighter,/obj/item/weapon/stalker/knife)
	durability = 150

/*
/obj/item/clothing/suit/army/army2
	icon_state = "army_armor2"
*/
/obj/item/clothing/suit/army/New()
	icon_state = "army_armor[rand(1, 2)]"

/obj/item/clothing/suit/berill
	name = "berill-5M"
	desc = "���������������&#255; ��&#255; ������ � ������&#255;� ����, ���������� ���������� ��������."
	icon_state = "berill_5m"
	item_state = "syndicate-green"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list(melee = 40, bullet = 50, laser = 30,burn = 30, bomb = 40, bio = 30, rad = 30, electro = 30)
	allowed = list(/obj/item/weapon/gun/projectile,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/weapon/restraints/handcuffs,/obj/item/device/flashlight/seclite,/obj/item/weapon/storage/fancy/cigarettes,/obj/item/weapon/lighter,/obj/item/weapon/stalker/knife)
	durability = 150

/obj/item/clothing/suit/hooded/kombez/monolit
	name = "monolith armor"
	desc = "���������� �������� ����������� '�������'. ������������� ����������. �� �������� ��������������� ������� �������� ���������� ����������� ����� ��3-9�. �� ��������� ���������� ������ ���������������� ����� ����������� ��������� �����������, � ������� ���������� ������&#255;���&#255; � �������� ������������������� ������. ������� �������� �� ������� ����������� �����&#255;. ������� ������ �� ���������� ���������� ������&#255;�� ������ ������� ��-�� ���������&#255; ������� ���������� �������."
	icon_state = "monolit"
	item_state = "syndicate-green"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list(melee = 25, bullet = 35, laser = 50,burn = 50, bomb = 40, bio = 50, rad = 30, electro = 50)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/monolit
	durability = 150

/obj/item/clothing/head/winterhood/stalker/monolit
	armor = list(melee = 25, bullet = 0, laser = 50,burn = 50, bomb = 0, bio = 50, rad = 30, electro = 50)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_monolit"

/obj/item/clothing/suit/skat
	name = "SKAT-M9"
	desc = "��������� ����������� ����-9� ������ ��&#255; ���������&#255; ��������� �������� � ����� ���������� ��������. � �������: �&#255;���� ��������� ����������� ����� ��3-12�, ���������� ��������������� ������. ����������&#255;�� ������������ ������ �� �������� � ����������� ��������&#255;, ��� ���� �� �����&#255; ����������� �������. � ������� ���������������&#255; ������� ������ �� ����������� ����������&#255;."
	icon_state = "skat"
	item_state = "syndicate-black"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	allowed = list(/obj/item/weapon/gun/projectile,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/weapon/restraints/handcuffs,/obj/item/device/flashlight/seclite,/obj/item/weapon/storage/fancy/cigarettes,/obj/item/weapon/lighter,/obj/item/weapon/stalker/knife)
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	unacidable = 1
	armor = list(melee = 60, bullet = 60, laser = 60,burn = 45, bomb = 70, bio = 35, rad = 45, electro = 45)
	durability = 200

/obj/item/clothing/suit/hooded/kombez/psz9d
	name = "PS5-M"
	desc = "����������� ������ ����������� �����. ������ �������� ����������� �� ���������, ������� �������� � ������������ ������ ��������. � ������� �� ���, ������������ ������� ������ �� ����������� ����������� � ��� ���� �������� ���������� ����������� ���� � ��������� ���������� ����."
	icon_state = "psz9d"
	item_state = "syndicate-black-red"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	put_on_delay = 60
	flags_inv = HIDEJUMPSUIT
	armor = list(melee = 30, bullet = 30, laser = 50,burn = 35, bomb = 30, bio = 30, rad = 30, electro = 35)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/psz9d
	durability = 200

/obj/item/clothing/head/winterhood/stalker/psz9d
	armor = list(melee = 30, bullet = 0, laser = 50,burn = 35, bomb = 0, bio = 30, rad = 30, electro = 35)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_psz9d"

/obj/item/clothing/suit/hooded/kombez/mercenary
	name = "mercenary armor"
	desc = "���������� �������� �� ����������� '�������'. �� ������ ��&#255;�� ������� ���������� �������� �������� �����. �� ���� ����������� ��������� ����� ������� ������������ ����� ��� ���������� �������� �������. �� �������� ��������������� ������� ����������� ��������� ����������� ����� ��3-7."
	icon_state = "mercenary"
	item_state = "syndicate-black"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	put_on_delay = 60
	flags_inv = HIDEJUMPSUIT
	armor = list(melee = 20, bullet = 45, laser = 10,burn = 15, bomb = 10, bio = 0, rad = 10, electro = 15)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/mercenary
	durability = 150

/obj/item/clothing/head/winterhood/stalker/mercenary
	armor = list(melee = 20, bullet = 25, laser = 10,burn = 15, bomb = 50, bio = 0, rad = 10, electro = 15)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_mercenary"

/obj/item/clothing/suit/hooded/kombez/strazh
	name = "guardian of freedom"
	desc = "������������ �������������� ����������� �������� ��������� ���������� ��������. ������� ��������� ���������� ���� ��������� ����������� ����������� �������� ���� �������� ������ �� ���������� ���� � �������� �� ��������� ��������&#255;�. �������� ������� ������� �� ���� ����: ���������� ������������ ���� � ����� � ���������� �����. ��� ��������� ������ �� ��������� ���������� ����������� � ��������."
	icon_state = "strazh"
	item_state = "syndicate-green"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	put_on_delay = 60
	flags_inv = HIDEJUMPSUIT
	armor = list(melee = 30, bullet = 20, laser = 50,burn = 45, bomb = 30, bio = 30, rad = 40, electro = 45)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/strazh
	durability = 200

/obj/item/clothing/head/winterhood/stalker/strazh
	armor = list(melee = 30, bullet = 0, laser = 50,burn = 45, bomb = 0, bio = 20, rad = 40, electro = 45)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_strazh"

/obj/item/clothing/suit/hooded/kombez/kombez_bandit
	name = "bandit armor"
	desc = "���������� �������� �� ����������� '�������'. �� ������ ��&#255;�� ������� ���������� �������� �������� �����. �� ���� ����������� ��������� ����� ������� ������������ ����� ��� ���������� �������� �������. �� �������� ��������������� ������� ����������� ��������� ����������� ����� ��3-7."
	icon_state = "combez_bandit"
	item_state = "syndicate-orange"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	put_on_delay = 60
	flags_inv = HIDEJUMPSUIT
	armor = list(melee = 20, bullet = 45, laser = 10,burn = 15, bomb = 10, bio = 0, rad = 10, electro = 15)
	hoodtype = /obj/item/clothing/head/winterhood/stalker/kombez_bandit
	durability = 150

/obj/item/clothing/head/winterhood/stalker/kombez_bandit
	armor = list(melee = 20, bullet = 25, laser = 10,burn = 15, bomb = 50, bio = 0, rad = 10, electro = 15)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_combez_bandit"


/obj/item/clothing/suit/hooded/kombez/mercenary
	name = "mercenary leader armor"
	desc = "������� ����� �������� � ����������� ������ ������ � ������ ����������� ���������. �� �������������, ������ ����� ������ �� ��������� ����� ������ ���� ������ ������ �����... ������� ����� ���-�� ������?"
	icon_state = "mercleader"
	item_state = "syndicate-black"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	put_on_delay = 60
	flags_inv = HIDEJUMPSUIT
	armor = list(melee = 20, bullet = 45, laser = 10,burn = 15, bomb = 10, bio = 0, rad = 10, electro = 15)
	durability = 150