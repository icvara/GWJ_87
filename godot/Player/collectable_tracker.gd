extends Label


func _process(delta: float) -> void:
	if str(get_parent().get_parent().item) == "20":
		modulate = Color(1,0,0)
		text = "You have 20/20 items!"
		$AnimationPlayer.play("new_animation")

	else :
		modulate = Color(1,1,1)
		self.scale = Vector2(1,1)
		#$AnimationPlayer.play("new_animation")
		$AnimationPlayer.stop()

	text = "["  + str(get_parent().get_parent().item) + "/20]"
