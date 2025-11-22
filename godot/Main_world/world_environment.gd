extends WorldEnvironment
@export var sun: Node3D


func _process(delta: float) -> void:
	var f = get_light_factor()
	if f > 0 :
		environment.set_bg_energy_multiplier(f)
	else :
		environment.set_bg_energy_multiplier(0)


	
	

func get_light_factor():
	#var sun_angle = sun.angle.x
	#if sun_angle > 0:
		#sun_angle
		#pass
	var elevation_angle = atan2(sun.global_transform.origin.y - sun.center.y, sun.global_transform.origin.z - sun.center.z)
	var elevation_deg = rad_to_deg(elevation_angle)
	var light_factor = sin(elevation_angle)
	return(light_factor)
