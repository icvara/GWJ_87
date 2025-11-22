extends Node3D

@export var nav_region3d  : NavigationRegion3D
@export var colectable  : PackedScene

var nav_map 

var count = 1.

func _ready() -> void:
	nav_map = nav_region3d.get_navigation_map()

func _process(delta: float) -> void:
	count -= delta
	if count <0:
		count = 1
		spawn_on_nav()

func spawn_on_nav():
	var random_point = Vector3(
		randf_range(-20, 20),
		randf_range(0, 0),
		randf_range(-20, 20)
	)

	# Find the nearest navigable point on the NavMesh
	var nav_point = NavigationServer3D.map_get_closest_point(nav_map, random_point)

	spawn_object(nav_point)


func spawn_object(pos):
	var c = colectable.instantiate()
	c.position = pos
	add_child(c)
	
