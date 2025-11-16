extends Node3D

var timer = 10

func _process(delta: float) -> void:
	timer -= delta
	if timer < 0:
		Die()


func Die():
	queue_free()
	

	
