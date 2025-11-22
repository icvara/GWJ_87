extends Node3D


var HP_campfire = 100
var maxHP_campfire = 100
var health_decrease_rate := 5.0  # HP per second

func _ready():
	pass
	
func _physics_process(delta: float) -> void:
	if HP_campfire > 0:
		HP_campfire -= health_decrease_rate * delta
		HP_campfire = max(HP_campfire, 0)  # prevent going below 0
		print(HP_campfire)
	if HP_campfire <0 or HP_campfire == 0:
		death()
		
func death() :
	queue_free()
