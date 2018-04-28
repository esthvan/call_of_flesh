/obj/item/clothing/head/steelhelmet
	name = "Steel helmet"
	desc = "Каска из темной, местами ржавой стали, такой ваши деды въебывали по щам нацистам. На ура держит прилетевшую по касательной пулю, но от хорошенького ножевого удара под козырек не спасет."
	icon_state = "steelhelmet"
	item_state = "steelhelmet"
	armor = list(melee = 25, bullet = 40, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	unacidable = 1
	durability = 50

/obj/item/clothing/head/hardhat/tacticalhelmet
	name = "Tactical helmet"
	desc = "Западный образец тактического шлема, лишённый какой-либо маркировки. Предназначен дл&#255; обеспечени&#255; командира подразделени&#255; максимальным количеством тактической информации при установке соответствующей электронной начинки. Отличаетс&#255; усиленной конструкцией, также оснащён многослойной кевларовой защитой, респиратором и прибором ночного видень&#255; первого поколени&#255;."
	icon_state = "hardhat0_tactical"
	item_state = "hardhat0_tactical"
	item_color = "tactical"
	flags = BLOCKHAIR
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	action_button_name = "Toggle Light"
	armor = list(melee = 50, bullet = 50, laser = 0,energy = 30, bomb = 0, bio = 30, rad = 20)
	brightness_on = 2 //luminosity when on
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	unacidable = 1
	durability = 400

/obj/item/clothing/head/gopcap
	name = "Сap"
	desc = "Модная у чётких пацанов кепка."
	icon_state = "gopcap"
	item_state = "gopcap"
	flags = BLOCKHAIR

/obj/item/clothing/head/soft/jacknoircap
	name = "Сap"
	desc = "Потрепанная кепка машиниста. Чух-чух!"
	icon_state = "jacknoirsoft"
	item_color = "jacknoir"
	item_state = "greysoft"

/obj/item/clothing/head/spherahelmet
	name = "Sphera M12"
	desc = "Отделанный тканью алюминиево-титановый шлем с карманами дл&#255; стальных бронеэлементов и бронемаской. Обычно поставл&#255;етс&#255; в комплекте с бронежилетами класса ПС3 дл&#255; спецназа. Достаточно попул&#255;рен в Зоне благодар&#255; респиратору и встроенному прибору ночного видени&#255;, а также хорошей защите головы. Предусмотрена возможность установки электроники."
	icon_state = "sphera"
	flags = BLOCKHAIR
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	armor = list(melee = 60, bullet = 65, laser = 0,energy = 35, bomb = 0, bio = 30, rad = 30)
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	unacidable = 1
	durability = 400

/obj/item/clothing/head/skathelmet
	name = "SKAT-M9"
	desc = "Отделанный тканью алюминиево-титановый шлем с карманами дл&#255; стальных бронеэлементов и бронемаской. Обычно поставл&#255;етс&#255; в комплекте с бронежилетами класса ПС3 дл&#255; спецназа. Достаточно попул&#255;рен в Зоне благодар&#255; респиратору и встроенному прибору ночного видени&#255;, а также хорошей защите головы."
	icon_state = "helmet_skat"
	flags = BLOCKHAIR
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	armor = list(melee = 75, bullet = 75, laser = 60,burn = 70, bomb = 70, bio = 50, rad = 40, electro = 70)
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	unacidable = 1
	durability = 400

/obj/item/clothing/head/beret_ua
	name = "military beret"
	desc = "Оффицерский берет с миниатюрной версией украинского флага."
	icon_state = "beret_ua"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	strip_delay = 80

/obj/item/clothing/mask/gas/stalker
	name = "gas mask"
	desc = "Стандартный противогаз, предназначенный дл&#255; фильтрации из воздуха радиоактивной пыли и отравл&#255;ющих веществ. Широко используетс&#255; как новичками, так и ветеранами всех группировок ввиду своей функциональной незаменимости. Не оснащён защитой от пуль, осколков и механических воздействий."
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
	desc = "Стандартный противогаз, предназначенный дл&#255; фильтрации из воздуха радиоактивной пыли и отравл&#255;ющих веществ. Широко используетс&#255; членами группировки 'Наемники'. Не оснащён защитой от пуль, осколков и механических воздействий."
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