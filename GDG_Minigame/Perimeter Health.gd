extends TextureProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(Globals.perimeterDamage > 0):
		damage(Globals.perimeterDamage)
		Globals.perimeterDamage = 0

func damage(HP):
	value -= HP
	if(HP < 0):
		value = 0
