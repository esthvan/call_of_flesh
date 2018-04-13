/obj/machinery/stalker
	icon = 'icons/stalker/decor.dmi'

/obj/machinery/stalker/sidormat
	name = "SIDORMAT 3000"
	desc = "An equipment vendor for beginning stalkers. Insert money - buy stuff."
	icon_state = "radio"
	density = 1
	anchored = 1
	var/itemloc = null
	var/itemloc2 = null
	var/balance = 0
	var/rating = 0
	var/list/weapon_list = list(
		///////////////////////////////  ������  /////////////////////////////////////////

		///////////////////////////// **���������** /////////////////////////////////////
		new /datum/data/stalker_equipment("���",					/obj/item/weapon/gun/projectile/automatic/pistol/pm,		3000, 0),
		new /datum/data/stalker_equipment("���� 12",				/obj/item/weapon/gun/projectile/automatic/pistol/fort12,	6500, 0),
		new /datum/data/stalker_equipment("��1�",					/obj/item/weapon/gun/projectile/automatic/pistol/pb1s,		4500, 0),
		new /datum/data/stalker_equipment("���-� �200",				/obj/item/weapon/gun/projectile/automatic/pistol/sip,		7500, 1000),
		new /datum/data/stalker_equipment("����-919",				/obj/item/weapon/gun/projectile/automatic/pistol/cora,		8000, 1000),
		new /datum/data/stalker_equipment("�����",					/obj/item/weapon/gun/projectile/automatic/pistol/marta,		10000, 1000),
		new /datum/data/stalker_equipment("USP-match",				/obj/item/weapon/gun/projectile/automatic/pistol/usp_match, 9000, 1000),

		///////////////////////////// **��������, ��** /////////////////////////////////////
		new /datum/data/stalker_equipment("������ 5",				/obj/item/weapon/gun/projectile/automatic/mp5,				18000, 0),
		new /datum/data/stalker_equipment("�� 74/2 �",				/obj/item/weapon/gun/projectile/automatic/aksu74 ,			20000, 1000),
		new /datum/data/stalker_equipment("�� 74/2",				/obj/item/weapon/gun/projectile/automatic/ak74,				25000, 1000),
		new /datum/data/stalker_equipment("�� 96/2",				/obj/item/weapon/gun/projectile/automatic/abakan,			35000, 4000),
		new /datum/data/stalker_equipment("���-301",				/obj/item/weapon/gun/projectile/automatic/tpc301,			40000, 4000),
		new /datum/data/stalker_equipment("��86",					/obj/item/weapon/gun/projectile/automatic/il86,				40000, 4000),
		new /datum/data/stalker_equipment("��-14 �����",			/obj/item/weapon/gun/projectile/automatic/groza,			30000, 7000),
		new /datum/data/stalker_equipment("��������",				/obj/item/weapon/gun/projectile/automatic/vintorez,			50000, 7000),
		new /datum/data/stalker_equipment("�� \"���\"",				/obj/item/weapon/gun/projectile/automatic/val,				65000, 7000),

		/////////////////////////////// **���������** /////////////////////////////////////
		new /datum/data/stalker_equipment("�����",					/obj/item/weapon/gun/projectile/revolver/bm16/sawnoff,		6000, 0),
		new /datum/data/stalker_equipment("��-16",					/obj/item/weapon/gun/projectile/revolver/bm16,				12000, 0),
		new /datum/data/stalker_equipment("���-34", 				/obj/item/weapon/gun/projectile/revolver/bm16/toz34, 		18000, 1000),
		new /datum/data/stalker_equipment("������-13",				/obj/item/weapon/gun/projectile/shotgun/chaser,				25000, 1000),
		new /datum/data/stalker_equipment("����-12", 				/obj/item/weapon/gun/projectile/shotgun/spsa, 				40000, 4000),
		/////////////////////////////// **������** /////////////////////////////////////
		new /datum/data/stalker_equipment("���",					/obj/item/weapon/stalker/knife,								2000, 0)
		)

	var/list/ammo_list = list(
		////////////////////////////////  �������  /////////////////////////////////////////
		new /datum/data/stalker_equipment("������� 9x18",				/obj/item/ammo_box/stalker/b9x18,						3750, 0),
		new /datum/data/stalker_equipment("������� 9x18 �����������",	/obj/item/ammo_box/stalker/b9x18P,						7500, 1000),
		new /datum/data/stalker_equipment("������� 9x19",				/obj/item/ammo_box/stalker/b9x19,						4000, 0),
		new /datum/data/stalker_equipment("������� 9x19 �����������",	/obj/item/ammo_box/stalker/b9x19P,						4000, 1000),
		new /datum/data/stalker_equipment("������� .45 ACP",			/obj/item/ammo_box/stalker/bacp45,						4000, 0),
		new /datum/data/stalker_equipment("������� .45 ACP Hydroshock",	/obj/item/ammo_box/stalker/bacp45ap,					5000, 1000),
		new /datum/data/stalker_equipment("������� ����� 12x70",		/obj/item/ammo_box/stalker/b12x70,						3000, 0),
		new /datum/data/stalker_equipment("������� ����� 12x70 �����������",/obj/item/ammo_box/stalker/b12x70P,					4000, 1000),
		new /datum/data/stalker_equipment("������� ����� 12x70 ������",		/obj/item/ammo_box/stalker/b12x70D,					5000, 1000),
		new /datum/data/stalker_equipment("������� 5.45x39",			/obj/item/ammo_box/stalker/b545,						5750, 0),
		new /datum/data/stalker_equipment("������� 5.45x39 �����������",			/obj/item/ammo_box/stalker/b545ap,			7500, 4000),
		new /datum/data/stalker_equipment("������� 5.56x45",			/obj/item/ammo_box/stalker/b55645,						6000, 0),
		new /datum/data/stalker_equipment("������� 5.56x45 �����������",			/obj/item/ammo_box/stalker/b55645ap,		8000, 4000),
		new /datum/data/stalker_equipment("������� 9x39 ���-9",			/obj/item/ammo_box/stalker/b939,						9000, 4000),
		new /datum/data/stalker_equipment("������� � ���/��1�",		/obj/item/ammo_box/magazine/stalker/m9x18pm,				750, 0),
		new /datum/data/stalker_equipment("������� � ���� 12",		/obj/item/ammo_box/magazine/stalker/m9x18fort,				1000, 0),
		new /datum/data/stalker_equipment("������� � ������",		/obj/item/ammo_box/magazine/stalker/m9x19mp5,				2000, 1000),
		new /datum/data/stalker_equipment("������� � �� 74/2;AK 74/2�;�� 96/2",/obj/item/ammo_box/magazine/stalker/m545,		2250, 1000),
		new /datum/data/stalker_equipment("������� � ��-86 � ���-301",/obj/item/ammo_box/magazine/stalker/m556x45,				2500, 1000),
		new /datum/data/stalker_equipment("������� � �� \"���\"",/obj/item/ammo_box/magazine/stalker/sp9x39val,					3500, 7000),
		new /datum/data/stalker_equipment("������� � �� \"�����\"",/obj/item/ammo_box/magazine/stalker/sp9x39groza,				3500, 7000),
		new /datum/data/stalker_equipment("������� � ���������",/obj/item/ammo_box/magazine/stalker/sp9x39vint,					3000, 7000),
		new /datum/data/stalker_equipment("������� � ����-919 � ���-�",/obj/item/ammo_box/magazine/stalker/sc45,				1400, 0),
		new /datum/data/stalker_equipment("������� � �����"			,/obj/item/ammo_box/magazine/stalker/m9x19marta,			1500, 4000),
		new /datum/data/stalker_equipment("������� � ���-����"		,/obj/item/ammo_box/magazine/stalker/usp45,					1500, 4000),
		)

	var/list/armor_list = list(
		///////////////////////////////  �����  /////////////////////////////////////////

		new /datum/data/stalker_equipment("�������",				/obj/item/clothing/suit/hooded/kozhanka,					5000, 0),
		new /datum/data/stalker_equipment("����&#x44F; �������",	/obj/item/clothing/suit/hooded/kozhanka/white,				5000, 0),
		new	/datum/data/stalker_equipment("���������&#x44F; �������",/obj/item/clothing/suit/hooded/kozhanka/banditka,			5000, 0),
		new	/datum/data/stalker_equipment("��������� ����������",	/obj/item/clothing/suit/army,								15000, 0, "�������"),
		new /datum/data/stalker_equipment("���������� \"���&#x44F;\"",/obj/item/clothing/suit/hooded/kombez,					35000, 1000),
		new /datum/data/stalker_equipment("���������� ��������", 	/obj/item/clothing/suit/hooded/kombez/mercenary,			25000, 1000, "�������"),
		new /datum/data/stalker_equipment("���������� �������",		/obj/item/clothing/suit/hooded/kombez/kombez_bandit,		25000, 1000, "�������"),
		new /datum/data/stalker_equipment("������ ����",			/obj/item/clothing/suit/hooded/kozhanka/banditka/coat,		12500, 0, "�������"),
		new /datum/data/stalker_equipment("���������� ����",		/obj/item/clothing/suit/hooded/kozhanka/banditka/coat/brown,12500, 0),
		new /datum/data/stalker_equipment("������-5�",				/obj/item/clothing/suit/berill,								50000, 1000),
		new /datum/data/stalker_equipment("����� �������",			/obj/item/clothing/suit/hooded/kombez/strazh,				25000, 1000),//, "�������"),
		new /datum/data/stalker_equipment("��-1",					/obj/item/clothing/suit/hooded/kombez/monolit,				25000, 1000, "�������"),
		new /datum/data/stalker_equipment("��5-�",					/obj/item/clothing/suit/hooded/kombez/psz9d,				25000, 1000, "����"),
		new /datum/data/stalker_equipment("����-�9",				/obj/item/clothing/suit/skat,								75000, 4000),
		new	/datum/data/stalker_equipment("���-9��",				/obj/item/clothing/suit/hooded/kombez/psz9md,				75000, 4000, "����"),
		new	/datum/data/stalker_equipment("�C�-99 \"������\"",		/obj/item/clothing/suit/hooded/kombez/ecolog,				75000, 4000),
		new	/datum/data/stalker_equipment("�C�-99� \"������-�\"",		/obj/item/clothing/suit/hooded/kombez/ecologm,			100000, 4000),
		new	/datum/data/stalker_equipment("����",					/obj/item/clothing/suit/hooded/kombez/seva,					150000, 7000),
		new	/datum/data/stalker_equipment("����������",				/obj/item/clothing/suit/hooded/kombez/exoskelet,			150000, 7000),
		)

	var/list/helmet_list = list(
		//////////////////////////// �����, ����� /////////////////////////////////////
		new /datum/data/stalker_equipment("����������",				/obj/item/clothing/mask/gas/stalker,						7500, 0),
		new /datum/data/stalker_equipment("���������� ��������",	/obj/item/clothing/mask/gas/stalker/mercenary,				7500, 1000),
		new /datum/data/stalker_equipment("����������� ����",		/obj/item/clothing/head/hardhat/tacticalhelmet,				20000, 1000),
		new /datum/data/stalker_equipment("����� �12",				/obj/item/clothing/head/spherahelmet,						25000, 4000),
		new /datum/data/stalker_equipment("����-�9 (����)",			/obj/item/clothing/head/skathelmet,							35000, 4000),
		)

	var/list/med_list = list(
		///////////////////////////////  �����������  /////////////////////////////////////////
		new /datum/data/stalker_equipment("�������",				/obj/item/weapon/reagent_containers/pill/stalker/aptechka_r,			1000, 0),
		new /datum/data/stalker_equipment("��������&#x44F; �������",	/obj/item/weapon/reagent_containers/pill/stalker/aptechka_b,		2000, 1000),
		new /datum/data/stalker_equipment("����������&#x44F; �������",	/obj/item/weapon/reagent_containers/pill/stalker/aptechka_y,		4000, 4000),
		new /datum/data/stalker_equipment("����",					/obj/item/stack/medical/gauze/bint,										500, 0),
		//new /datum/data/stalker_equipment("����",					/obj/item/stack/medical/ointment,										500),
		new /datum/data/stalker_equipment("�������. ���������",		/obj/item/weapon/reagent_containers/hypospray/medipen/stalker/antirad,	3000, 0)
		)

	var/list/food_list = list(
		/////////////////////////////////  ���  ///////////////////////////////////////////
		new /datum/data/stalker_equipment("�������",				/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva,				500, 0),
		new /datum/data/stalker_equipment("������",					/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/shproti,		800, 0),
		//new /datum/data/stalker_equipment("�������. ���",			/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/soup,			900),
		//new /datum/data/stalker_equipment("�������. ����",			/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/bobi,			800),
		//new /datum/data/stalker_equipment("�������. ���&#x44F;����",	/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/govyadina2,	900),
		//new /datum/data/stalker_equipment("�������. ����",			/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/fish,			800),
		new /datum/data/stalker_equipment("����� '������'",			/obj/item/weapon/reagent_containers/food/drinks/bottle/vodka/kazaki,			1000, 0),
		new /datum/data/stalker_equipment("��������� NonStop",		/obj/item/weapon/reagent_containers/food/drinks/soda_cans/energetic,			500, 0),
		new /datum/data/stalker_equipment("�������",				/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/snack/snikers,	300, 1000),
		new /datum/data/stalker_equipment("�������",				/obj/item/weapon/reagent_containers/food/snacks/stalker/kolbasa,				400, 0),
		new /datum/data/stalker_equipment("�����",					/obj/item/weapon/reagent_containers/food/snacks/stalker/baton,					300, 0),
		//new /datum/data/stalker_equipment("��������� ���",			/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/snack/sirok,	400)
		)

	var/list/misc_list = list(
		/////////////////////////////////  ������  /////////////////////////////////////////
		new /datum/data/stalker_equipment("���. �������� ��&#x44F; ������������� � ������",/obj/item/device/repair_kit/clothing,				35000, 0),
		new /datum/data/stalker_equipment("���. �������� ��&#x44F; �������������� �����&#x44F;",/obj/item/device/repair_kit/gun,				15000, 0),
		new /datum/data/stalker_equipment("������",							/obj/item/device/instrument/guitar,									2000, 0),
		new /datum/data/stalker_equipment("��������",						/obj/item/device/geiger_counter,									2000, 0),
		//new /datum/data/stalker_equipment("������",							/obj/item/weapon/shovel,										800),
		new /datum/data/stalker_equipment("�������",						/obj/item/device/flashlight/seclite,								1000, 0),
		new /datum/data/stalker_equipment("��&#x44F;� ��&#x44F; ����������",	/obj/item/weapon/storage/belt/stalker,							12000, 0),
		//new /datum/data/stalker_equipment("����&#x44F;",						/obj/item/device/radio,											10000),
		new /datum/data/stalker_equipment("������",							/obj/item/weapon/storage/box/matches,								200, 0),
		new /datum/data/stalker_equipment("��������",						/obj/item/weapon/storage/fancy/cigarettes/cigpack_maxim,			1000, 0),
		new /datum/data/stalker_equipment("������",							/obj/item/weapon/storage/fancy/cigarettes/cigars,					5000, 0),
		)

	var/list/detector_list = list(
		/////////////////////////////////  ���������  ///////////////////////////////////////////
		new /datum/data/stalker_equipment("�������� \"������\"",							/obj/item/device/detector/blink,				4000, 0),
		new /datum/data/stalker_equipment("�������� \"�������\"",							/obj/item/device/detector/bear,					8000, 1000),
		)
	var/list/loot_list = list(
	/////////////////////////////////  ��� � ��������  ///////////////////////////////////////////
		new /datum/data/stalker_equipment("����� �����",								/obj/item/weapon/stalker/loot/dog_tail,				3000, 0, sale_price = 1500),
		new /datum/data/stalker_equipment("������ ����",										/obj/item/weapon/stalker/loot/flesh_eye,	3000, 0, sale_price = 1500),
		new /datum/data/stalker_equipment("������� ���",										/obj/item/weapon/stalker/loot/boar_leg,		6000, 0, sale_price = 3000),

		)

	var/list/artifacts_list = list(
		/////////////////////////////////  ���������  ///////////////////////////////////////////
		new /datum/data/stalker_equipment("������",										/obj/item/weapon/artifact/meduza,					5000, 0, sale_price = 2500),
		new /datum/data/stalker_equipment("�������� ������",							/obj/item/weapon/artifact/stoneflower,				10000, 0, sale_price = 5000),
		new /datum/data/stalker_equipment("������ ������",								/obj/item/weapon/artifact/nightstar,				30000, 0, sale_price = 15000),
		new /datum/data/stalker_equipment("������ ����",								/obj/item/weapon/artifact/maminibusi,				80000, 0, sale_price = 40000),
		new /datum/data/stalker_equipment("�������",									/obj/item/weapon/artifact/flash,					6000, 0, sale_price = 3000),
		new /datum/data/stalker_equipment("������ ����",								/obj/item/weapon/artifact/moonlight,				12000, 0, sale_price = 6000),
		new /datum/data/stalker_equipment("��������",									/obj/item/weapon/artifact/pustishka,				90000, 0, sale_price = 45000),
		new /datum/data/stalker_equipment("���������",									/obj/item/weapon/artifact/battery,					90000, 0, sale_price = 45000),
		new /datum/data/stalker_equipment("����&#x44F;",								/obj/item/weapon/artifact/droplet,					7000, 0, sale_price = 3500),
		new /datum/data/stalker_equipment("�������� ���",								/obj/item/weapon/artifact/fireball,					15000, 0, sale_price = 7500),
		new /datum/data/stalker_equipment("��������",									/obj/item/weapon/artifact/crystal,					100000, 0, sale_price = 50000),
		new /datum/data/stalker_equipment("����� ����&#x44F;",							/obj/item/weapon/artifact/stone_blood,				4000, 0, sale_price = 2000),
		new /datum/data/stalker_equipment("����",										/obj/item/weapon/artifact/soul,						8000, 0, sale_price = 4000),
		new /datum/data/stalker_equipment("������",										/obj/item/weapon/artifact/bubble,					30000, 0, sale_price = 15000),

		)

var/list/sidormatitems = list()

/datum/data/stalker_equipment/
	var/equipment_name = "generic"
	var/equipment_path = null
	var/cost = 0
	var/rating = 0
	var/faction = "��������"
	var/sale_price = 0

/datum/data/stalker_equipment/New(name, path, cost, rating, faction = "��������", sale_price = 0)
	src.equipment_name = name
	src.equipment_path = path
	src.cost = cost
	src.rating = rating
	src.faction = faction
	if(sale_price)
		src.sale_price = sale_price
	else
		src.sale_price = cost/2
	sidormatitems += src

/obj/machinery/stalker/sidormat/New()
	itemloc = locate(x - 1, y, z)
	itemloc2 = locate(x + 1, y, z)

/obj/machinery/stalker/sidormat/attack_hand(mob/user)
	balance = 0
	if(..())
		return
	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		if(istype(H.wear_id, /obj/item/device/stalker_pda))
			var/datum/data/record/sk = find_record("sid", H.sid, data_core.stalkers)
			var/obj/item/device/stalker_pda/KPK = H.wear_id
			if(sk)
				if(KPK.sid == H.sid)
					interact(user)
				else
					say("�������� � �������.")
			else
				say("����������� ������� �� ���.")
		else
			say("�������� ���.")

/obj/machinery/stalker/sidormat/interact(mob/user)
	var/mob/living/carbon/human/H = usr
	if(istype(H.wear_id, /obj/item/device/stalker_pda))
		var/datum/data/record/sk = find_record("sid", H.sid, data_core.stalkers)
		var/obj/item/device/stalker_pda/KPK = H.wear_id
		if(sk)
			if(KPK.sid == H.sid)
				balance = sk.fields["money"]
				rating = text2num(sk.fields["rating"])
			else
				say("�������� � �������.")
		else
			say("����������� ������� �� ���.")
	else
		say("�������� ���.")

	var/dat
	dat +="<div class='statusDisplay'>"
	dat +="<A href='?src=\ref[src];choice=take'><b>����� �����.</b></A><br>"

	dat += "�� �����: [balance] �.<br>"
		//<A href='?src=\ref[src];choice=eject'>������� ������.</A>
	//else
	//	dat += "�� ����� ����������� ������.  <A href='?src=\ref[src];choice=insert'>�������� ������.</A><br>"

	dat += "<br><br>����������: ����� ���������� - �� <b>�����</b> �����." // �������� ������ � ��������� ���� - �� <b>������</b>.
	dat += "</div>"
	dat += "<br><b>������ ���������:</b><BR><table border='0' width='400'>"
	dat += "<tr><td><center><b>������</b></center></td><td></td><td></td></tr>"
	for(var/datum/data/stalker_equipment/prize in weapon_list)
		if(H.faction_s == prize.faction || prize.faction == "��������")
			if(rating >= prize.rating)
				dat += "<tr><td>[prize.equipment_name]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>������</A></td></tr>"

	dat += "<tr><td></td><td></td><td></td></tr><tr><td><center><b>����������</b></center></td><td></td><td></td></tr>"
	for(var/datum/data/stalker_equipment/prize in ammo_list)
		if(H.faction_s == prize.faction || prize.faction == "��������")
			if(rating >= prize.rating)
				dat += "<tr><td>[prize.equipment_name]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>������</A></td></tr>"

	dat += "<tr><td></td><td></td><td></td></tr><tr><td><center><b>������������</b></center></td><td></td><td></td></tr>"
	for(var/datum/data/stalker_equipment/prize in armor_list)
		if(H.faction_s == prize.faction || prize.faction == "��������")
			if(rating >= prize.rating)
				dat += "<tr><td>[prize.equipment_name]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>������</A></td></tr>"

	dat += "<tr><td></td><td></td><td></td></tr><tr><td><center><b>����� � �����������</b></center></td><td></td><td></td></tr>"
	for(var/datum/data/stalker_equipment/prize in helmet_list)
		if(H.faction_s == prize.faction || prize.faction == "��������")
			if(rating >= prize.rating)
				dat += "<tr><td>[prize.equipment_name]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>������</A></td></tr>"

	dat += "<tr><td></td><td></td><td></td></tr><tr><td><center><b>�����������</b></center></td><td></td><td></td></tr>"
	for(var/datum/data/stalker_equipment/prize in med_list)
		if(H.faction_s == prize.faction || prize.faction == "��������")
			if(rating >= prize.rating)
				dat += "<tr><td>[prize.equipment_name]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>������</A></td></tr>"

	dat += "<tr><td></td><td></td><td></td></tr><tr><td><center><b>���</b></center></td><td></td><td></td></tr>"
	for(var/datum/data/stalker_equipment/prize in food_list)
		if(H.faction_s == prize.faction || prize.faction == "��������")
			if(rating >= prize.rating)
				dat += "<tr><td>[prize.equipment_name]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>������</A></td></tr>"

	dat += "<tr><td></td><td></td><td></td></tr><tr><td><center><b>���������</b></center></td><td></td><td></td></tr>"
	for(var/datum/data/stalker_equipment/prize in detector_list)
		if(H.faction_s == prize.faction || prize.faction == "��������")
			if(rating >= prize.rating)
				dat += "<tr><td>[prize.equipment_name]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>������</A></td></tr>"

	dat += "<tr><td></td><td></td><td></td></tr><tr><td><center><b>������</b></center></td><td></td><td></td></tr>"
	for(var/datum/data/stalker_equipment/prize in misc_list)
		if(H.faction_s == prize.faction || prize.faction == "��������")
			if(rating >= prize.rating)
				dat += "<tr><td>[prize.equipment_name]</td><td>[prize.cost]</td><td><A href='?src=\ref[src];purchase=\ref[prize]'>������</A></td></tr>"

	dat += "</table>"

	var/datum/browser/popup = new(user, "miningvendor", "SIDORMAT 3000", 500, 450)
	popup.set_content(dat)
	popup.open()
	return

/obj/machinery/stalker/sidormat/Topic(href, href_list)
	if(..())
		return

	var/mob/living/carbon/human/H = usr
	if(istype(H.wear_id, /obj/item/device/stalker_pda))
		var/datum/data/record/sk = find_record("sid", H.sid, data_core.stalkers)
		var/obj/item/device/stalker_pda/KPK = H.wear_id
		if(sk)
			if(KPK.sid == H.sid)
				if(href_list["choice"])
					if(href_list["choice"] == "take")
						SellItems()

				if(href_list["purchase"])
					var/datum/data/stalker_equipment/prize = locate(href_list["purchase"])
					if (!prize)
						return
					if(prize.cost > balance)
						say("�� ����� ����� ������������ �����.")
					else
						sk.fields["money"] -= prize.cost
						balance = sk.fields["money"]
						new prize.equipment_path(itemloc2)
			else
				say("�������� � �������.")
		else
			say("����������� ������� �� ���.")
	else
		say("�������� ���.")
	updateUsrDialog()
	return

	/*
	if(href_list["choice"])
		if(href_list["choice"] == "take")
			SellItems()
		if(balance)
			if(href_list["choice"] == "eject")
				GiveMoney(balance)
				balance = 0
		else if(href_list["choice"] == "insert")
			var/obj/item/stack/spacecash/I = usr.get_active_hand()
			if(istype(I))
				if(!usr.drop_item())
					return
				balance += (I.worth * I.amount)
				qdel(I)
			else usr << "<span class='danger'>��� ������.</span>"
	if(href_list["purchase"])
		if(balance)
			var/datum/data/stalker_equipment/prize = locate(href_list["purchase"])
			if (!prize)
				return
			if(prize.cost > balance)
				say("�� ����� ����� ������������ �����")
			else
				balance -= prize.cost
				new prize.equipment_path(itemloc2)
	*/

/*
/obj/machinery/stalker/sidormat/attackby(obj/item/I, mob/user, params)
	if(istype(I,/obj/item/stack/spacecash))
		var/obj/item/stack/spacecash/C = usr.get_active_hand()
		if(istype(C))
			if(!usr.drop_item())
				return
//			C.loc = src
			balance += (C.worth * C.amount)
			qdel(C)
			interact(user)
		return
	..()
*/
/obj/machinery/stalker/sidormat/proc/SellItems()
	var/list/ontable = GetItemsOnTable()
	var/total_cost = GetOnTableCost()
//	for(var/I in ontable)
//		qdel(I)
	var/mob/living/carbon/human/H = usr
	if(istype(H.wear_id, /obj/item/device/stalker_pda))
		var/datum/data/record/sk = find_record("sid", H.sid, data_core.stalkers)
		var/obj/item/device/stalker_pda/KPK = H.wear_id
		if(sk)
			if(KPK.sid == H.sid)
				if(total_cost > 100)
					sk.fields["money"] += total_cost
					balance = sk.fields["money"]
					for(var/I in ontable)
						qdel(I)
					say("����� ���� �������.")
				else
					say("����� �� ��� ���� �������.")
			else
				say("�������� � �������.")
		else
			say("����������� ������� �� ���.")
	else
		say("�������� ���.")

/obj/machinery/stalker/sidormat/proc/GetItemsOnTable()
	var/list/ontable = list()
	for(var/atom/movable/AM in itemloc)
		if(GetCost(AM.type) || istype(AM, /obj/item/stack/spacecash))

			if(istype(AM, /obj/item/clothing))
				var/obj/item/clothing/C = AM
				if((C.durability / initial(C.durability)) * 100 < 75)
					//say("������ ������� ������� ��&#255; �������.")
					continue

			ontable.Add(AM)
//	for(var/atom/movable/AM in itemloc2)
//		if(GetCost(AM.type) || istype(AM, /obj/item/stack/spacecash))
//			ontable.Add(AM)
	return ontable

/obj/machinery/stalker/sidormat/proc/GetOnTableCost()
	var/list/ontable = GetItemsOnTable()
	var/total_cost = 0

	for(var/atom/item_on_table in ontable)
		var/obj/item/stack/spacecash/C = item_on_table
		switch(item_on_table.type)
			if(/obj/item/stack/spacecash/c50)
				total_cost += 50 * C.amount
			if(/obj/item/stack/spacecash/c100)
				total_cost += 100 * C.amount
			if(/obj/item/stack/spacecash/c500)
				total_cost += 500 * C.amount
			if(/obj/item/stack/spacecash/c1000)
				total_cost += 1000 * C.amount
			if(/obj/item/stack/spacecash/c5000)
				total_cost += 5000 * C.amount
		var/cost = GetCost(item_on_table.type, 0)
		if(cost)
			total_cost += cost
		else
			ontable.Remove(item_on_table)
	return total_cost

/*
/obj/machinery/stalker/sidormat/proc/GiveMoney(amount)
	var/balance = amount
	var/oldbalance = 0
	while(balance >= 50)
		oldbalance = balance

		var/to_give = RemoveFloat(balance / 5000)
		GiveBills(to_give, 5000)
		var/count = to_give * 5000
		balance -= count

		to_give = RemoveFloat(balance / 1000)
		GiveBills(to_give, 1000)
		count = to_give * 1000
		balance -= count

		to_give = RemoveFloat(balance / 500)
		GiveBills(to_give, 500)
		count = to_give * 500
		balance -= count

		to_give = RemoveFloat(balance / 100)
		GiveBills(to_give, 100)
		count = to_give * 100
		balance -= count

		to_give = RemoveFloat(balance / 50)
		GiveBills(to_give, 50)
		count = to_give * 50
		balance -= count


		if(balance == oldbalance)
			break
*/
/*
/obj/machinery/stalker/sidormat/proc/GiveBills(amount, billtype)
	if(!amount)
		return

	var/obj/item/stack/spacecash/bill = null
	if(billtype == 5000)
		bill = new /obj/item/stack/spacecash/c5000(itemloc2)
	if(billtype == 1000)
		bill = new /obj/item/stack/spacecash/c1000(itemloc2)
	if(billtype == 500)
		bill = new /obj/item/stack/spacecash/c500(itemloc2)
	if(billtype == 100)
		bill = new /obj/item/stack/spacecash/c100(itemloc2)
	if(billtype == 50)
		bill = new /obj/item/stack/spacecash/c50(itemloc2)
	bill.amount = amount
*/
/*
/obj/machinery/stalker/sidormat/proc/GetCost(itemtype, half = 0)
	for(var/sidoritem/I in sidoritems)
		if(I.itemtype == itemtype)
			if(half)
				return I.cost / 2
			return I.cost
	return 0
*/
/obj/machinery/stalker/sidormat/proc/GetCost(itemtype)
	for(var/datum/data/stalker_equipment/se in sidormatitems)
		if(itemtype == se.equipment_path)
			return se.sale_price
	return 0
/*/proc/RemoveFloat(number)
	var/result = round(number)
	if(result > number)
		result--
	return result*/

/*/obj/machinery/stalker/sidormat/proc/RedeemVoucher(obj/item/weapon/mining_voucher/voucher, mob/redeemer)
	var/selection = input(redeemer, "Pick your equipment", "Mining Voucher Redemption") as null|anything in list("Kinetic Accelerator", "Resonator", "Mining Drone", "Advanced Scanner")
	if(!selection || !Adjacent(redeemer) || voucher.gc_destroyed || voucher.loc != redeemer)
		return
	switch(selection)
		if("PM")
			new /obj/item/weapon/gun/projectile/automatic/pistol/pm(src.loc)
	qdel(voucher)*/

/obj/machinery/stalker/sidormat/ex_act(severity, target)
	return