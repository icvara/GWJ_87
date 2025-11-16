extends CharacterBody3D

@export var  target : Node3D

func _physics_process(delta: float) -> void:
		if not is_on_floor():
				velocity.y -= WorldData.gravity * delta	
		move_and_slide()
		#print(velocity)
