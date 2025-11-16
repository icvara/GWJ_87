extends CharacterBody3D

@export var  target : Node3D
@export var sun: Node3D
@onready var ray: RayCast3D = $RayCast3D_suncheck
var condition_time = 0 
var is_dead = false

func _physics_process(delta: float) -> void:
		#print(rotation)
		if is_dead or sun == null:
			return

		ray.target_position = sun.global_position #* 350.0  # make ray long
		if ray.is_colliding() == false:
			condition_time += delta  # Add time the condition has been true
			$AnimatedSprite3D.modulate = Color(0.0, 0.741, 0.0, 1.0)

			if condition_time >= 5:
				die_from_sunlight()

		else:
			$AnimatedSprite3D.modulate = Color(1.0, 1.0, 1.0, 1.0)
			
		if not is_on_floor():
			velocity.y -= WorldData.gravity * delta	
		move_and_slide()
		#print(velocity)

func die_from_sunlight():
	is_dead = true
	queue_free()
