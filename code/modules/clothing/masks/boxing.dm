/obj/item/clothing/mask/balaclava
	name = "balaclava"
	desc = "LOADSAMONEY"
	icon_state = "balaclava"
	item_state = "balaclava"
	flags = BLOCKHAIR
	flags_inv = HIDEFACE
	visor_flags_inv = HIDEFACE
	w_class = 2
	action_button_name = "Adjust Balaclava"
	ignore_maskadjust = 0

/obj/item/clothing/mask/balaclava/attack_self(mob/user)
	adjustmask(user)

/obj/item/clothing/mask/luchador
	name = "Luchador Mask"
	desc = "Worn by robust fighters, flying high to defeat their foes!"
	icon_state = "luchag"
	item_state = "luchag"
	flags = BLOCKHAIR
	flags_inv = HIDEFACE
	w_class = 2

/obj/item/clothing/mask/luchador/speechModification(message)
	if(copytext(message, 1, 2) != "*")
		message = replacetext510(message, "captain", "CAPITÁN")
		message = replacetext510(message, "station", "ESTACIÓN")
		message = replacetext510(message, "sir", "SEÑOR")
		message = replacetext510(message, "the ", "el ")
		message = replacetext510(message, "my ", "mi ")
		message = replacetext510(message, "is ", "es ")
		message = replacetext510(message, "it's", "es")
		message = replacetext510(message, "friend", "amigo")
		message = replacetext510(message, "buddy", "amigo")
		message = replacetext510(message, "hello", "hola")
		message = replacetext510(message, " hot", " caliente")
		message = replacetext510(message, " very ", " muy ")
		message = replacetext510(message, "sword", "espada")
		message = replacetext510(message, "library", "biblioteca")
		message = replacetext510(message, "traitor", "traidor")
		message = replacetext510(message, "wizard", "mago")
		message = uppertext(message)	//Things end up looking better this way (no mixed cases), and it fits the macho wrestler image.
		if(prob(25))
			message += " OLE!"
	return message

/obj/item/clothing/mask/luchador/tecnicos
	name = "Tecnicos Mask"
	desc = "Worn by robust fighters who uphold justice and fight honorably."
	icon_state = "luchador"
	item_state = "luchador"

/obj/item/clothing/mask/luchador/rudos
	name = "Rudos Mask"
	desc = "Worn by robust fighters who are willing to do anything to win."
	icon_state = "luchar"
	item_state = "luchar"