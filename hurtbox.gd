extends Area2D

signal registered_hit

func _on_hurtbox_area_entered(area):
	emit_signal("registered_hit", area)
