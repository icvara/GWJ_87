extends Node3D

var timer = 10

func _process(delta: float) -> void:
	timer -= delta
	if timer < 0:
		Die()


func Die():
	queue_free()
	

	


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Zombie") :
		body.die_from_sunlight()
