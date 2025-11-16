extends CharacterBody3D

@export var  target : Node3D
@export var sun: DirectionalLight3D
@onready var ray: RayCast3D = $CollisionShape3D/RayCast3D_suncheck
var is_dead = false

func _physics_process(delta: float) -> void:
		if is_dead or sun == null:
			return
	# Aim ray towards the sun
		var sun_dir = -sun.global_transform.basis.z
		ray.target_position = sun_dir * 350.0  # make ray long
		if ray.is_colliding():
			die_from_sunlight()
			#var obj = ray.get_collider()
			## If something blocks the sun (like a roof), zombie survives
			#if obj.is_in_group("SunBlocker"):
				#return
	## If nothing is blocking → sunlight hits zombie
			#else :
				#die_from_sunlight()
		if not is_on_floor():
				velocity.y -= WorldData.gravity * delta	
		move_and_slide()
		#print(velocity)

func die_from_sunlight():
	#is_dead = true
	print("Zombie died from sunlight!")
	#queue_free()
