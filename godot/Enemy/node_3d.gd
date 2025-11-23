extends Node3D


func _process(delta: float) -> void:
	pass
	'var cam := get_viewport().get_camera_3d()
	if cam:
		look_at(cam.global_transform.origin, Vector3.UP)
		rotation.y = 0'
