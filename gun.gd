extends Node2D

const bullet = preload("res://bullet.tscn")

signal projectile_fire

func fire(at_position):
	var bullet_instance = bullet.instance()
	var direction = $fire_origin.global_position.direction_to(at_position)
	bullet_instance.set_direction(direction)
	bullet_instance.global_position = $fire_origin.global_position
	emit_signal("projectile_fire", bullet_instance)
