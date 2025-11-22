extends CharacterBody3D

@export var  target : Node3D
@export var sun: Node3D
@onready var ray: RayCast3D = $RayCast3D_suncheck
var condition_time = 0 
var is_dead = false
var speedmodifier = 1.0

func _physics_process(delta: float) -> void:
		#print(rotation)
		
		if sun:
			ray.target_position = sun.global_position #* 350.0  # make ray long
			if ray.is_colliding() == false:
				condition_time += delta * WorldData.gamespeed  # Add time the condition has been true
				$AnimatedSprite3D.modulate = Color(0.0, 0.741, 0.0, 1.0)

				if condition_time >= 5:
					die_from_sunlight()
			
			else:
				$AnimatedSprite3D.modulate = Color(1.0, 1.0, 1.0, 1.0)
				
		if not is_on_floor():
			velocity.y -= WorldData.gravity * delta	 
		velocity = velocity *speedmodifier
		move_and_slide()
		#print(velocity)

func die_from_sunlight():
	is_dead = true
	get_node("music").get_node("die").playing = true

	queue_free()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("light"):
		target = body
