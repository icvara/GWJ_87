extends State
class_name state_going_to


var detection_distance = 500.
var speed = 300
var acceleration = 5  
var target_position

@export var new_state_A: State
@export var new_state_B: State
@export var NavAgent: NavigationAgent3D


func Enter():
	StateOwner.get_node("Debug").text = "goingto"
	target_position = StateOwner.target.global_transform.origin
	NavAgent.set_target_position(target_position)

	pass
	
func Exit():
	StateOwner.velocity = Vector3.ZERO
	
func Update_process(delta):
	pass
	speed += acceleration * delta

func Update_physique_process(delta):
		if StateOwner.target:
			var dir = Vector3.ZERO
			'dir = (StateOwner.target.global_transform.origin - StateOwner.global_transform.origin)
			dir.y = 0 # ignore vertical difference
			dir = dir.normalized()
			StateOwner.velocity.x = dir.x * speed * delta
			StateOwner.velocity.z = dir.z * speed * delta'
			
			var destination = NavAgent.get_next_path_position()
			var local_destination = destination - (StateOwner.global_position )
			dir.x = local_destination.normalized().x
			dir.z = local_destination.normalized().z
			StateOwner.velocity.x = dir.x * speed * delta
			StateOwner.velocity.z = dir.z * speed * delta
			if target_position != StateOwner.target.global_transform.origin:
				NavAgent.set_target_position(StateOwner.target.global_transform.origin)

			#print(brain_owner.global_transform.origin.distance_to(target.global_transform.origin))
			#turn here
			#StateOwner.look_at(Vector3(StateOwner.target.global_position.x, StateOwner.target.global_position.y, StateOwner.target.global_position.z))
			if StateOwner.global_transform.origin.distance_to(StateOwner.target.global_transform.origin) < 1:
				pass
				print("touched")
				StateOwner.target.HP = clamp(StateOwner.target.HP-20,0,100)
				StateOwner.queue_free()
				#get_parent().get_node("Player2D3D/Death_interface").show()
				#Change_state.emit(self, new_state_A)
			if StateOwner.global_transform.origin.distance_to(StateOwner.target.global_transform.origin) > detection_distance:
				#print("toofar")
				speed = 100
				Change_state.emit(self, new_state_A) 
		else:
			speed = 100
			Change_state.emit(self, new_state_A)
