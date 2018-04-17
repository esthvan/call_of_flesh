/obj/item/clothing/head/hardhat/tacticalhelmet
	name = "Tactical helmet"
	desc = "�������� ������� ������������ �����, �������� �����-���� ����������. ������������ ��&#255; ����������&#255; ��������� ������������&#255; ������������ ����������� ����������� ���������� ��� ��������� ��������������� ����������� �������. ���������&#255; ��������� ������������, ����� ������� ������������ ���������� �������, ������������ � �������� ������� ������&#255; ������� ��������&#255;."
	icon_state = "hardhat0_tactical"
	item_state = "hardhat0_tactical"
	item_color = "tactical"
	flags = BLOCKHAIR
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	action_button_name = "Toggle Light"
	armor = list(melee = 50, bullet = 50, laser = 0,energy = 30, bomb = 0, bio = 30, rad = 40)
	brightness_on = 2 //luminosity when on
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	unacidable = 1
	durability = 400

/obj/item/clothing/head/gopcap
	name = "�ap"
	desc = "������ � ������ ������� �����."
	icon_state = "gopcap"
	item_state = "gopcap"
	flags = BLOCKHAIR

/obj/item/clothing/head/soft/jacknoircap
	name = "�ap"
	desc = "����������� ����� ���������. ���-���!"
	icon_state = "jacknoirsoft"
	item_color = "jacknoir"
	item_state = "greysoft"

/obj/item/clothing/head/spherahelmet
	name = "Sphera M12"
	desc = "���������� ������ ����������-��������� ���� � ��������� ��&#255; �������� �������������� � �����������. ������ �������&#255;���&#255; � ��������� � ������������� ������ ��3 ��&#255; ��������. ���������� �����&#255;��� � ���� ��������&#255; ����������� � ����������� ������� ������� ������&#255;, � ����� ������� ������ ������. ������������� ����������� ��������� �����������."
	icon_state = "sphera"
	flags = BLOCKHAIR
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	armor = list(melee = 60, bullet = 65, laser = 0,energy = 35, bomb = 0, bio = 30, rad = 50)
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	unacidable = 1
	durability = 400

/obj/item/clothing/head/skathelmet
	name = "SKAT-M9"
	desc = "���������� ������ ����������-��������� ���� � ��������� ��&#255; �������� �������������� � �����������. ������ �������&#255;���&#255; � ��������� � ������������� ������ ��3 ��&#255; ��������. ���������� �����&#255;��� � ���� ��������&#255; ����������� � ����������� ������� ������� ������&#255;, � ����� ������� ������ ������."
	icon_state = "helmet_skat"
	flags = BLOCKHAIR
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	armor = list(melee = 70, bullet = 75, laser = 60,burn = 70, bomb = 70, bio = 50, rad = 10, electro = 70)
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	unacidable = 1
	durability = 400

/obj/item/clothing/head/beret_ua
	name = "military beret"
	desc = "����������� ����� � ����������� ������� ����������� �����."
	icon_state = "beret_ua"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	strip_delay = 80

/obj/item/clothing/mask/gas/stalker
	name = "gas mask"
	desc = "����������� ����������, ��������������� ��&#255; ���������� �� ������� ������������� ���� � ������&#255;���� �������. ������ �����������&#255; ��� ���������, ��� � ���������� ���� ����������� ����� ����� �������������� �������������. �� ������� ������� �� ����, �������� � ������������ �����������."
	icon_state = "gasmasknew"
	item_state = "gasmasknew"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	flags_cover = MASKCOVERSEYES | MASKCOVERSMOUTH
	flags = BLOCKHAIR
	armor = list(melee = 5, bullet = 0, laser = 30,burn = 30, bomb = 0, bio = 20, rad = 60, electro = 30)
	burn_state = FIRE_PROOF
	unacidable = 1
	durability = 400

/obj/item/clothing/mask/gas/stalker/mercenary
	name = "gas mask"
	desc = "����������� ����������, ��������������� ��&#255; ���������� �� ������� ������������� ���� � ������&#255;���� �������. ������ �����������&#255; ������� ����������� '��������'. �� ������� ������� �� ����, �������� � ������������ �����������."
	icon_state = "mercenary_gasmask"
	item_state = "mercenary_gasmask"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	flags_cover = MASKCOVERSEYES | MASKCOVERSMOUTH
	flags = BLOCKHAIR
	armor = list(melee = 5, bullet = 0, laser = 30,burn = 30, bomb = 0, bio = 20, rad = 60, electro = 30)
	burn_state = FIRE_PROOF
	unacidable = 1
	durability = 400