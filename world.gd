extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	$cursor.position = get_viewport().get_mouse_position()
	
func _input(event):
	if event is InputEventMouseMotion:
		$cursor.position = get_viewport().get_mouse_position()
