extends Node3D

@export var nav_region3d  : NavigationRegion3D
@export var colectable  : PackedScene
@export var sun : Node3D
var nav_map 

var count = .5

func _ready() -> void:
	nav_map = nav_region3d.get_navigation_map()

func _process(delta: float) -> void:
	count -= delta
	if count <0:
		count = 0.5
		spawn_on_nav()

func spawn_on_nav():
	var random_point = Vector3(
		randf_range(-12, 12),
		randf_range(0, 0),
		randf_range(-12, 12)
	)

	# Find the nearest navigable point on the NavMesh
	var nav_point = NavigationServer3D.map_get_closest_point(nav_map, random_point)

	spawn_object(nav_point)


func spawn_object(pos):
	var c = colectable.instantiate()
	c.position = pos
	c.position.y = 8
	add_child(c)


func sun_detect():		
	$RayCast3D.target_position = sun.global_position #* 350.0  # make ray long
	if $RayCast3D.is_colliding() == false:
		return true
	else:
		return false

		
