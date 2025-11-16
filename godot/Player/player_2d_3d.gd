extends CharacterBody3D

var gravi

var is_screen_focus = true
var win = false
@export var plant : PackedScene

func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int(), true)
	#set_multiplayer_authority(multiplayer.get_unique_id(), true)



func _ready():
	#if is_multiplayer_authority():
		#camera =%top_view_camera
		%Camera3D.make_current()
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
		#skin_ID = randi_range(0,2)
		#%Sprites.get_node(str(skin_ID)).show()
		
		#get_window().focus_entered.connect(_on_window_focus_entered)
		#get_window().focus_exited.connect(_on_window_focus_exited)

func _physics_process(delta: float) -> void:
	#if is_multiplayer_authority():		
		if not is_on_floor():
				velocity.y -= WorldData.gravity * delta
				#print(velocity.y )
		
		move_and_slide()
	

func _process(delta: float) -> void:
	if is_multiplayer_authority():
		pass
		'if WorldInfo.win:	
			if win:
				$CanvasLayer/Panel/Label.text = "You win!"
			else:
				$CanvasLayer/Panel/Label.text = "You loose"
			$CanvasLayer/Panel.show()'
		
		#get_parent().get_parent().get_node("grass").get_node("MultiMeshInstance3D").get_multimesh().get_mesh().get_material().set_shader_parameter("player_pos",global_position)

'func _on_window_focus_entered() -> void:
	AudioServer.set_bus_mute(0, false)
	print("out")

func _on_window_focus_exited() -> void:
	AudioServer.set_bus_mute(0, true)
	print("in")'

func _notification(what):
	match what:
		MainLoop.NOTIFICATION_APPLICATION_FOCUS_OUT:
			is_screen_focus = false
			#Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		MainLoop.NOTIFICATION_APPLICATION_FOCUS_IN:
			#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			is_screen_focus = true

@rpc("any_peer","call_local")
func play_sound(sound_name):
	#print(sound_name)
	#sound_name.play()
	%SFX.get_node(sound_name).play()

@rpc("any_peer","call_local","reliable")
func play_animation(anim_name):
	pass
	#%Sprites.get_node(str(skin_ID)).play(anim_name)

@rpc("any_peer","call_local")
func play_animation_1(anim_name):
	pass
	#print(sound_name)
	#sound_name.play()
	#%Sprites.get_node(str(skin_ID)).play(anim_name)





func _on_button_pressed() -> void:
	var bus_idx = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(bus_idx, true)
