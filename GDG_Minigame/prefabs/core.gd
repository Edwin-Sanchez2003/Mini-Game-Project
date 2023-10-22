extends Area2D
@onready var projectile_pf = preload("res://prefabs/projectile.tscn")

var health = 100

func spawn_projectile():
	var projectile = projectile_pf.instantiate()
	add_child(projectile)
	var dist = 150
	var speed = 500 # Speed
	var theta = randf_range(0, 2) * PI # Angle
	var x = cos(theta)
	var y = sin(theta)
	var charge = randi_range(0,3)
	projectile.projectile_charge = charge
	match charge:
		projectile.Charge.RED:
			projectile.get_node(projectile.sprite_path).modulate = Color.RED
		projectile.Charge.GREEN:
			projectile.get_node(projectile.sprite_path).modulate = Color.GREEN
		projectile.Charge.BLUE:
			projectile.get_node(projectile.sprite_path).modulate = Color.BLUE
		projectile.Charge.YELLOW:
			projectile.get_node(projectile.sprite_path).modulate = Color.YELLOW
	projectile.set_global_transform(Transform2D(theta, Vector2(x * dist, y * dist) + self.position))
	projectile.apply_central_impulse(Vector2(x * speed, y * speed))

func _on_timer_timeout():
	spawn_projectile()
	#$Timer.wait_time = randf_range(1.5,2.5)


func _on_perimeter_body_exited(body):
	body.perimeter_impact()


func _on_arc_north_body_entered(body):
	if body.hostile == false:
		if body.projectile_charge == Projectile.Charge.RED:
			health  = health - 5
		body.core_impact()
		print(health)


func _on_arc_east_body_entered(body):
	if body.hostile == false:
		if body.projectile_charge == Projectile.Charge.GREEN:
			health  = health - 5
		body.core_impact()
		print(health)


func _on_arc_south_body_entered(body):
	if body.hostile == false:
		if body.projectile_charge == Projectile.Charge.BLUE:
			health  = health - 5
		body.core_impact()
		print(health)


func _on_arc_west_body_entered(body):
	if body.hostile == false:
		if body.projectile_charge == Projectile.Charge.YELLOW:
			health  = health - 5
		body.core_impact()
		print(health)
