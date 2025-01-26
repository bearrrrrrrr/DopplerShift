//hello! giant .dm that just modularly renames items from nanotrasen to port authority/regional administration/etc,.
//nonmodular edits are marked with //NONMODULAR DOPLER EDIT START and //NONMODULAR DOPLER EDIT END respectively
//spessman be vigilant. we loved you.


//datums,first off


/datum/pod_style
	var/desc = "A Port Authority supply drop pod."

/datum/pod_style/advanced
	name = "bluespace supply pod"
	desc = "A Port Authority Bluespace supply pod. Teleports back to Regional Administration after delivery."

/datum/pod_style/centcom
	name = "\improper Regional Administration supply pod"
	desc = "A Port Authority supply pod, this one has been marked with Regional Administration's designations. Teleports back to Regional Admin after delivery."

/datum/pod_style/deathsquad
	name = "\improper Deathsquad drop pod"
	desc = "A Special Circumstances drop pod. This one has been marked the markings of an elite strike team."\

/datum/pod_style/cultist
	name = "bloody supply pod"
	desc = "A Port Authority supply pod covered in scratch-marks, blood, and strange runes."


/datum/map_template/shuttle/emergency/asteroid
	name = "Asteroid Station Emergency Shuttle"
	description = "A respectable mid-sized shuttle that first saw service shuttling crew to and from their asteroid belt embedded facilities over a hundred years ago. Has only been updated to add cup-holders since."

/datum/map_template/shuttle/emergency/wawa
	description = "Due to a recent clerical error in the funding department, a lot of funding went to lizard plushies. Due to the costs, the Port Authority has supplied a nearby garbage truck as a stand-in. Better learn how to share spots."

/datum/map_template/shuttle/emergency/goon
	name = "4CA Emergency Shuttle"
	description = "A design used as the universal standard in Fourth Celestial Alignment facilities. Has more seats, but fewer onboard shuttle facilities."

/datum/map_template/shuttle/emergency/lance
	name = "The Lance Crew Evacuation System"
	description = "A shuttle of military origin during the war that formed the 4CA. It's designed to tactically slam into a destroyed station, dispatching threats and saving crew at the same time! Be careful to stay out of its path."

/datum/station_trait/birthday
	name = "Employee Birthday"
	report_message = "We here at Region Admin would all like to wish Employee Name a very happy birthday"

/* //so this is stuff that is extremely goofy and i was told may be removed but might not be. if it's still in at a later date just uncomment this
datum/map_template/shuttle/emergency/rollerdome
	name = "Uncle Pete's Rollerdome"
	description = "Hey, daddy-o, don't lose your cool, cat, you dig? \
	A shuttle based off an old entertainment complex from the 1990s, though our database has no records on anything pertaining to that decade." */

//OBJECTS


/obj/item/paper/paperslip/corporate/fluff/spare_id_safe_code
	name = "Port Authority-Approved Spare ID Safe Code"

/obj/item/storage/backpack/captain
	name = "captain's backpack"
	desc = "It's a backpack made exclusively for acting officers. Breathe in; smell nepotism and grinding yourself down for cash as a glorified middle-manager. You earned this."

/obj/item/storage/backpack/satchel/cap
	name = "captain's satchel"
	desc = "It's a satchel made exclusively for acting officers. Breathe in; smell nepotism and grinding yourself down for for cash as a glorified middle-manager. You earned this."

/obj/item/storage/bag/sheetsnatcher
	name = "sheet snatcher"
	desc = "A common-design storage system designed for any kind of mineral sheet."

/obj/item/storage/fancy/rollingpapers
	name = "rolling paper pack"
	desc = "A pack of rolling papers. It's cheaper than buying whole, you know. Ignore the tobacco under your nails."

/obj/item/storage/box/syndie_kit/poster_box
	name = "syndicate poster pack"
	desc = "Contains a variety of demotivational posters to ensure minimum productivity for the crew of any Port Authority station."

/obj/item/storage/box/sparklers
	name = "box of sparklers"
	desc = "A box of sparklers, burns hot even in the cold of space-winter. Often used for celebration on the Day of Armistice, when the civil war of the 2CA was finally put to an end."

/obj/item/bedsheet/captain
	name = "captain's bedsheet"
	desc = "It has a Port Authority symbol on it, and was woven with a revolutionary new kind of thread special-guaranteed t- hahaha, just kidding. It does have an extra layer of insulation, though. Ain't that nice?"

/obj/item/bedsheet/rev
	name = "revolutionary's bedsheet"
	desc = "A bedsheet stolen from a Regional Admin official's bedroom, used a symbol of triumph against the Fourth Celestial's tyranny. The golden emblem on the front has been scribbled out."

/obj/item/bedsheet/nanotrasen
	name = "\improper Port Authority bedsheet"
	desc = "It has the Port Authority logo on it and has an aura of duty."

/obj/machinery/deployable_turret/hmg
	name = "heavy machine gun turret"
	desc = "A heavy caliber machine gun commonly used by mercenaries, soldiers of fortune, freedom fighters, and terrorists, famed for its ability to give people on the receiving end more holes than normal."

/obj/structure/showcase/mecha/marauder
	name = "combat mech exhibit"
	desc = "A stand with an empty old Marauder combat-mech, mass-produced by the Port Authority, and used by the Ministry of Peace to ensure Compliance. Infamous for its usage as riot-control and corpo-sec. Pinnacle of violence; you are meant to think this is Cool and Awesome and Good."

/obj/structure/showcase/machinery/microwave
	name = "\improper Nanotrasen-brand microwave"
	desc = "The famous Port Authority-brand microwave, the multi-purpose cooking appliance every station needs! This one appears to be drawn onto a cardboard box."

/obj/structure/showcase/machinery/microwave_engineering
	name = "\improper Nanotrasen Wave(tm) microwave"
	desc = "For those who thought the Port Authority couldn't improve on their famous microwave, this model features Wave™! A Port Authority exclusive, Wave™ allows your PDA to be charged wirelessly through microwave frequencies. Because nothing says 'future' like charging your PDA while overcooking your leftovers. Authority Wave™ - Multitasking, redefined. This product was pulled from shelves after multiple station-wide fires."

/obj/structure/showcase/perfect_employee
	name = "'Perfect Man' employee exhibit"
	desc = "A stand with a model of the perfect Port Authority Employee bolted to it. Signs indicate it is robustly genetically engineered, as well as being ruthlessly loyal."

/obj/structure/showcase/machinery/tv
	name = "\improper Port Authority corporate newsfeed"
	desc = "A slightly battered looking TV. Various Port Authority programs like shipping information, infomercials, and documentaries play on a loop."

/obj/machinery/shower
	name = "shower"
	desc = "The HS-452. Installation is required by the 4CA Ministry of Health. Passively replenishes itself with water when not in use."