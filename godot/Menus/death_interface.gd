extends CanvasLayer

var death_number = 0


func activate():
	$Panel/Label2.text = "cost " + str(clamp(10.0 +death_number*5.0,10.0,20.0))
	show()
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Panel/Button.grab_focus()


func _on_button_pressed() -> void:
	if 	get_parent().item >= clamp(10.0 +death_number*5.0,10.0,20.0):
		hide()
		get_parent().item -= clamp(10.0 +death_number * 5.0,10.0,20.0)
		get_parent().HP = 100
		death_number += 1
		get_tree().paused = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		$Panel/Button.hide()
		$Panel/Label2.text = str("not enough")
		$Panel/Button2.grab_focus()


func _on_button_2_pressed() -> void:
	get_tree().paused = false
	WorldData.reset()
	get_tree().reload_current_scene()
