extends State
class_name state_idle


var detection_distance = 500.
@export var new_state_A: State
@export var new_state_B: State

func Enter():
	StateOwner.get_node("Debug").text = "idle"
	pass
	
func Exit():
	pass
	
func Update_process(delta):
	if find_closest():
		StateOwner.target =  find_closest()
		Change_state.emit(self, new_state_A)


func Update_physique_process(delta):
	pass


func find_closest():
	if StateOwner.detect_array.is_empty():
		return null

	var closest: Node3D = null
	var closest_dist := INF
	var origin = StateOwner.global_position    # or any point you want

	for obj in StateOwner.detect_array:
		if !is_instance_valid(obj):
			continue
		var dist = origin.distance_to(obj.global_position)
		if dist < closest_dist:
			closest_dist = dist
			closest = obj

	return closest	
