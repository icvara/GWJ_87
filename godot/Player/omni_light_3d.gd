extends OmniLight3D

@export var player: Node3D        # Drag your player here in the editor

var max_brightness := 3.0
var min_brightness := 0.0  # how dim the light gets at 0 health
var base_energy = 3.0
var flicker_amount = 0.4
var speed = 0.5

func _process(delta):
	if player and ("HP") in player :
		var health_ratio = float(player.HP) / 100
		light_energy = lerp(min_brightness, max_brightness, health_ratio)+ sin(Time.get_ticks_msec() * 0.01 * speed) * flicker_amount *randf_range(1,1.5)
		self.omni_range = 2 + lerp(min_brightness, max_brightness, health_ratio)
			 # \+ randf() * 0.1
