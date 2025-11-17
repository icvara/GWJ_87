extends Label


func _process(delta: float) -> void:
	text = "You have "  + str(get_parent().get_parent().item) + " Items"
