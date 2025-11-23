extends CanvasLayer



func looting(v1,v2):
	if v1 > 0 and v2 == 0:
		$Label.text = "+ " + str(v1)
		$Label.show()
		$AnimationPlayer.play("1")
	if v2 > 0 and v1 ==0:
		$Label2.text = "+ " + str(v2)
		$Label2.show()
		$AnimationPlayer.play("2")
	if v2 > 0 and v2 > 0:
		$Label2.text = "+ " + str(v2)
		$Label.text = "+ " + str(v1)
		$AnimationPlayer.play("3")
