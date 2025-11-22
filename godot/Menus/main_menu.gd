extends Node2D

var isFocus = false

func _on_button_pressed() -> void:
	$Menu.play()

	get_tree().change_scene_to_file("res://Main_world/main_world.tscn")


func _process(delta: float) -> void:
	if isFocus == false and detect_input():
		isFocus = true
		$Panel/VBoxContainer/Button.grab_focus()




func detect_input():
	var output = false
	if Input.is_action_pressed("move_forward"):	
		$Menu.play()
			
		output= true
	if Input.is_action_pressed("move_backward"):
		$Menu.play()

		output= true
	if Input.is_action_pressed("move_left"):
		output= true
	if Input.is_action_pressed("move_right"):
		output= true
	return output


func _on_button_4_pressed() -> void:
	$Menu.play()

	get_tree().quit()


func _on_button_2_pressed() -> void:
		$Menu.play()
		var is_fullscreen := DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN
		if is_fullscreen:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
