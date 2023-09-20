extends Camera2D

@onready var player_node = get_tree().get_nodes_in_group("Player") 
var target_pos = Vector2.ZERO


func _ready():
	make_current()
	init_limit()


func init_limit():
	limit_bottom = 0
	limit_left = 0
	limit_right = 0
	limit_top = 0
	
	var tilemap = get_node("../TileMap") as TileMap
	
	var used = tilemap.get_used_rect()
	limit_left = min(used.position.x * 32.0, limit_left)
	limit_right = max(used.end.x * 32.0, limit_right)
	limit_bottom = max(used.end.y * 32.0, limit_bottom)
	limit_top = min(used.position.y * 32.0, limit_top)


func _process(delta):
	if player_node.size() > 0:
		target_pos = player_node[0].global_position
	else:
		return
	global_position = target_pos
