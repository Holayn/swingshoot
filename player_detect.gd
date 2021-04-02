extends Area2D

var player = null

func can_detect_player():
	return player != null

func _on_player_detect_body_entered(body):
	player = body

func _on_player_detect_body_exited(body):
	player = null
