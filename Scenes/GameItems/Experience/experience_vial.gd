extends Node2D

@onready var player_node = get_tree().get_first_node_in_group("Player") as Node2D
var is_pull_to_player = false
var vel = 0
var accel = 5

func _ready():
	$Area2D.area_entered.connect(on_area_entered)
	$Area2D.area_exited.connect(on_area_exited)

func _physics_process(delta):
	if is_pull_to_player:
		vel += accel * delta
		global_position += get_direction_to_player() * vel

func on_area_entered(other: Area2D):
	if other.name == "AttractRangeArea":
		is_pull_to_player = true
	elif other.name == "PickupRangeArea":
		GlobalEvents.emit_exp_vial_collected(1)
		queue_free()

func on_area_exited(other):
	is_pull_to_player = false
	vel = 0

func get_direction_to_player() -> Vector2:
	if player_node != null:
		return (player_node.global_position - global_position).normalized()
	return Vector2.ZERO
