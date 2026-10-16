//LONG HAVE WE WAITED, TILE-CLICK ACTIVATED.
//Whenever u left click on a tile with combat indicator up and in harm intent, the click checks if there's a mob standing on the tile, and instead tries to click on that guy
//This is maybe badly made. sry

/mob/living/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/tile_attacks)



/datum/element/tile_attacks

/datum/element/tile_attacks/Attach(datum/target)
	. = ..()
	if(!isliving(target))
		return ELEMENT_INCOMPATIBLE

	RegisterSignal(target, COMSIG_LIVING_EARLY_UNARMED_ATTACK, PROC_REF(slappies))
	RegisterSignal(target, COMSIG_USER_ITEM_INTERACTION, PROC_REF(stabbies))

/datum/element/tile_attacks/Detach(datum/source)
	UnregisterSignal(source, list(COMSIG_LIVING_EARLY_UNARMED_ATTACK, COMSIG_USER_ITEM_INTERACTION))
	return ..()

//for the unarmed portion
/datum/element/tile_attacks/proc/slappies(mob/living/source, atom/target, proximity_flag, list/modifiers)
	SIGNAL_HANDLER

	if(!proximity_flag)
		return NONE

	var/mob/living/villain = get_redirect_target(source, target, modifiers)
	if(isnull(villain))
		return NONE

	if(!HAS_TRAIT(source, TRAIT_HANDS_BLOCKED))
		source.changeNext_move(CLICK_CD_MELEE) //anddd we make sure they don't skip clickcd :DDDD i almost forgot this this woulda been really bad
	INVOKE_ASYNC(source, TYPE_PROC_REF(/mob, UnarmedAttack), villain, proximity_flag, modifiers)
	return COMPONENT_CANCEL_ATTACK_CHAIN


/datum/element/tile_attacks/proc/stabbies(mob/living/source, atom/target, obj/item/tool, list/modifiers) 	// no manually added cd because the item shouuuld do that
	SIGNAL_HANDLER

	var/mob/living/villain = get_redirect_target(source, target, modifiers)
	if(isnull(villain))
		return NONE

	INVOKE_ASYNC(tool, TYPE_PROC_REF(/obj/item, melee_attack_chain), source, villain, modifiers)
	return ITEM_INTERACT_SUCCESS

//checks who this should be redirected to. minor caveat; i had to pick who is prioritized and ultimately decided to pick whoever is on the highest layer
//this probably isn't the best idea but uhhh ???? it can be changed to whatever ppl prefer so it's nbd :3

/datum/element/tile_attacks/proc/get_redirect_target(mob/living/source, atom/target, list/modifiers)
	if(!isturf(target))
		return null
	if(isnull(source.client))
		return null
	if(!source.combat_mode || LAZYACCESS(modifiers, RIGHT_CLICK))
		return null
	if(!source.combat_indicator)
		return null

	var/mob/living/villain
	for(var/mob/living/candidate in target)
		if(candidate == source)
			continue
		if(candidate.alpha < 40 || candidate.mouse_opacity == MOUSE_OPACITY_TRANSPARENT) //this should stop ppl from clicking invisible ppl
			continue
		if(isnull(villain) || candidate.layer >= villain.layer)
			villain = candidate

	return villain
