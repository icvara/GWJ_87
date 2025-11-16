extends DirectionalLight3D

@export var rotation_step_degrees: float = 3     # how much to rotate each tick
var timer := 0.0
var sun_direction = -global_transform.basis.z

func _process(delta):
	timer += delta
	if timer >= 0.1:   # every 1/10 second
		rotate_x(deg_to_rad(rotation_step_degrees))
		timer = 0.0
