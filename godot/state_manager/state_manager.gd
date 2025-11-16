extends Node
class_name state_manager


@onready var StateOwner = get_parent()
var current_state: State
@export var initial_state: State
var initialised: bool = false

func _ready() -> void:	
	if not initialised:
		current_state = initial_state
		for state in get_children():
			state.Change_state.connect(on_state_transition)
			state.StateOwner = StateOwner
		initialised = true
				
func _process(delta: float) -> void:
	if current_state:
		current_state.Update_process(delta)
	
func _physics_process(delta: float) -> void:
	if current_state:
		current_state.Update_physique_process(delta)
		#current_state.rpc_id(1, "Update_physique_process", delta)
		#print(brain_owner.velocity)
	
func on_state_transition(state,new_state):
	if state != current_state:
		return
	if !new_state:
		return	
	if current_state:
		current_state.Exit()
	new_state.Enter()
	current_state = new_state
	
