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
	timer = randf_range(2.0, 3.0)  # rand_range returns a float

func Spawn(id):
	if id == 1:
		var ne = enemy1.instantiate()
		ne.target = target
		ne.sun = sun
		ne.position = choose_pos()
		add_child(ne) 
		
func choose_pos():
	#print($Area3D/CollisionShape3D.shape.size)
	var x = randf_range(0,$Area3D/CollisionShape3D.shape.size.x)
	var z = randf_range(0,$Area3D/CollisionShape3D.shape.size.z)

	return(Vector3(x,1,z))
