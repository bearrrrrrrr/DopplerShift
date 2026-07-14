//peter gabriel

/datum/power/thaumaturge/errantspark
	name = "Errant Spark"
	desc = "Fires powerful but inaccurate projectiles of lightning equivalent to your Affinity. Called 'Errant' because they bounce off of objects until they hit something important. Can be used to charge APCs. Will also destroy APCs if you're unlucky."
	security_record_text = "Subject is able to "
	security_threat = POWER_THREAT_MAJOR
	value = 3

	action_path = /datum/action/cooldown/power/thaumaturge/magical_barrage
	required_powers = list(/datum/power/thaumaturge_root)
	required_allow_subtypes = TRUE


/datum/action/cooldown/power/thaumaturge/magical_barrage
	name = "Errant Spark"
	desc = "Fires powerful but inaccurate projectiles of lightning equivalent to your Affinity. Called 'Errant' because they bounce off of objects until they hit something important. Can be used to charge APCs. Will also destroy APCs if you're unlucky."
	button_icon = 'icons/obj/weapons/guns/projectiles.dmi'
	button_icon_state = "arcane_barrage"

	required_affinity = 3
	prep_cost = 5
	anti_magic_on_target = FALSE