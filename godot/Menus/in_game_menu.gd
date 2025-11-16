extends CanvasLayer

@onready var resume_button = $Panel/VBoxContainer/Resume
@onready var quit_button = $Panel/VBoxContainer/QuitGame

func _ready():
	visible = false
	resume_button.pressed.connect(_on_resume_pressed)
	quit_button.pressed.connect(_on_quit_pressed)


func _process(delta: float) -> void:
	if Input.is_action_pressed("open_menu") and visible == false:
		open_menu()
	if Input.is_action_pressed("open_menu") and visible == true:
		close_menu()
func open_menu():
	visible = true
	get_tree().paused = true

func close_menu():
	visible = false
	get_tree().paused = false

func _on_resume_pressed():
	close_menu()
	get_tree().paused = false

func _on_quit_pressed():
	get_tree().quit()
