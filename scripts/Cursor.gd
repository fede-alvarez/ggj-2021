extends Position2D

onready var cursor = $Sprite

var current_state = 0

func change_state(state):
	current_state = state
	cursor.frame = current_state
	
func set_hover():
	change_state(1)
	
func set_press():
	change_state(2)
	$ReleaseTimer.start()

func release():
	change_state(0)

func _on_ReleaseTimer_timeout():
	release()
