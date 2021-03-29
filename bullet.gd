extends RigidBody2D

var speed = 200
var accel = 600

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2.ZERO
var direction

var is_direction_set = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#func _process(delta):
#	if (is_direction_set):
#		velocity = velocity.move_toward(direction * speed, accel * delta)
#
#	velocity = move_and_slide(velocity)
#
#
#func set_direction(dir):
#	direction = dir
#	is_direction_set = true
