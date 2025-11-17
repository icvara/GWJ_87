extends Area3D


func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player2D3D":
		body.item += 1
		queue_free()
