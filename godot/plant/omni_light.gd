extends OmniLight3D



func _process(delta: float) -> void:
		position.x += 1. * 0.2 * sin(Time.get_ticks_msec()* 5)
