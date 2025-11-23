extends Panel

var count = 0
var timer = 0
@export var collect : PackedScene

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	play_hello()
	
	$Button.grab_focus()
	$AnimationPlayer.play("cam0")
	await get_tree().create_timer(1.1).timeout

	$AnimationPlayer.play("text1")

func setText(dial):
	$Panel/Label.text = dial

func _process(delta: float) -> void:
	timer += delta
	if int(timer) % 2 == 0 :
		timer = 1
		var nc = collect.instantiate()
		nc.position = Vector3(randf_range(-5,5),0,randf_range(-5,5))
		%Sun.add_child(nc)

func _on_button_pressed() -> void:
	count += 1
	
	
	if count == 1:


		play_sun_dying()
		$Label.text = ""
		$AnimationPlayer.play("camera1")
		await get_tree().create_timer(1.0).timeout
		$Label.visible_ratio = 0.0
		$Label.text = "The Sun is dying"
		$AnimationPlayer.play("text1")

	if count == 2:


		play_bring_me()
		$Label.text = ""
		$AnimationPlayer.play("camera2")
		await get_tree().create_timer(1.0).timeout
		$Label.visible_ratio = 0.0
		$Label.text = "Bring me back its Fire, and I shall reward you."
		$AnimationPlayer.play("text2")
		for i in 10:

			await get_tree().create_timer(.1).timeout

	if count == 3:
		

		play_beware()
		$AnimationPlayer.play("cam3")
		$Label.text = ""
		await get_tree().create_timer(1.2).timeout
		$Label.visible_ratio = 0.0
		$Label.text = "Beware of the Night. I'll give you my seeds to survive the Darkness."
		$AnimationPlayer.play("text3")
		await get_tree().create_timer(1.5).timeout
		
	if count == 4:

		hide()
		%tuto.activate()


func play_hello():
	%voiceline.get_node("sun_dying").stop()
	%voiceline.get_node("Beware").stop()
	%voiceline.get_node("bring_me").stop()
	%voiceline.get_node("Hello").stop()
	await get_tree().create_timer(1.0).timeout
	%voiceline.get_node("Hello").play()
func play_sun_dying():
	%voiceline.get_node("sun_dying").stop()
	%voiceline.get_node("Beware").stop()
	%voiceline.get_node("bring_me").stop()
	%voiceline.get_node("Hello").stop()
	await get_tree().create_timer(1.0).timeout
	%voiceline.get_node("sun_dying").play()
func play_bring_me():
	%voiceline.get_node("sun_dying").stop()
	%voiceline.get_node("Beware").stop()
	%voiceline.get_node("bring_me").stop()
	%voiceline.get_node("Hello").stop()
	await get_tree().create_timer(1.0).timeout
	%voiceline.get_node("bring_me").play()
func play_beware():
	%voiceline.get_node("sun_dying").stop()
	%voiceline.get_node("Beware").stop()
	%voiceline.get_node("bring_me").stop()
	%voiceline.get_node("Hello").stop()
	await get_tree().create_timer(1.0).timeout
	%voiceline.get_node("Beware").play()
