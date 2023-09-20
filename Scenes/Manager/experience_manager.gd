extends Node
class_name ExperienceManager

signal experience_updated(current_exp: float, target_exp: float)
signal player_level_up(new_lvl:int)

var current_exp = 0
var current_level = 1
var target_exp = 5
var target_exp_growth = 5

func _ready():
	GlobalEvents.experiance_vial_collected.connect(on_exp_vial_collected)


func increment_exp(value: float):
	current_exp = clamp(current_exp + value, 0, target_exp)
	experience_updated.emit(current_exp, target_exp)
	if current_exp == target_exp:
		level_up()


func level_up():
	current_level += 1
	current_exp = 0
	target_exp += target_exp_growth
	if current_level % 5 == 0:
		target_exp_growth += 5
	experience_updated.emit(current_exp, current_level)
	player_level_up.emit(current_level)

func on_exp_vial_collected(value: float):
	increment_exp(value)
