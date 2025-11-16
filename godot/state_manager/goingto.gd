extends State
class_name state_going_to


var detection_distance = 5.
var speed = 100
var acceleration = 5  

@export var new_state_A: State
@export var new_state_B: State

func Enter():
	StateOwner.get_node("Debug").text = "goingto"
	speed = 100
	pass
	
func Exit():
	StateOwner.velocity = Vector3.ZERO
	
func Update_process(delta):
	pass
	speed += acceleration * delta

func Update_physique_process(delta):
		if StateOwner.target:
			var dir = Vector3.ZERO
			dir = (StateOwner.target.global_transform.origin - StateOwner.global_transform.origin)
			dir.y = 0 # ignore vertical difference
			dir = dir.normalized()
			StateOwner.velocity.x = dir.x * speed * delta
			StateOwner.velocity.z = dir.z * speed * delta

			#print(brain_owner.global_transform.origin.distance_to(target.global_transform.origin))
			#turn here
			#StateOwner.look_at(Vector3(StateOwner.target.global_position.x, StateOwner.target.global_position.y, StateOwner.target.global_position.z))
			if StateOwner.global_transform.origin.distance_to(StateOwner.target.global_transform.origin) < 1:
				pass
				print("touched")
				#get_parent().get_node("Player2D3D/Death_interface").show()
				#Change_state.emit(self, new_state_A)
			if StateOwner.global_transform.origin.distance_to(StateOwner.target.global_transform.origin) > detection_distance:
				#print("toofar")
				speed = 100
				Change_state.emit(self, new_state_A) 
		else:
			speed = 100
			Change_state.emit(self, new_state_A)
