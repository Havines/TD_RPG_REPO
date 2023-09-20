extends CharacterBody2D

const ACCELERATION_SMOOTHING = 25

@export var MAX_SPEED = 150



func _process(delta):
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	var target_vel = direction * MAX_SPEED
	velocity = velocity.lerp(target_vel, 1 - exp(-delta * ACCELERATION_SMOOTHING))
	move_and_slide()



func get_movement_vector() -> Vector2:
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left") 
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up") 
	return Vector2(x_movement, y_movement)
