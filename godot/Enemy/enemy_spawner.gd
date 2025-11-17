extends Node3D


@export var enemy1 :PackedScene
@export var target :Node3D
@export var sun: Node3D
@onready var ray: RayCast3D = $RayCast3D_suncheck


var timer = 1


func _process(delta: float) -> void:
	ray.target_position = sun.global_position #* 350.0  # make ray long
	if ray.is_colliding():
		timer -= delta  * WorldData.gamespeed
		if timer <= 0.0:
			Spawn(1)
			reset_timer()  # Reset timer after each spawn

func reset_timer():
	timer = randf_range(5.0 - WorldData.wave_number, 6.0 - WorldData.wave_number)  # rand_range returns a float

func Spawn(id):
	if id == 1:
		var ne = enemy1.instantiate()
		#ne.target = target
		ne.sun = sun
		add_child(ne) 
		ne.global_position = choose_pos()

		
func choose_pos():
	var x = global_position.x + randf_range(-$Area3D/CollisionShape3D.shape.size.x/2,$Area3D/CollisionShape3D.shape.size.x/2)
	var z = global_position.z - randf_range(-$Area3D/CollisionShape3D.shape.size.z/2,$Area3D/CollisionShape3D.shape.size.z/2)
	
	return(Vector3(x,5,z))
