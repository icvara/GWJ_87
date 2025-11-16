extends State
class_name state_idle


var detection_distance = 5.
@export var new_state_A: State
@export var new_state_B: State

func Enter():
	pass
	
func Exit():
	pass
	
func Update_process(delta):
	if StateOwner.target:
		if StateOwner.position.distance_to(StateOwner.target.position)< detection_distance:
			print("close")
			Change_state.emit(self, new_state_A)

	pass

func Update_physique_process(delta):
	pass
