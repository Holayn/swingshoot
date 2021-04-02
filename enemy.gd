extends KinematicBody2D

const accel = 100
export var speed = 25

var velocity = Vector2.ZERO

var state = null

func _physics_process(delta):
	match state:
		Enums.CHASE:
			chase_state(delta)
	
	if ($player_detect.can_detect_player()):
		state = Enums.CHASE

func chase_state(delta):
	var to_player = Vector2.ZERO
	if $player_detect.player:
		to_player = global_position.direction_to($player_detect.player.global_position).normalized()
	else:
		state = null
	
	velocity = velocity.move_toward((to_player * speed)/2, accel * delta)
	
	velocity = move_and_slide(velocity)

func _on_hurtbox_registered_hit(area):
	queue_free()
