extends Node3D


func _ready() -> void:
	$CanvasLayer/AnimationPlayer.play("transition")
	WorldData.maxfire = 10000000
	WorldData.currentfire = 0.0
