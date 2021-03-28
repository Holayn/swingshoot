extends KinematicBody2D

var sword = preload("res://sword.tscn")

var move_dir = Vector2.ZERO
var velocity = Vector2.ZERO
var speed = 100
const ACCEL = 600
const FRICTION = 500

func _ready():
	equip_weapon(sword)

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

func equip_weapon(weapon):
	var weapon_instance = weapon.instance()
	$ysort.add_child(weapon_instance)
	weapon_instance.position = $ysort/weapon_slot.position
	
