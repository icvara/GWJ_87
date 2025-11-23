extends Node3D

var count = 0 

func start() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	$AnimationPlayer.play("transition")
	await get_tree().create_timer(1.0).timeout
	if count == 0:
		$CanvasLayer/Panel.show()

		$CanvasLayer/Panel/Button.grab_focus()
		$CanvasLayer/Panel/Label.text = "Yeeeessssssss, Finally!!!!! Thank You little Sun"
		$AnimationPlayer.play("text1")
		await get_tree().create_timer(1.0).timeout
		

		$CanvasLayer/Panel/Label.visible_ratio = 0.0


	#$AnimationPlayer.play("text1" )

func _ready() -> void:
	start()
	play_yes()


func _on_button_pressed() -> void:
		count += 1
		if count == 1:
			play_supreme()
			$Sprite3D.show()
			$Sprite3D2.hide()	
			$CanvasLayer/Panel/Label.text = "I AM THE NEW SUPREME BEING!!!!! \n HAHAHAHAHAHAHA"
			$AnimationPlayer.play("Fly")
		if count == 2:
			%sound.get_node("Yes").stop()
			%sound.get_node("Supreme").stop()
			$AnimationPlayer.play("transition2")
			await get_tree().create_timer(1.0).timeout
			get_tree().change_scene_to_file("res://Menus/endscreen.tscn")


func play_yes():
	%sound.get_node("Yes").stop()
	%sound.get_node("Supreme").stop()
	await get_tree().create_timer(1.0).timeout
	%sound.get_node("Yes").play()
	
func play_supreme():
	%sound.get_node("Yes").stop()
	%sound.get_node("Supreme").stop()
	await get_tree().create_timer(1.0).timeout
	%sound.get_node("Supreme").play()
	
