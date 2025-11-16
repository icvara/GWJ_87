extends ProgressBar

var isNight = 0


func _ready() -> void:
	modulate = Color(1,0,0)
	value = 100
func _process(delta: float) -> void:
	print(value)
	value -= delta * 10
	if value <= 0 :
		isNight =abs(isNight) - 1
		if isNight == 0 :
			modulate = Color(1,0,0)
		else:
			modulate = Color(0,0,1)
		value = 100
		
