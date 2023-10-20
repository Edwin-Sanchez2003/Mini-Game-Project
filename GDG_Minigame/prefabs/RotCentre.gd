extends Node2D

@export var speed = 2
@export var input_type : input_e = input_e.simple_clockwise

enum input_e {
	simple_clockwise,
	vertical_hemisphere_flip,
	comhbined_simple_clockwise_and_vertical_hemisphere_flip
}

var topHemisphere = true
var quad_hemisphere: int

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Globals.res / 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(input_type == input_e.simple_clockwise):
		if(Input.is_action_pressed("left")):
			rotation -= delta * speed
		if(Input.is_action_pressed("right")):
			rotation += delta * speed
	
	elif(input_type == input_e.vertical_hemisphere_flip):
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
	
	elif(input_type == input_e.comhbined_simple_clockwise_and_vertical_hemisphere_flip):
		if(Input.is_action_just_pressed("left") || Input.is_action_just_pressed("right")):
			if(fmod(rotation, 2) >= 0 && fmod(rotation, 2) < 0.5):
				quad_hemisphere = 0
			if(fmod(rotation, 2) >= 0.5 && fmod(rotation, 2) < 1):
				quad_hemisphere = 1
			if(fmod(rotation, 2) >= 1 && fmod(rotation, 2) < 1.5):
				quad_hemisphere = 2
			if(fmod(rotation, 2) >= 1.5 && fmod(rotation, 2) < 2):
				quad_hemisphere = 3
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
