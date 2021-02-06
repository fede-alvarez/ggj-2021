extends Popup

onready var container = $Container
onready var tween = $StoryTween

var current_step = 0

signal final_over

func _ready():
	hide_all()
	show_next_step()
	
func start():
	$Container/Text_1.text = TranslationServer.translate("KEY_PC_BAD_FINAL").to_upper()
	$StoryTimer.start()
	
func show_next_step():
	hide_all()
	var step = container.get_child(current_step)
	step.visible = true
	tween.interpolate_property(step, "modulate", Color(1,1,1,0), Color(1,1,1,1), 2.0)
	tween.start()
	
func hide_all():
	for step in container.get_children():
		step.visible = false
		step.modulate = Color(1,1,1,0)

func _on_StoryTimer_timeout():
	var step = container.get_child(current_step)
	tween.interpolate_property(step, "modulate", Color(1,1,1,1), Color(1,1,1,0), 1.0)
	tween.start()
	yield(tween,"tween_completed")
	
	current_step += 1
	
	if current_step < 1:
		show_next_step()
	else:
		hide()
		emit_signal("final_over")
