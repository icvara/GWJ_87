extends RigidBody3D


#func _on_body_entered(body: Node3D) -> void:


func _on_area_3d_body_entered(body: Node3D) -> void:
	#print(body.name)
	if body.name == "Player2D3D":
		if body.item < body.max_item :
			body.item += 1
		body.HP = clamp(body.HP+15,0.,100.)
		body.get_node("music").get_node("Collect_object").play()
		WorldData.currentfire-=1
		queue_free()

		
