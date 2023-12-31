extends MarginContainer


@export var arena_time_manager : ArenaTimeManager
@onready var label = $%Label

func _process(delta):
	if arena_time_manager == null:
		return
	label.text = format_seconds_to_str(arena_time_manager.get_time_elapsed())



func format_seconds_to_str(seconds : float) -> String:
	var minutes = floor(seconds/60)
	var remaining_seconds = floor(seconds - (minutes * 60))
	return str(minutes) + ":" + ("%02d" %remaining_seconds)
