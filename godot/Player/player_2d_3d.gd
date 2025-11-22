extends CharacterBody3D


var is_screen_focus = true
var win = false
var item = 0
@export var plant1 : PackedScene
@export var plant2 : PackedScene
@export var plant3 : PackedScene
@export var campfire : PackedScene

var plant_selected = 0
var plant_amount = []
@export var sun : Node3D
@export var player : Node3D

var plant_list = []
var speedmodifier = 1.0

var HP = 100

var sunrise_bool = false
var value = 0

func _enter_tree() -> void:
	plant_list = [plant1,plant2,plant3]
	plant_amount = [10,5,3]

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
		velocity = speedmodifier*velocity
		move_and_slide()
		if Input.is_action_just_pressed("space") and player:
			var campfire_instance = campfire.instantiate()
			get_tree().current_scene.add_child(campfire_instance)
			campfire_instance.position = self.position -Vector3(0,0.2,0)
func _process(delta: float) -> void:
	$RayCast3D.target_position = sun.global_position #* 350.0  # make ray long
	if $RayCast3D.is_colliding() == false:
		value += delta * WorldData.gamespeed
		if int(value) % 10 == 0:
			HP = clamp(HP + 10, 0 ,100)
			plant_amount[0] = clamp(plant_amount[0] + 1, 0 ,20)
			plant_amount[1] = clamp(plant_amount[1] + 1, 0 ,10)
			plant_amount[2] = clamp(plant_amount[2] + 1, 0 ,5)
			value = 1


	if HP <=0:
		$Death_interface.activate()

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
