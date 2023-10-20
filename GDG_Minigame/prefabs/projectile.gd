extends RigidBody2D

## Base prefab for projectiles
##
## Make a new prefab based off of this with changed sprite and shape or directly change it after
## spawning it with set_shape() and set_sprite()
## To spawn from the core:
## @onready var projectile_pf = preload("res://prefabs/projectile.tscn")
##
## func _physics_process(delta):
## 	var projectile = projectile_pf.instantiate()
## 	add_child(projectile)
## 	var dist = self.radius # Distance from center
## 	var speed = 10 # Speed
## 	var theta = 0.5*PI # Angle
## 	var x = cos(theta)
## 	var y = sin(theta)
## 	projectile.set_global_transform(Transform2D(theta, Vector2(x * dist, y * dist) + self.position))
## 	projectile.apply_central_impulse(Vector2(x * speed, y * speed))
##
## To spawn from the player:
## @onready var projectile_pf = preload("res://prefabs/projectile.tscn")
## @onready var root = get_tree().root.get_node("Root")
##
## func _physics_process(delta):
## 	var bullet = projectile_pf.instantiate()
## 	root.add_child(projectile)
## 	var dist = self.radius # Distance from player
## 	var speed = 10 # Speed
## 	var theta = 0.5*PI # Angle
## 	var x = cos(theta)
## 	var y = sin(theta)
## 	projectile.hostile = false
## 	projectile.set_global_transform(Transform2D(theta, Vector2(x * dist, y * dist) + self.position))
## 	projectile.apply_central_impulse(Vector2(x * speed, y * speed))

@onready var root = get_tree().root.get_node("Root")

@export var collider_path : NodePath
@export var sprite_path : NodePath
@export var timer_path : NodePath

@export var hostile : bool = true
@export var damage : float = 1
@export var projectile_charge : Charge = Charge.RED

enum Charge {
	RED,
	GREEN,
	BLUE,
}


func set_shape(shape : CollisionShape2D) -> void:
	# Set the collider shape of the projectile
	get_node(collider_path).shape = shape


func set_sprite(sprite : Texture2D, x_scale : float, y_scale : float) -> void:
	# Set the sprite of the projectile
	get_node(sprite_path).texture = sprite
	get_node(sprite_path).scale(x_scale, y_scale)


func set_timeout(seconds : float) -> void:
	# Set the time until the bullet deletes itself in seconds
	get_node(timer_path).wait_time = seconds


func perimeter_impact() -> void:
	# Effects
	self.queue_free()
	Globals.perimeterDamage = 1

func player_impact() -> void:
	# Effects
	self.queue_free()

func core_impact() -> void:
	# Effects
	self.queue_free()


func _on_timer_timeout():
	self.queue_free()
