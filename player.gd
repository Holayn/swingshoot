extends KinematicBody2D

var move_dir = Vector2.ZERO
var velocity = Vector2.ZERO
var speed = 100
const ACCEL = 600
const FRICTION = 500

func _process(delta):
	controls_process(delta)
	movement_process(delta)

func movement_process(delta):
	if move_dir != Vector2(0,0):
		velocity = velocity.move_toward(move_dir * speed, ACCEL * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)

func controls_process(delta):
	move_dir.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	move_dir.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	move_dir = move_dir.normalized()

func _input(event):
	if event is InputEventMouseMotion:
		look_at(event.position)
		self.rotation_degrees = self.rotation_degrees + 90
