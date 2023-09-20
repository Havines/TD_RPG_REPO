extends Node

@export var spawn_radius = 330
@export var enemy_scene : PackedScene

@onready var player = get_tree().get_first_node_in_group("Player")


func _on_timer_timeout():
	if player == null:
		return
	
	var random_dir = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var spawn_pos = player.global_position + (random_dir * spawn_radius)
	
	var enemy = enemy_scene.instantiate()
	get_parent().get_node("World").add_child(enemy)
	enemy.global_position = spawn_pos
