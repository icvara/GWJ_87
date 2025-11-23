extends Node3D


func _ready() -> void:
	$CanvasLayer/AnimationPlayer.play("transition")
