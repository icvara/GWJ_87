extends SpringArm3D

@export var camera_speed: float = 0.05
@export var zoom_speed: float = 0.1
@export var mouse_sensitivity: float = 0.001

var yaw: float = 0.
var yaw_camera: float = 0.

var pitch: float = 0.
				
func _process(delta: float) -> void:
	#if get_parent().is_multiplayer_authority() and 
	if get_parent().is_screen_focus:
		
		#CONTROLLER
		var joy_id = 0  # Player 1
		var look_x = Input.get_action_strength("look_right") - Input.get_action_strength("look_left")
		var look_y = Input.get_action_strength("look_down") - Input.get_action_strength("look_up") 
		if abs(look_x) < 0.1:
			look_x = 0
		if abs(look_y) < 0.1:
			look_y = 0

		#MOUSE
		look_x += Input.get_last_mouse_velocity().x * mouse_sensitivity
		look_y += Input.get_last_mouse_velocity().y * mouse_sensitivity
		
		#rotation
		yaw -= look_x * camera_speed
		pitch -= look_y * camera_speed
		if sign(spring_length) >0:
			pitch = clamp(pitch, deg_to_rad(-80), deg_to_rad(0))	
		else:
			pitch = clamp(pitch, deg_to_rad(0), deg_to_rad(80))	
		if get_parent().velocity != Vector3.ZERO:
			#MOVING
			#get_parent().rotation = Vector3(0 , yaw_player, 0)
			#rotation = Vector3(pitch, 0, 0)
			get_parent().rotation.y = yaw

			rotation.x = pitch
			rotation.y = 0
			yaw_camera = 0

		else:
			#standing_freecamera
			yaw_camera -= look_x * camera_speed
			rotation.x = pitch
			rotation.y = yaw_camera
						
		#ZOOM
		if Input.is_action_pressed("zoom_in"):
			spring_length -= zoom_speed
		if Input.is_action_pressed("zoom_out"):
			spring_length += zoom_speed
		
		spring_length = clamp(spring_length,-0.01,50)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			spring_length -= zoom_speed * 2
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			spring_length += zoom_speed *  2
