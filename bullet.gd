extends Area2D

var speed = 200
var accel = 600

var velocity = Vector2.ZERO
var bullet_direction

func _process(delta):
	var motion = bullet_direction * speed
	global_position += motion * delta

func set_direction(dir):
	bullet_direction = dir
	look_at(dir)
	rotation += deg2rad(90)
