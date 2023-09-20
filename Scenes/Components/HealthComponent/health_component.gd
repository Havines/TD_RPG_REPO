extends Node
class_name HealthComponent

signal died

@export var max_health: float = 10
@onready var curr_health = max_health


func damage(dmg: float):
	curr_health = max(curr_health - dmg, 0)
	Callable(check_death).call_deferred()

func check_death():
	if curr_health <= 0:
		died.emit()
		owner.queue_free()
