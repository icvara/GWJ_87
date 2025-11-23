extends Label


func _process(delta: float) -> void:
	if str(get_parent().get_parent().item) == "20":
		modulate = Color(1,0,0)
		self.scale = Vector2(2,2)
		print(self)
		text = "You have 20/20 items, get it back to the Sunflower!"
	else :
		modulate = Color(1,1,1)
		self.scale = Vector2(1,1)
		print(self)
		text = "You have "  + str(get_parent().get_parent().item) + "/20 Items"
