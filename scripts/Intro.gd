extends Popup

onready var container = $Container
onready var tween = $StoryTween

var current_step = 0

signal intro_over
signal almost_over

func _ready():
	set_translated_texts()
	hide_all()
	show_next_step()
	
func set_translated_texts():
	$Container/Text_1.bbcode_text = TranslationServer.translate("KEY_GAME_INTRO_1")
	$Container/Text_2.bbcode_text = TranslationServer.translate("KEY_GAME_INTRO_2")
	$Container/Text_3.bbcode_text = TranslationServer.translate("KEY_GAME_INTRO_3")
	
func start():
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
	
	if current_step < 3:
		show_next_step()
		if current_step == 2:
			emit_signal("almost_over")
	else:
		hide()
		emit_signal("intro_over")
