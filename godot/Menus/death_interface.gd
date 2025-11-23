extends CanvasLayer




func activate():
	show()
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Panel/Button.grab_focus()


func _on_button_pressed() -> void:
	if 	get_parent().item >= 10:
		hide()
		get_parent().item -= 10
		get_parent().HP = 100
		get_tree().paused = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		$Panel/Button.hide()
		$Panel/Label2.text = str("not enough")

func _on_button_2_pressed() -> void:
	get_tree().paused = false
	WorldData.reset()
	get_tree().reload_current_scene()
