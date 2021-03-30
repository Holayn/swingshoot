extends Node2D

const bullet = preload("res://bullet.tscn")

signal projectile_fire

func fire():
	var bullet_instance = bullet.instance()
	var direction = ($fire_direction.global_position - global_position).normalized().angle()
	bullet_instance.set_direction(direction)
	bullet_instance.global_position = $fire_origin.global_position
	emit_signal("projectile_fire", bullet_instance)
