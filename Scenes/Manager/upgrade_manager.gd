extends Node


@export var upgrade_pool : Array[AbilityUpgrade]
@export var experience_manager : ExperienceManager

var current_upgrades = {}

func _ready():
	experience_manager.player_level_up.connect(on_player_level_up)


func on_player_level_up(curr_lvl):
	var chosen_upgrade = upgrade_pool.pick_random() as AbilityUpgrade
	if chosen_upgrade == null:
		return
	
	var has_upgrade = current_upgrades.has(chosen_upgrade.Id)
	if !has_upgrade:
		current_upgrades[chosen_upgrade.Id] = {
			"resource":chosen_upgrade, 
			"quantity":1
		}
	else:
		current_upgrades[chosen_upgrade.Id]["quantity"] += 1

