extends Sprite2D

@onready var projectile_pf = preload("res://prefabs/projectile.tscn")
@onready var root = get_tree().root.get_node("Root")

var distance = Globals.res.y / 2.5
var charge_inventory: Dictionary = {
	Projectile.Charge.RED: 0, Projectile.Charge.GREEN: 0, 
	Projectile.Charge.BLUE: 0, Projectile.Charge.YELLOW: 0}
var charge = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = -distance
	scale = Vector2(.2, .2)


func _process(_delta):
	if(Input.is_action_just_pressed("up")):
		charge = charge + 1
	if(Input.is_action_just_pressed("down")):
		charge = charge - 1
	if charge > 3:
		charge = 0
	elif charge < 0:
		charge = 3
	match charge:
		Projectile.Charge.RED:
			modulate = Color.RED
		Projectile.Charge.GREEN:
			modulate = Color.GREEN
		Projectile.Charge.BLUE:
			modulate = Color.BLUE
		Projectile.Charge.YELLOW:
			modulate = Color.YELLOW


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if(Input.is_action_just_pressed("interact")):
		if charge_inventory[charge] > 0:
			charge_inventory[charge] -= 1
			var projectile = projectile_pf.instantiate()
			root.add_child(projectile)
			var dist = 32
			var speed = 150 # Speed
			var theta = global_rotation + (0.5 * PI)
			var x = cos(theta)
			var y = sin(theta)
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
			projectile.hostile = false
			projectile.set_global_transform(Transform2D(theta, Vector2(x * dist, y * dist) + self.global_position))
			projectile.apply_central_impulse(Vector2(x * speed, y * speed))


func _on_area_2d_body_entered(body):
	if body.hostile == true:
		charge_inventory[body.projectile_charge] += 1
		body.player_impact()
