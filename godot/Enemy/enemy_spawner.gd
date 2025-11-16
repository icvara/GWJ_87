extends Node3D


@export var enemy1 :PackedScene
@export var target :Node3D
@export var sun: Node3D



var timer = 1


func _process(delta: float) -> void:
	if WorldData.isNight != 0 :
		timer -= delta
		if timer <=0 : 
			Spawn(1)
			timer = randi_range(2,3)



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
