extends Area2D
class_name HurtBoxComponent

@export var health_component : HealthComponent

func _ready():
	area_entered.connect(on_area_entered)


func on_area_entered(area):
	if not area is HitBoxComponent:
		return
	
	if health_component == null:
		return
	
	var hitbox_comp = area as HitBoxComponent
	health_component.damage(hitbox_comp.damage)
