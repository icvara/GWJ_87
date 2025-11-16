extends State
class_name player_control
@export var move_speed : float = 3
@export var bumbing_jump: float = 110.0
@export var bumbing_time: float = 0.5
@export var landing_time: float = .3


@export var action_A : State
@export var action_B : State
@export var action_C : State

var dir = Vector3.ZERO
var current_bump_time: float
var current_landing_time: float

var isJumping = true

func Enter():
	print("hello?")
	current_bump_time = 0
	current_landing_time = landing_time
	isJumping = false
func Exit():
	pass
	
func Update_process(delta):
	current_bump_time -= delta
	
	if StateOwner.has_node("Sprites"):
		if current_landing_time <=0:
			if dir == Vector3(0,0,0) and StateOwner.is_on_floor():# and current_landing_time <= 0:
				#%Sprites.get_node(str(brain_owner.skin_ID)).play("idle")
				StateOwner.rpc("play_animation","idle")
	
			elif StateOwner.is_on_floor() == false:
				pass#brain_owner.rpc("play_animation","walk")

			elif dir != Vector3(0,0,0) and StateOwner.is_on_floor() and current_bump_time <= 0: # and isJumping == true and current_landing_time <= 0:
				if StateOwner.has_node("SFX"):
						StateOwner.rpc("play_sound","jump")	
				#%Sprites.get_node(str(brain_owner.skin_ID)).play("walk")
				StateOwner.rpc("play_animation","walk")

				current_bump_time = bumbing_time
				current_landing_time = landing_time
				isJumping = true
			
		else:
			if StateOwner.is_on_floor() and current_bump_time <= 0:
				isJumping = false
				if current_landing_time == landing_time:
					#%Sprites.get_node(str(brain_owner.skin_ID)).play("land")
					StateOwner.rpc("play_animation","land")
					print(multiplayer.get_unique_id())


				current_landing_time -= delta
		
		'if brain_owner.is_on_floor() == false:
			%Sprites.get_node(str(brain_owner.skin_ID)).play("walk")'
				
	#if brain_owner.is_on_floor() == false:# and isJumping:
	
	

func Update_physique_process(delta):
	
	#if StateOwner.is_multiplayer_authority() and StateOwner.is_screen_focus:		
		#dir = Vector3.ZERO
		dir.x = 0
		dir.z = 0 # = Vector3(0,0,0)
		if Input.is_action_pressed("move_forward"):				
			dir -= StateOwner.transform.basis.z
		if Input.is_action_pressed("move_backward"):
			dir += StateOwner.transform.basis.z
		if Input.is_action_pressed("move_left"):
			dir -= StateOwner.transform.basis.x
		if Input.is_action_pressed("move_right"):
			dir += StateOwner.transform.basis.x
		
		'if StateOwner.is_on_floor() and current_landing_time > 0 and isJumping == false:
			StateOwner.velocity.x = 0
			StateOwner.velocity.z = 0	
		else:'
		var normalised_dir = dir.normalized()
		StateOwner.velocity.x = normalised_dir.x * move_speed
		StateOwner.velocity.z = normalised_dir.z * move_speed
	
		'if StateOwner.velocity != Vector3(0,0,0):
			if current_bump_time > 0: 
				StateOwner.velocity.y = bumbing_jump * delta'
					


				
		'if Input.is_action_just_pressed("action_A"):
			if action_A:
				Change_state.emit(self,action_A)
		if Input.is_action_just_pressed("action_B"):
			if action_B:
				Change_state.emit(self,action_B)
		if Input.is_action_just_pressed("action_C"):
			if action_C:
				Change_state.emit(self,action_C)'
