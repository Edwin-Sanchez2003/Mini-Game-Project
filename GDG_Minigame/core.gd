extends Node2D

func _ready():
	for i in range(0,4):
		print(i)
		spawn_projectile(i)

func _process(delta):
	pass

#q = quadrant, expects 0 <= int <= 3
func spawn_projectile(q):
	#should calculate a position and direction
	var r = $Area2D/CollisionShape2D.shape.radius + 25
	var theta = 90*q + 45
	print(theta)
	var x = r * cos(theta*PI/180)
	var y = r * sin(theta*PI/180)
	var colorRect = ColorRect.new()
	colorRect.size = Vector2(25,25)
	colorRect.position = Vector2(x,y)
	add_child(colorRect)
