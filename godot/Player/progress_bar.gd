extends ProgressBar

var isNight = 0
@export var player : Node3D

func _ready() -> void:
	player = get_parent().get_parent()
	modulate = Color(1,0,0)
	value = 100
	
	
func _process(delta: float) -> void:
	value = player.HP

		
