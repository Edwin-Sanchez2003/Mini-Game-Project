extends Node2D

const speed = 2
const shInput = true
var topHemisphere = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(shInput):
		if(Input.is_action_pressed("left")):
			rotation -= delta * speed
		if(Input.is_action_pressed("right")):
			rotation += delta * speed
	else:
		if(Input.is_action_just_pressed("left") || Input.is_action_just_pressed("right")):
<<<<<<< Updated upstream:GDG_Minigame/RotCentre.gd
			if(fmod(rotation, 2 * PI) > PI/2.0 && fmod(rotation, 2 * PI) < 3 * PI / 2.0):
=======
			if($Player.global_position.y > 540):
>>>>>>> Stashed changes:GDG_Minigame/prefabs/RotCentre.gd
				topHemisphere = false
			else:
				topHemisphere = true
		
		if(Input.is_action_pressed("left")):
			if(topHemisphere):
				rotation -= delta * speed
			else:
				rotation += delta * speed
		if(Input.is_action_pressed("right")):
			if(topHemisphere):
				rotation += delta * speed
			else:
				rotation -= delta * speed
