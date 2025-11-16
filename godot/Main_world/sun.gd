extends Node3D


@export var target = Vector3(0,0,0)


var center = Vector3(0, 0,0)
var radius = 20
var speed = 1.1   # radians per second
var angle = 0.0

func _process(delta: float) -> void:
	speed = 0.1 * WorldData.gamespeed
	angle += speed * delta
	var z = cos(angle) * radius
	var y = sin(angle) * radius
	global_transform.origin = center + Vector3(0, y, z)
	look_at(center)
	$DirectionalLight3D.look_at(center)
