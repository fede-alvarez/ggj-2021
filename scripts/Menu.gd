extends Node2D
onready var tween = $Control/TransitionTween
onready var transition_rect = $Control/Transition
onready var audio_tween = $Control/AudioTween
onready var sound_player = $SoundsPlayer

func _ready():
	pass
	
func play_sound(snd):
	var sound = SoundsManager.get_sound(snd)
	if sound:
		sound_player.stream = sound
		sound_player.play()

func _on_IntroButton_pressed():
	play_sound("click")
	transition_rect.visible = true
	tween.interpolate_property(transition_rect, "modulate", Color(1,1,1,0), Color(1,1,1,1), 2.0, Tween.TRANS_QUAD, Tween.EASE_OUT)
	tween.start()
	
	audio_tween.interpolate_property($Audio, "volume_db", 0,-80, 1.8)
	audio_tween.start()
	
	yield(tween, "tween_completed")
	get_tree().change_scene("res://scenes/Game.tscn")

func _on_LinkButton_pressed():
	play_sound("click")
	$Control/CreditosPopup.show()

func _on_CloseButton_pressed():
	play_sound("click")
	$Control/CreditosPopup.hide()
