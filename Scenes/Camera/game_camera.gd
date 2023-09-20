extends Camera2D

@onready var player_node = get_tree().get_nodes_in_group("Player") 
var target_pos = Vector2.ZERO


func _ready():
	make_current()



func _process(delta):
	if player_node.size() > 0:
		target_pos = player_node[0].global_position
	global_position = global_position.lerp(target_pos, 1.0 - exp(-delta * 20))
