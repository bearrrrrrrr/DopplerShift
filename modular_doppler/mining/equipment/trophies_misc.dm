//1k points
/obj/item/crusher_trophy/skill_check
	name = "kinesics-checker"
	desc = "An upgrade for the already-clunky crusher. Uses a momentum-storage system to turn power from swings into devastating detonations. Also called the skill checker."
	icon = 'icons/obj/devices/circuitry_n_data.dmi'
	icon_state = "circuit_map"
	denied_type = /obj/item/crusher_trophy/skill_check
	bonus_value = 10

/obj/item/crusher_trophy/skill_check/effect_desc()
	return "<b>Lowers</b> your crusher's melee damage by 25%. <b>Triples your backstab detonation damage!</b>"

/obj/item/crusher_trophy/skill_check/add_to(obj/item/kinetic_crusher/pkc, mob/living/user)
	. = ..()

	pkc.backstab_bonus *= 3
	AddComponent(/datum/component/two_handed, force_wielded=15)

/obj/item/crusher_trophy/skill_check/remove_from(obj/item/kinetic_crusher/pkc, mob/living/user)
	. = ..()

	pkc.backstab_bonus /= 3
	AddComponent(/datum/component/two_handed, force_wielded=20)


//belt slot pkc, i actually don't think this is that good lol???

/obj/item/crusher_trophy/pkc_sling
	name = "PKC sling"
	desc = "A sling that allows for easier storage. Sometimes, the simplest things in life are the best."
	icon = 'modular_doppler/job_straps/icons/straps.dmi'
	icon_state = "strap_sup"
	denied_type = /obj/item/crusher_trophy/pkc_sling
	bonus_value = 10

/obj/item/crusher_trophy/demon_claws/effect_desc()
	return "Allows you to <b>store your crusher in your belt slot</b> ."

/obj/item/crusher_trophy/skill_check/add_to(obj/item/kinetic_crusher/pkc, mob/living/user)
	. = ..()

	pkc.slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_BELT

/obj/item/crusher_trophy/skill_check/remove_from(obj/item/kinetic_crusher/pkc, mob/living/user)
	. = ..()

	pkc.slot_flags = ITEM_SLOT_BACK



/datum/orderable_item/mining/skill_check
	purchase_path = /obj/item/crusher_trophy/skill_check
	cost_per_order = 450

/datum/orderable_item/mining/pkc_sling
	purchase_path = /obj/item/crusher_trophy/pkc_sling
	cost_per_order = 400