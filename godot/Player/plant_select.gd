extends ColorRect

var player: Node3D

func _ready() -> void:
		player = get_parent().get_parent()
		changeColor(player.plant_selected )
		$Label.text = str(player.plant_amount[player.plant_selected ])

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("change_left"):
		player.plant_selected = clamp(player.plant_selected-1,0,2)
		changeColor(player.plant_selected )
	if Input.is_action_just_pressed("change_right"):
		player.plant_selected = clamp(player.plant_selected+1,0,2)	
		changeColor(player.plant_selected )	
	$Label.text = str(player.plant_amount[player.plant_selected ])


func changeColor(ID):
	if ID == 0:
		modulate = Color(0.0, 0.356, 0.0, 1.0)
	elif ID == 1:
		modulate = Color(0.4, 0.161, 0.918, 1.0)
	elif ID == 2:
		modulate = Color(0.452, 0.039, 0.228, 1.0)
