//peter gabriel
//fast, dumb-fire spell that indiscriminately hits EVERYBODY excluding the caster (the caster will then, presumably, be hit with rocks by the ppl around them)

#define ERRANT_SPARK_APC_CHARGE_AMOUNT (0.2 * STANDARD_CELL_CHARGE)

/datum/power/thaumaturge/errantspark
	name = "Errant Spark"
	desc = "Fires powerful but inaccurate projectiles of lightning equivalent to your Affinity. Called 'Errant' because they will, upon discharge, hit everything. Called 'Spark' because your crewmates are going to set you on fire after you shock them. Can be used to charge APCs. \nRequires Affinity 3."
	security_record_text = "Subject can conjure and fire unstable bolts of lightning that ricochet off nearby objects before discharging."
	security_threat = POWER_THREAT_MAJOR
	value = 3

	action_path = /datum/action/cooldown/power/thaumaturge/errant_spark
	required_powers = list(/datum/power/thaumaturge_root)
	required_allow_subtypes = TRUE

/datum/action/cooldown/power/thaumaturge/errant_spark
	name = "Errant Spark"
	desc = "Fires powerful but inaccurate projectiles of lightning equivalent to your Affinity. Called 'Errant' because they will, upon discharge, hit everything. Called 'Spark' because your crewmates are going to set you on fire after you shock them. Can be used to charge APCs. \nRequires Affinity 3."
	button_icon = 'icons/mob/actions/actions_spells.dmi'
	button_icon_state = "lightning"

	required_affinity = 3
	prep_cost = 2
	click_to_activate = TRUE
	anti_magic_on_target = FALSE
	cooldown_time = 10 SECONDS

/datum/action/cooldown/power/thaumaturge/errant_spark/use_action(mob/living/user, atom/target)
	if(fire_projectile(user, target, /obj/projectile/resonant/errant_spark))
		user.visible_message(span_warning("[user] hurls a crackling errant spark!"), span_notice("You hurl a crackling errant spark."))
		playsound(user, 'sound/effects/magic/lightningbolt.ogg', 75, TRUE, MEDIUM_RANGE_SOUND_EXTRARANGE)
		return TRUE
	return FALSE

/datum/action/cooldown/power/thaumaturge/errant_spark/ready_projectile(obj/projectile/projectile_instance, atom/target, mob/living/user)
	. = ..()
	var/obj/projectile/resonant/errant_spark/spark = projectile_instance
	if(!istype(spark))
		return
	spark.apply_affinity(affinity)

/obj/projectile/resonant/errant_spark
	name = "errant spark"
	icon_state = "tesla_projectile"
	damage = 10
	damage_type = BURN
	speed = 2.5
	armour_penetration = 35
	armor_flag = ENERGY
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	hitsound = 'sound/effects/magic/lightningshock.ogg'
	hitsound_wall = SFX_RICOCHET
	light_system = OVERLAY_LIGHT
	light_range = 2
	light_power = 1.4
	light_color = LIGHT_COLOR_ELECTRIC_CYAN
	ricochets_max = 4
	min_ricochets = 1
	ricochet_chance = 140
	ricochet_decay_chance = 0.85
	ricochet_decay_damage = 0.9
	ricochet_auto_aim_range = 4
	ricochet_auto_aim_angle = 70
	ricochet_incidence_leeway = 0
	ricochet_shoots_firer = FALSE
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE

	/// Tesla-zap strength after the projectile hits something important.
	var/zap_power = 1.8e4
	/// How far the discharge can chain from the struck atom.
	var/zap_range = 2
	/// Flags used by the secondary tesla discharge.
	var/zap_flags = ZAP_MOB_DAMAGE | ZAP_OBJ_DAMAGE | ZAP_LOW_POWER_GEN

/obj/projectile/resonant/errant_spark/proc/apply_affinity(affinity)
	var/safe_affinity = max(affinity, 1)
	damage = 4 + (safe_affinity * 3)
	zap_power = 6e3 * safe_affinity
	ricochets_max = clamp(safe_affinity + 1, 3, 7)
	min_ricochets = clamp(round(safe_affinity / 2), 1, 3)
	ricochet_auto_aim_range = clamp(safe_affinity + 1, 4, 7)

/obj/projectile/resonant/errant_spark/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(!QDELETED(src))
		discharge(target)

/obj/projectile/resonant/errant_spark/proc/discharge(atom/target)
	if(istype(target, /obj/machinery/power/apc))
		charge_or_overload_apc(target)
		tesla_zap(source = src, zap_range = zap_range, power = zap_power, cutoff = 1e3, zap_flags = zap_flags)
		return

	tesla_zap(source = src, zap_range = zap_range, power = zap_power, cutoff = 1e3, zap_flags = zap_flags)

/obj/projectile/resonant/errant_spark/proc/charge_or_overload_apc(obj/machinery/power/apc/target_apc)
	if(!target_apc.cell)
		return

	var/charge_amount = min(ERRANT_SPARK_APC_CHARGE_AMOUNT, target_apc.cell.maxcharge - target_apc.cell.charge) //kinda gross way to do it but whatever
	if(charge_amount > 0) //stupid tea! stupid, stupid, stupid...!!
		target_apc.cell.give(charge_amount)
		target_apc.visible_message(span_notice("[target_apc] crackles as [src] feeds power into it."))
		new /obj/effect/particle_effect/sparks(get_turf(target_apc))

#undef ERRANT_SPARK_APC_CHARGE_AMOUNT
