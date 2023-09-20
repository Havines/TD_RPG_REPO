extends ProgressBar


@export var experience_manager : ExperienceManager


func _ready():
	value = 0
	experience_manager.experience_updated.connect(on_exp_updated)


func on_exp_updated(curr_exp, target_exp):
	var percent = curr_exp / target_exp
	value = percent
