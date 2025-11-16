extends CanvasLayer

@onready var resume_button = $Panel/VBoxContainer/Resume
@onready var quit_button = $Panel/VBoxContainer/QuitGame

var isPaused = false

func _ready():
	visible = false
	resume_button.pressed.connect(_on_resume_pressed)
	quit_button.pressed.connect(_on_quit_pressed)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("open_menu") and isPaused == true:
		close_menu()
	elif Input.is_action_just_pressed("open_menu") and isPaused == false : 
		print("ddd")
		open_menu()
	
func open_menu():
	#visible = true
	isPaused = true
	show()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().paused = true

func close_menu():
	hide()
	#visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	isPaused = false
	get_tree().paused = false

func _on_resume_pressed():
	close_menu()
	get_tree().paused = false

func _on_quit_pressed():
	get_tree().quit()
