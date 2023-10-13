extends Node2D

const speed = 2
const shInput = false
var topHemisphere = true

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Globals.res / 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(shInput):
		if(Input.is_action_pressed("left")):
			rotation -= delta * speed
		if(Input.is_action_pressed("right")):
			rotation += delta * speed
	else:
		if(Input.is_action_just_pressed("left") || Input.is_action_just_pressed("right")):
			if($Player.global_position.y > Globals.res.y/2):
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
