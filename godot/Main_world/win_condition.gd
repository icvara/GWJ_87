extends Node3D

var count = 4

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Player2D3D":
		count -= 1
		body.item -= 1
		$CanvasLayer/Panel/Label.text = "Bring " + str(count) + " objects"
		if count <0 :
			$CanvasLayer/Panel/Label.text = "You Win"
			$CanvasLayer.show()
			get_tree().paused = true

		$CanvasLayer.show()
		



func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.name == "Player2D3D":
		$CanvasLayer.hide()
