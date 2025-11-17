extends Node3D

var timer = 10
var sun= Node3D
var value = 0.0
var hasgrown = false
var HP = 3

func _process(delta: float) -> void:
	#timer -= delta
	#if timer < 0:
		#Die()
		
	$RayCast3D.target_position = sun.global_position #* 350.0  # make ray long
	if $RayCast3D.is_colliding() == false:
		if value < 10 and hasgrown== false:

			value += delta
			$Label3D.text = str(int(value)*10) 
		elif value >= 10 and hasgrown== false :
			add_to_group("light")
			hasgrown = true
			$AnimatedSprite3D.play("default")

func Die():
	queue_free()
	




func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Zombie"):
		if hasgrown:
			body.die_from_sunlight()
			HP -= 1
			if HP <0 :
				queue_free()
