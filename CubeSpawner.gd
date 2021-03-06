extends Spatial

var cubeScene = preload("res://assets/TestCube.tscn")

func _ready():
	pass

func _on_SpawnButton_button_down():
	#spawner with random location, rotation and scale within area
	var cube_dist_spawn = 5
	var cube = cubeScene.instance()
	var cube_pos = Vector3(rand_range(-cube_dist_spawn, cube_dist_spawn), 0, rand_range(-cube_dist_spawn, cube_dist_spawn))
	var cube_rot = Vector3(0,1,0)
	
	var scale = rand_range(0.5,1.5)
	var cube_sca = Vector3(scale, scale, scale)
	
	
	add_child(cube)
	
	cube.global_translate(cube_pos)
	cube.global_rotate(cube_rot, rand_range(0,360))
	cube.global_scale(cube_sca)

	#random colors
	var new_color1 = Color(rand_range(0,1), rand_range(0,1), rand_range(0,1))
	var new_color2 = Color(rand_range(0,1), rand_range(0,1), rand_range(0,1))
		
	#for this not to change every cube together set in the material Inspector>Resource>Resource>Local to Scene (On)
	cube.get_child(0).get_surface_material(0).set_shader_param("Color1",new_color1)
	cube.get_child(0).get_surface_material(0).set_shader_param("Color2",new_color2)
