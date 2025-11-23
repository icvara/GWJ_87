extends Control

var count = 0

func activate():
	show()
	$Button.grab_focus()
	$AnimationPlayer.play("new_animation")

func _on_button_pressed() -> void:
	count +=1
	$AnimatedSprite3D.play("default")
	$Label.hide()
	$L_grass.show()
	$AnimationPlayer.play("2")

	if count == 2:
		hide()
		get_tree().change_scene_to_file("res://Main_world/main_world.tscn")
