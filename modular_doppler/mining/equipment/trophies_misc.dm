//1k points
/obj/item/crusher_trophy/skull_check
	name = "skull-checker"
	desc = "An overclocking of the internal systems of the crusher. The extra weight it adds makes it harder to swing proficiently"
	icon_state = "demon_claws"
	denied_type = /obj/item/crusher_trophy/skull_check
	bonus_value = 10

/obj/item/crusher_trophy/demon_claws/effect_desc()
	return "<b>Lowers</b> your crusher's melee damage. <b>Triples your backstab detonation damage</b>"

/obj/item/crusher_trophy/skull_check/add_to(obj/item/kinetic_crusher/pkc, mob/living/user)
	. = ..()

	pkc.force = pkc.force * 0.75
	pkc.backstab_bonus = 90 //capped, needless to say you DO NOT WANT anything more than

/obj/item/crusher_trophy/skull_check/remove_from(obj/item/kinetic_crusher/pkc, mob/living/user)
	. = ..()

	pkc.force = pkc.force * 1.25
	pkc.backstab_bonus = 30 //look dude like . why r u playin around with the accessories anyway . u trying to powergame ???