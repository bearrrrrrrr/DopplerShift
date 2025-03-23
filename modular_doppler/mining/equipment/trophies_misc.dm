//1k points
/obj/item/crusher_trophy/skill_check
	name = "kinesics-checker"
	desc = "An overclocking of the internal systems of the crusher; uses a momentum-storage system to turn power on swings into devastating detonations. Also called the skill checker."
	icon_state = "demon_claws"
	denied_type = /obj/item/crusher_trophy/skill_check
	bonus_value = 10

/obj/item/crusher_trophy/demon_claws/effect_desc()
	return "<b>Lowers</b> your crusher's melee damage by 25%. <b>Triples your backstab detonation damage!</b>"

/obj/item/crusher_trophy/skill_check/add_to(obj/item/kinetic_crusher/pkc, mob/living/user)
	. = ..()

	pkc.force = pkc.force * 0.75
	pkc.backstab_bonus = 90 //Good Enough.

/obj/item/crusher_trophy/skill_check/remove_from(obj/item/kinetic_crusher/pkc, mob/living/user)
	. = ..()

	pkc.force = pkc.force * 1.25
	pkc.backstab_bonus = 30 //Good Enough

