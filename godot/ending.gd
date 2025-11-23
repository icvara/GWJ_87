extends Node3D

var count = 0 

func start() -> void:
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
	$Camera3D.make_current()
=======
>>>>>>> Stashed changes
	$AnimationPlayer.play("transition")
	await get_tree().create_timer(1.0).timeout
	if count == 0:
		$CanvasLayer/Panel.show()
<<<<<<< Updated upstream
		$CanvasLayer/Panel/Button.grab_focus()
		$CanvasLayer/Panel/Label.text = "Yeeees, Finally!!!!! Thank You little Sun"
		$AnimationPlayer.play("text1")
		await get_tree().create_timer(1.0).timeout
		
=======
		$CanvasLayer/Panel/Label.text = "Yeeees, Finally!!!!! Thank You little Sun"
		$AnimationPlayer.play("text1")
		await get_tree().create_timer(1.0).timeout
>>>>>>> Stashed changes
		$CanvasLayer/Panel/Label.visible_ratio = 0.0


	#$AnimationPlayer.play("text1" )

func _ready() -> void:
	start()


func _on_button_pressed() -> void:
		count += 1
		if count == 1:
			$Sprite3D.show()
			$Sprite3D2.hide()	
			$CanvasLayer/Panel/Label.text = "I AM THE NEW SUPREME BEING!!!!! \n HAHAHAHAHAHAHA"
			$AnimationPlayer.play("Fly")
		if count == 2:
			$AnimationPlayer.play("transition2")
			await get_tree().create_timer(1.0).timeout
			get_tree().change_scene_to_file("res://Menus/endscreen.tscn")
<<<<<<< Updated upstream
=======
>>>>>>> parent of 5c0c5bf (ending)
>>>>>>> Stashed changes
