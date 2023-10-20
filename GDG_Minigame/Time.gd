extends Label
var time = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	var seconds = int(time) % 60
	var secondsStr = str(seconds)
	var minutes = int(time / 60)
	var minutesStr = str(minutes)
	if seconds < 10: secondsStr = "0" + secondsStr
	if minutes < 10: minutesStr = "0" + minutesStr
	text = "Time: " + minutesStr + ":" + secondsStr
