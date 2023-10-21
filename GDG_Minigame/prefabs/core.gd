extends Area2D
@onready var projectile_pf = preload("res://prefabs/projectile.tscn")

func spawn_projectile():
	var projectile = projectile_pf.instantiate()
	add_child(projectile)
	var dist = 150
	var speed = 500 # Speed
	var theta = randf_range(0, 2) * PI # Angle
	var x = cos(theta)
	var y = sin(theta)
	projectile.set_global_transform(Transform2D(theta, Vector2(x * dist, y * dist) + self.position))
	projectile.apply_central_impulse(Vector2(x * speed, y * speed))

func _on_timer_timeout():
	spawn_projectile()
	#$Timer.wait_time = randf_range(1.5,2.5)


func _on_perimeter_body_exited(body):
	body.perimeter_impact()
