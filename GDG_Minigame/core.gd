extends Area2D
@export var rigid: Resource

func _ready():
	pass

func _process(delta):
	pass

#q = quadrant, expects 0 <= int <= 3
func spawn_projectile(q):
	#should calculate a position and direction
	var r = $CollisionShape2D.shape.radius + 25
	# (90*q + 45)*PI
	var theta = randf_range(0,360)*PI
	var x = r * cos(theta/180)
	var y = r * sin(theta/180)
	var rigidBody = rigid.instantiate()
	rigidBody.set_global_transform(Transform2D(theta,Vector2(x,y)))
	add_child(rigidBody)
	rigidBody.apply_central_impulse(Vector2(x,y))

func _on_timer_timeout():
	spawn_projectile(randi_range(0,3))
	#$Timer.wait_time = randf_range(1.5,2.5)

func _on_perimeter_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	print(area)
