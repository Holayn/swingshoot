extends Node

func _input(event):
	if event is InputEventMouseMotion:
		var center_x = ProjectSettings.get_setting("display/window/size/width")/2
		var center_y = ProjectSettings.get_setting("display/window/size/height")/2
		
		var angle = atan2(get_viewport().get_mouse_position().y - center_y, get_viewport().get_mouse_position().x - center_x);
		
		$ysort/player.rotation = angle + deg2rad(90);
