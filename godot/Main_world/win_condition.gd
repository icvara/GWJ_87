extends Node3D

var count = 0
var maxcount = 3

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Player2D3D":
		if body.item >0 :
			count += 1
			body.item -= 1
			$Label3D.text = str(count) + "/" + str(maxcount)
			#$CanvasLayer/Panel/Label.text = "Bring " + str(count) + " objects"
			if count >= maxcount :
				$CanvasLayer/Panel/Label.text = "You Win"
				$CanvasLayer.show()
				get_tree().paused = true

			#$CanvasLayer.show()
		



func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.name == "Player2D3D":
		$CanvasLayer.hide()
