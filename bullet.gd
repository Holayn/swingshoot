extends Area2D

var speed = 200
var accel = 600

var velocity = Vector2.ZERO
var bullet_direction

func _process(delta):
	var motion = Vector2(cos(bullet_direction), sin(bullet_direction)) * speed
	global_position += motion * delta

func set_direction(dir):
	bullet_direction = dir
	global_rotation = dir + deg2rad(90)
