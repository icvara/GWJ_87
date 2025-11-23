extends Node3D

var cam: Camera3D

func _ready() -> void:
	cam = get_viewport().get_camera_3d()


func _process(delta: float) -> void:
	pass
	#look_at(cam.global_position)
	#rotation.x = 0
	#rotation.z = 0
	#print(cam.global_position)
