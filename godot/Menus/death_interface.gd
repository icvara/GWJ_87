extends CanvasLayer




func activate():
	show()
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_button_pressed() -> void:
	hide()
	get_parent().HP = 100
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_button_2_pressed() -> void:
	get_tree().paused = false

	get_tree().reload_current_scene()
