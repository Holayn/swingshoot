extends Node2D

const bullet = preload("res://bullet.tscn")

var bullet_speed = 500

export onready var test

func fire():
	var bullet_instance = bullet.instance()
	$fire_origin.add_child(bullet_instance)
	var direction = ($fire_direction.global_position - global_position).normalized()
	bullet_instance.apply_impulse(global_position, direction * bullet_speed)
