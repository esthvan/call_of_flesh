var/global/list/obj/item/device/stalker_pda/KPKs = list()
var/global/lentahtml = ""

/obj/item/device/stalker_pda
	name = "KPK"
	desc = "A portable device, used to communicate with other stalkers."
	icon = 'icons/stalker/device_new.dmi'
	icon_state = "kpk_off"
	item_state = "electronic"
	w_class = 1

	var/mode = 1
	var/show_title = 0
	var/mainhtml = ""
	var/ratinghtml =""
	var/list/access = list()

	//ПРОФИЛЬ
	var/owner = null
	var/registered_name = null
	var/sid = null
	var/rotation = "front"
	var/faction_s = "Одиночки"
	var/rating = 0
	var/reputation = 0
	var/money = 0
	var/obj/item/weapon/photo/photo_owner_front = new()
	var/obj/item/weapon/photo/photo_owner_west = new()
	var/obj/item/weapon/photo/photo_owner_back = new()
	var/obj/item/weapon/photo/photo_owner_east = new()
	var/password = null
	var/hacked = 0
	var/activated = 0
	var/rep_color_s = "#ffe100"
	var/rep_name_s = "Нейтральна&#x44F;"
	var/eng_rep_name_s = "Neutral"
	var/rank_name_s = "Новичок"
	var/eng_rank_name_s = "Rookie"
	var/eng_faction_s = "Loners"
	//var/isregistered = 0

	//ЛЕНТА
	var/lenta_sound = 1
	var/last_lenta = 0
	var/lenta_id = 0
	var/msg_name = "message"
	var/max_length = 10
	slot_flags = SLOT_ID

	//РЕЙТИНГ
	var/sortBy = "rating"
	var/order = 1
	var/lastlogin = 0

/datum/asset/simple/kpk
	assets = list(
		"kpk_background.png"	= 'icons/stalker/kpk.png',
		"nodata.png"			= 'icons/stalker/nodata.png',
		"photo_0"				= 'icons/stalker/sidor.png'
	)


/obj/item/device/stalker_pda/New()
	..()
	return

/obj/item/device/stalker_pda/MouseDrop(atom/over_object)
	if(iscarbon(usr) || isdrone(usr)) //all the check for item manipulation are in other places, you can safely open any storages as anything and its not buggy, i checked
		var/mob/M = usr

		if(!M.restrained() && !M.stat)
			if(loc != usr || (loc && loc.loc == usr))
				return

			if(over_object)
				switch(over_object.name)
					if("r_hand")
						if(!M.unEquip(src))
							return
						M.put_in_r_hand(src)
					if("l_hand")
						if(!M.unEquip(src))
							return
						M.put_in_l_hand(src)
				add_fingerprint(usr)

/obj/item/device/stalker_pda/attack_hand(mob/living/user)
	if(src.loc == user)
		attack_self(user)
		user.set_machine(src)
	else
		..()

/obj/item/device/stalker_pda/attack_self(mob/user)
	for(var/datum/data/record/sk in data_core.stalkers)
		var/mob/living/carbon/human/H = user
		if(H.sid == sk.fields["sid"])
			set_owner_info(sk)
			sk.fields["lastlogin"] = world.time

	icon_state = "kpk_on"
	var/datum/asset/assets = get_asset_datum(/datum/asset/simple/kpk)
	assets.send(user)

	user.set_machine(src)
	mainhtml ="<html> \
	\
	<style>\
	a:link {color: #607D8B;}\
	a:visited {color: #607D8B;}\
	a:active {color: #607D8B;}\
	a:hover {background-color: #9E9E9E;}\
	a {text-decoration: none;}\
	body {\
	background-image: url('kpk_background.png');\
	padding-top: 18px;\
	padding-left: 35px;\
	}\
	table {\
	    background: #131416;\
	    padding: 15px;\
	    margin-bottom: 10px;\
	    color: #afb2a1;\
	}\
	\
	#table-bottom1 {\
		background: #2e2e38;\
		padding-top: 5px;\
		padding-bottom: 5px;\
	}\
	#table-center1 {\
   	position: relative;\
    background: #2e2e38;\
	padding-top: 5px;\
    padding-bottom: 5px;\
    bottom: 100px;\
	}\
	#table-center2 {\
   	position: relative;\
    background: #2e2e38;\
    bottom: 0px;\
	}\
	#table-lenta {\
	background: #9E9E9E;\
	}\
	div.relative {\
    position: relative;\
    width: 250px;\
    height: 200px;\
    top: 70px;\
    }\
    \
    #lenta {\
    background: #2e2e38;\
    color: white;\
    padding: 5px;\
    width: 449px;\
    height: 190px;\
    overflow: auto;\
    border: 1px solid #ccc;\
    word-wrap: break-word;\
	}\
	p.lentamsg {\
	margin: 0px;\
	word-wrap: break-word;\
    }\
	#navbar {\
	overflow: hidden;\
	background-color: #099;\
	position: fixed;\
	top: 0;\
	width: 100%;\
	padding-top: 3px;\
	padding-bottom: 3px;\
	padding-left: 20px;\
	}\
	#navbar a {\
	float: left;\
	display: block;\
	color: #666;\
	text-align: center;\
	padding-right: 20px;\
	text-decoration: none;\
	font-size: 17px;\
	}\
	#navbar a:hover {\
	background-color: #ddd;\
	color: black;\
	}\
	#navbar a.active {\
	background-color: #4CAF50;\
	color: white;\
	}\
	#ratingimg {\
    vertical-align:middle;\
	}\
	.main {\
	}\
	.main img {\
	height: auto;\
	}\
	.button {\
	  width: 300px;\
	  height: 60px;\
	}\
	</style>"
	if (!owner || !password)
		mainhtml +="<body>\
		<table border=0 height=\"314\" width=\"455\">\
		<tr>\
		<td valign=\"top\" align=\"center\">\
	    <div align=\"right\"><a href='byond://?src=\ref[src];choice=title'>\[-\]</a> <a href='byond://?src=\ref[src];choice=close'>\[X\]</a></div><br>\
	    <div class=\"relative\" align=\"center\">"


		if(user.client && (user.client.prefs.chat_toggles & CHAT_LANGUAGE))
			mainhtml += "ENTER THE PASSWORD"
		else
			mainhtml += "ВВЕДИТЕ ПАРОЛЬ"

		mainhtml +="\
	    </div>\
		</td>\
		</tr>\
		<tr>\
		<td colspan=\"2\" align=\"center\" id=\"table-center1\" height=60>\
				| <a style=\"color:#c10000;\" href='byond://?src=\ref[src];choice=password_input'>_______________</a> |<br>\
		<div align=\"center\"></div>\
		</td>\
		</tr>"
	else

		if (user != owner && hacked == 0)
			mainhtml +="<body>\
			\
			<table border=0 height=\"314\" width=\"455\">\
			<tr>\
			<td align=\"left\" width=200>\
			<div style=\"overflow: hidden; height: 200px; width: 180px;\" ><img height=80 width=80 border=4 src=photo_front><img height=80 width=80 border=4 background src=photo_side></div>\
			</td>\
			<td valign=\"top\" align=\"left\">\
			 <div align=\"right\"><a href='byond://?src=\ref[src];choice=title'>\[-\]</a> <a href='byond://?src=\ref[src];choice=close'>\[X\]</a></div><br>"

			if(user.client && (user.client.prefs.chat_toggles & CHAT_LANGUAGE))
				mainhtml +="\
				 <b>Name:</b> [registered_name]<br><br>\
				 <b>Faction:</b> [eng_faction_s]<br><br>\
				 <b>Rank:</b> [rating]<br><br>\
				 <b>Reputation:</b> <font color=\"[rep_color_s]\">[eng_rep_name_s]</font>"
			else
				mainhtml +="\
				 <b>Им&#x44F;:</b> [registered_name]<br><br>\
				 <b>Группировка:</b> [faction_s]<br><br>\
				 <b>Ранг:</b> [rating]<br><br>\
				 <b>Репутаци&#x44F;:</b> <font color=\"[rep_color_s]\">[rep_name_s]</font>"


			 mainhtml +="\
			 \
			</td>\
			</tr>\
			\
			<tr>\
			<td colspan=\"2\" align=\"center\" id=\"table-bottom1\" height=60>\
				| <a style=\"color:#c10000;\" href='byond://?src=\ref[src];choice=password_check'>В ДОСТУПЕ ОТКАЗАНО - ВВЕДИТЕ ПАРОЛЬ</a> |<br>\
			<div align=\"center\"></div>\
			</td>\
			</tr>"
		else
			switch(mode)

		//ПРОФИЛЬ

				if(1)
					mainhtml +="\
					<body>\
					\
					<table border=0 height=\"314\" width=\"455\">\
					<tr>\
					<td valign=\"top\" align=\"left\">"
					if(user.client && (user.client.prefs.chat_toggles & CHAT_LANGUAGE))
						mainhtml +="\
						<div align=\"right\"><a style=\"color:#c10000;\" align=\"center\" href='byond://?src=\ref[src];choice=exit'>\[EXIT\]</a><a href='byond://?src=\ref[src];choice=title'>\[-\]</a> <a href='byond://?src=\ref[src];choice=close'>\[X\]</a></div>\
						<div align = \"center\" > | <a href='byond://?src=\ref[src];choice=rotate'>Rotate photo</a> | <a href='byond://?src=\ref[src];choice=make_avatar'>Change profile photo</a> | </div>"
					else
						mainhtml +="\
						<div align=\"right\"><a style=\"color:#c10000;\" align=\"center\" href='byond://?src=\ref[src];choice=exit'>\[ВЫХОД\]</a><a href='byond://?src=\ref[src];choice=title'>\[-\]</a> <a href='byond://?src=\ref[src];choice=close'>\[X\]</a></div>\
						<div align = \"center\" > | <a href='byond://?src=\ref[src];choice=rotate'>Повернуть фото профил&#x44F;</a> | <a href='byond://?src=\ref[src];choice=make_avatar'>Сменить фото профил&#x44F;</a> | </div>"

					mainhtml +="\
					</td>\
					</tr>\
					<tr valign=\"top\">\
	                <td>\
                    \
					<table>\
                    \
	                <tr>\
                    <td style=\"text-align: center;\" valign=\"top\" align=\"left\" width=90 height=90>\
					<img style=\"margin-left: auto; margin-right: auto;\" height=80 width=80 border=4 src=photo_[rotation]>\
					<br>\
                    </td>\
                    <td>"
					if(user.client && (user.client.prefs.chat_toggles & CHAT_LANGUAGE))
						mainhtml+="\
                     <b>Name:</b> [registered_name]<br>\
                     <b>Faction:</b> [eng_faction_s]<br>\
                     <b>Rank:</b> [eng_rank_name_s] ([rating])<br>\
                     <b>Reputation:</b> <font color=\"[rep_color_s]\">[eng_rep_name_s] ([reputation])</font><br>\
                     <b>Money:</b> [money] RU<br>"

					else
						mainhtml+="\
                     <b>Им&#x44F;:</b> [registered_name]<br>\
                     <b>Группировка:</b> [faction_s]<br>\
                     <b>Ранг:</b> [rank_name_s] ([rating])<br>\
                     <b>Репутаци&#x44F;:</b> <font color=\"[rep_color_s]\">[rep_name_s] ([reputation])</font><br>\
                     <b>Деньги на счету:</b> [money] RU<br>"

					mainhtml +="\
                    </td>\
                    </tr>\
                    \
                    </table>\
                    \
                    \
                    </td>\
                    </tr>"

		//ТРАНЗАКЦИИ

				if(2)
					mainhtml +="\
					<body>\
					\
					<table border=0 height=\"314\" width=\"455\">\
					<tr>\
					<td align=\"left\" width=200>\
					\
					</td>\
					</tr>"

		//РЕЙТИНГ

				if(3)
					mainhtml +="\
					<body>\
					\
					<table border=0 height=\"314\" width=\"455\">\
					<tr>\
					<td valign=\"top\" align=\"left\">\
					<div align=\"right\"><a href='byond://?src=\ref[src];choice=title'>\[-\]</a> <a href='byond://?src=\ref[src];choice=close'>\[X\]</a></div>"
					if(user.client.prefs.chat_toggles & CHAT_LANGUAGE)
						mainhtml +="\
						<div align = \"center\" > | <a href='byond://?src=\ref[src];choice=refresh_rating'>Обновить список сталкеров</a> | </div>"
					else
						mainhtml +="\
						<div align = \"center\" > | <a href='byond://?src=\ref[src];choice=refresh_rating'>Обновить список сталкеров</a> | </div>"
					mainhtml +="\
					</td>\
					</tr>\
					<tr valign=\"top\">\
	                <td>\
					<div id= \"lenta\">\
					[ratinghtml]\
	             	</div>\
	                \
	                </td>\
					</tr>"

		//ЛЕНТА

				if(4)
					mainhtml +="\
					<body>\
					\
					<table border=0 height=\"314\" width=\"455\">\
					<tr>\
					<td valign=\"top\" align=\"left\">\
					<div align=\"right\"><a href='byond://?src=\ref[src];choice=title'>\[-\]</a> <a href='byond://?src=\ref[src];choice=close'>\[X\]</a></div>"
					if(user.client.prefs.chat_toggles & CHAT_LANGUAGE)
						mainhtml +="\
						<div align = \"center\" > | <a href='byond://?src=\ref[src];choice=lenta_add'>Send feed message</a> | <a href='byond://?src=\ref[src];choice=lenta_sound'>Turn on/off feed sound</a> |</div>"
					else
						mainhtml +="\
						<div align = \"center\" > | <a href='byond://?src=\ref[src];choice=lenta_add'>Написать в ленту</a> | <a href='byond://?src=\ref[src];choice=lenta_sound'>Вкл/Выкл звуковой сигнал</a> |</div>"
					mainhtml +="\
					</td>\
					</tr>\
					<tr style=\"border: 0px;\" valign=\"top\">\
	                <td style=\"border: 0px;\">\
					<div id=\"lenta\">"
					mainhtml +="[lentahtml]\
					</div>\
					</td>\
					</tr>"

		//КАРТА
				if(5)
					mainhtml +="\
					<body>\
					\
					<table border=0 height=\"314\" width=\"455\">\
					<tr>\
					<td valign=\"top\" align=\"left\">\
					<div align=\"right\">\
					<a href='byond://?src=\ref[src];choice=title'>\[-\]</a> <a href='byond://?src=\ref[src];choice=close'>\[X\]</a></div>\
					<div align = \"center\">\
					| <a href='byond://?src=\ref[src];choice=zoom' onclick=\"zoomin()\"> Zoom In</a> | \
					<a href='byond://?src=\ref[src];choice=zoom' onclick=\"zoomout()\"> Zoom Out</a> | \
					</div>\
					</td>\
					</tr>\
					<tr valign=\"top\">\
	                <td>\
					<div id=\"lenta\">\
					<div class=\"main\">"
					if(user.z != 1)
						mainhtml += "<img id=\"map\" height=415 width=415 src=minimap_[user.z].png>"
					else
						mainhtml += "<img id=\"map\" height=415 width=415 src=nodata.png>"
					mainhtml +="\
					</div>\
					</div>\
					</td>\
					</tr>"


			if(user.client.prefs.chat_toggles & CHAT_LANGUAGE)
				mainhtml +="\
				<tr>\
				<td colspan=\"1\" align=\"center\" id=\"table-bottom1\" height=60>\
					| <a href='byond://?src=\ref[src];choice=1'>Profile</a> | <a href='byond://?src=\ref[src];choice=2'>Enciclopedie</a> | <a href='byond://?src=\ref[src];choice=3'>Rating</a> | <a href='byond://?src=\ref[src];choice=4'>Feed</a> | <a href='byond://?src=\ref[src];choice=5'>Map</a> |<br>\
				<div align=\"center\"></div>\
				</td>\
				</tr>"
			else
				mainhtml +="\
				<tr>\
				<td colspan=\"1\" align=\"center\" id=\"table-bottom1\" height=60>\
					| <a href='byond://?src=\ref[src];choice=1'>Профиль</a> | <a href='byond://?src=\ref[src];choice=2'>Энциклопеди&#x44F;</a> | <a href='byond://?src=\ref[src];choice=3'>Рейтинг</a> | <a href='byond://?src=\ref[src];choice=4'>Лента</a> | <a href='byond://?src=\ref[src];choice=5'>Карта</a> |<br>\
				<div align=\"center\"></div>\
				</td>\
				</tr>"

	mainhtml +="\
	</table>\
	<script>\
	function zoomin(){\
	    var myImg = document.getElementById(\"map\");\
	    var currWidth = myImg.clientWidth;\
	    if(currWidth >= 1015) return false;\
	     else{\
	        myImg.style.width = (currWidth + 200) + \"px\";\
	    } \
	}\
	function zoomout(){\
	    var myImg = document.getElementById(\"map\");\
	    var currWidth = myImg.clientWidth;\
	    if(currWidth <= 415) return false;\
		 else{\
	        myImg.style.width = (currWidth - 200) + \"px\";\
	    }\
	}\
	</script>\
	</body>\
	\
	</html>"
	if(show_title)
		user << browse(mainhtml, "window=mainhtml;size=568x388;border=0;can_resize=0;can_close=0;can_minimize=0;titlebar=1")
	else
		user << browse(mainhtml, "window=mainhtml;size=568x388;border=0;can_resize=0;can_close=0;can_minimize=0;titlebar=0")

/obj/item/device/stalker_pda/Topic(href, href_list)
	..()

	//var/mob/living/U = usr
	var/mob/living/carbon/human/H = usr
	var/isregistered = 0
	if(usr.canUseTopic(src))
		add_fingerprint(H)
		H.set_machine(src)
		switch(href_list["choice"])
			if("title")
				if(show_title)
					H << browse(mainhtml, "window=mainhtml;size=568x388;border=0;can_resize=0;can_close=0;can_minimize=0;titlebar=0")
					show_title = 0
				else
					H << browse(mainhtml, "window=mainhtml;size=568x388;border=0;can_resize=0;can_close=0;can_minimize=0;titlebar=1")
					show_title = 1

			if("close")
				icon_state = "kpk_off"
				H.unset_machine()
				hacked = 0
				H << browse(null, "window=mainhtml")
				return

			if("password_input")
				var/t = message_input(H, "password", 10)

				if(t)
					for(var/datum/data/record/sk in data_core.stalkers)
						if(sk.fields["sid"] == H.sid)
							isregistered = 1
					if(!isregistered)
						password = t
						var/pass = password

						data_core.manifest_inject(H, pass)

						var/datum/job/J = SSjob.GetJob(H.job)
						access = J.get_access()

						registered_name = H.real_name
						owner = H
						sid = H.sid
						activated = 1

						var/image = get_id_photo(H)
						var/obj/item/weapon/photo/owner_photo_front = new()
						var/obj/item/weapon/photo/owner_photo_west = new()
						var/obj/item/weapon/photo/owner_photo_east = new()
						var/obj/item/weapon/photo/owner_photo_back = new()

						owner_photo_front.photocreate(null, icon(image, dir = SOUTH))
						owner_photo_west.photocreate(null, icon(image, dir = WEST))
						owner_photo_east.photocreate(null, icon(image, dir = EAST))
						owner_photo_back.photocreate(null, icon(image, dir = NORTH))

						H << "<B>Пароль к КПК</B>: <span class='danger'>\"[pass]\"</span>"
						H.mind.store_memory("<b>Пароль к КПК</b>: \"[pass]\"")
						KPKs += src
						KPK_mobs += H

						for(var/datum/data/record/sk in data_core.stalkers)
							if(H.sid == sk.fields["sid"])
								set_owner_info(sk)
					else
						for(var/datum/data/record/sk in data_core.stalkers)
							if(sk.fields["sid"] == H.sid)
								if(sk.fields["pass"] == t)
									password = t
									var/datum/job/J = SSjob.GetJob(H.job)
									access = J.get_access()

									registered_name = H.real_name
									faction_s = sk.fields["faction"]
									rating = sk.fields["rating"]
									owner = H
									sid = H.sid
									activated = 1

									var/image = get_id_photo(H)
									var/obj/item/weapon/photo/owner_photo_front = new()
									var/obj/item/weapon/photo/owner_photo_west = new()
									var/obj/item/weapon/photo/owner_photo_east = new()
									var/obj/item/weapon/photo/owner_photo_back = new()

									owner_photo_front.photocreate(null, icon(image, dir = SOUTH))
									owner_photo_west.photocreate(null, icon(image, dir = WEST))
									owner_photo_east.photocreate(null, icon(image, dir = EAST))
									owner_photo_back.photocreate(null, icon(image, dir = NORTH))

									KPKs += src

									set_owner_info(sk)
								else
									H << "<span class='warning'>Неверный пароль.</span>"
				else
					H << "<span class='warning'>Ваш пароль не подходит. Введите пароль еще раз.</span>"

			if("exit")
				registered_name = null
				faction_s = null
				rating = null
				owner = null
				money = 0
				photo_owner_front = null
				photo_owner_west = null
				photo_owner_east = null
				photo_owner_back = null
				KPKs -= src
				hacked = 0
				password = null
				activated = 0

			if("password_check")
				var/t = message_input(H, "password", 10)
				if(t == password)
					//hacked = 1
					hacked = 0
					H << "<span class='warning'>Вы не владелец КПК.</span>"
				else
					H << "<span class='warning'>Неверный пароль.</span>"

			if("rotate")
				switch(rotation)
					if ("front")
						rotation = "west"
					if("west")
						rotation = "back"
					if("back")
						rotation = "east"
					if("east")
						rotation = "front"

			if("make_avatar")
				make_avatar(H)
				for(var/datum/data/record/sk in data_core.stalkers)
					if(H.sid == sk.fields["sid"])
						set_owner_info(sk)

			if("lenta_add")
				//if(money>=0 && lenta_cooldown == 0)
				var/t = message_input(H, "message", 250)
				if(!t)
					H << "<span class='warning'>Введите сообщение.</span>"
				else
					if ( !(last_lenta && world.time < last_lenta + 450) )
						last_lenta = world.time

						add_lenta_message(src, sid, registered_name, faction_s, t)

					else
						var/lefttime = round((450 + last_lenta - world.time)/10)
						var/ending = ""
						switch (lefttime % 10)
							if(2 to 4)
								ending = "ы"
							if(1)
								ending = "у"
						H << "<span class='warning'>Вы сможете отправить следующее сообщение через [round((450 + last_lenta - world.time)/10)] секунд[ending].</span>"

			if("lenta_sound")
				lenta_sound = !lenta_sound
				if(lenta_sound)
					H << "<span class='notice'>Звук оповещени&#255; о сообщени&#255;х в ленте включен.</span>"
				else
					H << "<span class='notice'>Звук оповещени&#255; о сообщени&#255;х в ленте выключен.</span>"

			if("refresh_rating")
				ratinghtml = ""
				if(!isnull(data_core.stalkers))
					refresh_rating(H)

			if("zoom")
				return

			if("1")			//ПРОФИЛЬ
				for(var/datum/data/record/sk in data_core.stalkers)
					if(H.sid == sk.fields["sid"])
						set_owner_info(sk)

				mode = 1

			if("2")			//ЭНЦИКЛОПЕДИЯ
				mode = 2

			if("3")			//РЕЙТИНГ
				if(!isnull(data_core.stalkers))
					refresh_rating(H)
				mode = 3

			if("4")			//ЛЕНТА
				for(var/datum/data/record/R in data_core.stalkers)
					if(R.fields["lastlogin"] + 18000 <= world.time)
						var/sid_p = R.fields["sid"]
						var/obj/item/weapon/photo/P1 = R.fields["photo_front"]
						H << browse_rsc(P1.img, "photo_[sid_p]")
				mode = 4

			if("5")			//КАРТА
				SSminimap.sendMinimaps(H)
				mode = 5

		usr.set_machine(src)
		updateSelfDialog()
		return
	else
		hacked = 0
		H.unset_machine()
		H << browse(null, "window=mainhtml")

/obj/item/device/stalker_pda/proc/message_input(mob/living/U = usr, msg_name, max_length)
	var/t = sanitize_russian(stripped_input(U, "Please enter the [msg_name]", name, null, max_length), 1)
	if (!t)
		return
	if (!in_range(src, U) && loc != U)
		return
	if(!U.canUseTopic(src))
		return
	return t

/proc/add_lenta_message(var/obj/item/device/stalker_pda/KPK_owner, var/sid_owner, var/name_owner, var/faction_owner, msg, selfsound = 0)

	for(var/obj/item/device/stalker_pda/KPK in KPKs)
		show_lenta_message(KPK_owner, KPK, sid_owner, name_owner, faction_owner, msg)

	var/factioncolor 	= get_faction_color(faction_owner)
	var/eng_faction_s 	= get_eng_faction(faction_owner)

	lentahtml = "<table  style=\"margin-top: 0px; margin-bottom: 5px; border: 0px; background: #2e2e38;\">\
	<tr style=\"border: 0px solid black;\">\
    <td style=\"border: 0px solid black; vertical-align: top; background: #2e2e38;\" width=32 height=32>\
	<img id=\"ratingbox\" style=\"background: #2e2e38; border: 1px solid black;\" height=32 width=32 src=photo_[sid_owner]>\
    </td>\
    \
    <td width=386 height=32 align=\"top\" style=\"background: #131416; border: 0px; text-align:left; vertical-align: top;\">\
	\
	<p class=\"lentamsg\"><b><font color = \"[factioncolor]\">[name_owner]\[[faction_owner]\]</font></b>:<br><font color = \"#afb2a1\">[msg]</font></p>\
    \
    </td>\
    \
    </tr>\
    </table>" + lentahtml

/proc/show_lenta_message(var/obj/item/device/stalker_pda/KPK_owner, var/obj/item/device/stalker_pda/KPK, var/sid_owner, var/name_owner, var/faction_owner, msg, selfsound = 0)

	var/mob/living/carbon/C = null

	if(KPK.loc && isliving(KPK.loc))
		C = KPK.loc
	if(C && C.stat != UNCONSCIOUS)

		var/factioncolor	= get_faction_color(faction_owner)
		var/eng_faction_s 	= get_eng_faction(faction_owner)

		C << russian_html2text("<p>\icon[KPK]<b><font color=\"[factioncolor]\">[name_owner]\[[faction_owner]\]:</font></b><br><font color=\"#006699\"> \"[msg]\"</font></p>")
		if(KPK_owner)
			if((KPK != KPK_owner || selfsound) && KPK.lenta_sound == 1)
				C << sound('sound/stalker/pda/sms.ogg', volume = 30)
		else
			if(KPK.lenta_sound)
				C << sound('sound/stalker/pda/sms.ogg', volume = 30)

/obj/item/device/stalker_pda/proc/refresh_rating(var/mob/living/carbon/human/H)
	var/count = 0
	ratinghtml = ""

	for(var/datum/data/record/R in sortRecordNum(data_core.stalkers, "rating", -1))
		var/obj/item/weapon/photo/P1 = R.fields["photo_front"]
		var/sid_p = R.fields["sid"]
		H << browse_rsc(P1.img, "photo_[sid_p]")
		var/n = R.fields["name"]
		var/r = R.fields["rating"]

		var/f = R.fields["faction_s"]
		var/eng_f = get_eng_faction(f)

		var/rep_color = get_rep_color(R.fields["reputation"])
		var/rep = get_rep_name(R.fields["reputation"])
		var/eng_rep = get_eng_rep_name(R.fields["reputation"])

		var/rank_name = get_rank_name(r)
		var/eng_rank_name = get_eng_rank_name(r)

		count++

		if(R.fields["lastlogin"] + 12000 >= world.time)
			if(usr.client.prefs.chat_toggles & CHAT_LANGUAGE)
				ratinghtml += "<table style=\"margin-top: 0px; margin-bottom: 5px;\">\
						<tr style=\"border: 1px solid black;\">\
		                \
		                <td width=64 height=64 align=\"top\">\
						<img id=\"ratingbox\" height=64 width=64 src=photo_[sid_p]>\
		                </td>\
		                \
		                <td height=64 width=354 align=\"top\" style=\"text-align:left;vertical-align: top;\">\
		         		\
		                <b>\[[count]\]</b> [n] ([eng_f])<br>\
						<b>Rating</b> [eng_rank_name] ([r])<br>\
		                <b>Reputation:</b> <font color=\"[rep_color]\">[eng_rep]</font><br>\
		                \
		                </td>\
		                \
		                </tr>\
		                </table>"
			else
				ratinghtml += "<table style=\"margin-top: 0px; margin-bottom: 5px;\">\
						<tr style=\"border: 1px solid black;\">\
		                \
		                <td width=64 height=64 align=\"top\">\
						<img id=\"ratingbox\" height=64 width=64 src=photo_[sid_p]>\
		                </td>\
		                \
		                <td height=64 width=354 align=\"top\" style=\"text-align:left;vertical-align: top;\">\
		         		\
		                <b>\[[count]\]</b> [n] ([f])<br>\
						<b>Рейтинг:</b> [rank_name] ([r])<br>\
		                <b>Репутация:</b> <font color=\"[rep_color]\">[rep]</font><br>\
		                \
		                </td>\
		                \
		                </tr>\
		                </table>"

	return ratinghtml

/obj/item/device/stalker_pda/proc/make_avatar(var/mob/living/carbon/human/H)
	var/datum/outfit/avatar = new /datum/outfit

	if(H.w_uniform)
		avatar.uniform 		= H.w_uniform.type
	if(H.wear_suit)
		avatar.suit 		= H.wear_suit.type
	if(H.back)
		avatar.back			= H.back.type
	if(H.belt)
		avatar.belt 		= H.belt.type
	if(H.gloves)
		avatar.gloves		= H.gloves.type
	if(H.shoes)
		avatar.shoes		= H.shoes.type
	if(H.head)
		avatar.head			= H.head.type
	if(H.wear_mask)
		avatar.mask			= H.wear_mask.type
	if(H.glasses)
		avatar.glasses		= H.glasses.type
	if(H.s_store)
		avatar.suit_store	= H.s_store.type
	if(H.r_hand && !istype(H.r_hand ,/obj/item/device/stalker_pda))
		avatar.r_hand		= H.r_hand.type
	if(H.l_hand && !istype(H.l_hand ,/obj/item/device/stalker_pda))
		avatar.l_hand		= H.l_hand.type

	if(avatar.uniform == null || avatar.shoes == null)
		H << "<span class='warning'>Вам нужно надеть свитер и ботинки перед тем, как делать фотографию!</span>"
	else
		var/image = get_avatar(H, avatar)

		var/obj/item/weapon/photo/photo_owner_front = new()
		var/obj/item/weapon/photo/photo_owner_west = new()
		var/obj/item/weapon/photo/photo_owner_east = new()
		var/obj/item/weapon/photo/photo_owner_back = new()

		photo_owner_front.photocreate(null, icon(image, dir = SOUTH))
		photo_owner_west.photocreate(null, icon(image, dir = WEST))
		photo_owner_back.photocreate(null, icon(image, dir = NORTH))
		photo_owner_east.photocreate(null, icon(image, dir = EAST))

		for(var/datum/data/record/sk in data_core.stalkers)
			if(H.sid == sk.fields["sid"])
				sk.fields["photo_front"]	= photo_owner_front
				sk.fields["photo_west"]		= photo_owner_west
				sk.fields["photo_east"] 	= photo_owner_east
				sk.fields["photo_back"] 	= photo_owner_back
				return

/obj/item/device/stalker_pda/proc/get_avatar(var/mob/living/carbon/human/H, var/datum/outfit/avatar)
	var/datum/preferences/P = H.client.prefs
	return get_flat_human_icon(null, avatar, P)

/obj/item/device/stalker_pda/proc/set_owner_info(var/datum/data/record/sk)
	var/obj/item/weapon/photo/P1 = sk.fields["photo_front"]
	var/obj/item/weapon/photo/P2 = sk.fields["photo_west"]
	var/obj/item/weapon/photo/P3 = sk.fields["photo_east"]
	var/obj/item/weapon/photo/P4 = sk.fields["photo_back"]

	usr << browse_rsc(P1.img, "photo_front")
	usr << browse_rsc(P2.img, "photo_west")
	usr << browse_rsc(P3.img, "photo_east")
	usr << browse_rsc(P4.img, "photo_back")

	faction_s		= sk.fields["faction_s"]
	eng_faction_s 	= get_eng_faction(faction_s)

	rating			= sk.fields["rating"]
	money			= sk.fields["money"]
	reputation		= sk.fields["reputation"]

	rep_name_s 		= get_rep_name(sk.fields["reputation"])
	eng_rep_name_s 	= get_eng_rep_name(sk.fields["reputation"])
	rep_color_s 	= get_rep_color(sk.fields["reputation"])

	rank_name_s 	= get_rank_name(sk.fields["rating"])
	eng_rank_name_s	= get_eng_rank_name(sk.fields["rating"])

/proc/get_rank_name(var/rating)
	var/rank_name_s = "Новичок"
	switch(rating)
		if(ZONE_LEGEND to INFINITY)
			rank_name_s = "Легенда Зоны"
		if(MASTER to ZONE_LEGEND)
			rank_name_s = "Мастер"
		if(VETERAN to MASTER)
			rank_name_s = "Ветеран"
		if(EXPERT to VETERAN)
			rank_name_s = "Опытный"
		if(NEWBIE to EXPERT)
			rank_name_s = "Новичок"
	return rank_name_s

/proc/get_eng_rank_name(var/rating)
	var/eng_rank_name_s = "Rookie"
	switch(rating)
		if(ZONE_LEGEND to INFINITY)
			eng_rank_name_s = "Legend"
		if(MASTER to ZONE_LEGEND)
			eng_rank_name_s = "Master"
		if(VETERAN to MASTER)
			eng_rank_name_s = "Veteran"
		if(EXPERT to VETERAN)
			eng_rank_name_s = "Expert"
		if(NEWBIE to EXPERT)
			eng_rank_name_s = "Rookie"
	return eng_rank_name_s

/proc/get_eng_faction(var/faction_s)
	var/eng_faction_s = "Loners"
	switch(faction_s)
		if("Бандиты")
			eng_faction_s = "Bandits"
		if("Одиночки")
			eng_faction_s = "Loners"
		if("Наёмники")
			eng_faction_s = "Mercenaries"
		if("Долг")
			eng_faction_s = "Duty"
	return eng_faction_s

/proc/get_faction_color(var/faction_s)
	var/factioncolor = "#ff7733"
	switch(faction_s)
		if("Бандиты")
			factioncolor = "#8c8c8c"
		if("Одиночки")
			factioncolor = "#ff7733"
		if("Наёмники")
			factioncolor = "#3399ff"
		if("Долг")
			factioncolor = "#ff4d4d"
	return factioncolor

/proc/get_rep_name(var/rep)
	var/rep_name_s = "Нейтральна&#x44F;"

	switch(rep)
		if(AMAZING to INFINITY)
			rep_name_s = "Свой пацан"
		if(VERYGOOD to AMAZING)
			rep_name_s = "Очень хороша&#x44F;"
		if(GOOD to VERYGOOD)
			rep_name_s = "Хороша&#x44F;"
		if(BAD to GOOD)
			rep_name_s = "Нейтральна&#x44F;"
		if(VERYBAD to BAD)
			rep_name_s = "Плоха&#x44F;"
		if(DISGUSTING to VERYBAD)
			rep_name_s = "Очень плоха&#x44F;"
		if(DISGUSTING)
			rep_name_s = "Гнида"

	return rep_name_s

/proc/get_eng_rep_name(var/rep)
	var/eng_rep_name_s = "Neutral"

	switch(rep)
		if(AMAZING to INFINITY)
			eng_rep_name_s = "Jesus"
		if(VERYGOOD to AMAZING)
			eng_rep_name_s = "Very Good"
		if(GOOD to VERYGOOD)
			eng_rep_name_s = "Good"
		if(NEUTRAL to GOOD)
			eng_rep_name_s = "Neutral"
		if(BAD to NEUTRAL)
			eng_rep_name_s = "Bad"
		if(DISGUSTING to VERYBAD)
			eng_rep_name_s = "Very Bad"
		if(DISGUSTING)
			eng_rep_name_s = "Asshole"

	return eng_rep_name_s

/proc/get_rep_color(var/rep)
	var/rep_color_s = "#ffe100"
	switch(rep)
		if(AMAZING to INFINITY)
			rep_color_s = "#00abdb" //#00abdb
		if(VERYGOOD to AMAZING)
			rep_color_s = "#b6ff38" //#6ddb00
		if(GOOD to VERYGOOD)
			rep_color_s = "#daff21" //#b6db00
		if(BAD to GOOD)
			rep_color_s = "#ffe100" //#ffb200
		if(VERYBAD to BAD)
			rep_color_s = "#ff6b3a" //#db5700
		if(DISGUSTING to VERYBAD)
			rep_color_s = "#db2b00" //#db2b00
		if(DISGUSTING)
			rep_color_s = "#7c0000"
	return rep_color_s