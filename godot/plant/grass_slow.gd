extends Node3D

var timer = 5
var sun= Node3D
var value = 0.0
var hasgrown = false
var HP = 5

func _process(delta: float) -> void:
	#timer -= delta
	#if timer < 0:
		#Die()
		
	$RayCast3D.target_position = sun.global_position #* 350.0  # make ray long
	if $RayCast3D.is_colliding() == false:
		if value < 5 and hasgrown== false:

			value += delta
			$Label3D.text = str(int(value)*10) 
		elif value >= 5 and hasgrown== false :
			
			hasgrown = true
			$MultiMeshInstance3D.show()

func Die():
	queue_free()
	




func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Zombie"):# or body.name == "Player2D3D":
		if hasgrown:
			body.speedmodifier= 0.2



func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("Zombie"):# or body.name == "Player2D3D":
		body.speedmodifier= 1
		HP -= 1
		position.y -= 0.1
		if HP <0 :
			Die()
