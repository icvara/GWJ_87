extends Node3D

var timer = 10
var sun= Node3D
var value = 0.0
var hasgrown = false

func _process(delta: float) -> void:
	#timer -= delta
	#if timer < 0:
		#Die()
		
	$RayCast3D.target_position = sun.global_position #* 350.0  # make ray long
	if $RayCast3D.is_colliding() == false:
		if value < 1 and hasgrown== false:

			value += delta
			$Label3D.text = str(int(value)*10) 
		elif value >= 1 and hasgrown== false :
			hasgrown = true
			position.y = 0.5

func Die():
	queue_free()
	



func _on_body_entered(body: Node3D) -> void:
	print(body.name)
	if body.is_in_group("Zombie") or body.name == "Player2D3D":
		if hasgrown:
			print("hello?")
			body.velocity.y = 50
