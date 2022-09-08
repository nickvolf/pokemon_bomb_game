extends ProgressBar

onready var timer: Timer = $Timer

func _ready():
	pass # Replace with function body.

func _process(_delta):
	value = timer.time_left
