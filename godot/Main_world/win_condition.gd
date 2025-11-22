extends Node3D

var count = 0
var maxcount = 1
@export var initial_maxcount = 1

func _ready():
	maxcount = initial_maxcount

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Player2D3D":
		if body.item >0 :
			count += body.item
			body.item = 0
			$Label3D.text = str(count) + "/" + str(maxcount)
			WorldData.wave_number += 1
			#$CanvasLayer/Panel/Label.text = "Bring " + str(count) + " objects"
			if count >= maxcount :
				#$CanvasLayer/Panel/Label.text = "You Win"
				#$CanvasLayer.show()
				#get_tree().paused = true
				print("text u win")
				maxcount += initial_maxcount
				$Area3D/CollisionShape3D.scale*=1.1
				grow_sprite()
			#$CanvasLayer.show()

func grow_sprite():
	var factor = (maxcount+initial_maxcount)/maxcount

	# Save previous height (assuming the pivot is at the center)
	var old_height = $Sprite3D.scale.y

	# Scale the sprite
	$Sprite3D.scale *= factor

	# New height
	var new_height = $Sprite3D.scale.y

	# Move up by half the height increase (centered pivot)
	$Sprite3D.position.y += (new_height - old_height) / 2.0



func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.name == "Player2D3D":
		$CanvasLayer.hide()
