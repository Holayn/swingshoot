extends KinematicBody2D

const sword = preload("res://sword.tscn")
const gun = preload("res://gun.tscn")

var move_dir = Vector2.ZERO
var velocity = Vector2.ZERO
var speed = 100
const ACCEL = 100
const FRICTION = 500

var equipped_weapon

func _ready():
	equip_weapon(gun)

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
	
	if Input.is_action_just_pressed("lclick"):
		use_weapon()

func _input(event):
	if event is InputEventMouseMotion:
		look_at(get_global_mouse_position())
		rotation += deg2rad(90)

func equip_weapon(weapon):
	var weapon_instance = weapon.instance()
	$ysort/weapon_slot.add_child(weapon_instance)
	equipped_weapon = weapon_instance
	weapon_instance.connect("projectile_fire", get_tree().get_root().get_node("world/ysort/projectile_ctrl"), "_on_projectile_fire")
	
func use_weapon():
	var at_position = get_global_mouse_position()
	equipped_weapon.fire(at_position)
