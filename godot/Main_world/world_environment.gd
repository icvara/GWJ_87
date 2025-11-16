extends WorldEnvironment


func _process(delta: float) -> void:
	pass
	$RayCast3D.target_position = %Sun.global_position #* 350.0  # make ray long
	if $RayCast3D.is_colliding() == false:
		print("here")
		environment.set_volumetric_fog_density(0)
	else: 
		environment.set_volumetric_fog_density(0.25)
