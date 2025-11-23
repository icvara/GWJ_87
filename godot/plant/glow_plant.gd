extends Node3D

var timer = 10
var sun= Node3D
var value = 0.0
var hasgrown = false
var HP = 3
@export var day_night : Node3D

func _process(delta: float) -> void:

	$RayCast3D.target_position = sun.global_position #* 350.0  # make ray long
	
	if $RayCast3D.is_colliding() == false:
		if value < 10 and hasgrown== false:
			$Label3D.show()
			value += delta
			#$Label3D.text = str(int(value)*10) 
			loading_bar_update(int(value))

		elif value >= 10 and hasgrown== false :
			add_to_group("light")
			hasgrown = true
			$grow.play()

			$Label3D.hide()
			$s1.show()
			$s2.show()
			$s3.show()
			#$AnimatedSprite3D.play("default")
	else :
		$Label3D.hide()
func Die():
	queue_free()
	

func loading_bar_update(v):
	if v == 0:
		$Label3D.text = "[□□□□□]"
	if v == 2:
		$Label3D.text = "[■□□□□]"
	if v == 4:
		$Label3D.text = "[■■□□□]"
	if v == 6:
		$Label3D.text = "[■■■□□]"
	if v == 8:
		$Label3D.text = "[■■■■□]"
	if v == 10:
		$Label3D.text = "[■■■■■]"

func remove_plant():
	if HP == 2:
			$s1.hide()

	if HP == 1:
			$s2.hide()
	

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Zombie"):
		if hasgrown:
			body.die_from_sunlight()
			
			HP -= 1
			remove_plant()
			if HP <0 :
				queue_free()
