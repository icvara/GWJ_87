extends Control

var count = 0
var isGame = false

func activate(bb = true):
	isGame = bb
	show()
	$Label.show()

	$Button.grab_focus()
	$AnimationPlayer.play("new_animation")

func _on_button_pressed() -> void:
	count +=1
	$AnimatedSprite3D.play("default")
	$Label.hide()
	$L_grass.show()
	$AnimationPlayer.play("2")

	if count == 2:
		count = 0
		hide()
		if isGame:
			#print("1")
			get_tree().change_scene_to_file("res://Main_world/main_world.tscn")
		else:
			$L_grass.hide()

			#print("1")
			#get_parent().close_menu()
			get_parent().locked = false
			get_parent().open_menu()
