extends CharacterBody2D

@export var max_speed = 75

@onready var player_node = get_tree().get_first_node_in_group("Player") as Node2D
@onready var health_component: HealthComponent = $HealthComponent


func _process(delta):
	var dir = get_direction_to_player()
	velocity = dir * max_speed
	move_and_slide()


func get_direction_to_player() -> Vector2:
	if player_node != null:
		return (player_node.global_position - global_position).normalized()
	return Vector2.ZERO
