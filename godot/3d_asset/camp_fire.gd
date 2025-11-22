extends Node3D


var HP_campfire = 100.0
var maxHP_campfire = 100.0
var health_decrease_rate = 20.0  
var time_before_decay = 2.0
var timer = 0.0
var max_brightness = 5.0
var min_brightness = 0.2
var flicker_amount = 0.2
var speed = 0.5

func _ready():
	pass
	
func _physics_process(delta: float) -> void:
	timer +=delta
	if time_before_decay <= timer:
		if HP_campfire > 0:
			HP_campfire -= health_decrease_rate 
			HP_campfire = max(HP_campfire, 0)  # prevent going below 0
			print(HP_campfire)
			timer = 0
	if HP_campfire <0 or HP_campfire == 0:
		death()
		
	var health_ratio = HP_campfire / maxHP_campfire
	$OmniLight3D.light_energy = lerp(min_brightness, max_brightness, health_ratio)+ sin(Time.get_ticks_msec() * 0.01 * speed) * flicker_amount *randf_range(1,1.5)
	#self.omni_range = 2 + lerp(min_brightness, max_brightness, health_ratio)

func death() :
	queue_free()
