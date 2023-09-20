extends Node

@export var sword_ability : PackedScene

@export var max_range = 150
@export var damage = 5

@onready var player = get_tree().get_first_node_in_group("Player") as Node2D

func _on_timer_timeout():
	var enemy_nodes = get_tree().get_nodes_in_group("Enemy")
	enemy_nodes = enemy_nodes.filter(func(enemy: Node2D):
		return enemy.global_position.distance_to(player.global_position) < pow(max_range, 2)
	)
	
	if enemy_nodes.size() == 0:
		return
	
	enemy_nodes.sort_custom(func(a: Node2D, b:Node2D):
		var a_dist = a.global_position.distance_squared_to(player.global_position)
		var b_dist = b.global_position.distance_squared_to(player.global_position)
		return a_dist < b_dist
	)
	
	var sword_instance = sword_ability.instantiate() as SwordAbility
	player.get_parent().add_child(sword_instance)
	sword_instance.hitbox_component.damage = damage
	
	sword_instance.global_position = enemy_nodes[0].global_position
	sword_instance.global_position += Vector2.RIGHT.rotated(randf_range(0, TAU)) * 4
	
	var enemy_dir = enemy_nodes[0].global_position - sword_instance.global_position
	sword_instance.rotation = enemy_dir.angle()
	
