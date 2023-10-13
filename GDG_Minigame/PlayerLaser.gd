extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	offset.y = texture.get_height() * .5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
