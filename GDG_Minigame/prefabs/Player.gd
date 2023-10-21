extends Sprite2D

const PlayerLaser = preload("res://prefabs/PlayerLaser.tscn")
const laserWidth = 200
const depletionRate = 100

var distance = Globals.res.y / 3.0
var PlayerLaserIns
var charge = 100
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = -distance
	scale = Vector2(.2, .2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(time > 0):
		time -= delta * depletionRate
		PlayerLaserIns.set_modulate(Color(1, 1, 1, time / 100.0))
		if(time <= 0):
			time = 0
			PlayerLaserIns.queue_free()
	elif(Input.is_action_just_pressed("interact") && charge > 0):
		PlayerLaserIns = PlayerLaser.instantiate()
		PlayerLaserIns.scale.x = laserWidth * (charge / 100.0) / PlayerLaserIns.texture.get_width()
		PlayerLaserIns.scale.y = distance * 5 / PlayerLaserIns.texture.get_height()
		add_child(PlayerLaserIns)
		time = charge
		charge = 0
