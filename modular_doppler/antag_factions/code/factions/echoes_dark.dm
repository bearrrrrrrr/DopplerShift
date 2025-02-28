/datum/antag_faction/echoes
	name = "Echoes-Dark-Locations"
	description = "The sister ship of the 9LP. A mix-up led to you two being assigned to the same sector, and a rocky start with a mis-identification led to the two crews using lethal force on each other, believing the other side to be pirates. \
	The severity of the incident was...under-exaggerated by the regional administration so such a catastrophic fuck-up wouldn't cost all of you your jobs. The Port Authority is now increasing performance-rewards to get one crew to out-compete the other and replace them. Either hired by EDL, or part of the crew, you don't intend to mess up now.."
	antagonist_types = list(/datum/antagonist/traitor, /datum/antagonist/spy)
	faction_category = /datum/uplink_category/faction_special/echoes
	entry_line = span_boldnotice("You take in a deep breath. Yelling and breach alarms; maybe a flashback to the explanation on why you were hired, maybe a slice of memory. Either way, you know why the hate is so mutual. And you have a job to do.")

/datum/uplink_category/faction_special/echoes
	name = "Research Operative Issued Equipment"
	weight = 100

/datum/antag_faction_item/echoes
	faction = /datum/antag_faction/echoes

/datum/antag_faction_item/echoes/rcd
	name = "Industrial RCD"
	description = "An RCD straight from the EDL's storage. "
	item = /obj/item/construction/rcd/combat
	cost = 12


// UH OH

/obj/item/grenade/spawnergrenade/spikeroach
	name = "spike synthroach grenade"
	desc = "Have you ever had an idea so bad you wanted to do it multiple times? In that case- you're in luck, kid!"
	spawner_type = /mob/living/basic/cockroach/hauberoach
	deliveryamt = 6

/datum/antag_faction_item/echoes/spikeroach_nade
	name = "spike synthroach greande"
	description = "Synthroaches are the remnants of old bio-synth weapons. A few survived the end of their war and the clean-up efforts, and evolved into pests that are ubiquitous on most ships. This grenade is full of 'spikeroaches', synth-roaches that were once fearsome self-detonating drones and are now...still self-detonating drones. WARNING: hostile to all non-roaches, including the user!"
	item = /obj/item/grenade/spawnergrenade/spikeroach
	cost = 6